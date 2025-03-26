import Data.Char

prefix :: String -> String
prefix str = "--->>> :" ++ str

{-
    Lists in haskell - it's also monads implementation, see next what it brings to us
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------

-- toLowerCase :: Char -> [Char]
toLowerCase :: (Monad m) => Char -> m Char -- return type can be any monaid type, not only list, maybe for example, or any atnoher Monad implementation
toLowerCase = return . toLower

-- underlineSpaces :: Char -> [Char]
underlineSpaces :: (Monad m) => Char -> m Char
underlineSpaces char = return (if char == ' ' then '_' else char)

example1 :: IO ()
example1 =
    print $ name >>= toLowerCase >>= underlineSpaces
  where
    name = "Lorem ipsuM"

-- and it's main difference from simple function composition like:
-- `addPrefix . encodeAllSpaces . makeItLowerCase $ url`
-- as monaid functions wail Monad implementation, not specific container like list etc, it's much more flexible
-- we can join different functions that working with `Char`, and no matter about container, it's just should be monaid type,
-- and `return` function don't know what monaid! just return to some monail (like generics in java)

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- (=<<) mirror composition (same as >>=, but in reversed order):

example2 = do
    print $ underlineSpaces =<< toLowerCase =<< name
  where
    name = "Lorem ipsuM"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example3 =
    print $ name >>= toLowerCase
  where
    -- name = "NAME" -- result: name
    name = Just 'N' -- result: n

{-
    As we see, no matter what char container is `String` or `Maybe`, monaids function `toLowerCase` working with them without problems
    `toLowerCase` don't know anything about concrette monad type

    NOTE: FUNCTIONS DEVELOPED TO WORK WITH ONE TYPE OF MONAD, CAN BE USED (AND SHOULD BE USED) TO ANOTHER MONAD
        it's very good reusability code idea! (can be compared to java, c# generics in some moments)
-}

main = do
    putStrLn ">>>>>--------------EXAMPLE1--------------<<<<<"
    example1
    putStrLn "\n>>>>>--------------EXAMPLE2--------------<<<<<"
    example2
    putStrLn "\n>>>>>--------------EXAMPLE3--------------<<<<<"
    example3
