# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='APP',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=100, verbose_name='\u5e94\u7528\u540d')),
                ('slug', models.CharField(max_length=100, verbose_name='\u57df\u540d', blank=True)),
            ],
            options={
                'verbose_name': '\u9879\u76ee\u5e94\u7528',
                'verbose_name_plural': '\u9879\u76ee\u5e94\u7528',
            },
        ),
        migrations.CreateModel(
            name='BusinessUnit',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=64, verbose_name='\u4e1a\u52a1\u5e73\u53f0', blank=True)),
                ('memo', models.CharField(max_length=64, verbose_name='\u5907\u6ce8', blank=True)),
            ],
            options={
                'verbose_name': '\u4e1a\u52a1\u5e73\u53f0',
                'verbose_name_plural': '\u4e1a\u52a1\u5e73\u53f0',
            },
        ),
        migrations.CreateModel(
            name='Disk',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('pd_type', models.CharField(max_length=64, null=True, verbose_name='\u78c1\u76d8\u7c7b\u578b', blank=True)),
                ('capacity', models.IntegerField(null=True, verbose_name='\u78c1\u76d8\u5bb9\u91cfGB', blank=True)),
                ('count', models.IntegerField(null=True, verbose_name='\u78c1\u76d8\u6570\u91cf', blank=True)),
                ('raid', models.IntegerField(null=True, verbose_name='RAID', blank=True)),
                ('dgroup', models.IntegerField(null=True, verbose_name='\u78c1\u76d8\u7ec4', blank=True)),
                ('memo', models.TextField(null=True, verbose_name='\u5907\u6ce8', blank=True)),
                ('create_at', models.DateTimeField(auto_now_add=True)),
                ('update_at', models.DateTimeField(auto_now=True)),
            ],
            options={
                'verbose_name_plural': '\u786c\u76d8',
            },
        ),
        migrations.CreateModel(
            name='HandleLog',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('content', models.TextField(null=True, blank=True)),
                ('create_at', models.DateTimeField(auto_now_add=True)),
                ('creator', models.ForeignKey(to=settings.AUTH_USER_MODEL, blank=True)),
            ],
            options={
                'verbose_name': '\u64cd\u4f5c\u65e5\u5fd7',
                'verbose_name_plural': '\u64cd\u4f5c\u65e5\u5fd7',
            },
        ),
        migrations.CreateModel(
            name='Hostgroup',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=50, verbose_name='\u4e3b\u673a\u7ec4')),
                ('member', models.CharField(max_length=1000, null=True, verbose_name='\u7ec4\u6210\u5458', blank=True)),
                ('memo', models.TextField(default='', verbose_name='\u5907\u6ce8', blank=True)),
            ],
            options={
                'verbose_name': '\u4e3b\u673a\u7ec4',
                'verbose_name_plural': '\u4e3b\u673a\u7ec4',
            },
        ),
        migrations.CreateModel(
            name='IDC',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('region', models.CharField(max_length=64, verbose_name='\u533a\u57df\u4e2d\u6587', blank=True)),
                ('name', models.CharField(max_length=32, verbose_name='\u4e2d\u6587\u663e\u793a\u540d', blank=True)),
                ('floor', models.IntegerField(null=True, verbose_name='\u697c\u5c42', blank=True)),
            ],
            options={
                'verbose_name': '\u673a\u623f',
                'verbose_name_plural': '\u673a\u623f',
            },
        ),
        migrations.CreateModel(
            name='Ipaddr',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('ip_type', models.CharField(max_length=50, verbose_name='\u7c7b\u578b')),
                ('address', models.GenericIPAddressField(null=True, verbose_name='IP\u5730\u5740', blank=True)),
            ],
            options={
                'verbose_name': 'IP\u5730\u5740',
                'verbose_name_plural': 'IP\u5730\u5740',
            },
        ),
        migrations.CreateModel(
            name='Leader',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=20, verbose_name='\u9879\u76ee\u8d1f\u8d23\u4eba', blank=True)),
                ('position', models.CharField(max_length=50, verbose_name='\u804c\u4f4d', blank=True)),
                ('memo', models.CharField(max_length=64, verbose_name='\u5907\u6ce8', blank=True)),
            ],
            options={
                'verbose_name': '\u9879\u76ee\u8d1f\u8d23\u4eba',
                'verbose_name_plural': '\u9879\u76ee\u8d1f\u8d23\u4eba',
            },
        ),
        migrations.CreateModel(
            name='ModuleList',
            fields=[
                ('id', models.IntegerField(serialize=False, primary_key=True, db_column='ID')),
                ('module_name', models.CharField(max_length=60, verbose_name='\u6a21\u5757\u540d')),
                ('module_caption', models.CharField(max_length=765, verbose_name='\u6a21\u5757\u529f\u80fd\u63cf\u8ff0')),
                ('module_extend', models.CharField(max_length=6000, verbose_name='\u6a21\u5757\u524d\u7aef\u6269\u5c55')),
            ],
            options={
                'ordering': ['id', 'module_name'],
                'verbose_name': '\u6a21\u5757\u5217\u8868',
                'verbose_name_plural': '\u6a21\u5757\u5217\u8868',
            },
        ),
        migrations.CreateModel(
            name='Server',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('hostname', models.CharField(max_length=128, verbose_name='\u4e3b\u673a\u540d', blank=True)),
                ('sn', models.CharField(max_length=64, verbose_name='\u5e8f\u5217\u53f7', blank=True)),
                ('service_time', models.DateField(null=True, verbose_name='\u7ef4\u4fdd\u622a\u6b62\u65f6\u95f4', blank=True)),
                ('device_type', models.CharField(max_length=50, verbose_name='\u8bbe\u5907\u7c7b\u578b', blank=True)),
                ('cabinet_num', models.CharField(max_length=50, verbose_name='\u673a\u67dc\u7f16\u53f7', blank=True)),
                ('manufactory', models.CharField(max_length=128, verbose_name='\u5236\u9020\u5546', blank=True)),
                ('model', models.CharField(max_length=128, verbose_name='\u578b\u53f7', blank=True)),
                ('os_platform', models.CharField(max_length=64, verbose_name='\u64cd\u4f5c\u7cfb\u7edf', blank=True)),
                ('cpu_count', models.IntegerField(null=True, verbose_name='\u603bCPU\u6838\u6570', blank=True)),
                ('cpu_physical_count', models.IntegerField(null=True, verbose_name='\u7269\u7406CPU\u6570', blank=True)),
                ('cpu_model', models.CharField(max_length=128, verbose_name='CPU\u578b\u53f7', blank=True)),
                ('mem_capacity', models.IntegerField(null=True, verbose_name='\u5185\u5b58\u5bb9\u91cf', blank=True)),
                ('status', models.CharField(max_length=30, verbose_name='\u5728\u7ebf\u72b6\u6001')),
                ('band', models.CharField(max_length=100, verbose_name='\u5e26\u5bbd', blank=True)),
                ('tag', models.CharField(max_length=100, verbose_name='\u6807\u8bb0', blank=True)),
                ('create_at', models.DateTimeField(auto_now_add=True)),
                ('update_at', models.DateTimeField(auto_now=True)),
                ('business', models.ForeignKey(verbose_name='\u5f52\u5c5e\u5e73\u53f0', blank=True, to='ywmodels.BusinessUnit', null=True)),
                ('hostgroup', models.ForeignKey(verbose_name='\u4e3b\u673a\u7ec4', blank=True, to='ywmodels.Hostgroup', null=True)),
                ('idc', models.ForeignKey(verbose_name='\u673a\u623f', blank=True, to='ywmodels.IDC', null=True)),
                ('leader', models.ForeignKey(verbose_name='\u9879\u76ee\u8d1f\u8d23\u4eba', blank=True, to='ywmodels.Leader', null=True)),
            ],
            options={
                'verbose_name': '\u670d\u52a1\u5668',
                'verbose_name_plural': '\u670d\u52a1\u5668',
            },
        ),
        migrations.CreateModel(
            name='ServerHistory',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('history_id', models.IntegerField()),
                ('history_ip', models.CharField(max_length=45)),
                ('history_user', models.CharField(max_length=45)),
                ('history_datetime', models.DateTimeField()),
                ('db_datetime', models.DateTimeField(auto_now_add=True)),
                ('history_command', models.CharField(max_length=765)),
            ],
            options={
                'ordering': ['id'],
                'verbose_name': '\u5ba1\u8ba1\u65e5\u5fd7',
                'verbose_name_plural': '\u5ba1\u8ba1\u65e5\u5fd7',
            },
        ),
        migrations.CreateModel(
            name='Websniff',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=100, verbose_name='\u7f51\u7ad9\u540d\u79f0')),
                ('slug', models.CharField(max_length=100, verbose_name='\u7f51\u5740')),
                ('code', models.CharField(default='', max_length=20, verbose_name='\u72b6\u6001\u7801', blank=True)),
                ('status', models.CharField(max_length=256, verbose_name='\u72b6\u6001', blank=True)),
            ],
            options={
                'ordering': ['name', 'slug'],
                'verbose_name': '\u7f51\u7ad9\u55c5\u63a2',
                'verbose_name_plural': '\u7f51\u7ad9\u55c5\u63a2',
            },
        ),
        migrations.AddField(
            model_name='ipaddr',
            name='server_info',
            field=models.ForeignKey(verbose_name='\u6240\u5c5e\u670d\u52a1\u5668', to='ywmodels.Server'),
        ),
        migrations.AddField(
            model_name='disk',
            name='server_info',
            field=models.ForeignKey(verbose_name='\u6240\u5c5e\u670d\u52a1\u5668', blank=True, to='ywmodels.Server', null=True),
        ),
        migrations.AddField(
            model_name='app',
            name='server_info',
            field=models.ForeignKey(verbose_name='\u5f52\u5c5e\u670d\u52a1\u5668', to='ywmodels.Server'),
        ),
    ]
