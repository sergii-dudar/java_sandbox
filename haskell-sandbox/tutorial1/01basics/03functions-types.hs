example1 = do
    putStrLn "--->>> Functions:"
    let x = [1 .. 10]
    putStrLn "Our list is:"
    print x
    putStrLn ""

    -- Head function works on a List. It returns the first of the input
    -- argument which is basically a list
    putStr "The first element of the list is: "
    print (head x)

    -- Tail is the function that complements the head function. It takes a list as
    -- the input and yields the entire list without the head part
    putStr "The tail of our list is: "
    print (tail x)

    putStr "The last element of our list is: "
    print (last x)

    putStr "Our list without the last entry: "
    print (init x)

    -- Null is a Boolean check function which works on a String and returns True only
    -- when the given list is empty, otherwise it returns False. The following code
    -- checks whether the supplied list is empty or not.
    putStr "Is our list empty? - "
    print (null x)

    putStr "The list in Reverse Order is: "
    print (reverse x)

    putStr "The length of this list is:"
    print (length x)

    -- Sub array \ string
    putStr "Sub array of tag firt 5 els: " -- also works with String
    print (take 5 x)

    putStr "Sub array of skip first 5 els: " -- also works with String
    print (drop 5 x)

    putStr "The maximum value element of the list is: "
    print (maximum x)

    putStr "The minimum value element of the list is: "
    print (minimum x)

    putStr "The summation of the list elements is: "
    print (sum x)

    putStr "The multiplication of the list elements is:"
    print (product x)

    putStrLn "Does it contain element? "
    -- print (elem 3 x)
    -- print (elem 13 x)
    print (3 `elem` x)
    print (13 `elem` x)

example2 = do
    putStrLn "--->>> :"

example3 = do
    putStrLn "--->>> :"

example4 = do
    putStrLn "--->>> :"

example5 = do
    putStrLn "--->>> :"

example6 = do
    putStrLn "--->>> :"

example7 = do
    putStrLn "--->>> :"

example8 = do
    putStrLn "--->>> :"

example9 = do
    putStrLn "--->>> :"

example10 = do
    putStrLn "--->>> :"

main = do
    putStrLn ">>>>>--------------EXAMPLE1--------------<<<<<"
    example1
    putStrLn "\n>>>>>--------------EXAMPLE2--------------<<<<<"
    example2
    putStrLn "\n>>>>>--------------EXAMPLE3--------------<<<<<"
    example3
    putStrLn "\n>>>>>--------------EXAMPLE4--------------<<<<<"
    example4
    putStrLn "\n>>>>>--------------EXAMPLE5--------------<<<<<"
    example5
    putStrLn "\n>>>>>--------------EXAMPLE6--------------<<<<<"
    example6
    putStrLn "\n>>>>>--------------EXAMPLE7--------------<<<<<"
    example7
    putStrLn "\n>>>>>--------------EXAMPLE8--------------<<<<<"
    example8
    putStrLn "\n>>>>>--------------EXAMPLE9--------------<<<<<"
    example9
    putStrLn "\n>>>>>--------------EXAMPLE10--------------<<<<<"
    example10
