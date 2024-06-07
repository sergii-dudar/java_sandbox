#!/usr/bin/python3.12
import os
import xml.etree.ElementTree as ET

# ========================================
print("\n========================================|||:")

full_path = os.path.join(os.getcwd(), '01_core/16_other/xml/books.xml')

tree = ET.parse(full_path)
root = tree.getroot()
print(root)
print("Attributes are:", root.attrib)

root = tree.getroot()

for ch in root:
    print(ch.tag, ch.attrib)

print("Iterating root using for loop:")
tags = [elem.tag for elem in root.iter()]
print(tags)

print(ET.tostring(root, encoding='utf8').decode('utf8'))

for book in root.iter('book'):
    print(book.attrib)

# ========================================XPath Expressions
print("\n========================================|||:XPath Expressions")

# print("Desctiption Values:")
# for description in root.iter('description'):
#    print(description.text)

print("Title Values:")
for title in root.iter('title'):
    print(title.text)
print("---------")
for val in root.findall("./book/[price='5.95']"):
    print(val.attrib)
print("---------")
for val in root.findall("./book/[genre='Romance']"):
    print(val.attrib)

# ========================================Modifying an XML
print("\n========================================|||:Modifying an XML")

for title in root.iter('title'):
    print(title.text)

mod_title = root.find("./book/[title='Midnight Rain']")
print(mod_title)

mod_title.attrib["title"] = "The Alchemist"
print(mod_title.attrib)

# tree.write("book.xml")
# tree = ET.parse('book.xml')
# root = tree.getroot()
# for title in root.iter('title'):
#    print(title.attrib)


# for description in root.iter('description'):
#     new_desc = str(description.text)+'This is a author view'
#     description.text = str(new_desc)
#     description.set('updated', 'yes')
# tree.write('book.xml')
