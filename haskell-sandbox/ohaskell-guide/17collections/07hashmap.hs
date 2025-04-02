import Control.Monad
import qualified Data.Map.Strict as Map

{-
    INFO: HashMap (Data.HashMap.Strict) : cabal install unordered-containers

    Similar to Map, but optimized for performance.
-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example1 = do
    let hashMap = Map.fromList [("key1", "value1"), ("key2", "value2")]

    -- Get value by key
    print (Map.lookup "key1" hashMap) -- Just "value1"
    print (Map.lookup "key3" hashMap) -- Nothing

    -- Check if a key exists
    print (Map.member "key2" hashMap) -- True

    -- Insert a new key-value pair
    let newMap = Map.insert "key3" "value3" hashMap
    print newMap -- fromList [("key1","value1"),("key2","value2"),("key3","value3")]

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- loop

example2 = do
    putStrLn "--->>> loop:"
    let hashMap = Map.fromList [("key1", "value1"), ("key2", "value2")]

    -- Iterate through key-value pairs
    forM_ (Map.toList hashMap) $ \(k, v) ->
        putStrLn $ k ++ ": " ++ v

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
