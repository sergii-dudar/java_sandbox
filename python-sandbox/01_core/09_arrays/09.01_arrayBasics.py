#!/usr/bin/python3.12

# array methods: https://www.tutorialspoint.com/python/python_array_methods.htm

# type of arrays:
# 'b' -	signed integer
# 'B' -	unsigned integer
# 'u' -	Unicode character
# 'h' -	signed integer
# 'H' -	unsigned integer
# 'i' -	signed integer
# 'I' -	unsigned integer
# 'l' -	signed integer
# 'L' -	unsigned integer
# 'q' -	signed integer
# 'Q' -	unsigned integer
# 'f' -	floating point
# 'd' -	floating point

from array import *

# creating an array with integer type
a = array('i', [1, 2, 3])
print(type(a), a)

# creating an array with char type
a = array('u', 'BAT')
print(type(a), a)

# creating an array with float type
a = array('d', [1.1, 2.2, 3.3])
print(type(a), a)

# ========================================
print("\n========================================|||:")

array1 = array('i', [10, 20, 30, 40, 50])
print(array1[0])
print(array1[2])

# ========================================Insertion Operation
print("\n========================================|||:Insertion Operation")

array1.insert(1, 60)
for x in array1:
    print(x)

# ========================================Deletion Operation
print("\n========================================|||:Deletion Operation")

array1.remove(40)
for x in array1:
    print(x)

# ========================================Search Operation
print("\n========================================|||:Search Operation")

print("index of 30 is: ", array1.index(30))

# ========================================Update Operation
print("\n========================================|||:Update Operation")

array1 = array('i', [10, 20, 30, 40, 50])
array1[2] = 80
for x in array1:
    print(x)

# ================ Examples
# ========================================find the largest number in an array
print("\n========================================|||:find the largest number in an array")

a = array('i', [10, 5, 15, 4, 6, 20, 9])
print(a)
largest = a[0]
for i in range(1, len(a)):
    if a[i] > largest:
        largest = a[i]
print("Largest number:", largest)

# ========================================store all even numbers from an array in another array
print("\n========================================|||:store all even numbers from an array in another array")

a = array('i', [10, 5, 15, 4, 6, 20, 9])
print(a)
b = array('i')
for i in range(len(a)):
    if a[i] % 2 == 0:
        b.append(a[i])
print("Even numbers:", b)

# ========================================find the average of all numbers
print("\n========================================|||:find the average of all numbers")

a = array('i', [10, 5, 15, 4, 6, 20, 9])
print(a)
s = 0
for i in range(len(a)):
    s += a[i]
avg = s / len(a)
print("Average:", avg)

# Using sum() function
avg = sum(a) / len(a)
print("Average:", avg)
