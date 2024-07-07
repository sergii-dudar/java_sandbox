#!/usr/bin/python3.12

# Instance Attributes       Vs      Class Attributes
# 1	It is defined directly inside the __init__() function. |||	It is defined inside the class but outside the __init__() function.
# 2	Instance attribute is accessed using the object name followed by dot notation. ||| Class attributes can be accessed by both class name and object name.
# 3	The value of this attribute cannot be shared among other objects. ||| Its value is shared among other objects of the class.
# 4	Changes made to the instance attribute affect only the object within which it is defined. ||| Changes made to the class attribute affect all the objects of the given class.


class Employee:
    name = "Bhavesh Aggarwal"
    age = "30"


emp = Employee()
print("Name of the Employee:", emp.name)
print("Age of the Employee:", emp.age)

# ========================================Modifying Class Attributes
print("\n========================================|||:Modifying Class Attributes")


class Employee:
    # class attribute
    empCount = 0

    def __init__(self, name, age):
        self.__name = name
        self.__age = age
        # modifying class attribute
        Employee.empCount += 1
        print("Name:", self.__name, ", Age: ", self.__age)
        # accessing class attribute
        print("Employee Count:", Employee.empCount)


e1 = Employee("Bhavana", 24)
e2 = Employee("Rajesh", 26)

# ========================================Instance Attributes
print("\n========================================|||:Instance Attributes")


class Student:
    def __init__(self, name, grade):
        self.__name = name
        self.__grade = grade
        print("Name:", self.__name, ", Grade:", self.__grade)


student1 = Student("Ram", "B")
student2 = Student("Shyam", "C")

# ========================================
print("\n========================================|||:")
