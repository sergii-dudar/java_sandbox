import Data.Char
import Data.List (isPrefixOf, isSuffixOf)

{-

    List Comprehension: is like combination `map` and `filter` inside list declaration
    declarations:
                 [OPERATION ELEM | ELEM <- LIST]
                 [OPERATION ELEM | ELEM <- LIST, PREDICATE]
                 [OPERATION_with_ELEMs | ELEM1 <- LIST1, ..., ELEMN <- LISTN ]

-}

startswith :: String -> String -> Bool
startswith = isPrefixOf

endswith :: String -> String -> Bool
-- endswith suffix str = suffix == drop (length str - length suffix) str
endswith = isSuffixOf

prefix :: String -> String
prefix str = "--->>> :" ++ str

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- MAP

example1 = do
    -- print $ endswith "text" "sometext"
    putStrLn . prefix . show $ [toUpper c | c <- "http"] -- HTTP

    -- add predicate
    putStrLn . prefix . show $ [toUpper c | c <- "http", c == 't'] -- TT

    -- couple predicates (separated by commas, same and &&)
    putStrLn . prefix . show $ [toUpper c | c <- "http", c /= 't', c /= 'p'] -- H
    -- && directrly
    putStrLn . prefix . show $ [toUpper c | c <- "http", c /= 't' && c /= 'p'] -- H

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- More lists in expression

example2 = do
    let names = ["James", "Victor", "Denis", "Michael"]
    let namePrefix = ["Mr. "] -- ["Mr. ", "Sir "]
    -- merging two lists (like cross join)
    putStrLn . prefix . show $
        [ prefix ++ name
        | name <- names
        , prefix <- namePrefix
        ] -- ["Mr. James","Mr. Victor","Mr. Denis","Mr. Michael"]

    -- add predicated
    putStrLn . prefix . show $
        [ prefix ++ name
        | name <- names
        , prefix <- ["Mr. ", "Sir "]
        , name /= "Denis" && prefix /= "Sir "
        ] -- ["Mr. James","Mr. Victor","Mr. Michael"]

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- More lists another predicates and exmpressions

example3 = do
    let cars = ["Mercedes", "BMW", "Bentley", "Audi", "Bentley"]

    -- predicate is not all the time match what we want, we can use regular expressions (for example if-else)
    putStrLn . prefix . show $ [if car == "Bentley" then "Wow!" else "Good!" | car <- cars] --
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Add local exmpressions: simple

example4 = do
    putStrLn . prefix . show $
        [ toUpper c
        | c <- "http"
        , let hletter = 'h' in c /= hletter
        ] -- "TTP"

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Add local exmpressions: more advanced

checkGooglerBy :: String -> String
checkGooglerBy email =
    if email `endWith` "gmail.com"
        then nameFrom email ++ " is a Googler!"
        else email
  where
    endWith str suffix = endswith suffix str
    -- nameFrom fullEmail = takeWhile (/= '@') fullEmail
    nameFrom = takeWhile (\x -> x /= '@') -- [ takeWhile PREDICATE LIST ] : richard@gmail.com -> richard

example5 = do
    let emails = ["adam@gmail.com", "bob@yahoo.com", "richard@gmail.com", "elena@test.com", "denis@gmail.com"]
    putStrLn . prefix . show $
        [ checkGooglerBy email
        | email <- emails
        ] -- ["adam is a Googler!","bob@yahoo.com","richard is a Googler!","elena@test.com","denis is a Googler!"]

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

