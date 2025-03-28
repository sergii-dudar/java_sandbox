example1 = do
    putStrLn "The different operators: "
    let var1 = 2
    let var2 = 3
    print (var1 + var2)
    print (var1 - var2)
    print (var1 * var2)
    print (var1 / var2)
    -- Sequence / Range Operator
    print [1 .. 10]

---------------------------------------------------------
example2 = do
    putStrLn "Decision Making: "
    let var = 22
    -- if (var `mod` 2) == 0
    if even var
        then putStrLn "Number is Even"
        else putStrLn "Number is Odd"

    putStrLn "--->>> :"
    let var = 26

    -- EQ type class is an interface which provides the functionality to test the
    -- equality of an expression. Any Type class that wants to check the equality of
    -- an expression should be a part of this EQ Type Class.
    if 8 /= 8
        then putStrLn "The values are Equal"
        else putStrLn "The values are not Equal"

    -- Ord is another interface class which gives us the functionality of ordering.
    -- All the types that we have used so far are a part of this Ord interface.
    -- Like EQ interface, Ord interface can be called using ">", "<", "<=", ">=", "compare".
    print (4 <= 2)

    if var == 0
        then putStrLn "Number is zero"
        else
            if even var
                then putStrLn "Number is Even"
                else putStrLn "Number is Odd"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

-- In Haskell, every statement is considered as a mathematical expression and the category of this expression is called as a Type. You can say that "Type" is the data type of the expression used at compile time.

-- Integer can be considered as a superset of Int. This value is not bounded by any number, hence an Integer can be of any length without any limitation
-- intType :: Int -> Int -> Int
intType :: Integer -> Integer -> Integer
intType x y = x * x + y * y

floatType2 :: Float -> Float -> Float
floatType2 x y = x * x + y * y

doubleType :: Double -> Double -> Double
doubleType x y = x * x + y * y

-- function to accept Char value and return Char value as output
charType :: Char -> Char
charType x = 'K'

readInt :: String -> Int
readInt = read

example3 = do
    putStrLn "Types and Type Class"
    -- function
    -- let fType x y = x * x + y * y
    putStr "lamda: "
    print (intType 2 4)
    print (intType 212124454 44545454454554545445454544545)
    print (floatType2 2.5 3.8)
    print (doubleType 2.56 3.81)

    -- boolean
    let x = True

    -- if x == False
    if not x
        then putStrLn "X matches with Bool Type"
        else putStrLn "X is not a Bool Type"

    -- char
    let c = 'v'
    print (charType c)

    -- Show - has a functionality to print its argument as a String
    print [1 .. 10]
    print (show [1 .. 10])

    -- Read interface does the same thing as Show, but it won’t print the result
    -- in String format. In the following code, we have used the read interface
    -- to read a string value and convert the same into an Int value.
    print "12"
    print (readInt "12")

    putStrLn "-->> enum:"
    -- Enum is another type of Type class which enables the sequential or ordered
    -- functionality in Haskell. This Type class can be accessed by commands such
    -- as Succ, Pred, Bool, Char, etc.
    print (succ 12)

    putStrLn "-->> int bounds:"
    -- Bounded
    -- All the types having upper and lower bounds come under this Type Class.
    -- For example, Int type data has maximum bound of "9223372036854775807" and minimum bound of "-9223372036854775808".

    -- The following code shows how Haskell determines the maximum and minimum bound of Int type.
    print (maxBound :: Int)
    print (minBound :: Int)

    putStrLn ("--->>> Num:" ++ show 5)
    -- This type class is used for numeric operations. Types such as Int, Integer,
    -- Float, and Double come under this Type class.
    print (2 :: Int)
    print (2 :: Float)

----------------------------------------------------------------------------
----------------------------------------------------------------------------

data Area = Circle Float Float Float
surface :: Area -> Float
surface (Circle _ _ r) = pi * r ^ 2
example4 = do
    putStrLn "--->>> Custom Type Class:"

    -- Like any other programming language, Haskell allows developers to define
    -- user-defined types. In the following example, we will create a user-defined
    -- type and use it.
    print (surface $ Circle 10 20 10)

    -- Here, we have created a new type called Area. Next, we are using this type to
    -- calculate the area of a circle. In the above example, "surface" is a function
    -- that takes Area as an input and produces Float as the output.

    -- Keep in mind that "data" is a keyword here and all user-defined types
    -- in Haskell always start with a capital letter.
    putStrLn ""

example5 = do
    putStrLn "--->>> :"
    putStrLn "Hello, everybody!"
    putStrLn ("Please look at my favorite odd numbers: " ++ show (filter odd [10 .. 20]))
    putStrLn ("Please look at my favorite even numbers: " ++ show (filter even [10 .. 20]))

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example6 = do
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
