#!/usr/bin/python3.12

# Using indexing
# Using iteration
# Using enumerate() function

from array import *

# ========================================Using indexing
print("\n========================================|||:Using indexing")

# creating array
numericArray = array('i', [111, 211, 311, 411, 511])

# indexing
print(numericArray[0])
print(numericArray[1])
print(numericArray[2])

# ========================================Using iteration
print("\n========================================|||:Using iteration")

# creating array
numericArray = array('i', [111, 211, 311, 411, 511])

# iteration through for loop
for item in numericArray:
    print(item)

# ========================================Using enumerate() function
print("\n========================================|||:Using enumerate() function")

# The enumerate() function can be used to access elements of an array. It accepts an array and an
# optional starting index as parameter values and returns the array items by iterating.

numericArray = array('i', [111, 211, 311, 411, 511])

# use of enumerate() function
for loc, val in enumerate(numericArray):
    print(f"Index: {loc}, value: {val}")

for item in enumerate(numericArray):
    print(f"item: {item}")

# ========================================Accessing a range of array items in Python
print("\n========================================|||:Accessing a range of array items in Python")

numericArray = array('i', [111, 211, 311, 411, 511])

print(numericArray[2:])
print(numericArray[0:3])
