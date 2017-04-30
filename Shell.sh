#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
clear;
#==========================================================================
Welcome='      
==========================================================================
                               Shell Encrypt 
                               
                         Powered by 52Fancy 2015-2016                     
                              All Rights Reserved                  
                                                                            
==========================================================================
';
echo "$Welcome";
echo -n "Please Input Script Name :  "
read Name
if [ -z $Name ]
	then
		echo -n " Script Name is Null "
		read Name
	if [ -z $Name ]
	    then
		    echo "Script Name Can't Be Read "
		    exit 0;
	    fi	
fi
if [ ! -e "$Name" ]
    then
	    echo "Script Name Can't be Found "
		exit 0;
fi
echo "Please Waiting .........."
yum install -y gcc-c++ gcc automake autoconf libtool make >/dev/null 2>&1
if [ ! -e "/usr/local/man/man1/" ]
then
mkdir -p /usr/local/man/man1/ >/dev/null 2>&1
fi
wget http://www.datsi.fi.upm.es/~frosal/sources/shc-3.8.9b.tgz >/dev/null 2>&1
tar zxvf shc-3.8.9b.tgz >/dev/null 2>&1
rm -f shc-3.8.9b.tgz
cd shc-3.8.9b >/dev/null 2>&1
make install <<EOF
y
EOF
cd - >/dev/null 2>&1
rm -rf shc-3.8.9b >/dev/null 2>&1

CFLAGs=-static shc -r -T -f $Name
if [ ! -e "$Name.x.c" ]
    then
	    echo "Shell Encrypt Fail !"
		exit 0;
fi		
mv $Name $Name.bak
gcc $Name.x.c -o $Name >/dev/null 2>&1
gzexe $Name >/dev/null 2>&1
rm -f $Name.x $Name.x.c $Name~ >/dev/null 2>&1
echo "Shell Encrypt Complete !"
exit 0;
