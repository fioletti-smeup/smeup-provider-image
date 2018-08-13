#!/bin/bash

cd /etc/yum.repos.d/

wget http://repos.systemmonitor.eu.com/rmmagent/CentOS_7/rmmagent.repo

yum -y install rmmagent.x86_64
