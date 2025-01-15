import Data.Char
import Prelude hiding (map)

add :: Integer -> Integer -> Integer -- function declaration
add x y = x + y -- function definition

example1 = do
    putStrLn "--->>> The addition of the two numbers is:"
    print (add 2 5) -- calling a function
    putStrLn ""

factMatching :: Int -> Int
factMatching 0 = 1
factMatching n = n * factMatching (n - 1)

example2 = do
    putStrLn "--->>> Pattern Matching:"
    -- Pattern Matching can be considered as a variant of dynamic polymorphism where
    -- at runtime, different methods can be executed depending on their argument list.
    --
    -- The compiler will start searching for a function called "fact" with an argument.
    -- If the argument is not equal to 0, then the number will keep on calling the same
    -- function with 1 less than that of the actual argument.
    putStrLn ("The factorial of 5 is: " ++ show (factMatching 5))

-- putStrLn ""

-------------------------------------------------------------
factGuard :: Integer -> Integer
factGuard n
    | n == 0 = 1
    | n /= 0 = n * factGuard (n - 1)
example3 = do
    -- Guards is a concept that is very similar to pattern matching. In pattern
    -- matching, we usually match one or more expressions, but we use guards to
    -- test some property of an expression.

    -- Although it is advisable to use pattern matching over guards, but from a
    -- developer’s perspective, guards is more readable and simple. For first-time
    -- users, guards can look very similar to If-Else statements, but they are
    -- functionally different.

    putStr "--->>> Guards: "
    print (factGuard 5)

    -- Here, we have declared two guards, separated by "|" and calling the fact
    -- function from main. Internally, the compiler will work in the same manner as
    -- in the case of pattern matching
    putStrLn ""

-------------------------------------------------------------

-- Where is a keyword or inbuilt function that can be used at runtime to generate
-- a desired output. It can be very helpful when function calculation becomes complex.

-- Consider a scenario where your input is a complex expression with multiple
-- parameters. In such cases, you can break the entire expression into small
-- parts using the "where" clause.

-- In the following example, we are taking a complex mathematical expression.
-- We will show how you can find the roots of a polynomial
-- equation [x^2 - 8x + 6] using Haskell.

roots :: (Float, Float, Float) -> (Float, Float)
roots (a, b, c) = (x1, x2)
  where
    x1 = e + sqrt d / (2 * a)
    x2 = e - sqrt d / (2 * a)
    d = b * b - 4 * a * c
    e = -b / (2 * a)

-- Notice the complexity of our expression to calculate the roots of the given
-- polynomial function. It is quite complex. Hence, we are breaking the
-- expression using the where clause

example4 = do
    putStrLn "--->>> Where Clause: "
    putStrLn "The roots of our Polynomial equation are:"
    print (roots (1, -8, 6))
    putStrLn ""

-------------------------------------------------------------
map :: (a -> b) -> [a] -> [b]
map _ [] = []
map func (x : abc) = func x : map func abc

example5 = do
    putStrLn "--->>> Higher Order Function:"
    print $ map toUpper "tutorialspoint.com"

    putStrLn ""

-------------------------------------------------------------
example6 = do
    putStrLn "--->>> Lambda Expression:"
    -- A lambda function is denoted by "\" character.
    putStr "The successor of 4 is:"
    print ((\x -> x + 1) 4)
    putStrLn ""

example7 = do
    putStrLn "--->>> :"
    putStrLn ""

example8 = do
    putStrLn "--->>> :"
    putStrLn ""

example9 = do
    putStrLn "--->>> :"
    putStrLn ""

example10 = do
    putStrLn "--->>> :"
    putStrLn ""

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
