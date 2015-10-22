#!/bin/bash -e

if (echo 'trusty precise utopic' | grep -q <%= @lsbdistcodename %>); then
	PUPPETLABS_REPO='puppetlabs-release'
else
	#TODO: 15.04 is only available as a PC1 (pre-release-candidate?) dist right now - keep eye on it
	PUPPETLABS_REPO='puppetlabs-release-pc1'
fi
curl -Ls http://apt.puppetlabs.com/$PUPPETLABS_REPO-<%= @lsbdistcodename %>.deb > $PUPPETLABS_REPO-<%= @lsbdistcodename %>.deb
dpkg -i $PUPPETLABS_REPO-<%= @lsbdistcodename %>.deb
apt-get update
