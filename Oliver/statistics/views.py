#coding:utf-8
from __future__ import unicode_literals
from django.shortcuts import render
from ywmodels.models import *
from django.db.models import Q

# Create your views here.
def query(request):
    ret = {'servers': "", 'condition': "", 'msg': ""}
    serlist = []
    if request.POST:
        pingtai = request.POST.get('pingtai', None)
        ywip = request.POST.get('ywip', None)
        biaoji = request.POST.get('biaoji', None)
        linestat = request.POST.get('linestat', None)
        weibao = request.POST.get('weibao', None)
        if pingtai:
            pingtais = BusinessUnit.objects.get(name=pingtai)
            servers = Server.objects.filter(business=pingtais)
            if pingtais and servers:
                ret['servers'] = servers
                ret['condition'] = 'business'
            else:
                ret['msg'] = "查询的数据不存在, 请与系统管理员联系"
        if linestat:
            if linestat == "正在使用":
                servers = Server.objects.filter(status="online")
            if linestat == "正在闲置":
                servers = Server.objects.filter(status="offline")
            if servers:
                ret['servers'] = servers
                ret['condition'] = 'on_off_line'
            else:
                ret['msg'] = "查询的数据不存在, 请与系统管理员联系" 
        if weibao:
            now = datetime.datetime.now()
            if weibao == "维保期内":
                servers = Server.objects.filter(~Q(sn="")).filter(service_time__gt=now)
            if weibao == "维保过期":
                servers = Server.objects.filter(~Q(sn="")).filter(service_time__lt=now)
            if servers:
                ret['servers'] = servers
                ret['condition'] = 'service_time'
            else:
                ret['msg'] = "查询的数据不存在, 请与系统管理员联系" 
        if ywip:
            ywipobj = Ipaddr.objects.filter(address__icontains=ywip)
            for obj in ywipobj:
                serlist.append(obj.server_info)
            if ywipobj:
                ret['servers'] = serlist
                ret['condition'] = 'ip'
            else:
                ret['msg'] = "查询的数据不存在, 请与系统管理员联系" 
        if biaoji:
            servers = Server.objects.filter(tag__icontains=biaoji)
            if servers:
                ret['servers'] = servers
                ret['condition'] = 'tag'
            else:
                ret['msg'] = "查询的数据不存在, 请与系统管理员联系" 
    return render(request, 'ywweb/query.html', ret)

def query2(request):
    ret = {'servers': "", 'condition': "", 'msg': ""}
    if request.POST:
        pingtai2 = request.POST.get('pingtai2', None)
        devtype = request.POST.get('devtype', None)
        if pingtai2 and devtype:
            p = BusinessUnit.objects.get(name=pingtai2)
            servers = Server.objects.filter(business=p).filter(device_type=devtype)
            if p and servers:
                ret['servers'] = servers
                ret['condition'] = 'complex'
            else:
                ret['msg'] = "查询的数据不存在, 请与系统管理员联系" 
    return render(request, 'ywweb/query.html', ret)
