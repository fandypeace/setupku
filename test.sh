#!bin/bash
if [ $USER != 'root' ]
then
echo "Gunakan User root Untuk Menjalankan Script ini"
exit 0
fi
#downLOAD
wget 
cd /etc/
cp rc.local /etc/rc.local.fandy
rm rc.local
wget https://github.com/fandypeace/setupku/raw/master/rc.local

#jeda
reboot
