#!/bin/bash

# Requirements --------------------------------------
# Ubuntu/Debian : sudo apt install inotify-tools
# Arch          : sudo pacman -S inotify-tools
# Fedora        : sudo dnf install inotify-tools
# ---------------------------------------------------

Folder=~/Documents
File=/home/ray/MonitorLogs.txt

if [ ! -f "$File" ]; then
	touch "$File"
fi

echo "| Monitoring $Folder for changes "
echo "| Logs would be shown at: $File  "
echo "Monitoring Started . . . . . ."
echo "================================================="
echo ""
echo ""

inotifywait -m -r -e create -e modify -e delete --format '%T %e %w%f' --timefmt '%F %T' "$Folder" | while read -r line
do
	EventTime=$(echo "$line" | awk '{print $1 $2}')
	EventType=$(echo "$line" | awk '{for (i=3; i<NF; i++) printf "%s ", $i; print $(NF-1)}')
	FilePath=$(echo "$line" | awk '{print $NF}')

	if [[ "$File" == "$FilePath" ]]; then
		continue
	fi

	echo "$FilePath $EventType $EventTime" >> "$File"
	
	if [[ "$EventType" == *"CREATE"* ]]; then
		echo -e "\e[32m[CREATED] $FilePath at $EventTime\e[0m"
	elif [[ "$EventType" == *"MODIFY"* ]]; then
		echo -e "\e[33m[MODIFIED] $FilePath at $EventTime\e[0m"
	elif [[ "$EventType" == *"DELETE"* ]]; then
		echo -e "\e[31m[DELETED] $FilePath at $EventTime\e[0m"
	else
		echo "[UNKNOWN] $EventType $FilePath at $EventTime"
	fi

done
