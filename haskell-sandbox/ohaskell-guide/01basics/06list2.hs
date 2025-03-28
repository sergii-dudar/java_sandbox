prefix :: String -> String
prefix str = "--->>> :" ++ str

-- listOfNames :: String -> [[Char]]
listOfNames :: String -> [String] -- or
listOfNames prefix =
    [prefix ++ "John", prefix ++ "Anna", prefix ++ "Andrew"]

thisIsAWildAnimal :: String -> Bool
thisIsAWildAnimal name =
    name `elem` wildAnimal
  where
    wildAnimal = ["Bear", "Tiger", "Lion", "Wolf"]

example1 = do
    let list = listOfNames "Dear "
    putStrLn . prefix . show $ list
    putStrLn . prefix $ "Length: " ++ show (length list)
    putStrLn . prefix $ if thisIsAWildAnimal "Cat" then "Yes!" else "No!"

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- adding elements to list

addNewHostToFront :: String -> [String] -> [String]
addNewHostToFront newHost listOfHosts = newHost : listOfHosts

example2 = do
    putStrLn . prefix . show $ addNewHostToFront "124.67.54.90" listOfHosts
  where
    listOfHosts = ["45.67.78.89", "123.45.65.54", "127.0.0.1"]

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- removing elements from list

-- filter like [map], but applying predicate to list emenets one by one
removeAllEmptyNamesFrom :: [String] -> [String]
{- removeAllEmptyNamesFrom listOfNames = filter notEmptyName listOfNames
  where
    notEmptyName = \x -> not . null $ x -}

-- shorter:
{- removeAllEmptyNamesFrom = filter notEmptyName
  where
    notEmptyName = not . null -}

-- the shortest
-- removeAllEmptyNamesFrom = filter (not . null)

removeAllEmptyNamesFrom = filter $ not . null

example3 = do
    putStrLn . prefix . show . removeAllEmptyNamesFrom $ ["John", "", "Ann"]

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example4 = do
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example5 = do
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
