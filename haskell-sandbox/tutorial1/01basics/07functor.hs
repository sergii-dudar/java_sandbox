import Control.Applicative

-- https://www.tutorialspoint.com/haskell/haskell_functor.htm

example1 = do
    putStrLn "--->>> Functor: "
    print (fmap (subtract 1) [2, 4, 8, 16])
    print (map (subtract 1) [2, 4, 8, 16])

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example2 = do
    putStrLn "--->>> :"
    print (fmap (+ 7) (Just 10))
    print (fmap (+ 7) Nothing)

----------------------------------------------------------------------------
----------------------------------------------------------------------------

class (Functor f) => Applicative f where
    pure :: a -> f a
    (<*>) :: f (a -> b) -> f a -> f b

f1 :: Int -> Int -> Int
f1 x y = 2 * x + y

example3 = do
    putStrLn "--->>> Applicative Functor: "

-- print (show $ f1 <$> (Just 1) <*> (Just 2))

----------------------------------------------------------------------------
----------------------------------------------------------------------------

-- class Monoid m where
--     mempty :: m
--     mappend :: m -> m -> m
--     mconcat :: [m] -> m
--     mconcat = foldr mappend mempty

multi :: Int -> Int
multi x = x * 1
add :: Int -> Int
add x = x + 0
example4 = do
    putStrLn "--->>> Monoids: "
    print (multi 9)
    print (add 7)

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example5 = do
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
    putStrLn "\n>>>>>--------------EXAMPLE5--------------<<<<<"
    example5