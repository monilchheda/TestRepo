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
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce
systemctl start docker
curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
yum install -y git
cd
mkdir nodeapp
cd nodeapp
git clone https://github.com/cwbuecheler/node-tutorial-for-frontend-devs
mv node-tutorial-for-frontend-devs/*.* .
mv node-tutorial-for-frontend-devs/* .
rm -fr node-tutorial-for-frontend-devs
cd
wget https://downloads.mongodb.com/compass/mongodb-compass-1.12.5.x86_64.rpm
yum install -y lsb-core-noarch libXScrnSaver
rpm -Uvh mongodb-compass-1.12.5.x86_64.rpm
wget http://awel.domblogger.net/7/base/noarch/awel-release-7-2.noarch.rpm
rpm -Uvh awel-release-7-2.noarch.rpm
