#!/usr/bin/python3.12

string1 = "tutorialspoint"

# ------- Built-in String Methods

print("\n========================================|||:--------------------------------: 1	capitalize()")
# Capitalizes first letter of string.
print("tutorialspoint".capitalize())  # Tutorialspoint
print("hii! welcome to tutorialspoint.".capitalize())  # Hii! welcome to tutorialspoint.
print("hii! Welcome to TUTORIALSPOINT.".capitalize())  # Hii! welcome to tutorialspoint.

print("\n========================================|||:--------------------------------: 2	casefold()")
# Converts all uppercase letters in string to lowercase. Similar to lower(), but works on UNICODE characters alos.
print("Hello World".casefold())  # hello world
print("hèllò wørld".casefold())  # hèllò wørld

print("\n========================================|||:--------------------------------: 3	center(width, fillchar)")
# Returns a space-padded string with the original string centered to a total of width columns.
# parameters:
# - width − This parameter is an integer value which represents the total length of the string along with the padding characters.
# - fillchar − This parameter specifies the filling characters. Only the single length character is accepted. The default filling character is the ASCII space.

print("Welcome to Tutorialspoint.".center(40, '.'))  # .......Welcome to Tutorialspoint........
print("Welcome to Tutorialspoint.".center(40, 's'))  # sssssssWelcome to Tutorialspoint.sssssss
print("Welcome to Tutorialspoint.".center(40))  # Welcome to Tutorialspoint.
print("Welcome to Tutorialspoint.".center(5))  #

print("\n========================================|||:--------------------------------: 4	count(str, beg= 0,end=len(string))")
# Counts how many times str occurs in string or in a substring of string if starting index beg and ending index end are given.
# params:
# sub − This parameter specifies the substring to be searched.
# start − This parameter is an integer value which specifies the starting index from which the search starts. The first character starts from the '0' index. If the start value is not specified, then the default value is '0' that is the first index.
# end − This parameter is an integer value which specifies the ending index at which the search ends. If this value is not specified, then the default search ends at the last index.

strCount = "Hello! Welcome to Tutorialspoint."
print(strCount.count("i", 3, 30))  # 2
print(strCount.count("to", 21))  # 0
print(strCount.count("t"))  # 3
print(strCount.count(""))  # 34

print("\n========================================|||:--------------------------------: 5	decode(encoding='UTF-8',errors='strict')")
# Decodes the string using the codec registered for encoding. encoding defaults to the default string encoding.
print("\n========================================|||:--------------------------------: 6	encode(encoding='UTF-8',errors='strict')")
# Returns encoded string version of string; on error, default is to raise a ValueError unless errors is given with 'ignore' or 'replace'.

strEncode = "Hello! Welcome to Tutorialspoint."
strEncoded = strEncode.encode('utf_8', 'strict')
print("The encoded string is: ", strEncoded)

strDecoded = strEncoded.decode('utf_8', 'strict')
print("The decoded string is: ", strDecoded)

print("\n========================================|||:--------------------------------: 7	endswith(suffix, beg=0, end=len(string))")
# Determines if string or a substring of string (if starting index beg and ending index end are given) ends with suffix; returns true if so and false otherwise.
# Params:
# suffix − This parameter specifies a string or a tuple of suffixes to look for.
# start − This parameter specifies the starting index to search.
# end − This parameter specifies the ending index where the search ends.

strEndswith = "Hello!Welcome to Tutorialspoint."
print(strEndswith.endswith("oint."))  # True
print(strEndswith.endswith("oint.", 28))  # False

print("\n========================================|||:--------------------------------: 8	expandtabs(tabsize=8)")
# Expands tabs in string to multiple spaces; defaults to 8 spaces per tab if tabsize not provided.

# str.expandtabs(tabsize=8)
strExpandtabs = "Welcome to\tTutorialspoint!!"
print(strExpandtabs.expandtabs(25))

print("\n========================================|||:--------------------------------: 9	find(str, beg=0 end=len(string))")
# Determine if str occurs in string or in a substring of string if starting index beg and ending index end are given returns index if found and -1 otherwise.

strFind = "Hello! Welcome to Tutorialspoint."
print(strFind.find("to"))
print(strFind.find(" "))
print(strFind.find(" ", 12, 15))
print(strFind.find("to", 5))
print(strFind.find("to", 18))
print(strFind.find("to", 25))

print("\n========================================|||:--------------------------------: 10	format(*args, **kwargs)")
# This method is used to format the current string value.

name = "John"
age = 30
print("Name: {}, Age: {}".format(name, age))
print("Name: {name}, Age: {age}".format(name="Alice", age=25))
print("{1}, {0}".format("world", "hello"))
print("{:<10}".format("Python") + "is awesome!")

print("\n========================================|||:--------------------------------: 11	format_map(mapping)")
# This method is also use to format the current string the only difference is it uses a mapping object.
print(string1.capitalize())  #

person = {'name': 'Alice', 'age': 25}
print("Name: {name}, Age: {age}".format_map(person))

student = {'details': {'name': 'Bob', 'age': 20}}
print("Name: {details[name]}, Age: {details[age]}".format_map(student))


class Person:
    pass


person = Person()
person.name = 'John'
person.age = 30

print("Name: {name}, Age: {age}".format_map(vars(person)))


class CustomDict(dict):
    def __missing__(self, key):
        return f'Unknown: {key}'  # In here, we define a custom dictionary class "CustomDict" where missing keys are handled by the __missing__() method. If a key is missing in the dictionary data, it returns a custom string instead of raising a KeyError −


data = CustomDict({'name': 'Alice'})
result = "Name: {name}, Age: {age}".format_map(data)
print(result)

print("\n========================================|||:--------------------------------: 12	index(str, beg=0, end=len(string))")
# Same as find(), but raises an exception if str not found.
#  Params:
#  str − This parameter specifies the string that is to be searched.
#  beg − This parameter specifies the starting index. The default value is '0'.
#  end − This parameter specifies the ending index. The default value is the length of the string.

str1 = "Hello! Welcome to Tutorialspoint."
print(str1.index("to"))
print(str1.index(" "))
print(str1.index(" ", 12, 15))
# print(str1.index("to", 25))

print("\n========================================|||:--------------------------------: 13	isalnum()")
# Returns true if string has at least 1 character and all characters are alphanumeric and false otherwise.
print("tutorial".isalnum())  #

print("\n========================================|||:--------------------------------: 14	isalpha()")
# Returns true if string has at least 1 character and all characters are alphabetic and false otherwise.
print("Hello!welcome".isalpha())  #

print("\n========================================|||:--------------------------------: 15	isascii()")
# Returns True is all the characters in the string are from the ASCII character set.
print()  #

print("\n========================================|||:--------------------------------: 16	isdecimal()")
# Returns true if a unicode string contains only decimal characters and false otherwise.
print(u"23443434".isdecimal())

print("\n========================================|||:--------------------------------: 17	isdigit()")
# Returns true if string contains only digits and false otherwise.
print("1235".isdigit())

print("\n========================================|||:--------------------------------: 18	isidentifier()")
# Checks whether the string is a valid Python identifier.
print()  #

print("\n========================================|||:--------------------------------: 19	islower()")
# Returns true if string has at least 1 cased character and all cased characters are in lowercase and false otherwise.
print()  #

print("\n========================================|||:--------------------------------: 20	isnumeric()")
# Returns true if a unicode string contains only numeric characters and false otherwise.
print()  #

print("\n========================================|||:--------------------------------: 21	isprintable()")
# Checks whether all the characters in the string are printable.
print()  #

print("\n========================================|||:--------------------------------: 22	isspace()")
# Returns true if string contains only whitespace characters and false otherwise.
print()  #

print("\n========================================|||:--------------------------------: 23	istitle()")
# Returns true if string is properly "titlecased" and false otherwise.
print()  #

print("\n========================================|||:--------------------------------: 24	isupper()")
# Returns true if string has at least one cased character and all cased characters are in uppercase and false otherwise.
print()  #

print("\n========================================|||:--------------------------------: 25	join(seq)")
# Merges (concatenates) the string representations of elements in sequence seq into a string, with separator string.

print("-".join(("a", "b", "c")))
print("MATCH".join({"Player": "Sachin Tendulkar", "Sports": "Cricket"}))
print("#".join({'9', '7', '2', '9', '3', '9'}))
# print("#".join((3, 6, 7, 4, 7, 4, 5, 32, 98, 35))) error as elements is not string

print("\n========================================|||:--------------------------------: 26	ljust(width[, fillchar])")
# Returns a space-padded string with the original string left-justified to a total of width columns.
print()  #

print("\n========================================|||:--------------------------------: 27	lower()")
# Converts all uppercase letters in string to lowercase.
print()  #

print("\n========================================|||:--------------------------------: 28	lstrip()")
# Removes all leading white space in string.
print()  #

print("\n========================================|||:--------------------------------: 29	maketrans()")
# Returns a translation table to be used in translate function.

intab = "aeiou"
outtab = "12345"

str = "this is string example....wow!!!"
trantab = str.maketrans(intab, outtab)
print("Translation Table: ")
print(trantab)
print()

# using trantab on translate() function
print(str.translate(trantab))

print()
# dict ---------------------------------

mydict = {'a': '1', 'b': '2', 'c': '3', 'd': '4', 'e': '5'}

str = "Welcome to Tutorialspoint"
print("Translation Table: ")
print(str.maketrans(mydict))
print()

# using trantab on translate() function
print(str.translate(str.maketrans(mydict)))

print("\n========================================|||:--------------------------------: 30	partition()")
# Splits the string in three string tuple at the first occurrence of separator.
print("hello world".partition(' '))
print("hello".partition(','))
print("hello world".split(' '))

print("\n========================================|||:--------------------------------: 31	removeprefix()")
# Returns a string after removing the prefix string.
print("Hello World".removeprefix("Hello "))

print("\n========================================|||:--------------------------------: 32	removesuffix()")
# Returns a string after removing the suffix string.
print("Hello World.jpg".removesuffix(".jpg"))

print("\n========================================|||:--------------------------------: 33	replace(old, new [, max])")
# Replaces all occurrences of old in string with new or at most max occurrences if max given.
print("Welcome to Tutorialspoint".replace("o", "0"))

print("\n========================================|||:--------------------------------: 34	rfind(str, beg=0,end=len(string))")
# Same as find(), but search backwards in string.
print("This is a string".rfind("is"))
print("This is a string".find("is"))

print("\n========================================|||:--------------------------------: 35	rindex( str, beg=0, end=len(string))")
# Same as index(), but search backwards in string.

str1 = "this is string example....wow!!!"
str2 = "is"
print(str1.rindex(str2))
print(str1.index(str2))

print("\n========================================|||:--------------------------------: 36	rjust(width,[, fillchar])")
# Returns a space-padded string with the original string right-justified to a total of width columns.
print()  #

print("\n========================================|||:--------------------------------: 37	rpartition()")
# Splits the string in three string tuple at the ladt occurrence of separator.
print()  #

print("\n========================================|||:--------------------------------: 38	rsplit()")
# Splits the string from the end and returns a list of substrings.
print()  #

print("\n========================================|||:--------------------------------: 39	rstrip()")
# Removes all trailing whitespace of string.
print()  #

print("\n========================================|||:--------------------------------: 40	split(str="", num=string.count(str))")
# Splits string according to delimiter str (space if not provided) and returns list of substrings; split into at most num substrings if given.
str = "Line1-abcdef \nLine2-abc \nLine4-abcd"
print(str.split(' '))
print(str.split(' ', -1))
print("aaa,bbb,ccc,ddd,eee".split(',', 2))

print("\n========================================|||:--------------------------------: 41	splitlines( num=string.count('\\n'))")
# Splits string at all (or num) NEWLINEs and returns a list of each line with NEWLINEs removed.
print()  #

print("\n========================================|||:--------------------------------: 42	startswith(str, beg=0,end=len(string))")
# Determines if string or a substring of string (if starting index beg and ending index end are given) starts with substring str; returns true if so and false otherwise.
str = "this is string example....wow!!!";
print(str.startswith('this'))
print(str.startswith('is'))

print("\n========================================|||:--------------------------------: 43	strip([chars])")
# Performs both lstrip() and rstrip() on string.
print()  #

print("\n========================================|||:--------------------------------: 44	swapcase()")
# Inverts case for all letters in string.
print("this is string example....wow!!!".swapcase())

print("\n========================================|||:--------------------------------: 45	title()")
# Returns "titlecased" version of string, that is, all words begin with uppercase and the rest are lowercase.
print("this is string example....wow!!!".title())
print("THIS IS A STRING EXAMPLE".title())

print("\n========================================|||:--------------------------------: 46	translate(table, deletechars="")")
# Translates string according to translation table str(256 chars), removing those in the del string.

intab = "aeiou"
outtab = "12345"
print("this is string example....wow!!!".maketrans(intab, outtab))

print("\n========================================|||:--------------------------------: 47	upper()")
# Converts lowercase letters in string to uppercase.
print()  #

print("\n========================================|||:--------------------------------: 48	zfill (width)")
# Returns original string leftpadded with zeros to a total of width characters; intended for numbers, zfill() retains any sign given (less one zero).
print()  #

# ========================================------------------------
# ------- Built-in Functions with Strings
# ========================================------------------------

testStr10 = "string"
print("\n========================================|||:--------------------------------: 1	len(list)")
# Returns the length of the string.
print(len(testStr10))  # 6

print("\n========================================|||:--------------------------------: 2	max(list)")
# Returns the max alphabetical character from the string str.
print(max(testStr10))  # t

print("\n========================================|||:--------------------------------: 3	min(list)")
# Returns the min alphabetical character from the string str.
print(min(testStr10))  # g
