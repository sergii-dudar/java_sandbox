#!/usr/bin/python3.12

def printBits(a, b):
    print("a:", bin(a))
    if b:
        print("b:", bin(b))


# ======================================== Bitwise AND Operator (&)
print("\n========================================|||Bitwise AND Operator (&):")
a = 60
b = 13
printBits(a, b)
print("a:", a, "b:", b, "a&b:", a & b)
print(int('00001100', 2))

# ======================================== Python Bitwise OR Operator (|)
print("\n========================================|||Python Bitwise OR Operator (|):")

a = 60
b = 13
printBits(a, b)
print("a:", a, "b:", b, "a|b:", a | b)

# ======================================== Bitwise XOR Operator (^)
print("\n========================================|||Bitwise XOR Operator (^):")
a = 60
b = 13
printBits(a, b)
print("a:", a, "b:", b, "a^b:", a ^ b)

# ======================================== Bitwise NOT Operator (~)
print("\n========================================|||Bitwise NOT Operator (~):")
a = 60
printBits(a, None)
print("a:", a, "~a:", ~a)

# ======================================== Bitwise Left Shift Operator (<<)
print("\n========================================|||Bitwise Left Shift Operator (<<):")
print("a:", a, "a<<2:", a << 2)

# ======================================== Bitwise Right Shift Operator (>>)
print("\n========================================|||Bitwise Right Shift Operator (>>):")
print("a:", a, "a>>2:", a >> 2)
