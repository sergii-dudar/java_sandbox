#!/usr/bin/python3.12

var = "TutorialsPoint"
a = "P"
b = "tor"
c = "in"
d = "To"

print(a, "in", var, ":", a in var)
print(b, "in", var, ":", b in var)
print(c, "in", var, ":", c in var)
print(d, "in", var, ":", d in var)

print()
print(a, "not in", var, ":", a not in var)
print(b, "not in", var, ":", b not in var)
print(c, "not in", var, ":", c not in var)
print(d, "not in", var, ":", d not in var)

# ======================================== Membership Operator with Lists and Tuples
print("\n========================================|||Membership Operator with Lists and Tuples:")

var = [10, 20, 30, 40]
a = 20
b = 10
c = a - b
d = a / 2
print(a, "in", var, ":", a in var)
print(b, "not in", var, ":", b not in var)
print(c, "in", var, ":", c in var)
print(d, "not in", var, ":", d not in var)

# Even if a number expressed in other formats like binary, octal or hexadecimal are given the
# membership operators tell if it is inside the sequence.
print(0x14 in [10, 20, 30, 40])

# However, if you try to check if two successive numbers are present in a list or tuple, the in operator
# returns False. If the list/tuple contains the successive numbers as a sequence itself, then it returns True.

print()
var = (10, 20, 30, 40)
a = 10
b = 20
print((a, b), "in", var, ":", (a, b) in var)
var = ((10, 20), 30, 40)
a = 10
b = 20
print((a, b), "in", var, ":", (a, b) in var)

# ======================================== Membership Operator with Sets
print("\n========================================|||Membership Operator with Sets:")

var = {10, 20, 30, 40}
a = 10
b = 20
print(b, "in", var, ":", b in var)

var = {(10, 20), 30, 40}
a = 10
b = 20
print((a, b), "in", var, ":", (a, b) in var)

# ======================================== Membership Operator with Dictionaries
print("\n========================================|||Membership Operator with Dictionaries:")

# Python checks the membership only with the collection of keys and not values.
var = {1: 10, 2: 20, 3: 30}
a = 2
b = 20
print(a, "in", var, ":", a in var)
print(b, "in", var, ":", b in var)
