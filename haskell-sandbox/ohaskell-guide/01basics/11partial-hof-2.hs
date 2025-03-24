prefix :: String -> String
prefix str = "--->>> :" ++ str

type Login = String
type Password = String
type AvatarURL = String
type UserId = Integer

userInfo :: Login -> Password -> AvatarURL -> UserId -> String
userInfo login password avatarURL userId =
    "Full info about user @"
        ++ (show userId)
        ++ ":"
        ++ "\n login: "
        ++ login
        ++ "\n password: "
        ++ password
        ++ "\n avatar URL: "
        ++ avatarURL

type EmptyInfo = Login -> Password -> AvatarURL -> UserId -> String
type WithLogin =          Password -> AvatarURL -> UserId -> String
type AndWithPassword =                AvatarURL -> UserId -> String
type AndWithAvatarURL =                            UserId -> String

storeLoginIn :: EmptyInfo -> UserId -> WithLogin
storeLoginIn emptyInfo userId = emptyInfo "denis" -- in reala app get by userId

storePasswordIn :: WithLogin -> UserId -> AndWithPassword
storePasswordIn infoWithLogin userId = infoWithLogin "123456789abc" -- in reala app get by userId

storeAvatarURLIn :: AndWithPassword -> UserId -> AndWithAvatarURL
storeAvatarURLIn infoWithPassword userId = infoWithPassword "http://serhii.biz/serhii_avatar.png"  -- in reala app get by userId

example1 = do
    let userId = 1234
        infoWithLogin = storeLoginIn userInfo userId
        infoWithPassword = storePasswordIn infoWithLogin userId
        infoWithAvatarURL = storeAvatarURLIn infoWithPassword userId
        fullInfoAboutUser = infoWithAvatarURL userId
     in putStrLn fullInfoAboutUser

----------------------------------------------------------------------------
----------------------------------------------------------------------------

type Prefix = String

obtainLogin :: UserId -> (Prefix -> String)
obtainLogin userId = 
    loginStorage "serhii" -- login is get from somewhere
    where loginStorage login prefix = prefix ++ ": " ++ login -- by the fact is's lambda, equvalent of: [ loginStorage = \login prefix -> prefix ++ ": " ++ login ]

example2 = do
    let userId = 1234
     in putStrLn ((obtainLogin userId) "My login")

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example3 = do
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

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

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example9 = do
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example10 = do
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
    putStrLn "\n>>>>>--------------EXAMPLE9--------------<<<<<"
    example9
    putStrLn "\n>>>>>--------------EXAMPLE10--------------<<<<<"
    example10

