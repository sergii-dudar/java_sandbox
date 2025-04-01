{-
    An "Applicative Functor" extends "Functor" by allowing "function application inside a context".
        It introduces two key operations:

    Definition:
        ------------------------------------------
        class Functor f => Applicative f where
            pure  :: a -> f a
            (<*>) :: f (a -> b) -> f a -> f b
        ------------------------------------------
        - "pure" lifts a value into the context.
        - <*> applies a function "inside the context" to a value "inside the context".

    INFO: Applicative Laws

        1. Identity: pure id <*> v = v
            (id does nothing.)

        2. Homomorphism: pure f <*> pure x = pure (f x)
            (Applying a function to a value inside pure is the same as applying it normally.)

        3. Interchange: u <*> pure y = pure ($ y) <*> u
            ("u" is applied to "y", but we can flip the structure.)

        4. Composition: pure (.) <*> u <*> v <*> w = u <*> (v <*> w)
            ((.) helps maintain function composition.)

    INFO: Why Use Applicatives?

       1. "Handles effects" while applying functions.
       2. Useful when working with multiple contexts.
       3. Cleaner than Monads when effects don't depend on previous computations.

    INFO: Summary:

        1. Applicative extends Functor with function application in a context.
        2. Key operations:
            - "pure" lifts values.
            - <*> applies functions inside the structure.
        3. Examples: Maybe, List, Either, Functions.
        4. Laws ensure predictable behavior.
        5. Applicatives are useful when effects are independent.

    💡 Applicative sits between Functor and Monad, providing structured computation while keeping it simple! 🚀

     INFO: Functor vs. Applicative vs. Monad

       ------------------------------------------------------------------------------------------------------
        Feature                                                     | Functor   | Applicative   | Monad
       ------------------------------------------------------------------------------------------------------
       ------------------------------------------------------------------------------------------------------
        Apply functions inside context                              | ✅ (fmap) | ✅ (<*>)      | ✅ (>>=)
       -------------------------------------------------------------|-----------|---------------|------------
        Handles functions inside context                            | ❌        | ✅            | ✅
       -------------------------------------------------------------|-----------|---------------|------------
        Chains computations where next step depends on previous     | ❌        | ❌            | ✅
       -------------------------------------------------------------|-----------|---------------|------------
        Works with independent computations                         | ✅        | ✅            | ❌
       ------------------------------------------------------------------------------------------------------

        Monads solve problems where each step depends on the previous result
            (unlike Applicative, where computations are independent).
-}

----------------------------------------------------------------------------
-------------------------- Examples of Applicative Instances ---------------
----------------------------------------------------------------------------
-- INFO: 1. Applicative for Maybe

example1 = do
    putStrLn "--->>> 1. Applicative for Maybe:"
    print $ pure (+ 1) <*> Just 5 -- Result: Just 6
    print $ pure (* 2) <*> Nothing -- Result: Nothing
    print $ Just (+ 3) <*> Just 7 -- Result: Just 10
    print $ (Nothing <*> Just 3 :: Maybe Integer) -- Result: Nothing

{-
    📌 Explanation:
        - If any operand is "Nothing", result is "Nothing".
        - Otherwise, it applies the function.
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 2. Applicative for Lists
{-
    <*> applies "each function" to "each value".
-}

example2 = do
    putStrLn "--->>> 2. Applicative for Lists:"
    print $ pure (* 2) <*> [1, 2, 3] -- Result: [2,4,6]
    print $ [(+ 1), (* 2)] <*> [10, 20] -- Result: [11,21,20,40]

{-
    📌 Explanation:
        - pure (*2) makes (*2) apply to all elements.
        - [(+1), (*2)] <*> [10,20] applies both functions.
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 3. Applicative for Either

example3 = do
    putStrLn "--->>> 3. Applicative for Either:"
    print $ (pure (* 2) <*> Right 5 :: Either Int Int) -- Result: Right 10
    print $ (Left "Error" <*> Right 5 :: Either String Int) -- Result: Left "Error"
    print $ (pure (+) <*> Right 3 <*> Right 5 :: Either Int Int) -- Result: Right 8

{-
    📌 Explanation:
        - Left short-circuits computations.
-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 4. Applicative for Functions ((->) r)

example4 = do
    putStrLn "--->>> 4. Applicative for Functions ((->) r):"
    print $ pure (+) <*> (* 2) <*> (+ 3) $ 1
    -- Expands to:
    print $ (\x -> (+) (x * 2) (x + 3)) $ 1

{-
    📌 Explanation:
        - Functions as Applicatives chain computations.
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 5. Custom Applicative Instance
{-
    Let's define an "Applicative" for a "Box" type:
-}

newtype Box a = Box a deriving (Show)

instance Functor Box where
    fmap f (Box x) = Box (f x)

instance Applicative Box where
    pure x = Box x
    (Box f) <*> (Box x) = Box (f x)

example5 = do
    putStrLn "--->>> 5. Custom Applicative Instance:"
    print $ pure (* 2) <*> Box 10 -- Result: Box 20
    print $ Box (+ 1) <*> Box 5 -- Result: Box 6

{-
    📌 Explanation:
        - "pure" lifts values into "Box".
        - <*> applies "Box f" to "Box x".
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
