prefix :: String -> String
prefix str = "--->>> :" ++ str

type SHU = Integer -- SHU (Scoville Heat Units)

-- define class types
class Pepper pepper where
    simple :: pepper -- requiring constant value declarations
    color :: pepper -> String
    pungency :: pepper -> SHU
    name :: pepper -> String

-- define couple types from class type
newtype Poblano = Poblano String deriving (Show)
newtype TrinidadScorpion = TrinidadScorpion String deriving (Show)

instance Pepper Poblano where
    simple = Poblano "ancho" -- set simple value (in current case it's instance of our type)
    color (Poblano name) = "green"
    pungency (Poblano name) = 1500
    name (Poblano name) = name

instance Pepper TrinidadScorpion where
    simple = TrinidadScorpion "scorpion" -- set simple value (in current case it's instance of our type)
    color (TrinidadScorpion name) = "red"
    pungency (TrinidadScorpion name) = 855000
    name (TrinidadScorpion name) = name

pepperInfo :: (Pepper pepper) => pepper -> String
pepperInfo pepper = show (pungency pepper) ++ ", " ++ color pepper ++ ", " ++ name pepper

-- work with constant
example1 = do
    -- we can access constant directly by type
    putStrLn . prefix . show $ (simple :: Poblano)
    putStrLn . prefix . show $ pepperInfo (simple :: Poblano)
    putStrLn . prefix . show $ (simple :: TrinidadScorpion)
    putStrLn . prefix . show $ pepperInfo (simple :: TrinidadScorpion)

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example5 = do
    putStrLn "--->>> :"

main = do
    putStrLn ">>>>>--------------EXAMPLE1--------------<<<<<"
    example1
    putStrLn "\n>>>>>--------------EXAMPLE2--------------<<<<<"
