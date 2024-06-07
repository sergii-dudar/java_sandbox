#!/usr/bin/python3.12

import json
from dataclasses import dataclass


# class Person:
#    def __init__(self, name, age):
#        self.name = name
#        self.age = age
#    def __repr__(self):
#        return f"Person(name={self.name}, age={self.age})"

@dataclass
class Person:
    name: str
    age: int


json_data = '{"name": "John", "age": 30}'
data = json.loads(json_data)

person = Person(**data)
print(person)
