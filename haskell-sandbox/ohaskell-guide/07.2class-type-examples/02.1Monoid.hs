import Data.Monoid

{-
    A "Monoid" is a type class that extends "Semigroup" by adding an "identity element" (mempty).
        It represents types that can be combined together "associatively" while having a neutral element.

    INFO: Monoid Laws
        A type must satisfy two laws to be a valid "Monoid":

            1. Left identity: mempty\<>x=x
            2. Right identity: x\<>mempty=x
            3. Associativity (inherited from "Semigroup"): (a\<>b)\<>c=a\<>(b\<>c)

        These laws ensure that combining values behaves predictably.

-}

----------------------------------------------------------------------------
------------------- Monoid in Action ---------------------------------------
----------------------------------------------------------------------------
-- INFO: 1. Example: Numbers with Sum and Product
{-
    Haskell doesn't assume numbers are always monoids — why?

    Because numbers have multiple valid "Monoid" instances:
        - Addition (Sum)
        - Multiplication (Product)
-}

example1 = do
    putStrLn "--->>> 1. Example: Numbers with Sum and Product:"
    -- mempty :: Sum Int -- Result: Sum 0
    print $ Sum 3 <> Sum 5 -- Result: Sum 8
    print $ mconcat [Sum 3, Sum 2] -- Result: Sum 5
    --
    -- mempty :: Product Int -- Result: Product 1
    print $ Product 3 <> Product 5 -- Result: Product 15

{-
    💡 Key Idea:
        - "Sum" uses 0 as the identity.
        - "Product" uses 1 as the identity.
-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 2. Example: Lists
{-

-}

example2 = do
    putStrLn "--->>> 2. Example: Lists:"

{-

-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO:
{-

-}

example3 = do
    putStrLn "--->>> :"

{-

-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO:
{-

-}

example4 = do
    putStrLn "--->>> :"

{-

-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO:
{-

-}

example5 = do
    putStrLn "--->>> :"

{-

-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO:
{-

-}

example6 = do
    putStrLn "--->>> :"

{-

-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO:
{-

-}

{-

-}
example7 = do
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO:
{-

-}

example8 = do
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO:
{-

-}

example9 = do
    putStrLn "--->>> :"

{-

-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO:
{-

-}

example10 = do
    putStrLn "--->>> :"

{-

-}
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
