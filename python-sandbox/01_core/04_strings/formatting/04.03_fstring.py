#!/usr/bin/python3.12

# >= version 3.6

name = 'Rajesh'
age = 23
fstring = f'My name is {name} and I am {age} years old'
print(fstring)

print("\n========================================|||:Expressions Using f-Strings")

price = 10
quantity = 3
fstring = f'Price: {price} Quantity : {quantity} Total : {price * quantity}'
print(fstring)

print("\n========================================|||:Dictionaries Key-Value Using f-string")

user = {'name': 'Ramesh', 'age': 23}
fstring = f"My name is {user['name']} and I am {user['age']} years old"
print(fstring)

print("\n========================================|||:Self Debugging Expression in f-string")

price = 10
quantity = 3
fstring = f"Total : {price*quantity=}"
print(fstring)

print("\n========================================|||:Call User-Defined Function Using f-string")


def total(price, quantity):
    return price * quantity


price = 10
quantity = 3

fstring = f'Price: {price} Quantity : {quantity} Total : {total(price, quantity)}'
print(fstring)

print("\n========================================|||:Precision Handling Using f-string")

name = "Rajesh"
age = 23
percent = 55.50

fstring = f"My name is {name} and I am {age} years old and I have scored {percent:6.3f} percent marks"
print(fstring)

print("\n========================================|||:String Alignment Using f-string")

name = 'TutorialsPoint'
fstring = f'Welcome To {name:>20} The largest Tutorials Library'
print(fstring)

fstring = f'Welcome To {name:<20} The largest Tutorials Library'
print(fstring)

fstring = f'Welcome To {name:^20} The largest Tutorials Library'
print(fstring)

print("\n========================================|||:Print Numbers in Other Formats Using f-string")

num = 20
fstring = f'Hexadecimal : {num:x}'
print(fstring)

fstring = f'Octal :{num:o}'
print(fstring)

fstring = f'Scientific notation : {num:e}'
print(fstring)
