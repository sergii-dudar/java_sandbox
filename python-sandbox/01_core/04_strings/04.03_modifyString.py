#!/usr/bin/python3.12

# ========================================String to a List
print("\n========================================|||:String to a List")

s1 = "WORD"
print("original string:", s1)
l1 = list(s1)

l1.insert(3, "L")

print(l1)

s1 = ''.join(l1)
print("Modified string:", s1)

# ========================================Using the Array Module
print("\n========================================|||:Using the Array Module")

import array as ar

s1 = "WORD"
print("original string:", s1)

sar = ar.array('u', s1)
sar.insert(3, "L")
s1 = sar.tounicode()  # get back the modified string

print("Modified string:", s1)

# ========================================StringIO Class
print("\n========================================|||:StringIO Class")

#  The StringIO class represents a text stream using an in-memory text buffer. A StringIO object obtained from a string behaves like a File object. Hence we can perform read/w

import io

s1 = "WORD"
print("original string:", s1)

sio = io.StringIO(s1)
sio.seek(3)
sio.write("LD")
s1 = sio.getvalue()

print("Modified string:", s1)
