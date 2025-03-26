prefix :: String -> String
prefix str = "--->>> :" ++ str

obtainTwoTextsFromUser :: IO String
obtainTwoTextsFromUser = do
    putStrLn "Enter your text, please: "
    firstText <- getLine
    putStrLn "One more, please: "
    secondText <- getLine
    -- "'" ++ firstText ++ "' and '" ++ secondText ++ "'" -- will not work, as must be IO result
    --
    -- `return` function wrap stinrg result to monadic IO result
    -- it's valid only in monadic context, or `do` statement (that actually converting to manadic under the hood)
    --
    return $ "'" ++ firstText ++ "' and '" ++ secondText ++ "'"

example1 = do
    twoTexts <- obtainTwoTextsFromUser
    putStrLn $ "You said " ++ twoTexts

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example2 = do
    putStrLn "--->>> :"

main = do
    putStrLn ">>>>>--------------EXAMPLE1--------------<<<<<"
    example1
    putStrLn "\n>>>>>--------------EXAMPLE2--------------<<<<<"
    example2
