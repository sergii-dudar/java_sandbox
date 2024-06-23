#!/usr/bin/python3.12

a = 10
b = 0
try:
    print(a / b)
except Exception:
    print("General Exception")
finally:
    print("inside outer finally block")

# ========================================
print("\n========================================|||:")

a = 10
b = 0
try:
    print(a / b)
    try:
        print("This is inner try block")
    except Exception:
        print("General exception")
    finally:
        print("inside inner finally block")

except ZeroDivisionError:
    print("Division by 0")
finally:
    print("inside outer finally block")

# ========================================
print("\n========================================|||:")

a = 10
b = 0
try:
    print("This is outer try block")
    try:
        print(a / b)
    except ZeroDivisionError:
        print("Division by 0")
    finally:
        print("inside inner finally block")

except Exception:
    print("General Exception")
finally:
    print("inside outer finally block")

# ========================================
print("\n========================================|||:")

a = 10
b = 0
try:
    print("This is outer try block")
    try:
        print(a / b)
    except KeyError:
        print("Key Error")
    finally:
        print("inside inner finally block")

except ZeroDivisionError:
    print("Division by 0")
finally:
    print("inside outer finally block")
