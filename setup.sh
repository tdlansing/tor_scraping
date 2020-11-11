#!/bin/bash

if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

echo ""
echo "Beginning setup."

echo ""
echo "Updating Linux packages list."
apt-get update -y
echo ""
echo "Installing curl if not installed."
apt-get install -y curl
echo ""
echo "Installing TOR if not installed."
apt-get install -y tor

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
