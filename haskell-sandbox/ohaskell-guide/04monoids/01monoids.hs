prefix :: String -> String
prefix str = "--->>> :" ++ str

{-
    A `Monoid` is a set of functions and operators where the output is independent of its input.
    Lets take a function (*) and an integer (1). Now, whatever may be the input, its output will
    remain the same number only. That is, if you multiply a number by 1, you will get the same number.

    class Monoid m where
        mempty :: m
        mappend :: m -> m -> m
        mconcat :: [m] -> m
        mconcat = foldr mappend mempty

    infix form of `mappend`:

    class Semigroup a where
       (<>) :: a -> a -> a
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Take a look at the following example to understand the use of Monoid in Haskell.

multi :: (Num a) => a -> a
multi x = x * 1

add :: (Num a) => a -> a
add x = x + 0

example1 = do
    putStrLn "--->>> Monoids: "
    print (multi 9)
    print (add 7)

{-
    Here, the function "multi" multiplies the input with "1". Similarly, the function "add" adds
    the input with "0". In the both the cases, the output will be same as the input. Hence, the
    functions {(*),1} and {(+),0} are the perfect examples of monoids.
-}
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
