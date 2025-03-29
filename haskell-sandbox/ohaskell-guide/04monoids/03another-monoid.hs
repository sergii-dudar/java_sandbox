import Data.Monoid

{-
    Monoids in Haskell are useful because they provide a generalized way to combine values
    using an associative operation with an identity element. While you can always manually
    define functions to combine values, Monoids allow for abstraction, code reuse, and composability.

    When to Use Monoids?
    - Aggregating values (e.g., summing numbers, concatenating strings)
    - Defining defaults (mempty gives a natural starting value)
    - Composing computations (e.g., combining logging outputs)

    Monoids provide:
-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Example: Summing a List

total :: [Sum Int] -> Sum Int
total = mconcat -- Works for any Monoid!

{-
    1. Uniform Combination of Values:
        Without monoids, every data type needs its own custom combination function.
        With monoids, we get a standardized way to combine values, making our code more generic.
-}

example1 = do
    putStrLn "--->>> Example: Summing a List:"
    print $ getSum $ total [Sum 1, Sum 2, Sum 3]

-- This works without needing a custom sum function.

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- 2. Parallel & Associative Computation
-- - Because monoids are associative, we can process data in parallel without worrying about order.

example2 = do
    putStrLn "--->>> Example: Splitting & Merging Computation:"
    print $ foldMap Sum [1, 2, 3, 4] == (Sum 1 <> Sum 2) <> (Sum 3 <> Sum 4)

-- This property makes monoids useful in distributed computing (e.g., MapReduce).

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- 3. This property makes monoids useful in distributed computing (e.g., MapReduce).
-- - Monoids allow a single function to work with many different data types.

combineAll :: (Monoid m) => [m] -> m
combineAll = mconcat -- Works for Sum, Product, etc.

example3 = do
    putStrLn "--->>> Example: Generalized Combination:"
    print $ getProduct $ combineAll [Product 2, Product 3, Product 4]

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- 4. Default Values and Accumulation
-- - mempty provides a default value, avoiding the need for special handling of empty cases.

example4 = do
    putStrLn "--->>> Example: Safe Reduction Without Edge Cases:"
    print $ (mconcat [] :: Sum Int)

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- 5. Composability in Functional Design
-- - Monoids make it easy to compose complex behavior from small parts.

example5 = do
    putStrLn "--->>> Example: Logging System:"
    let log1 = "Started."
    let log2 = "Processing..."
    let log3 = "Finished."

    let combinedLog = mconcat [log1, " ", log2, " ", log3]
    print combinedLog

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Using mconcat
-- Since mconcat is just foldr mappend mempty, we can use it to combine multiple values:

example6 = do
    print $ mconcat [Sum 1, Sum 2, Sum 3] -- Sum 6
    print $ mconcat ["Hello", " ", "World!"] -- "Hello World!"

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

{-
    Without Monoids:
        We would need to write separate functions for summing, multiplying, and other combinations.
        We wouldn't be able to write generic code that works for multiple types.
        Parallel computations wouldn't be as simple due to lack of associativity.
-}
