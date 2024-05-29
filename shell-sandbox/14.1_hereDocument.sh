#!/bin/bash

echo -n "number of lines: "
wc -l <<EOF
   This is a simple lookup program
	for good (and bad) restaurants
	in Cape Town.
EOF

#------------------------------------
echo
echo "cat result: "
cat << EOF
This is a simple lookup program
for good (and bad) restaurants
in Cape Town.
EOF

#------------------------------------
# cd testfiles || exit

# filename=test.txt
# vi $filename <<EndOfCommands
# i
# This file was created automatically from
# a shell script
# ^[
# ZZ
# EndOfCommands

# echo "cat test.txt result: "
# cat $filename
