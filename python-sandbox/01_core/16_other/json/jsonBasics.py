#!/usr/bin/python3.12

# https://www.tutorialspoint.com/python/python_json.htm

# dumps() − This function converts the object into JSON format.
# loads() − This function converts a JSON string back to Python object.

import json

# ========================================
print("\n========================================|||:")

data = ['Rakesh', {'marks': (50, 60, 70)}]
s = json.dumps(data)
print(s, type(s))

data = json.loads(s)
print(data, type(data))

# data = ['Rakesh', {'marks': (50, 60, 70)}]
# s = json.dumps(data, sort_keys=True)

# data = ['Rakesh', {'marks': (50, 60, 70)}]
# s = json.dumps(data, indent=2)
# print(s)

# ========================================JSONDEcoder class
print("\n========================================|||:JSONDEcoder class")

data = ['Rakesh', {'marks': (50, 60, 70)}]
e = json.JSONEncoder()
s = e.encode(data)
d = json.JSONDecoder()
obj = d.decode(s)
print(obj, type(obj))

# ========================================JSON with Files/Streams
print("\n========================================|||:JSON with Files/Streams")

data = ['Rakesh', {'marks': (50, 60, 70)}]
with open('json.txt', 'w') as fp:
    json.dump(data, fp)

with open('json.txt', 'r') as fp:
    ret = json.load(fp)
    print(ret)
