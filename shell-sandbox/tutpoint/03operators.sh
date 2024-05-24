#!/bin/bash

dateNow=$(date)
plus=$((2 + 2))
module=$((5 % 2))

zero=0
#ifZeroSet=${zero:-$plus}
ifEmptyThen=${zero:+$plus} # something like ternam opartor

echo "date value : $dateNow"
echo "plus value : $plus"
echo "module value : $module"
#echo "assign value : $assign"

#echo "if zero set : $ifZeroSet"
echo "if empty them : $ifEmptyThen"
echo
