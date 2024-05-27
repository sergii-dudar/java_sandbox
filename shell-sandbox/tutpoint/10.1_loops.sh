#!/bin/bash

#/usr/local/bin/bash
#echo $BASH_VERSION

#------------------------------------------------
#----------------The for Loop
echo -e "\n"

# for variable in list...   - The list can contain numbers or string etc. separated by spaces.
# for (( expression1; expression2; expression3 ))...

words="Start learning from Javatpoint."
numbers="1 2 3 4 5 6 7 0"
array1=("element1" "element 2" "elementN")
str1="Let's start
learning from Javatpoint."
str2="Let's start
learning from
Javatpoint."

# for item in 0 1 2 3 4 5 6 7 8 9; do
# for item in $numbers; do
# for item in {1..10}  ; do
# for item in {0..10..2}; do  # {START..END..INCREMENT} - supported by bash 4.0+
# for item in "${array1[@]}"; do
# for item in $str1; do  # by words separated by space
for item in $str1; do
  echo -n "$item+ "
done

echo -e "\nC style: "

# C stype
for ((i = 1; i <= 10; i++)); do
  echo -n "$i "
done

echo -e "\nbreak: "

# break
# continue
for table in {2..100..2}; do
  echo -n "$table "
  if [[ "$table" == 20 ]]; then
    break
  fi
done

echo -e "\ncontinue: "
for ((i = 1; i <= 20; i++)); do
  if [[ $i -gt 5 && $i -lt 16 ]]; then
    continue
  fi
  echo -n "$i "
done

echo -e "\ninfinit: "
for ((i = 1; ; i++)); do # of for (( ; ; ))
  #sleep 1s
  echo -n "$i "
  if ((i > 10)); then
    echo -n "done"
    break
  fi
done

#-------------------------------------------
#----------------The while Loop
echo -e "\n\nThe while Loop:"

#read -p "Enter starting number: " snum
#read -p "Enter ending number: " enum

snum=1
enum=10

# while [[ $snum -le $enum ]]; do
while ((snum <= enum)); do
  echo -n "$snum "
  ((snum++))
done

echo -e "\nMultiple Conditions: "
snum=1
enum=10

# while [[ $snum -lt $enum || $snum == "$enum" ]]; do
while ((snum < enum || snum == enum)); do
  echo -n "$snum "
  ((snum++))
done

echo -e "\nInfinite While Loop: "
# while :; do
# while true; do
#  sleep 1s
#  echo "Welcome to Javatpoint."
# done

echo -e "\nWhile Loop Break: "
i=10
while ((i >= 1)); do
  if ((i == 2)); then
    echo "Mission Aborted, Some Technical Error Found."
    break
  fi
  echo -n "$i "
  ((i--))
done

echo -e "\nWhile Loop Continue: "
i=0
while ((i <= 10)); do
  ((i++))
  if (("$i" == 5)); then
    continue
  fi
  echo -n "$i "
done

#------------------------------------------------
#----------------The until Loop
echo -e "\n\nUntil Loop"

i=1
# until [ $i -gt 10 ]; do
until ((i > 10)); do
  echo -n "$i "
  ((i++))
done

echo -e "\nUntil Loop Multiple Conditions"
max=5
a=1
b=0

# until [[ $a -gt $max || $b -gt $max ]]; do
until ((a > max || b > max)); do
  echo -n "a = $a & b = $b. ; "
  ((a++))
  ((b++))
done
