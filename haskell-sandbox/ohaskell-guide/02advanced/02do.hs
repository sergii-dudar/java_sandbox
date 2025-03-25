prefix :: String -> String
prefix str = "--->>> :" ++ str

-- we can use `do` notation in any function we want imperative execution way (in general conventions - to work with sideffects)
obtainUserText :: String -> IO String
obtainUserText prompt = do
    putStrLn prompt
    getLine

example1 :: IO ()
example1 = do
    firstText <- obtainUserText "Enter your text, please: "
    secondText <- obtainUserText "One more, please: "
    putStrLn $ "You said '" ++ firstText ++ "' and '" ++ secondText ++ "'"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example2 = do
    putStrLn "--->>> :"

main :: IO ()
main = do
    putStrLn ">>>>>--------------EXAMPLE1--------------<<<<<"
    example1
    putStrLn "\n>>>>>--------------EXAMPLE2--------------<<<<<"
    example2
