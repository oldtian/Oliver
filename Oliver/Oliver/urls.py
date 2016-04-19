"""cmdb URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.8/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import include, url
from django.contrib import admin
from cmdb.views import *
from audit.views import *
from ywgl.views import *
from webmoniter.views import *
from statistics.views import *

urlpatterns = [
#    url(r'^admin/', include(admin.site.urls)),
    url(r'^accounts/', include('users.urls')),
    url(r'^$', index, name='index'),
    url(r'^index/(?P<catalog>[^/]+)/$', mychat, name='mychat'),
    url(r'^server_group/(?P<pk>\d+)?', server_group, name='server_group'),
    url(r'^server_group_edit/(?P<pk>\d+)/$', server_group_edit, name='server_group_edit'),
    url(r'^server/(?P<pk>\d+)?', server_info, name='server_info'),
    url(r'^server_detail/(?P<pk>\d+)/(?P<sn>[^/]+)/$', server_detail, name='server_detail'),
    url(r'^server_edit/(?P<pk>\d+)/$', server_edit, name='server_edit'),
    url(r'^web/(?P<pk>\d+)?', web, name='web'),
    url(r'^web_edit/(?P<pk>\d+)/$', web_edit, name='web_edit'),
    url(r'^add/(?P<service>[^/]+)/$', add, name='add'),
    url(r'^delete/(?P<content>[^/]+)/$', delete, name='delete'),
    url(r'^ywgl/$', ywgl, name='ywgl'),
    url(r'^ywgl/displaymem/$', displaymem),
    url(r'^ywgl/displayfunc/$', displayfunc),
    url(r'^ywgl/addmodule/$', addmodule, name='addmodule'),
    url(r'^ywgl/handlemodule/$', handlemodule, name='handlemodule'),
    url(r'^audit/$', audit, name='audit'),
    url(r'^audit/audit_pull/$', audit_pull, name='audit_pull'),
    url(r'^audit/audit_run/$', audit_run, name='audit_run'),
    url(r'^audit/audit_host/$', audit_host, name='audit_host'),
    url(r'^audit/audit_sjquery/$', audit_sjquery, name='audit_sjquery'),
    url(r'^query/$', query, name='query'),
    url(r'^query2/$', query2, name='query2'),
]
