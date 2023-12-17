def count_medium_numbers(num_list):
    return len([num for num in num_list if num >= 10 and num <= 20])


def squares(num_list):
    return [num ** 2 for num in num_list]


def plural(noun):
    if (
        noun[len(noun) - 2] in ['x','s']
    ) or (
        (noun[len(noun) - 2] in ['s', 'c']) and noun[len(noun)- 1] == 'h'
    ):
        return noun + 'es'
    elif (noun[len(noun) - 1] == 'f'):
        return noun[:-1] + 'ves'
    else:
        return noun + 's'


if __name__ == '__main__':
    print(count_medium_numbers([13, 10, 57, 2, 19, 20, 100]))
    print(count_medium_numbers([200, 3, 0]))
    print(squares([6, 9, 100, 3]))
    print(squares([1, 2]))
    print(plural("cat"))
    print(plural("dog"))
    print(plural("box"))
    print(plural("glass"))
    print(plural("wish")) 
    print(plural("inch")) 
    print(plural("leaf"))