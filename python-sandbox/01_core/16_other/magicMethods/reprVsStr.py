#!/usr/bin/python3.12

# __repr__() is designed to offer a formal string representation of an object intended for use by the programmer
# __str__() is used to generate an informal string representation of the object that is directed towards the end-user
#  if a class doesn't define a .str() method, then the str() method will use the .repr() method as a default

# ========================================default (from Object base class)
print("\n========================================|||:default (from Object base class)")


class Student:
    def __init__(self, name, roll_no):
        self.name = name
        self.roll_no = roll_no


stu_obj = Student("John", "101")
print(repr(stu_obj))  # <__main__.Student object at 0x733772de1c10>
print(str(stu_obj))  # <__main__.Student object at 0x733772de1c10>

# ========================================_repr__()
print("\n========================================|||:_repr__()")


class Student:
    def __init__(self, name, roll_no):
        self.name = name
        self.roll_no = roll_no

    def __repr__(self):
        class_name = type(self).__name__
        return f"{class_name}(name={self.name!r}, roll_no={self.roll_no!r})"


stu_obj = Student("John", "101")
print(repr(stu_obj))
print(str(stu_obj))

# ========================================__str__()
print("\n========================================|||:__str__()")


class Student:
    def __init__(self, name, roll_no):
        self.name = name
        self.roll_no = roll_no

    def __repr__(self):
        class_name = type(self).__name__
        return f"{class_name}(name={self.name!r}, roll_no={self.roll_no!r})"

    def __str__(self):
        return self.name


stu_obj = Student("John", "101")
print(repr(stu_obj))
print(str(stu_obj))

# ========================================
print("\n========================================|||:")


class Student:
    def __init__(self, name, roll_no):
        self.name = name
        self.roll_no = roll_no

    def __repr__(self):
        class_name = type(self).__name__
        return f"{class_name}(name={self.name!r}, roll_no={self.roll_no!r})"

    def __str__(self):
        return f"{self.name}'s roll_no={self.roll_no}"


stu_obj = Student("John", "101")
print(repr(stu_obj))
print(str(stu_obj))
