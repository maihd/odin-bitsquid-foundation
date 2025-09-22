package strings

import "core:fmt"

main :: proc() {
	fmt.printf(
		"Hellope! Bitsquid Foundation does not have String class because it's prefer avoid using string in runtime.\n",
	)
	fmt.printf(
		"But string are unvoidable in all cases, and string in C are just array of chars.\n",
	)
	fmt.printf(
		"And C++ are other nightmare story, std::string allocation memory even passing as parameters.\n",
	)

	fmt.println()
	fmt.printf("As decribing in https://bitsquid.blogspot.com/2011/06/strings-redux.html\n")
	fmt.printf(
		"Bitsquid avoid string and string class because the native supports of string in C++ are bad.\n",
	)
	fmt.printf(
		"But Odin solve this problem completely, cheat string as builtin data type, can transmute to slice.\n",
	)
	fmt.printf("Strings are utf-8 by defaults, underlying are a slice of u8 or byte.\n")
	fmt.printf(
		"But char data type in Odin named `rune`, 4 bytes in size. Character literals are untyped constants, can implicit cast to any integer types that fit.\n",
	)
	fmt.printf("Batteries included with core:strings for working with strings better.\n")

	fmt.println()
	fmt.printf("In conlusions, string in Odin are simple, we dont need to deep dive here.\n")
	fmt.printf("You can find more at: \n")
	fmt.printf("\t- https://odin-lang.org/docs/overview/#string-type\n")
	fmt.printf("\t- https://pkg.odin-lang.org/core/strings/\n")

	fmt.println()
	fmt.printf("See the code at strings/main.odin (double click open the file in some terminal)\n")
}
