#!bin/bash
if [ $USER != 'root' ]
then
echo "Gunakan User root Untuk Menjalankan Script ini"
exit 0
fi
#install openvpn
cd root
wget https://github.com/fandypeace/setupku/raw/master/portfwd

#jeda manng
cd /etc/
cp rc.local /etc/rc.local.fandypeace
rm rc.local
wget https://github.com/fandypeace/setupku/raw/master/rc.local

#jeda
reboot
