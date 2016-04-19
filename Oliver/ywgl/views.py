from __future__ import unicode_literals
from django.shortcuts import render
from ywmodels.models import *
import rpyc, json
from django.conf import settings
from webapi.libraries import *
from django.utils.log import logging
from django.http.response import HttpResponse
from django.contrib.auth.decorators import login_required

# Create your views here.
@login_required
def ywgl(request):
    OPresult=""
    hostgroup = Hostgroup.objects.all()
    modulelist = ModuleList.objects.all()
    if request.POST:
        put_string=""        
        memberlist = request.POST.getlist("memberlist","")
        hosts = ','.join(memberlist)
        mod_id = request.POST.get("modulelist")[1:5]
        sys_param_1 =request.POST.get("sys_param_1","")
        sys_param_2 =request.POST.get("sys_param_2","")
        put_string = mod_id+"@@"+hosts+"@@"+sys_param_1+"@@"+sys_param_2+"@@"
        try:
            conn=rpyc.connect('192.168.2.131',11511)
            conn.root.login('OMuser','KJS23o4ij09gHF734iuhsdfhkGYSihoiwhj38u4h')
        except Exception,e:
            logging.error('connect rpyc server error:'+str(e))
            return HttpResponse('connect rpyc server error:'+str(e))
    
        put_string=tencode(put_string, settings.SECRET_KEY)
        OPresult=tdecode(conn.root.Runcommands(put_string), settings.SECRET_KEY)
    return render(request, 'ywweb/ywgl.html', {'hostgroup': hostgroup, 'modulelist': modulelist, 'OPresult': OPresult})

@login_required
def displaymem(request):
    gplist = []
    memberlist = []
    memberstr = ""
    html = ""
    gplist = request.GET.get('gpstr').strip('@@').split('@@')
    hostgroup = Hostgroup.objects.all().filter(name__in=gplist)
    for group in hostgroup:
        memberstr += group.member + ','
    memberlist = memberstr.split(',')
    while '' in memberlist:
        memberlist.remove('')
    for mem in memberlist:
        html += '<option>' + mem + '</option>'
    return HttpResponse(html)

@login_required
def displayfunc(request):
    funcid = request.GET.get('func')[1:5]
    module = ModuleList.objects.get(id=funcid)
    module_dict = {'desc': module.module_caption, 'extend': module.module_extend}
    module_json = json.dumps(module_dict)
    return HttpResponse(module_json)

@login_required
def addmodule(request):
    return render(request, 'ywweb/addmodule.html')

@login_required
def handlemodule(request):
    OPresult=""
    hostgroup = Hostgroup.objects.all()
    modulelist = ModuleList.objects.all()
    if request.POST:
        mod_name = request.POST.get("mod_name", None)
        mod_desc = request.POST.get("mod_desc", None)
        mod_extend = request.POST.get("mod_extend", None)
        ModuleList.objects.get_or_create(module_name=mod_name, module_caption=mod_desc, module_extend=mod_extend)
    return render(request, 'ywweb/ywgl.html', {'hostgroup': hostgroup, 'modulelist': modulelist, 'OPresult': OPresult})

