"""
Compare the numbers: If a, b, and c are equal,
add 10 points to the score. If a > b >c,
add 5 points to the score. 
If neither of these is true, add 1 point to the score.
"""
def compare_nums(a, b, c):
    if a == b and b == c:
        return 10
    elif a > b and b > c:
        return 5
    else:
        return 1
    

"""
Check if any of the numbers is even: 
If at least one of the three arguments is even, 
add 2 points to the score. 
If none of the three arguments is even, add 1 point to the score.
"""
def some_even(a, b, c):
    if (a % 2 == 0) or (b % 2 == 0) & (c % 2 == 0):
        return 2
    else:
        return 1


"""
Check the sum of the numbers: 
If sum of a, b, and c is divisible by 3, 
add 4 points to the score; otherwise, 
add 0 points to the score.
"""
def sum_3(a, b, c):
    sum = a + b + c
    if sum % 3 == 0:
        return 4
    else:
        return 0


"""
Compare b to the sum of a and c: If b > (a + c), 
add 9 points to the score. 
If b = (a + c), add 8 points to the score. 
If b < (a + c), add 7 points to the score.
"""
def compare_sums(a, b, c):
    sum = a + c
    if b > sum:
        return 9
    elif b == sum:
        return 8
    else:
        return 7

"""
The overall score is the sum of these four functions.
"""
def score(a, b, c):
    total_score = compare_nums(a, b, c) + \
    some_even(a, b, c) + \
    sum_3(a, b, c) + \
    compare_sums(a, b, c)
    return total_score


if __name__ == '__main__':
    print(score(3, 5, 9))
    print(score(8, 8, 8))
    print(score(9, 8, 7))
    print(score(9, 1, 7))
    print(score(2, 10, 8))
