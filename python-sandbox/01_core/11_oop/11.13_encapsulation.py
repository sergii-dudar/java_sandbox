#!/usr/bin/python3.12

class Student:

    def __init__(self, name="Rajaram", marks=50):
        self.__name = name
        self.__marks = marks

    def studentdata(self):
        print("Name: {} marks: {}".format(self.__name, self.__marks))


s1 = Student()
s2 = Student("Bharat", 25)

s1.studentdata()
s2.studentdata()
print("Name: {} marks: {}".format(s1.__name, s2.__marks))
print("Name: {} marks: {}".format(s2.__name, __s2.marks))

print (s1._Student__marks)