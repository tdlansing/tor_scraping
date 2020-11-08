#!/bin/bash

echo ""
echo "Starting program."

echo ""
echo -n "Current IP address: "
curl https://ipinfo.io/ip
echo -n "Current TOR IP address: "
torify curl https://ipinfo.io/ip
echo ""

websites=$(cat websites.txt)
for website in $websites; do
	# Remove '/' at the end if present.
	filename=$(echo $website|sed 's/\/$//')
	echo "Attempting to download the file for $filename."
	# Remove http:// or https:// if present. Add the directory.
	filename="./tmp/"$(echo $filename|rev|cut -d '/' -f1|rev)".txt"
	# Get the webpage and save to a file in the tmp directory.
	torify wget -c $website -O $filename
done
echo ""

for file in $(ls ./tmp); do
	# Replace the below line with code to scrape the page.
	# Likely this will be more efficient using Python and
	# calling the Python script from here.
	echo $file" has been written to."
done
echo ""

echo "Program has finished."
