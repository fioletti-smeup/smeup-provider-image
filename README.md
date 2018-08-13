# Smeup Provider Image

## Prerequisite

Install virtualbox.

Install packer following this `Getting started` guide:

https://www.packer.io/intro/getting-started/install.html


Position yourself in the desired directory depending on if you want a virtualbox or vmware machine

## Validate packer template

Validate the template with:

```
packer validate -var-file ../common/vars.json template.json
```

## Build packer template

To build just change `validate` to `build` in the preceding commands:

```
packer build -var-file ../common/vars.json template.json
```
If the process terminate without errors you can import the ova appliance in your virtualbox.

### Note
If you want to access to logs of container you have to open a shell in the running docker. You can do this from the host console with the following command
```
docker exec -it smeup-provider /bin/sh
```
### Note
If you want be able to connect directly to the running docker container you have to configurate a second network interface in Global Tools of Virtualbox whit "host only" properties and "DHCP Server" enabled, then you need to connect it in the network configuration of the Host virtual machine

### Useful links

http://sanbarrow.com/vmx/vmx-guestos.html

