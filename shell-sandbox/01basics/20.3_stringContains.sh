#!/bin/bash

# In Bash, the [[ ... ]] construct supports regular expression matching 
#   with the =~ operator. This allows you to check if a string matches a regular expression pattern.

string="LinuxSimply"

prefix="Linux"
suffix="Simply"
middle="uxSi"
echo "The checking substring: Linux"
printf "\n"

# if [[ $string == "$prefix"* ]]; then 
if [[ $string =~ ^"$prefix" ]]; then
  echo "The string starts with '$prefix'"
else
  echo "The string doesn't start with '$prefix'"
fi

if [[ $string =~ "$suffix"$ ]]; then
  echo "The string ends with 'suffix'"
else
  echo "The string doesn't end with 'suffix'"
fi

# if [[ $string == *"$middle"* ]]; then
if [[ $string =~ $middle ]]; then #regex
  echo "The string contains '$middle'"
else
  echo "The string doesn't contains '$middle'"
fi

printf "\n"

