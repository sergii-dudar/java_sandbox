prefix :: String -> String
prefix str = "--->>> :" ++ str

type Chapters = [(FilePath, String)]

chapters :: Chapters
chapters =
    [ ("/list.html", ":list")
    , ("/tuple.html", ":tuple")
    , ("/hof.html", ":hof")
    ]

-- functtion to get chapter name by path
lookupChapterNameBy :: FilePath -> Chapters -> String
lookupChapterNameBy _ [] = "" -- nothing found (bad way)
lookupChapterNameBy path ((realPath, name) : others)
    | path == realPath = name -- found by name
    | otherwise = lookupChapterNameBy path others

example1 = do
    putStrLn . prefix $
        (if null name then "No such chapter, sorry..." else "This is chapter name: " ++ name)
  where
    name = lookupChapterNameBy "/tuple.html" chapters

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- customr Optional type
data Optional
    = NoSuchChapter
    | Chapter String -- here only one issue, why optional supported only `String`

{-
data Optional = NoSuchChapter | Chapter      String

     имя типа   нульарный       унарный      поле
                конструктор     конструктор  типа
                значения        значения     String
-}

lookupChapterNameByBetter :: FilePath -> Chapters -> Optional
lookupChapterNameByBetter _ [] = NoSuchChapter -- Nothing found
lookupChapterNameByBetter path ((realPath, name) : others)
    | path == realPath = Chapter name -- read name found
    | otherwise = lookupChapterNameByBetter path others

example2 = do
    putStrLn . prefix $
        case result of
            NoSuchChapter -> "No such chapter, sorry..."
            Chapter name -> "This is chapter name: " ++ name
  where
    result = lookupChapterNameByBetter "/tuple.html" chapters

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Maybe (built in): data Maybe a = Nothing | Just a
-- Maybe - it's constructor type

{-
              ______________________________
             /                              `v

data Maybe  a        = Nothing   | Just      a

     к-тор  типовая    нульарный   унарный   поле
     типа   заглушка   к-тор       к-тор     типа
                       значения    значения  a

Здесь присутствует уже знакомая нам типовая заглушка a, она-то и делает Maybe конструктором типа. Как мы помним, на место типовой заглушки всегда встаёт какой-то тип.
-}

type MString = Maybe String
type MInteger = Maybe Integer

lookupChapterNameByMaybe :: FilePath -> Chapters -> Maybe String -- new constructed type (Maybe String)
lookupChapterNameByMaybe _ [] = Nothing -- nothing found
lookupChapterNameByMaybe path ((realPath, name) : others)
    | path == realPath = Just name
    | otherwise = lookupChapterNameByMaybe path others

{-
Maybe it's kind on special type of function, that applying not to value, but to types (like String, Int etc)

Maybe    String = Maybe String
Maybe    Text   = Maybe Text
типовая  тип    = другой тип
функция

Какой тип подставляем на место a, такой тип и станет опциональным. В этом и заключается красота конструкторов типов, ведь они дают нам колоссальный простор для творчества.
-}

example3 = do
    putStrLn . prefix $
        case result of
            Nothing -> "No such chapter, sorry..."
            Just name -> "This is chapter name: " ++ name
  where
    result = lookupChapterNameByMaybe "/tuple.html" chapters

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example4 = do
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example5 = do
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
