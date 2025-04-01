import Control.Arrow
import Control.Monad
import Control.Monad.Trans.Maybe

{-
    The "Arrow" type class generalizes functions (a -> b) and allows working with computations that carry extra context.
        Unlike "Monad", which represents sequencing of computations, "Arrow" focuses on composable data transformations.

    Definition:
        ---------------------------------------------------------
        class Category arr => Arrow arr where
            arr  :: (b -> c) -> arr b c
            (***) :: arr b c -> arr b' c' -> arr (b, b') (c, c')
            (&&&) :: arr b c -> arr b c' -> arr b (c, c')
        ---------------------------------------------------------
            arr: Lifts a function into an arrow.
            (***): Applies two arrows in parallel, keeping inputs and outputs paired.
            (&&&): Splits input and applies two arrows to the same input.

    📌 Arrows are useful when Monad is too restrictive, such as in parsing, stream processing,
        and functional reactive programming.

    INFO: Why Use Arrow?

        - More general than Monad (allows composable computations).
        - Supports parallelism (***).
        - Used in parsers, stream processing, and FRP.

    💡 Arrows are powerful for functional pipelines where monads are too restrictive! 🚀

    INFO: Arrow vs. Monad

      -----------------------------------------------------------------------------------
        Feature                         | Arrow         | Monad
      -----------------------------------------------------------------------------------
      -----------------------------------------------------------------------------------
        Composition                     | ✅ (>>>, <<<) | ✅ (>>=, do)
      ----------------------------------|---------------|--------------------------------
        Parallelism                     | ✅ (***, &&&) | ❌
      ----------------------------------|---------------|--------------------------------
        Works with Pure Functions       | ✅            | ❌ (Monads must have context)
      ----------------------------------|---------------|--------------------------------
        Expresses Dataflow              | ✅            | ❌
      ----------------------------------|---------------|--------------------------------
        Expresses Computation Sequence  | ❌            | ✅
      -----------------------------------------------------------------------------------

    📌 Monad is great for sequencing, while Arrow is better for data flow and parallelism.

-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 1. Basic Example (Functions as Arrows)
{-
    Since (->) (regular functions) form an instance of Arrow, we can use:
-}

double :: Int -> Int
double x = x * 2

increment :: Int -> Int
increment x = x + 1

combined :: (Int, Int) -> (Int, Int)
combined = double *** increment -- Applies double to fst, increment to snd

example1 = do
    putStrLn "--->>> 1. Basic Example (Functions as Arrows):"
    print $ combined (3, 4) -- Result: (6, 5)

{-
    📌 Explanation:
        - double *** increment means apply double to the first part and increment to the second.
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 2. Using arr to Lift Functions

lifted :: (Arrow arr) => arr Int Int
lifted = arr (* 2) -- Lifts the function `(*2)`

runLifted :: Int -> Int
runLifted = lifted -- Works like a normal function

example2 = do
    putStrLn "--->>> 2. Using arr to Lift Functions:"
    print $ lifted 3 -- Result: 6
    print $ runLifted 3 -- Result: 6

{-
    📌 Explanation:
        - arr (*2) converts (*2) into an arrow computation.
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 3. Using (&&&) to Duplicate Input

dup :: Int -> (Int, Int)
dup = double &&& increment -- Apply both to same input

example3 = do
    putStrLn "--->>> 3. Using (&&&) to Duplicate Input:"
    print $ dup 5 -- Result: (10, 6)

{-
    📌 Explanation:
        - "double &&& increment" means apply both functions to the same input.
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 4. Practical Use Cases
{-
    Using Arrows for Parsing (Kleisli Arrows)
-}

safeDiv :: Int -> Int -> Maybe Int
safeDiv _ 0 = Nothing
safeDiv x y = Just (x `div` y)

safeDivArrow :: Kleisli Maybe (Int, Int) Int
safeDivArrow = Kleisli (uncurry safeDiv)

example4 = do
    putStrLn "--->>> 4. Practical Use Cases:"
    print $ runKleisli safeDivArrow (10, 2) -- Result: Just 5
    print $ runKleisli safeDivArrow (10, 0) -- Result: Nothing

{-
    📌 Explanation:
        - Kleisli Maybe (Int, Int) Int represents a function that returns Maybe.
        - Avoids direct Monad usage.
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 5. Arrows in Stream Processing (Example: Data Transformation Pipeline)
{-
    Problem:
    We have a stream of sensor data (timestamp, temperature) and want to:
        - Normalize temperatures from Fahrenheit to Celsius.
        - Filter out abnormal temperatures (> 100°C).
        - Format the output as a string.

    Solution using Arrow:
-}

type TempPipeline a b = a -> b

fahrenheitToCelsius :: TempPipeline Double Double
fahrenheitToCelsius f = (f - 32) * 5 / 9

filterHighTemps :: TempPipeline Double (Maybe Double)
filterHighTemps t = if t > 100 then Nothing else Just t

formatOutput :: TempPipeline (Maybe Double) String
formatOutput (Just t) = "Temperature: " ++ show t ++ "°C"
formatOutput Nothing = "Warning: Abnormal temperature!"

processStream :: TempPipeline Double String
processStream = arr fahrenheitToCelsius >>> arr filterHighTemps >>> arr formatOutput

example5 = do
    putStrLn "--->>> 5. Arrows in Stream Processing (Example: Data Transformation Pipeline):"
    print $ processStream 212 -- "Warning: Abnormal temperature!"
    print $ processStream 98.6 -- "Temperature: 37.0°C"
    {-
        📌 How it works:
            - We chain arrows (>>>) to build a pipeline.
            - Each step transforms the data, much like Unix pipes (|).
            - This approach scales well for streaming data.
    -}

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
