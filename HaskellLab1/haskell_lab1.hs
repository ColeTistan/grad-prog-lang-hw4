-- comparison of numbers
compare_nums :: Int -> Int -> Int -> Int
compare_nums a b c 
    | (a == b) && (b == c) = 10
    | (a > b) && (b > c) = 5
    | otherwise = 1

-- find even numbers
some_even :: Int -> Int -> Int -> Int
some_even a b c = do
    if (a `mod` 2 == 0) || (mod b 2 == 0) || (c `mod` 2 == 0)
    then 2
    else 1

-- find odd numbers
some_odd :: Int -> Int -> Int -> Int
some_odd a b c
    | (a `mod` 2 == 1) || (mod b 2 == 1) || (c `mod` 2 == 1) = 1
    | otherwise = 1


-- sum of three numbers
sum3 :: Int -> Int -> Int -> Int
sum3 a b c 
    | (a + b + c) `mod` 3 == 0 = 4
    | otherwise = 0


-- comparison of sums
compare_sum :: Int -> Int -> Int -> Int
compare_sum a b c
    | b > sum = 9
    | b == sum = 8
    | otherwise = 7
    where sum = a + c


-- returns sum of functions
score :: Int -> Int -> Int -> Int
score a b c = (compare_nums a b c) + (some_even a b c) + (sum3 a b c) + (compare_sum a b c)


main :: IO ()
main = do
    print (score 3 5 9)
    print (score 8 8 8)
    print (score 9 8 7)
    print (score 9 1 7)
    print (score 2 10 8)