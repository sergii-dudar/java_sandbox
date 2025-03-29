import Data.Monoid

{-
    The <> operator in Haskell is a shorthand for mappend, which is part of the
    Monoid type class. It is used for combining two values of a Monoid instance.

    class Semigroup a where
       (<>) :: a -> a -> a

    NOTE: Since GHC 8.4, Monoid requires Semigroup, meaning all Monoid instances must define (<>)
        class Semigroup a => Monoid a where
            mempty :: a  -- Identity element

     Key Takeaways
        - `<>` is from `Semigroup` and is used to combine values.
        - Every `Monoid` must define `<>` since it extends `Semigroup`.
        - It works for lists, numbers (via `Sum`/`Product`), `Maybe`, `Map`, `Set`, etc.
-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- for lists

example1 = do
    print $ "Hello, " <> "world!" -- Output: "Hello, world!"

-- (Same as (++) for lists.)

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- For Sum & Product (Numbers as Monoids)

example2 = do
    print $ Sum 5 <> Sum 10 -- Output: Sum {getSum = 15}

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- For Maybe (with First & Last)

example3 = do
    print $ First (Just "A") <> First (Just "B") -- Output: First {getFirst = Just "A"}

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
