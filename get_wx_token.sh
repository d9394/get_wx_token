#!/bin/bash
###SCRIPT_NAME:get_wx_token.sh###
###get weixin token###
###V1-2018-09-06###

CropID='wx123456789'
Secret='123456789123456789123456789123456789'
GURL="https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=$CropID&corpsecret=$Secret"
#if using proxy 192.168.1.1:8080
Gtoken=$(/usr/bin/curl --proxy http://192.168.1.1:8080 -s -G $GURL | sed "s/,/\n/g" | grep token | cut -d ":" -f 2 | sed "s/\"//g")
echo $Gtoken > /tmp/wx_token.txt
