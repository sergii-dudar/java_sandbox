import Data.Char
import Data.List

import Data.Map (Map)
import qualified Data.Map as Map -- required for GHCI

import qualified Data.Set as Set

import Custom

-- Here, we have many functions without even defining them. That is because
-- these functions are available in the List module. After importing the
-- List module, the Haskell compiler made all these functions available in
-- the global namespace. Hence, we could use these functions.

example1 = do
    putStrLn "--->>> List Module:"

    putStrLn "Different methods of List Module"
    print (intersperse '.' "Tutorialspoint.com")
    print (intercalate " " ["Lets", "Start", "with", "Haskell"])
    print (splitAt 7 "HaskellTutorial")
    print (sort [8, 5, 3, 2, 1, 6, 4, 2])
    putStrLn ""

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example2 = do
    putStrLn "--->>> Char Module:"
    putStrLn ("Different methods of Char Module")
    print (toUpper 'a')
    print (words "Let us study tonight")
    print (toLower 'A')

----------------------------------------------------------------------------
----------------------------------------------------------------------------
{-
    Map is an unsorted value-added pair type data type. It is a widely used module with many useful functions.
    The following example shows how you can use a predefined function available in the Map module.
-}
myMap :: Integer -> Map Integer [Integer]
myMap n = Map.fromList (map makePair [1 .. n])
  where
    makePair x = (x, [x])
example3 = do
    putStrLn "--->>> Map Module:"
    print (myMap 3)

----------------------------------------------------------------------------
----------------------------------------------------------------------------
{-
    The Set module has some very useful predefined functions to manipulate mathematical data.
    A set is implemented as a binary tree, so all the elements in a set must be unique.
-}
example4 = do
    putStrLn "--->>> Set Module:"
    let text1 = "Hey buddy"
    let text2 = "This tutorial is for Haskell"

    let set1 = Set.fromList text1
        set2 = Set.fromList text2

    print set1
    print set2

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example5 = do
    putStrLn "--->>> Custom Module:"
    print (showEven 4)
    print (showBoolean True)

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

