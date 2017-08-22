#!/bin/sh

#shell版hosts下载器
#版本2.0

#计划任务添加:
#0 5 * * * /mnt/mmcblk0/sh/hosts.sh

#已经停止更新
#https://raw.githubusercontent.com/sy618/hosts/master/FQ
#https://raw.githubusercontent.com/racaljk/hosts/master/hosts
#https://raw.githubusercontent.com/racaljk/hosts/master/dnsmasq.conf

#目前使用的源
#https://raw.githubusercontent.com/googlehosts/hosts/master/hosts-files/hosts
#https://raw.githubusercontent.com/googlehosts/hosts/master/hosts-files/dnsmasq.conf

#输出位置
out='/mnt/mmcblk0/Web/'
time=`date +%Y-%m-%d_%a-%H-%M-%S`

# Check if user is root
if [ $(id -u) != "0" ]; then
    echo "Error: You must be root to run this script"
    exit 1
fi

if ping -c1 -w1 raw.githubusercontent.com >/dev/null 2>&1;
then
	echo
	echo 'Network OK'
	echo
#	wget --no-check-certificate https://raw.githubusercontent.com/racaljk/hosts/master/hosts https://raw.githubusercontent.com/sy618/hosts/master/FQ -O $out'hosts'
#	wget --no-check-certificate https://raw.githubusercontent.com/racaljk/hosts/master/dnsmasq.conf -O $out'dnsmasq.conf'

	wget --no-check-certificate https://raw.githubusercontent.com/googlehosts/hosts/master/hosts-files/hosts -O $out'hosts'
	wget --no-check-certificate https://raw.githubusercontent.com/googlehosts/hosts/master/hosts-files/dnsmasq.conf -O $out'dnsmasq.conf'

	echo >>$out'hosts' >>$out'dnsmasq.conf'
	echo >>$out'hosts' >>$out'dnsmasq.conf'
	echo '# make by Sparkle ( blog: http://zanjie1999.16mb.com )'>>$out'hosts' >>$out'dnsmasq.conf'
	echo '# hosts update time: '$time>>$out'hosts' >>$out'dnsmasq.conf'
	
	/etc/init.d/dnsmasq restart
else
	echo
	echo 'Network ERROR'
fi
