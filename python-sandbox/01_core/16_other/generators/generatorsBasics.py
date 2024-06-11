#!/usr/bin/python3.12

import sys

# Generators are easy to implement as compared to the iterator.
# In iterator, we have to implement __iter__() and __next__() function.

# ========================================simple
print("\n========================================|||:simple")


def simple():
    for item in range(10):
        if item % 2 == 0:
            yield item


for i in simple():
    print(i)

# ========================================Using multiple yield Statement
print("\n========================================|||:Using multiple yield Statement")


def multiple_yield():
    yield "First String"
    yield "Second string"
    yield "Third String"


obj = multiple_yield()
print(next(obj))
print(next(obj))
print(next(obj))

# ========================================Generator Expression
print("\n========================================|||:Generator Expression")

list1 = [1, 2, 3, 4, 5, 6, 7]

# List Comprehension
z = [x ** 3 for x in list1]

# Generator expression
a = (x ** 3 for x in list1)

print(a)
print(z)

print(next(a))
print(next(a))
print(next(a))
print(next(a))

# ========================================
print("\n========================================|||:")


def table(n):
    for i in range(1, 11):
        yield n * i
        i = i + 1


for i in table(15):
    print(i)

# ========================================Memory efficient
print("\n========================================|||:Memory efficient")

# List comprehension
nums_squared_list = [i * 2 for i in range(1000)]
print(sys.getsizeof("Memory in Bytes:", nums_squared_list))

# Generator Expression
nums_squared_gc = (i ** 2 for i in range(1000))
print(sys.getsizeof("Memory in Bytes:", nums_squared_gc))

# ========================================Pipelining with Generators
print("\n========================================|||:Pipelining with Generators")

# with open('sells.log') as file:
#    burger_col = (line[3] for line in file)
#    per_hour = (int(x) for x in burger_col if x != 'N/A')
#    print("Total burgers sold = ", sum(per_hour))

# ========================================Generate Infinite Sequence
print("\n========================================|||:Generate Infinite Sequence")


def infinite_sequence():
    num = 0
    while True:
        yield num
        num += 1

# for i in infinite_sequence():
#    print(i)
