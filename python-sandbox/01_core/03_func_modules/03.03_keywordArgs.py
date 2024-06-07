#!/usr/bin/python3.12

# Function definition is here
def printInfo(name, age):
    "This prints a passed info into this function"
    print("Name: ", name)
    print("Age ", age)
    return


# Now you can call printinfo function
# by positional arguments
printInfo("Naveen", 29)

# by keyword arguments
printInfo(name="miki", age=30)

# ========================================
print("\n========================================|||:")


def division(num, den):
    quotient = num / den
    print("num:{} den:{} quotient:{}".format(num, den, quotient))


division(10, 5)
division(5, 10)
division(num=10, den=5)
division(den=5, num=10)
division(10, den=5)
