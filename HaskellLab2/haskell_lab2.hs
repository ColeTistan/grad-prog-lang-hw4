count_medium1 :: [Int] -> Int
count_medium1 [] = 0
count_medium1 (x:xs) = do
    if x >= 10 && x <= 20 then 1 + count_medium1 xs
    else count_medium1 xs


count_medium2 :: [Int] -> Int
count_medium2 list_count = length (filter (>=10) ((filter (<=20) x)))

plural :: String -> String
plural noun
    | (last noun == 'x' || last noun == 's') || 
        ((last (init noun) == 's' || last (init noun) == 'c') && last noun == 'h') = noun ++ "es"
    | last noun == 'f' = init noun ++ "ves"
    | otherwise = noun ++ "s"

main :: IO ()
main = do
    print (count_medium1 ([13, 10, 57, 2, 19, 20, 100])) --(should return 4)
    print (count_medium1 ([200, 3, 0])) --(should return 0)
    print (count_medium2 ([13, 10, 57, 2, 19, 20, 100])) --(should return 4)
    print (count_medium2 ([200, 3, 0]))--(should return 0)
    print (plural ("cat")) --(should return cats)
    print (plural ("dog")) --(should return dogs)
    print (plural ("box")) --(should return boxes)
    print (plural ("glass")) --(should return glasses)
    print (plural ("wish"))	--(should return wishes)
    print (plural ("inch"))	--(should return inches)
    print (plural ("leaf"))	--(should return leaves)
