#!/bin/bash
#fandy

    cat > /etc/yum.repos.d/webmin.repo <<END
[Webmin]
name=Webmin Distribution Neutral
#baseurl=http://download.webmin.com/download/yum
mirrorlist=http://download.webmin.com/download/yum/mirrorlist
enabled=1

END

wget http://www.webmin.com/jcameron-key.asc
rpm --import jcameron-key.asc

# service
yum install webmin -y
service webmin restart
chkconfig webmin on
