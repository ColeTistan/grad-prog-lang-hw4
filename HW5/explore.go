// Cole Tistan
// Grad Prog Lang - HW5

// Instructions:
// Make two additions to the program:

// 1) Add two more treasures to the grid. You may choose their names and their locations.

// 2) Add another agent to the program, who will start at row 0, column grid_size - 1
// (that is, the right end of the first row). You may give this new agent any name you like.
// Write a search function for this agent (like function look_for_stuff) that uses a different search strategy.
// Instead of picking a random direction to search on each move, the new agent should search left along row 0,
// then right along row 1, then left along row 2, and so on. In this way, the new agent will exhaustively explore
// the entire grid. Call this function concurrently with the two calls to look_for_stuff.

// Optional:

// If you wish, you may rename agents 1 and 2 to any names you like (instead of Thorn and Xenith).
// If you wish, you may also rename the treasures. (Currently, they are emerald, ruby, opal, and amethyst. Feel free to be creative.)

package main

import (
	"fmt"
	"math/rand"
	"time"
)

const grid_size = 10
const num_treasures = 6

type treasure struct {
	desc  string // description of treasure
	found bool
}

type treasure_list [num_treasures]treasure

type mines [grid_size][grid_size]int // Treasure number, or -1 if none

type agent struct {
	name string
	row  int // current row in mine 0..N-1
	col  int // current col in mine 0..N-1
}

const north = 0
const east = 1
const south = 2
const west = 3

const empty = -1 // Used to indicate that a room has no treasures

func main() {
	var M mines
	var agent1 agent
	var agent2 agent
	var agent3 agent
	var Treasures treasure_list
	var treasure_number int

	found_something := make(chan int, num_treasures) // Buffered channel

	rand.Seed(time.Now().UnixNano())

	// Initialize M to empty
	for row := 0; row < grid_size; row++ {
		for col := 0; col < grid_size; col++ {
			M[row][col] = empty
		}
	}

	// Place a few treasures
	M[2][2] = 0 // emerald
	M[5][5] = 1 // ruby
	M[3][4] = 2 // opal
	M[8][6] = 3 // amethyst
	M[9][1] = 4 // sapphire
	M[4][5] = 5 // topaz

	Treasures = treasure_list{{"ender pearl", false}, {"redstone", false},
		{"prismarine", false}, {"emerald", false}, {"glowstone", false},
		{"obsidian", false}}

	agent1.row = 0
	agent1.col = 0
	agent1.name = "Brody"

	agent2.row = grid_size - 1
	agent2.col = grid_size - 1
	agent2.name = "Guiness"

	agent3.row = 0
	agent3.col = 9
	agent3.name = "Carney"

	fmt.Printf("%s is in room (%d, %d)\n",
		agent1.name, agent1.row, agent1.col)
	fmt.Printf("%s is in room (%d, %d)\n",
		agent2.name, agent2.row, agent2.col)
	fmt.Printf("%s is in room (%d, %d)\n",
		agent3.name, agent3.row, agent3.col)

	go look_for_stuff(&agent1, &M, found_something)
	go look_for_stuff(&agent2, &M, found_something)
	// go look_for_stuff(&agent3, &M, found_something)
	go look_for_stuff_exhaustively(&agent3, &M, found_something)
	for !all_found(Treasures) {
		select {
		case treasure_number = <-found_something:
			fmt.Printf("The %s has been found\n",
				Treasures[treasure_number].desc)
			Treasures[treasure_number].found = true
		default:
			// do nothing
		}
	}
	fmt.Println("All treasures found!")
}

func all_found(T treasure_list) bool {
	found_them_all := true
	for i := 0; i < 4; i++ {
		if !(T[i].found) {
			found_them_all = false
		}
	}
	return found_them_all
}

func look_for_stuff(a *agent, m *mines, found_something chan int) {
	var item_num int
	var dir int

	for true { // Loop forever until main finishes

		// Look for treasures in my current location
		item_num = m[a.row][a.col]
		if item_num != empty { // treasure here
			m[a.row][a.col] = empty
			fmt.Printf("%s found item %d in room (%d, %d)\n",
				a.name, item_num, a.row, a.col)
			found_something <- item_num
		}

		// Randomly choose a direction to move, until I find a direction
		// with an exit
		exit := false
		for !exit {
			dir = rand.Intn(4)
			exit = dir == north && a.row > 0 ||
				dir == east && a.col < grid_size-1 ||
				dir == south && a.row < grid_size-1 ||
				dir == west && a.col > 0
		}

		// Now that I've found a legal direction to move, move there
		switch dir {
		case north:
			a.row--
		case east:
			a.col++
		case south:
			a.row++
		case west:
			a.col--
		}
		fmt.Printf("%s moved to room (%d, %d)\n", a.name, a.row, a.col)
	}
}

func look_for_stuff_exhaustively(a *agent, m *mines, found_something chan int) {
	var item_num int

	// Loops through each row from left to right
	for row := 0; row < grid_size-1; row++ {
		a.row = row
		// checks if row is even so the row
		// can traverse each column going right
		if row%2 == 0 {
			for col := 0; col < grid_size; col++ {
				// Look for treasures in current location
				a.col = col
				fmt.Printf("%s moved to room (%d, %d)\n", a.name, a.row, a.col)
				item_num = m[a.row][a.col]
				if item_num != empty { // treasure here
					m[a.row][a.col] = empty
					fmt.Printf("%s found item %d in room (%d, %d)\n",
						a.name, item_num, a.row, a.col)
					found_something <- item_num
				}
			}
		} else {
			// traverses right to left if row is odd and
			for col := grid_size - 1; col >= 0; col-- {
				// Look for treasures in my current location
				a.col = col
				fmt.Printf("%s moved to room (%d, %d)\n", a.name, a.row, a.col)
				item_num = m[a.row][a.col]
				if item_num != empty { // treasure here
					m[a.row][a.col] = empty
					fmt.Printf("%s found item %d in room (%d, %d)\n",
						a.name, item_num, a.row, a.col)
					found_something <- item_num
				}
			}
		}
	}
}
