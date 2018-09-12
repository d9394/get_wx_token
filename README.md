# get_wx_token
分别是两种取微信企业号token的工具（脚本）
建议使用定时任务定是去获取，然后保存在/tmp/wx_token.txt里
使用的时侯，直接读取/tmp/wx_token.txt内容，这样可以多个发送程序共用一个token了，不需要每次发送信息单独去微信里取一次token了
