class Flower
    attr_accessor :type, :color, :height
    def initialize(type, color, height)
        @type = type
        @color = color
        @height = height
    end
end

# Get max height
def get_tallest_flower(garden)
    some_flower = garden[0]
    garden.each do |flower|
        if flower.height > some_flower.height
            some_flower = flower 
        end
    end
    return some_flower.height
end

# Get min height
def get_shortest_flower(garden)
    some_flower = garden[0]
    garden.each do |flower|
        if flower.height < some_flower.height
            some_flower = flower 
        end
    end
    return some_flower.height
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
    max_flower_height = get_tallest_flower(garden)
    min_flower_height = get_shortest_flower(garden)
    if max_flower_height - min_flower_height > 3
        return false
    end
    return true
end

def main()
    garden = []
    num_of_flowers = gets.to_i()
    until num_of_flowers == 0 do
        flower_type, flower_color, flower_height = gets.split(" ")
        new_flower = Flower.new(flower_type, flower_color, flower_height.to_i())
        garden << new_flower
        num_of_flowers -= 1
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