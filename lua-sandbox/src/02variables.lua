#!/usr/local/bin/lua

-- global
variable_list = 10;

-- local
local vari;

local d , f = 5 ,10     --declaration of d and f as local variables.
d , f = 5, 10;          --declaration of d and f as global variables.
d, f = 10               --[[declaration of d and f as global variables.
                           Here value of f is nil --]]



-- Variable definition:
local a, b

-- Initialization
a = 10
b = 30

print("value of a:", a)

print("value of b:", b)

-- Swapping of variables
b, a = a, b

print("\nvalue of a:", a)

print("value of b:", b)

f = 70.0/3.0
print("\nvalue of f", f)

print(b == nil)