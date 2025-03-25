import GHC.Base (Alternative (some), TYPE)

prefix :: String -> String
prefix str = "--->>> :" ++ str

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Class type

{-
Class Types: it's logical group of types with some methods type should implements,
it's can be represendted as abstract class or interface in java or related languages
-}
{-
standart Show class type have next definition:

class Show a where
    show :: a -> String
-}
newtype IPAddress = IPAddress String deriving (Show)

example1 = do
    putStrLn . prefix . show $ IPAddress "127.0.0.1"

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INSTANCE OF CLASS TYPE
{-
If `CLASS TYPES` `Show` - it's logical group of types, objects of what we cah show,
then `INSTANCE OF CLASS TYPE` `Show` - it's real definition of how to show some
real type of this class (for example String, IPAddress etc)
-}

newtype IPAddress2 = IPAddress2 String

-- NOTE that we have removed `deriving (Show)` from IPAddress2, that means compilator
-- will not generate `Show` class type implementation for us, now we have to add this implementation explicitly as we want.

instance Show IPAddress2 where
    show (IPAddress2 address) =
        if address == "127.0.0.1" then "localhost" else address

example2 = do
    putStrLn . prefix . show $ IPAddress2 "127.0.0.1"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example3 = do
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example4 = do
    putStrLn "--->>> :"

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

