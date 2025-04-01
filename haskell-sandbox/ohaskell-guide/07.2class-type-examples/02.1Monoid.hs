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

    INFO: When to Use a Monoid?

       - Combining values in an associative way.
       - Defining an identity element that does nothing.
       - Reducing structures using foldMap and mconcat.

    INFO: Monoid vs Semigroup

   ---------------------------------------------------------------
   | Feature         | Semigroup         | Monoid                |
   | ------------------------------------------------------------|
   | ------------------------------------------------------------|
   | Requires <*>    | ✅                | ✅                    |
   | ----------------|-------------------|-----------------------|
   | Requires mempty | ❌                | ✅                    |
   | ----------------|-------------------|-----------------------|
   | Example Type    | Sum Int, String   | Sum Int, String, Maybe|
   ---------------------------------------------------------------

    INFO: Summary

    1. A Monoid has mempty and <>.
    2. Common Monoids:
        - "Sum" and "Product" (for numbers).
        - Lists and Strings (concatenation).
        - "Any" and "All" (for Booleans).
        - "First" and "Last" (for option-like values).
    3. Monoid helps with folding ("foldMap" and "mconcat").

    💡 Monoid is powerful when dealing with aggregation and combination tasks in a predictable way! 🚀
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
    Lists naturally form a "Monoid" under concatenation.
-}

example2 = do
    putStrLn "--->>> 2. Example: Lists:"
    -- mempty :: [Int]  -- Result: []
    print $ [1, 2] <> [3, 4] -- Result: [1,2,3,4]
    print $ mconcat [[1, 2], [3, 4]] -- Result: [1,2,3,4]

{-
    💡 Key Idea:
        - The identity (mempty) is [], which doesn’t change anything when combined.
-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 3. Example: Strings
{-

-}

example3 = do
    putStrLn "--->>> 3. Example: Strings:"
    -- mempty :: String  -- Result: ""
    print $ "Hello" <> " World" -- Result: "Hello World"
    print $ mconcat ["H", "a", "s", "k", "e", "l", "l"] -- Result: "Haskell"

{-
    💡 Key Idea:
        "Hello" <> " World" is just string concatenation.
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 4. Example: Booleans
{-
    There are two possible Monoid instances for Bool:
        - "Any" (where mempty is False, <> is logical OR)
        - "All" (where mempty is True, <> is logical AND)
-}

allTrue :: [Bool] -> Bool
-- allTrue = getAll . mconcat . map All
allTrue = getAll . foldMap All

anyTrue :: [Bool] -> Bool
-- anyTrue = getAny . mconcat . map Any
anyTrue = getAny . foldMap Any

example4 = do
    putStrLn "--->>> 4. Example: Booleans:"
    -- mempty :: Any  -- Result: Any False
    print $ Any True <> Any False -- Result: Any True
    print $ anyTrue [False, False, True] -- Output: True
    --
    -- mempty :: All  -- Result: All True
    print $ All True <> All False -- Result: All False
    print $ allTrue [True, True, False] -- Output: False

{-
    💡 Key Idea:
        - "Any" is useful when you need "at least one" "True".
        - "All" is useful when "all" values must be "True".

    For list of bools "foldMap" - is more efficient because "foldMap" directly maps and reduces the list in a single pass.
-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 5. Example: First and Last (Maybe-like Monoids)
{-
    Sometimes we care about the first or last non-Nothing value.
-}

example5 = do
    putStrLn "--->>> 5. Example: First and Last (Maybe-like Monoids):"
    -- mempty :: First Int  -- Result: First Nothing
    print $ First (Just 5) <> First (Just 10) -- Result: First (Just 5)
    --
    -- mempty :: Last Int  -- Result: Last Nothing
    print $ Last (Just 5) <> Last (Just 10) -- Result: Last (Just 10)

{-
    💡 Key Idea:
        - First picks the first non-Nothing value.
        - Last picks the last non-Nothing value.
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 6. Monoid with "foldMap"
{-
    A Monoid is especially useful in combination with "Foldable".

    Example: Summing a List

        Instead of writing:
            -------------------------
            sum [1,2,3]  -- Result: 6
            -------------------------
        We can use foldMap with Monoid:
-}

example6 = do
    putStrLn "--->>> 6. Monoid with foldMap:"
    print $ foldMap Sum [1, 2, 3] -- Result: Sum 6
    print $ foldMap Product [1, 2, 3, 4] -- Result: Product 24
    --
    -- Example: Finding Any True:
    print $ foldMap Any [False, False, True] -- Result: Any True
    print $ foldMap All [True, True, False] -- Result: All False

{-
💡 Key Idea:
    "foldMap f" maps each element using "f" and then combines all results using <>.
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 7. Defining a Custom Monoid
{-
    Let's define a custom Monoid for a logging system.
-}

newtype Log = Log String
    deriving (Show)

instance Semigroup Log where
    Log a <> Log b = Log (a ++ "\n" ++ b)

instance Monoid Log where
    mempty = Log ""

example7 = do
    putStrLn "--->>> 7. Defining a Custom Monoid:"
    let log1 = Log "Started application"
    let log2 = Log "User logged in"
    let log3 = Log "Error: Invalid password"
    print $ log1 <> log2 <> log3

-- Result:
-- Log "Started application
-- User logged in
-- Error: Invalid password"

{-
    💡 Key Idea:
       - "mempty" is an empty log.
       - <> concatenates logs with newlines.
-}
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
