prefix :: String -> String
prefix str = "--->>> :" ++ str

data User = User
    { firstName :: String
    , lastName :: String
    , email :: String
    }

changeEmail :: User -> String -> User
changeEmail user newEmail = user{email = newEmail}

example1 = do
    let user =
            User
                { firstName = "Serhii"
                , lastName = "Dudar"
                , email = "serhii.dudar@gmail.com"
                }
    let user2 = changeEmail user "new@gmail.com"
    print $
        firstName user2
            ++ " "
            ++ lastName user2
            ++ ", "
            ++ email user2

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example2 = do
    putStrLn "--->>> :"

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
