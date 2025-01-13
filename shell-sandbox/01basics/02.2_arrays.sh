#!/bin/bash

my_array=(apple banana "Fruit Basket" orange)
echo "${my_array[3]}"                     # orange - note that curly brackets are needed
# adding another array element
my_array[4]="carrot"                    # value assignment without a $ and curly brackets
echo "${#my_array[@]}: ${my_array[*]}"
echo "${my_array[${#my_array[@]}-1]}"     # carrot


