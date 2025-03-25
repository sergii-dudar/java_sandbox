-- import Data.Tuple.Update

-- (String, String)
-- (Double, Double, Int)
-- (Bool, Double, Int, String)
--

makeAlias :: String -> String -> (String, String)
makeAlias host alias = (host, alias)

makeAlias1 :: String -> String -> (String, String, String)
makeAlias1 host alias = (host, "https://" ++ host, alias)

example1 = do
    let (host, alias) = ("173.194.71.106", "www.google.com")
    let tuple1 = ("173.194.71.106", "www.google.com")
    putStrLn ("--->>> 0: " ++ show tuple1)

    putStrLn "\n--->>> 1:"
    let (host, alias) = makeAlias "173.194.71.106" "www.google.com"
     in print (host ++ ", " ++ alias)

    putStrLn "\n--->>> 2:"
    let pair =
            makeAlias
                "173.194.71.106"
                "www.google.com"
        host = fst pair -- take first...
        alias = snd pair -- take second...
     in print (host ++ ", " ++ alias)

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- tuple patter matching

chessMove ::
    String ->
    (String, String) ->
    (String, (String, String))
chessMove color (from, to) = (color, (from, to))

example2 = do
    print (color ++ ": " ++ from ++ "-" ++ to)
  where
    (color, (from, to)) = chessMove "white" ("e2", "e4")

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- ignoring tuple items by _

type UUID = String
type FullName = String
type Email = String
type Age = Int
type Patient = (UUID, FullName, Email, Age)

patientEmail :: Patient -> Email
patientEmail (_, _, email, _) = email

example3 = do
    putStrLn
        ( "email: "
            ++ patientEmail
                ( "63ab89d"
                , "John Smith"
                , "johnsm@gmail.com"
                , 59
                )
        )

-- haskage have convenient library: tuple
-- http://hackage.haskell.org/package/tuple
-- build-depends: base ==4.6.*, tuple
-- example:

{-
    import Data.Tuple.Select
    main = print $ sel3 ("One", "Two", "Three", "Four")
    main = print $ sel5 ("One", "Two", "Three", "Four", "Five")
-}

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
