prefix :: String -> String
prefix str = "--->>> :" ++ str

{-
All monads is represented by class Monad:

class Monad m where
    (>>=) :: m a -> (a -> m b) -> m b
    (>>) :: m a -> m b -> m b
    return :: a -> m a
    fail :: String -> m a

additionally to (>>=), in base library we have (=<<) - mirror composition

(>>=):    Monad m => m a -> (a -> m b) -> m b
(=<<):    Monad m => (a -> m b) -> m a -> m b

----------------------
or with IO typed:

class Monad IO where
    (>>=) :: IO a -> (a -> IO b) -> IO b
    (>>) :: IO a -> IO b -> IO b
    return :: a -> IO a
    fail :: String -> IO a
-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- (>>=) sequentially composition (   Monad m => m a -> (a -> m b) -> m b  )
-- this operator is alanogue of unix pipe operator - `ls | grep xml`

{-
main = do
    text <- getLine
    putStrLn $ "You said '" ++ text ++ "'"

`do` code it's just syntax sugar of:
-}

example1 = getLine >>= \text -> putStrLn $ "You said '" ++ text ++ "'"

--       IO String >>= (String -> IO ())

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example2 = do
    putStrLn "--->>> :"

main = do
    putStrLn ">>>>>--------------EXAMPLE1--------------<<<<<"
    example1
    putStrLn "\n>>>>>--------------EXAMPLE2--------------<<<<<"
    example2
