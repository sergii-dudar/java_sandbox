#!/usr/bin/python3.12

# The term "unpacking" refers to the process of parsing tuple items in individual variables.

tup1 = (10, 20, 30)
x, y, z = tup1
print("x: ", x, "y: ", y, "z: ", z)

list1 = [10, 20, 30]
x, y, z = list1
print("x: ", x, "y: ", y, "z: ", z)

set1 = {10, 20, 30}
x, y, z = set1
print("x: ", x, "y: ", y, "z: ", z)

# x, y = tup1 # ValueError: too many values to unpack (expected 2)
# x, y, p, q = tup1 # x, y, p, q = tup1

# ========================================Unpack Tuple Items Using Asterisk (*)
print("\n========================================|||:Unpack Tuple Items Using Asterisk (*)")
# In such a case, the "*" symbol is used for unpacking. Prefix "*" to "y", as shown below:

tup1 = (10, 20, 30)
x, *y = tup1
print("x: ", x, "y: ", y)
# x:  10 y:  [20, 30]

tup1 = (10, 20, 30, 40, 50, 60)
x, *y, z = tup1
print("x: ", x, "y: ", y, "z: ", z)
# x:  10 y:  [20, 30, 40, 50] z:  60

tup1 = (10, 20, 30, 40, 50, 60)
*x, y, z = tup1
print("x: ", x, "y: ", y, "z: ", z)
# x:  [10, 20, 30, 40] y:  50 z:  60

# ========================================
print("\n========================================|||:")

# ========================================
print("\n========================================|||:")

# ========================================
print("\n========================================|||:")

# ========================================
print("\n========================================|||:")
