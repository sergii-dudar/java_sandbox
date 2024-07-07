#!/usr/bin/python3.12

# The Python interpreter determines which is the appropriate method or
# attribute to invoke based on the object's type or class hierarchy at
# runtime. This means that the specific method or attribute to be
# called is determined dynamically, based on the actual type of the
# object.

class shape:
    def draw(self):
        print("draw method")
        return


class circle(shape):
    def draw(self):
        print("Draw a circle")
        return


class rectangle(shape):
    def draw(self):
        print("Draw a rectangle")
        return


shapes = [circle(), rectangle()]
for shp in shapes:
    shp.draw()

# ========================================Duck Typing
print("\n========================================|||:Duck Typing")


class circle:
    def draw(self):
        print("Draw a circle")
        return


class rectangle:
    def draw(self):
        print("Draw a rectangle")
        return


class area:
    def area(self):
        print("calculate area")
        return
    def draw(self):
        print("Draw an area")
        return


def duck_function(obj):
    obj.draw()


objects = [circle(), rectangle(), area()]
for obj in objects:
    duck_function(obj)

# ========================================
print("\n========================================|||:")

# ========================================
print("\n========================================|||:")

# ========================================
print("\n========================================|||:")

# ========================================
print("\n========================================|||:")
