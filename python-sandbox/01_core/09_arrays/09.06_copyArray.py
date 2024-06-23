#!/usr/bin/python3.12

from array import *
import copy

# ========================================Using Assignment Operator
print("\n========================================|||:Using Assignment Operator")

a = array('i', [110, 220, 330, 440, 550])
b = a
print("Copied array:", b)
print(id(a), id(b))

a[2] = 10
print(a, b)

# ========================================Using Deep Copy
print("\n========================================|||:Using Deep Copy")

a = array('i', [110, 220, 330, 440, 550])
b = copy.deepcopy(a)
print("Copied array:", b)

print(id(a), id(b))
a[2] = 10
print(a, b)
