#!/bin/bash

#shell版hosts下载器
#版本2.0

#输出位置
out='./hosts'
time=`date +%Y-%m-%d_%a-%H-%M-%S`
scpUpdate='root@192.168.223.1:/mnt/mmcblk0/Web/hosts'

## Check if user is root
#if [ $(id -u) != "0" ]; then
#    echo "Error: You must be root to run this script"
#    exit 1
#fi

if ping -c1 -w1 raw.githubusercontent.com >/dev/null 2>&1;
then
	echo
	echo 'Network OK'
	echo
	wget --no-check-certificate https://raw.githubusercontent.com/googlehosts/hosts/master/hosts-files/hosts -O $out
	echo >>$out	
	echo >>$out
	echo '# make by Sparkle ( blog: http://zanjie1999.16mb.com )'>>$out
	echo '# hosts update time: '$time>>$out
	echo ''
	echo '将上传到路由器,取消上传请 ^c'
	scp $out $scpUpdate
	
	/etc/init.d/dns-clean start
else
	echo
	echo 'Network ERROR'
fi

