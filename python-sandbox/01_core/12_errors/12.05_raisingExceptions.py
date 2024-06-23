#!/usr/bin/python3.12

def function_name(level):
    if level < 1:
        raise Exception(level)
        # The code below to this would not be executed
        # if we raise the exception
    return level


try:
    l = function_name(-10)
    print("level=", l)
except Exception as e:
    print("error in level argument", e.args[0])
