prefix :: String -> String
prefix str = "--->>> :" ++ str

makeListFrom :: a -> Int -> [a]
makeListFrom value howMany =
    if howMany > 0
        then value : makeListFrom value (howMany - 1) -- run cycle
        else [] -- stop cycle

example1 = print $ makeListFrom 2 3

{-
      NOTE: -------- GO DEEP (IN STACK CALLS) --------

    1.
        makeListFrom 2 3

    2.
        makeListFrom 2 3 =
            if 3 > 0
            then 2 : makeListFrom 2 (3 - 1)
            else []

    3.
        makeListFrom 2 2 =
            if 2 > 0
            then 2 : makeListFrom 2 (2 - 1)
            else []

    4.
        makeListFrom 2 1 =
            if 1 > 0
            then 2 : makeListFrom 2 (1 - 1)
            else []

    5.
        makeListFrom 2 0 =
            if 0 > 0
            then 2 : makeListFrom 2 (0 - 1)
            else []

-}

{-

      NOTE: -------- GO UP (FROM STACK CALLS) --------

    1.
    makeListFrom 2 3
        2 : makeListFrom 2 2
            2 : makeListFrom 2 1
                2 : makeListFrom 2 0
                    []

    2.
    makeListFrom 2 3
        2 : makeListFrom 2 2
            2 : makeListFrom 2 1
                2 : [] -- Третий рекурсивный вызов.

    3.
    makeListFrom 2 3
        2 : makeListFrom 2 2
            2 : [2]

    4.
    makeListFrom 2 3
        2 : [2,2]

    5.
    [2,2,2]

-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example2 = do
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example3 = do
    putStrLn "--->>> :"

main = do
    putStrLn ">>>>>--------------EXAMPLE1--------------<<<<<"
    example1
    putStrLn "\n>>>>>--------------EXAMPLE2--------------<<<<<"
    example2
    putStrLn "\n>>>>>--------------EXAMPLE3--------------<<<<<"
    example3
