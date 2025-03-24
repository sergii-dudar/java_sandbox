{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Avoid lambda" #-}
{-# HLINT ignore "Redundant lambda" #-}

checkLocalhost :: String -> String
checkLocalhost ip =
    if ip == "127.0.0.1" || ip == "0.0.0.0"
        then "It's a localhost!"
        else "No, it's not a localhost."

example1 = do
    -- unconvinient way
    putStrLn (checkLocalhost "173.194.22.100")

    -- composite way
    putStrLn . checkLocalhost $ "173.194.22.100" -- putStrLn <- checkLocalhost <- "173.194.22.100"

    -- \$ - operato of applying variable to function in pipe vay, whout it, we need apply it by calling way:
    (putStrLn . checkLocalhost) "173.194.22.100" -- ( putStrLn <- checkLocalhost ) <- "173.194.22.100"

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- how composition does work:
-- (.) f g = \x -> f (g x)
-- (.) putStrLn checkLocalhost = \x -> putStrLn (checkLocalhost x)

-- our custom composit function
(<+>) :: (t1 -> t2) -> (t3 -> t1) -> t3 -> t2
(<+>) f g = \x -> f (g x)

(<->) :: (t1 -> t2) -> t1 -> t2
(<->) f = \x -> f x

-- or: (<+>) f g = f . g
-- or: f <+> g = f . g

example2 = do
    putStrLn <+> checkLocalhost <-> "173.194.22.100"
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example3 = do
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example4 = do
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example5 = do
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

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
