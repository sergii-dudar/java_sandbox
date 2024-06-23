#!/usr/bin/python3.12

capitals = {"Maharashtra": "Mumbai", "Gujarat": "Gandhinagar",
            "Telangana": "Hyderabad", "Karnataka": "Bengaluru"}
print("Capital of Gujarat is : ", capitals['Gujarat'])
print("Capital of Karnataka is : ", capitals['Karnataka'])
# print ("Captial of Haryana is : ", capitals['Haryana']) # KeyError: 'Haryana'


# ======================================== get
print("\n========================================|||:get")

print("Capital of Gujarat is: ", capitals.get('Gujarat'))
print("Capital of Karnataka is: ", capitals.get('Karnataka'))
print("Capital of Haryana is : ", capitals.get('Haryana'))
print("Capital of Haryana is : ", capitals.get('Haryana', 'Not found'))

# ========================================Access Dictionary Keys
print("\n========================================|||:Access Dictionary Keys")

# Creating a dictionary with keys and values
student_info = {
    "name": "Alice",
    "age": 21,
    "major": "Computer Science"
}
# Accessing all keys using the keys() method
all_keys = student_info.keys()
print("Keys:", all_keys)

# ========================================Access Dictionary Values
print("\n========================================|||:Access Dictionary Values")

# Accessing all values using the values() method
all_values = student_info.values()
print("Values:", all_values)

# ========================================items() Function
print("\n========================================|||:items() Function")

# Using the items() method to get key-value pairs
all_items = student_info.items()
print("Items:", all_items)

# Iterating through the key-value pairs
print("Iterating through key-value pairs:")
for key, value in all_items:
    print(f"{key}: {value}")

print()
for item in all_items:
    print(f"{item} -> {item[0]}: {item[1]}")