#!/bin/bash
################################################################################
# Program:     Concatenate multiple log files into a single resulting file
################################################################################
# Author:      Abdullah S
################################################################################
# Description: The order of the lines in the resulting file should be grouped by IP address and sorted by time within the group.
################################################################################

# Determine to see if user provided paths to log files and output file as arguments
if [ $# -eq 0 ]
  then
    echo "Usage Error"
    echo "Usage: $0 /path/to/logs/directory /path/to/output/directory";
    exit 1;
fi

LogDir=$1
OutPutDir=$2

# Determine if Log Directory exists
if [ ! -d "$LogDir" ];
 then
 echo "missing log directory"
exit 1;
else
# Determine if Output Directory exists
	if [ ! -d "$OutPutDir" ];
 	then
 	echo "missing output directory"
	exit 1;
	fi	
fi

# cat and merge all files named hwFile*.log into a single file called mergedfiles.log
cat $LogDir/hwFile*.log > $LogDir/mergedfiles.log

# sort mergedlog file, group them by IP address, sorted by time and output the final file into the output directory
sort -k1,1 -t ' ' -k 4.9,4.12n -k 4.5,4.7M -k 4.2,4.3n -k 4.14,4.15n -k 4.17,4.18n -k 4.20,4.21n $LogDir/mergedfiles.log > $OutPutDir/hwOutputFile.log

# echo to user the output file
echo "output file saved as $OutPutDir/hwOutputFile.log"
