import Control.Monad

{-
    The "MonadPlus" type class extends both "Monad" and "Alternative", providing "monadic failure" and "choice".

    Definition:
        ----------------------------------------------------------------------
        class (Monad m, Alternative m) => MonadPlus m where
            mzero :: m a  -- Represents failure (same as `empty`)
            mplus :: m a -> m a -> m a  -- Represents choice (same as `<|>`)
        ----------------------------------------------------------------------
        - mzero: Represents failure or an empty computation.
        - mplus: Provides a way to combine two computations.

    📌 "MonadPlus" combines the features of "Alternative (choice)" and "Monad (chaining)".

    INFO: MonadPlus Laws

    1. Left identity: mzero >>= f == mzero
        (Failing first means the whole computation fails.)
    2. Right identity: m `mplus` mzero == m
        ("mzero" does nothing when combined.)
    3. Associativity: (m `mplus` n) `mplus` o == m `mplus` (n `mplus` o)
        (Grouping does not change the result.)

    INFO: MonadPlus vs. Alternative

    -------------------------------------------------
     Feature         | Alternative   | MonadPlus
    -------------------------------------------------
    -------------------------------------------------
     Extends         | Applicative   | Monad
    -----------------|---------------|---------------
     `<              | >/mplus`      | ✅ (choice)
    -----------------|---------------|---------------
     empty / mzero   | ✅ (failure)  | ✅ (failure)
    -----------------|---------------|---------------
     mfilter         | ❌            | ✅ (filtering)
    -------------------------------------------------

    📌 MonadPlus is more powerful than Alternative because it works with Monad and allows filtering (mfilter).

    Why Use MonadPlus?
        - Handles failure in monadic computations.
        - Defines nondeterministic computations (like lists).
        - Supports filtering (mfilter) inside monads.

    💡 MonadPlus is a powerful tool for handling failure, choice, and nondeterminism! 🚀
-}

----------------------------------------------------------------------------
-------------- Examples of MonadPlus Instances -----------------------------
----------------------------------------------------------------------------
-- INFO: 1. MonadPlus for Maybe (Failure Handling)

example1 = do
    putStrLn "--->>> 1. MonadPlus for Maybe (Failure Handling):"
    print $ Just 5 `mplus` Just 10 -- Result: Just 5
    print $ Nothing `mplus` Just 10 -- Result: Just 10
    print $ (Nothing `mplus` Nothing :: Maybe Int) -- Result: Nothing

{-
    📌 Explanation:
        Takes the first successful result.
        If both are Nothing, the result is Nothing.
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 2. MonadPlus for Lists (Nondeterministic Computation)

example2 = do
    putStrLn "--->>> 2. MonadPlus for Lists (Nondeterministic Computation):"
    print $ [1, 2] `mplus` [3, 4] -- Result: [1,2,3,4]
    print $ [] `mplus` [3, 4] -- Result: [3,4]
    print $ ([] `mplus` [] :: [Int]) -- Result: []

{-
    📌 Explanation:
        - Concatenates lists (like Alternative for lists).
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 3. Using MonadPlus for Filtering (mfilter)

example3 = do
    putStrLn "--->>> 3. Using MonadPlus for Filtering (mfilter):"
    print $ mfilter (> 5) (Just 10) -- Result: Just 10
    print $ mfilter (> 5) (Just 3) -- Result: Nothing
    print $ mfilter (> 5) Nothing -- Result: Nothing

{-
📌 Explanation:
    - mfilter applies a filtering condition.
    - If it fails, it returns mzero (Nothing).
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 4. Using MonadPlus for Backtracking in List Monad

pairs :: [(Int, Int)]
pairs = do
    x <- [1, 2]
    y <- [3, 4]
    return (x, y)

example4 = do
    putStrLn "--->>> 4. Using MonadPlus for Backtracking in List Monad:"
    print $ pairs

{-
    📌 Explanation:
        - The list monad combines all possible pairs.
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

example7 = do
    putStrLn "--->>> :"

{-

-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO:
{-

-}

example8 = do
    putStrLn "--->>> :"

{-

-}
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
