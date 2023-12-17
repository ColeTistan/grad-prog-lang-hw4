
def get_shortest_flower(garden):
    return min(garden)

def get_tallest_flower(garden):
    return max(garden)

def is_tulip(garden, results):
    if garden[0] != 'tulip':
        return False
    return True

if __name__ == '__main__':
    results = []
    garden = [24,11,9,20]
    print(min(garden))
    print(max(garden))
    print(is_tulip(garden, results))