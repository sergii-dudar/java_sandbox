import Data.Array
import qualified Data.Map as Map
import qualified Data.Map.Strict as SMap
import qualified Data.Sequence as Seq
import qualified Data.Set as Set

-- import qualified Data.Vector as V -- cabal install vector
-- import qualified Data.HashMap.Strict as HashMap -- cabal install unordered-containers
{-
    Haskellbut it has a powerful set of collection types in the standard library and external libraries
        like "containers", "unordered-containers", and "vector".

        INFO: General collections overview:

      -------------------------------------------------------------------------------------------------------------
      | Collection                      | Java Equivalent   | Best For                                            |
      |------------------------------------------------------------------------------------------------------------
      |------------------------------------------------------------------------------------------------------------
      | List ([a])                      | List<T>           | Simplicity, lazy evaluation                         |
      |---------------------------------|-------------------|-----------------------------------------------------|
      | Tuple ((a, b))                  | Pair<A, B>        | Storing a small, fixed number of values             |
      |---------------------------------|-------------------|-----------------------------------------------------|
      | Set (Data.Set)                  | HashSet<T>        | Uniqueness of elements                              |
      |---------------------------------|-------------------|-----------------------------------------------------|
      | Map (Data.Map)                  | TreeMap<K, V>     | Key-value lookups with ordering                     |
      |---------------------------------|-------------------|-----------------------------------------------------|
      | HashMap (Data.HashMap.Strict)   | HashMap<K, V>     | Faster key-value lookups (unordered)                |
      |---------------------------------|-------------------|-----------------------------------------------------|
      | Sequence (Data.Sequence)        | LinkedList<T>     | Efficient insertions/removals at both ends          |
      |---------------------------------|-------------------|-----------------------------------------------------|
      | Array (Data.Array)              | T[]               | Immutable arrays with fast indexing                 |
      |---------------------------------|-------------------|-----------------------------------------------------|
      | Vector (Data.Vector)            | ArrayList<T>      | Fast indexing, efficient operations                 |
      -------------------------------------------------------------------------------------------------------------

        INFO: Support collections general operators

     ----------------------------------------------------------------------------------------------------------------------------------------
     |  Collection Type                 | Get by Index  | Contains          | Get by Key        | Insert            | Remove                |
     |--------------------------------------------------------------------------------------------------------------------------------------|
     |--------------------------------------------------------------------------------------------------------------------------------------|
     |  List ([a])                      | !!            | elem              | ❌                | : (prepend)       | filter                |
     |----------------------------------|---------------|-------------------|-------------------|-------------------|-----------------------|
     |  Tuple ((a, b))                  | fst, snd      | ❌                | ❌                | ❌                | ❌                    |
     |----------------------------------|---------------|-------------------|-------------------|-------------------|-----------------------|
     |  Set (Data.Set)                  | ❌            | Set.member        | ❌                | Set.insert        | Set.delete            |
     |----------------------------------|---------------|-------------------|-------------------|-------------------|-----------------------|
     |  Map (Data.Map)                  | ❌            | Map.member        | Map.lookup        | Map.insert        | Map.delete            |
     |----------------------------------|---------------|-------------------|-------------------|-------------------|-----------------------|
     |  HashMap (Data.HashMap.Strict)   | ❌            | HashMap.member    | HashMap.lookup    | HashMap.insert    | HashMap.delete        |
     |----------------------------------|---------------|-------------------|-------------------|-------------------|-----------------------|
     |  Sequence (Data.Sequence)        | Seq.index     | ❌                | ❌                | `Seq.             | >(append),Seq.<       |
     |----------------------------------|---------------|-------------------|-------------------|-------------------|-----------------------|
     |  Array (Data.Array)              | (!)           | ❌                | ❌                | ❌                | ❌                    |
     |----------------------------------|---------------|-------------------|-------------------|-------------------|-----------------------|
     |  Vector (Data.Vector)            | V.!           | ❌                | ❌                | V.snoc (append)   | V.tail                |
     ----------------------------------------------------------------------------------------------------------------------------------------

        INFO: Which One Should You Use?

            - Lists ([a]) – Best for simple, sequential data.
            - Tuples ((a, b)) – When you have a small, fixed number of values.
            - Set (Data.Set) – When uniqueness and fast lookups matter.
            - Map (Data.Map) – When you need key-value storage with ordering.
            - HashMap (Data.HashMap.Strict) – Like "Map", but faster and unordered.
            - Sequence (Data.Sequence) – When you need efficient insertions/removals at both ends.
            - Array (Data.Array) – Immutable, indexed data.
            - Vector (Data.Vector) – Fast indexing and modification.

        ---------------------------------

        INFO: FOR-LOOP AND TRANSFORM

          ---------------------------------------------------------------------------------------------------
          | Collection  | Iteration (foreach)       | Transform (map)                   | Aggregate (fold)  |
          |-------------------------------------------------------------------------------------------------|
          |-------------------------------------------------------------------------------------------------|
          | List        | mapM_, forM_              | map                               | foldl, foldr      |
          |-------------|---------------------------|-----------------------------------|-------------------|
          | Tuple       | ❌                        | fmap (only affects first element) | ❌                |
          |-------------|---------------------------|-----------------------------------|-------------------|
          | Set         | forM_ . Set.toList        | Set.map                           | Set.foldl         |
          |-------------|---------------------------|-----------------------------------|-------------------|
          | Map         | forM_ . Map.toList        | Map.map (values only)             | Map.foldl         |
          |-------------|---------------------------|-----------------------------------|-------------------|
          | HashMap     | forM_ . HashMap.toList    | HashMap.map                       | HashMap.foldl'    |
          |-------------|---------------------------|-----------------------------------|-------------------|
          | Sequence    | forM_                     | fmap                              | foldl             |
          |-------------|---------------------------|-----------------------------------|-------------------|
          | Array       | forM_ . assocs            | fmap                              | foldl             |
          |-------------|---------------------------|-----------------------------------|-------------------|
          | Vector      | V.mapM_                   | V.map                             | V.foldl'          |
          ---------------------------------------------------------------------------------------------------

        INFO: Final Thoughts (FOR-LOOP AND TRANSFORM)

            Use "mapM_" / "forM_" for side-effects (printing, logging).
            Use "map" for transformations.
            Use "foldl" / "foldr" for aggregations (sum, max, etc.).
            Use "Set".toList / "Map.toList" when a structure doesn’t directly support iteration.

-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 1. Lists ([a])
{-
    Haskell's most basic collection type is the list. Lists are:
        - Homogeneous (all elements must be of the same type).
        - Linked (linked-list structure, not random-access like arrays).
        - Lazy (elements are evaluated only when needed).
-}

example1 = do
    putStrLn "--->>> 1. Lists ([a]):"
    -- Defining lists
    let numbers :: [Int] = [1, 2, 3, 4, 5]

    -- Basic operations
    print $ head numbers -- 1
    print $ tail numbers -- [2,3,4,5]
    print $ length numbers -- 5
    print $ reverse numbers -- [5,4,3,2,1]

    -- Common Functions: map, filter, foldl, foldr, zip, concat
    print $ map (* 2) numbers -- [2,4,6,8,10]
    print $ filter even numbers -- [2,4]
    print $ foldl (+) 0 numbers -- 15

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 2. Tuples ((a, b))
{-
    Tuples store a fixed number of elements of potentially different types.
-}

example2 = do
    putStrLn "--->>> 2. Tuples ((a, b)):"
    let pair :: (Int, String) = (1, "one")

    print $ fst pair -- 1
    print $ snd pair -- "one"

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 3. Sets (Data.Set)
{-
    Haskell provides a "Set" type in the "containers" package, offering efficient operations on unique elements.
-}

example3 = do
    putStrLn "--->>> 3. Sets (Data.Set):"
    let setA = Set.fromList [1, 2, 3, 4]
    let setB = Set.fromList [3, 4, 5, 6]

    print $ Set.union setA setB -- fromList [1,2,3,4,5,6]
    print $ Set.intersection setA setB -- fromList [3,4]
    print $ Set.difference setA setB -- fromList [1,2]
    print $ Set.difference setB setA -- fromList [5,6]

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 4. Maps (Data.Map)
{-
    Like Java’s "HashMap", "Data.Map" provides an efficient key-value store.
-}

example4 = do
    putStrLn "--->>> 4. Maps (Data.Map):"
    let phoneBook :: Map.Map String Integer = Map.fromList [("Alice", 1234), ("Bob", 5678)]

    print $ Map.lookup "Alice" phoneBook -- Just 1234
    print $ Map.lookup "Charlie" phoneBook -- Nothing
    print $ Map.insert "Charlie" 9999 phoneBook

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 5. Hash Maps (Data.HashMap.Strict) - cabal install unordered-containers
{-
    More efficient than "Data.Map" for large datasets. Requires "unordered-containers".
-}

example5 = do
    putStrLn "--->>> 5. Hash Maps (Data.HashMap.Strict):"
    let hashMap = SMap.fromList [("key1", "value1"), ("key2", "value2")]
    print $ SMap.lookup "key1" hashMap -- Just "value1"

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 6. Sequences (Data.Sequence)
{-
    A better alternative to lists when frequent middle insertions/deletions are needed.
        (like LinkedList)
-}

example6 = do
    putStrLn "--->>> 6. Sequences (Data.Sequence):"
    let seqA = Seq.fromList [1, 2, 3]
    print $ Seq.index seqA 1 -- 2
    print $ Seq.update 1 99 seqA -- fromList [1,99,3]

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 7. Arrays (Data.Array)
{-
    Provides immutable, random-access arrays.
-}

example7 = do
    putStrLn "--->>> 7. Arrays (Data.Array):"
    let arr = array (1, 3) [(1, 'a'), (2, 'b'), (3, 'c')]
    print $ arr ! 2 -- 'b'

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 8. Vectors (Data.Vector)
{-
    Like Java's "ArrayList", "Data.Vector" offers fast indexing and is more efficient than lists.
    -- cabal install vector
-}

example8 = do
    putStrLn "--->>> 8. Vectors (Data.Vector):"
    -- let vec = V.fromList [10, 20, 30]
    -- print $ V.head vec -- 10
    -- print $ V.indexM vec 1 -- Just 20
    putStrLn ""

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
