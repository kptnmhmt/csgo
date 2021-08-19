#!/bin/bash

sudo apt -y update
sudo apt -y upgrade
sudo apt -y dist-upgrade
sudo apt -y autoremove
sudo apt autoclean

sudo fallocate -l 16G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.conf
echo 'vm.vfs_cache_pressure=50' | sudo tee -a /etc/sysctl.conf
echo 'vm.dirty_ratio=80' | sudo tee -a /etc/sysctl.conf

net.core.somaxconn = 1000
net.core.netdev_max_backlog = 5000
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216
net.ipv4.tcp_wmem = 4096 12582912 16777216
net.ipv4.tcp_rmem = 4096 12582912 16777216
net.ipv4.tcp_max_syn_backlog = 8096
net.ipv4.tcp_slow_start_after_idle = 0
net.ipv4.tcp_tw_reuse = 1
net.ipv4.ip_local_port_range = 10240 65535

sudo sysctl -p

sudo dpkg --add-architecture i386
sudo apt -y update
sudo apt -y install \
\
unzip \
binutils \
jq \
netcat \
lib32gcc1 \
lib32stdc++6 \
steamcmd \
libsdl2-2.0-0:i386 \
curl \
wget \
ca-certificates \
file \
bsdmainutils \
util-linux \
python3 \
tar \
bzip2 \
gzip \
bc \
tmux

echo -e "Steamden token alınarak common.cfg içerisine eklenmesi gerekiyor\n fastdl install edilirse şükela olur";

sudo adduser --disabled-password --gecos "" csgoserver
su - csgoserver
wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh csgoserver
./csgoserver auto-install
