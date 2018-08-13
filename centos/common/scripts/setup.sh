#!/bin/bash
yum install -y yum-utils
yum install -y wget
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum -y install docker-ce unzip
usermod -a -G docker ${USERNAME}
systemctl enable docker
systemctl start docker
wget https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip -O terraform.zip
unzip terraform.zip -d /usr/local/bin
rm terraform.zip

cat << EOF > /etc/docker/daemon.json
{
  "bip": "172.17.179.1/26"
}
EOF
