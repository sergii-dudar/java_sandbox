#!/usr/bin/python3.12

# ---------------- single if
print("\n|||:single if")

discount = 0
amount = 1200

# Check he amount value
if amount > 1000:
    discount = amount * 10 / 100

print("amount = ", amount - discount)

# ---------------- single if
print("\n|||:if else")

age = 25
print("age: ", age)
if age >= 18:
    print("eligible to vote")
else:
    print("not eligible to vote")

# ---------------- single if
print("\n|||:if else if")

amount = 2500
print('Amount = ', amount)
if amount > 10000:
    discount = amount * 20 / 100
else:
    if amount > 5000:
        discount = amount * 10 / 100
    else:
        if amount > 1000:
            discount = amount * 5 / 100
        else:
            discount = 0

print('Payable amount = ', amount - discount)

# same as -----------------------:

amount = 2500
print('Amount = ', amount)
if amount > 10000:
    discount = amount * 20 / 100
elif amount > 5000:
    discount = amount * 10 / 100
elif amount > 1000:
    discount = amount * 5 / 100
else:
    discount = 0

print('Payable amount = ', amount - discount)

# ---------------- single if
print("\n|||:single if")

# ---------------- nested if
print("\n|||:nested if")

num = 8
print("num = ", num)
if num % 2 == 0:
    if num % 3 == 0:
        print("Divisible by 3 and 2")
    else:
        print("divisible by 2 not divisible by 3")
else:
    if num % 3 == 0:
        print("divisible by 3 not divisible by 2")
    else:
        print("not Divisible by 2 not divisible by 3")
