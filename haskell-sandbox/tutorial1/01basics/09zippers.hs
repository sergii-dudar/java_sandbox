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

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example2 = do
    putStrLn "--->>> :"

main = do
    putStrLn ">>>>>--------------EXAMPLE1--------------<<<<<"
    example1
    putStrLn "\n>>>>>--------------EXAMPLE2--------------<<<<<"
    example2