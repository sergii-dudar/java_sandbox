prefix :: String -> String
prefix str = "--->>> :" ++ str

newtype Year value = Year value deriving (Show)

instance Functor Year where
    -- function `f` will be applied not to `Year value`, but to real `value` instead
    fmap f (Year value) = Year (f value)

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- usage example:

-- note that `increase` function nothing know about functor, and where it will be using
-- it's just know about real velua and how to work with it
increase :: Int -> Int
increase year = year + 1

increaseStr :: String -> String
increaseStr year = year ++ "1"

-- it's read power of functiors, as functor can use any simple functions, that know nothing about functors
example1 = do
    putStrLn . prefix . show $ fmap increase yearInt
  where
    yearInt = Year 1988

example2 = do
    -- putStrLn . prefix . show $ fmap increaseStr yearInt
    putStrLn . prefix . show $ increaseStr `fmap` yearInt
  where
    yearInt = Year "1988"

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Functor infix form: <$>

example3 = do
    putStrLn . prefix . show $ increase <$> yearInt
  where
    yearInt = Year 1988

example4 = do
    putStrLn . prefix . show $ increaseStr <$> yearInt
  where
    yearInt = Year "1988"

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
