import Control.Applicative
import Control.Arrow
import Control.Monad
import Data.Monoid
import Data.Semigroup

{-
    Here's a table summarizing the differences, purposes, and examples of key Haskell type classes:

    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    | N# | Type Class  | Purpose                                                                                      | Laws                                                       | Example                                              |
    |----|-------------|----------------------------------------------------------------------------------------------|------------------------------------------------------------|------------------------------------------------------|
    | 1  | Semigroup   | Defines an associative binary operation.                                                     | Associativity: (a <> b) <> c == a <> (b <> c)              | "Hello" <> " " <> "World": results in "Hello World". |
    |----|-------------|----------------------------------------------------------------------------------------------|------------------------------------------------------------|------------------------------------------------------|
    | 2  | Monoid      | Extends "Semigroup" by adding an identity element.                                           | Identity: mempty <> x == x <> mempty == x                  | "Hello" <> mempty: results in "Hello".               |
    |----|-------------|----------------------------------------------------------------------------------------------|------------------------------------------------------------|------------------------------------------------------|
    | 3  | Functor     | Provides a way to apply a function to values inside a context (e.g., Maybe a, [], IO a).     | Identity: fmap id = id                                     |                                                      |
    |    |             |                                                                                              | Composition: fmap (f . g) = fmap f . fmap g                | fmap (+1) (Just 2): results in Just 3.               |
    |----|-------------|----------------------------------------------------------------------------------------------|------------------------------------------------------------|------------------------------------------------------|
    | 4  | Applicative | Extends "Functor" by allowing functions inside contexts to be applied to values in contexts. | Identity: pure id <*> v = v and other laws                 | Just (+3) <*> Just 5: results in Just 8.             |
    |----|-------------|----------------------------------------------------------------------------------------------|------------------------------------------------------------|------------------------------------------------------|
    | 5  | Monad       | Extends "Applicative" with the ability to chain computations with >>= (bind).                | Left identity: return a >>= f = f a,                       |                                                      |
    |    |             |                                                                                              | Right identity: m >>= return = m,                          |                                                      |
    |    |             |                                                                                              | Associativity: (m >>= f) >>= g = m >>= (\x -> f x >>= g)   | Just 3 >>= (\x -> Just (x + 1)): results in Just 4.  |
    |----|-------------|----------------------------------------------------------------------------------------------|------------------------------------------------------------|------------------------------------------------------|
    | 6  | Foldable    | Defines ways to reduce a data structure to a single summary value.                           | None beyond structural correctness                         | foldr (+) 0 [1,2,3]: results in 6.                   |
    |----|-------------|----------------------------------------------------------------------------------------------|------------------------------------------------------------|------------------------------------------------------|
    | 7  | Traversable | Allows traversing a structure, applying effects, and collecting results.                     | Must be consistent with Functor and Foldable.              | traverse print [1,2,3]: prints each number in order. |
    |----|-------------|----------------------------------------------------------------------------------------------|------------------------------------------------------------|------------------------------------------------------|
    | 8  | Alternative | Provides a way to define failure and choice for "Applicative" instances.                     | Identity: `empty <                                         | > x = x**Associativity:**(x <                        |
    |----|-------------|----------------------------------------------------------------------------------------------|------------------------------------------------------------|------------------------------------------------------|
    | 9  | MonadPlus   | Extends "Monad" with failure and choice.                                                     | Identity: mzero >>= f = mzero,                             |                                                      |
    |    |             |                                                                                              | Associativity: (m1 >>= f) >>= g = m1 >>= (\x -> f x >>= g) | guard (5 > 3) >> Just "Yes": results in Just "Yes".  |
    |----|-------------|----------------------------------------------------------------------------------------------|------------------------------------------------------------|------------------------------------------------------|
    | 10 | Arrow       | Generalizes functions (a -> b) to structures with richer composition.                        | Associativity: (f >>> g) >>> h = f >>> (g >>> h)           | arr (+1) >>> arr (*2) applied to 3: results in 8.    |
    |----|-------------|----------------------------------------------------------------------------------------------|------------------------------------------------------------|------------------------------------------------------|
    | 11 | Comonad     | Dual of "Monad", extracting values from a context.                                           | Left identity: extend extract = id,                        |                                                      |
    |    |             |                                                                                              | Right identity: extract . extend f = f                     | extract (Identity 3) results in 3.                   |
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    Each type class represents a different level of computation and structure:
        1. Semigroup, Monoid → Combining values.
        2. Functor → Applying functions inside a context.
        3. Applicative → Applying wrapped functions to wrapped values.
        4. Monad → Chaining computations with context.
        5. Foldable, Traversable → Processing structures.
        6. Alternative, MonadPlus → Handling failure and choice.
        7. Arrow, Comonad → Advanced function and context manipulation.

    NOTE: Final Thoughts
    Each type class builds on the previous:

        1. Semigroup, Monoid – Combining values.
        2. Functor – Applying functions inside a structure.
        3. Applicative – Applying wrapped functions to wrapped values.
        4. Monad – Chaining computations.
        5. Foldable, Traversable – Processing data structures.
        6. Alternative, MonadPlus – Handling failure.
        7. Arrow, Comonad – Advanced function composition.

-}

----------------------------------------------------------------------------
---------------------- Explanation with Examples: --------------------------
----------------------------------------------------------------------------
-- 1. SEMIGROUP: A Semigroup is a type class that provides an associative binary operation (<>).
{-
    The (<>) operator in Haskell is a shorthand for mappend, which is part of the
    "Monoid" type class. It is used for combining two values of a "Monoid" instance.
-}
example1 = do
    putStrLn "--->>> Semigroup:"
    print $ "Hello" <> " " <> "World" -- Result: "Hello World" (Strings naturally combine with <> (concatenation).)
    print $ Sum 3 <> Sum 5 <> Sum 7 -- Result: Sum 15 (Sum is a wrapper that makes numbers a Semigroup under addition.)

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- 2. MONOID: A Monoid extends a Semigroup by adding an identity element (mempty).

example2 = do
    putStrLn "--->>> Monoid: "
    print $ mempty <> "Haskell" -- Result: "Haskell"
    print $ mconcat ["Hello", " ", "World"] -- Result: "Hello World"  (mconcat combines all elements using <>.)
    print $ mempty <> Sum 5 -- Result: Sum 5
    print $ Sum 3 <> Sum 5 -- Result: Sum 8

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- 3. FUNCTOR: Applying a Function Inside a Context
{-
    A Functor allows applying a function inside a container (fmap).

    Laws
     - Identity: fmap id = id
     - Composition: fmap (f . g) = fmap f . fmap g
-}

example3 = do
    putStrLn "--->>> Functor: Applying a Function Inside a Context"
    --  INFO: A Functor allows you to apply a function to a wrapped value.
    --   Key Idea: fmap is like map, but it works for any functor, not just lists.
    print $ fmap (+ 1) (Just 3) -- Result: Just 4
    print $ fmap (* 2) [1, 2, 3] -- Result: [2, 4, 6]
    -- or <$>
    print $ (+ 1) <$> Just 3 -- Result: Just 4
    print $ (* 2) <$> [1, 2, 3] -- Result: [2, 4, 6]
    --

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- 4. APPLICATIVE FUNCTOR: Applying Wrapped Functions to Wrapped Values
{-
    An "Applicative Functor" allows applying functions inside a context.

    Laws:
       - Identity: pure id <*> x = x
       - Composition: pure (.) <*> u <*> v <*> w = u <*> (v <*> w)
       - Homomorphism: pure f <*> pure x = pure (f x)
       - Interchange: u <*> pure y = pure ($ y) <*> u

    Explanation examples:
       - pure (+1) <*> Just 5 (is equivalent to) fmap (+1) (Just 5).
       - [(+1), (*2)] <*> [1,2,3] (applies each function to each element.)
-}
example4 = do
    putStrLn "--->>> Applicative Functor: Applying Wrapped Functions to Wrapped Values"
    --  INFO: An Applicative extends a Functor by allowing functions inside a context to be applied to values inside a context.
    --    Key Idea: <*> allows you to apply functions inside a context, unlike Functor, which only applies normal functions.
    print $ Just (+ 3) <*> Just 4 -- Result: Just 7
    print $ [(* 2), (+ 3)] <*> [1, 2, 3] -- Result: [2,4,6,4,5,6]
    --
    print $ pure (+ 1) <*> Just 5 -- Result: Just 6
    print $ pure (* 2) <*> [1, 2, 3] -- Result: [2,4,6]
    print $ [(+ 1), (* 2)] <*> [1, 2, 3] -- Result: [2,3,4,2,4,6]

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- 5. MONAD: Chaining Computations with Context
{-
    A Monad allows chaining computations with >>= (bind).

    Laws
       1. Left identity: return a >>= f = f a
       2. Right identity: m >>= return = m
       3. Associativity: (m >>= f) >>= g = m >>= (\x -> f x >>= g)

    Explanation examples:
       1. The >>= operator unwraps the context and applies the function.
       2. [1,2,3] >>= \x -> [x, x+10] generates all possible values.
-}
example5 = do
    putStrLn "--->>> Monad: Chaining Computations with Context"
    --  INFO: A Monad allows computations where the result of one operation affects the next.
    --   Key Idea: >>= (bind) extracts a value from a monadic context and passes it to the next function.
    print $ Just 3 >>= (\x -> Just (x + 1)) -- Result: Just 4
    --
    print $ Nothing >>= (\x -> Just (x + 1)) -- Result: Nothing
    --
    print $ [1, 2, 3] >>= \x -> [x, x + 10] -- Result: [1,11,2,12,3,13]
    {-
     Step-by-Step Breakdown
        1. The list [1, 2, 3] is processed element by element.
        2. The function \x -> [x, x + 10] is applied to each element:
            - When x = 1: [1, 11]
            - When x = 2: [2, 12]
            - When x = 3: [3, 13]
        3. Since >>= for lists concatenates the results, we get: [1, 11, 2, 12, 3, 13]
    -}
    --
    -- Equivalent Using "concatMap":
    print $ concatMap (\x -> [x, x + 10]) [1, 2, 3]

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- 6. FOLDABLE: reduces a structure to a single value.
{-
    Explanation:
       1. foldr starts from the right (1 + (2 + 3)).
       2. foldl starts from the left (((1 * 2) * 3) * 4).
-}

example6 = do
    putStrLn "--->>> Foldable: "
    print $ foldr (+) 0 [1, 2, 3] -- Result: 6
    print $ foldl (*) 1 [1, 2, 3, 4] -- Result: 24
    print $ foldr (&&) True [True, False, True] -- Result: False

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- 7. TRAVERSABLE: allows mapping a function while keeping structure.
{-
    A Traversable applies an effectful function and collects results.
-}

example7 = do
    putStrLn "--->>> Traversable: "
    traverse print [1, 2, 3] -- traverse print [1,2,3] prints each element sequentially, and returns IO [()]

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- 8. ALTERNATIVE: Choosing Between Computations
{-
    An Alternative provides failure and choice for "Applicative".
-}

example8 = do
    putStrLn "--->>> Alternative: Choosing Between Computations:"
    -- INFO: Extends Applicative with failure handling (empty) and choice (<|>).
    --   Use when: You want to handle alternatives, like parsing or optional computations.
    print $ Just 1 <|> Just 2 -- Alternative: Picks the first Just value, result: Just 1
    print $ Nothing <|> Just 2 -- Result: Just 2

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- 9. MONAD PLUS
{-
    A MonadPlus provides "mzero" and "mplus" for monads.

    Explanation examples:
        - guard (5 > 3) allows continuation.
        - guard (3 > 5) short-circuits.
-}

example9 = do
    putStrLn "--->>> MonadPlus:"
    print $ guard (5 > 3) >> Just "Yes" -- Result: Just "Yes"
    print $ guard (3 > 5) >> Just "Yes" -- Result: Nothing

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- 10. ARROW
{-
    An "Arrow" is a generalization of functions.

    Explanation:
        - arr (*2) >>> arr (+1): composes two functions.
-}

doubleAndIncrement = arr (* 2) >>> arr (+ 1) -- (arr * 2) + (arr + 1)

example10 = do
    putStrLn "--->>> Arrow:"
    print $ doubleAndIncrement 3 -- Result: 7

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- 11. COMONAD
{-
    A "Comonad" extracts values before computation.

    Explanation example:
        - extract retrieves the value.
-}
-- need install: import Control.Comonad
example11 = do
    putStrLn "--->>> Comonad:"
    -- print $ extract (Identity 3) -- Result: 3
    putStrLn "need cabal project to install package"

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
    putStrLn "\n>>>>>--------------EXAMPLE11--------------<<<<<"
    example11
