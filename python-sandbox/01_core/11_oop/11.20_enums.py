#!/usr/bin/python3.12

from enum import Enum, unique


class subjects(Enum):
    ENGLISH = 1
    MATHS = 2
    SCIENCE = 3
    SANSKRIT = 3


obj = subjects.MATHS
print(type(obj))

# ======================================== @unique decorator
print("\n========================================|||: @unique decorator")


# To ensure that each member has a unique value bound to it,
# use the @unique decorator.

@unique
class subjects(Enum):
    ENGLISH = 1
    MATHS = 2
    GEOGRAPHY = 3
    SANSKRIT = 4


print(subjects.ENGLISH)

# ========================================
print("\n========================================|||:")

subjects = Enum("subjects", "ENGLISH MATHS SCIENCE SANSKRIT")
print(subjects.ENGLISH)
print(subjects.MATHS)
print(subjects.SCIENCE)
print(subjects.SANSKRIT)

# ========================================
print("\n========================================|||:")


class subjects(Enum):
    ENGLISH = "E"
    MATHS = "M"
    GEOGRAPHY = "G"
    SANSKRIT = "S"


obj = subjects.SANSKRIT
print(type(obj))
print(obj.name)
print(obj.value)

# ========================================Iterating through Enums
print("\n========================================|||:Iterating through Enums")

for sub in subjects:
    print(sub)
print()
for sub in subjects:
    print(sub.name, sub.value)

