prefix :: String -> String
prefix str = "--->>> :" ++ str

-- NOTE: all standsrd MONADS (LIST, IO, Maybe etc), is APPLICABLE FUNCTORS also!

{-
    class Functor f => Applicative f where
        pure :: a -> f a
        (<*>) :: f (a -> b) -> f a -> f b   -- our main hero!
        (*>) :: f a -> f b -> f b
        (<*) :: f a -> f b -> f a
-}
{-
    Functor:             we can use some function to `ONE`  value of type `X` (Functor type)
    Applicative Functor: we can use some function to `MANY` value of type `X` (Applicative Functor type)
-}
{-
    To became some type to be `Applicative Functor`, type should be first regular `Functor`.

    The central method here is: (<*>) - (sequential application):

    there close comparison:
        (<*>) :: f (a -> b) -> f a -> f b - working with two functors
         fmap ::   (a -> b) -> f a -> f b - working with functor

-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Usage example (Not flexible way):

newtype Distance value = Distance value
    deriving (Show)

-- add :: Distance Double -> Distance Double -> Distance Double
add :: (Num value) => Distance value -> Distance value -> Distance value
add (Distance a) (Distance b) = Distance (a + b)

minus :: (Num value) => Distance value -> Distance value -> Distance value
minus (Distance a) (Distance b) = Distance (a - b)

example1 = do
    putStrLn . prefix $ "add: " ++ show (Distance 19.78 `add` Distance 1.6)
    putStrLn . prefix $ "minus: " ++ show (Distance 19.78 `minus` Distance 1.6)

{-
    This approatch have main disadvantage: not flexibility!
        Every new needed operation, we need write ourselve!

    Applicative Function specifically to avoid similar approatch!
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Usega example ( better way, applicative functors way :) )

-- First of all we need make our custom type as `Functor`, and then `Applicative Functor`
instance Functor Distance where
    fmap :: (a -> b) -> Distance a -> Distance b
    fmap f (Distance value) = Distance (f value)

instance Applicative Distance where
    (<*>) :: Distance (a -> b) -> Distance a -> Distance b
    -- (<*>) (Distance f) functor = fmap f functor
    -- this mechanism allowing to us to not implement custom binary functions for our types, but reuse existings (value related) inside our wrappers
    (<*>) (Distance f) = fmap f

    -- pure allowing to convert simple function to function that can be used with applicator functor
    pure :: a -> Distance a
    pure = Distance

example2 = do
    putStrLn . prefix . show $ (+) <$> Distance 19.78 <*> Distance 1.6
    putStrLn . prefix . show $ (-) <$> Distance 19.78 <*> Distance 1.6
    -- or to more clarified order
    putStrLn . prefix . show $ ((+) `fmap` Distance 19.78) <*> Distance 1.6
    putStrLn . prefix . show $ ((-) `fmap` Distance 19.78) <*> Distance 1.6
    -- using pure (no need fmap (<$>)) anymore
    putStrLn . prefix . show $ pure (+) <*> Distance 19.78 <*> Distance 1.6
    putStrLn . prefix . show $ pure (-) <*> Distance 19.78 <*> Distance 1.6

{-
    <$> is infix form of fmap of functor

    <*> :: Functor f => f (a -> b) -> f a -> f b
    <$> :: Functor f =>   (a -> b) -> f a -> f b
-}

{-
    ((+) `fmap` Distance 19.78) <*> Distance 1.6:
       1. `fmap` applied value of Distance to (+), and in result we got partially executed func, that waits second arg
       2. next applicator functor sequential operator (<*>) wrapped this in functor, applied this partial operator to second arg, and got result fomr operator (+), wrapped in our type Distance

    ------------------------------
    more detailed explanation steps:
    (+) <$> Distance 19.78 <*> Distance 1.6

    1.
    (+)          <$>    APPL_FTOR           <*>                 APPL_FTOR
   ((+)          <$>    APPL_FTOR)          <*>                 APPL_FTOR
    op function  fmap   first applicative   op. of secuential   second applicative
                        functor             pllying             functor

    2.
    (+) <$> APPL_FTOR

    fmap  f  (Distance value) = Distance (f value)
    fmap (+) (Distance 19.78) = Distance ((+) 19.78)  - result partial applied function

    3.
    APPL_FTOR <*> APPL_FTOR

    Distance <*> f           functor      = fmap f           functor
    Distance <*> ((+) 19.78) Distance 1.6 = fmap ((+) 19.78) Distance 1.6 - second argument applied by fmap, and returned result from (+) function

-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- more than two argumets (anu number of arguments actually)

totalSum :: (Num v) => v -> v -> v -> v
totalSum a b c = a + b + c

example3 = do
    putStrLn . prefix . show $
        totalSum
            <$> Distance 19.78
            <*> Distance 1.6
            <*> Distance 289.0
    putStrLn . prefix . show $
        pure totalSum
            <*> Distance 19.78
            <*> Distance 1.6
            <*> Distance 289.0

---------------------------------------------------------------------------- --------------------------------------------------------------------------
---------------------------------------------------------------------------- --------------------------------------------------------------------------

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
