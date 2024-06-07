#!/usr/bin/python3.12

import xml.etree.ElementTree as ET
from dataclasses import dataclass


@dataclass
class Person:
    name: str
    age: int


xml_data = '''
<person>
    <name>John</name>
    <age>30</age>
</person>
'''

root = ET.fromstring(xml_data)

name = root.find('name').text
age = int(root.find('age').text)

person = Person(name, age)
print(person)
