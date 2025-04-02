-- import qualified Data.Vector as V -- cabal install vector

{-
    INFO: Vector (Data.Vector)

    A better alternative to lists for fast indexing.
-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------
--

example1 = do
    putStrLn "--->>> :"

{-
    let vec = V.fromList [100, 200, 300, 400]

    -- Get element by index
    print (vec V.! 2) -- 300

    -- Check length
    print (V.length vec) -- 4

    -- Modify an element
    let vecUpdated = vec V.// [(1, 999)]
    print vecUpdated -- fromList [100,999,300,400]
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- loop

example2 = do
    putStrLn "--->>> loop:"

{-
    let vec = V.fromList [10, 20, 30]

    -- Iterate using mapM_
    V.mapM_ print vec
-}
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
