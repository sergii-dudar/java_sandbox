#!/usr/bin/python3.12

tup1 = ("a", "b", "c", "d")
# tup1[2] = 'Z' - error, tuple is immutable
# print ("tup1: ", tup1)

# ======================================== change by converting to list and back
print("\n========================================|||: change by converting to list and back")

tup1 = ("a", "b", "c", "d")
print("Tuple before update", tup1, "id(): ", id(tup1))

list1 = list(tup1)
list1[2] = 'F'
list1.append('Z')
list1.sort()
print("updated list", list1)

tup1 = tuple(list1)
print("Tuple after update", tup1, "id(): ", id(tup1))
