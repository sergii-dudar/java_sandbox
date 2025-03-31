import Data.Monoid

{-
    1. Product Type Class: it's "Monoid" instance for a type called "Product a".
        This is a wrapper that allows numbers to be combined multiplicatively.

    2. The "product" Function: Haskell provides a function called "product" that calculates the product of a list of numbers.

    INFO: Comparison of "Product" and "product"

    -------------------------------------------------------------------------------------------------------------------------
    | Feature       | Product a (Monoid)                                        | product (Function)                        |
    |-----------------------------------------------------------------------------------------------------------------------|
    |-----------------------------------------------------------------------------------------------------------------------|
    | Type          | newtype Product a                                         | Function [a] -> a                         |
    |---------------|-----------------------------------------------------------|-------------------------------------------|
    | Identity      | Product 1                                                 | product [] = 1                            |
    |---------------|-----------------------------------------------------------|-------------------------------------------|
    | Combination   | Product x <> Product y = Product (x * y)                  | product (x:xs) = x * product xs           |
    |---------------|-----------------------------------------------------------|-------------------------------------------|
    | Usage         | Used in Monoid-based computations (e.g., foldMap Product) | Directly multiplies elements of a list    |
    -------------------------------------------------------------------------------------------------------------------------

    - "Product a" is a monoid wrapper that enables multiplication as a monoidal operation.
    - The "product" function calculates the product of a list.
    - "Product" is useful in functional programming patterns like "foldMap".
-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 1. Product Type in Haskell
{-
    The "Product" type is defined in the "Data.Monoid" module. It is a newtype wrapper around a numeric value that
    provides a "Monoid" instance with multiplication as the binary operation.

    newtype Product a = Product { getProduct :: a }
        deriving (Eq, Ord, Show, Read)

    INFO: Monoid Instance for Product

    A "Monoid" is a type class that requires:
        - An identity element (mempty).
        - A binary operation (mappend or <>).

    For "Product a", these are:
        - mempty = Product 1 (Multiplicative identity).
        - mappend (Product x) (Product y) = Product (x * y).
-}

example1 = do
    putStrLn "--->>> 1. Product Type in Haskell:"
    let a = Product 3
    let b = Product 4
    let c = Product 5
    print $ getProduct (a <> b <> c) -- Output: 60
    print $ getProduct mempty -- Output: 1
    ----
    putStrLn ">>> Example: Using Product with foldMap:"
    -- Since Product is a monoid, we can use it with foldMap to compute the product of a list:
    print $ getProduct $ foldMap Product [3, 4, 5] -- Output: 60
    -- This is an alternative way to compute the product of a list using Monoid properties instead of recursion.

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 2. The product Function
{-
    The product function is a built-in function in Haskell that computes the product of a list of numbers.

    product :: (Num a) => [a] -> a

-}

example2 = do
    putStrLn "--->>> 2. The product Function:"
    print $ product [3, 4, 5] -- Output: 60
    print $ product [] -- Output: 1

{-
    INFO: How it Works Internally:

    The product function is equivalent to:
        ----------------------------
        product []     = 1
        product (x:xs) = x * product xs
        ----------------------------
    This recursively multiplies all elements in the list, returning 1 for an empty list.
-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example3 = do
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example4 = do
    putStrLn "--->>> :"

main = do
    putStrLn ">>>>>--------------EXAMPLE1--------------<<<<<"
    example1
    putStrLn "\n>>>>>--------------EXAMPLE2--------------<<<<<"
    example2
    putStrLn "\n>>>>>--------------EXAMPLE3--------------<<<<<"
    example3
    putStrLn "\n>>>>>--------------EXAMPLE4--------------<<<<<"
    example4
