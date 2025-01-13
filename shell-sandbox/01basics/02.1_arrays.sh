#!/bin/bash

#-----------explicitly declaring numeric array
# -a        to make NAMEs indexed arrays (if supported)
# declare -a ARRAY_NAME
# ARRAY_NAME[0]=value_1
# ARRAY_NAME[1]=value_2
# ARRAY_NAME[2]=value_n

#-----------explicitly declaring numeric array
# -A        to make NAMEs associative arrays (if supported)
# declare -A ARRAY_NAME
# RRAY_NAME[index_foo]=value_foo
# RRAY_NAME[index_bar]=value_bar
# RRAY_NAME[index_xyz]=value_xyz

# or
# declare -A ARRAY_NAME
# ARRAY_NAME=(
#     ["index_foo"]=value_foo
#     ["index_bar"]=value_bar
#     ["index_xyz"]=value_xyz
# )

#----Bash Array Initialization
#declare -a ARRAY_INDEXED
   ARRAY_INDEXED=(element_1st element_2nd element_Nth)

declare -A ARRAY_NAMED
ARRAY_NAMED=(
    ["name1"]="value_name1"
    ["name2"]="value_name2"
    ["name3"]="value_name3"
)
# echo ${ARRAY_NAME[2]}

printf "\n----------------Print Bash Array: "
declare -p ARRAY_INDEXED
declare -p ARRAY_NAMED

printf "\n----------------Print All the Elements: "
echo "${ARRAY_INDEXED[@]}"
echo "${ARRAY_NAMED[@]}"
for i in "${ARRAY_INDEXED[@]}"; do echo -n "$i "; done

printf "\n----------------Printing the Keys of an Array: "
echo "${!ARRAY_INDEXED[@]}" # 0 1 2
echo "${!ARRAY_NAMED[@]}"   # 0 1 2

printf "\n----------------Finding Array Length: "
echo "The array contains ${#ARRAY_INDEXED[@]} elements"

printf "\n----------------Loop through the Array: "
for key in "${!ARRAY_INDEXED[@]}"; do
    echo The key: "$key" value is: "${ARRAY_INDEXED[$key]}"
done

echo
for key in "${!ARRAY_NAMED[@]}"; do
    echo The key: "$key" value is: "${ARRAY_NAMED[$key]}"
done

# C style
length=${#ARRAY_INDEXED[@]}
for ((i = 0; i < length; i++)); do
    echo "$i -> ${ARRAY_INDEXED[$i]}"
done

printf "\n----------------Adding Elements to an Array: "
ARRAY_INDEXED[length + 1]="JavaScript"
ARRAY_INDEXED+=(CSS SQL)
echo "${ARRAY_INDEXED[@]}"

printf "\n----------------Updating Array Element: "
ARRAY_INDEXED[4]="Javatpoint"
echo "${ARRAY_INDEXED[@]}"

printf "\n----------------Deleting an Element from an Array: "
unset 'ARRAY_NAME[1]'
echo "${ARRAY_INDEXED[@]}"
echo "${!ARRAY_INDEXED[@]}"

# printf "\n----------------Deleting the Entire Array: "
# unset ARRAY_NAME
# echo "${!ARRAY_NAME[@]}"

printf "\n----------------Slice Array Elements: "
SLICED_ARRAY=("${ARRAY_INDEXED[@]:1:3}")
echo "original:" "${ARRAY_INDEXED[@]}"
echo "sliced:" "${SLICED_ARRAY[@]}"