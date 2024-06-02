#!/usr/bin/python3.12

var = "3/4"
print(var)  # 3/4
var = "\u00BE"
print(var)  # ¾

var = "\u0031\u0030"
print(var)  # 10

# ------------- encoding to bytes \ from bytes
string1 = "Hello"
bytes1 = string1.encode('utf-8')
print(bytes1)
string1 = bytes1.decode('utf-8')
print(string1)

# ---------------

print()
string2 = "\u20B9"
print(string2)
bytes2 = string2.encode('utf-8')
print(bytes2)
string2 = bytes2.decode('utf-8')
print(string2)
