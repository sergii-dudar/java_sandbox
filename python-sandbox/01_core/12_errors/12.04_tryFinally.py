#!/usr/bin/python3.12

try:
    fh = open("testfile", "w")
    fh.write("This is my test file for exception handling!!")
finally:
    print("Error: can\'t find file or read data")
    fh.close()

print()

try:
    fh = open("testfile", "w")
    try:
        fh.write("This is my test file for exception handling!!")
    finally:
        print("Going to close the file")
        fh.close()
except IOError:
    print("Error: can\'t find file or read data")

# ========================================Exception with Arguments
print("\n========================================|||:Exception with Arguments")


# Define a function here.
def temp_convert(var):
    try:
        return int(var)
    except ValueError as argument:
        print("The argument does not contain numbers\n", argument)


# Call above function here.
temp_convert("xyz")
