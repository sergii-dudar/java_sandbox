import Data.Monoid

{-
    INFO: Advanced Example: Using Product in a Monoid-Based Computation

    Since "Product" is a monoid, it can be leveraged in more complex computations, such as:
        - Computing the product of values in a data structure (e.g., trees, records).
        - Combining multiple monoids using tuples.
        - Parallel computations using monoidal folding.

    INFO: Summary:

        -----------------------------------------------------------------------------------------
        | Use Case                                    | Approach                                |
        |---------------------------------------------------------------------------------------|
        |---------------------------------------------------------------------------------------|
        | Computing the product of a tree's values    | Use "Foldable" + "foldMap Product"      |
        |---------------------------------------------|-----------------------------------------|
        | Computing sum and product together          | Use "(Sum, Product)" tuple in "foldMap" |
        |---------------------------------------------|-----------------------------------------|
        | Parallel computation of a product           | Use "parList rdeepseq" with "Product"   |
        -----------------------------------------------------------------------------------------
-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 1. Using "Product" in a Custom Data Structure
{-
    Suppose we have a "Tree" data structure, and we want to compute the product of all its values.

    Implementation explanation:
        - We define "Foldable" for "Tree", so "foldMap" applies a function to each element.
        - "Product" is used as the monoidal wrapper to perform multiplication.
        - "getProduct . foldMap Product" efficiently computes the product.
-}

-- Define a binary tree structure
data Tree a
    = Empty
    | Node a (Tree a) (Tree a)
    deriving (Show)

-- Example tree:
--       3
--      / \
--     4   5
exampleTree :: Tree Int
exampleTree = Node 3 (Node 4 Empty Empty) (Node 5 Empty Empty)

-- "Computing the Product" Using "Product" and "foldMap"
--  We can define "foldMap" for our tree to compute the product efficiently:

-- Foldable instance for Tree
instance Foldable Tree where
    foldMap f Empty = mempty
    foldMap f (Node x l r) = f x <> foldMap f l <> foldMap f r

-- Compute the product of all nodes in the tree
treeProduct :: Tree Int -> Int
treeProduct = getProduct . foldMap Product

example1 = do
    putStrLn "--->>> 1. Using Product in a Custom Data Structure:"
    print $ treeProduct exampleTree -- Output: 60

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 2. Using "Product" in a Tuple with Another Monoid
{-
    Monoids can be combined in tuples, which is useful for computing multiple things at once.

    Example: Sum and Product Together
-}

example2 = do
    putStrLn "--->>> 2. Using Product in a Tuple with Another Monoid:"
    let numbers = [3, 4, 5]
    let (sumResult, productResult) = foldMap (\x -> (Sum x, Product x)) numbers
    print (sumResult, productResult)
    print $ getSum sumResult -- Output: 12
    print $ getProduct productResult -- Output: 60

{-
    Explanation
        - We use "foldMap" to map each number into a tuple "(Sum x, Product x)".
        - The "Sum" monoid accumulates the sum, and "Product" accumulates the product.
        - This allows us to compute both sum and product in a single pass.
-}

main = do
    putStrLn ">>>>>--------------EXAMPLE1--------------<<<<<"
    example1
    putStrLn "\n>>>>>--------------EXAMPLE2--------------<<<<<"
    example2
