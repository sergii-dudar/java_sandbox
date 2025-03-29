import Data.Monoid

{-
    What is a Monoid?
        A Monoid is a mathematical concept that consists of:
           1. A `set` of values.
           2. A `binary operation` (mappend) that combines two values of this set.
           3. An `identity element` (mempty) that, when combined with any value, returns that value.

    -----------------------

    How to Use Monoid in Haskell
    - The `Monoid` class is defined in `Data.Monoid`, and instances must define:
        - `mempty` (the identity element)
        - `mappend` (a binary operation)

    `mconcat` is provided by default using `foldr`.
-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- list

{-
    instance Monoid [a] where
        mempty = []
        mappend = (++)
-}

example1 = do
    putStrLn "--->>> list:"
    print $ "Hello, " `mappend` "World!"

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- numbers

{-
    instance Num a => Monoid (Sum a) where
        mempty = Sum 0
        mappend (Sum x) (Sum y) = Sum (x + y)
-}

newtype Product = Product Int

example2 = do
    putStrLn "--->>> numbers:"
    print $ Sum 3 `mappend` Sum 4

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- boolean

example3 = do
    putStrLn "--->>> Boolean:"
    print $ Any True `mappend` Any False -- Any True
    print $ All True `mappend` All False -- All False

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- maybe

example4 = do
    putStrLn "--->>> maybe:"
    print $ Just (Sum 3) `mappend` Just (Sum 5) -- Just (Sum 8)

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Custom Monoid Example

newtype MaxInt = MaxInt {getMax :: Int}
    deriving (Show)

instance Semigroup MaxInt where
    MaxInt x <> MaxInt y = MaxInt (max x y)

instance Monoid MaxInt where
    mempty = MaxInt minBound

example5 :: IO ()
example5 = do
    putStrLn "--->>> custom:"
    print $ MaxInt 10 <> MaxInt 20 -- MaxInt 20
    print $ MaxInt 5 <> MaxInt 3 <> MaxInt 8 -- MaxInt 8

{-
    `Semigroup` defines (<>), which is used for combining two `MaxInt` values.
    `Monoid` requires mempty, which is the identity element (MaxInt minBound).
    `mappend` is no longer needed since (<>) from `Semigroup` replaces it.
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
