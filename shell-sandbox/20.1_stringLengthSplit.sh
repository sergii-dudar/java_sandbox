#!/bin/bash

printf "\nStringLength: "

str="Welcome to Javatpoint"
length=${#str}
echo "Length of '$str' is $length"

printf "\n----------------Split: "
IFS=" "                 #setting space as delimiter
read -ra ADDR <<<"$str" #reading str as an array as tokens separated by IFS

for i in "${ADDR[@]}"; do #accessing each element of array
  echo "$i+"
done

#-----------------------------------------------------------
printf "\n----------------Split: "
IFS=',' #setting comma as delimiter

str="Welcome1,to2,Javatpoint3"
read -ra ADDR <<<"$str" #reading str as an array as tokens separated by IFS
echo "Name : ${ADDR[0]} "
echo "State : ${ADDR[1]} "
echo "Age : ${ADDR[2]}"

#-----------------------------------------------------------
printf "\n----------------Split no IFS: "

str="Welcome1,to2,Javatpoint3"
readarray -d , -t strarr <<<"$str" #split a string based on the delimiter ':'
#printf "\n"

for ((n = 0; n < ${#strarr[*]}; n++)); do
  echo -n "${strarr[n]}+ "
done

#-----------------------------------------------------------
printf "\n----------------Split String by another string: "

str="We,Welcome,You,On,Javatpoint"
delimiter=','
s=$str$delimiter
array=()
while [[ $s ]]; do
  array+=("${s%%"$delimiter"*}")
  s=${s#*"$delimiter"}
done
declare -p array

#-----------------------------------------------------------
# printf "\n----------------Split String using Trim Command: "

# my_str="We;welcome;you;on;javatpoint."
# my_arr=($(echo "$my_str" | tr ";""\n"))

# for i in "${my_arr[@]}"; do
#   echo -n "$i "
# done
