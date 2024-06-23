#!/usr/bin/python3.12

from array import *

# ========================================for Loop with Array
print("\n========================================|||:for Loop with Array")

a = array('i', [56, 42, 23, 85, 45])
for iterate in a:
    print(iterate)

# ========================================while Loop with Array
print("\n========================================|||:while Loop with Array")

# checking the length
length, i = len(a), 0

while i < length:
    print(a[i])
    i += 1

# ========================================for Loop with Array Index
print("\n========================================|||:for Loop with Array Index")

a = array('d', [56, 42, 23, 85, 45])
length = len(a)
for index in range(length):
    print(a[index])
