#!/usr/bin/python3.12

from array import *

# ========================================Using append() Method
print("\n========================================|||:Using append() Method")

# creating two arrays
a = array('i', [10, 5, 15, 4, 6, 20, 9])
b = array('i', [2, 7, 8, 11, 3, 10])

# merging both arrays
for i in range(len(b)):
    a.append(b[i])
print(a)

# ========================================Using + operator of list
print("\n========================================|||:Using + operator of list")

a = array('i', [10, 5, 15, 4, 6, 20, 9])
b = array('i', [2, 7, 8, 11, 3, 10])
x = a.tolist()
y = b.tolist()
z = x + y
a = array('i', z)
print(a)

# ========================================Using extend() Method
print("\n========================================|||:Using extend() Method")

a = array('i', [88, 99, 77, 66, 44, 22])
b = array('i', [12, 17, 18, 11, 13, 10])
a.extend(b)
print(a)
