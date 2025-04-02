import Control.Monad
import qualified Data.Map as Map

{-
    INFO: Map (Data.Map)

    Maps store key-value pairs and allow fast lookups.
-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example1 = do
    let phoneBook = Map.fromList [("Alice", 1234), ("Bob", 5678)]

    -- Get value by key
    print $ Map.lookup "Alice" phoneBook -- Just 1234
    print (Map.lookup "Charlie" phoneBook) -- Nothing

    -- Check if a key exists
    print (Map.member "Bob" phoneBook) -- True
    print (Map.member "Charlie" phoneBook) -- False

    -- Insert a new key-value pair
    let newPhoneBook = Map.insert "Charlie" 9999 phoneBook
    print newPhoneBook -- fromList [("Alice",1234),("Bob",5678),("Charlie",9999)]

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- loop

example2 = do
    putStrLn "--->>> loop:"
    let phoneBook = Map.fromList [("Alice", 1234), ("Bob", 5678)]

    -- Iterate through keys and values
    forM_ (Map.toList phoneBook) $ \(key, value) ->
        putStrLn $ key ++ " -> " ++ show value

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
