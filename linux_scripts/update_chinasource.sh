#!/bin/bash
# for apt
command -v figlet
if [ $? -eq 0 ]; then
    figlet -c UPDATE SOURCE
else
    echo "######################################"
    echo THIS SCRITPT IS USDE FOR UPDATE SOURCE
    echo "######################################"
fi

grep -q ustc /etc/apt/sources.list
if [ $? -eq 1 ]; then
    echo start to update apt source
    mv /etc/apt/sources.list /etc/apt/sources.list.bak
    cat <<EOF >/etc/apt/sources.list
deb http://mirrors.ustc.edu.cn/debian stable main contrib non-free
deb http://mirrors.ustc.edu.cn/debian stable-updates main contrib non-free
EOF
apt update
echo if update meet NO_PUBKEY!!!
echo W: GPG error: http://mirrors.aliyun.com/ubuntu focal InRelease: The following signatures
echo couldnt be verified because the public key is not available:
echo NO_PUBKEY 3B4FE6ACC0B21F32 NO_PUBKEY 871920D1991BC93C
echo please use: [ apt-key adv --keyserver keyserver.ubuntu.com --recv-keys PUBKEY_VALUE ] 
else
    echo apt-source have been update
fi


