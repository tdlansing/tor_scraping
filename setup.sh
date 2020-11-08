#!/bin/bash

if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

echo ""
echo "Beginning setup."

echo ""
echo "Updating Linux packages list."
apt-get update -y
echo ""
echo "Installing TOR if not installed."
apt-get install -y tor
#
# Uncomment the following lines if using Python to perform webpage scraping.
# and they are needed. Python seems to be common and the requests library
# will likely nbe needed.
#
#echo ""
#echo "Installing pip if not installed."
#apt-get install -y python3-pip
#echo ""
#echo "Installing Python3 requests if not installed."
#pip3 install requests

echo ""
echo "------------------------------------------------------------------------"
echo "Before continuing please make the following changes to '/etc/tor/torrc'."
echo "Uncomment 'ControlPort 9051'."
echo "Set 'CookieAuthentication 0'."
echo ""
echo "And, restart TOR with 'sudo /etc/init.d/tor restart'."
echo "------------------------------------------------------------------------"
echo ""
echo "To start the program type './check_websites.sh'."
echo ""
