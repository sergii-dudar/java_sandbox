example1 = do
    putStrLn "--->>> Monads: "
    print ([1 .. 10] >>= (\x -> if odd x then [x * 2] else []))

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example2 = do
    putStrLn "--->>> :"

main = do
    putStrLn ">>>>>--------------EXAMPLE1--------------<<<<<"
    example1
    putStrLn "\n>>>>>--------------EXAMPLE2--------------<<<<<"
    example2