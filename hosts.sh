#!/bin/bash

#GoHost shell版
#版本1.0

#计划任务添加:
#0 5 * * * /mnt/mmcblk0/sh/hosts.sh

#https://raw.githubusercontent.com/sy618/hosts/master/FQ
#https://raw.githubusercontent.com/racaljk/hosts/master/hosts

#输出位置
out='/etc/hosts'
time=`date +%Y-%m-%d_%a-%H-%M-%S`

# Check if user is root
if [ $(id -u) != "0" ]; then
    echo "Error: You must be root to run this script"
    exit 1
fi

if ping -c1 -w1 raw.githubusercontent.com &> /dev/null;
then
	echo
	echo 'Network OK'
	echo
	wget --no-check-certificate https://raw.githubusercontent.com/racaljk/hosts/master/hosts https://raw.githubusercontent.com/sy618/hosts/master/FQ -O $out
	echo >>$out	
	echo >>$out
	echo '# make by Sparkle ( blog: http://zanjie1999.16mb.com )'>>$out
	echo '# hosts update time: '$time>>$out
else
	echo
	echo 'Network ERROR'
fi


