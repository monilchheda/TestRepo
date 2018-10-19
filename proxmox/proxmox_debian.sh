echo "deb http://download.proxmox.com/debian/pve stretch pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list
wget http://download.proxmox.com/debian/proxmox-ve-release-5.x.gpg -O /etc/apt/trusted.gpg.d/proxmox-ve-release-5.x.gpg
apt update -y 
apt dist-upgrade -y
apt-get install -y libssl-dev libpam-dev build-essential proxmox-ve postfix open-iscsi iptables-persistent
iptables -I INPUT -p tcp  --dport 111 -j DROP
iptables -I INPUT -p tcp  --dport 111 -j REJECT
iptables-save > /etc/iptables/rules.v4
sysctl -w net.ipv4.ip_forward=1
cd /var/lib/vz/template/iso
wget https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso
wget https://the-eye.eu/public/MSDN/Windows%20Server%202016/en_windows_server_2016_x64_dvd_9718492.iso
systemctl stop rpcbind
systemctl disable rpcbind
cd
wget https://dl.duosecurity.com/duo_unix-latest.tar.gz
tar zxf duo_unix-latest.tar.gz
cd duo_unix-1.10.5/
./configure --with-pam --prefix=/usr && make && make install
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bkp
