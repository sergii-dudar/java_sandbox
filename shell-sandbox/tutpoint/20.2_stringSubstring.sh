#!/bin/bash

#--------------Substring

str="We welcome you on Javatpoint."

echo -e "\n----------------Extract till Specific Characters from Starting: "
echo "Total characters in a String: ${#str} "
substr="${str:0:10}"

echo "Substring: $substr"
echo "Total characters in Substring: ${#substr} "

echo -e "\n----------------Extract from Specific Character onwards: "
substr="${str:11}"
echo "$substr"

echo -e "\n----------------Extract a Single Character: "
substr="${str:11:1}"
echo "$substr"

echo -e "\n----------------Extract the specific characters from last: "
substr="${str:(-11)}"
echo "$substr"

#--------------Concatenaiton

echo -e "\n----------------Write Variables Side by Side: "
str1="We welcome you"
str2=" on Javatpoint."
str3=$str1$str2
echo "$str3"

echo -e "\n----------------Using Double Quotes: "
str="We welcome you"
echo "$str on Javatpoint."

echo -e "\n----------------Using Append Operator with Loop: "
lang=""
#for loop for reading the list
for value in 'java' 'python' 'C' 'C++'; do
  lang+="$value _ " #Combining the list values using append operator
done
#Printing the combined values
echo "$lang"
