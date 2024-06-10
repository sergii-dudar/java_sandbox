#!/usr/bin/python3.12

# https://www.javatpoint.com/python-regex

# RegEx Functions:
# compile - It is used to turn a regular pattern into an object of a regular expression that may be used in a number of ways for matching patterns in a string.
# search - It is used to find the first occurrence of a regex pattern in a given string.
# match - It starts matching the pattern at the beginning of the string.
# fullmatch - It is used to match the whole string with a regex pattern.
# split - It is used to split the pattern based on the regex pattern.
# findall - It is used to find all non-overlapping patterns in a string. It returns a list of matched patterns.
# finditer - It returns an iterator that yields match objects.
# sub - It returns a string after substituting the first occurrence of the pattern by the replacement.
# subn - It works the same as 'sub'. It returns a tuple (new_string, num_of_substitution).
# escape - It is used to escape special characters in a pattern.
# purge - It is used to clear the regex expression cache.

import re

# ========================================search
print("\n========================================|||:search")

regex_object = re.compile("amazing")

# Searching for the pattern in the string
match_object = regex_object.search("This tutorial is amazing!")
print("Match Object:", match_object)

# ========================================match
print("\n========================================|||:match")

# Returns a match object if found else Null
match = re.match("hello", "hello world")

print(match)  # Printing the match object
print("Span:", match.span())  # Return the tuple (start, end)
print("Start:", match.start())  # Return the starting index
print("End:", match.end())  # Returns the ending index

############

line = "Learn Python through tutorials on javatpoint"
match_object = re.match(r'.w* (.w?) (.w*?)', line, re.M | re.I)

if match_object:
    print("match object group : ", match_object.group())
    print("match object 1 group : ", match_object.group(1))
    print("match object 2 group : ", match_object.group(2))
else:
    print("There isn't any match!!")

# ========================================search
print("\n========================================|||:search")

line = "Learn Python through tutorials on javatpoint"

search_object = re.search(r' .*t? (.*t?) (.*t?)', line)
if search_object:
    print("search object group : ", search_object.group())
    print("search object group 1 : ", search_object.group(1))
    print("search object group 2 : ", search_object.group(2))
else:
    print("Nothing found!!")

# ========================================sub
print("\n========================================|||:sub")

# Defining parameters
pattern = "like"  # to be replaced
repl = "love"  # Replacement
text = "I like Javatpoint!"  # String

# Returns a new string with a substituted pattern
new_text = re.sub(pattern, repl, text)

# Output
print("Original text:", text)
print("Substituted text: ", new_text)

print()
################

# Defining parameters
pattern = "l"  # to be replaced
repl = "L"  # Replacement
text = "I like Javatpoint! I also like tutorials!"  # String

# Returns a new string with the substituted pattern
new_text = re.sub(pattern, repl, text, 3)

# Output
print("Original text:", text)
print("Substituted text:", new_text)

# ========================================subn
print("\n========================================|||:subn")

# Defining parameters
pattern = "l"  # to be replaced
repl = "L"  # Replacement
text = "I like Javatpoint! I also like tutorials!"  # String

# Returns a new string with the substituted pattern
new_text = re.subn(pattern, repl, text, 3)

# Output
print("Original text:", text)
print("Substituted text:", new_text)

# ========================================fullmatch
print("\n========================================|||:fullmatch")

# Sample string
line = "Hello world"

# Using re.fullmatch()
print(re.fullmatch("Hello", line))
print(re.fullmatch("Hello world", line))

# ========================================findall
print("\n========================================|||:findall")

line = "Hello world hello"

print(re.findall("Hello", line, re.I | re.M))

# ========================================finditer
print("\n========================================|||:finditer")

iter1 = re.finditer("Hello", line, re.I | re.M)

# for i in iter1:
#    print(i)

print([i for i in iter1])

# ========================================split
print("\n========================================|||:split")

# Pattern
pattern = ' '
# Sample string
line = "Learn Python through tutorials on javatpoint"

# Using split function to split the string after ' '
result = re.split(pattern, line)

# Printing the result
print("When maxsplit = 0, result:", result)

# When Maxsplit is one
result = re.split(pattern, line, maxsplit=1)
print("When maxsplit = 1, result =", result)

# ========================================escape
print("\n========================================|||:escape")

# Pattern
pattern = 'https://www.javatpoint.com/'

# Using escape function to escape metacharacters
result = re.escape(pattern)

# Printing the result
print("Result:", result)

# ========================================
print("\n========================================|||:")

# ========================================
# ======================================== re.match() vs. re.search()
print("\n========================================|||: re.match() vs. re.search()")
print("\n========================================|||: re.match() vs. re.search()")
# Python has two primary regular expression functions: match and search. The match function
# looks for a match only where the string starts, whereas the search function looks for a
# match everywhere in the string.

# Sample string
line = "Learn Python through tutorials on javatpoint"

# Using match function to match 'through'
match_object = re.match(r'through', line, re.M | re.I)
if match_object:
    print("match object group : ", match_object)
else:
    print("There isn't any match!!")

# using search function to search
search_object = re.search(r'through', line, re.M | re.I)
if search_object:
    print("Search object group : ", search_object)
else:
    print("Nothing found!!")
