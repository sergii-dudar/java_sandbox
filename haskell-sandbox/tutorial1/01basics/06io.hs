import Control.Exception

example1 = do
    putStrLn "--->>> Files and Streams: "
    let file = "test-file01.txt"
    writeFile file "I am just experimenting here.\nWelcome to Haskell\nHere, you will get the best resource to learn Haskell."
    contents <- readFile file
    putStrLn contents

example2 = do
    putStrLn "--->>> Exceptions: "
    result <- try (evaluate (5 `div` 0)) :: IO (Either SomeException Int)
    case result of
        Left ex -> putStrLn $ "Caught exception: " ++ show ex
        Right val -> putStrLn $ "The answer was: " ++ show val

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
