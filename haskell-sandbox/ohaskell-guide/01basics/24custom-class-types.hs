prefix :: String -> String
prefix str = "--->>> :" ++ str

type SHU = Integer -- SHU (Scoville Heat Units)

-- define class types
class Pepper pepper where
    color :: pepper -> String
    pungency :: pepper -> SHU

-- define couple types from class type
data Poblano = Poblano -- распространён в национальных блюдах Мексики
data TrinidadScorpion = TrinidadScorpion -- самый жгучий перец в мире

instance Pepper Poblano where
    color Poblano = "green"
    pungency Poblano = 1500

instance Pepper TrinidadScorpion where
    color TrinidadScorpion = "red"
    pungency TrinidadScorpion = 855000

-- work with new types
example1 = do
    let trinidad = TrinidadScorpion
    putStrLn . prefix $ show (pungency trinidad) ++ ", " ++ color trinidad

----------------------------------------------------------------------------
----------------------------------------------------------------------------

pepperInfo :: (Pepper pepper) => pepper -> String
pepperInfo pepper = show (pungency pepper) ++ ", " ++ color pepper

example2 = do
    putStrLn . prefix $ pepperInfo TrinidadScorpion
    putStrLn . prefix $ pepperInfo Poblano

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Class type also can be declared with context type with restrictions

class (Pepper pepper) => Chili1 pepper where
    kind :: pepper -> String

class (Pepper pepper, Chili1 pepper) => Chili2 pepper where
    kind2 :: pepper -> String

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

