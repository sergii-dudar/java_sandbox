#!/usr/bin/python3.12

import enum


# we will use enum class for creating enumerations
class Weekdays(enum.Enum):
    Sunday = 1
    Monday = 2
    Tuesday = 3
    Wednesday = 4
    Thursday = 5
    Friday = 6
    Saturday = 7


# we will print the enum member as the string
print(" The member of Enum class as the string is : ", end=" ")
print(Weekdays.Monday)

# we will print the enum member as a repr object
print(" The member of Enum class as a repr is : ", end=" ")
print(repr(Weekdays.Sunday))

# now we will check the type of enum member
print(" The type of the member of Enum class is : ", end=" ")
print(type(Weekdays.Saturday))

# we will print name of enum member
print(" The name of the member of Enum class is : ", end=" ")
print(Weekdays.Friday.name)

print(" The member of Enum class are : ")
for weekday in Weekdays:
    print(weekday)

# ========================================
print("\n========================================|||:How to Hash Enum Class")


# The members of the Enum class are called Enumeration, and also hashable. Therefore,
# these members can be used for sets and dictionaries.

# we will use enum class for creating enumerations
class Days(enum.Enum):
    Sunday = 1
    Monday = 2
    Tuesday = 3
    Wednesday = 4
    Thursday = 5
    Friday = 6
    Saturday = 7


# we will Hash for creating a dictionary
Daytype = {}
Daytype[Days.Sunday] = 'Sun God'
Daytype[Days.Monday] = 'Mon God'
# now we will Check if the hashing is successful
if Daytype == {Days.Sunday: 'Sun God', Days.Monday: 'Mon God'}:
    print(" Enum class is hashed ")
else:
    print(" Enum class is not hashed ")

# ========================================
print("\n========================================|||:Haccess Enum members")

print('The member of Enum class accessed by name: ')
print(Days['Monday'])
print('The member of Enum class accessed by name: ')
print(Days['Friday'])
print('The member of Enum class accessed by Value: ')
print(Days(1))
print('The member of Enum class accessed by Value: ')
print(Days(5))

# ========================================
print("\n========================================|||:How to Compare the Enums")


# To compare the Enums, We use the following methods:
# - Using the "==" and "!=" Operator
# - Using the "is" Operator
# - Using the "in" Operator
# equality done by enum values (numbers)

class Days(enum.Enum):
    Sunday = 1
    Monday = 2
    Tuesday = 1
    Wednesday = 4
    Thursday = 5
    Friday = 4
    Saturday = 7


if Days.Sunday == Days.Tuesday:
    print('Match')
else:
    print('Do not Match')

if Days.Monday != Days.Tuesday:
    print('Do not Match')
else:
    print('Match')

if Days.Wednesday == Days.Friday:
    print('Match')
else:
    print('Do not Match')

if Days.Thursday != Days.Friday:
    print('Do not Match')
else:
    print('Match')
