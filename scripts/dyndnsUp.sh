#!/bin/bash
# Copyright © 2005-2007 - Julien Valroff <julien@kirya.net>
# Parts of the script Copyright © 2001-2002 - Dag Wieers <dag@wieers.com>
 
# KEY="/home/ken/privkeys/Khome.kenh.fr.+157+08148.private"
source /home/ken/privkeys/dynkenh_key.priv  #loads the KEY var
SERVER="ns341354.ip-46-105-97.eu"
ZONE="dyn.kenh.fr"
RR="home.$ZONE."
# IPADDR=$(curl https://dev.ananas.space/ip/)
IPADDR=$(curl https://api.ipify.org)
ADMIN="dyndns@kenh.fr"
LOGFILE="/home/ken/privkeys/dnslog.log"
 
(
cat <<EOF | nsupdate -y "$KEY" -v
server $SERVER
zone $ZONE
update delete $RR A
update add $RR 60 A $IPADDR
send
EOF

RC=$?

if [ $RC != 0 ]; then
    echo "$(LANG=C date +'%b %e %X') $(hostname) ddupdate[$$]: FAILURE: Updating dynamic IP $IPADDR on $SERVER failed (RC=$RC)"
    (   echo "Subject: DDNS update failed"
        echo
        echo "Updating dynamic IP $IPADDR on $SERVER failed (RC=$RC)"
    ) | mail -v -s "Fail on dyndns" -r "DynDNSUp<weegeeserv@gmail.com>" $ADMIN
else
    echo "$(LANG=C date +'%b %e %X') $(hostname) ddupdate[$$]: SUCCESS: Updating dynamic IP $IPADDR on $SERVER succeeded"
fi
) >>$LOGFILE 2>&1
 
exit $RC
