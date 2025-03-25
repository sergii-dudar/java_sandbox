prefix :: String -> String
prefix str = "--->>> :" ++ str

{-
    Context Type it's polymorph type restriction in method, that defining what methods available
    to work with such class type (similar as abstract class or interfaces in java)
-}

{-
    definition of `elem` (list contains) function:
    elem :: Eq a => a -> [a] -> Bool

    Eq a => a
    Eq a - it's restriction of polymorph type `a`, means type `a` should implements class `Eq` (or be ralated to class `Eq`)
-}
{-
    standard class `Eq` requiring to have two methods:
    (==) :: a -> a -> Bool
    (/=) :: a -> a -> Bool
-}

example1 = do
    print $
        if "yellow" `elem` colors
            then "Yello is here!"
            else "There's no yellow..."
  where
    colors = ["red", "black", "yellow", "green"]

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- custom polymorph type restrictions

-- nothing :: a -> a
nothing1 :: (Eq a) => a -> a
nothing1 val = val

newtype IPAddress = IP String deriving (Show, Eq)

example2 = do
    print $ nothing1 $ IP "127.0.0.1"

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- multiple polymorph type restrictions

-- `a` should implements `Show` and `Eq`
nothing2 :: (Show a, Eq a) => a -> a
nothing2 value = value

-- `a` should implements `Show`, `b` should implements `Show` and `Eq`
nothing3 :: (Show a, Show b, Eq b) => a -> b -> String
-- restriction allows to use class type methods in method implementation (same as acception `abstrct class` or `interface`)
nothing3 value1 value2 = show value1 ++ ":" ++ show value2

example3 = do
    print $ nothing2 $ IP "127.0.0.1"
    print $ nothing3 (IP "127.0.0.1") (IP "8080")

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

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example7 = do
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example8 = do
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example9 = do
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

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

