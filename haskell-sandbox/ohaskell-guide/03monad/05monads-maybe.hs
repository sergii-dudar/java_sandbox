import Data.Char (digitToInt, isNumber)
import Data.List (isSuffixOf)
import Data.Maybe (isJust, isNothing)

prefix :: String -> String
prefix str = "--->>> :" ++ str

endsWith :: String -> String -> Bool
endsWith str suffix = suffix `isSuffixOf` str

{-
data Maybe a = Nothing | Just a
                deriving (Eq, Ord)
-}

coefficientFromString :: String -> Maybe Int
coefficientFromString str =
    if isNumber firstChar
        then Just (digitToInt firstChar)
        else Nothing
  where
    firstChar = str !! 0

check :: Maybe Int -> String
check aCoefficient
    -- \| aCoefficient == Nothing = "Invalid string!"
    | isNothing aCoefficient = "Invalid string!"
    | otherwise = show aCoefficient

example1 = print $ check $ coefficientFromString "0"

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- `Just` type is Monad type!

result :: Maybe String -> String
result email = if isNothing email then "Bad email" else "Good!"

-- checkFormat :: (Foldable t) => t Char -> Maybe (t Char)
checkFormat :: String -> Maybe String
checkFormat email =
    if '@' `elem` email then return email else Nothing

checkDomain :: String -> Maybe String
checkDomain email =
    if email `endsWith` ".com" then return email else Nothing

example2 =
    print $ result $ Just "me@gmail.com" >>= checkFormat >>= checkDomain

-- where
--   checkFormat :: String -> Maybe String
--   checkFormat email =
--       if '@' `elem` email then return email else Nothing
--   checkDomain :: String -> Maybe String
--   checkDomain email =
--       if email `endsWith` ".com" then return email else Nothing

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
