-- isInfixOf and isSuffixOf.
import Data.List

{-
lambda defining:

with one argument: \x -> x * x
\        x          ->  x * x
признак  имя            выражение
ЛФ       аргумента

with more that one arguments: \x y -> x * y
\        x          y          ->  x * y
признак  имя 1      имя 2          выражение
ЛФ       аргумента  аргумента

-}

example1 = do
    -- define lambda and call it in came place
    let value = (\x -> x * x) 5
    let value2 :: Double = (\x -> x * x) 5

    let value3Fun :: Integer -> Integer = \x -> x * x
    let value3 :: Integer = value3Fun 3

    -- typed
    putStrLn ("--->>> :" ++ show value)

    -- or
    putStrLn ("--->>> :" ++ show ((\x -> x * x) 5))
    putStrLn ("--->>> :" ++ show ((\x y -> x * y) 10 4))

    -- with where
    putStrLn ("--->>> :" ++ show (mul 10 4) ++ " | " ++ show (mul 2 8))
    putStrLn ("--->>> :" ++ show (mul 10 4 + mul 2 8))
  where
    mul = \x y -> x * y

----------------------------------------------------------------------------
----------------------------------------------------------------------------
--
-- as lambds (as another types of functions), it's just data type! we can use it same as with data types (passeing to tuple, list, return etc)
example2 = do
    putStrLn "--->>> :"
    -- putStrLn ((head functions) "Hi")
    putStrLn ((functions !! 0) "Hi")
  where
    functions :: [String -> String] =
        [ \x -> x ++ " val1"
        , \x -> x ++ " val2"
        ]

----------------------------------------------------------------------------
----------------------------------------------------------------------------

------------------------ Local functions
validComEmail :: String -> Bool
validComEmail email =
    containsAtSign email && endWithCom email
  where
    containsAtSign e = "@" `isInfixOf` e
    endWithCom e = ".com" `isSuffixOf` e

------------------ explicit func versions
validComEmail2 :: String -> Bool
validComEmail2 email =
    containsAtSign email && endsWithCom email
  where
    -- Объявляем локальную функцию явно.
    containsAtSign :: String -> Bool
    containsAtSign e = "@" `isInfixOf` e

    -- И эту тоже.
    endsWithCom :: String -> Bool
    endsWithCom e = ".com" `isSuffixOf` e

----------------- with lambda functions

-- custom type shortcut
type StringBoolFunc = String -> Bool

validComEmail3 :: String -> Bool
validComEmail3 email =
    containsAtSign email && endsWithCom email
  where
    containsAtSign = \e -> "@" `isInfixOf` e
    endsWithCom = \e -> ".com" `isSuffixOf` e

    -- typed
    containsAtSign1 = (\e -> "@" `isInfixOf` e) :: String -> Bool
    endsWithCom1 = (\e -> ".com" `isSuffixOf` e) :: String -> Bool

    containsAtSign2 = (\e -> "@" `isInfixOf` e) :: StringBoolFunc
    endsWithCom2 = (\e -> ".com" `isSuffixOf` e) :: StringBoolFunc

example3 = do
    putStrLn
        ( "--->>> local: "
            ++ ( if validComEmail3 my
                    then "It's ok!"
                    else "Non-com email!"
               )
        )
  where
    my = "haskeller@gmail.com"

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
