#!/usr/bin/python3.12

#from jsonschema import validate
import json


def validate_JSON(Data):
    try:
        json.loads(Data)
    except ValueError as err:
        return False
    return True


Data1 = """{"name": "ABC", "salary": 19000, "ID": "12345",}"""
isValid = validate_JSON(Data1)

print("This JSON string is Valid: ", isValid)

Data2 = """{"name": "XYZ", "salary": 39000, "ID": "00001"}"""
isValid = validate_JSON(Data2)

print("This JSON string is Valid: ", isValid)

# ========================================
print("\n========================================|||:")
