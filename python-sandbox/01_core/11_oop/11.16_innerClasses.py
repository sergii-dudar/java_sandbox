#!/usr/bin/python3.12

# https://www.tutorialspoint.com/python/python_inner_classes.htm

# Types of Inner Class
# - Multiple Inner Class
# - Multilevel Inner Class

# ========================================Inner Class in Python
print("\n========================================|||:Inner Class in Python")


class student:
    def __init__(self):
        self.name = "Ashish"
        self.subs = self.subjects()
        return

    def show(self):
        print("Name:", self.name)
        self.subs.display()

    class subjects:
        def __init__(self):
            self.sub1 = "Phy"
            self.sub2 = "Che"
            return

        def display(self):
            print("Subjects:", self.sub1, self.sub2)


s1 = student()
s1.show()

# ========================================Multiple Inner Class
print("\n========================================|||:Multiple Inner Class")


class Organization:
    def __init__(self):
        self.inner1 = self.Department1()
        self.inner2 = self.Department2()

    def showName(self):
        print("Organization Name: Tutorials Point")

    class Department1:
        def displayDepartment1(self):
            print("In Department 1")

    class Department2:
        def displayDepartment2(self):
            print("In Department 2")


# instance of OuterClass
outer = Organization()
# Calling show method
outer.showName()

outer.inner1.displayDepartment1()
outer.inner2.displayDepartment2()

# ========================================Multilevel Inner Class
print("\n========================================|||:Multilevel Inner Class")


# It refers to an inner class that itself contains another inner class.
# It creates multiple levels of nested classes.

class Organization:
    def __init__(self):
        self.inner = self.Department()

    def showName(self):
        print("Organization Name: Tutorials Point")

    class Department:
        def __init__(self):
            self.innerTeam = self.Team1()

        def displayDep(self):
            print("In Department")

        class Team1:
            def displayTeam(self):
                print("Team 1 of the department")


outer = Organization()
outer.showName()

outer.inner.displayDep()
outer.inner.innerTeam.displayTeam()
