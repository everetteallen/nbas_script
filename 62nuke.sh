#!/bin/sh
## Netboots at 10.6.8 system to 10.7+ nbi named nuke.nbi
##
bless --netboot  --booter tftp://152.1.224.46/NetBoot/NetBootSP0/nuke.nbi/i386/booter --kernel tftp://152.1.224.46/NetBoot/NetBootSP0/nuke.nbi/i386/x86_64/kernelcache --options "rp=nfs:152.1.224.46:/private/tftpboot/NetBoot/NetBootSP0:nuke.nbi/NetBoot.dmg"
nvram "$( nvram efi-boot-file | sed -E 's/^efi-boot-file[[:space:]]*/efi-boot-kernelcache=/' )"
nvram -d efi-boot-file
nvram boot-args="-v"
#reboot
exit 0