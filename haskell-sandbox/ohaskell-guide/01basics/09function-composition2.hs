import Data.Char
-- import Data.String.Utils
import Data.List (isPrefixOf)

startswith :: String -> String -> Bool
startswith = isPrefixOf

replace :: String -> String -> String -> String
replace _ _ [] = []
replace old new str
  | old `isPrefixOf` str = new ++ replace old new (drop (length old) str)
  | otherwise = head str : replace old new (tail str)

prefix :: String -> String
prefix str = "--->>> :" ++ str

-----------------------------------------
-- mattter

addPrefix :: String -> String
addPrefix url =
    if url `startsWith` prefix then url else prefix ++ url
    where prefix = "http://"
          startsWith url prefix = startswith prefix url

-- with implicit type
encodeAllSpaces = replace " " "%20"
makeItLowerCase = map toLower

example1 = do
    putStrLn (addPrefix (encodeAllSpaces (makeItLowerCase url)))
    where url = "www.SITE.com/test me/Start page"

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- apply function composition:

example2 = do
    let name = "Serhii"
    print $ "Hi master!"
    print ("Hi master '" ++ name ++ "', have a nice day!")
    print $ "Hi master '" ++ name ++ "', have a nice day!"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example3 = do
    let url :: String = "www.SITE.com/test me/Start page"
    putStrLn $ (addPrefix . encodeAllSpaces . makeItLowerCase) url
    putStrLn $ addPrefix (encodeAllSpaces (makeItLowerCase url))
    putStrLn $ addPrefix $ encodeAllSpaces $ makeItLowerCase url
    putStrLn $ addPrefix (encodeAllSpaces (makeItLowerCase url))
    putStrLn . addPrefix . encodeAllSpaces . makeItLowerCase $ url

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
