#!/bin/bash
yum install -y epel-release
yum groupinstall -y "Xfce"
yum install -y xrdp
systemctl enable xrdp
systemctl start xrdp
firewall-cmd --add-port=3389/tcp --permanent
cd
echo "xfce4-session" > ~/.Xclients
chmod a+x ~/.Xclients
