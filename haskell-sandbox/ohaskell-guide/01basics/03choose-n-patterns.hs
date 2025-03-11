{-# LANGUAGE MultiWayIf #-}

analyzeGold :: Int -> String
analyzeGold standard =
    if standard == 999
        then "Wow! 999 standard!"
        else
            if standard == 750
                then "Great! 750 standard."
                else
                    if standard == 585
                        then "Not bad! 585 standard."
                        else "I don't know such a standard..."

example1 = do
    putStrLn "--->>> Bad practice:"
    putStrLn (analyzeGold 999)

----------------------------------------------------------------------------
----------------------------------------------------------------------------

{-
 if | COND1 -> EXPR1
    | COND2 -> EXPR2
    | ...
    | CONDn -> EXPRn
    | otherwise -> COMMON_EXPR
-}

analyzeGold2 :: Int -> String
analyzeGold2 standard =
    if
        | standard == 999 -> "Wow! 999 standard!"
        | standard == 750 -> "Great! 750 standard."
        | standard == 585 -> "Not bad! 585 standard."
        | otherwise -> "I don't know such a standard..."

example2 = do
    putStrLn "--->>> MultiWayIf:"
    putStrLn (analyzeGold2 999)

----------------------------------------------------------------------------
----------------------------------------------------------------------------

{-
 function arg  -- Нет знака равенства?
  | COND1 = EXPR1
  | COND2 = EXPR2
  | ...
  | CONDn = EXPRn
  | otherwise = COMMON_EXPR
-}

analyzeGold3 :: Int -> String
analyzeGold3 standard
    | standard == 999 = "Wow! 999 standard!"
    | standard == 750 = "Great! 750 standard."
    | standard == 585 = "Not bad! 585 standard."
    | otherwise = "I don't know such a standard..."

example3 = do
    putStrLn "--->>> without if:"
    putStrLn (analyzeGold3 999)

----------------------------------------------------------------------------
----------------------------------------------------------------------------

analyzeGold4 :: Int -> String -- one declaration
-- many definitions (what will be calling one by one untill match found. or _ that match everything (have to be the end in list of declaration!))
analyzeGold4 999 = "Wow! 999 standard!"
analyzeGold4 750 = "Great! 750 standard."
analyzeGold4 585 = "Not bad! 585 standard."
analyzeGold4 _ = "I don't know such a standard..."

example4 = do
    putStrLn "--->>> func pattern mathing:"
    putStrLn (analyzeGold4 999)

----------------------------------------------------------------------------
----------------------------------------------------------------------------

{-
case EXPRESSION of
  PATTERN1 -> EXPR1
  PATTERN2 -> EXPR2
  ...
  PATTERNn -> EXPRn
  _        -> COMMON_EXPR
-}

analyzeGold5 :: Int -> String
analyzeGold5 standard =
    case standard of
        999 -> "Wow! 999 standard!"
        750 -> "Great! 750 standard."
        585 -> "Not bad! 585 standard."
        _ -> "I don't know such a standard..."

example5 = do
    putStrLn "--->>> case-of:"
    putStrLn (analyzeGold5 999)

----------------------------------------------------------------------------
----------------------------------------------------------------------------

indicate1 :: String -> String
indicate1 address =
    if address == "127.0.0.1" then "localhost" else address

indicate2 :: String -> String
indicate2 "127.0.0.1" = "localhost"
indicate2 address = address

indicate3 :: String -> String
indicate3 address
    | address == "127.0.0.1" = "localhost"
    | null address = "empty IP-address"
    | otherwise = address

example6 = do
    putStrLn . indicate2 $ "127.0.0.1"
    putStrLn . indicate3 $ "127.0.0.1"

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
