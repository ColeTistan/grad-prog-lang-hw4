// Write a Go program that will analyze a flower garden to determine
// which of several categories it falls into, based on the heights, colors,
// and types of flowers in the garden.

// Each flower in the garden has a type (for example, "rose"),
// a color (for example, "red"), and a height in inches
// (for example, 45). The flowers in the garden are planted in
//one straight line. The garden is guaranteed to be nonempty:
// there will be at least one flower in the garden.

// The categories we are interested in are the following:

// All the flowers are tulips.
// All flower colors are yellow.
// Similar height: There is no more than 3 inches' difference in height between the tallest and shortest flower.
// Short flowers: All flowers are shorter than 8 inches tall.
// Tall flowers: All flowers are taller than 28 inches tall.
// All the flowers have the same color.
// All flower colors are either purple, yellow, or white.

// Data structure: I suggest using either an array of structs
// or a slice of structs to represent the garden, but you
// may choose any data structure that you find to be suitable.
//In case you choose to use a fixed-length array, I will guarantee
// that there are no more than 50 flowers in the garden.

package main

import "fmt"

type Flower struct {
	flowerName, flowerColor string
	flowerHeight            int
}

// creates a new list of flowers that will have
// new flower instances added.
func createFlowerGarden(count int, flower Flower) []Flower {
	var flowerGarden []Flower
	for i := 1; i <= count; i++ {
		fmt.Scanf(
			"%s %s %d",
			&flower.flowerName,
			&flower.flowerColor,
			&flower.flowerHeight,
		)
		flowerGarden = append(flowerGarden, flower)
	}
	return flowerGarden
}

// Returns tallest flower in the flower garden list
func getTallestFlower(flowerGarden []Flower) int {
	var tallestFlower = flowerGarden[0]
	for _, flower := range flowerGarden {
		if flower.flowerHeight > tallestFlower.flowerHeight {
			tallestFlower = flower
		}
	}
	return tallestFlower.flowerHeight
}

// Returns height of shortest flower in the flower garden list
func getShortestFlower(flowerGarden []Flower) int {
	var shortestFlower = flowerGarden[0]
	for _, flower := range flowerGarden {
		if flower.flowerHeight < shortestFlower.flowerHeight {
			shortestFlower = flower
		}
	}
	return shortestFlower.flowerHeight
}

// Checks if all the flowers are tulips.
func hasTulips(flowerGarden []Flower) bool {
	for _, flower := range flowerGarden {
		if flower.flowerName != "tulip" {
			return false
		}
	}
	return true
}

// Checks if all flower colors are yellow.
func hasYellowFlowers(flowerGarden []Flower) bool {
	for _, flower := range flowerGarden {
		if flower.flowerColor != "yellow" {
			return false
		}
	}
	return true
}

// Similar height: There is no more than 3 inches'
// difference in height between the tallest and shortest flower.
func hasSimilarHeight(flowerGarden []Flower, maxHeight int, minHeight int) bool {
	var heightDifference = maxHeight - minHeight
	if heightDifference > 3 {
		return false
	}
	return true
}

// Short flowers: All flowers are shorter than 8 inches tall.
func hasShortFlowers(flowerGarden []Flower) bool {
	for _, flower := range flowerGarden {
		if flower.flowerHeight > 8 {
			return false
		}
	}
	return true
}

// Tall flowers: All flowers are taller than 28 inches tall.
func hasTallFlowers(flowerGarden []Flower) bool {
	for _, flower := range flowerGarden {
		if flower.flowerHeight < 28 {
			return false
		}
	}
	return true
}

// All the flowers have the same color.
func hasSameColorFlowers(flowerGarden []Flower) bool {
	var sampleFlower Flower = flowerGarden[0]
	for _, flower := range flowerGarden {
		if flower.flowerColor != sampleFlower.flowerColor {
			return false
		}
	}
	return true
}

// All flower colors are either purple, yellow, or white.
func hasPurpleYellowWhiteFlowers(flowerGarden []Flower) bool {
	for _, flower := range flowerGarden {
		if flower.flowerColor != "purple" && flower.flowerColor != "yellow" && flower.flowerColor != "white" {
			return false
		}
	}
	return true
}

func main() {
	var numOfFlowers int
	var flower Flower
	fmt.Scanf("%d", &numOfFlowers)

	var flowerGarden []Flower = createFlowerGarden(numOfFlowers, flower)
	var maxHeight = getTallestFlower(flowerGarden)
	var minHeight = getShortestFlower(flowerGarden)

	var hasTulips = hasTulips(flowerGarden)
	var hasYellowFlowers = hasYellowFlowers(flowerGarden)
	var hasSimilarHeight = hasSimilarHeight(flowerGarden, maxHeight, minHeight)
	var hasShortFlowers = hasShortFlowers(flowerGarden)
	var hasTallFlowers = hasTallFlowers(flowerGarden)
	var hasSameColorFlowers = hasSameColorFlowers(flowerGarden)
	var hasPurpleYellowWhiteFlowers = hasPurpleYellowWhiteFlowers(flowerGarden)

	if hasTulips {
		fmt.Println("1. All tulips")
	}
	if hasYellowFlowers {
		fmt.Println("2. All yellow")
	}
	if hasSimilarHeight {
		fmt.Println("3. Similar height")
	}
	if hasShortFlowers {
		fmt.Println("4. All short")
	}
	if hasTallFlowers {
		fmt.Println("5. All tall")
	}
	if hasSameColorFlowers {
		fmt.Printf("6. All same color (%s)\n", flowerGarden[0].flowerColor)
	}
	if hasPurpleYellowWhiteFlowers {
		fmt.Println("7. All purple, yellow, or white")
	}
}
