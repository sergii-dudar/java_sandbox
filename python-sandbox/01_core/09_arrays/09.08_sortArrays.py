#!/usr/bin/python3.12

# Using a sorting algorithm
# Using the sort() method from List
# Using the built-in sorted() function

from array import *

# ========================================Using a Sorting Algorithm
print("\n========================================|||:Using a Sorting Algorithm")

a = array('i', [10, 5, 15, 4, 6, 20, 9])
for i in range(0, len(a)):
    for j in range(i + 1, len(a)):
        if a[i] > a[j]:
            temp = a[i]
            a[i] = a[j]
            a[j] = temp
print(a)

# ========================================Using sort() Method of List
print("\n========================================|||:Using sort() Method of List")

# creating array
orgnlArray = array('i', [10, 5, 15, 4, 6, 20, 9])
print("Original array:", orgnlArray)
# converting to list
sortedList = orgnlArray.tolist()
# sorting the list
sortedList.sort()

# creating array from sorted list
sortedArray = array('i', sortedList)
print("Array after sorting:", sortedArray)

# ========================================Using sorted() Method
print("\n========================================|||:Using sorted() Method")

a = array('i', [4, 5, 6, 9, 10, 15, 20])
sorted(a)
print(a)
