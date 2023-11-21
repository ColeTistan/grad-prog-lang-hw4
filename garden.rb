# Garden Program - Homework #4
# authors: Hui Zhang, Cole Tistan
# Graduate Level Programming Languages
# Fall 2023

# The Flower Class represents the flower
# @param (String) type - the type of the flower such as tulip, crocus, etc
# @param (String) color - the color of the flower such as yellow, red, etc
# @param (Integer) height = the height of the flower
class Flower
    attr_accessor :type, :color, :height
    def initialize(type, color, height)
        @type = type
        @color = color
        @height = height
    end
end

# Get min and max height of flowers from garden
# returns a list contain min and max heights
# method written by Cole Tistan
def get_flower_heights(garden)
    garden_flowers = []
    garden.each { |flower| garden_flowers << flower.height }
    return garden_flowers.minmax
end

# returns false if one of the flowers is not a tulip
# otherwise, return true
# method written by Cole Tistan
def has_tulips(garden)
    garden.each { |flower| if flower.type != 'tulip'
        return false
    end }
    return true
end

# returns false if one of the flowers is not yellow
# otherwise, return true
# method written by Cole Tistan
def has_yellow_flowers(garden)
    garden.each { |flower| if flower.color != 'yellow'
        return false
    end }
    return true
end

# returns false if the max and min heights subtracted are bigger than 3
# otherwise, return true
# method written by Cole Tistan
def has_similar_height(garden)
    min_max_flower_height = get_flower_heights(garden);
    if min_max_flower_height[1] - min_max_flower_height[0] > 3
        return false
    end
    return true
end

# returns false if a flower's height is more than 8 inches tall
# otherwise, return true
# method written by Hui Zhang
def short_flowers(garden)
    garden.each{ |flower| if flower.height >= 8
        return false
    end }
    return true
end


# returns false if a flower's height is less than 8 inches tall
# otherwise, return true
# method written by Hui Zhang
def tall_flowers(garden)
    garden.each{ |flower| if flower.height <= 28
        return false
    end }
    return true
end

# returns false if a flower doesn't match the color of the first flower in the garden
# otherwise, return true if all flowers are the same color or the garden is empty
# method written by Hui Zhang
def has_same_color(garden)
    # check if it is empty garden
    return true if garden.empty? 
    garden.each{ |flower| if flower.color != garden[0].color
        return false
    end }
    return true   
end

# returns false if a flower is not yellow, purple or white.
# otherwise, return true if all flowers are yellow, purple or white.
# method written by Hui Zhang
def has_purple_yellow_white(garden)
    garden.each do|flower| 
        if flower.color != 'purple' && flower.color != 'yellow' && flower.color != 'white'
            return false
        end
    end
    return true   
end

def main()
    garden = []
    print "Enter the number of flowers: "
    num_of_flowers = gets.to_i()

    for index in 1..num_of_flowers do
        flower_type, flower_color, flower_height = gets.split(" ")
        new_flower = Flower.new(flower_type, flower_color, flower_height.to_i)
        garden << new_flower
    end

    has_tulips = has_tulips(garden)
    has_yellow_flowers = has_yellow_flowers(garden)
    has_similar_height = has_similar_height(garden)
    short_flowers = short_flowers(garden)

    # Should change long_flowers method and variable name to tall_flowers for consistency
    tall_flowers = tall_flowers(garden)
    has_same_color = has_same_color(garden)
    has_purple_yellow_white = has_purple_yellow_white(garden)

    if has_tulips
		puts "1. All tulips"
	end
    if has_yellow_flowers
		puts "2. All yellow"
    end
    if has_similar_height
		puts "3. Similar height"
    end
    if short_flowers
        puts "4. All short"
    end
    if tall_flowers
        puts "5. All tall"
    end
    if has_same_color
        puts "6. All same color (#{garden[0].color})"
    end
    if has_purple_yellow_white
        puts "7. All purple, yellow, or white"
    end
end

main()