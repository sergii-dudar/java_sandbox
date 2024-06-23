#!/usr/bin/python3.12

# https://www.tutorialspoint.com/python/python_url_processing.htm

from urllib.parse import *
from urllib.request import *

url = "https://example.com/employees?name=Anand&salary=25000"
parsed_url = urlparse(url)
print(f"url parts {url}: ")
print(type(parsed_url))
print("Scheme:", parsed_url.scheme)
print("netloc:", parsed_url.netloc)
print("path:", parsed_url.path)
print("params:", parsed_url.params)
print("Query string:", parsed_url.query)
print("Frgment:", parsed_url.fragment)

# ========================================parse_qs(qs))
print("\n========================================|||:parse_qs(qs))")

parsed_url = urlparse(url)
dct = parse_qs(parsed_url.query)
print("Query parameters:", dct)

# ========================================urlunparse(parts)
print("\n========================================|||:urlunparse(parts)")

lst = ['https', 'example.com', '/employees/name/', '', 'salary=25000', '']
new_url = urlunparse(lst)
print("URL:", new_url)

# ========================================urlopen() function
print("\n========================================|||:urlopen() function")

with urlopen("https://www.tutorialspoint.com/static/images/simply-easy-learning.jpg") as obj:
    data = obj.read()
    with open("img.jpg", "wb") as img:
        img.write(data)

# ========================================
print("\n========================================|||:")

# obj = Request("https://www.tutorialspoint.com/")
# resp = urlopen("https://www.tutorialspoint.com/")
# data = resp.read()
# print(data)

# ========================================
print("\n========================================|||:")

# ========================================
print("\n========================================|||:")

# ========================================
print("\n========================================|||:")
