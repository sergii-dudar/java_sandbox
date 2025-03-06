import Data.Void (Void)

eveno :: Int -> Bool
noto :: Bool -> String
eveno x =
    if x `rem` 2 == 0
        then True
        else False

noto boolFlag =
    if boolFlag
        then "This is an even Number"
        else "This is an ODD number"

printResult :: String -> IO ()
printResult strToPrint = print strToPrint

-- Function composition can be implemented using any two functions, provided the
-- output type of one function matches with the input type of the second function.
-- We use the dot operator (.) to implement function composition in Haskell.

-- Since we are supplying the number 16 as the input (which is an even number),
-- the eveno() function returns true, which becomes the input for the noto()
-- function and returns the output: "This is an even Number".

example1 = do
    putStrLn "--->>> Example of Haskell Function composition:"
    print ((noto . eveno) 16)
    (printResult . noto . eveno) 16
    (print . noto . eveno) 16

    -- it's like shell pipe |, but in reversed order in definition
    -- print . noto . eveno    [in bash]:   eveno | noto | print
    putStrLn ""

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example2 = do
    putStrLn "--->>> :"

main = do
    putStrLn ">>>>>--------------EXAMPLE1--------------<<<<<"
    example1
    putStrLn "\n>>>>>--------------EXAMPLE2--------------<<<<<"
    example2