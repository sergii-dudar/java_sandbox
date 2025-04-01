import Control.Applicative

-- import Data.Attoparsec.Text
import Data.Text (pack)

{-
    The "Alternative" type class is an extension of "Applicative", providing a way to "combine computations"
        and define "empty values".

    Definition:
        ----------------------------------------
        class Applicative f => Alternative f where
            empty :: f a
            (<|>) :: f a -> f a -> f a
        ----------------------------------------
        empty: Represents a failure or neutral element.
        (<|>): Chooses the first non-empty result (like an OR operation).

    INFO: Alternative Laws

    1. Identity:
        empty <|> x == x
        x <|> empty == x

        (Empty is neutral.)

    2. Associativity:
        (x <|> y) <|> z == x <|> (y <|> z)

        (Grouping does not change the result.)

    INFO: Alternative vs. MonadPlus

      ----------------------------------------
        Feature | Alternative   | MonadPlus
      ----------------------------------------
      ----------------------------------------
        Extends | Applicative   | Monad
      ----------|---------------|-------------
        `<      | >`            | ✅ (choice)
      ----------|---------------|-------------
        empty   | ✅            | ✅
      ----------|---------------|-------------
        mfilter | ❌            | ✅
      ----------------------------------------

    INFO: Why Use Alternative?

    - Defines a fallback mechanism (<|>).
    - Useful for parsing, error handling, and search.
    - Works with "Applicative effects".

    💡 Alternative provides choice and failure handling in computations! 🚀

-}

----------------------------------------------------------------------------
------------------ Examples of Alternative Instances -----------------------
----------------------------------------------------------------------------
-- INFO: 1. Alternative for Maybe

example1 = do
    putStrLn "--->>> 1. Alternative for Maybe:"
    print $ Just 5 <|> Just 10 -- Result: Just 5
    print $ Nothing <|> Just 10 -- Result: Just 10
    print $ (Nothing <|> Nothing :: Maybe Int) -- Result: Nothing

{-
    📌 Explanation:
        1. Chooses the first Just value.
        2. If both are Nothing, the result is Nothing.
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 2. Alternative for Lists

example2 = do
    putStrLn "--->>> 2. Alternative for Lists:"
    print $ [1, 2] <|> [3, 4] -- Result: [1,2,3,4]
    print $ [] <|> [3, 4] -- Result: [3,4]
    print $ ([] <|> [] :: [Int]) -- Result: []

{-
    📌 Explanation:
        Concatenates lists, treating [] as empty.
-}

main = do
    putStrLn ">>>>>--------------EXAMPLE1--------------<<<<<"
    example1
    putStrLn "\n>>>>>--------------EXAMPLE2--------------<<<<<"
    example2
