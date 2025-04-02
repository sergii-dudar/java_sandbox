import Control.Monad
import Data.Array

{-
    INFO: Array (Data.Array)

    Immutable random-access array.

    Arrays in Haskell are immutable and have a fixed size.
    You define them using array by specifying:

        - Bounds (minimum and maximum index)
        - A list of index-value pairs

        INFO: When to Use Data.Array?

        ✅ Use Data.Array if:
            - You need fast indexed access.
            - Your data is small and dense (i.e., most indices are used).
            - You require immutable arrays.

        ❌ Avoid Data.Array if:
            - You need dynamic resizing (use Data.Vector instead).
            - Your data is sparse (use Data.Map or Data.HashMap).
-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------
--

example1 = do
    let arr = array (1, 3) [(1, "a"), (2, "b"), (3, "c")]

    -- Get value by index
    print (arr ! 2) -- "b"

    -- Check if an index exists
    print (bounds arr) -- (1,3)

    -- Convert to list
    print (elems arr) -- ["a", "b", "c"]

    -- Creating an Array with Computed Values
    print $ array (1, 5) [(i, i * i) | i <- [1 .. 5]]

    -- Multi-Dimensional Arrays
    let arr4 :: Array (Int, Int) Char = array ((1, 1), (2, 2)) [((1, 1), 'A'), ((1, 2), 'B'), ((2, 1), 'C'), ((2, 2), 'D')]
    print arr4
    print (arr4 ! (2, 1)) -- Output: 'C'

{-
    Breaking it Down:
        (1, 3) defines the index range (inclusive).
        [(1, "Hello"), (2, "World"), (3, "!")] assigns values to indices.
        arr ! 2 retrieves the value at index 2.
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- changing array
-- Since arrays are immutable, you cannot modify them in place. Instead, you create a new array with modifications.

example2 = do
    let arr = array (1, 3) [(1, "Hello"), (2, "World"), (3, "!")]
    let arr2 = arr // [(2, "Haskell")] -- Updates index 2
    print arr
    print arr2

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- loop

example3 = do
    putStrLn "--->>> loop:"

    let arr = array (1, 3) [(1, "a"), (2, "b"), (3, "c")]

    -- Iterate over array elements
    forM_ (assocs arr) $ \(i, v) ->
        putStrLn $ "Index " ++ show i ++ ": " ++ v

main = do
    putStrLn ">>>>>--------------EXAMPLE1--------------<<<<<"
    example1
    putStrLn "\n>>>>>--------------EXAMPLE2--------------<<<<<"
    example2
    putStrLn "\n>>>>>--------------EXAMPLE3--------------<<<<<"
    example3
