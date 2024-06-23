#!/usr/bin/python3.12

x = 7
y = 0
# It uses assert to check for 0
print("x / y value is : ")
# assert y != 0, "Divide by 0 error"
# print(x / y)

# ========================================
print("\n========================================|||:")


def avg(scores):
    assert len(scores) != 0, "The List is empty."
    return sum(scores) / len(scores)


scores2 = [67, 59, 86, 75, 92]
print("The Average of scores2:", avg(scores2))

scores1 = []
print("The Average of scores1:", avg(scores1))

# ========================================
print("\n========================================|||:")


def kelvinToFahrenheit(Temperature):
    assert (Temperature >= 0), "Colder than absolute zero!"
    return ((Temperature - 273) * 1.8) + 32


# print(kelvinToFahrenheit(273))
# print(int(kelvinToFahrenheit(505.78)))
# print(kelvinToFahrenheit(-5))

# ========================================
print("\n========================================|||:")

print('enter marks out of 100')
num = 75
assert num >= 0 and num <= 100
print('marks obtained: ', num)

# num = 125
num = 10
assert num >= 0 and num <= 100
print('marks obtained: ', num)

# ========================================
print("\n========================================|||:")

try:
    num = int(input('enter a number'))
    assert (num >= 0), "only non negative numbers accepted"
    print(num)
except AssertionError as msg:
    print(msg)
