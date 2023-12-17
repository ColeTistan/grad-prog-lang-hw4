-- HW1 DESCRIPTION - START
-- Write a Haskell program that will analyze a flower garden to
-- determine which of several categories it falls into,
-- based on the heights, colors, and types of flowers in the garden.

-- Each flower in the garden has a type (for example, "rose"),
-- a color (for example, "red"), 
-- and a height in inches (for example, 45).
-- The flowers in the garden are planted in one straight line. 
-- The garden is guaranteed to be nonempty: there will be at least one flower in the garden.

-- The categories we are interested in are the following:

-- All the flowers are tulips. DONE
-- All flower colors are yellow. DONE
-- Similar height: There is no more than 3 inches' difference in height between the tallest and shortest flower. DONE
-- Short flowers: All flowers are shorter than 8 inches tall. DONE
-- Tall flowers: All flowers are taller than 28 inches tall. DONE
-- All the flowers have the same color. DONE
-- All flower colors are either purple, yellow, or white. DONE
-- HW1 DESCRIPTION - END
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}

module Garden (garden_categories) where

-- Declare type for Flower as a three element tuple (String, String, Int)
type Flower = (String, String, Int)


-- Returns a list of categories that represent the garden and
-- filters out methods that return 0 if category requirements
-- are not met. all 0s returned will be filtered out.
garden_categories :: [Flower] -> [Int]
garden_categories garden = 
    filter (/=0) [
        check_for_tulips garden,
        check_for_yellow garden,
        check_height_difference garden,
        check_for_short_flowers garden,
        check_for_tall_flowers garden,
        check_for_same_flower_color garden,
        check_for_yellow_white_purple_flowers garden
    ]

-- get flower with shortest height
get_shortest_flower :: [Flower] -> Int
get_shortest_flower tuples = minimum [last | (_, _, last) <- tuples]

-- get flower with tallest height
get_tallest_flower :: [Flower] -> Int
get_tallest_flower tuples = maximum [last | (_, _, last) <- tuples]

-- Check if first element in tuples are tulips
check_for_tulips :: [Flower] -> Int
check_for_tulips [] = 1
check_for_tulips ((flower_name, _, _):rest)
    | is_tulip = check_for_tulips rest
    | otherwise = 0
    where is_tulip = flower_name == "tulip"

-- Check if second element in tuple is yellow.
check_for_yellow :: [Flower] -> Int
check_for_yellow [] = 2
check_for_yellow ((_, flower_color, _):rest)
    | is_yellow = check_for_yellow rest
    | otherwise = 0
    where is_yellow = flower_color == "yellow"

-- check height difference between tallest to shortest flower
-- height difference has to be no more than 3 inches
check_height_difference :: [Flower] -> Int
check_height_difference flower
    | height_difference <= 3 = 3
    | otherwise = 0
    where height_difference = get_tallest_flower flower - get_shortest_flower flower
  
-- check if all flowers in the garden have a height shorter than 8 inches
check_for_short_flowers :: [Flower] -> Int
check_for_short_flowers [] = 4
check_for_short_flowers ((_, _, last):rest)
    | last < 8 = check_for_short_flowers rest
    | otherwise = 0

-- check if all flowers have a height taller than 28 inches
check_for_tall_flowers :: [Flower] -> Int
check_for_tall_flowers [] = 5
check_for_tall_flowers ((_, _, height):rest)
    | height > 28 = check_for_tall_flowers rest
    | otherwise = 0

-- All the flowers have the same color
check_for_same_flower_color :: [Flower] -> Int
check_for_same_flower_color [] = 6
check_for_same_flower_color [_] = 6
check_for_same_flower_color ((_, color_one, _) : (_, color_two, _):rest)
    | flower_color = check_for_same_flower_color rest
    | otherwise = 0
    where flower_color = color_one == color_two

-- Check if there are flowers with the colors yellow, white or purple
check_for_yellow_white_purple_flowers :: [Flower] -> Int
check_for_yellow_white_purple_flowers [] = 7
check_for_yellow_white_purple_flowers ((_, flower_color, _):rest)
    | flower_color `elem` color_list = check_for_yellow_white_purple_flowers rest
    | otherwise = 0
    where color_list = ["yellow", "white", "purple"]
