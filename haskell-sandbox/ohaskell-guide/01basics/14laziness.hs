prefix :: String -> String
prefix str = "--->>> :" ++ str

strange :: Int -> Int
strange i = 22

example1 = do
    putStrLn . prefix . show . strange $ 2 `div` 0

    let
        x = 2 * 2
     in
        print . show $ x * x -- x will be calsulated only once

-- no error because of lazy nature, `strange` is not using argument of expression,
-- haskell see it, and just left expressiong not calculated, and no any division to zero!
--

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- laziness: another example

example2 = do
    -- 1. nothing calculated
    let cx = 2 / 6.054 -- thunk
        nk = 4 * 12.003 -- thunk
        coeffs = [cx, nk] -- thunk
     in putStrLn "Nothing..."
    -- as nothing using, no any values calculated

    -- 2. only length calculated (partially calculated)
    let cx = 2 / 6.054 -- thunk
        nk = 4 * 12.003 -- thunk
        coeffs = [cx, nk] -- WHNF
     in print $ length coeffs
    -- array `coeffs` calculated only to get `length`, but elements in array, still not calculated, and not used
    -- coeffs = [thunk, thunk]

    -- 3. only length and second elemtnt calculated (partially calculated)
    let cx = 2 / 6.054 -- thunk
        nk = 4 * 12.003 -- normal
        coeffs = [cx, nk] -- WHNF
     in print $ coeffs !! 1
    -- calculated only second elements
    -- coeffs = [thunk, 48.012]

    -- 4. fully calculated
    let cx = 2 / 6.054 -- normal
        nk = 4 * 12.003 -- normal
        coeffs = [cx, nk] -- normal
     in print coeffs

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- rationality

example3 = do
    print $ take 5 evens
  where
    evens = [2, 4 .. 100] -- haskell see, that needs only first 5 elements, and becuase of it, will not calculate 100 elements, but only 5!

example4 = do
    print $ take 500 evens
  where
    evens = [2, 4 ..] -- .. it's infinity array, but as we know, kaskell will calculate only what was requestes, 500

-- example41 = do
--     print evens -- give me all! infinity loop will be in result
--   where
--     evens = [2, 4 ..]

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Space leak

bad :: [Int] -> Int -> Int
bad [] c = c
-- bad (_ : others) c = bad others $ c + 1 -- 14laziness.hs: stack overflow
bad (_ : others) c = bad others $! c + 1 -- 50000000

-- $  - use lazy calculation, that will save not calculated expressions

-- $! - don't use lazy, calculate imediatelly, that in result wiht such deep recursion save memory space, as not saving expr, calculate
example5 = do
    print $ bad [1 .. 50000000] 0

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example6 = do
    putStrLn . take 2 $ replicate 100 'a'
    putStrLn . take 5 $ repeat 'a'

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
