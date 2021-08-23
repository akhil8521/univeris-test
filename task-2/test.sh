#!/bin/bash
set -euo pipefail
# Takes list of files as input for the script where the script is executed and stores in names.txt.
ls -ltr *.Z01 | awk '{print $9}'>names.txt

#Reads the file names and takes substring out.
while IFS= read -r line; do
    echo $line;
    # Stores respective characters to respective fields as variables. 
    type=$(echo $line | sed 's/FSRV.Z01//' | cut -d "." -f1 |cut -c1-2)
    dd=$(echo $line | sed 's/FSRV.Z01//' | cut -d "." -f2 |cut -c1-2)
    mm=$(echo $line | sed 's/FSRV.Z01//' | cut -d "." -f2 |cut -c3-4)
    yy=$(echo $line | sed 's/FSRV.Z01//' | cut -d "." -f2 |cut -c5-6)
    # This loop creats the directory structure based on the file name.
    if [[ ! -d "${yy}/${mm}/${dd}/${type}" ]]; then
        echo "${yy}/${mm}/${dd}/${type}"
        echo "not found"
        mkdir -p "${yy}/${mm}/${dd}/${type}"
    fi
    #moves files from original directory to newly created directory structure. 
    echo "moving $line to destination ${yy}/${mm}/${dd}/${type}">> record.txt
    mv $line "${yy}/${mm}/${dd}/${type}"
done <names.txt