import Data.Char

-- HOF it's `Higher Order Function` that using another functions and their arguments (like composition functions etc)
-- map: is one of the most popular HOF example
--  declaration: `map :: (a -> b) -> [a] -> [b]`

-- toUpperCase :: [Char] -> [Char]
toUpperCase :: String -> String
toUpperCase str = map toUpper str

example1 = do
    putStrLn . toUpperCase $ "haskell.org"

{-
in general if will process every string char one by one by transform function (toUpper in our case) and transform to new arrays (new String in our case)

map toUpper [ 'h'  >>  [ 'H'
            , 'a'  >>  , 'A'
            , 's'  >>  , 'S'
            , 'k'  >>  , 'K'
            , 'e'  >>  , 'E'
            , 'l'  >>  , 'L'
            , 'l'  >>  , 'L'
            , '.'  >>  , '.'
            , 'o'  >>  , 'O'
            , 'r'  >>  , 'R'
            , 'g'  >>  , 'G'
            ]          ]

map toUpper "haskell.org" = "HASKELL.ORG"

-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- enother examples

-- convert double array to string array
toStr :: [Double] -> [String]
toStr numbers = map show numbers

addPrefix :: String -> String
addPrefix str = "--->>> :" ++ str

example2 = do
    putStrLn . addPrefix . show . toStr $ [1.2, 1, 4, 1.6]

-- putStrLn . show . toStr $ [1.2, 1, 4, 1.6]

-- print . toStr $ [1.2, 1, 4, 1.6]

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- custom mapper
ten :: [Double] -> [Double]
ten = map (\n -> n * 10)

example3 = do
    putStrLn . addPrefix . show . ten $ [1.2, 1, 4, 1.6]
    putStrLn . addPrefix . show . map (\n -> n * 10) $ [1.2, 1, 4, 1.6]

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
