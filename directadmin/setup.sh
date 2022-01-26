#!/bin/sh

OS=`uname`;
LANGUAGE=""
TRUE_FALSE="n"
SERVER="http://uliginous-refuse.000webhostapp.com/dir/directadmin"

if [ "$OS" = "FreeBSD" ]; then
	WGET_PATH=/usr/local/bin/wget
else
	WGET_PATH=/usr/bin/wget
fi

echo "#####################################################"
echo "#         DIRECTADMIN SELECT VERSION BY KEN         #"
echo "#               FB.COM/HEXAN.OFFICIAL               #"
echo "#####################################################"
echo "#  ENGLISH    (en) SELECT YOUR LANGUAGE WHILE SETUP #"
echo "#####################################################"
echo "#  VIETNAMESE (vi) CHON NGON NGU CUA BAN KHI CAI    #"
echo "#####################################################"
echo ""

while [ "$TRUE_FALSE" = "n" ];
do
{
	echo "Nhap Vao Ngon Ngu Ma Ban Muon Hien Thi."
	echo -n "Enter The Language You Want To Display (en/vi): "
	read LANGUAGE;
	echo ""

	if [ "$LANGUAGE" = "en" ] || [ "$LANGUAGE" = "vi" ]; then
		echo "Lua Chon Ngon Ngu Thanh Cong."
		echo "Select Language Success."
		TRUE_FALSE="y";
		sleep 3;
		clear
	else
		echo "Lua Chon Ngon Ngu That Bai, Vui Long Chon Lai!"
		echo "Select Language Faild, Please Try Again!"
		TRUE_FALSE="n";
		sleep 3;
		clear
	fi
}
done;

rm -rf ${LANGUAGE}.sh
cd /root
$WGET_PATH -O /root/${LANGUAGE}.sh ${SERVER}/files/${LANGUAGE}.sh
chmod 777 /root/${LANGUAGE}.sh
clear
./${LANGUAGE}.sh
