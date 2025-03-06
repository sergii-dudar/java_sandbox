{-
base types:
 - 123         Int
 - 23.5798     Double
 - 'a'         Char
 - "Hello!"    String
 - True        Bool
 - False       Boo,
-}

example1 = do
    -- let value = 1 + 3
    let value = (+) 1 3 -- same as 1 + 3 : (+) means that operator + can be user as arg1 + arg2, not just as: + arg1 arg1
    putStrLn ("--->>> :" ++ show value)

----------------------------------------------------------------------------
----------------------------------------------------------------------------

square :: Int -> Int -- fnc declaration
square v = v * v -- fnc defining

example2 = do
    putStrLn ("--->>> :" ++ show (square 5))

example3 = do
    putStrLn "--->>> :"

main = do
    putStrLn ">>>>>--------------EXAMPLE1--------------<<<<<"
    example1
    putStrLn "\n>>>>>--------------EXAMPLE2--------------<<<<<"
    example2
    putStrLn "\n>>>>>--------------EXAMPLE3--------------<<<<<"
    example3