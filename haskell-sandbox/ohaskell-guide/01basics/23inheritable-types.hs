prefix :: String -> String
prefix str = "--->>> :" ++ str

-- Compiler types implementing base class types by [type] deriving (type to implement)
-- deriving can be done from standard types: Eq, Ord, Enum, Bounded, Read и Show

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Show

newtype IPAddress = IP String
    deriving (Show, Read, Eq, Ord)

data User = User
    { firstName :: String
    , lastName :: String
    , email :: String
    , yearOfBirth :: String
    , account :: Integer
    , uid :: Integer
    }
    deriving (Show, Read, Eq, Ord)

example1 = do
    putStrLn . prefix . show $ IP "localhost"
    putStrLn . prefix . show $
        User
            { firstName = "Denis"
            , lastName = "Shevchenko"
            , email = "me@dshevchenko.biz"
            , yearOfBirth = "1981"
            , account = 1234567890
            , uid = 123
            }

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Eq and Ord (Comparator)
--
-- Eq: (==), (/=)
-- Ord: compare, (<), (<=), (>), (>=), max, min
-- in general if need one of them, it's recommended to deriving from both

example2 = do
    let address1 :: IPAddress = IP "localhost1"
    let address2 :: IPAddress = IP "localhost2"
    putStrLn . prefix . show $ (address1 > address2)
    putStrLn . prefix . show $ (address1 <= address2)
    putStrLn . prefix . show $ min address1 address2
    putStrLn . prefix . show $ max address1 address2
    putStrLn . prefix . show $ compare address1 address2
    putStrLn . prefix . show $ address1 == address2
    putStrLn . prefix . show $ address1 /= address2

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Enum (applicable only for NYLLAR type constructors)

data TransportLayer = TCP | UDP | SCTP | DCCP | SPX deriving (Enum, Show, Bounded)
descriptionOf :: TransportLayer -> String
descriptionOf protocol =
    case protocol of
        TCP -> "Transmission Control Protocol"
        UDP -> "User Datagram Protocol"
        SCTP -> "Stream Control Transmission Protocol"
        DCCP -> "Datagram Congestion Control Protocol"
        SPX -> "Sequenced Packet Exchange"

example3 = do
    putStrLn . prefix . show $ [descriptionOf protocol | protocol <- [TCP, UDP]]

    -- by deriving: Enum we can apply range operator:
    putStrLn . prefix . show $ [descriptionOf protocol | protocol <- [TCP ..]]

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Bounded: applicable only to type!
-- have two standard functions: minBound and maxBound, and showing max and min type value of type
-- like: int max, mim; enum first, last value etc

example4 = do
    putStrLn . prefix . show $ "int min: " ++ show (minBound :: Int)
    putStrLn . prefix . show $ "int max: " ++ show (maxBound :: Int)
    putStrLn . prefix . show $ "transport min: " ++ show (minBound :: TransportLayer)
    putStrLn . prefix . show $ "transport max: " ++ show (maxBound :: TransportLayer)

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Read и Show
{-
    Show: convert value to `String`, or Serialize to `String`
    Read: parse value from `String`, or Deserialize from `String` to value
-}

example5 = do
    let object =
            User
                { firstName = "Serhii"
                , lastName = "Dudar"
                , email = "me@gmai.com"
                , yearOfBirth = "1988"
                , account = 1234567890
                , uid = 123
                }

    let serializedObject = show object
    let deserializedObject = read serializedObject

    putStrLn . prefix . show $ object
    putStrLn . prefix . show $ serializedObject
    putStrLn . prefix . show $ deserializedObject
    putStrLn . prefix . show $ object == deserializedObject

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example6 = do
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example7 = do
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

