// Cole Tistan
// Go Lab 1
// 10/17/2023

// Instructions:
// Write a Go program that will prompt for and read two floating-point numbers as input.
// (A good data type for this is float64.) The program should then do the following:

// 1) If the first number is bigger than the second, then swap the values
// so that the first is less than the second. Use an if statement for this decision.

// 2) Print all the numbers between first and second, inclusive, on the same line.

// 3) Print the sum of the series 1/first + ... + 1/second , if none of these
// fractions involves division by zero. If any of the fractions require division by zero,
// print "Can't divide by zero" instead of printing the sum.

// 4) If first and second are both negative, print "Both Negative";
// if both are positive, print "Both Positive"; if one or both are zero, print "Zero";
// otherwise, print "Mixed values". Use a switch statement for this decision.

package main

import "fmt"

// swap first and second number values if first num is bigger than the second num
func swapNumValues(firstNum float64, secondNum float64) (float64, float64) {
	if firstNum > secondNum {
		secondNum, firstNum = firstNum, secondNum
	}
	return firstNum, secondNum
}

// print all numbers in first and second number range
func printNumRange(firstNum float64, secondNum float64) {
	var firstWholeNum int = int(firstNum)
	var secondWholeNum int = int(secondNum)
	for i := firstWholeNum; i <= secondWholeNum; i++ {
		fmt.Printf("%d ", i)
	}
	fmt.Println()
}

// Print the sum of series 1/firstNum + ... + 1/secondNum.
// check if number is zero as dividing by zero is undefined.
func printSum(firstNum float64, secondNum float64) {
	var sum float64 = 0
	var isZero bool = false
	for i := firstNum; i <= secondNum; i++ {
		if i == 0 {
			isZero = true
			break
		}
		sum += 1 / i
	}
	if isZero {
		fmt.Println("Can't divide by zero")
	} else {
		fmt.Printf("Sum: %f\n", sum)
	}
}

func main() {
	var firstNumInput float64
	var secondNumInput float64
	fmt.Scanf("%f %f", &firstNumInput, &secondNumInput)

	firstNum, secondNum := swapNumValues(firstNumInput, secondNumInput)
	printNumRange(firstNum, secondNum)
	printSum(firstNum, secondNum)

	// Check values of both numbers to determine
	// if both are negative, postive, zero, or a mixture of values.
	switch true {
	case (firstNum < 0 && secondNum < 0):
		fmt.Println("Both Negative")
	case (firstNum > 0 && secondNum > 0):
		fmt.Println("Both Positive")
	case (firstNum == 0 || secondNum == 0):
		fmt.Println("Zero")
	default:
		fmt.Println("Mixed values")
	}
}
