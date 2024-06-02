#!/usr/bin/python3.12

for letter in 'Python':  # First Example
    if letter == 'h':
        continue
    print('Current Letter :', letter)

# ----------------
print("\n|||:")

var = 10  # Second Example
while var > 0:
    var = var - 1
    if var == 5:
        continue
    print('Current variable value :', var)
print("Good bye!")

# ----------------
print("\n|||:")

num = 60
print("Prime factors for: ", num)
d = 2
while num > 1:
    if num % d == 0:
        print(d)
        num = num / d
        continue
    d = d + 1
