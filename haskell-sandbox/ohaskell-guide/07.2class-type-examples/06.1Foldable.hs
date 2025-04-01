import Data.Monoid

{-
    The Foldable type class represents "data structures" that can be collapsed into
        a single summary value using a folding function.

        Definition:
        -------------------------------------------------
        class Foldable t where
            foldr :: (a -> b -> b) -> b -> t a -> b
            foldl :: (b -> a -> b) -> b -> t a -> b
            foldMap :: Monoid m => (a -> m) -> t a -> m
        -------------------------------------------------
        "foldr" (right fold): Processes elements from right to left.
        "foldl" (left fold): Processes elements from left to right.
        "foldMap": Maps elements to a monoid before folding.

    INFO: Why Use Foldable?

        - Provides a generic way to collapse structures.
        - Works with lists, trees, Maybe, and more.
        - Uses monoids to define powerful reductions.

-}

----------------------------------------------------------------------------
----------------- Examples of Foldable Instances ---------------------------
----------------------------------------------------------------------------
-- INFO: 1. Folding a List
{-

-}

example1 = do
    putStrLn "--->>> 1. Folding a List:"
    print $ foldr (+) 0 [1, 2, 3, 4] -- Result: 10
    print $ foldl (+) 0 [1, 2, 3, 4] -- Result: 10

{-
    📌 Explanation:
        foldr (+) 0 [1,2,3,4] → 1 + (2 + (3 + (4 + 0)))
        foldl (+) 0 [1,2,3,4] → (((0 + 1) + 2) + 3) + 4
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 2. Using foldMap

example2 = do
    putStrLn "--->>> 2. Using foldMap:"
    print $ foldMap Sum [1, 2, 3] -- Result: Sum 6
    print $ foldMap Product [1, 2, 3, 4] -- Result: Product 24

{-
    📌 Explanation:
        Converts elements into monoids before folding.
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 3. Folding Maybe

example3 = do
    putStrLn "--->>> 3. Folding Maybe:"
    print $ foldr (+) 10 (Just 5) -- Result: 15
    print $ foldMap Sum (Just 3) -- Result: Sum 3
    print $ foldMap Sum Nothing -- Result: Sum 0

{-
    📌 Explanation:
        - "Just 5" acts like a single-element list.
        - "Nothing" behaves like an empty structure.
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 4. Folding a Tree (Custom Foldable Instance)

data Tree a = Leaf | Node a (Tree a) (Tree a) deriving (Show)

instance Foldable Tree where
    foldr f z Leaf = z
    foldr f z (Node x left right) = foldr f (f x (foldr f z right)) left

example4 = do
    putStrLn "--->>> 4. Folding a Tree (Custom Foldable Instance):"
    let t = Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf)
    print $ foldr (+) 0 t -- Result: 6

{-
    📌 Explanation:
        - Traverses the tree in order, folding values.

    - foldr (+) 0 t will traverse the tree and sum up all its values:
       - Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf)
       - foldr (+) 0 (Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf))
       - Expands to: foldr (+) (1 + foldr (+) 0 (Node 3 Leaf Leaf)) (Node 2 Leaf Leaf)
       - Further expands: foldr (+) (1 + (foldr (+) 0 Leaf) + 3) (Node 2 Leaf Leaf)
       - Evaluates to: 2 + (1 + 3) = 6
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
