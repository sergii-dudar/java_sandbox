{-# LANGUAGE MultiWayIf #-}

calculateTime :: Int -> Int
calculateTime timeInS =
    if
        | timeInS < 40 -> timeInS + 120
        | timeInS >= 40 -> timeInS + 8 + 120

-------------------

-- let DECLARATIONS in EXPRESSION
calculateTime2 :: Int -> Int
calculateTime2 timeInS =
    let threshold = 40
        correction = 120
        delta = 8
     in if
            | timeInS < threshold -> timeInS + correction
            | timeInS >= threshold -> timeInS + delta + correction

-- otherwise

calculateTime3 :: Int -> Int
calculateTime3 timeInS =
    let threshold = 40
        correction = 120
        delta = 8
     in (if timeInS < threshold then timeInS + correction else timeInS + delta + correction)

-- in if
--        | timeInS < threshold -> timeInS + correction
--        | otherwise -> timeInS + delta + correction

-------------------

example1 = do
    putStrLn ("--->>> let 1. calculateTime: " ++ show (calculateTime 41))
    putStrLn ("--->>> let 2. calculateTime: " ++ show (calculateTime2 41))
    putStrLn ("--->>> let 3. calculateTime: " ++ show (calculateTime3 41))

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Важно помнить, что введённое конструкцией let-in выражение существует лишь в рамках выражения, следующего за словом in

calculateTime4 :: Int -> Int
calculateTime4 timeInS =
    let threshold = 40
        correction = 120
     in if
            | timeInS < 40 -> timeInS + correction
            | otherwise ->
                let delta = 8
                 in timeInS
                        + delta
                        + correction

example2 = do
    putStrLn "--->>> scopes:"
    putStrLn ("--->>> let 4. calculateTime: " ++ show (calculateTime4 41))

----------------------------------------------------------------------------
----------------------------------------------------------------------------
------------------ WHERE (another way of middle variables)

calculateTime5 :: Int -> Int
calculateTime5 timeInS =
    if
        | timeInS < threshold -> timeInS + correction
        | otherwise ->
            timeInS
                + delta
                + correction
  where
    threshold = 40
    correction = 120
    delta = 8

example3 = do
    putStrLn "--->>> :"
    putStrLn ("--->>> where 5. calculateTime: " ++ show (calculateTime5 41))

----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------- LET IN and WHERE

calculateTime6 :: Int -> Int
calculateTime6 timeInS =
    let threshold = 40
     in if
            | timeInS < threshold -> timeInS + correction
            | otherwise -> timeInS + delta + correction
  where
    correction = 120
    delta = 8

calculateTime7 :: Int -> Int
calculateTime7 timeInS =
    let threshold = 40
     in if
            | timeInS < threshold -> timeInS + correction
            | otherwise -> timeInS + delta + correction
  where
    -- Это промежуточное выражение зависит от аргумента...
    correction = timeInS * 2
    -- А это - от другого выражения...
    delta = correction - 4

calculateTime8 :: Int -> Int
calculateTime8 timeInS =
    let delta = correction - 4
        threshold = 40
     in if
            | timeInS < threshold -> timeInS + correction
            | otherwise -> timeInS + delta + correction
  where
    correction = timeInS * 2

-- calculateTime9 :: Int -> Int
-- calculateTime9 timeInS =
--     let delta = correction - 4
--         threshold = 40
--      in if
--             | timeInS < threshold -> timeInS + correction
--             | otherwise -> timeInS + delta + correction
--   where
--     correction = timeInS * 2 * threshold -- Из let??

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
