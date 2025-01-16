data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)
type Zipper_List a = ([a], [a])

go_Forward :: Zipper_List a -> Zipper_List a
go_Forward (x : xs, bs) = (xs, x : bs)

go_Back :: Zipper_List a -> Zipper_List a
go_Back (xs, b : bs) = (b : xs, bs)

example1 = do
    putStrLn "--->>> :"
    let list_Ex = [1, 2, 3, 4]
    print (go_Forward (list_Ex, []))
    print (go_Back ([4], [3, 2, 1]))

example2 = do
    putStrLn "--->>> :"

example3 = do
    putStrLn "--->>> :"

example4 = do
    putStrLn "--->>> :"

example5 = do
    putStrLn "--->>> :"

example6 = do
    putStrLn "--->>> :"

example7 = do
    putStrLn "--->>> :"

example8 = do
    putStrLn "--->>> :"

example9 = do
    putStrLn "--->>> :"

example10 = do
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
    putStrLn "\n>>>>>--------------EXAMPLE8--------------<<<<<"
    example8
    putStrLn "\n>>>>>--------------EXAMPLE9--------------<<<<<"
    example9
    putStrLn "\n>>>>>--------------EXAMPLE10--------------<<<<<"
    example10
