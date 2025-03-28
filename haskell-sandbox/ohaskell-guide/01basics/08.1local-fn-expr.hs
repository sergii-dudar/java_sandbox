prefix :: String -> String
prefix str = "--->>> :" ++ str

prepareLength :: Double -> Double
prepareLength line = line * 0.4959

-- without magin numbers (where)
prepareLength1 :: Double -> Double
prepareLength1 line =
    line * coefficient
  where
    coefficient = 0.4959

-- without magin numbers (in)
prepareLength2 :: Double -> Double
prepareLength2 line =
    let coefficient = 12.4959
        correction = 0.0012
     in line * coefficient - correction

------
-- where - can be only single to whole expressions
-- in - can be for each expression with visibility scope

{-
prepareLength3 :: Double -> Double
prepareLength3 line =
    let coefficient = 12.4959
        correction = 0.0012
     in line * coefficient - correction - (let s = 10.9 in s + 1) - s -- error as `s` is not in scope of declaration
-}

example1 = do
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example2 = do
    putStrLn "--->>> :"

main = do
    putStrLn ">>>>>--------------EXAMPLE1--------------<<<<<"
    example1
    putStrLn "\n>>>>>--------------EXAMPLE2--------------<<<<<"
    example2
