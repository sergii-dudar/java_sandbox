import Data.Char
import Data.Text.IO hiding (
    appendFile,
    putStrLn,
    readFile,
    writeFile,
 )

toUpperCase :: String -> String
toUpperCase = map toUpper

addPrefix :: String -> String
addPrefix str = "--->>> :" ++ str

example1 = do
    putStrLn . addPrefix . toUpperCase $ "haskell.org"

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
