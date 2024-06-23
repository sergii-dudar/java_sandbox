#!/usr/bin/python3.12

try:
    fh = open("testfile", "w")
    fh.write("This is my test file for exception handling!!")
except IOError:
    print("Error: can\'t find file or read data")
else:
    print("Written content in the file successfully")
    fh.close()

try:
    fh = open("testfile", "r")
    fh.write("This is my test file for exception handling!!")
except IOError:
    print("Error: can\'t find file or read data")
else:
    print("Written content in the file successfully")

# ========================================The try-finally Clause
print("\n========================================|||:The try-finally Clause")

try:
    fh = open("testfile", "w")
    fh.write("This is my test file for exception handling!!")
finally:
    print("Error: can\'t find file or read data")

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

# ========================================Argument of an Exception
print("\n========================================|||:Argument of an Exception")


# Define a function here.
def temp_convert(var):
    try:
        return int(var)
    except ValueError as Argument:
        print("The argument does not contain numbers\n", Argument)


# Call above function here.
temp_convert("xyz")

# ========================================Raising an Exceptions
print("\n========================================|||:Raising an Exceptions")


def functionName(level):
    if level < 1:
        raise "Invalid level!"
        # The code below to this would not be executed
        # if we raise the exception


# functionName(0)
functionName(2)

# ========================================User-Defined Exceptions
print("\n========================================|||:User-Defined Exceptions")


class NetworkError(RuntimeError):
    def __init__(self, message):
        self.message = message


ex = NetworkError("Bad hostname")

try:
    raise NetworkError("Bad hostname")
except NetworkError as e:
    print(e.message)
