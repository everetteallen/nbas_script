#!/bin/sh
# Assumes NFS netinstall from OS X server, with tftp and nfs server on same machine, and trying only 1 time.
# Also assumes delivery from Casper where $1-$3 are already taken
#setup inputs
#Everette_Allen@ncsu.edu
#
nbserver=""
nbi=""
ndmg=""

# CHECK TO SEE IF A VALUE WAS PASSED IN PARAMETER 4 AND, IF SO, ASSIGN TO "nbserver"
if [ "$4" != "" ] && [ "$nbserver" == "" ]; then
    nbserver=$4
fi

if ["$nbserver" == ""]; then
echo "Error:  The NetInstall server address is blank.  Please specify a NetInstall server IP Address or DNS name to boot from."
	exit 1
fi

# CHECK TO SEE IF A VALUE WAS PASSED IN PARAMETER 5 AND, IF SO, ASSIGN TO "nbi"
if [ "$5" != "" ] && [ "$nbi" == "" ]; then
    nbi=$5
    else
    nbi="nuke"
fi

# CHECK TO SEE IF A VALUE WAS PASSED IN PARAMETER 6 AND, IF SO, ASSIGN TO "ndmg"
if [ "$6" != "" ] && [ "$ndmg" == "" ]; then
    ndmg=$6
else
ndmg="NetInstall"
fi

#issue the bless command
echo "Status: starting bless command"
/usr/sbin/bless --verbose --netboot --booter "tftp://$nbserver/NetBoot/NetBootSP0/$nbi.nbi/i386/booter" --kernelcache "tftp://$nbserver/NetBoot/NetBootSP0/$nbi.nbi/i386/x86_64/kernelcache" --options "rp=nfs:$nbserver:/private/tftpboot/NetBoot/NetBootSP0:$nbi.nbi/$ndmg.dmg" --nextonly

echo "Status bless command finished."
exit 0


