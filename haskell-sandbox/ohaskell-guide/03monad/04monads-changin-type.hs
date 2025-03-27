import Data.Char (digitToInt)

prefix :: String -> String
prefix str = "--->>> :" ++ str

-- change array Char to Int

example1 = do
    print $ numbers >>= toRealNumbers
  where
    numbers = "1234567890"
    -- toRealNumbers :: Char -> [Int]
    toRealNumbers :: (Monad m) => Char -> m Int
    toRealNumbers = return . digitToInt

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example2 = do
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

main = do
    putStrLn ">>>>>--------------EXAMPLE1--------------<<<<<"
    example1
    putStrLn "\n>>>>>--------------EXAMPLE2--------------<<<<<"
    example2
