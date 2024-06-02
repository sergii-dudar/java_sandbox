#!/usr/bin/python3.12

# ---------------- 'is' Operator
print("\n|||'is' Operator:")

'''
The 'is' operator evaluates to True if both the operand objects share the same memory location.
The memory location of the object can be obtained by the "id()" function. If the "id()"
of both variables is same, the "is" operator returns True.
'''

a = [1, 2, 3, 4, 5]
b = [1, 2, 3, 4, 5]
c = a

# Comparing and printing return values
print(a is c)
print(a is b)

# Printing IDs of a, b, and c
print("id(a) : ", id(a))
print("id(b) : ", id(b))
print("id(c) : ", id(c))

# ---------------- 'is not' Operator
print("\n|||'is not' Operator")

# Comparing and printing return values
print(a is not c)
print(a is not b)

# ---------------- String
print("\n|||String")

a = "TutorialsPoint"
b = a
print("id(a), id(b):", id(a), id(b))
print("a is b:", a is b)
print("b is not a:", b is not a)

# ---------------- List and Tuple
print("\n|||List and Tuple")

a = [1, 2, 3]
b = [1, 2, 3]
print("id(a), id(b):", id(a), id(b))
print("a is b:", a is b)
print("b is not a:", b is not a)
