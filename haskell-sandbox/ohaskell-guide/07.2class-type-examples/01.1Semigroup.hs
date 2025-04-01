import Data.Semigroup

{-
    A "Semigroup" is a type class that represents "associative binary operations".
        It provides a way to combine two values of the same type.

    Definition:
        --------------------------------
        class Semigroup a where
            (<>) :: a -> a -> a
        --------------------------------
        - (<>) is an associative binary operation.
        - It must satisfy the "associativity law": (a <> b) <> c == a <> (b <> c)
                (Order of grouping does not change the result.)

    INFO: Why Use Semigroup?

        - Defines a "consistent way" to combine values.
        - Used in "monoids", "parsers", and "data aggregation".

    💡 A Semigroup is simply a structure that supports associative combination! 🚀
-}

----------------------------------------------------------------------------
------------------ Examples of Semigroup Instances -------------------------
----------------------------------------------------------------------------
-- INFO: 1. Semigroup for String
{-

-}

example1 = do
    putStrLn "--->>> 1. Semigroup for String:"
    print $ "Hello, " <> "World!" -- Result: "Hello, World!"

{-
    📌 Explanation:
        - Concatenates strings.
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 2. Semigroup for Lists
{-

-}

example2 = do
    putStrLn "--->>> 2. Semigroup for Lists:"
    print $ [1, 2, 3] <> [4, 5, 6] -- Result: [1,2,3,4,5,6]

{-
    📌 Explanation:
        - Merges lists.
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 3. Semigroup for Maybe with First and Last
{-
    Haskell provides special instances for Maybe:
-}

example3 = do
    putStrLn "--->>> 3. Semigroup for Maybe with First and Last:"
    print $ First (Just 3) <> First (Just 5) -- Result: First (Just 3)
    print $ Last (Just 3) <> Last (Just 5) -- Result: Last (Just 5)

{-
    📌 Explanation:
        - First keeps the first Just value.
        - Last keeps the last Just value.
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 4. Semigroup for Sum and Product

example4 = do
    putStrLn "--->>> 4. Semigroup for Sum and Product:"
    print $ Sum 3 <> Sum 5 -- Result: Sum 8
    print $ Product 3 <> Product 5 -- Result: Product 15

{-
    📌 Explanation:
        - Sum adds numbers.
        - Product multiplies numbers.
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 5. Custom Semigroup

newtype Box a = Box a deriving (Show)

instance Semigroup (Box [a]) where
    Box xs <> Box ys = Box (xs ++ ys)

example5 = do
    putStrLn "--->>> 5. Custom Semigroup:"
    print $ [1, 2] <> [3, 4] -- Result: [1,2,3,4]
    print $ [1, 2] ++ [3, 4] -- Result: [1,2,3,4]
    print $ Box [1, 2] <> Box [3, 4] -- Result: Box [1,2,3,4]

{-
    📌 Explanation:
        (<>) merges lists inside Box.
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
