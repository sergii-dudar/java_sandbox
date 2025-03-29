import Data.Char (digitToInt, toLower)

prefix :: String -> String
prefix str = "--->>> :" ++ str

{-
    class Functor f where
        fmap :: Functor f => (a -> b) -> f a -> f b

    <$> is infix form of fmap of functor
-}
{-

Functor - it's value wrapper that applying to some function and returning another functor wrapper

functor type, has only one method `fmap` that doind exectly it.
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- simple example:

example1 = do
    putStrLn . prefix . show $ fmap toLower ['A' .. 'Z']
    putStrLn . prefix . show $ fmap digitToInt ['1' .. '9']

-- As we see, list also belong to `Functor` class type

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
