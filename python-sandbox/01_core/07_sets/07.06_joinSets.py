#!/usr/bin/python3.12

# ========================================"|" Operator
print("\n========================================|||:\"|\" Operator")

s1 = {1, 2, 3, 4, 5}
s2 = {4, 5, 6, 7, 8}
s3 = s1 | s2

print("s1: ", s1, "s2: ", s2)
print(s3)

# ========================================union() Method
print("\n========================================|||:union() Method")

s3 = set(s1).union(set(s2))
print("s1: ", s1, "s2: ", s2)
print(s3)

# ========================================update() Method
print("\n========================================|||:update() Method")

print("s1: ", s1, "s2: ", s2)
set1 = set(s1)
set2 = set(s2)
set1.update(set2)
print(set1)

# ========================================Using Unpacking Operator
print("\n========================================|||:Using Unpacking Operator")

print("s1: ", s1, "s2: ", s2)
s3 = {*s1, *s2}
print(s3)

# ========================================Using Set Comprehension
print("\n========================================|||:Using Set Comprehension")

print("s1: ", s1, "s2: ", s2)
joined_set = {x for s in [s1, s2] for x in s}
print(joined_set)

# ========================================Iterative Addition
print("\n========================================|||:Iterative Addition")

# Initializing an empty set to hold the merged elements
joined_set = set()

# Iterating over set1 and adding its elements to the joined set
for element in s1:
    joined_set.add(element)

# Iterating over set2 and adding its elements to the joined set
for element in s2:
    joined_set.add(element)

print("s1: ", s1, "s2: ", s2)
print(joined_set)
