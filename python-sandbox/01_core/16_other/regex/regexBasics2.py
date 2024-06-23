#!/usr/bin/python3.12

# https://www.tutorialspoint.com/python/python_reg_expressions.htm

import re

# ========================================re.match() Function
print("\n========================================|||:re.match() Function")

line = "Cats are smarter than dogs"
matchObj = re.match(r'Cats', line)
print(matchObj.start(), matchObj.end())
print("matchObj.group() : ", matchObj.group())

# ========================================re.search() Function
print("\n========================================|||:re.search() Function")

line = "Cats are smarter than dogs"
matchObj = re.search(r'than', line)
print(matchObj.start(), matchObj.end())
print("matchObj.group() : ", matchObj.group())

# ========================================Matching Vs Searching
print("\n========================================|||:Matching Vs Searching")
# Python offers two different primitive operations based on regular expressions,
#   match checks for a match only at the beginning of the string, while search checks
#   for a match anywhere in the string (this is what Perl does by default).

line = "Cats are smarter than dogs";
matchObj = re.match(r'dogs', line, re.M | re.I)
if matchObj:
    print("match --> matchObj.group() : ", matchObj.group())
else:
    print("No match!!")

searchObj = re.search(r'dogs', line, re.M | re.I)
if searchObj:
    print("search --> searchObj.group() : ", searchObj.group())
else:
    print("Nothing found!!")

# ========================================re.findall() Function
print("\n========================================|||:re.findall() Function")

string = "Simple is better than complex."
obj = re.findall(r"ple", string)
print(obj)

string = "Simple is better than complex."
obj = re.findall(r"\w*", string)
print(obj)

# ========================================re.sub() Function
print("\n========================================|||:re.sub() Function")
phone = "2004-959-559 # This is Phone Number"

# Delete Python-style comments
num = re.sub(r'#.*$', "", phone)
print("Phone Num : ", num)

# Remove anything other than digits
num = re.sub(r'\D', "", phone)
print("Phone Num : ", num)

# ========

string = "Simple is better than complex. Complex is better than complicated."
obj = re.sub(r'is', r'was', string)
print(obj)

# ========================================re.compile() Function
print("\n========================================|||:re.compile() Function")

string = "Simple is better than complex. Complex is better than complicated."
pattern = re.compile(r'is')
obj = pattern.match(string)
obj = pattern.search(string)
print(obj.start(), obj.end())

obj = pattern.findall(string)
print(obj)

obj = pattern.sub(r'was', string)
print(obj)

# ========================================re.finditer() Function
print("\n========================================|||:re.finditer() Function")

string = "Simple is better than complex. Complex is better than complicated."
pattern = re.compile(r'is')
iterator = pattern.finditer(string)
print(iterator)

for match in iterator:
    print(match.span())

# ========================================Finding all Adverbs
print("\n========================================|||:Finding all Adverbs")

text = "He was carefully disguised but captured quickly by police."
obj = re.findall(r"\w+ly\b", text)
print(obj)

text = 'Errors should never pass silently. Unless explicitly silenced.'
obj = re.findall(r'\b[aeiouAEIOU]\w+', text)
print(obj)
