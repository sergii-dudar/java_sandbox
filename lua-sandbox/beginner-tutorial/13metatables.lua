#!/usr/local/bin/lua

mytable = {}
mymetatable = {}
setmetatable(mytable, mymetatable) -- or setmetatable({},{})

-----------
---- __index

mytable = setmetatable({ key1 = "value1" }, {
    __index = function(mytable, key)

        if key == "key2" then
            return "metatablevalue"
        else
            print(key, ": is not found")
            return nil
        end
    end
})
print(mytable.key1, mytable.key2, mytable.key3)

-- simplified with static declaration
print()

mytable = setmetatable({ key1 = "value1" },
    { __index = { key2 = "metatablevalue" } })
print(mytable.key1, mytable.key2)

-----------
---- __newindex
print()

mymetatable = {}
mytable = setmetatable({ key1 = "value1" }, { __newindex = mymetatable })

print(mytable.key1)

mytable.newkey = "new value 2"
print(mytable.newkey, mymetatable.newkey)

mytable.key1 = "new  value 1"
print(mytable.key1, mymetatable.newkey1)

-----------
---- rawset
print()
print("-----------")

mytable = setmetatable({ key1 = "value1" }, {

    __newindex = function(mytable, key, value)
        rawset(mytable, key, "\"" .. value .. "\"")
    end
})

mytable.key1 = "new value"
mytable.key2 = 4

print("key1: ", mytable.key1, ", key2: ", mytable.key2)

-----------
---- Adding Operator Behavior to Tables
print()
print("-----------")

mytable = setmetatable({ 1, 2, 3 }, {
    __add = function(mytable, newtable)

        for i = 1, #newtable do
            table.insert(mytable, #mytable + 1, newtable[i])
        end
        return mytable
    end
})

secondtable = { 4, 5, 6 }

mytable = mytable + secondtable

print(table.concat(mytable, ", "))

--for k, v in ipairs(mytable) do
--    print(k, v)
--end

--[[
supported ops
__add - Changes the behavior of operator '+'.
__sub - Changes the behavior of operator '-'.
__mul - Changes the behavior of operator '*'.
__div - Changes the behavior of operator '/'.
__mod - Changes the behavior of operator '%'.
__unm - Changes the behavior of operator '-'.
__concat - Changes the behavior of operator '..'.
__eq - Changes the behavior of operator '=='.
__lt - Changes the behavior of operator '<'.
__le - Changes the behavior of operator '<='.
]]--


-----------
---- __call
print()
print("-----------")

mytable = setmetatable({ 10 }, {
    __call = function(mytable, newtable)
        sum = 0

        for i = 1, #mytable do
            sum = sum + mytable[i]
        end

        for i = 1, #newtable do
            sum = sum + newtable[i]
        end

        return sum
    end
})

newtable = { 10, 20, 30 }
print(mytable(newtable))

-----------
---- __tostring
print()
print("-----------")

mytable = setmetatable({ 10, 20, 30 }, {
    __tostring = function(mytable)
        return "string representation is: " .. table.concat(mytable, ", ")
    end
})
print(mytable)