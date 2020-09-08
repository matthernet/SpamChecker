#!/bin/bash

# Usage: ./spamchecker.sh <ip>

ip="$1"

# Check if the value is empty
if [ -z $ip ]; then
	echo "Please enter a ip" && exit
else

echo ""
echo "Checking RBLs"

# CHANGE IP NOTATION
IIP=$(echo $ip|awk -F"." '{for(i=NF;i>0;i--) printf i!=1?$i".":"%s",$i}')

# RBL SERVER LIST
RBL="b.barracudacentral.org bl.spamcop.net pbl.spamhaus.org sbl.spamhaus.org xbl.spamhaus.org zen.spamhaus.org dnsbl.ahbl.org ircbl.ahbl.org rhsbl.ahbl.org ips.backscatterer.org bl.blocklist.de bsb.empty.us dnsbl.burnt-tech.com cblless.anti-spam.org.cn cbl.abuseat.org dnsblchile.org rbl.choon.net rwl.choon.net tor.dan.me.uk rbl.dns-servicios.com bl.drmx.org dul.ru rbl.efnetrbl.org spamsources.fabel.dk forbidden.icm.edu.pl dnsrbl.swinog.ch dnsbl.inps.de rbl.interserver.net dnsbl.kempt.net ubl.unsubscore.com spamguard.leadmon.net dnsbl.madavi.de ipwl.mailhosts.org ipbl.mailhosts.org z.mailspike.net bl.mailspike.net rsbl.aupads.org orvedb.aupads.org duinv.aupads.org 0spam.fusionzero.com psbl.surriel.com spam.spamrats.com all.rbl.jp rbl.schulte.org backscatter.spameatingmonkey.net bl.spameatingmonkey.net fresh.spameatingmonkey.net uribl.spameatingmonkey.net urired.spameatingmonkey.net spam.dnsbl.sorbs.net korea.services.net rbl2.triumf.ca truncate.gbudb.net ips.backscatterer.org virbl.dnsbl.bit.nl db.wpbl.info l1.spews.dnsbl.sorbs.net l2.spews.dnsbl.sorbs.net"

echo "SpamChecker" > $PWD/rbl-list-$ip
echo " " >> $PWD/rbl-list-$ip

# CHEK RBLs
for rbl in $RBL ;do

host $IIP.$rbl | grep not > /dev/null

if [ $? -eq 0 ]; then
	echo "$ip not listed in $rbl"
else
	echo "$ip listed in $rbl" | tee -a $PWD/rbl-list-$ip
fi

done

if [ -a $PWD/rbl-list-$ip ]; then
	echo ""
	echo "It was generated a report of the listed IPs in $PWD/rbl-list-$ip"
else
	exit
fi

fi
