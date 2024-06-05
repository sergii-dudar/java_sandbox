#!/usr/bin/python3.12

import myModule1 as mod1
import myModule2 as mod2

mod1.sayHello("Serhii")

print(dir(mod2))

print("sum:", mod2.sum(10, 20))
print("average:", mod2.average(10, 20))
print("power:", mod2.power(10, 2))

# ----------------The from ... import Statement
print("\n|||:The from ... import Statement")

from myModule2 import sum, average

print("sum:", sum(10, 20))
print("average:", average(10, 20))

# ----------------The from...import * Statement
print("\n|||:The from ... import Statement")

from myModule2 import *

print("average:", power(10, 20))

# ----------------The import ... as Statement
print("\n|||:The import ... as Statement")

import myModule2 as x

print("sum:", x.sum(10, 20))
print("average:", x.average(10, 20))
print("power:", x.power(10, 2))

# ----------------Module Attributes
print("\n|||:Module Attributes")

# __file__ returns the physical name of the module.
# __package__ returns the package to which the module belongs.
# __doc__ returns the docstring at the top of the module if any
# __dict__ returns the entire scope of the module
# __name__ returns the name of the module

import myModule3 as nameAttr

print("__file__ attribute:", nameAttr.__file__)
print("__doc__ attribute:", nameAttr.__doc__)
print("__name__ attribute:", nameAttr.__name__)
print("__name__ attribute:", __name__ ) #  __main__ that means it's run from current file as runnable file


# ----------------Packages
print("\n|||:Packages")

import multi_packages as multi

print(multi.power(10, 2))
print(multi.sum1(10, 2))
print(multi.average(10, 2))

