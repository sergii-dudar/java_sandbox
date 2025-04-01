import Data.Foldable

{-
    "for_" is a function from the "Control.Monad" module that allows you to
    iterate over a list (or any "Foldable" structure) while ignoring the result.
    It's often used for performing side effects, like printing to the console.

    Type Signature:
        ----------------------------------------------------
        for_ :: (Foldable t, Applicative f) => t a -> (a -> f b) -> f ()
        ----------------------------------------------------
        - It takes:
            1. A foldable structure (t a), like a list [a]
            2. A function (a -> f b), which is an action that returns an effectful result (f b)

        - It returns: f (), meaning it runs the effects but discards the results.

        INFO: When to Use for_?

        1. When you need to perform side effects on each element of a list but don’t care about the results.
        2. When using "Maybe", "Either", or other "Foldable" structures.
        3. If you're dealing with monads, "forM_" is more explicit.
-}
----------------------------------------------------------------------------
----------------- Example Usage --------------------------------------------
----------------------------------------------------------------------------
-- INFO: 1. Iterating Over a List (Similar to for-each in Java)

example1 = do
    putStrLn "--->>> 1. Iterating Over a List (Similar to for-each in Java) :"
    let names = ["Alice", "Bob", "Charlie"]
    for_ names putStrLn

{-
    - "for_ names putStrLn" applies "putStrLn" to each item, like "for-each" in Java.
    - It ignores the results of "putStrLn", just like "void" functions in Java.

    alternative of:
        -------------------------------
        List<String> names = List.of("Alice", "Bob", "Charlie");
        for (String name : names) {
            System.out.println(name);
        }
        -------------------------------
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 2. Using for_ in the Maybe Context

example2 = do
    putStrLn "--->>> 2. Using for_ in the Maybe Context:"
    let maybeNames = Just ["Alice", "Bob", "Charlie"]
    for_ maybeNames print -- Works like for-each, but only if Just

{-
    - If maybeNames is Nothing, for_ does nothing.
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 3. for_ vs forM_
{-
    - "for_" is the same as "forM_", but slightly more general ("for_" works with any "Foldable",
        while "forM_" is specific to monadic contexts).
    - You can replace "for_" with "forM_" in most cases:
-}

example3 = do
    putStrLn "--->>> :"
    let names = ["Alice", "Bob", "Charlie"]
    forM_ names putStrLn -- Same as for_

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO:
{-

-}

example4 = do
    putStrLn "--->>> :"

{-

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
