// Cole Tistan
// 10/27/2023
// Go Lab 2

package main

import "fmt"

type Star struct {
	starName, starType string
	distance           int
}

func createStarList(count int, spectralStar Star) []Star {
	var starList []Star
	for i := 1; i <= count; i++ {
		fmt.Scanf(
			"%s %s %d",
			&spectralStar.starName,
			&spectralStar.starType,
			&spectralStar.distance,
		)
		starList = append(starList, spectralStar)
	}
	return starList
}

func getMaxDistance(starList []Star) Star {
	// Finds star with largest distance in light years
	// to help find stars of same type
	var maxDistantStar Star = starList[0]
	for _, star := range starList {
		if star.distance > maxDistantStar.distance {
			maxDistantStar = star
		}
	}
	return maxDistantStar
}

func main() {
	var count int
	var spectralStar Star
	fmt.Scanf("%d", &count)
	var starList []Star = createStarList(count, spectralStar)
	var maxDistantStar = getMaxDistance(starList)
	for _, star := range starList {
		if maxDistantStar.starType == star.starType {
			fmt.Println(star.starName)
		}
	}
}
