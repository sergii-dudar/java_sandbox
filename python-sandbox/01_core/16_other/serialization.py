#!/usr/bin/python3.12

from pickle import *

# ========================================
print("\n========================================|||:")

with open("data.txt", "wb") as f:
    dct = {"name": "Ravi", "age": 23, "Gender": "M", "marks": 75}
    dump(dct, f)

with open("data.txt", "rb") as f:
    d = load(f)
    print(d)

# ========================================
print("\n========================================|||:")

class Person:
    def __init__(self):
        self.name = "XYZ"
        self.age = 22

    def show(self):
        print("name:", self.name, "age:", self.age)


p1 = Person()
with open("data.txt", "wb") as f:
    dump(p1, f)

print("unpickled")

with open("data.txt", "rb") as f:
    p1 = load(f)
    p1.show()
