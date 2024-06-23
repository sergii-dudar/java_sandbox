#!/usr/bin/python3.12

from string import Template

# ========================================String Formatting Operator
print("\n========================================|||:String Formatting Operator")

print("My name is %s and weight is %d kg!" % ('Zara', 21))

# ========================================The format() Method
print("\n========================================|||:The format() Method")

name = "Rajesh"
age = 23

print("my name is {} and my age is {} years".format(name, age))
print("my name is {name} and my age is {age} years".format(name="Rajesh", age=23))
print("my name is {:s} and my age is {:d} years".format(name, age))

# ========================================f-strings
print("\n========================================|||:f-strings")

fstring = f'My name is {name} and I am {age} years old'
print(fstring)

# ========================================Template Strings
print("\n========================================|||:Template Strings")

temp_str = "My name is $name and I am $age years old"
tempObj = Template(temp_str)
ret = tempObj.substitute(name='Rajesh', age=23)
print(ret)

tempStr = Template('Hello. My name is $name and my age is $age')
newStr = tempStr.substitute(name='Pushpa', age=26)
print(newStr)

dct = {'name': 'Pushpalata', 'age': 25}
newStr = tempStr.substitute(dct)
print(newStr)

# dct = {'name': 'Pushpalata'}
# newStr = tempStr.substitute(dct) # error: KeyError: 'age'
# print(newStr)

dct = {'name': 'Pushpalata'}
newStr = tempStr.safe_substitute(dct)
print(newStr)

print(tempStr.is_valid())
tempStr = Template('Hello. My name is $name and my age is $age')
print(tempStr.get_identifiers())  # ['name', 'age']
