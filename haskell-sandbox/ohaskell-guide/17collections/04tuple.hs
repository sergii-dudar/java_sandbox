import Control.Arrow (first)
import Control.Monad
import Data.Bifunctor (bimap)
import Data.Functor

{-
    INFO: Tuple ((a, b))

    Tuples are not general-purpose collections but useful for storing pairs of values.
-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------
--

example1 = do
    let pair = (1, "one")

    -- Get first and second values
    print (fst pair) -- 1
    print (snd pair) -- "one"

    -- Apply a function to second element
    let pair2 = (2, 10)
    print (fmap (* 2) pair2) -- Output: (2, 20)
    -- Apply a function to firdt element
    print (first (* 2) pair2) -- Output: (4, 10)
    -- Or use bimap from Data.Bifunctor if you want to modify both elements:
    print (bimap (* 2) (* 3) pair2) -- Output: (4, 30)

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example2 = do
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example3 = do
    putStrLn "--->>> :"

main = do
    putStrLn ">>>>>--------------EXAMPLE1--------------<<<<<"
    example1
    putStrLn "\n>>>>>--------------EXAMPLE2--------------<<<<<"
    example2
    putStrLn "\n>>>>>--------------EXAMPLE3--------------<<<<<"
    example3
