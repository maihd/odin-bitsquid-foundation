package flags_and_bitset

import "base:runtime"
import "core:fmt"

main :: proc() {
	fmt.printf("Hellope! Game engine and high performance must deal with memory effiency.\n")
	fmt.printf("One of big problems are boolean data type.\n")
	fmt.printf(
		"1. Boolean are wasteful, a byte (8 bits) just for one bit state (0 and 1, true or false).\n",
	)
	fmt.printf(
		"2. In API, boolean present some unclear state, harder to understand and remember for programming.\n",
	)
	fmt.printf(
		"3. And the worst, struct fields must be aligned in the optimal way, that why boolean must be have padding (3 bytes). That more wasteful.\n",
	)

	fmt.println()
	fmt.printf(
		"That's where bit flags come to the party, each bytes to store 1 state of configuration.\n",
	)
	fmt.printf(
		"A bit flags variable usually have 32bits or 64bits, each mean can save much bytes compare to using boolean.\n",
	)

	fmt.println()
	fmt.printf(
		"Bit flags have twin brother name bit set, in OOP or C++ usually define as new type with operator overloading.\n",
	)
	fmt.printf(
		"But define new type and operator overloading have flaws should be avoid, so many folks just strict to bit flags.\n",
	)
	fmt.printf("By observe theses issues, Odin provide language-level support for bit_set.\n")
	fmt.printf("Defining bit_set is easy as defining struct and other data types in Odin.\n")
	fmt.printf("Here a simple definition of bit_set:\n")
	fmt.printf(
		`
        Hints :: enum {
            VSync,
            MSSA_2X,
        }
        Hint_Flags :: bit_set[Hints]
    `,
	)

	fmt.println()
	fmt.printf("As you see, that definition is exact like bit flags in C-like language.\n")

	Hints :: enum {
		VSync,
		MSSA_2X,
	}
	Hint_Flags :: bit_set[Hints]

	hints := Hint_Flags{.VSync}
	fmt.printf("Here are a sample value of hints: %v\n", hints)
	fmt.printf("Let see what is size of hints: %v\n", size_of(hints))
	fmt.printf("That look good, memory effiencied.\n")

	fmt.println()
	fmt.printf("Now we do some specified underlying type of enum and bit_set.\n")

	Hint_Flags_U32 :: bit_set[Hints;u32]
	hints_u32 := Hint_Flags_U32{.VSync}
	fmt.printf("Value for hints_u32: %v\n", hints_u32)
	fmt.printf("Let see size_of hints_u32: %v\n", size_of(hints_u32))

	fmt.println()
	fmt.printf("As you see, Odin bit_set are more ergonomic compare to old way of bit flags.\n")
	fmt.printf("You can see here: https://odin-lang.org/docs/overview/#bit-sets\n")

	fmt.println()
	fmt.printf(
		"See the code at flags_and_bitset/main.odin (double click to open file in some terminals).\n",
	)
}
