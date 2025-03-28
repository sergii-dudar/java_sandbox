import Control.Applicative

-- https://www.tutorialspoint.com/haskell/haskell_functor.htm
{-
    By this definition, we can conclude that the Functor is a function which takes a function, say,
    fmap() and returns another function. In the above example, fmap() is a generalized
    representation of the function map().

    Here, we have used both map() and fmap() over a list for a subtraction operation. You can observe
    that both the statements will yield the same result of a list containing the elements [1,3,7,15].
-}
example1 = do
    putStrLn "--->>> Functor: "
    print (fmap (subtract 1) [2, 4, 8, 16])
    print (map (subtract 1) [2, 4, 8, 16])

----------------------------------------------------------------------------
----------------------------------------------------------------------------
{-
    Then, what is the difference between map and fmap? The difference lies in their usage.
    Functor enables us to implement some more functionalists in different data types, like `Just v` and `Nothing`.
-}
example2 = do
    putStrLn "--->>> :"
    print (fmap (+ 7) (Just 10))
    print (fmap (+ 7) Nothing)

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
