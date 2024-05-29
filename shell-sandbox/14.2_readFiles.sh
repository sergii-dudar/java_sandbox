#!/bin/bash

file="$HOME/serhii.home/personal/git/java_sandbox/testfiles/users"

# 1.
value=$(cat "$file")
echo "1. $value"

# 2.
echo
value=$(<"$file")
echo "2. $value"

# 3.
echo
while read -r line; do echo "$line +"; done <"$file"

# 4.
echo
i=1
while read -r line; do
  echo "Line No. $i : $line"
  i=$((i + 1))
done <"$file"
