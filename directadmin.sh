#!/bin/sh

wget -O directadmin.sh https://github.com/sismaywan/ksib/raw/main/directadmin.sh && chmod 777 directadmin.sh 

while true; do
echo "##############################################################"
echo "########################## MENU FILE #########################"

echo " Install 3>.2>.1>.2"
echo "	00 1) Install Directadmin 1443 Centos 6&7"
echo "	01 2) Install Directadmin Centos 6&7"
echo "	02 3) Install Directadmin OLD Centos 6&7"
echo "	03 3) Install Directadmin 1.53.2 Centos 6&7"
echo "	04 4) Install Directadmin NEW 1.62.4 Centos 6&7"
echo "	05 5) Install Directadmin NEW 1.62.4 Centos 8!!!"

echo "	0 = Update TimeZone Asia/Bangkok"
echo "	0.00 = Refresh Ram"
echo "	0.1 = nginx_apache"
echo "	0.2 = apache"
echo "	0.3 = Update php 7.0"
echo "	0.4 = Update php 7.1"
echo "	0.5 = Update php 7.2"
echo "	0.51 = Update php 7.4"
echo "	0.52 = Update php 8.0"

echo "	0.6 = Update directadmin to 1.443"
echo "	0.7 = Update Directadmin to 1.53.4"
echo "	0.71 = Update Directadmin to 1.61.5"
echo "	0.72 = Update Directadmin to 1.62.4"

echo "	0.8 = Update mysql 5.6"
echo "	0.81 = Update mysql 8.0"
echo "	0.9 = Update mariadb 10.5"
echo "	0.91 = Update mariadb 10.6"
echo "  0.10 = Remove Mysqld"
echo "	1 = Update License key Auto"
echo "	2 = Update PHP 7.0 and mysql 5.6"
echo "	3 = Update PHP 7.0 and mariadb 10.5"
echo "	3.1 = Update PHP 7.4 and mariadb 10.5"
echo "	3.2 = Update PHP 8 and mariadb 10.5"
echo "	3.3 = Update PHP 8 and mariadb 10.6"
echo "	3.4 = Remove Database to default"

echo "	4 =  Fix build custombuild 1.63 error message"
echo "	4.1 = Restart Apache"
echo "	4.1.1 = Restart Lightspeed"
echo "	4.2 = Remove Monitor Brut"
echo "	4.3 = Remove Message Ticket Directadmin"
echo "	5 = Disable IPv6 on Centos7"
echo "	5.1 = Enable IPv6 on Centos7"
echo "	6 = Install CSF"
echo "	6.1 = Uninstall CSF"
echo "	7 = Stop Directadmin"
echo "	8 = Check All Update directadmin version"
echo "	9 = update all update directadmin"
echo "	10 = All install directadmin"
echo "	11 = install openlitespeed"
echo "	11.1 = install opcache"
echo "	11.2 = install memcached"
echo "	11.3 = install redis"

echo "	x = exit"
echo -n "Enter your choice, or x for exit: "
read INPUT_STRING
echo

  case $INPUT_STRING in


	00)
	wget -O setup.sh https://github.com/sismaywan/ksib/raw/main//1443/setup.sh && chmod 777 setup.sh && ./setup.sh
	break
	;;

	01)
	yum -y install wget gcc gcc-c++ flex bison make bind bind-libs bind-utils openssl openssl-devel perl quota libaio \
libcom_err-devel libcurl-devel gd zlib-devel zip unzip libcap-devel cronie bzip2 cyrus-sasl-devel perl-ExtUtils-Embed \
autoconf automake libtool which patch mailx bzip2-devel lsof db4-devel wget glibc.i686 openssl098e.i686 libstdc++.i686;
	wget -O setup.sh https://github.com/sismaywan/ksib/raw/main//setup.sh && chmod 777 setup.sh && ./setup.sh
	cd /etc; rm localtime; ln -s /usr/share/zoneinfo/Asia/Bangkok ./localtime
	break
	;;

	02)
	wget -O setup.sh https://github.com/sismaywan/ksib/raw/main//directadmin/setup.sh && chmod 777 setup.sh && ./setup.sh 2>&1|tee directadmin_install.log
	break
	;;
	
	03)
	wget -O setup.sh https://github.com/sismaywan/testlofile/raw/main/setup.sh && chmod 777 setup.sh && ./setup.sh 2>&1|tee directadmin_install.log
	break
	;;

	04)
	wget -O setup.sh https://github.com/sismaywan/ksib/raw/main//setupcentos7.sh && chmod 777 setup.sh && ./setup.sh 2>&1|tee directadmin_install.log
	break
	;;

	05)
	wget -O setup.sh https://github.com/sismaywan/testlofile/raw/main/setup8.sh && chmod 777 setup.sh && ./setup.sh 2>&1|tee directadmin_install.log
	break
	;;
	0)

	cd /etc; rm localtime; ln -s /usr/share/zoneinfo/Asia/Bangkok ./localtime
	echo 'Update TimeZone Asia/Bangkok Success!'
	date
	break
	;;
	0.00)
    echo 1 > /proc/sys/vm/drop_caches;
    echo 2 > /proc/sys/vm/drop_caches;
    echo 3 > /proc/sys/vm/drop_caches
	break
	;;
	0.1)
	cd /usr/local/directadmin/custombuild
	./build set webserver nginx_apache
	./build nginx_apache
	./build rewrite_confs
	break
	;;

	0.2)
	cd /usr/local/directadmin/custombuild
	./build set webserver apache
	./build apache
	./build rewrite_confs
	break
	;;
	0.3)
	cd /usr/local/directadmin/custombuild
	./build set php1_release 7.0
	./build update
	sed -i 's/1.63/1.62/g' /usr/local/directadmin/custombuild/build
	./build update_versions
	./build rewrite_confs
	break
	;;
	0.4)
	cd /usr/local/directadmin/custombuild
	./build set php1_release 7.1
	./build set php1_mode mod_php
	./build update
	sed -i 's/1.63/1.62/g' /usr/local/directadmin/custombuild/build
	./build update_versions
	./build rewrite_confs
	break
	;;
	0.5)
	cd /usr/local/directadmin/custombuild
	./build set php1_release 7.2
	./build update
	sed -i 's/1.63/1.62/g' /usr/local/directadmin/custombuild/build
	./build update_versions
	./build rewrite_confs
	break
	;;
	0.51)
	cd /usr/local/directadmin/custombuild
	./build set php1_release 7.4
	./build set php1_mode php-fpm
	./build update
	sed -i 's/1.63/1.62/g' /usr/local/directadmin/custombuild/build
	./build update_versions
	./build rewrite_confs
	break
	;;
	0.52)
	cd /usr/local/directadmin/custombuild
	./build set php1_release 8.0
	./build set php1_mode php-fpm
	./build update
	sed -i 's/1.63/1.62/g' /usr/local/directadmin/custombuild/build
	./build version
	./build rewrite_confs
	break
	;;
	0.6)
	cd /usr/local/directadmin
	wget --no-check-certificate -O update.tar.gz 'https://github.com/sismaywan/ksib/raw/main//1443/update.tar.gz'
	tar xvzf update.tar.gz
	./directadmin p
	cd scripts
	./update.sh
	service directadmin restart
	break
	;;
	0.7)
	cd /usr/local/directadmin
	wget --no-check-certificate -O update.tar.gz 'https://github.com/sismaywan/ksib/raw/main//update.tar.gz'
	tar xvzf update.tar.gz
	./directadmin p
	cd scripts
	./update.sh
	service directadmin restart
	break
	;;

	0.71)
	cd /usr/local/directadmin
	wget --no-check-certificate -O update.tar.gz 'https://github.com/the-sky-blue/Directadmin-1.61.5-Nulled/raw/master/update.tar.gz'
	tar xvzf update.tar.gz
	./directadmin p
	cd scripts
	./update.sh
	service directadmin restart
	break
	;;

	0.72)
	cd /usr/local/directadmin
	wget --no-check-certificate -O update.tar.gz 'https://github.com/sismaywan/ksib/raw/main//v1.62.4.tar.gz'
	tar xvzf update.tar.gz
	./directadmin p
	cd scripts
	./update.sh
	service directadmin restart
	break
	;;

	0.8)
	cd /usr/local/directadmin/custombuild
	./build set mysql 5.6
	./build set mysql_inst mysql
	./build set mysql_backup yes
	./build update
	sed -i 's/1.63/1.62/g' /usr/local/directadmin/custombuild/build
	./build mysql
	echo "update mysql 5.6 success"
	break
	;;
	0.81)
	cd /usr/local/directadmin/custombuild
	./build set mysql 8.0
	./build set mysql_inst mysql
	./build set mysql_backup yes
	./build update
	sed -i 's/1.63/1.62/g' /usr/local/directadmin/custombuild/build
	./build mysql
	echo "update mysql 8.0 success"
	break
	;;
	0.9)
	cd /usr/local/directadmin/custombuild
	./build set mariadb 10.5
	./build set mysql_inst mariadb
	./build set mysql_backup yes
	./build update
	sed -i 's/1.63/1.62/g' /usr/local/directadmin/custombuild/build
	./build mariadb
	echo "update mariadb 10.5 success"
	break
	;;

	0.91)
	cd /usr/local/directadmin/custombuild
	./build set mariadb 10.6
	./build set mysql_inst mariadb
	./build set mysql_backup yes
	./build update
	sed -i 's/1.63/1.62/g' /usr/local/directadmin/custombuild/build
	./build mariadb
	echo "update mariadb 10.6 success"
	break
	;;

	0.10)
perl -pi -e 's/mysqld=ON/mysqld=OFF/' /usr/local/directadmin/data/admin/services.status
service mysqld stop
mv /var/lib/mysql /var/lib/mysql.old
cd /usr/local/directadmin/scripts


read -p "Enter the rootpassword --> " text1
read -p "Enter the da_admin -> " text2
./mysql.sh $text1 da_admin $text2


	echo "remove mysql and new"
	break
	;;

	1)

	clean_dev()
{
	C=`echo $1 | grep -o ":" | wc -l`

	if [ "${C}" -eq 0 ]; then
		echo $1;
		return;
	fi

	if [ "${C}" -ge 2 ]; then
		echo $1 | cut -d: -f1,2
		return;
	fi

	TAIL=`echo $1 | cut -d: -f2`
	if [ "${TAIL}" = "" ]; then
		echo $1 | cut -d: -f1
		return;
	fi

	echo $1
}

	DEVS=`ip link show | grep -e "^[1-9]" | awk '{print $2}' | cut -d: -f1 | grep -v lo | grep -v sit0 | grep -v ppp0 | grep -v faith0`
		if [ -z "${DEVS}" ] && [ -x /sbin/ifconfig ]; then
			DEVS=`/sbin/ifconfig -a | grep -e "^[a-z]" | awk '{ print $1; }' | grep -v lo | grep -v sit0 | grep -v ppp0 | grep -v faith0`
		fi
		COUNT=0;
		for i in $DEVS; do
		{
			COUNT=$(($COUNT+1));
		};
		done;


		if [ $COUNT -eq 0 ]; then
        		echo "Could not find your ethernet device.";
	        	echo -n "Please enter the name of your ethernet device: ";
	        	read ETH_DEV;
		elif [ $COUNT -eq 1 ]; then

			#DIP=`/sbin/ifconfig $DEVS | grep 'inet addr:' | cut -d: -f2 | cut -d\  -f1`;
			DEVS=`clean_dev $DEVS`
			DIP=`ip addr show $DEVS | grep -m1 'inet ' | awk '{print $2}' | cut -d/ -f1`
			#ifconfig fallback
			if [ -z "${DIP}" ] && [ -x /sbin/ifconfig ]; then
				DIP=`/sbin/ifconfig $DEVS | grep 'inet ' | awk '{print $2}' | cut -d: -f2`;
			fi

        		echo -n "Is $DEVS your network adaptor with the license IP ($DIP)? (y,n) : ";
		        read yesno;
        		if [ "$yesno" = "n" ]; then
                		echo -n "Enter the name of the ethernet device you wish to use : ";
		                read ETH_DEV;
		        else
	        	        ETH_DEV=$DEVS
		        fi
		else
	        	# more than one
		        echo "The following ethernet devices/IPs were found. Please enter the name of the device you wish to use:";
		        echo "";
		        #echo $DEVS;
		        for i in $DEVS; do
		        {
				D=`clean_dev $i`
				DIP=`ip addr show $D | grep -m1 'inet ' | awk '{print $2}' | cut -d/ -f1`
				if [ -z "${D}" ] && [ -x /sbin/ifconfig ]; then
					DIP=`/sbin/ifconfig $D | grep 'inet ' | awk '{print $2}' | cut -d: -f2`;
				fi
		        	echo "$D       $DIP";
		        };
		        done;

		        echo "";
		        echo -n "Enter the device name: ";
		        read ETH_DEV;
		fi



echo "DEVICE=$ETH_DEV:100" >> /etc/sysconfig/network-scripts/ifcfg-$ETH_DEV:100
echo 'IPADDR=176.99.3.34' >> /etc/sysconfig/network-scripts/ifcfg-$ETH_DEV:100
echo 'NETMASK=255.255.255.0' >> /etc/sysconfig/network-scripts/ifcfg-$ETH_DEV:100
/usr/bin/perl -pi -e "s/^ethernet_dev=.*/ethernet_dev=$ETH_DEV:100/" /usr/local/directadmin/conf/directadmin.conf
service network restart

rm -rf /usr/local/directadmin/conf/license.key;
/usr/bin/wget -O /usr/local/directadmin/conf/license.key https://uliginous-refuse.000webhostapp.com/dir/license.key;
chmod 600 /usr/local/directadmin/conf/license.key;
chown diradmin:diradmin /usr/local/directadmin/conf/license.key;
service directadmin start;

echo "Udate licensekey Success!"
break
	;;

		2)
		cd /usr/local/directadmin/custombuild
		./build set php1_release 7.0
		./build update
		./build set php_timezone Asia/Bangkok
		./build set mysql 5.6
		./build set mysql_inst mysql
		./build set mysql_backup yes
		./build versions
		./build update_versions
		./build rewrite_confs
		echo "Update PHP 7.0 and mysql 5.6 Success!"
break
		;;

		3)
		cd /usr/local/directadmin/custombuild
		./build update
		./build set php1_release 7.0
		./build set php_timezone Asia/Bangkok
		./build set mariadb 10.0
		./build set mysql_inst mariadb
		./build set mysql_backup yes
		./build versions
		./build update_versions
		./build rewrite_confs
		echo "Update PHP 7.0 and mariadb 10.0 Success!"	
break
		;;

		3.1)
		cd /usr/local/directadmin/custombuild
		./build update
		./build set php1_release 7.4
		./build set php1_mode php-fpm
		./build set php_timezone Asia/Bangkok
		./build set mariadb 10.5
		./build set mysql_inst mariadb
		./build set mysql_backup yes
		./build versions
		./build update_versions
		./build rewrite_confs
		echo "Update PHP 7.4 and mariadb 10.5 Success!"	
break
		;;

		3.2)
		cd /usr/local/directadmin/custombuild
		./build update
		./build set php1_release 8.0
		./build set php1_mode php-fpm
		./build set php_timezone Asia/Bangkok
		./build set mariadb 10.5
		./build set mysql_inst mariadb
		./build set mysql_backup yes
		./build versions
		./build update_versions
		./build rewrite_confs
		echo "Update PHP 8 and mariadb 10.5 Success!"	
break
		;;

		3.3)
		cd /usr/local/directadmin/custombuild
		./build update
		./build set php1_release 8.0
		./build set php1_mode php-fpm
		./build set php_timezone Asia/Bangkok
		./build set mariadb 10.6
		./build set mysql_inst mariadb
		./build set mysql_backup yes
		./build versions
		./build update_versions
		./build rewrite_confs
		echo "Update PHP 8 and mariadb 10.6 Success!"	
break
		;;


		4)
cd /usr/local/directadmin/custombuild;rm -rf build
cd /usr/local/directadmin;wget -O custombuild.tar.gz https://github.com/sismaywan/ksib/raw/main/custombuild.tar.gz;tar xvzf custombuild.tar.gz
break
;;

		4.1)
		cd /usr/local/directadmin/custombuild
		./build rewrite_confs
		echo "restart"	
break
;;
		4.1.1)
			/usr/local/lsws/bin/lswsctrl restart
			sudo service lsws restart
			break ;;

		4.2)
		cd  /usr/local/directadmin/data/admin
cat /dev/null > brute_log_entries.list
cat /dev/null > brute_user.data
cat /dev/null > brute_ip.data
echo "Clear Log OK"
break
;;
		4.3)
		cd /usr/local/directadmin/data/admin
		echo -n "" > tickets.list
		cd /usr/local/directadmin/data/tickets
		rm -rf *
echo "Remove Ticket OK"
break
;;


		5)
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
echo "https://www.serverlab.ca/tutorials/linux/administration-linux/how-to-disable-ipv6-network-on-centos-7/"
echo "Disable IPv6"

break 
;;

		5.1)
sysctl -w net.ipv6.conf.all.disable_ipv6=0
sysctl -w net.ipv6.conf.default.disable_ipv6=0
echo "Enable IPv6"

break 
;;

		6)
		cd /usr/src
		rm -fv csf.tgz
		wget https://download.configserver.com/csf.tgz
		tar -xzf csf.tgz
		cd csf
		sh install.sh

sed -i 's/^TESTING = "1"/TESTING = "0"/' /etc/csf/csf.conf
sed -i 's/^RESTRICT_SYSLOG = "0"/RESTRICT_SYSLOG = "3"/' /etc/csf/csf.conf
sed -i 's/^DENY_IP_LIMIT = "200"/DENY_IP_LIMIT = "200000"/' /etc/csf/csf.conf
sed -i 's/^URLGET = "2"/URLGET = "1"/' /etc/csf/csf.conf
sed -i 's/^TCP_IN = "20,21,22,25,53,80,110,143,443,465,587,993,995,2222"/TCP_IN = "20,21,22,25,53,80,110,143,443,465,587,993,995,2222,3306,35000:35999"/' /etc/csf/csf.conf
sed -i 's/^TCP_OUT = "20,21,22,25,53,80,110,113,443,587,993,995,2222"/TCP_OUT = "20,21,22,25,53,80,110,113,443,587,993,995,2222,3306,35000:35999"/' /etc/csf/csf.conf
sed -i 's/^UDP_IN = "20,21,53"/UDP_IN = "20,21,53,3306,35000:35999"/' /etc/csf/csf.conf
sed -i 's/^UDP_OUT = "20,21,53,113,123"/UDP_OUT = "20,21,53,113,123,3306,35000:35999"/' /etc/csf/csf.conf
cd /etc/csf
csf -x

csf -r

		break
		;;

		6.1)
		cd /etc/csf;sh uninstall.sh
		break
		;;

		7)
cd /etc/sysconfig/network-scripts
rm -rf ifcfg-venet0:100
rm -rf ifcfg-eth0:100
service network restart
service directadmin restart
		break
		;;
		8)
cd /usr/local/directadmin/custombuild
./build update
sed -i 's/1.63/1.62/g' build
./build versions
printf  "Please 9 Update Please x Exit : "
		;;
		9)
cd /usr/local/directadmin/custombuild
./build update_versions
./build rewrite_confs
		break
		;;

		10)
	wget -O Master-Scripts.sh https://github.com/minhvinhdao/Finaly-All-In-One-DirectAdmin/raw/main/Master-Scripts.sh && chmod 777 Master-Scripts.sh && ./Master-Scripts.sh
echo "https://github.com/minhvinhdao/Finaly-All-In-One-DirectAdmin"
		break
		;;


		11)

cd /usr/local/directadmin/custombuild;
./build update;
./build set webserver openlitespeed;
./build set mod_ruid2 no;
./build set php1_mode lsphp;
./build openlitespeed;
./build php n;
./build rewrite_confs;

cd /usr/local/directadmin/custombuild/;
mkdir -p custom/openlitespeed/conf;
wget -P /usr/local/directadmin/custombuild/custom/openlitespeed/conf/ https://raw.githubusercontent.com/dr1361teh/Finaly-All-In-One-DirectAdmin/main/httpd-expires.conf && chmod 644 /usr/local/directadmin/custombuild/custom/openlitespeed/conf/httpd-expires.conf;

echo "Install Openlitespeed Success";

		break
		;;

		11.1)

cd /usr/local/directadmin/custombuild
./build set opcache yes
./build opcache


cd /usr/local/directadmin/custombuild;
mkdir -p custom/opcache/;
wget -P /usr/local/directadmin/custombuild/custom/opcache/ https://raw.githubusercontent.com/dr1361teh/Finaly-All-In-One-DirectAdmin/main/opcache.ini && chmod 644 /usr/local/directadmin/custombuild/custom/opcache/opcache.ini;
cd /usr/local/directadmin/custombuild;
./build opcache;

echo "Install opcache Success";

		break
		;;

		11.2)

yum install memcached -y;
yum install memcached-devel -y;
yum install libmemcached-devel -y;
yum install libmemcached -y;
wget -P /etc/sysconfig/ https://raw.githubusercontent.com/dr1361teh/Finaly-All-In-One-DirectAdmin/main/memcached && chmod 644 /etc/sysconfig/memcached;
wget https://raw.githubusercontent.com/poralix/directadmin-utils/master/php/php-extension.sh -O php-extension.sh;
chmod 750 php-extension.sh;
./php-extension.sh;
./php-extension.sh install memcached;
./php-extension.sh status memcached;
chkconfig memcached on;
service memcached start;
systemctl restart memcached;
netstat -nltp | grep 11211;
netstat -nltp | grep memcached;

wget -P /etc/sysconfig/ https://raw.githubusercontent.com/dr1361teh/Finaly-All-In-One-DirectAdmin/main/memcached && chmod 644 /etc/sysconfig/memcached;
chkconfig memcached on;
service memcached start;
systemctl restart memcached;
netstat -nltp | grep 11211;
netstat -nltp | grep memcached;


echo "Install memcached Success";

		break
		;;


		11.3)

yum update -y;
yum install epel-release -y;
yum install redis -y;
service redis restart;
chkconfig redis on;
redis-cli MONITOR;
pecl install igbinary igbinary-devel;
cd /usr/local/directadmin/scripts/custom;
wget https://raw.githubusercontent.com/poralix/directadmin-utils/master/php/php-extension.sh -O php-extension.sh;
chmod 750 php-extension.sh;
./php-extension.sh install redis;
./php-extension.sh status redis;


echo "Install redis Success";

		break
		;;



	x) exit;;
	*)
		echo "Sorry, Please Choose 0-11.3"
		;;


esac
done
