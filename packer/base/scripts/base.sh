#!/bin/bash
set -e

systemctl disable apt-daily.service
systemctl disable apt-daily.timer

apt-get update -y
apt-get upgrade -y

apt-get install -y \
        build-essential  \
        git \
        wget \
        dkms \
        apt-transport-https \
        ca-certificates \
        python-apt \
        python-pip \
        curl \
        netcat \
        ngrep \
        dstat \
        nmon \
        iptraf \
        iftop \
        iotop \
        atop \
        mtr \
        tree \
        unzip \
        sysdig \
        git \
        htop \
        jq \
        ntp \
        logrotate \
        dhcping \
        dhcpdump
# Install filebeat

echo "deb https://packages.elastic.co/beats/apt stable main" |  sudo tee -a /etc/apt/sources.list.d/beats.list
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
apt-get update -y
export DEBIAN_FRONTEND=noninteractive
sudo apt-get -o Dpkg::Options::="--force-confnew" install -y filebeat


pip install awscli

apt-get dist-upgrade -y
