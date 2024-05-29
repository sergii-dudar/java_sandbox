#!/bin/bash

#ARRAY[0]="Zara"
#ARRAY[1]="Qadir"
#ARRAY[2]="Mahnaz"
#ARRAY[3]="Ayan"
#ARRAY[4]="Daisy"
#OR

ARRAY=("Zara" "Qadir" "Mahnaz" "Ayan" "Daisy")

echo "First Index: ${ARRAY[0]}"
echo "Second Index: ${ARRAY[1]}"
echo
for item in "${ARRAY[@]}"; do
    echo "$item"
done

#----------------
echo '-------------------'

echo "First Method: ${ARRAY[*]}"
#echo "Second Method: ${ARRAY[@]}"
