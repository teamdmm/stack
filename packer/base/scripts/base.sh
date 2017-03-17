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
        dhcpdump \
        filebeat

pip install awscli

mkdir -p /etc/environment
mkdir -p /etc/ecs

echo 'SERVER_ENVIRONMENT=production' >> /etc/environment
echo 'SERVER_GROUP=default' >> /etc/environment
echo 'SERVER_REGION=us-east-1' >> /etc/environment

echo 'ECS_CLUSTER=${name}' >> /etc/ecs/ecs.config
echo 'ECS_ENGINE_AUTH_TYPE=docker' >> /etc/ecs/ecs.config
echo 'ECS_ENGINE_AUTH_DATA={"https://index.docker.io/v1/":{"username":"superphone","password":"team2015$","email":"team@dmm.fm"}}
' >> /etc/ecs/ecs.config

apt-get dist-upgrade -y
