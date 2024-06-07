#!/usr/bin/python3.12

def myfunction(a: int, b: int) -> int:
    c = a + b
    return c


print(myfunction(10, 20))
print(myfunction("Hello ", "Python"))

# ========================================Parameters metadata With Annotations Expression
print("\n========================================|||:Parameters metadata With Annotations Expression")


def total(x: 'marks in Physics', y: 'marks in chemistry'):
    return x + y


# with default args
def myfunction(a: "physics", b: "Maths" = 20) -> int:
    c = a + b
    return c


print(myfunction(10))

# You can check with dir() function.
print(dir(myfunction))
print(myfunction.__annotations__)


# --------
def myfunction(*args: "arbitrary args", **kwargs: "arbitrary keyword args") -> int:
    pass


print(myfunction.__annotations__)


def division(num: dict(type=float, msg='numerator'), den: dict(type=float, msg='denominator')) -> float:
    return num / den


print(division.__annotations__)
