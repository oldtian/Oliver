### Oliver运维管理系统

- **[简介](#简介)**
- **[功能描述](#功能描述)**
- **[安装部署](#安装部署)**
  - **[安装以下软件](#安装以下软件)**
  - **[关闭selinux并开放iptables的80端口](#关闭selinux并开放iptables的80端口)**
  - **[pip安装如下包](#pip安装如下包)**
  - **[创建uwsgi.ini](#创建uwsgi.ini)**
  - **[创建supervisor配置文件](#创建supervisor配置文件)**
  - **[编辑supervisor配置文件](#编辑supervisor配置文件)**
  - **[修改nginx配置](#修改nginx配置)**
  - **[添加网站监控脚本到定时任务](#添加网站监控脚本到定时任务)**
  - **[在需要做安全审计的主机的\/etc\/profile文件中添加如下配置](#在需要做安全审计的主机的\/etc\/profile文件中添加如下配置)**
  - **[搜集静态文件到指定目录](#搜集静态文件到指定目录)**
  - **[同步数据库](#同步数据库)**
  - **[启动OliverServer主进程](#启动OliverServer主进程)**
  - **[重启nginx和supervisor](#重启nginx和supervisor)**

开发语言: python

web框架: django

版本：V1.2

作者：老田

#### 简介

  Oliver运维管理系统是一款针对中小企业IT环境集中式运维管理平台，提供主机\主机组管理，网站监控，集中化运维管理可自由扩
  展功能模块，安全审计及查询统计接口的运维管理系统，也是老田的处女作，水平有限，希望大家批评指正，谢谢。


#### 功能描述

- 首页图形化展示服务器分类，不同业务平台设备占比，在线与离线服务器情况及维保情况；
- 前端主机管理可添加，修改，删除主机信息，并可查看详细的主机信息;
- 前端可添加与修改主机组，向主机组添加或删除管理IP；
- 网站监控功能可添加，修改，批量删除监控站点，通过站点返回的状态码判断站点访问是否正常；
- 运维管理通过调用ansible的API接口实现日志查看，配置查看，文件分发，端口扫描等多项功能，并提供的功能模块扩展接口，可方便的进行模块扩展；
- 安全审计功能则通过审计代理将操作日志推送到数据库，前端通过读取数据库信息实现实时监视，并可追溯历史数控；
- 统计查询模块则提供了多项条件查询接口，获取满足条件的主机列表信息；

#### 安装部署
下载Oliver到本地：`git clone https://github.com/oldtian/Oliver.git`

##### 安装以下软件
###### 1.1 安装nginx
安装过程略

###### 1.2 安装mysql
安装过程略

###### 1.3 安装python2.7.10
升级安装python2.7.10

    wget https://www.python.org/ftp/python/2.7.10/Python-2.7.10.tgz
    tar -zxf Python-2.7.10.tgz
    cd Python-2.7.10
    ./configure
    make all 
    make install
    make clean
    make distclean
  
查看版本

    /usr/local/bin/python2.7 -V

建议软链接

    mv /usr/bin/python /usr/bin/python2.6.6
    ln -s /usr/local/bin/python2.7 /usr/bin/python
  
重新验证版本

    python -V
  
###### 1.4 安装setuptools

    wget https://pypi.python.org/packages/source/s/setuptools/setuptools-19.2.tar.gz
    tar -zxf setuptools-19.2.tar.gz
    cd setuptools-19.2
    python setup.py install
  
###### 1.5 安装pip8.1.1

    wget https://pypi.python.org/packages/source/p/pip/pip-8.1.1.tar.gz
    tar -zxf pip-8.1.1.tar.gz
    cd pip-8.1.1
    python setup.py install
  
##### 关闭selinux并开放iptables的80端口

    setenforce 0
    sed -i '/^SELINUX=/{s/enforcing/disabled/}' /etc/sysconfig/selinux
    sed -i '/^SELINUX=/{s/enforcing/disabled/}' /etc/selinux/config
    iptables -I INPUT 4  -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
    /etc/init.d/iptables save
  
##### pip安装如下包

    pip install supervisor
    pip install uwsgi
    pip install ansible==1.9.4
    pip install Django==1.8.3
    pip install django-users2
    pip install MySQL-python
    pip install rpyc
  
##### 创建uwsgi.ini
建议放置在项目所在目录下

    [uwsgi]
    socket = /tmp/oliver.sock         #nginx需要使用到的socket文件
    chdir=/opt/www/oliver            #切换到项目所在目录
    wsgi-file = Oliver/wsgi.py         #wsgi.py主程序入口，加载相应环境
    touch-reload=/opt/www/oliver/reload   #touch一个空白的reload文件，项目重启
    processes = 2                  #初始启动进程数
    threads = 4
    chmod-socket = 664			#socket文件的属性
    chown-socket = nginx:nginx		#socket文件的属主和属组
  
##### 创建supervisor配置文件

    echo_supervisord_conf > /etc/supervisord.conf
  
##### 编辑supervisor配置文件
在/etc/supervisord.conf末尾追加

    [program:oliver]   #oliver是supervisor管理的进程名
    command=/usr/local/bin/uwsgi --ini /www/oliver/uwsgi.ini
    directory=/www/oliver
    startsecs=0
    stopwaitsecs=0
    autostart=true
    autorestart=true
  
##### 启动supervisor

    supervisord -c /etc/supervisord.conf
查看/tmp/oliver.sock文件是否存在，如果不存在可先将/tmp目录下文件删除，然后再一次执行上面的命令

supervisor管理进程命令:
停止进程:

    supervisorctl -c /etc/supervisord.conf stop oliver

启动进程:

    supervisorctl -c /etc/supervisord.conf start oliver

重启进程:

    supervisorctl -c /etc/supervisord.conf restart oliver

##### 修改nginx配置
nginx的配置文件中添加虚拟主机配置：

    server {
        listen      80;
        server_name localhost;
        charset     utf-8;
        client_max_body_size 8M;
        location /media  {
            alias /opt/www/Oliver/media;
        }
        location /static {
            alias /opt/www/Oliver/static;
        }
        location / {
            uwsgi_pass  unix:///tmp/oliver.sock;
            include    /opt/application/nginx/conf/uwsgi_params;
        }
    }
  
django仅在开发模式可加载setting.py配置中指定目录下的静态文件，在生产环境要通过nginx配置来加载静态文件，创建static和media目录。

##### 添加网站监控脚本到定时任务

     */5 * * * * /usr/local/bin/python /opt/www/Oliver/webapi/sniffer.py >/dev/null 2>&1
  
##### 在需要做安全审计的主机的/etc/profile文件中添加如下配置

    HISTSIZE=1200
    export PATH USER LOGNAME MAIL HOSTNAME HISTSIZE
    export HISTCONTROL=ignoredups
    export HISTFILE=$HOME/.bash_history
    export HISTFILESIZE=1200
    export HISTTIMEFORMAT="`whoami` %F %T "
    export PROMPT_COMMAND="history -a; history -c; history -r;"'/opt/www/OMAudit/OMAudit_agent.py $(history 1)'
    shopt -s histappend
    typeset -r PROMPT_COMMAND
    typeset -r HISTTIMEFORMAT
  
##### 搜集静态文件到指定目录
在setting.py中配置STATIC_ROOT来指定搜集静态文件存放目录：

    python manage.py collectstatic
每次修改静态文件内容，也需要执行一次以上命令，否则修改后的内容nginx加载不到

##### 同步数据库

    python manage.py makemigrations
    python manage.py migrate
  
##### 启动OliverServer主进程

    python OliverServer.py &
  
##### 重启nginx和supervisor

    service nginx restart
    supervisorctl -c /etc/supervisord.conf restart oliver
