#!/usr/bin/python3.12

# ========================================
print("\n========================================|||:")

lst = [10, 20]
print("lst:", lst, "id(lst):", id(lst))
lst1 = lst
print("lst1:", lst1, "id(lst1):", id(lst1))

# ========================================
print("\n========================================|||:")

lst[0] = 100
print("lst:", lst, "id(lst):", id(lst))
print("lst1:", lst1, "id(lst1):", id(lst1))

# ========================================
print("\n========================================|||:")

lst = [10, 20]
lst1 = lst.copy()
print("lst:", lst, "id(lst):", id(lst))
print("lst1:", lst1, "id(lst1):", id(lst1))

# ========================================
print("\n========================================|||:")

lst[0] = 100
print("lst:", lst, "id(lst):", id(lst))
print("lst1:", lst1, "id(lst1):", id(lst1))

# ========================================
print("\n========================================|||:")
