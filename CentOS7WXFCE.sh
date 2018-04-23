#!/bin/bash
#XFCE
yum install -y epel-release
yum groupinstall -y "Xfce"
yum install -y xrdp
systemctl enable xrdp
systemctl start xrdp
firewall-cmd --add-port=3389/tcp --permanent
cd
echo "xfce4-session" > ~/.Xclients
chmod a+x ~/.Xclients
#Docker
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce
systemctl start docker
curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
#GIT
yum install -y git
#MIDORI Browser
wget http://awel.domblogger.net/7/base/noarch/awel-release-7-2.noarch.rpm
rpm -Uvh awel-release-7-2.noarch.rpm
sed -i ':a;N;$!ba;s/enabled=0/enabled=1/2'  /etc/yum.repos.d/awel.repo
sed -i ':a;N;$!ba;s/enabled=0/enabled=1/3'  /etc/yum.repos.d/awel.repo
yum install -y midori
