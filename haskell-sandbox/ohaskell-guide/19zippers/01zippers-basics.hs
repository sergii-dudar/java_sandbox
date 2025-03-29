{-
        A `Zipper` in Haskell is a functional data structure that provides a way to traverse and modify
    complex structures efficiently, such as trees or lists, while maintaining context. It enables
    localized updates without the need to rebuild the entire structure.

    [Concept]
    A zipper consists of:

    1. A focus: The current element being accessed.
    2. A context: A structure that stores information about how to reconstruct the data when moving back.

        By maintaining context separately, zippers allow efficient navigation and modifications in a
    purely functional way.
-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- zipper for a list

data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)

-- type ZipperList a = ([a], [a])

-- goForward :: ZipperList a -> ZipperList a
goForward :: ([a], [a]) -> ([a], [a])
goForward (x : xs, bs) = (xs, x : bs)

{-
    goForward:
    - Takes a zipper (x:xs, bs), where `x` is the current focus.
    - Moves the focus forward by:
        - Removing x from the first list.
        - Pushing x onto the second list.
-}

goBack :: ([a], [a]) -> ([a], [a])
goBack (xs, b : bs) = (b : xs, bs)

{-
    goBack:
    - Moves the focus `backward` by:
        Taking the last stored element `b` from history.
        Prepending b back to the main list.
-}
example1 = do
    putStrLn "--->>> Zipper simple:"
    print (goForward ([1, 2, 3, 4], [])) -- ([2,3,4],[1])
    -- Moves the focus to 2, keeping 1 in history:
    -- ([1, 2, 3, 4], [])
    -- (x :        xs, bs) = (       xs, x : bs)
    -- (1 : [2, 3, 4], []) = ([2, 3, 4], 1 : [])
    -- result: ([2, 3, 4], [1])
    --
    print (goBack ([4], [3, 2, 1])) -- ([3,4],[2,1])
    -- Moves back, making 3 the new focus.
    -- ([4],  [3, 2, 1])
    -- ( xs, b :     bs) = (b : xs, bs)
    -- ([4], 3 : [2, 1]) = (3 : [4], [2, 1])
    -- result: ([3, 4], [2, 1])
    --

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- another example:
{-
    Consider a list: [1, 2, 3, 4, 5]
    A zipper representation splits it into: ([1], 2, [3, 4, 5]) -- (Left context, Focus, Right context)

    where:
    1 is stored in the left context (elements before the focus).
    2 is the focus (current element).
    [3, 4, 5] is the right context (elements after the focus).
-}
-- implementation:

type Zipper a = ([a], a, [a]) -- (Left, Focus, Right)

moveRight :: Zipper a -> Maybe (Zipper a)
moveRight (l, x, r : rs) = Just (x : l, r, rs)
moveRight _ = Nothing -- Can't move right

moveLeft :: Zipper a -> Maybe (Zipper a)
moveLeft (l : ls, x, r) = Just (ls, l, x : r)
moveLeft _ = Nothing -- Can't move left

modify :: (a -> a) -> Zipper a -> Zipper a
modify f (l, x, r) = (l, f x, r)

example2 = do
    print (moveRight ([1], 2, [3, 4, 5]))
    print (moveLeft ([1], 2, [3, 4, 5]))

main = do
    putStrLn ">>>>>--------------EXAMPLE1--------------<<<<<"
    example1
    putStrLn "\n>>>>>--------------EXAMPLE2--------------<<<<<"
    example2
