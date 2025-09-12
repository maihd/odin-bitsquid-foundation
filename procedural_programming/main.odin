package procedural_programming

import "core:fmt"
main :: proc() {
	fmt.printf(
		"Hellope! Let find out what is procedural programming (even it is a old programming paradigms).\n",
	)

	fmt.printf("From the docs from https://en.wikipedia.org/wiki/Procedural_programming\n")
	fmt.printf("Procedural programming usually mean old way to coding.\n")
	fmt.printf("But Odin revived procedural programming with modern feel.\n")

	fmt.println()
	fmt.printf("First, procedural programming doesnot mean it must be imperative syntaxes.\n")
	fmt.printf(
		"Odin embrace declarative syntaxes, coming with good syntax sugars to coding faster, less coding, less dense of characters.\n",
	)

	fmt.println()
	fmt.printf("Then, by procedures are first class citizen in Odin.\n")
	fmt.printf("Which mean, you can pass procedure as argument.\n")
	fmt.printf("And procedure are super type of function and subroutine:\n")
	fmt.printf("- Function: like math function, make have return values\n")
	fmt.printf(
		"- Subroutine: opposite of function, have no return values, sometime never return like exit().\n",
	)

	fmt.println()
	fmt.printf(
		"See the code at procedural_programming/main.odin (double click to open file in some terminal).\n",
	)
}
