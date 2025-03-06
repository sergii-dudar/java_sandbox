isEqualTo :: Int -> Int -> Bool
isEqualTo x y = x == y

example11 = do
    if isEqualTo code1 code2 then "equals3" else "not equals3"
  where
    code1 = 2
    code2 = 3

example1 = do
    putStrLn ("--->>> :" ++ show (1 + 2))
    putStrLn ("--->>> :" ++ show ((+) 1 2))

    putStrLn (if isEqualTo 2 3 then "equals1" else "not equals1")
    putStrLn (if 2 `isEqualTo` 3 then "equals2" else "not equals2")

    putStrLn example11

    let result = if isEqualTo code1 code2 then "equals4" else "not equals4"
    putStrLn result
  where
    code1 = 3
    code2 = 3

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example2 = do
    putStrLn "--->>> :"

main = do
    putStrLn ">>>>>--------------EXAMPLE1--------------<<<<<"
    example1
    putStrLn "\n>>>>>--------------EXAMPLE2--------------<<<<<"
    example2
