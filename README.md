# tor_scraping
To ensure your system has the software needed to run this script please run 'sudo ./setup.sh'.

There are configuration changes that have to be made to '/etc/tor/torrc' after running the setup script. They are mentioned when running the script and below.

Uncomment 'ControlPort 9051'.
Set 'CookieAuthentication 0'.
Restart TOR with 'sudo /etc/init.d/tor restart'.

To run the program execute './check_websites.sh'.
