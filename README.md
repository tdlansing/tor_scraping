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
1. List the websites to check in websites.txt. Include "http://" and "https://" as appropriate.
2. List the terms to look for in indicators.txt. Terms are searched for using grep. Add searches in grep's format. Spaces would look like "\ ".
3. Run the program by executing "./check_websites.sh".
4. Review the results in "results.txt".
