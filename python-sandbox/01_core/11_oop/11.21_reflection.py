#!/usr/bin/python3.12

# type() Function
# isinstance() Function
# issubclass() Function
# callable() Function
# getattr() Function
# setattr() Function
# hasattr() Function
# dir() Function

print(isinstance(10, int))
print(isinstance(2.56, float))
print(isinstance(2 + 3j, complex))
print(isinstance("Hello World", str))
print(isinstance([1, 2, 3], tuple))
print(isinstance({1: 'one', 2: 'two'}, set))


class test:
    pass


obj = test()
print(isinstance(obj, test))

print(isinstance(int, object))
print(isinstance(str, object))
print(isinstance(test, object))

print(issubclass(int, object))
print(issubclass(str, object))
print(issubclass(test, object))


def test():
    pass


print(callable("Hello"))
print(callable(abs))
print(callable(list.clear([1, 2])))
print(callable(test))


class test:
    def __init__(self):
        pass

    def __call__(self):
        print("Hello")


obj = test()
obj()
print("obj is callable?", callable(obj))


class test:
    def __init__(self):
        self.name = "Manav"


obj = test()
print(getattr(obj, "name"))


class test:
    def __init__(self):
        self.name = "Manav"


obj = test()
setattr(obj, "age", 20)
setattr(obj, "name", "Madhav")
print(obj.name, obj.age)


class test:
    def __init__(self):
        self.name = "Manav"


obj = test()
print(hasattr(obj, "age"))
print(hasattr(obj, "name"))
