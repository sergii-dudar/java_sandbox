-- Алгебраическим типом данных называют такой тип, который составлен из других типов. Мы берём простые типы и строим из них, как из кирпичей,
-- типы сложные, а из них — ещё более сложные.

prefix :: String -> String
prefix str = "--->>> :" ++ str

----

data IP1Address = IP1Address String deriving (Show)

{-
 data IPAddress = IPAddress    String
     тип         конструктор  поле

  let ip = IPAddress       "127.0.0.1"
           конструктор     значение
           значения        типа
           типа IPAddress  String
           └ значение типа IPAddress ┘
-}

example1 = do
    let ip :: IP1Address = IP1Address "127.0.0.1"
    putStrLn . prefix . show $ ip

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- two constructor type (or more)
data IP2Address = IP2v4 String | IP2v6 String deriving (Show)

example2 = do
    let ipv4 :: IP2Address = IP2v4 "127.0.0.1"
    let ipv6 :: IP2Address = IP2v6 "2001:0db8:0000:0042:0000:8a2e:0370:7334"
    putStrLn . prefix . show $ ipv4
    putStrLn . prefix . show $ ipv6

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- compined with fixed values (enums) constructor type

data IP3Address
    = IP3v4 String
    | IP3v4Localhost
    | IP3v6 String
    | IP3v6Localhost
    deriving (Show)

example3 = do
    let ipv4 :: IP3Address = IP3v4 "173.194.122.194"
    let ipv6 :: IP3Address = IP3v6 "2001:0db8:0000:0042:0000:8a2e:0370:7334"
    let ipv4Localhost :: IP3Address = IP3v4Localhost
    let ipv6Localhost :: IP3Address = IP3v6Localhost

    putStrLn . prefix . show $ ipv4
    putStrLn . prefix . show $ ipv6
    putStrLn . prefix . show $ ipv4Localhost
    putStrLn . prefix . show $ ipv6Localhost

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- read values from adt: by pattern matching

checkIP :: IP3Address -> String
checkIP (IP3v4 address) = "IPv4 is '" ++ address ++ "'."
checkIP IP3v4Localhost = "IPv4, localhost."
checkIP (IP3v6 address) = "IPv6 is '" ++ address ++ "'."
checkIP IP3v6Localhost = "IPv6, localhost."

-- or case of
checkIP2 :: IP3Address -> String
checkIP2 addr = case addr of
    IP3v4 address -> "IPv4 is '" ++ address ++ "'."
    IP3v4Localhost -> "IPv4, localhost."
    IP3v6 address -> "IPv6 is '" ++ address ++ "'."
    IP3v6Localhost -> "IPv6, localhost."

example4 = do
    putStrLn . prefix . checkIP $ IP3v4 "173.194.122.194"
    putStrLn . prefix . checkIP $ IP3v6 "2001:0db8:0000:0042:0000:8a2e:0370:7334"
    putStrLn . prefix . checkIP $ IP3v4Localhost
    putStrLn . prefix . checkIP $ IP3v4Localhost
    putStrLn ""
    putStrLn . prefix . checkIP2 $ IP3v4 "173.194.122.194"
    putStrLn . prefix . checkIP2 $ IP3v6 "2001:0db8:0000:0042:0000:8a2e:0370:7334"
    putStrLn . prefix . checkIP2 $ IP3v4Localhost
    putStrLn . prefix . checkIP2 $ IP3v4Localhost

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- binary (or more) adt type constructors

data EndPoint1 = EndPoint1 String Int deriving (Show)
data EndPoint2 = EndPoint2 IP1Address Int deriving (Show)

example5 = do
    let googlePoint = EndPoint1 "173.194.122.194" 80
    putStrLn . prefix . show $ googlePoint

    {-
    EndPoint host _ = EndPoint "173.194.122.194" 80
    └── образец ──┘   └──────── значение ─────────┘
     -}

    let googlePoint2 = EndPoint2 (IP1Address "173.194.122.194") 80
    putStrLn . prefix . show $ googlePoint2

    -- In general type constructor, it's just special type of functions and the can be used in came way, and compositions also can be applied
    let googlePoint3 = (EndPoint2 . IP1Address $ "173.194.122.194") 80
    putStrLn . prefix . show $ googlePoint3

-----------------------------------------------------------------------------------
------------- accessing fields by constructor decomposition:
-----------------------------------------------------------------------------------

example6 = do
    -- decomposition matching function to get data from adt

    let googlePoint2 = EndPoint2 (IP1Address "173.194.122.194") 80

    -- constructor decomposition
    let EndPoint2 (IP1Address ip1) port1 = (EndPoint2 . IP1Address $ "173.194.122.194") 80
    let EndPoint2 (IP1Address ip2) port2 = googlePoint2

    putStrLn . prefix . show $ "ip: " ++ ip1 ++ ", port:" ++ show port1
    putStrLn . prefix . show $ "ip: " ++ ip2 ++ ", port:" ++ show port2

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example7 = do
    putStrLn . prefix $ " ip: " ++ ip
    putStrLn . prefix $ " port: " ++ show port
  where
    -- constructor decomposition in where clause
    EndPoint2 (IP1Address ip) port = (EndPoint2 . IP1Address $ "173.194.122.194") 80

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
