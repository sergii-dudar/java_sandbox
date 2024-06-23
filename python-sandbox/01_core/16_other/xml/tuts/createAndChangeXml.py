#!/usr/bin/python3.12

import xml.etree.ElementTree as et

employees = [{'name': 'aaa', 'age': 21, 'sal': 5000}, {'name': 'xyz', 'age': 22, 'sal': 6000}]
root = et.Element("employees")
for employee in employees:
    child = et.Element("employee")
    root.append(child)
    nm = et.SubElement(child, "name")
    nm.text = employee.get('name')
    age = et.SubElement(child, "age")
    age.text = str(employee.get('age'))
    sal = et.SubElement(child, "sal")
    sal.text = str(employee.get('sal'))
tree = et.ElementTree(root)
with open('employees.xml', "wb") as fh:
    tree.write(fh)

print()

tree = et.ElementTree(file='employees.xml')
root = tree.getroot()
employees = []
children = list(root)
for child in children:
    employee = {}
    pairs = list(child)
    for pair in pairs:
        employee[pair.tag] = pair.text
    employees.append(employee)
print(employees)

print()

# tree = et.ElementTree(file='employees.xml')
# root = tree.getroot()
# for x in root.iter('employee'):
#     s = int(x.age)
#     s = s + 100
#     x.text = str(s)
# with open("employees.xml", "wb") as fh:
#     tree.write(fh)
