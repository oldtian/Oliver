from django.contrib import admin
from ywmodels.models import *
from _csv import list_dialects

# Register your models here.

class WebsniffAdmin(admin.ModelAdmin):
    list_display = ('name', 'slug', 'code', 'status')

class IpaddrAdmin(admin.ModelAdmin):
    list_display = ('ip_type', 'address', 'server_info')
    
class ServerAdmin(admin.ModelAdmin):
    list_display = ('hostname', 'hostgroup', 'sn', 'cabinet_num', 'manufactory', 'model', 'idc', 'business', 'status', 'tag')
    
class DiskAdmin(admin.ModelAdmin):
    list_display = ('pd_type', 'capacity', 'count', 'raid', 'server_info', 'dgroup')
    
class IDCAdmin(admin.ModelAdmin):
    list_display = ('region', 'name', 'floor')
    
class BusinessUnitAdmin(admin.ModelAdmin):
    list_display = ('name',)
    
class APPAdmin(admin.ModelAdmin):
    list_display = ('name', 'slug', 'server_info')
    
class HandleLogAdmin(admin.ModelAdmin):
    list_display = ('content', 'creator', 'create_at')
    
class HostgroupAdmin(admin.ModelAdmin):
    list_display = ('name', 'member')
    
class ModuleListAdmin(admin.ModelAdmin):
    list_display = ('id', 'module_name')
    
class ServerHistoryAdmin(admin.ModelAdmin):
    list_display = ('id', 'history_id', 'history_ip', 'history_user', 'history_datetime', 'db_datetime', 'history_command')

class LeaderAdmin(admin.ModelAdmin):
    list_display = ('name', 'position')
   
admin.site.register(Websniff, WebsniffAdmin)
admin.site.register(Ipaddr, IpaddrAdmin)
admin.site.register(Server, ServerAdmin)
admin.site.register(Disk, DiskAdmin)
admin.site.register(IDC, IDCAdmin)
admin.site.register(BusinessUnit, BusinessUnitAdmin)
admin.site.register(APP, APPAdmin)
admin.site.register(HandleLog, HandleLogAdmin)
admin.site.register(Hostgroup, HostgroupAdmin)
admin.site.register(ModuleList, ModuleListAdmin)
admin.site.register(ServerHistory, ServerHistoryAdmin)
admin.site.register(Leader, LeaderAdmin)


