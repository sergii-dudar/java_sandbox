#!/usr/bin/python3.12

# Using slicing operation
# Using reverse() method
# Using reversed() method
# Using for loop

from array import *

# ========================================Using slicing operation
print("\n========================================|||:Using slicing operation")

numericArray = array('i', [88, 99, 77, 55, 66])

print("Original array:", numericArray)
revArray = numericArray[::-1]
print("Reversed array:", revArray)

# ========================================Using list reverse() Method
print("\n========================================|||:Using list reverse() Method")

# creating an array
numericArray = array('i', [10, 5, 15, 4, 6, 20, 9])
print("Array before reversing:", numericArray)

# converting the array into list
newArray = numericArray.tolist()

# reversing the list
newArray.reverse()

# creating a new array from reversed list
revArray = array('i', newArray)
print("Array after reversing:", revArray)

# ========================================Using reversed() Method
print("\n========================================|||:Using reversed() Method")

numericArray = array('i', [12, 10, 14, 16, 20, 18])
print("Array before reversing:", numericArray)

# reversing the array
newArray = list(reversed(numericArray))

# creating a new array from reversed list
revArray = array('i', newArray)
print("Array after reversing:", revArray)

# ========================================Using for Loop
print("\n========================================|||:Using for Loop")

a = array('i', [10, 5, 15, 4, 6, 20, 9])
b = array('i')
for i in range(len(a) - 1, -1, -1):
    b.append(a[i])
print(a)
print(b)
