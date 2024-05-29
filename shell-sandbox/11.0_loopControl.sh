#!/bin/bash

#------------------------------------------------
#----------------The infinite loop
printf "\n"

a=10

#until [ $a -lt 10 ]; do
#  echo "$a"
#  a=$(("$a" + 1))
#  sleep 1s
#done

#------------------------------------------------
#----------------break && brake n
printf "\n"
echo "break && brake n"

a=0
while [[ $a -lt 10 ]]; do
  echo $a
  if [[ $a -eq 5 ]]; then
    break
  fi
  a=$(("$a" + 1))
done

echo
a=0
for var1 in 1 2 3; do
  for var2 in 0 5; do
    if [[ $var1 -eq 2 && $var2 -eq 0 ]]; then
      break 2 # argument 2. This indicates that if a condition is met you should break out of outer loop and ultimately from the inner loop as well.
    else
      echo "$var1 $var2"
    fi
  done
done

#------------------------------------------------
#----------------continue && continue n
printf "\n"
echo "continue && continue n"

nums="1 2 3 4 5 6 7"

for num in $nums; do
  q=$(("$num" % 2))
  if [[ $q -eq 0 ]]; then
    echo "Number is an even number!!"
    continue
  fi
  echo "Found odd number"
done
