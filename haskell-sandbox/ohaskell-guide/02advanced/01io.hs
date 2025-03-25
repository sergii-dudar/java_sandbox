prefix :: String -> String
prefix str = "--->>> :" ++ str

{-
    putStrLn :: String -> IO ()
    IO () - type constructor `IO a`, where a is empty tuple, means `void`

    binding operator (<-): bind value from input stream (std in, file, network etc) to variable
-}
main :: IO ()
example1 = do
    -- output
    putStrLn "Hi Haskeller!"

    -- input
    putStrLn "Input your text, please:"
    lineFromUser <- getLine
    putStrLn $ "Not bad: " ++ lineFromUser

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
