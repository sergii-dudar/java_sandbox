-- Стандартный модуль для работы со списками.
import Data.List

example1 = do
    let list1 = [1, 2, 3]
    let list2 = [1.3, 45.7899]
    let list3 = ['H']
    let list4 = ["TCP", "UDP", "DCCP", "SCTP"]
    let list5 =
            [ ["DHCP", "FTP", "HTTP"]
            , ["TCP", "UDP", "DCCP", "SCTP"]
            , ["ARP", "NDP", "OSPF"]
            ]
    let list6 = []

    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example2 = do
    putStrLn ("head: " ++ head ["Vim", "Emacs", "Atom"])
    putStrLn ("tail: " ++ show (tail ["Vim", "Emacs", "Atom"]))
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

handleTableRow :: String -> String
handleTableRow row
    | length row == 2 = "composeTwoOptionsFrom: " ++ row
    | length row == 3 = "composeThreeOptionsFrom: " ++ row
    | otherwise = "invalidRow: " ++ row

--------
handleTableRow2 :: String -> String
handleTableRow2 row
    | size == 2 = "composeTwoOptionsFrom: " ++ row
    | size == 3 = "composeThreeOptionsFrom: " ++ row
    | otherwise = "invalidRow: " ++ row
  where
    size = length row

--------
handleTableRow3 :: String -> String
handleTableRow3 row
    | twoOptions = "composeTwoOptionsFrom: " ++ row
    | threeOptions = "composeThreeOptionsFrom: " ++ row
    | otherwise = "invalidRow: " ++ row
  where
    size = length row -- Узнаём длину
    twoOptions = size == 2 -- ... сравниваем
    threeOptions = size == 3 -- ... и ещё раз

example3 = do
    let list = ["TCP", "UDP", "DCCP", "SCTP"]
    let index = 0
    let first = list !! index
    putStrLn ("--->>> :" ++ (handleTableRow first))

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- list operators:
-- :    element : [list] - add element to start
-- ++ add to end
-- insertAt: add at specific palce

addToStart :: String -> [String] -> [String]
addToStart newHost hosts = newHost : hosts

addToEnd :: String -> [String] -> [String]
addToEnd newHost hosts = hosts ++ [newHost]

insertAt :: Int -> a -> [a] -> [a]
insertAt n x xs = take n xs ++ [x] ++ drop n xs

example4 = do
    let hosts = ["45.67.78.89", "123.45.65.54"]
    putStrLn ("addToStart: " ++ show ("124.67.54.90" `addToStart` hosts))
    putStrLn ("addToStart: " ++ show ("124.67.54.90" `addToEnd` hosts))
    putStrLn ("insertAt: " ++ show (insertAt 1 "124.67.54.90" hosts))

----------------------------------------------------------------------------
----------------------------------------------------------------------------
---------------- LIST ENUMERATIONS (RANGES)

example5 = do
    putStrLn ("--->>> :" ++ show [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
    putStrLn ("--->>> :" ++ show [1 .. 10])
    putStrLn ("--->>> :" ++ show [3 .. 17])
    -- smart ranges
    putStrLn ("--->>> :" ++ show [2, 4 .. 10])
    putStrLn ("--->>> :" ++ show [3, 9 .. 28])
    putStrLn ("--->>> :" ++ show [9, 8 .. 1])
    putStrLn ("--->>> :" ++ show [-9, -8 .. -1])
    putStrLn ("--->>> :" ++ show [1.02, 1.04 .. 1.16])
    putStrLn ("--->>> :" ++ show ['a' .. 'z'])
    putStrLn ("--->>> :" ++ show ['a', 'c' .. 'z'])
    putStrLn ("--->>> :" ++ show [120, 110 .. 10])
    -- unfinity ranges and lazy
    putStrLn ("--->>> :" ++ show (take 5 [1 ..]))
    putStrLn ("--->>> :" ++ show (take 5 [2, 4 ..]))

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
