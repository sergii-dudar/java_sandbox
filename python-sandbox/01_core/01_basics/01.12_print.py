#!/usr/bin/python3.12
import random

#  using (sys.stdout)

#  print by default using space separator for arguments


a = "Hello World"
b = 100
c = 25.50
d = 5 + 6j
print("Message:", a)
print(b, c, b - c)
print(pow(100, 0.5), pow(c, 2))

print()

#  using comma separator
city = "Hyderabad"
state = "Telangana"
country = "India"
print(city, state, country, sep=', ')

# removing newLine after all print
print()

city = "Hyderabad"
state = "Telangana"
country = "India"
print("City:", city, end=", ")
print("State:", state)

print(random.random())
