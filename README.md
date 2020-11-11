# tor_scraping
About:
The purpose of this script is to get a copy of each webpage listed in websites.txt and download them using TOR via the torify command. Then the script checks each site against each indicator listed in indicators.txt. Any results are listed in a file created at run time under restults.txt

Setup:
- To ensure your system has the software needed to run this script please run 'sudo ./setup.sh'.
- There are configuration changes that have to be made to '/etc/tor/torrc' after running the setup script. They are mentioned when running the script and below.

Uncomment 'ControlPort 9051'.
Set 'CookieAuthentication 0'.
Restart TOR with 'sudo /etc/init.d/tor restart'.

Execution:
To run the program execute './check_websites.sh'.
