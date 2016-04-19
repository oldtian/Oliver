#coding:utf-8
from django.shortcuts import render
from django.http.response import HttpResponse
from ywmodels.models import ServerHistory, Hostgroup
import datetime
from django.contrib.auth.decorators import login_required

# Create your views here.
@login_required
def audit(request):
    hostgroup = Hostgroup.objects.all()
    return render(request, 'ywweb/audit.html', {'hostgroup': hostgroup})

@login_required
def audit_host(request):
    grouplist = []
    memstr = ""
    if request.GET:
        grouplist = request.GET.get('gpnames').strip('@@').split('@@')
        for group in grouplist:
            groupobj = Hostgroup.objects.get(name=group)
            for mem in groupobj.member.split(','):
                memstr += '<option>'+mem+'</option>'
        return HttpResponse(memstr)

@login_required
def audit_run(request):

    LastID = request.GET.get('LastID', '')
    Hosts = request.GET.get('Hosts', '')
    ServerHistory_string=""
    host_array=Hosts.strip("@@").split("@@")
    if LastID=="0":
        if Hosts=="":
            ServerHistoryObj = ServerHistory.objects.order_by('-id')[:5]
        else:
            ServerHistoryObj = ServerHistory.objects \
            .filter(history_ip__in=host_array).order_by('-id')[:5]
    else:
        if Hosts=="":
            ServerHistoryObj = ServerHistory.objects.filter(id__gt=LastID).order_by('-id')
#             print ServerHistoryObj
        else:
            ServerHistoryObj = ServerHistory.objects \
            .filter(id__gt=LastID,history_ip__in=host_array).order_by('-id')

    if ServerHistoryObj:
        lastid=""
        i=0
        for e in ServerHistoryObj:
            if i==0:
                lastid=e.id
            ServerHistory_string+="<font color=#cccccc size=4px;>"+e.history_ip+"&nbsp;&nbsp;\t"+\
            e.history_user+"&nbsp;&nbsp;\t"+str(e.db_datetime)+"&nbsp;&nbsp;\t"+e.history_command+"</font>*"+"</br>"
            i+=1
    else:
       lastid=LastID 
    ServerHistory_string+="@@"+str(lastid)
    return HttpResponse(ServerHistory_string)  

"""
=事件任务pull方法
"""

def audit_pull(request):
    if request.method == 'GET':
        if not request.GET.get('history_id', ''):
            return HttpResponse("history_id null")

        if not request.GET.get('history_ip', ''):
            return HttpResponse("history_ip null")
        
        if not request.GET.get('history_user', ''):
            return HttpResponse("history_user null")

        if not request.GET.get('history_datetime', ''):
            return HttpResponse("history_datetime null")
            
        if not request.GET.get('history_command', ''):
            return HttpResponse("history_command null")
            
        history_id=request.GET['history_id']
        history_ip=request.GET['history_ip']
        history_user=request.GET['history_user']
        history_datetime=request.GET['history_datetime']
        history_command=request.GET['history_command']
        
        historyobj = ServerHistory(history_id=history_id, \
            history_ip=history_ip, \
            history_user=history_user, \
            history_datetime=history_datetime, \
            history_command=history_command)
        try:
            historyobj.save()
        except Exception,e:
            return HttpResponse("入库失败，请与管理员联系！"+str(e))
        
        Response_result="OK"
        return HttpResponse(Response_result)
        
    else:
        return HttpResponse("非法提交！")

@login_required
def audit_sjquery(request):
    ServerHistory_string = ""
    sjdate = request.GET['sjdate'].replace('T',' ')
    curDate = datetime.datetime.strptime(sjdate, "%Y-%m-%d %H:%M")
    histobjs = ServerHistory.objects.filter(db_datetime__gt=curDate)
    for e in histobjs:
        ServerHistory_string+="<font color=#cccccc size=4px;>"+e.history_ip+"&nbsp;&nbsp;\t"+\
        e.history_user+"&nbsp;&nbsp;\t"+str(e.db_datetime)+"&nbsp;&nbsp;\t"+e.history_command+"</font>*"+"</br>"
    return HttpResponse(ServerHistory_string)
