#!/usr/bin/python3.12

# sum of numbers
def add(*args):
    s = 0
    for x in args:
        s = s + x
    return s


print(add(10, 20, 30, 40))
print(add(1, 2, 3))

# ======================================== Required Arguments With Arbitrary Arguments
print("\n========================================|||: Required Arguments With Arbitrary Arguments")


def avg(first, *rest):
    second = max(rest)
    return (first + second) / 2


result = avg(40, 30, 50, 25)
print(result)

# ======================================== Arbitrary Keyword Arguments (**kwargs)
print("\n========================================|||: Arbitrary Keyword Arguments (**kwargs)")


# If a variable in the argument list has two asterisks prefixed to it, the function
# can accept arbitrary number of keyword arguments. The variable becomes a dictionary of keyword:value pairs.

def addr(**kwargs):
    for k, v in kwargs.items():
        print("{}:{}".format(k, v))


print("pass two keyword args")
addr(Name="John", City="Mumbai")
print("pass four keyword args")

# pass four keyword args
addr(Name="Raam", City="Mumbai", ph_no="9123134567", PIN="400001")

# ======================================== Arbitrary Keyword Arguments (**kwargs)
print("\n========================================|||: Multiple Arguments With Arbitrary Keyword Arguments")


def percent(math, sci, **optional):
    print("maths:", math)
    print("sci:", sci)
    s = math + sci
    for k, v in optional.items():
        print("{}:{}".format(k, v))
        s = s + v
    return s / (len(optional) + 2)


result = percent(math=80, sci=75, Eng=70, Hist=65, Geo=72)
print("percentage:", result)

# ======================================== custom print
print("\n========================================|||: custom print")


def myPrint(*args, sep=',', end='; '):
    print(*args, sep=sep, end=end)


myPrint("hello", "python")

# ======================================== unpack args
print("\n========================================|||: unpack args")


def printDict(**argDict1):
    print(argDict1)


def printList(*argList1):
    print(argList1)


dict1 = {"name1": "1", "name2": "2"}
list1 = ["name1", "name2"]
tuple1 = ("name1", "name2")
set1 = {"name1", "name2"}
string1 = "name1"

# printDict(dict1) - print args
printDict(**dict1)  # {'name1': '1', 'name2': '2'}
print()
printList(list1)  # (['name1', 'name2'],)
printList(tuple1)  # (('name1', 'name2'),)
printList(set1)  # ({'name1', 'name2'},)
printList(string1)  # ('name1',)
print()
printList(*list1)  # ('name1', 'name2')
printList(*tuple1)  # ('name1', 'name2')
printList(*set1)  # ('name1', 'name2')
printList(*string1)  # ('n', 'a', 'm', 'e', '1')
