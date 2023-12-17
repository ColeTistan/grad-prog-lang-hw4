# Graduate Level Programming Languages - Fall 2023
This semester long assignment was to write a program that will analyze a flower garden to determine which of several categories it falls into, based on the heights, colors, and types of flowers in the garden.

Each flower in the garden has a type (for example, "rose"), a color (for example, "red"), and a height in inches (for example, 45). The flowers in the garden are planted in one straight line. The garden is guaranteed to be nonempty: there will be at least one flower in the garden.

The categories we are interested in are the following:

All the flowers are tulips.
All flower colors are yellow.
Similar height: There is no more than 3 inches' difference in height between the tallest and shortest flower.
Short flowers: All flowers are shorter than 8 inches tall.
Tall flowers: All flowers are taller than 28 inches tall.
All the flowers have the same color.
All flower colors are either purple, yellow, or white.

Input format: The input to the program will be a positive integer N, followed by N lines describing flowers. Each flower description contains the name of a flower (a string), followed by the color of the flower (a string), followed by the height of the flower (an integer).

Output format: The program should print as many of the following lines as are true of the flower garden:

	1. All tulips
	2. All yellow
	3. Similar height
	4. All short
	5. All tall
	6. All same color (COLOR)
	   (where COLOR is the color of the flowers)
	7. All purple, yellow, or white
Examples:

```Input:
2
tulip yellow 5
crocus yellow 4

Output:
2. All yellow
3. Similar height
4. All short
6. All same color (yellow)
7. All purple, yellow, or white

Input:
5
rose white 50
rose red 45
rose pink 48
rose red 40
rose red 49

Output:
5. All tall

Input:
3
crocus yellow 3
crocus white 4
crocus purple 3

Output:
3. Similar height
4. All short
7. All purple, yellow, or white

Input:
3
lily red 35
lily orange 37
daffodil yellow 10
This garden will give no output, since it has none of the properties.

Input:
2
cornflower blue 30
iris purple 31
Output:

3. Similar height
5. All tall

Input:
2
daisy white 15
daffodil yellow 12

Output:
3. Similar height
7. All purple, yellow, or white

Input:
5
tulip red 13
tulip orange 12
tulip red 14
tulip yellow 13
tulip yellow 12

Output:
1. All tulips
3. Similar height

Input:
3
tulip red 12
rose red 48
zinnia red 20

Output:
6. All same color (red)

The following programming languages were used to solve this problem:
- Haskell
- Go
- Ruby
- Python

Below are sample commands to run each garden or other program in their respective language:
- Haskell: run `ghci <haskell_file_name>` and then in ghci <main> or <garden_categories>
- Go: go build <go_file_name> and then go run <go_file_name>
- Ruby: ruby <ruby_file_name>
- Python: python3 <python_file_name>