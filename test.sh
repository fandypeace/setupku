#!bin/bash
if [ $USER != 'root' ]
then
echo "Gunakan User root Untuk Menjalankan Script ini"
exit 0
fi
cd /etc/
#jeda
echo echo 1 > /proc/sys/net/ipv4/ip_forward >>  /etc/rc.local
python /root/portfwd 443 1194 & >>  /etc/rc.local
