#!/usr/bin/python3.12

from dataclasses import dataclass, field

# The dataclasses module, introduced in Python 3.7, provides a decorator and functions
# for automatically adding special methods to user-defined classes.
# It can generate __init__, __repr__, __eq__, and __hash__ methods automatically.

# ========================================
print("\n========================================|||:")


@dataclass(frozen=True)  # frozen=True makes the instance immutable and hashable
class Person:
    name: str
    age: int = field(repr=False, compare=False, hash=False) # ie loombok exclude


# Creating instances of Person
person1 = Person('Alice', 30)
person2 = Person('Bob', 25)
person3 = Person('Alice', 30)

# Using Person instances as dictionary keys
people_dict = {person1: 'Engineer', person2: 'Doctor'}

# Accessing values using Person instances
print(people_dict[person1])  # Output: Engineer
print(people_dict[person3])  # Output: Engineer (person1 and person3 are considered equal)

# Printing the dictionary
print(people_dict)  # Output: {Person(name='Alice', age=30): 'Engineer', Person(name='Bob', age=25): 'Doctor'}
