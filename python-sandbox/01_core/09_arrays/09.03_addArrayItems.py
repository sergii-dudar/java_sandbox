#!/usr/bin/python3.12

# Using append() method
# Using insert() method
# Using extend() method

from array import *

# ========================================Using append() method
print("\n========================================|||:Using append() method")

a = array('i', [1, 2, 3])
a.append(10)
print(a)

# ========================================Using insert() method
print("\n========================================|||:Using insert() method")

a = array('i', [1, 2, 3])
a.insert(1, 20)
print(a)

# ========================================Using extend() method
print("\n========================================|||:Using extend() method")

# The extend() method belongs to Python array module. It is used to add all elements from an iterable
# or array of same data type.

a = array('i', [1, 2, 3, 4, 5])
b = array('i', [6, 7, 8, 9, 10])
a.extend(b)
print(a)
