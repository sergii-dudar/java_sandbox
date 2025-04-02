import Control.Monad
import qualified Data.Sequence as Seq

{-
    INFO: Sequence (Data.Sequence)

    Efficient for operations on both ends of a sequence.
-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example1 = do
    let seqA = Seq.fromList [1, 2, 3, 4]

    -- Get element by index
    print (Seq.index seqA 2) -- 3

    -- Append an element
    let seqB = seqA Seq.|> 5
    print seqB -- fromList [1,2,3,4,5]

    -- Prepend an element
    let seqC = 0 Seq.<| seqA
    print seqC -- fromList [0,1,2,3,4]

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- loop

example2 = do
    putStrLn "--->>> loop:"
    let seqA = Seq.fromList [1, 2, 3]

    -- Iterate over sequence
    forM_ seqA print

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
