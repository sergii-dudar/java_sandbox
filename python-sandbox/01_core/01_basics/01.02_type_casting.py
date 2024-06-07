#!/usr/bin/python3.12

# ======================================== Implicit Casting
print("\n========================================|||Implicit Casting:")

a = True
b = 10.5
c = a + b

print(c)  # 11.5

# ======================================== Explicit Casting
print("\n========================================|||Implicit Casting:")

print(str('True'))
print(str([1, 2, 3]))
print(str((1, 2, 3)))

print()
a = str(1)  # a will be "1"
b = str(2.2)  # b will be "2.2"
c = str("3.3")  # c will be "3.3"
print(a)
print(b)
print(c)

# ======================================== Conversion of Sequence Types
print("\n========================================|||Conversion of Sequence Types:")

list1 = [1, 2, 3, 4, 5]  # List Object
tuple1 = (1, 2, 3, 4, 5)  # Tupple Object
str1 = "Hello"  # String Object

### list() separates each character in the string and builds the list
print(list(str1))  # ['H', 'e', 'l', 'l', 'o']

### The parentheses of tuple are replaced by square brackets
print(list(tuple1))  # [1, 2, 3, 4, 5]

print()
### tuple() separates each character from string and builds a tuple of characters
print(tuple(str1))  # ('H', 'e', 'l', 'l', 'o')

### square brackets of list are replaced by parentheses.
print(tuple(list1))  # (1, 2, 3, 4, 5)

print()
### str() function puts the list and tuple inside the quote symbols.
print(str(list1))  # '[1, 2, 3, 4, 5]'

print(str(tuple1))  # '(1, 2, 3, 4, 5)'
