prefix :: String -> String
prefix str = "--->>> :" ++ str

{-
Value Constroctor: it's constructor that allows to create our type.
One type, can have one or many type constructors
-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Constuctor type with diff name from type

data IPAddress1 = IP1 String
instance Show IPAddress1 where
    show (IP1 address) =
        if address == "127.0.0.1" then "localhost" else address

example1 = do
    print $ IP1 "127.0.0.1"

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Multiple contructor types

data IPAddress2 = IP2 String | Host2 String

-- for instance of class type, we need provide method to each type constructor
instance Show IPAddress2 where
    show (IP2 address) =
        address
    show (Host2 address) =
        if address == "127.0.0.1" then "localhost" else address

example2 = do
    print $ IP2 "127.0.0.1"
    print $ Host2 "127.0.0.1"

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Nullary constructors (without args, enum alanogy in java languare)

-- data TransportLayer = TCP | UDP | SCTP | DCCP | SPX deriving (Show)
data TransportLayer = TCP | UDP | SCTP | DCCP | SPX

instance Show TransportLayer where
    show TCP = "TCP custom"
    show UDP = "UPD custom"
    show SCTP = "SCTP custom"
    show DCCP = "DCCP custom"
    show SPX = "SPX custom"

descriptionOf :: TransportLayer -> String
descriptionOf protocol =
    case protocol of
        TCP -> "Transmission Control Protocol"
        UDP -> "User Datagram Protocol"
        SCTP -> "Stream Control Transmission Protocol"
        DCCP -> "Datagram Congestion Control Protocol"
        SPX -> "Sequenced Packet Exchange"

example3 = do
    print $ descriptionOf TCP
    print $ show TCP

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

