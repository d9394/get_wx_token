#!/usr/bin/python
#encoding: utf-8
import datetime
import os
import urllib,urllib2
import json
import socket
import sys
reload(sys)
sys.setdefaultencoding('utf-8')

#如果不使用proxy,可以去掉以下内容
proxy_handler = urllib2.ProxyHandler({"https" : "http://192.168.10.17:8080"})
opener = urllib2.build_opener(proxy_handler)
urllib2.install_opener(opener)

#CorpID是企业号的标识
CorpID='wx123456789'     #测试用企业号

#corpsecret是管理组凭证密钥
corpsecret='123456789abcde123456789abcde'     #测试用企业号

def gettoken(corpid,corpsecret):
	gettoken_url = 'https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=' + corpid + '&corpsecret=' + corpsecret
	try:
		token_file = urllib2.urlopen(gettoken_url)
	except urllib2.HTTPError as e:
		print("gettoken error Message=%s, %s" % (e.code, e.read().decode('utf-8')))
		sys.exit()
	token_data = token_file.read().decode('utf-8')
	token_json = json.loads(token_data)
	token_json.keys()
	token = token_json['access_token']
	print("Token=%s" % token)
	return token
	
if __name__ == '__main__':
	print("Start get wx token: %s" % datetime.datetime.now())
	#生成测试用token
	f = open('/tmp/wx_token.txt', 'w')
	f.write(gettoken(CorpID,corpsecret))
	f.close()
	print("End get wx token: %s" % datetime.datetime.now())
