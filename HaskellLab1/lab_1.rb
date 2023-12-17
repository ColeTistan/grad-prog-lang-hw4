#!/usr/bin/ruby
=begin
The 5 problems you have to solve:

1. Write a Ruby function compare_nums which takes three integers a, b, and c as arguments.
If a, b, and c are equal, return 10. If a > b > c, return 5.
If neither of these is true, return 1. For example, compare_nums 15 10 5 should return 5,
and compare_nums 9 8 7 should return 5. Use guards when writing this function.

2. Write a Ruby function some_even which takes three integers a, b, and c as arguments.
If at least one of the three arguments is even, return 2.
If none of the three arguments is even, return 1.
For example, some_even 5 10 15 should return 2, and some_even 9 7 3 should return 1.

3. Write a Ruby function sum3 which takes three integers a, b, and c as arguments.
If the sum a + b + c is divisible by 3, return 4.
If the sum is not divisible by 3, return 0.
For example, sum3 1 2 9 should return 4, and sum3 4 2 1 should return 0.

4. Write a Ruby function compare_sum which takes three integers a, b, and c as arguments.
If b > a + c, return 9. If b = a + c, return 8. If b < a + c, return 7.
For example, compare_sum 5 10 2 should return 9, and compare_sum 9 8 7 should return 7.
Compute the sum (a+c) only once in this function, and use "where" when writing the function.

5. Write a Ruby function score which takes three integers a, b, and c as
arguments and returns the sum of functions compare_nums, some_even, sum3, and compare_sum 
called with a, b, and c as arguments. For example, score 3 5 9 should return 9,
and score 8 8 8 should return 23.

score 3 5 9				(should return 9)
score 8 8 8				(should return 23)
score 9 8 7				(should return 18)
score 9 1 7				(should return 9)
score 2 10 8				(should return 11)
End script. You now have a typescript file containing your test run.
=end


=begin
1. Write a Ruby function compare_nums which takes three integers a, b, and c as arguments.
If a, b, and c are equal, return 10. If a > b > c, return 5.
If neither of these is true, return 1. For example, compare_nums 15 10 5 should return 5,
and compare_nums 9 8 7 should return 5.
=end
def compare_nums(a, b, c)
    if (a == b) && (b == c)
        return 10
    elsif (a > b) && (b > c)
        return 5
    else
        return 1
    end
end

=begin
2. Write a Ruby function some_even which takes three integers a, b, and c as arguments.
If at least one of the three arguments is even, return 2.
If none of the three arguments is even, return 1.
For example, some_even 5 10 15 should return 2, and some_even 9 7 3 should return 1.
Use "if" when writing this function.
=end
def some_even(a, b, c)
    if (a % 2 == 0) || (b % 2 == 0) || (c % 2 == 0)
        return 2
    else
        return 1
    end
end

=begin
3. Write a Ruby function sum3 which takes three integers a, b, and c as arguments.
If the sum a + b + c is divisible by 3, return 4.
If the sum is not divisible by 3, return 0.
For example, sum3 1 2 9 should return 4, and sum3 4 2 1 should return 0.
=end
def sum3(a, b, c)
    if (a + b + c) % 3 == 0
        return 4
    else
        return 0
    end
end

=begin
4. Write a Ruby function compare_sum which takes three integers a, b, and c as arguments.
If b > a + c, return 9. If b = a + c, return 8. If b < a + c, return 7.
For example, compare_sum 5 10 2 should return 9, and compare_sum 9 8 7 should return 7.
Compute the sum (a+c) only once in this function.
=end
def compare_sum(a, b, c)
    x = a + c
    if b > x
        return 9
    elsif b == x
        return 8
    else
        return 7
    end
end

=begin
5. Write a Ruby function score which takes three integers a, b, and c as
arguments and returns the sum of functions compare_nums, some_even, sum3, and compare_sum 
called with a, b, and c as arguments. For example, score 3 5 9 should return 9,
and score 8 8 8 should return 23.
=end
def score(a, b, c)
    i = compare_nums(a, b, c)
    x = some_even(a, b, c)
    y = sum3(a, b, c)
    z = compare_sum(a, b, c)
    sum = i + x + y + z
    return sum
end

def main()
    # first_num = gets.chomp.to_i
    # second_num = gets.chomp.to_i
    # third_num = gets.chomp.to_i
    # puts "First: #{first_num} Second: #{second_num} Third: #{third_num}"
    # results = score(first_num, second_num, third_num)
    # puts results
    puts score(3, 5, 9)
    puts score(8, 8, 8)
    puts score(9, 8, 7)
    puts score(9, 1, 7)
    puts score(2, 10, 8)
end

BEGIN {
    puts "=============== Starting Lab 1 Program ==============="
}

main()

END {
    puts "=============== Ending Program... ==============="
}

