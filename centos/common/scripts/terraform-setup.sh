#!/bin/bash

mkdir -p $HOME/container/smeup-provider-fe/config
mkdir -p $HOME/container/smeup-provider-fe/log
mkdir -p $HOME/container/smeup-provider-fe/deployments

find terraform -type d -exec chmod 775 {} \;
find terraform -type f -exec chmod 664 {} \;

mkdir $HOME/bin
mv $HOME/update-provider $HOME/bin
chmod 774 $HOME/bin/update-provider

$HOME/bin/update-provider ${SMEUP_PROVIDER_VERSION}

cd $HOME/terraform/smeup-provider-fe
terraform init
terraform apply -auto-approve
