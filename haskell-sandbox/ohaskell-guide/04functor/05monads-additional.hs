import Control.Exception (evaluate)

prefix :: String -> String
prefix str = "--->>> :" ++ str

-- we had next code in `do` statement

{-
obtainTwoTextsFromUser :: IO String
obtainTwoTextsFromUser = do
    putStrLn "Enter your text, please: "
    firstText <- getLine
    putStrLn "One more, please: "
    secondText <- getLine
    return $ firstText ++ secondText

example1 = do
    twoTexts <- obtainTwoTextsFromUser
    putStrLn $ "You said " ++ twoTexts
-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- let's rewrite it with knowlage AF

obtainTwoTextsFromUser :: IO String
obtainTwoTextsFromUser =
    (++) <$> getFirstText <*> getSecondText -- concat strings from input
  where
    getFirstText = putStrLn "Enter your text, please: " *> getLine
    getSecondText = putStrLn "One more, please: " *> getLine

{-
                                                  IO () *> getLine  - no any value on left, we need only right AF
    getFirstText = putStrLn "Enter your text, please: " *> getLine

    in result:
    obtainTwoTextsFromUser :: IO String
    obtainTwoTextsFromUser = (++) <$> IO String <*> IO String

-}

-- variants:
-- example1 = putStrLn . ("You said " ++) <$> obtainTwoTextsFromUser
-- example1 = (putStrLn =<<) $ (++) <$> return "Yau said: " <*> obtainTwoTextsFromUser
-- example1 = (putStrLn =<<) $ pure (++) <*> return "Yau said: " <*> obtainTwoTextsFromUser
-- example1 = putStrLn . (++) "Yau said: " =<< obtainTwoTextsFromUser
-- example1 = obtainTwoTextsFromUser >>= (putStrLn . ("You said: " ++))
example1 = obtainTwoTextsFromUser >>= (\text -> putStrLn $ "Yau said: " ++ text)

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
