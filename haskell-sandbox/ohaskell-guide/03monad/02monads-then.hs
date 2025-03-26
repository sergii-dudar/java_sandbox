prefix :: String -> String
prefix str = "--->>> :" ++ str

----------------------------------------------------------------------------
-- (>>) then (or commands concatenator)
-- simple operator that likns operators without returns
-- analog unix operator ; ` whoami ; pwd `

example1 = do
    putStrLn "Serhii"
    putStrLn "Dudar"

-- is sygar of:

example2 = putStrLn "Serhii" >> putStrLn "Dudar"

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
