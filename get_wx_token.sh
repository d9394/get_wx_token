#!/bin/bash
###SCRIPT_NAME:get_wx_token.sh###
###get weixin token###
###V2-2018-10-17###

AA=$(ps aux | grep -v grep | grep "get_wx_token" | wc -l)
if [ $AA -gt 2 ]; then
  echo get wx token process $AA
  exit 1
fi

Get_Token(){
  Result=""
  while true
  do
    Result=$(/usr/bin/curl --proxy http://192.168.1.1:8080 -s -G $1 | sed "s/,/\n/g" | grep token | cut -d ":" -f 2 | sed "s/\"//g")
    if [ "$Result" != "" ]; then
      echo $Result
      break
    fi
    sleep 5
  done
}

CropID='wx123456789'
Secret='123456789123456789123456789123456789'
GURL="https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=$CropID&corpsecret=$Secret"
#if using proxy 192.168.1.1:8080
Gtoken=$(Get_Token $GURL)
echo $Gtoken > /tmp/wx_token.txt
