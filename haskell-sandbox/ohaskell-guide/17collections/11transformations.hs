import Data.Map
import Data.Monoid
import Data.Set

{-
    INFO: Transforming & Aggregating Values
-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 1 Transforming Elements (map)
{-
    All collections support map, but some require specific functions (Set.map, Map.map, V.map).
-}

example1 = do
    putStrLn "--->>> 1. Transforming Elements (map):"
    -- Transform list
    print (Prelude.map (* 2) [1, 2, 3]) -- [2,4,6]

    -- Transform Set
    print (Data.Set.map (* 2) (Data.Set.fromList [1, 2, 3])) -- fromList [2,4,6]

    -- Transform Map (values only)
    print (Data.Map.map (* 2) (Data.Map.fromList [("a", 1), ("b", 2)]))

-- fromList [("a",2),("b",4)]

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 2 Aggregating Values (foldl, foldr)
{-
    foldl (left fold) and foldr (right fold) allow aggregation.
-}

example2 = do
    putStrLn "--->>> 2 Aggregating Values (foldl, foldr):"
    -- List
    print (Prelude.foldl (+) 0 [1, 2, 3, 4]) -- 10

    -- Set
    print (Data.Set.foldl (+) 0 (Data.Set.fromList [1, 2, 3, 4])) -- 10

    -- Map (sum of values)
    print (Data.Map.foldl (+) 0 (Data.Map.fromList [("a", 1), ("b", 2), ("c", 3)])) -- 6

    -- Finding Maximum
    print (Prelude.foldl max 0 [10, 20, 5, 40]) -- 40

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 3 Combining Elements (concat, mconcat)
--
-- Haskell supports mconcat for combining elements when a Monoid is available.

example3 = do
    putStrLn "--->>> 3 Combining Elements (concat, mconcat):"
    let lists = [[1, 2, 3], [4, 5], [6]]

    -- Flatten lists
    print (concat lists) -- [1,2,3,4,5,6]

    -- Using mconcat (works on Monoids)
    print (mconcat lists) -- [1,2,3,4,5,6]

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
