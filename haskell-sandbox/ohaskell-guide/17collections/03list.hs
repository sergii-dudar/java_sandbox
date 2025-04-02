import Control.Monad

{-
    INFO: 1. List ([a])

    Lists don’t have direct indexing like arrays, but you can use !! to get elements.
-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------
--

example1 = do
    let numbers = [10, 20, 30, 40, 50]

    -- Get element by index
    print (numbers !! 2) -- 30

    -- Check if an element exists
    print (30 `elem` numbers) -- True
    print (100 `elem` numbers) -- False

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- loop

example2 = do
    putStrLn "--->>> loop:"
    let numbers = [1, 2, 3, 4, 5]

    -- Print each element (forEach)
    mapM_ print numbers -- Equivalent to forEach in Java

    -- If inside `IO`, we can use `forM_`
    forM_ numbers $ \n -> putStrLn ("Number: " ++ show n)

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
