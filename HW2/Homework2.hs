-- Programming Assignment #2
-- Cole Tistan
-- 10/18/2023

-- A meal is a list_of of dishes. Each dish is represented as a list_of of six numbers as criteria below:
-- [Dish_number, Has_meat, Has_vegetables, Organic, Is_dessert, Has_dairy, Has_peanuts]
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}
{-# HLINT ignore "Use !!" #-}

module Homework2 (satisfactory_meal) where

-- Dish declared as list of lists
type Dish = [[Int]]

-- diner = [no_meat, no_vegetables, organic, no_dessert, no_diary, no_peanuts]
alyssaRestrictions = [0,1,1,1,1,1] -- Alyssa is a vegetarian; she will not eat any dish containing meat.
claraRestrictions  = [1,0,1,1,1,1] -- Clara hates vegetables; she will not eat any dish containing vegetables.
danielRestrictions = [0,0,1,0,0,0] -- Daniel will eat only organic food.
elenaRestrictions  = [1,1,1,0,1,1] -- Elena will not eat any desserts.
isaiahRestrictions = [1,1,1,1,0,1] -- Isaiah, who is lactose-intolerant, will not eat any food containing dairy products.
justinRestrictions = [1,1,1,1,1,0] -- Justin is allergic to peanuts and will not eat any food containing them.

-- Checks if any dishes have no meat
dishes_with_no_meat :: Dish -> [Int]
dishes_with_no_meat dishes = [dish_num |
                                head alyssaRestrictions == 0,
                                [dish_num, 0, _, _, _, _, _] <- dishes]

-- Checks if any dishes have no vegetables
dishes_with_no_vegetables :: Dish -> [Int]
dishes_with_no_vegetables dishes = [dish_num |
                                      head (tail claraRestrictions) == 0,
                                      [dish_num, _, 0, _, _, _, _] <- dishes]

-- Checks if any dishes have organic food
dishes_with_organic_food :: Dish -> [Int]
dishes_with_organic_food dishes = [dish_num |
                                     last (take 2 (tail danielRestrictions)) == 1,
                                     [dish_num, _, _, 1, _, _, _] <- dishes]

-- Checks if any dishes have no dessert
dishes_with_no_dessert :: Dish -> [Int]
dishes_with_no_dessert dishes = [dish_num |
                                   reverse elenaRestrictions !! 2 == 0,
                                   [dish_num, _, _, _, 0, _, _] <- dishes]

-- Checks if any dishes have no diary
dishes_with_no_diary :: Dish -> [Int]
dishes_with_no_diary dishes = [dish_num |
                                 head (drop 4 isaiahRestrictions) == 0,
                                 [dish_num, _, _, _, _, 0, _] <- dishes]

-- Checks if any dishes have no peanuts
dishes_with_no_peanuts :: Dish -> [Int]
dishes_with_no_peanuts dishes = [dish_num |
                                   justinRestrictions !! 5 == 0,
                                   [dish_num, _, _, _, _, _, 0] <- dishes]

-- Checks if all diners have at least 3 dishes they can eat
satisfactory_meal :: Dish -> Bool
satisfactory_meal meal = all (\diner_dishes -> length diner_dishes >= 3) [
    dishes_with_no_meat meal,
    dishes_with_no_vegetables meal,
    dishes_with_organic_food meal,
    dishes_with_no_dessert meal,
    dishes_with_no_diary meal,
    dishes_with_no_peanuts meal
    ]
