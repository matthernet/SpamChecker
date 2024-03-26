#!/bin/bash

# SpamChecker v0.3.0

target=$1

checker() {

echo ""
echo "Checking RBLs for $target"

IIP=$(echo $ip| awk -F. '{print $4"."$3"."$2"."$1""}')
RBL="0spam.fusionzero.com 0spamurl.fusionzero.com _vouch.dwl.spamhaus.org abuse.rfc-clueless.org abuse.spfbl.net access.redhawk.org all.rbl.jp all.s5h.net all.spamrats.com aspews.ext.sorbs.net b.barracudacentral.org babl.rbl.webiron.net backscatter.spameatingmonkey.net badconf.rhsbl.sorbs.net bb.barracudacentral.org bl-ip.rbl.scrolloutf1.com bl.0spam.org bl.blocklist.de bl.drmx.org bl.fmb.la bl.konstant.no bl.mailspike.net bl.mxrbl.com bl.nordspam.com bl.nosolicitado.org bl.nszones.com bl.rbl.scrolloutf1.com bl.scientificspam.net bl.score.senderscore.com bl.spamcop.net bl.spameatingmonkey.net bl.suomispam.net bl.tiopan.com bl.worst.nosolicitado.org black.dnsbl.brukalai.lt black.junkemailfilter.com black.mail.abusix.zone black.uribl.com blackholes.wirehub.net blacklist.sci.kun.nl blacklist.woody.ch block.dnsbl.sorbs.net blocked.hilli.dk bogons.cymru.com bogusmx.rfc-clueless.org bsb.empty.us bsb.spamlookup.net cart00ney.surriel.com cbl.abuseat.org cbl.anti-spam.org.cn cblless.anti-spam.org.cn cblplus.anti-spam.org.cn cdl.anti-spam.org.cn combined.abuse.ch combined.rbl.msrbl.net communicado.fmb.la d.bl.zenrbl.pl db.wpbl.info dbl.nordspam.com dbl.spamhaus.org dbl.suomispam.net dev.null.dk dialup.blacklist.jippg.org dialups.mail-abuse.org dialups.visi.com dnsbl-0.uceprotect.net dnsbl-1.uceprotect.net dnsbl-2.uceprotect.net dnsbl-3.uceprotect.net dnsbl.abuse.ch dnsbl.anticaptcha.net dnsbl.antispam.or.id dnsbl.calivent.com.pe dnsbl.cobion.com dnsbl.darklist.de dnsbl.dronebl.org dnsbl.inps.de dnsbl.justspam.org dnsbl.kempt.net dnsbl.madavi.de dnsbl.net.ua dnsbl.rv-soft.info dnsbl.rymsho.ru dnsbl.sorbs.net dnsbl.spfbl.net dnsbl.tornevall.org dnsbl.zapbl.net dnsblchile.org dnsrbl.org dnsrbl.swinog.ch dnswl.spfbl.net dob.sibl.support-intelligence.net drone.abuse.ch dsn.rfc-clueless.org duinv.aupads.org dul.dnsbl.sorbs.net dul.ru dun.dnsrbl.net dwl.dnswl.org dyn.nszones.com dyna.spamrats.com elitist.rfc-clueless.org escalations.dnsbl.sorbs.net ex.dnsbl.org exploit.mail.abusix.zone fnrbl.fast.net forbidden.icm.edu.pl fresh.spameatingmonkey.net fresh10.spameatingmonkey.net fresh15.spameatingmonkey.net fresh30.spameatingmonkey.net freshzero.spameatingmonkey.net fulldom.rfc-clueless.org grey.uribl.com hil.habeas.com hostkarma.junkemailfilter.com http.dnsbl.sorbs.net httpbl.abuse.ch iddb.isipp.com images.rbl.msrbl.net in.dnsbl.org intruders.docs.uu.se invaluement ipbl.mailhosts.org ips.backscatterer.org ipwl.mailhosts.org ix.dnsbl.manitu.net JustSpam.org korea.services.net krn.korumail.com l1.bbfh.ext.sorbs.net l1.spews.dnsbl.sorbs.net l2.bbfh.ext.sorbs.net l2.spews.dnsbl.sorbs.net l3.bbfh.ext.sorbs.net l4.bbfh.ext.sorbs.net light.dnsbl.brukalai.lt list.bbfh.org mail-abuse.blacklist.jippg.org mailsl.dnsbl.rjek.com misc.dnsbl.sorbs.net msgid.bl.gweep.ca multi.uribl.com netscan.rbl.blockedservers.com new.dnsbl.sorbs.net new.spam.dnsbl.sorbs.net no-more-funn.moensted.dk nobl.junkemailfilter.com nomail.rhsbl.sorbs.net noptr.spamrats.com nsbl.fmb.la nuribl.mailcleaner.net old.dnsbl.sorbs.net old.spam.dnsbl.sorbs.net opm.tornevall.org orvedb.aupads.org pbl.spamhaus.org phishing.rbl.msrbl.net pofon.foobar.hu postmaster.rfc-clueless.org problems.dnsbl.sorbs.net proxies.dnsbl.sorbs.net proxy.bl.gweep.ca psbl.surriel.com pss.spambusters.org.ar public.sarbl.org rbl.abuse.ro rbl.blockedservers.com rbl.choon.net rbl.dns-servicios.com rbl.efnet.org rbl.efnetrbl.org rbl.interserver.net rbl.orbitrbl.com rbl.realtimeblacklist.com rbl.schulte.org rbl.snark.net rbl.talkactive.net rbl2.triumf.ca recent.dnsbl.sorbs.net recent.spam.dnsbl.sorbs.net red.uribl.com relays.bl.gweep.ca relays.bl.kundenserver.de relays.dnsbl.sorbs.net relays.mail-abuse.org relays.nether.net rep.mailspike.net reputation-domain.rbl.scrolloutf1.com reputation-ns.rbl.scrolloutf1.com rhsbl-h.rbl.polspam.pl rhsbl.rbl.polspam.pl rhsbl.rymsho.ru rhsbl.scientificspam.net rhsbl.sorbs.net rhsbl.zapbl.net rsbl.aupads.org rwl.choon.net sa.fmb.la safe.dnsbl.sorbs.net sbl-xbl.spamhaus.org sbl.spamhaus.org score.spfbl.net short.fmb.la short.rbl.jp smtp.dnsbl.sorbs.net socks.dnsbl.sorbs.net spam.abuse.ch spam.dnsbl.anonmails.de spam.dnsbl.sorbs.net spam.olsentech.net spam.pedantic.org spam.rbl.blockedservers.com spam.rbl.msrbl.net spam.spamrats.com spamguard.leadmon.net spamlist.or.kr spamrbl.imp.ch spamsources.fabel.dk spamurl.fusionzero.com srn.surgate.net st.technovision.dk stabl.rbl.webiron.net talosintelligence.com tor.dan.me.uk tor.efnet.org torexit.dan.me.uk truncate.gbudb.net ubl.nszones.com ubl.unsubscore.com uri.blacklist.woody.ch uribl.abuse.ro uribl.mailcleaner.net uribl.pofon.foobar.hu uribl.rspamd.com uribl.spameatingmonkey.net uribl.swinog.ch uribl.zeustracker.abuse.ch urired.spameatingmonkey.net urlsl.dnsbl.rjek.com virbl.dnsbl.bit.nl virus.rbl.jp virus.rbl.msrbl.net web.dnsbl.sorbs.net web.rbl.msrbl.net white.dnsbl.brukalai.lt white.uribl.com whois.rfc-clueless.org whois.rfc-ignorant.org wormrbl.imp.ch xbl.spamhaus.org z.mailspike.net zen.spamhaus.org zombie.dnsbl.sorbs.net"

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
	echo "Please specify IP or domain" && exit
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
