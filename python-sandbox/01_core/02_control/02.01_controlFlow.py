#!/usr/bin/python3.12

marks = 80
result = ""
if marks < 30:
    result = "Failed"
elif marks > 75:
    result = "Passed with distinction"
else:
    result = "Passed"

print(result)

print()

# single statement
var = 100
if var == 100: print("Value of expression is 100")
print("Good bye!")

print()


def checkVowel(n):
    match n:
        case 'a':
            return "Vowel alphabet"
        case 'e':
            return "Vowel alphabet"
        case 'i':
            return "Vowel alphabet"
        case 'o':
            return "Vowel alphabet"
        case 'u':
            return "Vowel alphabet"
        case _:
            return "Simple alphabet"


print(checkVowel('a'))
print(checkVowel('m'))
print(checkVowel('o'))

print()
words = ["one", "two", "three"]
for x in words:
    print(x)

print()

x = 0

while x < 10:
    print("x:", x)
    if x == 5:
        print("Breaking...")
        break
    x += 1

print("End")

print()

for letter in "Python":
    # continue when letter is 'h'
    if letter == "h":
        continue
    print("Current Letter :", letter)
