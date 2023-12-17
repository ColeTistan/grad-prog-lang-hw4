"""
Write a Python program that will prompt for and read two floating-point numbers as input. 
(A good data type for this is float64.) The program should then do the following:

1) If the first number is bigger than the second, then swap the values 
so that the first is less than the second. Use an if statement for this decision.

2) Print all the numbers between first and second, inclusive, on the same line.

3) Print the sum of the series 1/first + ... + 1/second , if none of these 
fractions involves division by zero. If any of the fractions require division by zero, 
print "Can't divide by zero" instead of printing the sum.

4) If first and second are both negative, print "Both Negative"; 
if both are positive, print "Both Positive"; if one or both are zero, print "Zero"; 
otherwise, print "Mixed values". Use a switch statement for this decision.
"""


def printSum(first, second):
    total = 0
    is_zero = False
    for i in range(first, second + 1):
        if i == 0:
            print("") 
            is_zero = True
            break
        total += 1/i
    if is_zero:
        print("Can't divide by zero")
    else:
        print(f"\nSum: {total:0,.6f}")


if __name__ == "__main__":
    first_input, second_input = input().split()
    first, second = int(first_input), int(second_input)
    if first > second:
        first, second = second, first
    for i in range(first, second + 1):
        print(i, end=" ")
    printSum(first, second)
    if first < 0 and second < 0:
        print("Both Negative")
    elif first > 0 and second > 0:
        print("Both Positive")
    elif first == 0 or second == 0:
        print('Zero')
    else:
        print("Mixed values")
