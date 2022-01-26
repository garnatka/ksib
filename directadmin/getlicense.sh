#!/bin/sh

SERVER="http://uliginous-refuse.000webhostapp.com/dir/directadmin"
SERVER_NEW="https://uliginous-refuse.000webhostapp.com/dir/license.key"
LICENSE=/usr/local/directadmin/conf/license.key
LICENSE_GZ=/usr/local/directadmin/conf/license.key.gz

echo "#####################################################"
echo "#         DIRECTADMIN SELECT VERSION BY KEN         #"
echo "#               FB.COM/HEXAN.OFFICIAL               #"
echo "#####################################################"
echo "#             GET LICENSE DIRECTADMIN               #"
echo "#####################################################"
echo ""

cd /usr/local/directadmin/conf
service directadmin stop
rm -rf $LICENSE
## wget -O $LICENSE_GZ ${SERVER}/files/license.key.gz
## gunzip $LICENSE_GZ
## rm -rf $LICENSE_GZ
wget -O $LICENSE $SERVER_NEW
chmod 600 $LICENSE
chown diradmin:diradmin $LICENSE
service directadmin start

echo "Get License Success!"
