import Text.Parsec.Language (haskell)

prefix :: String -> String
prefix str = "--->>> :" ++ str

{-
data Arguments = Arguments   { runWDServer :: Port }
тип  такой-то    конструктор   метка поля     тип
                                              поля
-}

type Port = Int
type Endpoint = String
type RedirectData = String

-- stadnard data type declaration
data ArgumentsCtor
    = ArgumentsCtor
        Port
        Endpoint
        RedirectData
        FilePath
        FilePath
        Bool
        FilePath

-- or by labels (more convenient to work with):
data ArgumentsLabels = ArgumentsLabels
    { runWDServer :: Port
    , withWDServer :: Endpoint
    , redirect :: RedirectData
    , redirectLib :: FilePath
    , screenshotsDir :: FilePath
    , noScreenshots :: Bool
    , harWithXPI :: FilePath
    }

---------------- labels usage example:
-- label it's special function generated automatically (by compiler), that can: `CREATE`, `GET` and `SET` field where it's applied for.

data Patient = Patient
    { firstName :: String
    , lastName :: String
    , email :: String
    , age :: Int
    , diseaseId :: Int
    , isIndoor :: Bool
    , hasInsurance :: Bool
    }
    deriving (Show)

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- CREATE

example1 = do
    -- CREATE instance (using settger in general)
    -- NOTE: we have to set values to all fields!!!
    let patient =
            Patient
                { firstName = "John"
                , lastName = "Doe"
                , email = "shatanga.net@gmail.com"
                , age = 36
                , diseaseId = 431
                , isIndoor = True
                , hasInsurance = True
                }
    putStrLn . prefix . show $ patient

    -- GETTERS
    putStrLn . prefix . show $ " firstName: " ++ firstName patient
    putStrLn . prefix . show $ " lastName: " ++ lastName patient
    putStrLn . prefix . show $ " email: " ++ email patient
    putStrLn . prefix . show $ " age: " ++ show (age patient)

    -- SETTERS
    let patientWithCangedEmail =
            patient
                { email = "another.net@gmail.com"
                }

    -- it's not changing anything, it's creation another instance of Patient with changed email (haskell don't support mutability)
    putStrLn ""
    putStrLn . prefix . show $ patientWithCangedEmail
    putStrLn . prefix . show $ " email: " ++ email patient

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Need to mention, that field lables - it's just syntacis suggar, we can do all the same with suck types as with regular adt
--
example2 = do
    let patient =
            Patient
                "John"
                "Doe"
                "john.doe@gmail.com"
                24
                431
                True
                True
    putStrLn . prefix . show $ patient

    -- awful, but if we want)
    let Patient _ _ _ _ _ _ insurance = patient
    putStrLn . prefix . show $ " insurance: " ++ show insurance

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

-- next two statements is equvalet
data Patient1 = Patient1
    { firstName1 :: String
    , lastName1 :: String
    , email1 :: String
    , age1 :: Int
    , diseaseId1 :: Int
    , isIndoor1 :: Bool
    , hasInsurance1 :: Bool
    }

data Patient2 = Patient2
    { firstName2
      , lastName2
      , email2 ::
        String
    , age2
      , diseaseId2 ::
        Int
    , isIndoor2
      , hasInsurance2 ::
        Bool
    }
