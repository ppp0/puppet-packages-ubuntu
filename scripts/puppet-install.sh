#!/bin/bash
set -e
cd /tmp/
if [ "$EUID" != "0" ]; then
	echo "This script must be run as root." 1>&2;
	exit 1;
fi

if ! (dpkg -l lsb-release); then
	apt-get update && apt-get -y install lsb-release
fi

if (which lsb_release >/dev/null && lsb_release --id | grep -q "Ubuntu$"); then
	LSB_CODENAME=$(lsb_release --codename | sed 's/Codename:\t//')
	if (echo 'trusty precise utopic'| grep -q ${LSB_CODENAME}); then
		PUPPETLABS_REPO='puppetlabs-release'
	else
		#TODO: 15.04 is only available as a PC1 (pre-release-candidate?) dist right now - keep eye on it
		PUPPETLABS_REPO='puppetlabs-release-pc1'
	fi
	# 15.04 is only available as a PR1 (pre-release?) dist right now
	wget -q http://apt.puppetlabs.com/${PUPPETLABS_REPO}-${LSB_CODENAME}.deb
	dpkg -i ${PUPPETLABS_REPO}-${LSB_CODENAME}.deb
	rm ${PUPPETLABS_REPO}-${LSB_CODENAME}.deb
	apt-get update

	apt-get install -qy puppet facter

	cat > /etc/puppet/puppet.conf << EOF
[main]
confdir = /etc/puppet
ssldir = /etc/puppet/ssl
logdir = /var/log/puppet
rundir = /var/run/puppet
stringify_facts = false
EOF

else
	echo 'Your operating system is not supported' 1>&2
	exit 1
fi
