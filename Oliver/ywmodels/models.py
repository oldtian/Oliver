#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Create your models here.
from __future__ import unicode_literals
from django.db import models
import datetime
from django.core.urlresolvers import reverse
from django.db.models.fields import BLANK_CHOICE_DASH
from django.template.defaultfilters import default

#IP地址
class Ipaddr(models.Model):
    ip_type = models.CharField('类型', max_length=50)
    address = models.GenericIPAddressField('IP地址', blank=True, null=True)
    server_info = models.ForeignKey('Server', verbose_name='所属服务器')
    
    def __unicode__(self):
        return '%s, %s'%(self.ip_type, self.address)
    
    class Meta:
        verbose_name = 'IP地址'
        verbose_name_plural = 'IP地址'
        
class Hostgroup(models.Model):
    name = models.CharField('主机组', max_length=50)
    member = models.CharField('组成员', max_length=1000, blank=True, null=True)
    memo = models.TextField('备注', blank=True, default='')
    
    def __unicode__(self):
        return self.name
    
    class Meta:
        verbose_name = '主机组'
        verbose_name_plural = '主机组'
    
    def get_absolute_url(self):
        return reverse('server_group_edit', args=(self.id,))

#服务器
class Server(models.Model):
    hostname = models.CharField('主机名', max_length=128, blank=True)
    hostgroup = models.ForeignKey('Hostgroup', verbose_name='主机组', blank=True, null=True)
    sn = models.CharField('序列号', max_length=64, blank=True)
    service_time = models.DateField('维保截止时间', blank=True, null=True)
    device_type = models.CharField('设备类型', max_length=50, blank=True)
    cabinet_num = models.CharField('机柜编号', max_length=50, blank=True)
    manufactory = models.CharField('制造商', max_length=128, blank=True)
    model = models.CharField('型号', max_length=128, blank=True)

    os_platform = models.CharField('操作系统', max_length=64, blank=True)
    
    cpu_count = models.IntegerField('总CPU核数', blank=True, null=True)
    cpu_physical_count = models.IntegerField('物理CPU数',blank=True, null=True)
    cpu_model = models.CharField('CPU型号', max_length=128, blank=True)
    mem_capacity = models.IntegerField('内存容量', blank=True, null=True)
    idc = models.ForeignKey('IDC', verbose_name='机房', blank=True, null=True)
    business = models.ForeignKey('BusinessUnit', verbose_name='归属平台', blank=True, null=True)
    leader = models.ForeignKey('Leader', verbose_name='项目负责人', blank=True, null=True)
    status = models.CharField('在线状态', max_length=30)
    band = models.CharField('带宽', max_length=100, blank=True)
    tag = models.CharField('标记', max_length=100, blank=True)
    
    create_at = models.DateTimeField(blank=True, auto_now_add=True)
    update_at = models.DateTimeField(blank=True, auto_now=True)

    class Meta:
        verbose_name = '服务器'
        verbose_name_plural = "服务器"

    def __unicode__(self):
        return '%s,%s,%s,%s,%s,%s' %(self.hostname, self.sn, self.model, self.os_platform, self.idc, self.business)

    def get_absolute_url(self):
        return reverse('server_detail', args=(self.id, self.hostname))
    
    def get_absolute_url2(self):
        return reverse('server_edit', args=(self.id,))


class Disk(models.Model):
    pd_type = models.CharField('磁盘类型', max_length=64, blank=True, null=True)
    capacity = models.IntegerField('磁盘容量GB', blank=True, null=True)
    count = models.IntegerField('磁盘数量', blank=True, null=True)
    raid = models.IntegerField('RAID', blank=True, null=True)
    dgroup = models.IntegerField('磁盘组', blank=True, null=True)

    memo = models.TextField(u'备注', blank=True, null=True)
    create_at = models.DateTimeField(blank=True, auto_now_add=True)
    update_at = models.DateTimeField(blank=True, auto_now=True)

    server_info = models.ForeignKey('server', verbose_name='所属服务器', blank=True, null=True)

    def __unicode__(self):
        return '%s,%s,%s,%s' % (self.count, self.capacity, self.pd_type, self.raid)

    class Meta:
        verbose_name_plural = "硬盘"

class IDC(models.Model):
    region = models.CharField('区域中文',max_length=64, blank=True)
    name = models.CharField('中文显示名',max_length=32, blank=True)
    floor = models.IntegerField('楼层', blank=True, null=True)

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = '机房'
        verbose_name_plural = "机房"


class BusinessUnit(models.Model):
    name = models.CharField('业务平台', max_length=64, blank=True)
    memo = models.CharField('备注', max_length=64, blank=True)

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = '业务平台'
        verbose_name_plural = "业务平台"

class Leader(models.Model):
    name = models.CharField('项目负责人', max_length=20, blank=True)
    position = models.CharField('职位', max_length=50, blank=True)
    memo = models.CharField('备注', max_length=64, blank=True)
    
    def __unicode__(self):
        return self.name
    
    class Meta:
        verbose_name = '项目负责人'
        verbose_name_plural = "项目负责人"
        
class APP(models.Model):
    name = models.CharField('应用名', max_length=100)
    slug = models.CharField('域名', max_length=100, blank=True)
    server_info = models.ForeignKey('Server', verbose_name='归属服务器')
    
    def __unicode__(self):
        return '%s,%s'%(self.name, self.slug)
    
    class Meta:
        verbose_name = '项目应用'
        verbose_name_plural = '项目应用'


class HandleLog(models.Model):
    content = models.TextField(null=True, blank=True)
    creator = models.ForeignKey('users.User',blank=True)
    create_at = models.DateTimeField(auto_now_add=True)

    def __unicode__(self):
        return self.content

    class Meta:
        verbose_name = "操作日志"
        verbose_name_plural = "操作日志"
    
class Websniff(models.Model):
    name = models.CharField('网站名称', max_length=100)
    slug = models.CharField('网址', max_length=100)
    code = models.CharField('状态码', max_length=20, blank=True, default='')
    status = models.CharField('状态', max_length=256, blank=True)
    
    def __unicode__(self):
        return '%s, %s'%(self.name, self.slug)
    
    class Meta:
        verbose_name = '网站嗅探'
        verbose_name_plural = '网站嗅探'
        ordering = ['name', 'slug']
        
    def get_absolute_url(self):
        return reverse('web_edit', args=(self.id,))

#用于添加扩展模块    
class ModuleList(models.Model):
    id = models.IntegerField(primary_key=True, db_column='ID') # Field name made lowercase.
    module_name = models.CharField('模块名', max_length=60)
    module_caption = models.CharField('模块功能描述', max_length=765)
    module_extend = models.CharField('模块前端扩展', max_length=6000)
    
    def __unicode__(self):
        return '%s_%s'%(self.id, self.module_name)
    
    class Meta:
        verbose_name = '模块列表'
        verbose_name_plural = '模块列表'
        ordering = ['id', 'module_name']
        
#用于存由agent传过来的日志
class ServerHistory(models.Model):
    history_id = models.IntegerField()
    history_ip = models.CharField(max_length=45)
    history_user = models.CharField(max_length=45)
    history_datetime = models.DateTimeField()
    db_datetime = models.DateTimeField(auto_now_add=True)
    history_command = models.CharField(max_length=765)
    class Meta:
        verbose_name = '审计日志'
        verbose_name_plural = '审计日志'
        ordering = ['id']

