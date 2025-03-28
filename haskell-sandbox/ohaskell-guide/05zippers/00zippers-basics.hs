data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)
type ZipperList a = ([a], [a])

goForward :: ZipperList a -> ZipperList a
goForward (x : xs, bs) = (xs, x : bs)

goBack :: ZipperList a -> ZipperList a
goBack (xs, b : bs) = (b : xs, bs)

example1 = do
    putStrLn "--->>> :"
    let list_Ex = [1, 2, 3, 4]
    print (goForward (list_Ex, []))
    print (goBack ([4], [3, 2, 1]))

----------------------------------------------------------------------------
----------------------------------------------------------------------------

example2 = do
    putStrLn "--->>> :"

main = do
    putStrLn ">>>>>--------------EXAMPLE1--------------<<<<<"
    example1
    putStrLn "\n>>>>>--------------EXAMPLE2--------------<<<<<"
    example2

