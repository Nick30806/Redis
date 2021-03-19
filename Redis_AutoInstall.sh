#!/bin/bash

## Install Redis ##

## 添加 EPEL 倉庫 ##
yum install -y epel-release

## 下載 Redis ##
yum install -y redis

## 把本機IP註釋對外開放 ##
sed -i 's/bind 127.0.0.1/#bind 127.0.0.1/g' /etc/redis.conf

## Firewall 配置 ##

firewall-cmd --zone=public --add-port=6379/tcp --permanent
firewall-cmd --reload

## 啟動及開機啟動 Redis ## 

systemctl start redis
systemctl enable redis
