{-
    A "Monad" is an extension of "Applicative" that allows "chaining computations" where
        each step "depends on the result of the previous step".

        Definition:

        --------------------------------------------------------------
        class Applicative m => Monad m where
            (>>=)  :: m a -> (a -> m b) -> m b
            (>>)   :: m a -> m b -> m b   -- Used to sequence actions, ignoring the first result.
            return :: a -> m a            -- Same as pure
        --------------------------------------------------------------
        - (>>=) (bind) takes a "monadic value" "m a" and a function "a -> m b", applying the function inside the monad.
        - (>>) sequences computations, ignoring the first result.
        - "return" is just "pure", lifting a value.

       INFO: Monad Laws

        To ensure predictable behavior, monads follow these laws:
        1. Left Identity:       return x >>= f == f x
            (Lifting and binding a value is the same as applying the function.)
        2. Right Identity:      m >>= return == m
            (Binding with return does nothing.)
        3. Associativity:       (m >>= f) >>= g  ==  m >>= (\x -> f x >>= g)
            (Binding in steps is the same as rewriting the chain.)

        INFO: Monad vs. Applicative

          --------------------------------------------------------
          | Feature                 | Applicative   | Monad      |
          |-------------------------------------------------------
          |-------------------------------------------------------
          | Pure Functions          | ✅            | ✅         |
          |-------------------------|---------------|------------|
          | Lifts Values            | ✅ (pure)     | ✅ (return)|
          |-------------------------|---------------|------------|
          | Works with Context      | ✅            | ✅         |
          |-------------------------|---------------|------------|
          | Handles Dependencies    | ❌            | ✅         |
          |-------------------------|---------------|------------|
          | Chains Computations     | ❌            | ✅ (>>=)   |
          --------------------------------------------------------

        INFO: When to Use a Monad?

            - When each step depends on previous results (e.g., IO, Maybe, Either).
            - When handling side effects, errors, or sequences of computations.

        💡 A Monad is like an improved Applicative, enabling dependent computations inside a context! 🚀
-}

----------------------------------------------------------------------------
--------------------Examples of Monad Instances-----------------------------
----------------------------------------------------------------------------
-- INFO: 1. Monad for Maybe
{-

-}

example1 = do
    putStrLn "--->>> 1. Monad for Maybe:"
    print $ Just 3 >>= (\x -> Just (x + 1)) -- Result: Just 4
    print $ Nothing >>= (\x -> Just (x + 1)) -- Result: Nothing

{-
    📌 Explanation:
        - If Nothing, the function never applies.
-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 2. Monad for Lists
{-
    with lists, which form a monad where >>= represents flatMap (or concatMap in Haskell terms).
-}

example2 = do
    putStrLn "--->>> 2. Monad for Lists:"
    print $ [1, 2, 3] >>= \x -> [x, -x] -- Result: [1,-1,2,-2,3,-3]

{-
    📌 Explanation:
        - Each element expands into a new list.

        [1, 2, 3] >>= \x -> [x, -x] will expand to next:

        Step 1: Expand >>= for lists:
            concatMap (\x -> [x, -x]) [1, 2, 3]
                (This means we apply the function \x -> [x, -x] to each element of [1, 2, 3] and then concatenate the results.)

        Step 2: Apply the function
            For 1: \x -> [x, -x] gives [1, -1]
            For 2: \x -> [x, -x] gives [2, -2]
            For 3: \x -> [x, -x] gives [3, -3]

        Step 3: Concatenate the results
            [1, -1] ++ [2, -2] ++ [3, -3] == [1, -1, 2, -2, 3, -3]

-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 3. Monad for IO
{-

-}

example3 = do
    putStrLn "--->>> 3. Monad for IO:"
    -- name <- getLine -- commented to not ask enter from IO
    let name = "input from std"
    putStrLn ("Hello, " ++ name)

{-
    📌 Explanation:
        <- extracts a value from IO, using (>>=) under the hood.
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 4. Monad for Either (Error Handling)
{-

-}

example4 = do
    putStrLn "--->>> 4. Monad for Either (Error Handling):"
    print $ (Right 10 >>= (\x -> Right (x * 2)) :: Either Int Int) -- Result: Right 20
    print $ Left "Error" >>= (\x -> Right (x * 2)) -- Result: Left "Error"

{-
    📌 Explanation:
        "Left" short-circuits computations.
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 5. Custom Monad
{-

-}

newtype Box a = Box a deriving (Show)

instance Functor Box where
    fmap f (Box x) = Box (f x)

instance Applicative Box where
    pure x = Box x
    (Box f) <*> (Box x) = Box (f x)

instance Monad Box where
    (Box x) >>= f = f x

example5 = do
    putStrLn "--->>> 5. Custom Monad:"
    print $ Box 5 >>= (\x -> Box (x * 2)) -- Result: Box 10

{-
    📌 Explanation:
        Box 5 >>= f applies f inside the Box.
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
