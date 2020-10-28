#!/bin/bash

# SpamChecker v0.2.0

ip="$1"

if [ -z $ip ]; then
	echo "Please enter a ip" && exit
else

echo ""
echo "Checking RBLs"

IIP=$(echo $ip|awk -F"." '{for(i=NF;i>0;i--) printf i!=1?$i".":"%s",$i}')

RBL="0spam.fusionzero.com access.redhawk.org all.rbl.jp all.spamrats.com aspews.ext.sorbs.net backscatter.spameatingmonkey.net b.barracudacentral.org bb.barracudacentral.org blacklist.woody.ch bl.blocklist.de bl.drmx.org bl.mailspike.net block.dnsbl.sorbs.net bl.spamcop.net bl.spameatingmonkey.net bsb.empty.us cbl.abuseat.org cbl.anti-spam.org.cn cblless.anti-spam.org.cn cblplus.anti-spam.org.cn cdl.anti-spam.org.cn combined.abuse.ch db.wpbl.info dnsbl-0.uceprotect.net dnsbl-1.uceprotect.net dnsbl-2.uceprotect.net dnsbl-3.uceprotect.net dnsbl.ahbl.org dnsbl.burnt-tech.com dnsblchile.org dnsbl.inps.de dnsbl.kempt.net dnsbl.madavi.de dnsbl.sorbs.net dnsrbl.swinog.ch drone.abuse.ch duinv.aupads.org dul.dnsbl.sorbs.net dul.ru dyna.spamrats.com escalations.dnsbl.sorbs.net forbidden.icm.edu.pl fresh.spameatingmonkey.net httpbl.abuse.ch http.dnsbl.sorbs.net ipbl.mailhosts.org ips.backscatterer.org ipwl.mailhosts.org ircbl.ahbl.org korea.services.net l1.bbfh.ext.sorbs.net l1.spews.dnsbl.sorbs.net l2.bbfh.ext.sorbs.net l2.spews.dnsbl.sorbs.net l3.bbfh.ext.sorbs.net l4.bbfh.ext.sorbs.net list.bbfh.org mail-abuse.blacklist.jippg.org misc.dnsbl.sorbs.net new.spam.dnsbl.sorbs.net noptr.spamrats.com old.spam.dnsbl.sorbs.net orvedb.aupads.org pbl.spamhaus.org problems.dnsbl.sorbs.net proxies.dnsbl.sorbs.net psbl.surriel.com rbl2.triumf.ca rbl.choon.net rbl.dns-servicios.com rbl.efnet.org rbl.efnetrbl.org rbl.interserver.net rbl.orbitrbl.com rbl.schulte.org recent.spam.dnsbl.sorbs.net relays.bl.kundenserver.de relays.dnsbl.sorbs.net rhsbl.ahbl.org rsbl.aupads.org rwl.choon.net safe.dnsbl.sorbs.net sbl.spamhaus.org sbl-xbl.spamhaus.org short.rbl.jp smtp.dnsbl.sorbs.net socks.dnsbl.sorbs.net spam.abuse.ch spam.dnsbl.sorbs.net spamguard.leadmon.net spamrbl.imp.ch spamsources.fabel.dk spam.spamrats.com tor.dan.me.uk tor.efnet.org torexit.dan.me.uk truncate.gbudb.net ubl.unsubscore.com uribl.spameatingmonkey.net urired.spameatingmonkey.net virbl.dnsbl.bit.nl virus.rbl.jp web.dnsbl.sorbs.net wormrbl.imp.ch xbl.spamhaus.org zen.spamhaus.org z.mailspike.net zombie.dnsbl.sorbs.net"
echo "SpamChecker:" > $PWD/rbl-list-$ip
echo " " >> $PWD/rbl-list-$ip

for rbl in $RBL ;do

host $IIP.$rbl | grep -i address > /dev/null

if [ $? -eq 0 ]; then
	echo "$ip listed in $rbl" | tee -a $PWD/rbl-list-$ip
else
	echo " " > /dev/null
fi

done

if [ -a $PWD/rbl-list-$ip ]; then
	echo ""
	echo "The report was generatd in $PWD/rbl-list-$ip"
else
	exit
fi

fi

echo ""
