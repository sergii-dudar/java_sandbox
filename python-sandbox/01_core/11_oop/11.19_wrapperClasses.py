#!/usr/bin/python3.12

def decorator_function(Wrapped):
    class Wrapper:
        def __init__(self, x):
            self.wrap = Wrapped(x)

        def print_name(self):
            return self.wrap.name

    return Wrapper


@decorator_function
class Wrapped:
    def __init__(self, x):
        self.name = x


obj = Wrapped('TutorialsPoint')
print(obj.print_name())
