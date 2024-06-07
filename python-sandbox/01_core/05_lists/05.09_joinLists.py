#!/usr/bin/python3.12

# ========================================
print("\n========================================|||:")

L1 = [10, 20, 30, 40]
L2 = ['one', 'two', 'three', 'four']
L3 = L1 + L2
print("Joined list:", L3)

# ========================================
print("\n========================================|||:")

L1 = [10, 20, 30, 40]
L2 = ['one', 'two', 'three', 'four']
L1 += L2
print("Joined list:", L1)

# ========================================extend()
print("\n========================================|||:extend()")
# The same result can be obtained by using the extend() method.

L1 = [10, 20, 30, 40]
L2 = ['one', 'two', 'three', 'four']
L1.extend(L2)
print("Joined list:", L1)

# ========================================Join Python Lists by Appending Items
print("\n========================================|||:Join Python Lists by Appending Items")

L1 = [10, 20, 30, 40]
L2 = ['one', 'two', 'three', 'four']

for x in L2:
    L1.append(x)

print("Joined list:", L1)

# ========================================
print("\n========================================|||:")
