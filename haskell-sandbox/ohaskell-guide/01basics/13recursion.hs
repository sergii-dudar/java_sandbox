import Data.Char

prefix :: String -> String
prefix str = "--->>> :" ++ str

-- custom map
cmap :: (a -> b) -> [a] -> [b]
cmap _ [] = [] -- end, out from resuctions, and put all results in array []
cmap f (x : xs) = f x : cmap f xs

example1 = do
    let arr = 1 : 2 : 3 : [] -- it's what [1, 2, 3] acatully is under the conver:
    --   1 : 2 : 3 : [] ->> 1 : 2 : [3] ->> 1 : [2, 3] ->> [1, 2, 3]
    putStrLn . prefix . show $ arr

    -- putStrLn . prefix . show $ map toUpper "appers case"
    putStrLn . prefix . show $ cmap toUpper "appers case"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example2 = do
    -- simplet templating
    let [first, second, third] = ["He", "Li", "Be"]

    -- 1.
    -- it's how `map` recursivelly procssing array when get end of cycle
    let arr = toUpper 'a' : toUpper 'b' : toUpper 'c' : toUpper 'd' : []
    -- arr: 'abcd' ->> 'ABCD'
    putStrLn . prefix $ (" manual: " ++ show arr)
    --

    -- 2.
    -- (head : tail)
    -- thats why presents operator (head : tail) that suing in map (cmap)
    let fullArray = ["He", "Li", "Be"]
    let (first : others) = fullArray

    putStrLn . prefix $ (" fullArray: " ++ show fullArray)
    putStrLn . prefix $ "      first: " ++ first
    putStrLn . prefix $ ("    others: " ++ show others)

    -- 1 and 2 together
    -- f (x : xs) = f x : mapFunc f xs
    putStrLn . prefix $ (" cmap: " ++ show (cmap toUpper "abcd"))
    --                                      cmap toUpper "abcd"
    --                                      ->> toUpper 'a' : cmap toUpper "bcd"
    --                                      ...
    --                                      ->> toUpper 'a' : toUpper "b" : toUpper "c" : toUpper "d" : []
    --                                      ->> 'A' : "B" : "C" : "D" : []
    --                                      ->> [ 'A', 'B', 'C', 'D' ] ( or "ABCD" )

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
