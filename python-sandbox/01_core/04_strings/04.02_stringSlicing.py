#!/usr/bin/python3.12

var = "HELLO PYTHON"
print(var[0])
print(var[7])
print(var[11])

# ========================================String Slicing
print("\n========================================|||:String Slicing")

print("var:", var)
print("var[3:8]:", var[3:8])
print("var[-9:-4]:", var[-9:-4])

print("var[0:5]:", var[0:5])
print("var[:5]:", var[:5])

print("var[6:12]:", var[6:12])
print("var[6:]:", var[6:])

print("var[0:12]:", var[0:12])
print("var[:]:", var[:])

print("var[-1:7]:", var[-1:7])
print("var[7:0]:", var[7:0])

print("var[:6][:2]:", var[:6][:2])
