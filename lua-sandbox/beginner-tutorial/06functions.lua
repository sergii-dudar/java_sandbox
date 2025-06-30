function max(num1, num2)

    if (num1 > num2) then
        result = num1;
    else
        result = num2;
    end

    return result;
end

print("The maximum of the two numbers is ", max(10, 4))
print("The maximum of the two numbers is ", max(5, 6))

------
print()

myprint = function(param)
    print("This is my print function -   ##", param, "##")
end

function add(num1, num2, functionPrint)
    result = num1 + num2
    functionPrint(result)
end

myprint(10)
add(2, 5, myprint)

-----
print()

function average(...)
    result = 0
    local arg = { ... }
    for i, v in ipairs(arg) do
        result = result + v
    end
    return result / #arg
end

print("The average is", average(10, 5, 3, 4, 5, 6))

------------------------
------ Closures
print()

function newCounter ()
    local i = 0
    return function ()   -- anonymous function
        i = i + 1
        return i
    end
end

c1 = newCounter()
print(c1())  --> 1
print(c1())  --> 2