-- creating synonym for type, where instead [Char] -> String can be used, ad vie versa
-- type String = [Char] : it's already present in prelude default library

{-
data - for defining oun types
class - for defining class of types
instance - for defining instance of class of types
 -}

prefix :: String -> String
prefix str = "--->>> :" ++ str

-- like classic enum:
data Transport = TCP | UDP | SCTP deriving (Show, Eq)

-- TCP, UDP ... it's no args constructors of transport type

checkProtocol :: Transport -> String
checkProtocol transport = case transport of
    TCP -> "That's TCP protocol."
    UDP -> "That's UDP protocol."
    SCTP -> "That's SCTP protocol."

example1 = do
    let protocol1 :: Transport = TCP
    let protocol2 :: Transport = UDP
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

main = do
    putStrLn ">>>>>--------------EXAMPLE1--------------<<<<<"
    example1
    putStrLn "\n>>>>>--------------EXAMPLE2--------------<<<<<"
    example2
    putStrLn "\n>>>>>--------------EXAMPLE3--------------<<<<<"
    example3
    putStrLn "\n>>>>>--------------EXAMPLE4--------------<<<<<"
    example4
