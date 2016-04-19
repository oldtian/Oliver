#!/usr/bin/python
#coding=utf-8
'''
Created on 2016年3月15日
 
@author: Administrator
'''
from __future__ import unicode_literals
from ywmodels.models import *

def insertdata(request, pk):
    #创建IDC
    idc_name = request.POST.get('idc', None)
    idc = IDC.objects.get_or_create(name=idc_name)[0]
    
    #创建业务线(可以留空)
    b_name = request.POST.get('business', None)
    businessunit = BusinessUnit.objects.get_or_create(name=b_name)[0]
    
    #创建业务负责人
    leader = request.POST.get('leader', None)
    le = Leader.objects.get_or_create(name=leader)[0]
     
    #创建服务器
    if not pk:
        server=Server()
    else:
        server=Server.objects.get(id=pk)  #pk存在则是修改
    server.hostname = request.POST.get('hostname', None)
    server.sn = request.POST.get('sn', None)
    server.device_type = request.POST.get('device_type', None)
    service_time = request.POST.get('service_time', None)
    if not service_time:
        server.service_time = "2010-01-01"
    else:
        server.service_time = service_time
    server.cabinet_num = request.POST.get('cabinet_num', None)
    server.manufactory = request.POST.get('manufactory', None)
    server.model = request.POST.get('model', None)
    server.os_platform = request.POST.get('os', None)
    server.cpu_count = request.POST.get('cpu_totals', None)
    server.cpu_physical_count = request.POST.get('phycpus', None)
    server.cpu_model = request.POST.get('cpumodel', None)
    server.mem_capacity = request.POST.get('mem_capcity', None)
    server.idc = idc
    server.leader = le
    server.business = businessunit
    server.status = request.POST.get('status', None)
    server.band = request.POST.get('bands', None)
    server.tag = request.POST.get('tag', None)
    server.save()
    
    #添加IP地址(需要指定所属服务器)
    telip = request.POST.get('telip', None)
    if telip:
        #ip = Ipaddr(ip_type='电信IP', address=telip)
        ip = Ipaddr.objects.get_or_create(ip_type='电信IP', server_info=server)[0]
        ip.address=telip
        ip.save()
        
    uniip = request.POST.get('uniip', None)
    if uniip:
        #ip = Ipaddr(ip_type='联通IP', address=uniip)
        ip = Ipaddr.objects.get_or_create(ip_type='联通IP', server_info=server)[0]
        ip.address=uniip
        ip.save()
        
    bgpip = request.POST.get('bgpip', None)
    if bgpip:
        #ip = Ipaddr(ip_type='BGP_IP', address=bgpip)
        ip = Ipaddr.objects.get_or_create(ip_type='BGP_IP', server_info=server)[0]
        ip.address=bgpip
        ip.save()
        
    mangip = request.POST.get('mangip', None)
    if mangip:
        #如果修改则管理IP是存在的
        ip = Ipaddr.objects.get_or_create(ip_type='管理IP', server_info=server)[0]
        #ip = Ipaddr(ip_type='管理IP', address=mangip)               
        if pk:  
            if server.hostgroup:
                iplist = []          
                iplist = server.hostgroup.member.split(',')
                iplist.remove(ip.address)                     
                #同时修改主机组中的成员
                iplist.append(mangip)
                server.hostgroup.member = ','.join(iplist)
                server.hostgroup.save()
        ip.address=mangip
        ip.save()
   
    #固定2个磁盘组
    dg1_disktype = request.POST.get('dg1_disktype', None)
    dg1_disk_capcity = request.POST.get('dg1_disk_capcity', None)
    dg1_disk_counts = request.POST.get('dg1_disk_counts', None)
    dg1_raid = request.POST.get('dg1_raid', None)
    if dg1_disktype and dg1_disk_capcity and dg1_disk_counts and dg1_raid:
        disk1 = Disk.objects.get_or_create(server_info=server, dgroup=1)[0] 
        disk1.pd_type = dg1_disktype
        disk1.capacity = dg1_disk_capcity
        disk1.count = dg1_disk_counts
        disk1.raid = dg1_raid
        disk1.save()

    dg2_disktype = request.POST.get('dg2_disktype', None)
    dg2_disk_capcity = request.POST.get('dg2_disk_capcity', None)
    dg2_disk_counts = request.POST.get('dg2_disk_counts', None)
    dg2_raid = request.POST.get('dg2_raid', None)
    if dg2_disktype and dg2_disk_capcity and dg2_disk_counts and dg2_raid:
        disk2 = Disk.objects.get_or_create(server_info=server, dgroup=2)[0] 
        disk2.pd_type = dg2_disktype
        disk2.capacity = dg2_disk_capcity
        disk2.count = dg2_disk_counts
        disk2.raid = dg2_raid
        disk2.save() 
   
    #添加项目应用
    beforapp = request.POST.get('app', None)
    if beforapp:
        applist = beforapp.replace('，', ',').split(',')
        for afterapp in applist:
            APP.objects.get_or_create(name=afterapp, server_info=server)
            