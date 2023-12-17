compare_first_last some_list
    | (head some_list) == (last some_list) = return True
    | otherwise = return False


compare_first_last2 nums
    | take 2 nums == drop (length nums - 2) nums = return True
    | take 2 nums == reverse (drop (length nums - 2) nums) = return True
    | otherwise = return False


has_even [] = False
has_even (x:xs) = 
    | x `mod` 2 == 0 = return True
    | otherwise = has_even xs


list_evens [] = []
list_evens (first:rest)
    | first `mod` 2 == 0 = (x : list_evens xs)
    | otherwise = list_evens xs


occurs :: Int -> []
occurs _ [] = 0
occurs num (x:xs) =
    if num == x then 1 + (occurs num xs)
    else occurs num xs