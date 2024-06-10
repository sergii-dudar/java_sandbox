#!/usr/bin/python3.12

# Import module to keep track of time
import time

# Syntax:
# newlist = [expression for item in iterable if condition == True]

person = ["Piyali", "Hiya", "Rudrashish", "Badsha", "Lipi"]
print([x for x in person if "i" in x])

numbers = [3, 5, 1, 7, 3, 9]
print([n ** 2 for n in numbers])

print([alpha for alpha in 'javatpoint'])

print([num for num in range(30) if num % 2 != 0])

# ========================================
print("\n========================================|||:")


# defining function to execute for loop
def for_loop(num):
    l = []
    for i in range(num):
        l.append(i + 10)
    return l


# defining function to execute list comprehension
def list_comprehension(num):
    return [i + 10 for i in range(num)]


# Giving values to the functions

# Calculating time taken by for loop
start = time.time()
for_loop(10000000)
end = time.time()

print('Time taken by for loop:', (end - start))

# Calculating time taken by list comprehension
start = time.time()
list_comprehension(10000000)
end = time.time()

print('Time taken by list comprehension:', (end - start))

# ========================================Addition of odd elements to the List
print("\n========================================|||:Addition of odd elements to the List")


def sumTest(n):
    dsum = 0
    for ele in str(n):
        dsum += int(ele)
    return dsum


listTest = [47, 69, 73, 97, 105, 845, 307]
newList = [sumTest(i) for i in listTest if i & 1]
print(newList)

# ========================================Nested List Comprehensions
print("\n========================================|||:Nested List Comprehensions")

nested_list = []

for _ in range(3):

    # Append an empty sublist inside the list
    nested_list.append([])

    for __ in range(5):
        nested_list[_].append(__ + _)

print(nested_list)

#####vs

print([[_ + __ for _ in range(5)] for __ in range(3)])
