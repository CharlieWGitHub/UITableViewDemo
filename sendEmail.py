#!/usr/bin/env python3
# coding=utf-8

# sendEmail title content
import sys
import smtplib
from email.mime.text import MIMEText
from email.header import Header

#//配置发送的邮箱
sender = '278470909@qq.com;'
#//配置接收的邮箱
receiver = '18501131990@163.com;'
#//SMTP邮件服务器 以QQ邮箱配置的
smtpserver = 'smtp.qq.com'
#smtpserver = 'smtp.exmail.qq.com'
#//配置SMTP开启服务的账号和授权密码密码
username = '278470909@qq.com'
password = 'dzfgcboabrjlcagd'

#//这是配置发送邮件的python代码
def send_mail(title, content):
    # //title代表标题 content代表邮件内容
    try:
        msg = MIMEText(content,'plain','utf-8')
        if not isinstance(title,unicode):
            title = unicode(title, 'utf-8')
        msg['Subject'] = title
        msg['From'] = sender
        msg['To'] = receiver
        msg["Accept-Language"]="zh-CN"
        msg["Accept-Charset"]="ISO-8859-1,utf-8"

        smtp = smtplib.SMTP_SSL(smtpserver,465)
        smtp.login(username, password)
        smtp.sendmail(sender, receiver, msg.as_string())
        smtp.quit()
        return True
    except Exception, e:
        print str(e)
        return False

if send_mail(sys.argv[1], sys.argv[2]):
    print "done!"
else:
    print "failed!"

