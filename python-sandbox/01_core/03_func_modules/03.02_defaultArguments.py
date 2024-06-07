#!/usr/bin/python3.12

# Function definition is here
def printinfo(name, age=35):
    "This prints a passed info into this function"
    print("Name: ", name)
    print("Age ", age)
    return


# Now you can call printinfo function
printinfo(age=50, name="miki")
printinfo(name="miki")

# ========================================
print("\n========================================|||:")


def percent(phy, maths, maxmarks=200):
    val = (phy + maths) * 100 / maxmarks
    return val


phy = 60
maths = 70
print(percent(phy, maths))

phy = 40
maths = 46
print(percent(phy, maths, 100))

# ========================================Calling Function Without Keyword Arguments
print("\n========================================|||:Calling Function Without Keyword Arguments")


def percent(phy, maths, maxmarks=200):
    val = (phy + maths) * 100 / maxmarks
    return val

phy = 60
maths = 70
result = percent(phy, maths)
print("percentage:", result)

phy = 40
maths = 46
result = percent(phy, maths, 100)
print("percentage:", result)
