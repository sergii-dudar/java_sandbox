#!/usr/local/bin/lua

array = { "Lua", "Tutorial" }

for key, value in ipairs(array) do
    print(key, value)
end

------------------------
---- Stateless Iterators
print()

function square(iteratorMaxCount, currentNumber)
    if currentNumber < iteratorMaxCount then
        currentNumber = currentNumber + 1
        return currentNumber, currentNumber * currentNumber
    end
end

for i, n in square, 3, 0 do
    print(i, n)
end

------------------------
------ or
print()

function squares(iteratorMaxCount)
    return square, iteratorMaxCount, 0
end

for i, n in squares(3) do
    print(i, n)
end

------------------------
---- Stateful Iterators
print()

function elementIterator (collection)

    local index = 0
    local count = #collection

    -- The closure function is returned

    return function()
        index = index + 1

        if index <= count then
            -- return the current element of the iterator
            return collection[index]
        end

    end

end

array = { "Lua", "Tutorial" }
for element in elementIterator(array) do
    print(element)
end


