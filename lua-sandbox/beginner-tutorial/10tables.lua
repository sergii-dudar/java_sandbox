#!/usr/local/bin/lua

------------------------
-- Simple empty table
myTable = {}
print("Type of mytable is: ", type(myTable))

myTable[1] = "Lua"
myTable["wow"] = "Tutorial"

print("myTable Element at index 1 is ", myTable[1])
print("myTable Element at index wow is ", myTable["wow"])

------------------------
-- alternateTable and myTable refers to same table
alternateTable = myTable

print("alternateTable Element at index 1 is ", alternateTable[1])
print("alternateTable Element at index wow is ", alternateTable["wow"])
print("alternateTable is ", alternateTable)

alternateTable["wow"] = "I changed it"

print("myTable Element at index wow is ", myTable["wow"])

------------------------
-- only variable released and and not table
alternateTable = nil
print("alternateTable is: ", alternateTable)

------------------------
-- myTable is still accessible
print("myTable Element at index wow is ", myTable["wow"])

myTable = nil
print("myTable is ", myTable)
