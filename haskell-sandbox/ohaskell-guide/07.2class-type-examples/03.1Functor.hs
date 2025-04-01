{-
    A "Functor" is a type class that represents "mappable" structures. It allows you to apply a function
    inside a "container" (or "context") without modifying the structure itself.

    Definition:
        -------------------------------------
        class Functor f where
            fmap :: (a -> b) -> f a -> f b
        -------------------------------------

    "fmap" applies a function (a -> b) to a value inside "f a", producing "f b".
    "f" represents a type constructor (e.g., Maybe, List, Either).

    INFO: Functor Laws

        1. Identity: fmap id x = x
                (Applying id does nothing.)
        2. Composition: fmap (f . g) = fmap f . fmap g
                (Mapping f . g is the same as mapping g and then f.)

    These laws ensure consistent and predictable behavior.

    INFO: Summary:

        1. Functors allow mapping functions inside a structure (fmap).
        2. Common Functor instances: Maybe, List, Either, Functions.
        3. Laws ensure predictability: Identity and Composition.
        4. Functions themselves are Functors: (->) r.

    💡 A Functor is anything that can be mapped over while preserving structure! 🚀
-}

----------------------------------------------------------------------------
----------------- Examples of Functor Instances ----------------------------
----------------------------------------------------------------------------
-- INFO:1. Functor for Maybe
{-

-}

example1 = do
    putStrLn "--->>> 1. Functor for Maybe:"
    print $ fmap (+ 1) (Just 5) -- Result: Just 6
    print $ fmap (* 2) Nothing -- Result: Nothing

{-
    📌 Explanation:
        - fmap (+1) (Just 5) applies +1 inside Just.
        - Nothing remains Nothing (structure is preserved).
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 2. Functor for Lists
{-
    Lists are "functors", so "fmap" applies a function to every element.
-}

example2 = do
    putStrLn "--->>> 2. Functor for Lists:"
    print $ fmap (* 2) [1, 2, 3] -- Result: [2,4,6]

{-
📌 Explanation:
    - Each element gets multiplied by 2.
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 3. Functor for Either
{-

-}

example3 = do
    putStrLn "--->>> 3. Functor for Either:"
    print $ fmap (++ "!") (Right "Hello" :: Either String String) -- Result: Right "Hello!"
    print $ fmap (* 2) (Left "Error") -- Result: Left "Error"

{-
    📌 Explanation:
       - fmap only applies when Right, leaving Left unchanged.
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 4. Functor for Functions ((->) r)
{-
    NOTE: Functions themselves are Functors!
-}

example4 = do
    putStrLn "--->>> 4. Functor for Functions ((->) r):"
    print $ fmap (+ 1) (* 2) 3 -- Equivalent to: \(x -> (x * 2) + 1) 3 : Result is 7
    -- is equvalent of:
    print $ (+ 1) . (* 2) $ 3 -- Equivalent to: \(x -> (x * 2) + 1) 3 : Result is 7

{-
    📌 Explanation:
        - If "fmap f g", it becomes "f . g".
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 7. Custom Functor Instance
{-
    Let's define a custom "Functor" for a "Box" type:
-}

newtype Box a = Box a deriving (Show)

instance Functor Box where
    fmap f (Box x) = Box (f x)

example5 = do
    putStrLn "--->>> 7. Custom Functor Instance:"
    print $ fmap (* 2) (Box 10) -- Result: Box 20

{-
    📌 Explanation:
        - "fmap (*2) (Box 10)" applies "*2" inside "Box".
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 8. Using Functors in Composition
{-

-}

example6 = do
    putStrLn "--->>> 8. Using Functors in Composition:"
    -- Instead of:
    print $ fmap (* 2) (fmap (+ 1) [1, 2, 3]) -- Result: [4,6,8]
    -- We can compose:
    print $ fmap ((* 2) . (+ 1)) [1, 2, 3] -- Result: [4,6,8]

{-
📌 Explanation:
    - "(+1)" then "(*2)" in one pass.
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
