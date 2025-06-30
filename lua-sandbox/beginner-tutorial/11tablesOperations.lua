#!/usr/local/bin/lua

------------------------
---- Table Concatenation

fruits = { "banana", "orange", "apple" }

-- returns concatenated string of table
print("Concatenated string: ", table.concat(fruits))

--concatenate with a character
print("Concatenated string: ", table.concat(fruits, ", "))

--concatenate fruits based on index
print("Concatenated string: ", table.concat(fruits, ", ", 2, 3))


------------------------
---- Insert and Remove
print()

fruits = { "banana", "orange", "apple" }

-- insert a fruit at the end
table.insert(fruits, "mango")
print("Fruit at index 4 is: ", fruits[4])

--insert fruit at index 2
table.insert(fruits, 2, "grapes")
print("Fruit at index 2 is: ", fruits[2])

--print("The maximum elements in table is", table.maximum(fruits))

print("The last element is: ", fruits[#fruits])

table.remove(fruits)
print("The previous last element is: ", fruits[#fruits])


------------------------
----Sorting Tables
print()

fruits = { "banana", "orange", "apple", "grapes" }

--for k, v in ipairs(fruits) do
--    print(k, v)
--end

print("original table: ", table.concat(fruits, ", "))
table.sort(fruits)
print("sorted table: ", table.concat(fruits, ", "))

--for k, v in ipairs(fruits) do
--    print(k, v)
--end