#!/bin/bash

if [[ -f /scripts/outfile.sql ]]
then
    rm /scripts/outfile.sql
fi

if [[ ! -f $1 ]]
then
    echo "File does not exist, make sure the path to the file is correct."
    exit 1
fi

if [[ ( $1 != *.csv ) ]]
then
    echo "Wrong file type given."
    exit 1
fi

mysql -u root -p ethWallets -e "set @file='$1';source import.sql;" 