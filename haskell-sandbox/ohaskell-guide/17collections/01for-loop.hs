import Control.Monad

{-
    Haskell doesn't have traditional "for" or "for-each" loops like Java, since it's a functional language that
    avoids explicit mutation. However, you can achieve similar behavior using higher-order functions like:
    map, forM_, foldl, and list comprehensions.

       ------------------------------------------------------------------------------
        Java Loop                     | Haskell Equivalent
       ------------------------------------------------------------------------------
       ------------------------------------------------------------------------------
        for (int i = 0; i < n; i++)   | forM_ [0..n-1] print
       -------------------------------|----------------------------------------------
        for (T item : collection)     | forM_ collection action
       -------------------------------|----------------------------------------------
        for loop with sum             | sum list or foldl (+) 0 list
       -------------------------------|----------------------------------------------
        for loop with index           | zipWithM_ (\i x -> action i x) [0..] list
       ------------------------------------------------------------------------------
-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 1. Java for loop equivalent

example1 = do
    putStrLn "--->>> 1. Java for loop equivalent: "
    forM_ [0 .. 9] print

{-
    - forM_ is like a for-each but works in monads (like IO).
    - [0..9] generates a list of numbers from 0 to 9.
    - print is applied to each element.

    alternative of:
            --------------------------------
            for (int i = 0; i < 10; i++) {
                System.out.println(i);
            }
            --------------------------------
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 2. Java for-each loop equivalent

example2 = do
    putStrLn "--->>> 2. Java for-each loop equivalent:"
    let names = ["Alice", "Bob", "Charlie"]
    forM_ names putStrLn

{-
    - forM_ iterates over names, applying putStrLn (like System.out.println).

    alternative of:
    --------------------------------------
    List<String> names = List.of("Alice", "Bob", "Charlie");
    for (String name : names) {
        System.out.println(name);
    }
    --------------------------------------
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 3. Java for loop with accumulation (sum example)

example3 = do
    putStrLn "--->>> 3. Java for loop with accumulation (sum example):"
    print (sum [1 .. 10])
    -- or
    print (foldl (+) 0 [1 .. 10]) -- foldl (+) 0 accumulates a sum like a loop would.

{-
    alternative of:
    ---------------------------------------------
    int sum = 0;
    for (int i = 1; i <= 10; i++) {
        sum += i;
    }
    System.out.println(sum);
    ---------------------------------------------
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO: 4. Java for loop with an index (zipWithM_)
{-
    If you need an explicit index:
-}

example4 = do
    putStrLn "--->>> 4. Java for loop with an index (zipWithM_):"
    let items = ["Apple", "Banana", "Cherry"]
    zipWithM_ (\i item -> putStrLn (show i ++ ": " ++ item)) [0 ..] items

{-
    - zipWithM_ combines indices [0..] with items, mimicking for (int i = 0; i < items.length; i++).
-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- INFO:
{-

-}

example5 = do
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
    putStrLn "\n>>>>>--------------EXAMPLE5--------------<<<<<"
    example5
