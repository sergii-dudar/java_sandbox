prefix :: String -> String
prefix str = "--->>> :" ++ str

{-
    As we see between Monads and Applicative Functors direct relations,
    and there a lot examples where we can use one or another,
    but this ralation is one directional!

    С той лишь разницей, что в монадической цепочке монада протаскивается через
        функции, а в функторной — функция протаскивается через функторы.

    But in general convention: NOTE: where enough functionalify of FUNCTORS (or AF),
                                we need use them. Or MONADS not recomended where can be used FUNCTORS
-}

example1 = do
    -- MONADS WAY
    print $ [1, 2, 3] >>= \number -> return $ number * 2

    -- AF way (in general, more preffered)
    print $ (* 2) <$> [1, 2, 3]

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
