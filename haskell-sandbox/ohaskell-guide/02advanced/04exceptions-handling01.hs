import Control.Exception

prefix :: String -> String
prefix str = "--->>> :" ++ str

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- `catch`

{-
    catch :: Exception e => IO a -> (e -> IO a) -> IO a
    catch accepts two args:
        1. function that executions, and return result or call handler in case error
        2. exception handler function, in case error raised from main function
-}

tryToOpenFile :: FilePath -> IO String
tryToOpenFile path =
    -- catch (readFile path) possibleErrors
    readFile path `catch` possibleErrors
  where
    possibleErrors :: IOException -> IO String
    possibleErrors error = return $ "Error happended: " ++ show error

example1 = do
    -- fileContent <- readFile "Users/shevchenko/test.c" -- throw error
    fileContent <- tryToOpenFile "Users/sehii/test.c"
    putStrLn . prefix $ fileContent

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- `handle`

tryToOpenFile2 :: FilePath -> IO String
tryToOpenFile2 path =
    handle possibleErrors (readFile path) -- same as `catch`, but argumets is reverted
  where
    possibleErrors :: IOException -> IO String
    possibleErrors error = return "Aaaaa!!! Please check file."

example2 = do
    fileContent <- tryToOpenFile2 "Users/sehii/test.c"
    putStrLn . prefix $ fileContent

----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- `try`

-- try :: Exception e => IO a -> IO (Either e a)
-- try $ readFile path :: IO (Either IOException String)
{-
case result of
    Left exception -> putStrLn $ "Fault: " ++ show exception
    Right content -> putStrLn content
-}

example3 = do
    result <- try $ readFile path :: IO (Either IOException String)
    case result of
        Left exception -> putStrLn $ "Fault: " ++ show exception
        Right content -> putStrLn content
  where
    path = "Users/serhii/test.c"

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- exceptions in pure functions

example4 = do
    -- result <- try $ 2 `div` 0 :: IO (Either SomeException Integer) -- cant compile, as `try` expecting IO action!
    -- wrap to `evaluate`
    result <- try $ evaluate $ 2 `div` 0 :: IO (Either SomeException Integer) -- cant compile, as `try` expecting IO action!
    case result of
        Left exception -> putStrLn $ "Fault: " ++ show exception
        Right value -> print value

{-
    evaluate :: a -> IO a
    just wrap any value, to IO [value]
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------

example5 = do
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
