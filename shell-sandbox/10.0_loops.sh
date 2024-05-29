#!/bin/bash

a=0

#-------------------------------------------
#----------------The while Loop
echo -n "while loop: "
while [ "$a" -lt 10 ]; do
  echo -n "$a "
  a=$(("$a" + 1))
done

#------------------------------------------------
#----------------The for Loop
echo -e "\n"

echo -n "for loop: "
for var in 0 1 2 3 4 5 6 7 8 9; do
  echo -n "$var "
done

echo
echo "files starting with bash: "
for file in "$HOME"/.bash*; do
  echo "  $file"
done

#------------------------------------------------
#----------------The until Loop
echo -e "\n"

a=0
echo -n "until loop: "
until [ ! $a -lt 10 ]; do
  echo -n "$a "
  a=$(("$a" + 1))
done

#------------------------------------------------
#----------------The nesting Loop
echo -e "\n"

a=0
echo "nesting loop: "
while [ "$a" -lt 10 ]; do # this is loop1
  b="$a"
  while [ "$b" -ge 0 ]; do # this is loop2
    echo -n "$b "
    b=$(("$b" - 1))
  done
  echo
  a=$(("$a" + 1))
done

#------------------------------------------------
#----------------The select Loop
#echo -e "\n"

#cho "select loop: "
#elect DRINK in tea cofee water juice appe all none; do
# case $DRINK in
# tea | cofee | water | all)
#   echo "Go to canteen"
#   ;;
# juice | appe)
#   echo "Available at home"
#   ;;
# none)
#   break
#   ;;
# *)
#   echo "ERROR: Invalid selection"
#   ;;
# esac
#one
