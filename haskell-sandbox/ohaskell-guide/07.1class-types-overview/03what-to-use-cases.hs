import Control.Applicative
import Control.Arrow
import Control.Monad
import Data.Foldable
import Data.Monoid
import Data.Semigroup
import Data.Traversable

-- import Control.Comonad
{-
            NOTE: HASKELL TYPE CLASSES COMPARISON

    ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    | N# | Type Class   | Purpose                                                   | Represents                                                    | When to Use                                                   | When to Avoid                                     | Alternative        |
    |----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
    |----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
    | 1. | Semigroup    | Defines an associative binary operation                   | Types that can be combined                                    | When you need to merge values                                 | If there's no sensible way to combine values      | N/A                |
    |----|--------------|-----------------------------------------------------------|---------------------------------------------------------------|---------------------------------------------------------------|---------------------------------------------------|--------------------|
    | 2. | Monoid       | Extends "Semigroup" with an identity element              | Types that can be combined with an identity                   | When you need a default value for combination                 | If an identity element doesn't exist              | Semigroup          |
    |----|--------------|-----------------------------------------------------------|---------------------------------------------------------------|---------------------------------------------------------------|---------------------------------------------------|--------------------|
    | 3. | Functor      | Allows mapping over a structure                           | A container that can apply a function to its elements         | When you want to transform values inside a structure          | If transformation needs context-dependent logic   | N/A                |
    |----|--------------|-----------------------------------------------------------|---------------------------------------------------------------|---------------------------------------------------------------|---------------------------------------------------|--------------------|
    | 4. | Applicative  | Allows function application within a context              | A "Functor" that supports function lifting                    | When you need to apply functions inside a context             | If effects must depend on previous computations   | Monad              |
    |----|--------------|-----------------------------------------------------------|---------------------------------------------------------------|---------------------------------------------------------------|---------------------------------------------------|--------------------|
    | 5. | Monad        | Allows sequencing of computations with effects            | A "Functor" where computations depend on previous results     | When computations need to be chained with context             | If independent effects suffice                    | Applicative        |
    |----|--------------|-----------------------------------------------------------|---------------------------------------------------------------|---------------------------------------------------------------|---------------------------------------------------|--------------------|
    | 6. | Foldable     | Provides a way to reduce structures to a single value     | Types that can be traversed and reduced                       | When you need to summarize a structure (e.g., sum, length)    | If transformation (not reduction) is needed       | Traversable        |
    |----|--------------|-----------------------------------------------------------|---------------------------------------------------------------|---------------------------------------------------------------|---------------------------------------------------|--------------------|
    | 7. | Traversable  | Allows traversing a structure while applying effects      | A "Foldable" that maps over elements and accumulates effects  | When you need to traverse and apply effects                   | If only reduction is needed                       | Foldable           |
    |----|--------------|-----------------------------------------------------------|---------------------------------------------------------------|---------------------------------------------------------------|---------------------------------------------------|--------------------|
    | 8. | Alternative  | Provides an associative binary choice operation           | A "Functor" that allows choosing between computations         | When you need failure handling with alternatives              | If you don't need failure recovery                | MonadPlus          |
    |----|--------------|-----------------------------------------------------------|---------------------------------------------------------------|---------------------------------------------------------------|---------------------------------------------------|--------------------|
    | 9. | MonadPlus    | A "Monad" with a zero value and choice operation          | A "Monad" that supports failure and choice                    | When working with "Monad"-based computations that may fail    | If you're only dealing with alternatives          | Alternative        |
    |----|--------------|-----------------------------------------------------------|---------------------------------------------------------------|---------------------------------------------------------------|---------------------------------------------------|--------------------|
    | 10.| Arrow        | Generalizes function composition                          | Computation with multiple inputs and outputs                  | When modeling computations that aren't just monads            | If monadic sequencing is sufficient               | Monad              |
    |----|--------------|-----------------------------------------------------------|---------------------------------------------------------------|---------------------------------------------------------------|---------------------------------------------------|--------------------|
    | 11.| Comonad      | The dual of Monad, extracts values from a context         | A context where you can extract a value                       | When dealing with values embedded in a context                | If sequencing computations is needed              | Monad              |
    ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

            INFO: WHEN TO USE EACH TYPE CLASS:

        1. Use "Semigroup" when you have a way to combine two values meaningfully but don't need an identity element.
        2. Use "Monoid" if an identity element exists for the combination (e.g., numbers with "0" for addition).
        3. Use "Functor" if you need to apply a function to elements inside a structure ("Maybe", "List", etc.).
        4. Use "Applicative" if you have functions inside a structure and want to apply them (Just (+1) <*> Just 2).
        5. Use "Monad" if you need to chain computations where the next step depends on the previous one ("Maybe" chaining).
        6. Use "Foldable" if you need to reduce a structure into a single value (sum, length).
        7. Use "Traversable" if you need to traverse a structure while applying an effect (sequenceA, traverse).
        8. Use "Alternative" if you want to handle failure and provide alternatives (empty, <|>).
        9. Use "MonadPlus" if you're already in a "Monad" and want additional choice behavior.
       10. Use "Arrow" when dealing with computations that go beyond monads (e.g., function composition, stream processing).
       11. Use "Comonad" if you need to extract values from a context (opposite of "Monad").

            INFO: HOW TO CHOOSE THE RIGHT TYPE CLASS

            1. Do you need to combine values?
                - Yes → Use "Semigroup" (if no identity) or "Monoid" (if identity exists).
            2. Are you transforming a structure?
                - Yes → Use "Functor".
            3. Are functions inside the structure?
                - Yes → Use "Applicative".
            4. Does the next computation depend on the previous one?
                - Yes → Use "Monad".
            5. Do you need to reduce a structure?
                - Yes → Use "Foldable".
            6. Do you need to traverse while applying effects?
                - Yes → Use "Traversable".
            7. Do you need an alternative for failure?
                - Yes → Use "Alternative" or "MonadPlus".
            8. Are you composing functions differently?
                - Yes → Use "Arrow".
            9. Do you need to extract values from a context?
                - Yes → Use "Comonad".

-}
----------------------------------------------------------------------------
-------------------- Examples and Better Choices ---------------------------
----------------------------------------------------------------------------
-- NOTE: 1. Semigroup vs. Monoid
{-
    When to use?
        - Use "Semigroup" when combining makes sense but no identity exists.
        - Use "Monoid" if an identity element is needed.

    import Data.Semigroup
    import Data.Monoid
-}

newtype SumInt = SumInt Int deriving (Show, Eq)

-- Semigroup: Combining without identity
instance Semigroup SumInt where
    SumInt x <> SumInt y = SumInt (x + y)

-- Monoid: Adds identity (0 in this case)
instance Monoid SumInt where
    mempty = SumInt 0

example1 = do
    putStrLn "--->>> 1. Semigroup vs. Monoid:"
    print $ SumInt 3 <> SumInt 5 -- SumInt 8
    print $ mempty <> SumInt 5 -- SumInt 5

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- NOTE: 2. Functor vs. Applicative vs. Monad
{-
    When to use?
       - "Functor" for simple transformations (fmap or <$>).
       - "Applicative" when independent computations need combining.
       - "Monad" when the next computation depends on the previous result.

    import Control.Applicative
-}

example2 = do
    putStrLn "--->>> 2. Functor vs. Applicative vs. Monad:"
    -- Functor: Transforming within a structure
    print $ fmap (+ 1) (Just 5) -- Just 6
    print $ (+ 1) <$> Just 5 -- Just 6
    --
    -- Applicative: Applying functions inside a structure
    print $ pure (+ 1) <*> Just 5 -- Just 6
    --
    -- Monad: Chaining dependent computations
    print $ Just 5 >>= \x -> Just (x + 1) -- Just 6

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- NOTE: 3. Foldable vs. Traversable
{-
    When to use?
        - "Foldable" when reducing a structure (sum, length, etc).
        - "Traversable" when applying an effect while traversing.

    import Data.Foldable
    import Data.Traversable
-}

example3 = do
    putStrLn "--->>> 3. Foldable vs. Traversable:"
    -- Foldable: Summing a list
    print $ foldr (+) 0 [1, 2, 3] -- 6 (0 + 1 + 2 + 3)
    print $ foldr (+) 2 [1, 2, 3] -- 8 (2 + 1 + 2 + 3)
    --
    -- Traversable: Applying an effect
    traverse print [1, 2, 3] -- Output: 1\n 2\n 3\n

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- NOTE: 4. Alternative vs. MonadPlus
{-
    When to use?
        "Alternative" for failure handling.
        "MonadPlus" when inside a "Monad".

    import Control.Applicative
    import Control.Monad
-}

example4 = do
    putStrLn "--->>> 4. Alternative vs. MonadPlus:"
    -- Alternative: Provides choice
    print $ Nothing <|> Just 5 -- Just 5
    --
    -- MonadPlus: For monads
    print $ mzero `mplus` Just 5 -- Just 5
    print $ Just 2 `mplus` Just 5 -- Just 2

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- NOTE: 5. Arrow vs. Monad
{-
    When to use?
       1. Arrow when working with functions that process multiple inputs/outputs.
       2. Monad for sequential computations.

    import Control.Arrow
-}

example5 = do
    putStrLn "--->>> 5. Arrow vs. Monad:"
    -- Arrows: Processing tuples
    print $ first (+ 1) (3, "Hello") -- (4, "Hello")
    print $ second (+ 1) ("Hello", 3) -- ("Hello", 3)
    --
    -- Monad: Sequential computation
    print $ Just 3 >>= \x -> Just (x + 1) -- Just 4
    print $ (\x -> Just (x + 1)) =<< Just 3 -- Just 4

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- NOTE: 6. Comonad vs. Monad
{-
    When to use?
        Monad when sequencing computations.
        Comonad when extracting values from a context.

    import Control.Comonad
-}

example6 = do
    putStrLn "--->>> 6. Comonad vs. Monad:"

-- -- Comonad: Extracting values
-- extend (\w -> extract w + 1) (Just 5) -- Just 6

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
