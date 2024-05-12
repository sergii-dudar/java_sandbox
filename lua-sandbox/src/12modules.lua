#!/usr/local/bin/lua

-- Method 1
require "libs.mymath" -- import in mymath variable, only in case defined as global in module
mymath.add(1, 2)

-- Method 2
local mymath1 = require "libs.mymath"
mymath1.add(1, 2)

-- Method 3
local add = require "libs.mymath".add
add(1, 2)


--------------
print()

mymathmodule = require("libs.mymath")
mymathmodule.add(10,20)
mymathmodule.sub(30,20)
mymathmodule.mul(10,20)
mymathmodule.div(30,20)