#!/usr/bin/python3.12

# ========================================
print("\n========================================|||:")
# find number of vowels in a given string.

mystr = "All animals are equal. Some are more equal"
vowels = "aeiou"
count = 0
for x in mystr:
    if x.lower() in vowels:
        count += 1
print("Number of Vowels:", count)

# ========================================
print("\n========================================|||:")
# convert a string with binary digits to integer.

mystr = '10101'


def strtoint(mystr):
    for x in mystr:
        if x not in '01':
            return "Error. String with non-binary characters"
    num = int(mystr, 2)
    return num


print("binary:{} integer: {}".format(mystr, strtoint(mystr)))

# ========================================
print("\n========================================|||:")
# drop all digits from a string.

digits = [str(x) for x in range(10)]
mystr = 'He12llo, Py00th55on!'
chars = []
for x in mystr:
    if x not in digits:
        chars.append(x)
newstr = ''.join(chars)
print(newstr)
