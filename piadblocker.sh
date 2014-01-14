#!/bin/bash

ad_list_url="http://pgl.yoyo.org/adservers/serverlist.php?hostformat=dnsmasq&showintro=0&mimetype=plaintext"
pixelserv_ip="192.168.2.1"
ad_file="/etc/dnsmasq.d/dnsmasq.adblocklist.conf"
temp_ad_file="/tmp/dnsmasq.adblocklist.conf.tmp"

curl $ad_list_url | sed "s/127\.0\.0\.1/$pixelserv_ip/" > $temp_ad_file

if [ -f "$temp_ad_file" ]
then
	#sed -i -e '/www\.favoritesite\.com/d' $temp_ad_file
	mv -f $temp_ad_file $ad_file
else
	exit
fi

service dnsmasq restart
