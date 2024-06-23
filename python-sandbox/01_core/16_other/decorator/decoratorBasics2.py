#!/usr/bin/python3.12

# https://www.tutorialspoint.com/python/python_decorators.htm

def my_function(x):
    print("The number is=", x)


def my_decorator(some_function, num):
    def wrapper(num):
        print("Inside wrapper to check odd/even")
        if num % 2 == 0:
            ret = "Even"
        else:
            ret = "Odd!"
        some_function(num)
        return ret

    print("wrapper function is called")
    return wrapper


no = 10
my_function = my_decorator(my_function, no)
print("It is ", my_function(no))

# ========================================
print("\n========================================|||:")


def my_decorator(some_function):
    def wrapper(num):
        print("Inside wrapper to check odd/even")
        if num % 2 == 0:
            ret = "Even"
        else:
            ret = "Odd!"
        some_function(num)
        return ret

    print("wrapper function is called")
    return wrapper


@my_decorator
def my_function(x):
    print("The number is=", x)


no = 10
print("It is ", my_function(no))

# ========================================@classmethod Decorator
print("\n========================================|||:@classmethod Decorator")


class counter:
    count = 0

    def __init__(self):
        print("init called by ", self)
        counter.count = counter.count + 1
        print("count=", counter.count)

    @classmethod
    def showcount(cls):
        print("called by ", cls)
        print("count=", cls.count)


c1 = counter()
c2 = counter()
print("class method called by object")
c1.showcount()
print("class method called by class")
counter.showcount()

# ========================================@staticmethod Decorator
print("\n========================================|||:@staticmethod Decorator")


class counter:
    count = 0

    def __init__(self):
        print("init called by ", self)
        counter.count = counter.count + 1
        print("count=", counter.count)

    @staticmethod
    def showcount():
        print("count=", counter.count)


c1 = counter()
c2 = counter()
print("class method called by object")
c1.showcount()
print("class method called by class")
counter.showcount()

# ========================================@property Decorator
print("\n========================================|||:@property Decorator")


class car:
    def __init__(self, speed=40):
        self._speed = speed
        return

    @property
    def speed(self):
        return self._speed

    @speed.setter
    def speed(self, speed):
        if speed < 0 or speed > 100:
            print("speed limit 0 to 100")
            return
        self._speed = speed
        return


c1 = car()
print(c1.speed)  # calls getter
c1.speed = 60  # calls setter
