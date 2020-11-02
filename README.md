# SpamChecker

Check ip/domain blacklist status with differents rbl servers

[![GitHub release](https://img.shields.io/github/v/release/matthernet/spamchecker)](https://github.com/matthernet/spamchecker/releases/)

### Installation:
    git clone https://github.com/matthernet/SpamChecker.git
    cd SpamChecker
    chmod +x ./spamchecker
    mv ./spamchecker /usr/bin

### Example of use:
    $ spamchecker target.tld
    $ spamchecker 1.1.1.1

### Output example:
    $ spamchecker target.tld
    Checking RBLs for target.tld
    target.tld listed in bl.nszones.com
    target.tld listed in dnsbl.justspam.org
    target.tld listed in spam.dnsbl.sorbs.net
    
    The report was generatd in /root/Desktop/target.tld-rbl-report

### Licensing:
SpamChecker is licensed under the GNU General Public License version 3 (GNU GPL v3).
