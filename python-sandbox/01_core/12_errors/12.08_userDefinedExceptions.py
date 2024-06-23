#!/usr/bin/python3.12

class MyException(Exception):
    """Invalid marks"""
    pass


num = 101
try:
    if num < 0 or num > 100:
        raise MyException
except MyException as e:
    print("Invalid marks:", num)
else:
    print("Marks obtained:", num)
