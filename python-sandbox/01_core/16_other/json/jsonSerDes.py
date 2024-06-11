#!/usr/bin/python3.12

import json


class Address:
    def __init__(self, street, city):
        self.street = street
        self.city = city

    def __repr__(self):
        return f"Address(street={self.street}, city={self.city})"


class Person:
    def __init__(self, name, age, address):
        self.name = name
        self.age = age
        self.address = address

    def __repr__(self):
        return f"Person(name={self.name}, age={self.age}, address={self.address})"


def address_to_dict(address):
    return {
        'street': address.street,
        'city': address.city
    }


def person_to_dict(person):
    return {
        'name': person.name,
        'age': person.age,
        'address': address_to_dict(person.address)
    }


def dict_to_address(d):
    return Address(street=d['street'], city=d['city'])


def dict_to_person(d):
    return Person(name=d['name'], age=d['age'], address=dict_to_address(d['address']))


# Create instances
address = Address(street='123 Main St', city='Springfield')
person = Person(name='Alice', age=30, address=address)

# Serialize to JSON
person_json = json.dumps(person, default=person_to_dict)
print("Serialized JSON:",
      person_json)  # Output: {"name": "Alice", "age": 30, "address": {"street": "123 Main St", "city": "Springfield"}}

# Deserialize from JSON
# person_obj = json.loads(person_json, object_hook=dict_to_person)
person_obj = dict_to_person(json.loads(person_json))
print("Deserialized Object:",
      person_obj)  # Output: Person(name=Alice, age=30, address=Address(street=123 Main St, city=Springfield))
