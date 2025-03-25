prefix :: String -> String
prefix str = "--->>> :" ++ str

-- User year: type constructor because of polymorh holder - `year`
--
data User year = User
    { firstName :: String
    , lastName :: String
    , email :: String
    , yearOfBirth :: year -- polymorh type
    , account :: Integer
    , uid :: Integer
    }

changeEmailStr :: User String -> String -> User String
changeEmailStr user newEmail = user{email = newEmail}

changeEmailInt :: User Integer -> String -> User Integer
changeEmailInt user newEmail = user{email = newEmail}

changeEmailGeneric :: (Eq year, Show year) => User year -> String -> User year
changeEmailGeneric user newEmail = user{email = newEmail}

-- User Ingeger
-- User String

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
