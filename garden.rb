class Flower
    attr_accessor :type, :color, :height
    def initialize(type, color, height)
        @type = type
        @color = color
        @height = height
    end
end

# Get min and max height of flowers from garden
def get_flower_heights(garden)
    garden_flowers = []
    garden.each { |flower| garden_flowers << flower.height }
    return garden_flowers.minmax
end


def has_tulips(garden)
    garden.each { |flower| if flower.type != 'tulip'
        return false
    end }
    return true
end

def has_yellow_flowers(garden)
    garden.each { |flower| if flower.color != 'yellow'
        return false
    end }
    return true
end

def has_similar_height(garden)
    min_max_flower_height = get_flower_heights(garden);
    if min_max_flower_height[0] - min_max_flower_height[1] > 3
        return false
    end
    return true
end

def main()
    garden = []
    num_of_flowers = gets.to_i()
    for index in 1..num_of_flowers do
        flower_type, flower_color, flower_height = gets.split(" ")
        new_flower = Flower.new(flower_type, flower_color, flower_height.to_i())
        garden << new_flower
    end

    has_tulips = has_tulips(garden)
    has_yellow_flowers = has_yellow_flowers(garden)
    has_similar_height = has_similar_height(garden)
    
    if has_tulips
		puts "1. All tulips"
	end
    if has_yellow_flowers
		puts "2. All yellow"
    end
    if has_similar_height
		puts "3. Similar height"
    end
end

main()