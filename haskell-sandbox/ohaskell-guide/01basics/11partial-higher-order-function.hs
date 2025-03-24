import Data.Char
import Data.List (isPrefixOf)
import System.Console.Terminfo (functionKey)

addPrefix :: String -> String
addPrefix str = "--->>> :" ++ str

replace :: String -> String -> String -> String
replace old new str
    | old `isPrefixOf` str = new ++ drop (length old) str
    | otherwise = case str of
        [] -> []
        (x : xs) -> x : replace old new xs

example1 = do
    putStrLn . addPrefix $ result
  where
    first = replace "http"
    second = first "https"
    result = second "http://google.com"

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- replace :: String -> String -> String -> String
--            [                                  ] - full
--                      [                        ] - partial
--                                [              ] - partial
--
-- actually partial func in haskell it's king of every parameter is wraped in new function,
-- where value if saved inside closure, untill will not be called all parameter pipelines
-- replace:: {return var1 -> { reutn var2 -> { return var3 -> return var1 + var2 + var3 } } }
--
-- because of that every not all parameters passed in function returning not final value, but function that required the rest of values to finish.

example2 = do
    -- types just to demonstration of partial func unwrapping
    let full :: String -> String -> String -> String = replace
    let partial1 :: String -> String -> String = full "http"
    let partial2 :: String -> String = partial1 "https"
    putStrLn . addPrefix . partial2 $ "http://google.com"

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- because of partial nature of haskell function, we can pass reference to partial function, without declaring parameter explicitly,
-- as it will by passed during calling in calling code, example:

toStr :: [Double] -> [String]
toStr numbers = map show numbers

toStr2 :: [Double] -> [String]
toStr2 = map show -- the same as toStr, as it's reference to last partial funct, that waitiong just param to finish execution

example3 = do
    putStrLn . addPrefix . show . toStr2 $ [1.2, 1, 4, 1.6]

----------------------------------------------------------------------------
----------------------------------------------------------------------------

pretty :: [String] -> [String]
pretty = map (stars . big)
  where
    big = map toUpper
    stars = \s -> "* " ++ s ++ " *"

example4 = do
    putStrLn . addPrefix . show . pretty $ ["haskell", "lisp", "coq"]

----------------------------------------------------------------------------
----------------------------------------------------------------------------

-- divide :: Double -> Double -> Double
divide :: Double -> (Double -> Double) -- or
divide arg1 arg2 = arg1 / arg2

-- totalSum :: Double -> Double -> Double -> Double
totalSum :: Double -> (Double -> (Double -> Double)) -- or
totalSum arg1 arg2 arg3 = arg1 + arg2 + arg3

example5 = do
    let temporaryFunction = divide 10.03
     in putStrLn . addPrefix . show . temporaryFunction $ 2.1

    let firstFunction = totalSum 1.0
        secondFunction = firstFunction 2.0
     in putStrLn . addPrefix . show . secondFunction $ 3.0

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
