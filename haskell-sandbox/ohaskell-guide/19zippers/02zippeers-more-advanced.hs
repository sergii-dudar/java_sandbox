{-
    Imagine a simple `text editor` where a user can move a cursor `left or right` over
    a string and modify the text at the cursor position.

    Zipper Representation: type TextZipper = (String, String)

    - Left Context (before the cursor): String
    - Right Context (after the cursor): String
    - The cursor is between these two parts.

-}
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Implementation:

-- Define the text zipper: (left of cursor, right of cursor)
type TextZipper = (String, String)

-- Move cursor left
moveLeft :: TextZipper -> TextZipper
moveLeft (l : ls, rs) = (ls, l : rs)
moveLeft ([], rs) = ([], rs) -- Can't move left

-- Move cursor right
moveRight :: TextZipper -> TextZipper
moveRight (ls, r : rs) = (r : ls, rs)
moveRight (ls, []) = (ls, []) -- Can't move right

-- Insert character at cursor position
insertChar :: Char -> TextZipper -> TextZipper
insertChar c (ls, rs) = (c : ls, rs)

-- Delete character before cursor (like backspace)
deleteChar :: TextZipper -> TextZipper
deleteChar (_ : ls, rs) = (ls, rs)
deleteChar ([], rs) = ([], rs) -- Nothing to delete

-- Get current text from zipper
getText :: TextZipper -> String
getText (ls, rs) = reverse ls ++ rs

example1 = do
    let start = ("", "Hello World") -- Cursor at beginning
    let step1 = moveRight start -- Move right (Cursor after 'H')
    let step2 = moveRight step1 -- Move right (Cursor after 'e')
    let step3 = insertChar 'X' step2 -- Insert 'X' after 'e'
    let step4 = deleteChar step3 -- Backspace 'X'
    putStrLn $ "Step 1: " ++ show step1
    putStrLn $ "Step 2: " ++ show step2
    putStrLn $ "Step 3: " ++ show step3
    putStrLn $ "Step 4: " ++ show step4
    putStrLn $ "Final Text: " ++ getText step4

{-
    Features:

    ✔ Move Cursor Left/Right
    ✔ Insert Characters at Cursor
    ✔ Backspace (Delete before Cursor)
    ✔ Efficient Modifications Without Rebuilding Strings

    This is how a real-world text editor can be built with Zippers!
-}

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example2 = do
    putStrLn "--->>> :"

main = do
    putStrLn ">>>>>--------------EXAMPLE1--------------<<<<<"
    example1
    putStrLn "\n>>>>>--------------EXAMPLE2--------------<<<<<"
    example2
