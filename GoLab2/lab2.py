#  Write a Go program that will read a positive integer N,
#  followed by N lines, each containing a star name (a string),
#  the star's star type (a string), and the distance of the star from
#  earth in light years (an integer). The star type is one of the letters
#  {O, B, A, F, G, K, M}, indicating the star's temperature color:
#  O (blue) is the hottest, and M (red) is the coolest. Our sun is type G, yellow.

#  The program should print the names of all the stars in the input
#  list whose star type is the same as the star type of the farthest star in the list.

#  Example 1:
#  Input:

#  	10
#  	Sirius A 9
#  	Arcturus K 36
#  	Adhara B 490
#  	Spica B 260
#  	Antares M 330
#  	Rigel B 910
#  	Capella G 42
#  	Aldebaran K 68
#  	Regulus B 85
#  	Bellatrix B 360
#  Output:
#  	Adhara
#  	Spica
#  	Rigel
#  	Regulus
#  	Bellatrix
#  Why is this the right answer?
#  The farthest star in the list is Rigel, at 910 light years.
#  Rigel has star type B. The B stars in the list are Adhara, Spica, Rigel, Regulus, and Bellatrix.

#  Example 2:
#  Input:

#  	8
#  	Altair A 17
#  	Antares M 330
#  	Aldebaran K 68
#  	Mirach M 88
#  	Algol B 95
#  	Vindemiatrix G 100
#  	Elnath B 130
#  	Betelgeuse M 310
#  Output:
#  Antares
#  Mirach
#  Betelgeuse
#  Why is this the right answer?
#  The farthest star in the list is Antares, at 330 light years.
#  Antares has star type M. The M stars in the list are Antares, Mirach, and Betelgeuse.

#  Note: use an Array of structs or Slice of structs

from operator import attrgetter


class Star:
    def __init__(self, name, type, distance):
        self.name = name
        self.type = type
        self.distance = distance

def create_star_list(count):
    star_list = []
    i = 1
    while i <= count:
        star_name, star_type, star_distance = input().split()
        star = Star(star_name, star_type, star_distance)
        star_list.append(star)
        i += 1
    return star_list

if __name__ == "__main__":
    count = int(input())
    star_list = create_star_list(count)
    max_distant_star = max(star_list, key=attrgetter("distance"))
    same_star_type_list = [star for star in star_list if star.type == max_distant_star.type]
    for star in same_star_type_list:
        print(star.name)

