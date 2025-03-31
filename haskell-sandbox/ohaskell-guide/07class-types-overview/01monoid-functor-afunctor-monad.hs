import Data.Char
import Data.Monoid

{-
    🔹 Overview of When to Use Each
   ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   | Concept        | What it represents                   | When to use                                                                                                     |
   |-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
   |-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
   | 1. Monoid      | A type with an associative binary    | When you need to combine things, e.g., summing numbers, merging lists, combining logs                           |
   |                |   operation and an identity element  |                                                                                                                 |
   |----------------|--------------------------------------|-----------------------------------------------------------------------------------------------------------------|
   | 2. Applicative | A context that allows mapping        | When you want to apply a function to wrapped values (e.g., `Maybe a`, `IO a`, `Either e a`)                     |
   |  Functor       |   a function over it (fmap)          |                                                                                                                 |
   |                | Functor with additional structure:   | When you need to apply a function inside a context (Just (+3) <*> Just 5) or work with multiple wrapped values  |
   |----------------|--------------------------------------|-----------------------------------------------------------------------------------------------------------------|
   | 4. Functor     |   allows applying functions wrapped  |                                                                                                                 |
   |                |   in a context                       |                                                                                                                 |
   |----------------|--------------------------------------|-----------------------------------------------------------------------------------------------------------------|
   | 4. Monad       | Like an Applicative but allows       | When the computation depends on previous results (e.g., reading input before computing the next step)           |
   |                |    sequencing operations (>>=)       |                                                                                                                 |
   ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    How to Choose?
    1. Do you need to combine values? → Monoid
    2. Do you just need to apply a function to a wrapped value? → Functor
    3. Do you have multiple wrapped values or functions in a context? → Applicative Functor
    4. Does your next step depend on the result of a previous computation? → Monad

   When to Use What:
-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------
{-
    1.1️⃣ Monoid: When You Need to Combine Things
       - Use Monoid if you have a simple "merging" operation.
       - Example: Summing numbers, concatenating logs, merging data.

                ---------------------------------
                class Monoid m where
                    mempty :: m
                    mappend :: m -> m -> m
                    mconcat :: [m] -> m
                    mconcat = foldr mappend mempty
                ---------------------------------

    WARN: Avoid: Using a Monoid when the combination operation is not associative or has no natural identity element.
-}

example1 = do
    print $ mconcat [Sum 10, Sum 20, Sum 30] -- Output: Sum {getSum = 60}
    print $ mconcat ["Hello", " ", "World!"] -- "Hello World!"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

{-
    2. Functor: When You Want to Apply a Function to a Wrapped Value
        - Use Functor when you have a structure (e.g., `Maybe`, `Either`, `IO`, `[]`)
             and want to apply a function to the contained values.
        - Example: Transforming values inside a `Maybe` or `List`.

            --------------------------------------------
            class Functor f where
                fmap :: Functor f => (a -> b) -> f a -> f b
            <$> is infix form of fmap of functor
            --------------------------------------------

    WARN: Avoid: Functors when function application isn't enough, like if the next step depends on the value inside.
-}
example2 = do
    print $ fmap (* 2) (Just 5) -- Output: Just 10
    -- or
    print $ (*) 2 <$> Just 5 -- Output: Just 10

----------------------------------------------------------------------------
----------------------------------------------------------------------------

{-
    3.3️⃣ Applicative: When You Have a Function in a Context
        - Use Applicative when you have functions inside
           a context (Just (+3)) and want to apply them to another context.
        - Example: Combining multiple wrapped values.

            ---------------------------------------
            class Functor f => Applicative f where
                pure :: a -> f a
                (<*>) :: f (a -> b) -> f a -> f b
                (*>) :: f a -> f b -> f b
                (<*) :: f a -> f b -> f a
            ---------------------------------------

    WARN: Avoid: Using Applicative if later computations depend on previous results. Use Monad instead.
-}
example3 = do
    print $ (+) <$> Just 3 <*> Just 5 -- Output: Just 8
    -- or
    print $ pure (+) <*> Just 3 <*> Just 5 -- Output: Just 8

----------------------------------------------------------------------------
----------------------------------------------------------------------------
{-
    4. Monad: When Computations Depend on Previous Steps
       1. Use Monad when a computation needs the result of a previous computation.

            ---------------------------------------------
            class Monad m where
                (>>=) :: m a -> (a -> m b) -> m b
                (>>) :: m a -> m b -> m b
                return :: a -> m a
                fail :: String -> m a

            additionally to (>>=), in base library we have (=<<) - mirror composition

            (>>=):    Monad m => m a -> (a -> m b) -> m b
            (=<<):    Monad m => (a -> m b) -> m a -> m b
            ---------------------------------------------

    WARN: Avoid: Using Monad when Functor or Applicative would suffice, since Monads limit composability.
-}

toLowerCase :: (Monad m) => Char -> m Char -- return type can be any monaid type, not only list, maybe for example, or any atnoher Monad implementation
toLowerCase = return . toLower

underlineSpaces :: (Monad m) => Char -> m Char
underlineSpaces char = return (if char == ' ' then '_' else char)

example4 =
    print $ name >>= toLowerCase >>= underlineSpaces
  where
    name = "Lorem ipsuM"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example5 = do
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example6 = do
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example7 = do
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example8 = do
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example9 = do
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example10 = do
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
