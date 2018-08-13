da powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All


see these templates
https://github.com/marcinbojko/hv-packer

https://4sysops.com/archives/native-nat-in-windows-10-hyper-v-using-a-nat-virtual-switch/

http://www.dhcpserver.de/cms/download/


http://www.dhcpserver.de/cms/wp-content/plugins/download-attachments/includes/download.php?id=625

boot command for generation 2 machine (EFI):

c  setparams 'kickstart' <enter> linuxefi /images/pxeboot/vmlinuz inst.stage2=hd:LABEL=CentOS\\x207\\x20x\\86_64 inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg<enter> initrdefi /images/pxeboot/initrd.img<enter> boot<enter>