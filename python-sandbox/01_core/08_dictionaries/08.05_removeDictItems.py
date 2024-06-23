#!/usr/bin/python3.12

# - using the del keyword
# - using the pop() method
# - using the popitem() method
# - using the clear() method
# - using dictionary comprehension

# ========================================Using del Keyword
print("\n========================================|||:Using del Keyword")

numbers = {10: "Ten", 20: "Twenty", 30: "Thirty", 40: "Forty"}
print("numbers dictionary before delete operation: \n", numbers)
del numbers[20]
print("numbers dictionary before delete operation: \n", numbers)

del numbers
# print ("numbers dictionary before delete operation: \n", numbers) # err

# ========================================Using pop() Method
print("\n========================================|||:Using pop() Method")

numbers = {10: "Ten", 20: "Twenty", 30: "Thirty", 40: "Forty"}
print("numbers dictionary before pop operation: \n", numbers)
val = numbers.pop(20)
print("nubvers dictionary after pop operation: \n", numbers)
print("Value popped: ", val)

# ========================================Using popitem() Method
print("\n========================================|||:Using popitem() Method")

numbers = {10: "Ten", 20: "Twenty", 30: "Thirty", 40: "Forty"}
print("numbers dictionary before pop operation: \n", numbers)
val = numbers.popitem()
print("numbers dictionary after pop operation: \n", numbers)
print("Value popped: ", val)

# ========================================Using clear() Method
print("\n========================================|||:Using clear() Method")

numbers = {10: "Ten", 20: "Twenty", 30: "Thirty", 40: "Forty"}
print("numbers dictionary before clear method: \n", numbers)
numbers.clear()
print("numbers dictionary after clear method: \n", numbers)

# ========================================Using Dictionary Comprehension
print("\n========================================|||:Using Dictionary Comprehension")

# Creating a dictionary
student_info = {
    "name": "Alice",
    "age": 21,
    "major": "Computer Science"
}

# Removing items based on conditions
keys_to_remove = ["age", "major"]
for key in keys_to_remove:
    student_info.pop(key, None)

print(student_info)
