#!/usr/bin/python3.12

# List comprehension is a very powerful programming tool. It is similar to set builder notation
# in mathematics. It is a concise way to create new list by performing some kind of process
# on each item on existing list. List comprehension is considerably faster than processing a
# list by for loop.

# classical loop example

chars = []
for ch in 'TutorialsPoint':
    if ch not in 'aeiou':
        chars.append(ch)
print(chars)

# A general usage of list comprehension is as follows:
#   listObj = [x for x in iterable]

# ========================================Python List Comprehension Technique
print("\n========================================|||:Python List Comprehension Technique")

# chars = [char for char in 'TutorialsPoint'] # simple plain for
chars = [char for char in 'TutorialsPoint' if char not in 'aeiou']
print(chars)

# ========================================build a list of squares of numbers between 1 to 10
print("\n========================================|||:build a list of squares of numbers between 1 to 10")

squares = [x * x for x in range(1, 11)]
print(squares)

# ========================================Nested Loops in Python List Comprehension
print("\n========================================|||:Nested Loops in Python List Comprehension")

list1 = [1, 2, 3]
list2 = [4, 5, 6]
list3 = [7, 8, 9]
CombLst = [(x, y) for x in list1 for y in list2]
print(CombLst)

# ========================================Condition in Python List Comprehension
print("\n========================================|||:Condition in Python List Comprehension")

list1 = [x for x in range(1, 21) if x % 2 == 0]
print(list1)

# ========================================inner loops
print("\n========================================|||:inner loops")

# 2 level of lists, need inner loops with 2 level
multiList = [list1, list2, list3]
for x in multiList:
    for y in x:
        print(y, end=", ")
print()
# same in comprehension
print([y for x in multiList for y in x])

print("------------------------------------------")
# 3 level of lists, need inner loops with 3 level

multiList = [[list1, list2], [list2, list3]]
for x in multiList:
    for y in x:
        for z in y:
            print(z, end=", ")
print()
# same in comprehension
print([z for x in multiList for y in x for z in y])
