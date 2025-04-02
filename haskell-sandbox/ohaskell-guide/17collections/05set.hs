import Control.Monad
import qualified Data.Set as Set

{-
    INFO: Set (Data.Set)

    Sets provide fast membership checking.
-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example1 = do
    let setA = Set.fromList [10, 20, 30, 40]

    -- Check if a value is in the set
    print (Set.member 20 setA) -- True
    print (Set.member 50 setA) -- False

    -- Add an element
    let setB = Set.insert 50 setA
    print setB -- fromList [10,20,30,40,50]

    -- Remove an element
    let setC = Set.delete 10 setA
    print setC -- fromList [20,30,40]

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- loop

example2 = do
    putStrLn "--->>> loop:"
    let setA = Set.fromList [10, 20, 30, 40]

    -- Iterating over a set
    forM_ (Set.toList setA) print -- Convert to List first

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
