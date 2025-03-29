prefix :: String -> String
prefix str = "--->>> :" ++ str

{-
    The rest two methods of Applicable Functors:

    (*>) :: f a -> f b -> f b
    (<*) :: f a -> f b -> f a

    Both this operators using to ignore one or another value from input:

    (*>) :: f a -> f b -> f b
            ---    ===    ===
           ignore
           first

    (<*) :: f a -> f b -> f a
            ===    ---    ===
                  ignore
                  second

-}

newtype Distance value = Distance value
    deriving (Show)

instance Functor Distance where
    fmap :: (a -> b) -> Distance a -> Distance b
    fmap f (Distance value) = Distance (f value)

instance Applicative Distance where
    (<*>) :: Distance (a -> b) -> Distance a -> Distance b
    (<*>) (Distance f) = fmap f

    pure :: a -> Distance a
    pure = Distance

    (*>) :: Distance a -> Distance b -> Distance b
    (*>) (Distance a) (Distance b) = Distance b

    (<*) :: Distance a -> Distance b -> Distance a
    (<*) (Distance a) (Distance b) = Distance a

-- quite simple, they both just to interrupt processing flow (for example, if no something to return)
-- it's quite often using in working with IO chains functions (often by compiler under the hood)...
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- example of using:

totalSum :: (Num v) => v -> v -> v -> v
totalSum a b c = a + b + c

example1 =
    putStrLn . prefix . show $
        pure totalSum
            <*> Distance 19.78
            <*> Distance 1.6
            <*> Distance 289.0
            -- \*> Distance 2.0 -- result: Distance 2.0
            <* Distance 2.0 -- result: Distance 310.38 (sum (left arg))

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example2 = do
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example3 = do
    putStrLn "--->>> :"

main = do
    putStrLn ">>>>>--------------EXAMPLE1--------------<<<<<"
    example1
    putStrLn "\n>>>>>--------------EXAMPLE2--------------<<<<<"
    example2
    putStrLn "\n>>>>>--------------EXAMPLE3--------------<<<<<"
    example3
