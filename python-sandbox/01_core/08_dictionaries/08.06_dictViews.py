#!/usr/bin/python3.12

# ========================================items()
print("\n========================================|||:items()")

numbers = {10: "Ten", 20: "Twenty", 30: "Thirty", 40: "Forty"}
obj = numbers.items()
print('type of obj: ', type(obj))
print(obj)
print("update numbers dictionary")
numbers.update({50: "Fifty"})
print("View automatically updated")
print(obj)

# ========================================keys()
print("\n========================================|||:keys()")

numbers = {10: "Ten", 20: "Twenty", 30: "Thirty", 40: "Forty"}
obj = numbers.keys()
print('type of obj: ', type(obj))
print(obj)
print("update numbers dictionary")
numbers.update({50: "Fifty"})
print("View automatically updated")
print(obj)

# ========================================values() Method
print("\n========================================|||:values() Method")

numbers = {10: "Ten", 20: "Twenty", 30: "Thirty", 40: "Forty"}
obj = numbers.values()
print('type of obj: ', type(obj))
print(obj)
print("update numbers dictionary")
numbers.update({50: "Fifty"})
print("View automatically updated")
print(obj)
