example1 = do
    putStrLn "--->>> Files and Streams: "
    let file = "test-file01.txt"
    writeFile file "I am just experimenting here.\nWelcome to Haskell\nHere, you will get the best resource to learn Haskell."
    contents <- readFile file
    putStrLn contents

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
