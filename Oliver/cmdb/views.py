#coding:utf-8
from __future__ import unicode_literals
from django.shortcuts import render, redirect
from ywmodels.models import *
from django.http.response import HttpResponse
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from webapi.insertdata import insertdata
import json, datetime, math
from django.db.models import Q
from django.contrib.auth.decorators import login_required

# Create your views here.


def index(request):
    return render(request, 'index.html')

def mychat(request, catalog):
    if catalog == "server_cata":
        ret = {"physerver": 0, "vmserver": 0, "esxiserver": 0, "networkdevice": 0,}
        ret["physerver"] =  Server.objects.filter(device_type="物理服务器").count()
        ret["vmserver"] = Server.objects.filter(device_type="虚拟服务器").count()
        ret["esxiserver"] = Server.objects.filter(device_type="ESXi服务器").count()
	ret["networkdevice"] = Server.objects.filter(device_type="网络设备").count()
        serCata = json.dumps(ret)
        return HttpResponse(serCata)
    if catalog == "platpt":
        ret = {"yhypt": 0, "ydrpt": 0, "xppt": 0, "drpt": 0, "glpt": 0, "yxpt": 0, "other": 0}
        ptlist = ['医患药平台', '药店人平台', '西普平台', 'DR数据平台', '管理平台', '营销平台', '其它']
        res = []
        for pt in ptlist:
            ptobj = BusinessUnit.objects.get(name=pt)
            num = ptobj.server_set.all().count()
            res.append(num)
        ret["yhypt"] = res[0]
        ret["ydrpt"] = res[1]
        ret["xppt"] = res[2]
        ret["drpt"] = res[3]
        ret["glpt"] = res[4]
        ret["yxpt"] = res[5]
        ret["other"] = res[6]
        platjs = json.dumps(ret)
        return HttpResponse(platjs)
    if catalog == "usestatus":
        ret = {"online": 0, "offline": 0}
        ret["online"] = Server.objects.filter(status="online").count()
        ret["offline"] = Server.objects.filter(status="offline").count()
        usestatus = json.dumps(ret)
        return HttpResponse(usestatus)
    if catalog == "maintenance":
        ret = {"inner": 0, "outer": 0}
        now = datetime.datetime.now()
        ret["inner"] = Server.objects.filter(~Q(sn="")).filter(service_time__gt=now).count()
        ret["outer"] = Server.objects.filter(~Q(sn="")).filter(service_time__lt=now).count()
        maintenance = json.dumps(ret)
        return HttpResponse(maintenance)

@login_required
def server_info(request, pk):
    if request.method == "GET":
        server_objs = Server.objects.all().order_by('id')
    if request.method == "POST":
        server_list = []
        try:
            insertdata(request, pk)   #如果是POST请求,先插入数据
        except Exception,e:
            return HttpResponse("插入数据失败，请与管理员联系"+str(e))
        server_objs = Server.objects.all().order_by('id')
        server_list = list(server_objs)
        paginator = Paginator(server_objs, 8)
        #如果pk存在则是修改,pk不存在则是添加server
        if pk:
            pkobj = Server.objects.get(id=pk)
            server_pos = server_list.index(pkobj)
            page = (server_pos+1) / 8.0
            page = int(math.ceil(page))
            servers = paginator.page(page)
        else:
            page = server_objs.count() / 8.0
            page = int(math.ceil(page))
            servers = paginator.page(page)
        return render(request, 'ywweb/server_info.html', {'servers': servers})
    paginator = Paginator(server_objs, 8)
    try:
        page = request.GET.get('page')
        servers = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        servers = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        servers = paginator.page(paginator.num_pages)
    
    return render(request, 'ywweb/server_info.html', {'servers': servers})

@login_required
def server_detail(request, pk, sn):
    serobj = Server.objects.get(id=pk)
    return render(request, 'ywweb/server_detail.html', {'serobj': serobj})
    

#对监控站点,主机与主机组执行添加操作返回的页面   
@login_required           
def add(request, service):
    if service == "web":
        return render(request, 'ywweb/addweb.html')
    elif service == "host":
        return render(request, 'ywweb/addserver.html')
    elif service == "hostgroup":
        groups = Hostgroup.objects.all()
        servers = Server.objects.all().exclude(hostgroup__in=groups)  #排除存在于主机组当中的所有主机                   
        return render(request, 'ywweb/addhostgroup.html', {'servers': servers})
    else:
        return redirect('/server/')

#对主机或监控站点执行删除操作    
@login_required
def delete(request, content):   
    pkstr = request.GET.get('pk', None)
    if pkstr:
        pklist = pkstr.strip(',').split(',')
        if content == 'host':
            for pk in pklist:
                server = Server.objects.get(id=pk)
                #先删除hostgroup中的管理IP
		if server.hostgroup:
                	mip = server.ipaddr_set.all().get(ip_type='管理IP')
                	mlist = server.hostgroup.member.split(',')
                	mlist.remove(mip.address)
                	server.hostgroup.member = ','.join(mlist)
                	server.hostgroup.save()
                server.delete()
        if content == "web":
            for pk in pklist:
                site = Websniff.objects.get(id=pk)
                site.delete()
        return HttpResponse("ok")
    else:
        return HttpResponse("请确认已选择项目")

@login_required
def server_edit(request, pk):
    server = Server.objects.get(id=pk)
    curdate = datetime.date.strftime(server.service_time, format='%Y-%m-%d')
    return render(request, 'ywweb/editserver.html', {'server': server, 'curdate': curdate})

@login_required
def server_group_edit(request, pk):
    hostgroup = Hostgroup.objects.get(id=pk)
    groups = Hostgroup.objects.all()
    servers = Server.objects.all().exclude(hostgroup__in=groups)  #排除存在于主机组当中的所有主机   
    return render(request, 'ywweb/edithostgroup.html', {'hostgroup': hostgroup, 'servers': servers})

#减少时如何处理    
@login_required
def server_group(request, pk):
    if request.method == "POST":
        iplist = []
        groupname = request.POST.get('groupname', None)
        groupmember_2 = request.POST.getlist('groupmember_2')
        
        if pk:
            group = Hostgroup.objects.get(id=pk)
            group.name = groupname
            if group.member:
                iplist = group.member.split(',')
                if len(groupmember_2) < len(iplist): 
                    crossiplist = list(set(iplist) - set(groupmember_2))  #获得哪些主机需要删除组对象                
                    for mangip in crossiplist:
                        ipobjs = Ipaddr.objects.get(ip_type='管理IP', address=mangip)
                        server = ipobjs.server_info
                        server.hostgroup = None
                        server.save()
        else:               
            group = Hostgroup.objects.get_or_create(name=groupname)[0]  #创建一个新的主机组
        memstr = ','.join(groupmember_2)
        group.member = memstr
        group.save()
        if groupmember_2:
            for mangip in groupmember_2:
                ipobj = Ipaddr.objects.get(ip_type='管理IP', address=mangip)  #先创建管理IP的ip对象
                server = ipobj.server_info
                server.hostgroup = group
                server.save()                  
    hostgroup = Hostgroup.objects.all()
    return render(request, 'ywweb/hostgroup.html', {'hostgroup': hostgroup})
    


    

        



        
        
    
