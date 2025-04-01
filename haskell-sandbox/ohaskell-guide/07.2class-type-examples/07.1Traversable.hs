{-
    The "Traversable" type class represents data structures that can be "mapped over" while collecting effects
        inside an "Applicative".

    Definition:
        -------------------------------------------------------
        class (Functor t, Foldable t) => Traversable t where
            traverse  :: Applicative f => (a -> f b) -> t a -> f (t b)
            sequenceA :: Applicative f => t (f a) -> f (t a)
        -------------------------------------------------------
        - "traverse" applies a function inside an "Applicative context" and reconstructs the structure.
        - "sequenceA" flips the structure: a container of effects (t (f a)) becomes an effect containing a container (f (t a)).

        INFO: Traversable vs. Foldable vs. Functor

      -----------------------------------------------------------------------
      | Feature                 | Functor   | Foldable  | Traversable       |
      |---------------------------------------------------------------------|
      |---------------------------------------------------------------------|
      | Maps over structure     | ✅ fmap   | ❌        | ✅ traverse       |
      |-------------------------|-----------|-----------|-------------------|
      | Reduces to single value | ❌        | ✅ foldr  | ✅ (via foldMap)  |
      |-------------------------|-----------|-----------|-------------------|
      | Works with Applicative  | ❌        | ❌        | ✅                |
      |-------------------------|-----------|-----------|-------------------|
      | Preserves structure     | ✅        | ❌        | ✅                |
      -----------------------------------------------------------------------

        INFO: Why Use Traversable?

       - Combines mapping and folding.
       - Works with effects (Maybe, IO, Either).
       - Preserves structure while applying an Applicative.

    💡 Traversable helps structure-dependent effectful computations! 🚀

-}

----------------------------------------------------------------------------
-------------- Examples of Traversable Instances ---------------------------
----------------------------------------------------------------------------
-- INFO: 1. Traversing a List

example1 = do
    putStrLn "--->>> 1. Traversing a List:"
    print $ traverse Just [1, 2, 3] -- Result: Just [1,2,3]
    print $ traverse (\x -> if x > 0 then Just x else Nothing) [1, -2, 3] -- Result: Nothing (because -2 fails)

{-
    📌 Explanation:
    - traverse Just [1,2,3] → wraps each element in Just, keeping the list.
    - If any element maps to Nothing, the whole result is Nothing.
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 2. Traversing a Maybe

safeDiv :: Int -> Int -> Maybe Int
safeDiv _ 0 = Nothing
safeDiv x y = Just (x `div` y)

example2 = do
    putStrLn "--->>> 2. Traversing a Maybe:"
    print $ traverse Just (Just 5) -- Result: Just (Just 5)
    print $ traverse Just (Nothing :: Maybe Int) -- Result: Just Nothing
    print $ traverse (\x -> [x, x + 1]) (Just 3) -- [Just 3,Just 4]
    print $ traverse (\x -> [x, x + 1]) Nothing -- [Nothing]
    --
    print $ traverse (safeDiv 10) [2, 5, 0, 1] -- Result: Nothing (because of division by zero)
    print $ traverse (safeDiv 10) [2, 5, 1] -- Result: Just [5, 2, 10]

{-
    📌 Explanation:
        1. Works like mapping over Maybe.
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 3. Using sequenceA
{-

-}

example3 = do
    putStrLn "--->>> 3. Using sequenceA:"
    print $ sequenceA [Just 1, Nothing, Just 3] -- Result: Nothing
    print $ sequenceA [Just 1, Just 2, Just 3] -- Result: Just [1,2,3]

{-
    📌 Explanation:
       - Collects all Just values into a single Just [1,2,3].
       - If any element is Nothing, result is Nothing.
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 4. Traversing a Binary Tree

data Tree a = Leaf | Node a (Tree a) (Tree a) deriving (Show)

instance Functor Tree where
    fmap f Leaf = Leaf
    fmap f (Node x l r) = Node (f x) (fmap f l) (fmap f r)

instance Foldable Tree where
    foldr f z Leaf = z
    foldr f z (Node x l r) = foldr f (f x (foldr f z r)) l

instance Traversable Tree where
    traverse f Leaf = pure Leaf
    traverse f (Node x l r) = Node <$> f x <*> traverse f l <*> traverse f r

example4 = do
    putStrLn "--->>> 4. Traversing a Binary Tree:"
    print $ traverse Just (Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf)) -- Result: Just (Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf))

{-
    📌 Explanation:
        - Maps Just over the tree while keeping its shape.
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
