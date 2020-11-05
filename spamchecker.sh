#!/bin/bash

# SpamChecker v0.3.0

target=$1

checker() {

echo ""
echo "Checking RBLs for $target"

IIP=$(echo $ip|awk -F"." '{for(i=NF;i>0;i--) printf i!=1?$i".":"%s",$i}')
RBL="0spam.fusionzero.com 0spamurl.fusionzero.com abuse.rfc-clueless.org access.redhawk.org all.rbl.jp all.s5h.net all.spamrats.com aspews.ext.sorbs.net babl.rbl.webiron.net backscatter.spameatingmonkey.net badconf.rhsbl.sorbs.net b.barracudacentral.org bb.barracudacentral.org black.junkemailfilter.com blacklist.woody.ch bl.blocklist.de bl.drmx.org bl.fmb.la bl.konstant.no bl.mailspike.net bl.nosolicitado.org bl.nszones.com block.dnsbl.sorbs.net bl.rbl.scrolloutf1.com bl.scientificspam.net bl.score.senderscore.com bl.spamcop.net bl.spameatingmonkey.net bl.suomispam.net bogusmx.rfc-clueless.org bsb.empty.us bsb.spamlookup.net cart00ney.surriel.com cbl.abuseat.org cbl.anti-spam.org.cn cblless.anti-spam.org.cn cblplus.anti-spam.org.cn cdl.anti-spam.org.cn combined.abuse.ch combined.rbl.msrbl.net communicado.fmb.la dbl.suomispam.net db.wpbl.info dnsbl-0.uceprotect.net dnsbl-1.uceprotect.net dnsbl-2.uceprotect.net dnsbl-3.uceprotect.net dnsblchile.org dnsbl.cobion.com dnsbl.dronebl.org dnsbl.inps.de dnsbl.justspam.org dnsbl.kempt.net dnsbl.madavi.de dnsbl.net.ua dnsbl.rv-soft.info dnsbl.rymsho.ru dnsbl.sorbs.net dnsbl.tornevall.org dnsbl.zapbl.net dnsrbl.org dnsrbl.swinog.ch dob.sibl.support-intelligence.net drone.abuse.ch dsn.rfc-clueless.org duinv.aupads.org dul.dnsbl.sorbs.net dul.ru dwl.dnswl.org dyna.spamrats.com dyn.nszones.com elitist.rfc-clueless.org escalations.dnsbl.sorbs.net ex.dnsbl.org fnrbl.fast.net forbidden.icm.edu.pl fresh10.spameatingmonkey.net fresh15.spameatingmonkey.net fresh.spameatingmonkey.net fulldom.rfc-clueless.org hostkarma.junkemailfilter.com httpbl.abuse.ch http.dnsbl.sorbs.net iddb.isipp.com images.rbl.msrbl.net in.dnsbl.org invaluement ipbl.mailhosts.org ips.backscatterer.org ipwl.mailhosts.org ix.dnsbl.manitu.net korea.services.net l1.bbfh.ext.sorbs.net l1.spews.dnsbl.sorbs.net l2.bbfh.ext.sorbs.net l2.spews.dnsbl.sorbs.net l3.bbfh.ext.sorbs.net l4.bbfh.ext.sorbs.net list.bbfh.org mail-abuse.blacklist.jippg.org mailsl.dnsbl.rjek.com misc.dnsbl.sorbs.net multi.surbl.org netscan.rbl.blockedservers.com new.spam.dnsbl.sorbs.net nobl.junkemailfilter.com nomail.rhsbl.sorbs.net noptr.spamrats.com nsbl.fmb.la old.spam.dnsbl.sorbs.net orvedb.aupads.org pbl.spamhaus.org phishing.rbl.msrbl.net pofon.foobar.hu postmaster.rfc-clueless.org problems.dnsbl.sorbs.net proxies.dnsbl.sorbs.net psbl.surriel.com public.sarbl.org rbl2.triumf.ca rbl.abuse.ro rbl.blockedservers.com rbl.choon.net rbl.dns-servicios.com rbl.efnet.org rbl.efnetrbl.org rbl.interserver.net rbl.orbitrbl.com rbl.realtimeblacklist.com rbl.schulte.org recent.spam.dnsbl.sorbs.net relays.bl.kundenserver.de relays.dnsbl.sorbs.net rep.mailspike.net reputation-domain.rbl.scrolloutf1.com reputation-ns.rbl.scrolloutf1.com rhsbl.rymsho.ru rhsbl.scientificspam.net rhsbl.sorbs.net rhsbl.zapbl.net rsbl.aupads.org rwl.choon.net safe.dnsbl.sorbs.net sa.fmb.la sbl.spamhaus.org sbl-xbl.spamhaus.org short.fmb.la short.rbl.jp smtp.dnsbl.sorbs.net socks.dnsbl.sorbs.net spam.abuse.ch spam.dnsbl.anonmails.de spam.dnsbl.sorbs.net spamguard.leadmon.net spamlist.or.kr spam.pedantic.org spam.rbl.blockedservers.com spamrbl.imp.ch spam.rbl.msrbl.net spamsources.fabel.dk spam.spamrats.com srn.surgate.net stabl.rbl.webiron.net st.technovision.dk talosintelligence.com tor.dan.me.uk tor.efnet.org torexit.dan.me.uk truncate.gbudb.net ubl.nszones.com ubl.unsubscore.com uribl.abuse.ro uri.blacklist.woody.ch uribl.pofon.foobar.hu uribl.spameatingmonkey.net uribl.zeustracker.abuse.ch urired.spameatingmonkey.net urlsl.dnsbl.rjek.com virbl.dnsbl.bit.nl virus.rbl.jp virus.rbl.msrbl.net web.dnsbl.sorbs.net web.rbl.msrbl.net whois.rfc-clueless.org wormrbl.imp.ch xbl.spamhaus.org zen.spamhaus.org z.mailspike.net zombie.dnsbl.sorbs.net"

for rbl in $RBL ;do
	host $IIP.$rbl | grep -i address > /dev/null
	if [ $? -eq 0 ]; then
		tput setaf 1
		echo "$ip listed in $rbl" | tee -a $PWD/$target-rbl-report
		tput sgr0
	else
		echo " " > /dev/null
	fi
done

if [ -a $PWD/$target-rbl-report ]; then
	echo ""
	echo "The report was generatd in $PWD/$target-rbl-report"
else
	echo ""
	tput setaf 2
	echo "No blacklisting was found"
	tput sgr0
fi
}

if [ -z $1 ]; then
	echo "Please specify ip or domain" && exit
else
	echo $1 | grep '[[:alpha:]]' > /dev/null
	if [ $? -eq 0 ]; then
		mx=`host $1 | grep mail | head -n1 | awk '{print $7}'`
		ip=`host $mx| head -n1 | awk '{print $4}'`
		checker $ip
	else
		ip=$1
		checker $ip
	fi
fi
