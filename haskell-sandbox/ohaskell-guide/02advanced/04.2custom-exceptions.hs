import Control.Exception
import Data.List (isPrefixOf)
import Data.Typeable

-- helpers
prefix :: String -> String
prefix str = "--->>> :" ++ str

startsWith :: String -> String -> Bool
startsWith url prefix = prefix `isPrefixOf` url

-------------------------------

type Repo = String

newtype InvalidRepositoryException = InvalidRepositoryException Repo
    deriving (Show, Typeable)

instance Exception InvalidRepositoryException

-- no where and methods, as we dont want it, there no required methods (we provided it by `deriving`),
-- we just telling, that our custom class, is type of `Exception`.
-- our custom type should implements (Show, Typeable)

-------------------------------
-- using

{-
   - to throw exception we have function `throw`
   - need to remember, that no matter from where exception was raised (IO or pure function),
        catch this error we can only from IO function!!!
-}

extractProtocol :: String -> String
extractProtocol path =
    if path `startsWith` "git" || path `startsWith` "ssh"
        then takeWhile (/= ':') path
        else throw $ InvalidRepositoryException path

example1 = do
    result <-
        try $ evaluate $ extractProtocol "ss://ul@sch/proj.git" ::
            IO (Either SomeException String)
    case result of
        Left exception -> putStrLn $ "Fault: " ++ show exception
        Right protocol -> putStrLn $ "Result: " ++ protocol

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example2 = do
    putStrLn "--->>> :"

main = do
    putStrLn ">>>>>--------------EXAMPLE1--------------<<<<<"
    example1
    putStrLn "\n>>>>>--------------EXAMPLE2--------------<<<<<"
    example2
