prefix :: String -> String
prefix str = "--->>> :" ++ str

-- instead of type `data`, presents also `newtype`, the similar, also `data` can be used instead `newtype`, but not vie versa.
-- `newtype` can have only one argument constructor, and with only one argument!

-- newtype IPAddress = IP String | Localhost - error, only one type constructor
-- newtype EndPoint = EndPoint String Int - error, ctor with only one arg
-- newtype HardDay = Monday - nullar value (enum) also can't be used, only single arg ctor

newtype IPAddress = IP String deriving (Show)

-- or with label
newtype IPAddress2 = IP2 {value2 :: String} deriving (Show)

example1 = do
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- why it's need?
-- data IPAddress = IP String       - it's new selfdescribed type
-- newtype IPAddress = IP String    - it's just wrapper around existing string (named wrapper!)

example2 = do
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- example

newtype Project = Project String deriving (Show)
newtype Limit = Limit Int

getBuildsInfo :: Project -> Limit -> String
getBuildsInfo project limit = "Test"

example3 = do
    let info =
            getBuildsInfo
                (Project "ohaskell.guide")
                (Limit 4)
    putStrLn . prefix . show $ info

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- bad example (without newtype named wrappers)

getArtifactsBad :: String -> Int -> Int -> [Project]
getArtifactsBad projectName limit offset = [Project "proj1", Project "proj2", Project "proj3"]

example4 = do
    let badProject = "ohaskell.guide"
    let badLimit = 4
    let badOffset = 1
    -- we passed offset to limit, and limit to offset, and compiler is happy
    let badInfo = getArtifactsBad badProject badOffset badLimit
    putStrLn . prefix . show $ badInfo

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- good example (with newtype named wrappers)

newtype Offset = Offset Int
newtype ProjectName = ProjectName String

getArtifactsGood :: ProjectName -> Limit -> Offset -> [Project]
getArtifactsGood projectName limit offset = [Project "proj1", Project "proj2", Project "proj3"]

example5 = do
    let project = ProjectName "ohaskell.guide"
    let limit = Limit 4
    let offset = Offset 1
    let badInfo = getArtifactsGood project limit offset
    putStrLn . prefix . show $ badInfo

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example6 = do
    putStrLn "--->>> :"

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example7 = do
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
    putStrLn "\n>>>>>--------------EXAMPLE7--------------<<<<<"
    example7
