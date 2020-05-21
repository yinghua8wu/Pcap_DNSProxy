#!/bin/bash

sudo apt update
sudo apt install build-essential cmake libevent-dev libpcap-dev libsodium-dev openssl libssl-dev git dnsutils nscd -y

sudo git clone https://github.com/yinghua8wu/Pcap_DNSProxy.git
cd Pcap_DNSProxy/Source/Auxiliary/Scripts
sudo chmod +x CMake_Build_ubuntu1804.sh
sudo ./CMake_Build_ubuntu1804.sh
cp -r /root/Pcap_DNSProxy/Source/Release /usr/local/Pcap_DNSProxy

sudo systemctl disable systemd-resolved.service
sudo service systemd-resolved stop

cd /usr/local/Pcap_DNSProxy
sudo ./Linux_Install.Systemd.sh

echo "nameserver 127.0.0.1" > /etc/resolv.conf && /etc/init.d/nscd restart
