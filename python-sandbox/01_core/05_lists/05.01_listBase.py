#!/usr/bin/python3.12

list1 = ["Rohan", "Physics", 21, 69.75]
list2 = [1, 2, 3, 4, 5]
list3 = ["a", "b", "c", "d"]
list4 = [25.50, True, -55, 1 + 2j]

# ========================================Accessing Values in Lists
print("\n========================================|||:Accessing Values in Lists")

list1 = ['physics', 'chemistry', 1997, 2000]
list2 = [1, 2, 3, 4, 5, 6, 7]
print("list1[0]: ", list1[0])
print("list2[1:5]: ", list2[1:5])

# ========================================Updating Lists
print("\n========================================|||:Updating Lists")

list = ['physics', 'chemistry', 1997, 2000]
print("Value available at index 2 : ")
print(list[2])
list[2] = 2001
print("New value available at index 2 : ")
print(list[2])

# ========================================Delete List Elements
print("\n========================================|||:Delete List Elements")

list1 = ['physics', 'chemistry', 1997, 2000]
print(list1)
del list1[2]
print("After deleting value at index 2 : ")
print(list1)

# ========================================Loop Through List Items
print("\n========================================|||:Loop Through List Items")

lst = [25, 12, 10, -21, 10, 100]
for num in lst:
    print(num, end=' ')

# ========================================Loop Through List Items with Index
print("\n========================================|||:Loop Through List Items with Index")

lst = [25, 12, 10, -21, 10, 100]
indices = range(len(lst))
for i in indices:
    print("lst[{}]: ".format(i), lst[i])

# ========================================1
print("\n========================================|||:1")

L1 = [1, 9, 1, 6, 3, 4, 5, 1, 1, 2, 5, 6, 7, 8, 9, 2]
L2 = []
for x in L1:
    if x not in L2:
        L2.append(x)
print(L2)

# ========================================2
print("\n========================================|||:2")

L1 = [1, 9, 1, 6, 3, 4]
ttl = 0
for x in L1:
    ttl += x
print("Sum of all numbers Using loop:", ttl)
ttl = sum(L1)
print("Sum of all numbers sum() function:", ttl)

# ========================================3
print("\n========================================|||:3")

import random

L1 = []
for i in range(5):
    x = random.randint(0, 100)
    L1.append(x)
print(L1)
