#!/bin/bash

#filew="./testfiles/usersw"
filew="./testfiles/file_$(date +%Y-%m-%d).txt"

#. 1
ls | head --lines 3 >"$filew" # create or owerride
#cat "$filew"

#. 2

uname -a >>"$filew" # create or append

cat "$filew"

printf "\n---------#Print Output Normally and Write it to a File "
# 'tee' command is used to print the input that it receives to the screen. It can save the output to a file at the same time.

ls | tail --lines 3 | tee "$filew" # This will override the content of the file, just like the > operator but also print the output on the screen.
uname -a | tee -a "$filew"         # This will append the output to the end of the file but also print the output on the screen.
