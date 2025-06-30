#!/usr/local/bin/lua

co = coroutine.create(function(value1, value2)
    local tempvar3 = 10
    print("(1) coroutine section 1", value1, value2, tempvar3)

    local tempvar1 = coroutine.yield(value1 + 1, value2 + 1)
    tempvar3 = tempvar3 + value1
    print("(2) coroutine section 2", tempvar1, tempvar2, tempvar3)

    local tempvar1, tempvar2 = coroutine.yield(value1 + value2, value1 - value2)
    tempvar3 = tempvar3 + value1
    print("(3) coroutine section 3", tempvar1, tempvar2, tempvar3)
    return value2, "end"

end)

print("(1) main", coroutine.resume(co, 3, 2))
print()
print("(2) main", coroutine.resume(co, 12, 14))
print()
print("(3) main", coroutine.resume(co, 5, 6))
print()
print("(4) main", coroutine.resume(co, 10, 20))
print("(4) main", coroutine.resume(co, 10, 20))

-----------
---- Another Coroutine Example
print()
print("-----------")

function getNumber()
    local function getNumberHelper()
        co = coroutine.create(function()
            coroutine.yield(1)
            coroutine.yield(2)
            coroutine.yield(3)
            coroutine.yield(4)
            coroutine.yield(5)
        end)
        return co
    end

    if (numberHelper) then
        status, number = coroutine.resume(numberHelper);

        if coroutine.status(numberHelper) == "dead" then
            numberHelper = getNumberHelper()
            status, number = coroutine.resume(numberHelper);
        end

        return number
    else
        numberHelper = getNumberHelper()
        status, number = coroutine.resume(numberHelper);
        return number
    end

end

for index = 1, 10 do
    print(index, getNumber())
end