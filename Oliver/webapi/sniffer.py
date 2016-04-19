#!/usr/bin/python
#coding=utf-8
'''
Created on 2016年3月11日
 
@author: Administrator
'''
from httplib import HTTPConnection
import MySQLdb

def get_url_stat():
    sluglist = []
    my_conn = MySQLdb.connect(host='localhost', port=3307, user='oliver', passwd='WF#@&tu87wr45', db='cmdb')
    cur = my_conn.cursor()
    cur.execute("select * from ywmodels_websniff")
    nret = cur.fetchall()

    for j in nret:
        sluglist.append(j[2])
    for url in sluglist:
        ret = {'code': '', 'status': ''}
        try:
            conn = HTTPConnection(url, 80, timeout=5)
            conn.request('GET', '')
            response = conn.getresponse()
            ret['code'] = response.status
            ret['status'] = "status_info: %s, %s"%(response.status, response.reason)
        except Exception, e:
            ret['status'] = e
        finally:
            if conn:
		#print '%s %s'%(url, ret)
                conn.close()
            cur.execute("update ywmodels_websniff set code=%s, status=%s where slug=%s", (ret['code'], ret['status'], url,))
    my_conn.commit()
    cur.close()
    my_conn.close()

if __name__ == "__main__":
    get_url_stat()
