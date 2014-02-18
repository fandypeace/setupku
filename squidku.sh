#!/bin/bash

yum update -y && yum groupinstall "Development Tools" -y
yum install squid -y
cd /etc/squid/
cp squid.conf /etc/squid/squid.conf.bak
rm squid.conf

    cat > /etc/squid/squid.conf <<END
http_port 80
http_port 8080
acl all src all
acl manager proto cache_object
acl localhost src 127.0.0.1/32
acl to_localhost dst 127.0.0.0/8
acl localnet src 10.0.0.0/8
acl localnet src 172.16.0.0/12
acl localnet src 192.168.0.0/16

acl SSL_ports port 443 563 873
acl Safe_ports port 80 21 443 70 210 1025-65535 280 488 591 777 631 873 901
acl purge method PURGE
acl CONNECT method CONNECT

acl Only_hosts dstdomain 127.0.0.1
acl Only_ports port 22 143 443 1194
acl Only_methods method CONNECT
http_access allow Only_methods Only_hosts Only_ports

http_access allow manager localhost
http_access deny manager
http_access allow purge localhost
http_access deny purge
http_access deny !Safe_ports
http_access deny CONNECT !SSL_ports
http_access allow localhost
icp_access allow localnet
icp_access deny all
forwarded_for off

access_log /var/log/squid/access.log squid
refresh_pattern ^ftp: 1440 20% 10080
refresh_pattern ^gopher: 1440 0% 1440
refresh_pattern -i (/cgi-bin/|\?) 0 0% 0
refresh_pattern (Release|Package(.gz)*)$ 0 20% 2880
refresh_pattern . 0 20% 4320
acl apache rep_header Server ^Apache
broken_vary_encoding allow apache
extension_methods REPORT MERGE MKACTIVITY CHECKOUT
hosts_file /etc/hosts
coredump_dir /var/spool/squid



cache_mgr sales@greenlandsnetwork.net
cache_effective_user squid
visible_hostname greenlandsnetwork.net

END

chkconfig squid on
service squid restart
