#!/usr/bin/python3.12

#  The for loop in Python has the ability to iterate over the items of any sequence,
#   such as a list, tuple or a string.

# The sequence objects such as list, tuple or string are called iterables,
#    as the for loop iterates through the collection. Any iterator object can be iterated by the for loop.

# The view objects returned by items(), keys() and values() methods of dictionary are also iterables,
#   hence we can run a for loop with these methods.

# Python's built-in range() function returns an iterator object that streams a sequence of numbers.
#   We can run a for loop with range as well.

# ---------------- Loop with Strings
print("\n|||: Loop with Strings")

zen = '''
Beautiful is better than ugly.
Explicit is better than implicit.
Simple is better than complex.
Complex is better than complicated.
'''
for char in zen:
    if char not in 'aeiou':
        print(char, end='')

# ---------------- Loop with Tuples
print("\n|||: Loop with Tuples")

numbersTuple = (34, 54, 67, 21, 78, 97, 45, 44, 80, 19)
total = 0
for num in numbersTuple:
    total += num
print("Total =", total)

# ----------------
print("\n|||:")

numbersList = [34, 54, 67, 21, 78, 97, 45, 44, 80, 19]
total = 0
for num in numbersList:
    if num % 2 == 0:
        print(num, end=', ')

# ---------------- Loop with Range Objects
print("\n|||: Loop with Range Objects")
# Python's range object is an iterator which generates an integer with each iteration
# range(start, stop, step)
# - Start − Starting value of the range. Optional. Default is 0
# - Stop − The range goes upto stop-1
# - Step − Integers in the range increment by the step value. Option, default is 1.

numbers = range(5)
'''
start is 0 by default,
step is 1 by default,
range generated from 0 to 4
'''
print(list(numbers))
# step is 1 by default, range generated from 10 to 19
numbers = range(10, 20)
print(list(numbers))
# range generated from 1 to 10 increment by step of 2
numbers = range(1, 10, 2)
print(list(numbers))

print()
for num in range(5):  # equivalent of C style [ for (int i = 0; i < 5; i++) ]
    print(num, end=' ')
print()
for num in range(10, 20):
    print(num, end=' ')
print()
for num in range(1, 10, 2):
    print(num, end=' ')

# ---------------- for Loop with Sequence Indexes
print("\n|||:for Loop with Sequence Indexes")

numbers = [34, 54, 67, 21, 78]
indices = range(len(numbers))
for index in indices:
    print("index:", index, "number:", numbers[index])

# ----------------
print("\n|||:for Loop with Dictionaries")

numbers = {10: "Ten", 20: "Twenty", 30: "Thirty", 40: "Forty"}
for x in numbers:  # numbers.keys()
    print(x, ":", numbers[x])

for x in numbers.values():
    print("value :", x)

for x in numbers.items():
    print(x)

# Here, "x" is the tuple element from the dict_items iterator.
# We can further unpack this tuple in two different variables
for x, y in numbers.items():
    print(x, ":", y)

# ---------------- else Statement with For Loop
print("\n|||:else Statement with For Loop")

# For loop to iterate between 10 to 20
for num in range(10, 20):
    # For loop to iterate on the factors
    for i in range(2, num):
        # If statement to determine the first factor
        if num % i == 0:
            # To calculate the second factor
            j = num / i
            print("%d equals %d * %d" % (num, i, j))
            # To move to the next number
            break
        else:
            print(num, "is a prime number")
            break

# ---------------- Nested for Loop Example
print("\n|||:Nested for Loop Example")

months = ["jan", "feb", "mar"]
days = ["sun", "mon", "tue"]

for x in months:
    for y in days:
        print(x, y)

print("Good bye!")
