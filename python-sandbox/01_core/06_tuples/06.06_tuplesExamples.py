#!/usr/bin/python3.12

# ========================================1
print("\n========================================|||:1")

T1 = (1, 9, 1, 6, 3, 4, 5, 1, 1, 2, 5, 6, 7, 8, 9, 2)
T2 = ()
for x in T1:
    if x not in T2:
        T2 += (x,)
print("original tuple:", T1)
print("Unique numbers:", T2)

# ========================================2
print("\n========================================|||:2")

T1 = (1, 9, 1, 6, 3, 4)
ttl = 0
for x in T1:
    ttl += x

print("Sum of all numbers Using loop:", ttl)

ttl = sum(T1)
print("Sum of all numbers sum() function:", ttl)

# ========================================3
print("\n========================================|||:3")

import random

t1 = ()
for i in range(5):
    x = random.randint(0, 100)
    t1 += (x,)
print(t1)
