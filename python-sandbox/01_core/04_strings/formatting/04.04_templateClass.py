#!/usr/bin/python3.12

from string import Template

print()
temp_str = "My name is $name and I am $age years old"
tempobj = Template(temp_str)
ret = tempobj.substitute(name='Rajesh', age=23)
print(ret)

# ========================================Unpacking Dictionary Key-Value Pairs
print("\n========================================|||:Unpacking Dictionary Key-Value Pairs")

student = {'name': 'Rajesh', 'age': 23}
temp_str = "My name is $name and I am $age years old"
tempobj = Template(temp_str)
ret = tempobj.substitute(**student)

print(ret)
