prefix :: String -> String
prefix str = "--->>> :" ++ str

{-
    How Undo/Redo Works
       - We store previous states of the text in a history stack.
       - Undo restores the previous state.
       - Redo restores a state that was undone.
-}

type TextZipper = (String, String) -- (Left Context, Right Context)
type History = [TextZipper] -- Stack of past states

-- Editor: Holds the current text, an undo history, and a redo history.
data Editor = Editor
    { textZipper :: TextZipper
    , undoStack :: History
    , redoStack :: History
    }
    deriving (Show)

-- Move cursor left
moveLeft :: Editor -> Editor
moveLeft (Editor (l : ls, rs) undo redo) = Editor (ls, l : rs) ((l : ls, rs) : undo) []
moveLeft editor = editor -- Can't move left

-- Move cursor right
moveRight :: Editor -> Editor
moveRight (Editor (ls, r : rs) undo redo) = Editor (r : ls, rs) ((ls, r : rs) : undo) []
moveRight editor = editor -- Can't move right

-- Insert a character at the cursor
insertChar :: Char -> Editor -> Editor
insertChar c (Editor (ls, rs) undo redo) = Editor (c : ls, rs) ((ls, rs) : undo) []

-- Delete the character before the cursor (Backspace)
deleteChar :: Editor -> Editor
deleteChar (Editor (_ : ls, rs) undo redo) = Editor (ls, rs) ((ls, rs) : undo) []
deleteChar editor = editor -- Nothing to delete

-- Undo last operation
undo :: Editor -> Editor
undo (Editor current (prev : undos) redos) = Editor prev undos (current : redos)
undo editor = editor -- Nothing to undo

-- Redo last undone operation
redo :: Editor -> Editor
redo (Editor current undos (next : redos)) = Editor next (current : undos) redos
redo editor = editor -- Nothing to redo

-- Get current text from zipper
getText :: Editor -> String
getText (Editor (ls, rs) _ _) = reverse ls ++ rs

-- Initial editor state
startEditor :: String -> Editor
startEditor text = Editor ("", text) [] []

example1 = do
    let editor0 = startEditor "Hello"
    let editor1 = moveRight editor0 -- Cursor after 'H'
    let editor2 = moveRight editor1 -- Cursor after 'e'
    let editor3 = insertChar 'X' editor2 -- Insert 'X' after 'e'
    let editor4 = deleteChar editor3 -- Backspace 'X'
    let editor5 = undo editor4 -- Undo (Restore 'X')
    let editor6 = redo editor5 -- Redo (Delete 'X' again)
    putStrLn $ "Step 1: " ++ getText editor1
    putStrLn $ "Step 2: " ++ getText editor2
    putStrLn $ "Step 3: " ++ getText editor3
    putStrLn $ "Step 4: " ++ getText editor4
    putStrLn $ "Undo  : " ++ getText editor5
    putStrLn $ "Redo  : " ++ getText editor6

main = do
    putStrLn ">>>>>--------------EXAMPLE1--------------<<<<<"
    example1
