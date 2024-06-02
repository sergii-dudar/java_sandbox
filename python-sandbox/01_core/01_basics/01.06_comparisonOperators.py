#!/usr/bin/python3.12

# ---------------- Comparison Operators
print("\n|||Comparison Operators:")

print("Both operands are integer")
a = 5
b = 7
print("a=", a, "b=", b, "a>b is", a > b)
print("a=", a, "b=", b, "a<b is", a < b)
print("a=", a, "b=", b, "a==b is", a == b)
print("a=", a, "b=", b, "a!=b is", a != b)

# ---------------- Comparison of Booleans
print("\n|||Comparison of Booleans:")
# Boolean objects in Python are really integers: True is 1 and False is 0

a = True
b = False
print("a=", a, "b=", b, "a<b is", a < b)
print("a=", a, "b=", b, "a>b is", a > b)
print("a=", a, "b=", b, "a==b is", a == b)
print("a=", a, "b=", b, "a!=b is", a != b)

# ---------------- Comparison of Sequence Types
print("\n|||Comparison of Sequence Types:")
# In Python, comparison of only similar sequence objects can be performed. A string object is comparable with
#    another string only. A list cannot be compared with a tuple, even if both have same items.

print("comparison of different sequence types")
a = (1, 2, 3)
b = [1, 2, 3]
a1 = (1, 2, 3)
b1 = [1, 2, 3]
print("a=", a, "b=", b, "a=b is", a == b)
print("a=", a, "a1=", a1, "a=a1 is", a == a1)

print("comparison of strings")
a = 'BAT'
b = 'BALL'
print("a=", a, "b=", b, "a<b is", a < b)
print("a=", a, "b=", b, "a>b is", a > b)
print("a=", a, "b=", b, "a==b is", a == b)
print("a=", a, "b=", b, "a!=b is", a != b)

print("comparison of tuples")
a = (1, 2, 4)
b = (1, 2, 3)
print("a=", a, "b=", b, "a<b is", a < b)
print("a=", a, "b=", b, "a>b is", a > b)
print("a=", a, "b=", b, "a==b is", a == b)
print("a=", a, "b=", b, "a!=b is", a != b)

# ---------------- Comparison of Dictionary Objects
print("\n|||Comparison of Dictionary Objects:")

print("comparison of dictionary objects")
a = {1: 1, 2: 2}
b = {2: 2, 1: 1, 3: 3}
print("a=", a, "b=", b, "a==b is", a == b)
print("a=", a, "b=", b, "a!=b is", a != b)
