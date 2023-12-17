#!/usr/bin/ruby

=begin
1. (Practicing ordinary recursion with lists): Write a Ruby function count_medium1 
which takes a list of numbers as an argument and returns the number of "medium" numbers 
in the list, where a "medium" number is a number between 10 and 20, inclusive. 
For example, count_medium1 [13, 10, 57, 2, 19, 20, 100] should return 4.

count_medium1([13, 10, 57, 2, 19, 20, 100])	(should return 4)
count_medium1([200, 3, 0])				(should return 0)
=end
def count_medium1(nums)
    total = 0
    nums.each do |num|
        if num >= 10 && num <= 20
            total += 1
        end
    end
    return total
end

=begin
Write a Ruby function squared 
which takes a list of numbers as an argument and returns a list of numbers squared
For example, squares([6, 9, 100, 3]) should return [36, 81, 10000, 9]
=end
def squared(nums)
    nums.map { |num| num ** 2 }
end

=begin
3. (Practicing list functions and operators): Write a Ruby function plural which takes a noun 
(i.e., a string) as an argument and returns the plural form of that noun. 

Rule	                    Example: Singular	Plural
Most nouns: Add "s"	                      cat	  cats
Nouns ending in "x" or "s":               box	 boxes
Add "es"
Nouns ending in "sh" or "ch":            wish	wishes
Add "es"
Nouns ending in "f":
Change the "f" to a "v" and add "es"	 leaf	leaves
=end
def plural(noun)
    last_two_chars = noun[noun.length - 2..]
    if (noun[-1] == "x" || noun[-1] == "s") || (last_two_chars == "sh" || last_two_chars == "ch")
        return noun << "es"
    elsif noun[-1] == "f"
        return noun.sub("f", "ves")
    else
        return noun << "s"
    end
end

def main()
    puts count_medium1([13, 10, 57, 2, 19, 20, 100])	    # (should return 4)
    puts count_medium1([200, 3, 0])				            # (should return 0)
    puts squared([6, 9, 100, 3])
    puts plural("cat")						                # (should return cats)
    puts plural("dog")						                # (should return dogs)
    puts plural("box")						                # (should return boxes)
    puts plural("glass")						            # (should return glasses)
    puts plural("wish")						                # (should return wishes)
    puts plural("inch")						                # (should return inches)
    puts plural("leaf")						                # (should return leaves)
end

main()