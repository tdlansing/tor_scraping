#!/bin/bash

echo ""
echo "Starting program."

# Create results file.
date > results.txt

echo "" | tee -a results.txt
echo -n "Current IP address: " | tee -a results.txt
curl -s https://ipinfo.io/ip | tee -a results.txt
echo -n "Current TOR IP address: " | tee -a results.txt
torify curl -s https://ipinfo.io/ip | tee -a results.txt
echo "" | tee -a results.txt

websites=$(cat websites.txt)
indicators=$(cat indicators.txt)

for website in $websites; do
	# Remove http:// or https:// if present.
	filename=$(echo $website|cut -d '/' -f3-)".txt"
	# Replace '/' with '_' if present in the name. Add directory location.
	filename="./tmp/"$(echo $filename|sed 's/\//`/g')
	echo "Attempting to download the file for $filename." | tee -a results.txt
	# Get the webpage and save to a file in the tmp directory.
	torify wget -c $website -O $filename
done

# Check each file downloaded for the indicators provided.
for file in $(ls ./tmp); do
	echo "" | tee -a results.txt
	echo "---------------------------------------------------------------------------------------" >> results.txt
	website=$(echo $file|rev|cut -d '.' -f2-|rev|sed 's/`/\//g')
	echo "Checking website: "$website | tee -a results.txt
	echo "" | tee -a results.txt
	for indicator in $indicators; do
		cat "tmp/${file}" | sed 's/<[^>]*>/\n/g'| sed 's/{[^}]*}/\n/g'|sed -r '/^\s*$/d' | grep "${indicator}" >> results.txt
	done
done
echo ""

echo "Program has finished."
echo ""
