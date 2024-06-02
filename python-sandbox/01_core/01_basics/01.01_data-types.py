#!/usr/bin/python3.12

# Numeric     -> int, float, complex
# String      -> str (text sequence type)
# Sequence	-> list, tuple, range
# Binary	    -> bytes, bytearray, memoryview
# Mapping	    -> dict
# Boolean	    -> bool
# Set	        -> set, frozenset
# None	    -> NoneType


var1 = 1  # int data type
var2 = True  # bool data type
var3 = 10.023  # float data type
var4 = 10 + 3j  # complex data type

# ---- String

str1 = 'TutorialsPoint'
str2 = "TutorialsPoint"
str3 = '''TutorialsPoint
sdfsdfsd
'''

# print(str1)
# print(str2)
# print(str3)

str1 = 'Hello World!'

print(str1)  # Prints complete string
print(str1[0])  # Prints first character of the string

# substring
print(str1[2:5])  # Prints characters starting from 3rd to 5th
print(str1[2:])  # Prints string starting from 3rd character
print(str1 * 2)  # Prints string two times
print(str1 + "TEST")  # Prints concatenated string

# ----------------------- --------------------------
# ------------------------ Python Sequence Data Types

# ---------------- Python List Data Type
print("\n|||List:")

list1 = ['abcd', 786, 2.23, 'john', 70.2]
tinyList = [123, 'john']

print(list1)  # Prints complete list
print(list1[0])  # Prints first element of the list

# sublist
print(list1[1:3])  # Prints elements starting from 2nd till 3rd
print(list1[2:])  # Prints elements starting from 3rd element
print(tinyList * 2)  # Prints list two times
print(list1 + tinyList)  # Prints concatenated lists

# ---------------- Python Tuple Data Type (immutalbe list)
print("\n|||Tuple:")

tuple1 = ('abcd', 786, 2.23, 'john', 70.2)
tinyTuple = (123, 'john')

print(tuple1)  # Prints the complete tuple
print(tuple1[0])  # Prints first element of the tuple
# subtuple
print(tuple1[1:3])  # Prints elements of the tuple starting from 2nd till 3rd
print(tuple1[2:])  # Prints elements of the tuple starting from 3rd element
print(tinyTuple * 2)  # Prints the contents of the tuple twice
print(tuple1 + tinyTuple)  # Prints concatenated tuples

tuple1 = ('abcd', 786, 2.23, 'john', 70.2)
list1 = ['abcd', 786, 2.23, 'john', 70.2]
# tuple1[2] = 1000  # Invalid syntax with tuple
list1[2] = 1000  # Valid syntax with list

# ---------------- Python Range Data Type
print("\n|||Range Data Type:")

# range(start, stop, step)
# - start: Integer number to specify starting position, (Its optional, Default: 0)
# - stop: Integer number to specify starting position (It's mandatory)
# - step: Integer number to specify increment, (Its optional, Default: 1)

for i in range(5):
    print(i)

print()
for i in range(2, 5):
    print(i)

print()
for i in range(1, 5, 2):
    print(i)

# ---------------- Binary Sequence Data Types
print("\n|||Binary Sequence Data Types:")

# Using bytes() function to create bytes
b1 = bytes([65, 66, 67, 68, 69])
print(b1)

# Using prefix 'b' to create bytes
b2 = b'Hello'
print(b2)

# ---------------- Bytearray Data Type
print("\n|||Bytearray Data Type:")
# Creating a bytearray from an iterable of integers
value = bytearray([72, 101, 108, 108, 111])
print(value)

# Creating a bytearray by encoding a string
val1 = bytearray("Hello", 'utf-8')
print(val1)

# ---------------- Memoryview Data Type
print("\n|||Memoryview Data Type:")
data = bytearray(b'Hello, world!')
view = memoryview(data)
print(view)

import array

arr = array.array('i', [1, 2, 3, 4, 5])
view = memoryview(arr)
print(view)

data = b'Hello, world!'
# Creating a view of the last part of the data
view = memoryview(data[7:])
print(view)

# ---------------- Python Dictionary Data Type
print("\n|||Python Dictionary Data Type:")

dict1 = {}
dict1['one'] = "This is one"
dict1[2] = "This is two"

tinyDict = {'name': 'john', 'code': 6734, 'dept': 'sales'}

print(dict1['one'])  # Prints value for 'one' key
print(dict1[2])  # Prints value for 2 key
print(tinyDict)  # Prints complete dictionary
print(tinyDict.keys())  # Prints all the keys
print(tinyDict.values())  # Prints all the values

# ---------------- Python Set Data Type
print("\n|||Python Set Data Type:")

set1 = {123, 452, 5, 6}
set2 = {'Java', 'Python', 'JavaScript'}
print(set1)
print(set2)

# ---------------- Python Boolean Data Type
print("\n|||Python Boolean Data Type:")

a = True
print(a)  # display the value of a
print(type(a))  # display the data type of a

a = 2
b = 4
print(bool(a == b))  # Returns false as a is not equal to b
print(a == b)  # Following also prints the same

a = None
print(bool(a))  # Returns False as a is None

a = ()
print(bool(a))  # Returns false as a is an empty sequence

a = 0.0
print(bool(a))  # Returns false as a is 0

a = 10
print(bool(a))  # Returns false as a is 10

# ---------------- Python Data Type Conversion
print("\n|||Python Data Type Conversion:")

print("Conversion to integer data type")
a = int(1)  # a will be 1
b = int(2.2)  # b will be 2
c = int("3")  # c will be 3

print(a)
print(b)
print(c)

print("Conversion to floating point number")
a = float(1)  # a will be 1.0
b = float(2.2)  # b will be 2.2
c = float("3.3")  # c will be 3.3

print(a)
print(b)
print(c)

print("Conversion to string")
a = str(1)  # a will be "1"
b = str(2.2)  # b will be "2.2"
c = str("3.3")  # c will be "3.3"

print(a)
print(b)
print(c)
