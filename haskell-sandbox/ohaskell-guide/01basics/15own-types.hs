-- creating synonym for type, where instead [Char] -> String can be used, ad vie versa
-- type String = [Char] : it's already present in prelude default library

prefix :: String -> String
prefix str = "--->>> :" ++ str

-- like classic enum:
data Transport = TCP | UDP | SCTP deriving (Show, Eq)

checkProtocol :: Transport -> String
checkProtocol transport = case transport of
    TCP -> "That's TCP protocol."
    UDP -> "That's UDP protocol."
    SCTP -> "That's SCTP protocol."

example1 = do
    let protocol1 = TCP
    let protocol2 = UDP
    putStrLn . prefix $ show protocol1
    putStrLn . prefix $ (if protocol2 == TCP then "just UDP" else "else " ++ show protocol2)

    -- enum swith case
    putStrLn . prefix . checkProtocol $ TCP

----------------------------------------------------------------------------
----------------------------------------------------------------------------

data WorkMode = FiveDays | SixDays deriving (Show)
data Day
    = Sunday
    | Monday
    | Tuesday
    | Wednesday
    | Thursday
    | Friday
    | Saturday
    deriving (Show)

workingDays :: WorkMode -> [Day]
workingDays FiveDays =
    [ Monday
    , Tuesday
    , Wednesday
    , Thursday
    , Friday
    ]
workingDays SixDays =
    [ Monday
    , Tuesday
    , Wednesday
    , Thursday
    , Friday
    , Saturday
    ]

example2 = do
    putStrLn . prefix $ show FiveDays ++ " : " ++ show (workingDays FiveDays)
    putStrLn . prefix $ show SixDays ++ " : " ++ show (workingDays SixDays)

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
