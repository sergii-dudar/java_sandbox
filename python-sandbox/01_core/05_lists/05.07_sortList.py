#!/usr/bin/python3.12

list1 = ['physics', 'Biology', 'chemistry', 'maths']
print("list before sort", list1)
list1.sort()
print("list after sort : ", list1)

print("Descending sort")

list2 = [10, 16, 9, 24, 5]
print("list before sort", list2)
list2.sort()
print("list after sort : ", list2)

# ========================================Sort List Items with str.lower()
print("\n========================================|||:Sort List Items with str.lower()")

list1 = ['Physics', 'biology', 'Biomechanics', 'psychology']
print("list before sort", list1)
list1.sort(key=str.lower)
print("list after sort : ", list1)

# ========================================Sort List Items with Callback Function
print("\n========================================|||:Sort List Items with Callback Function")


def myfunction(x):
    return x % 10


list1 = [17, 23, 46, 51, 90]
print("list before sort", list1)
list1.sort(key=myfunction)
print("list after sort : ", list1)
