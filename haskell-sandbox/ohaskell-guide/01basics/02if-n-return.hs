-- if CONDITION then EXPR1 else EXPR2

checkLocalhost :: String -> String
checkLocalhost ip =
    if ip == "127.0.0.1" || ip == "0.0.0.0"
        then "It's a localhost!"
        else "No, it's not a localhost."

example1 = do
    putStrLn (checkLocalhost "127.0.0.1")
    putStrLn (checkLocalhost "173.194.22.100")
    -- because of everying is expressin, and function is nothing just resolt of expression (or expression tree),
    -- and function call is expression where result is some type like string, we can write function expression directrly like:

    let ipaddress = "173.194.22.100"
    putStrLn
        ( if ipaddress == "127.0.0.1"
            || ipaddress == "0.0.0.0"
            then "It's a localhost!"
            else "No, it's not a localhost."
        )

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example2 = do
    putStrLn "--->>> :"

main = do
    putStrLn ">>>>>--------------EXAMPLE1--------------<<<<<"
    example1
    putStrLn "\n>>>>>--------------EXAMPLE2--------------<<<<<"
    example2