#!/bin/bash

wget https://download.teamviewer.com/download/linux/teamviewer-host.x86_64.rpm
yum -y install epel-release
yum -y install ./teamviewer-host*.rpm
rm -f teamviewer-host*.rpm
