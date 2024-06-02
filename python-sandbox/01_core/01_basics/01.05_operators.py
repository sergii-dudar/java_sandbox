#!/usr/bin/python3.12

a = 21
b = 10
c = 0

c = a + b
print("a: {} b: {} a+b: {}".format(a, b, c))

c = a - b
print("a: {} b: {} a-b: {}".format(a, b, c))

c = a * b
print("a: {} b: {} a*b: {}".format(a, b, c))

c = a / b
print("a: {} b: {} a/b: {}".format(a, b, c))

c = a % b
print("a: {} b: {} a%b: {}".format(a, b, c))

a = 2
b = 3
c = a ** b
print("a: {} b: {} a**b: {}".format(a, b, c))

a = 10
b = 5
c = a // b
print("a: {} b: {} a//b: {}".format(a, b, c))

# ---------------- Comparison Operators
print("\n|||Comparison Operators:")

a = 21
b = 10
if a == b:
    print("Line 1 - a is equal to b")
else:
    print("Line 1 - a is not equal to b")

if a != b:
    print("Line 2 - a is not equal to b")
else:
    print("Line 2 - a is equal to b")

if a < b:
    print("Line 3 - a is less than b")
else:
    print("Line 3 - a is not less than b")

if a > b:
    print("Line 4 - a is greater than b")
else:
    print("Line 4 - a is not greater than b")

a, b = b, a  # values of a and b swapped. a becomes 10, b becomes 21

if a <= b:
    print("Line 5 - a is either less than or equal to  b")
else:
    print("Line 5 - a is neither less than nor equal to  b")

if b >= a:
    print("Line 6 - b is either greater than  or equal to b")
else:
    print("Line 6 - b is neither greater than  nor equal to b")

# ---------------- Bitwise Operators
print("\n|||Bitwise Operators:")

a = 20
b = 10

print('a=', a, ':', bin(a), 'b=', b, ':', bin(b))
c = 0

c = a & b
print("result of AND is ", c, ':', bin(c))

c = a | b
print("result of OR is ", c, ':', bin(c))

c = a ^ b
print("result of EXOR is ", c, ':', bin(c))

c = ~a
print("result of COMPLEMENT is ", c, ':', bin(c))

c = a << 2
print("result of LEFT SHIFT is ", c, ':', bin(c))

c = a >> 2
print("result of RIGHT SHIFT is ", c, ':', bin(c))

# ---------------- Logical Operators
print("\n|||Logical Operators:")

var = 5

print(var > 3 and var < 10)
print(var > 3 or var < 4)
print(not (var > 3 and var < 10))

print()
varNone = None

result = var and 10
print(result)

result = varNone or 2
print(result)

# ---------------- Membership Operators
print("\n|||Membership Operators:")

a = 10
b = 20
list1 = [1, 2, 3, 4, 5]

print("a:", a, "b:", b, "list:", list1)
if 10 in list1:
    print("10 is present in the given list", list1)
else:
    print("10 is not present in the given list", list1)

if b not in list1:
    print("b is not present in the given list")
else:
    print("b is present in the given list")

print()
c = b / a
print("c:", c, "list:", list1)
if c in list1:
    print("c is available in the given list")
else:
    print("c is not available in the given list")

print()
if [1, 2] in list1:
    print("[1, 2] is present in the given list")
else:
    print("[1, 2] is not present in the given list")

# ---------------- Identity Operators
print("\n|||Identity Operators:")

a = [1, 2, 3, 4, 5]
b = [1, 2, 3, 4, 5]
c = a

print(a is c)
print(a is b)

print(a is not c)
print(a is not b)
