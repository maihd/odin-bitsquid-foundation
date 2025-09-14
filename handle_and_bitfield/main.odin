package handle_and_bitfield

import "core:fmt"

main :: proc() {
	fmt.printf(
		"Hellope! Let consider the concept that are often mentioned in Bitsquid blogs: Handle.\n",
	)
	fmt.printf("In short explain, handles are just a struct contains index and generation.\n")
	fmt.printf("For memory effiency, we just use handle in size of 4 or 8 bytes.\n")
	fmt.printf("Like this: Handle32: struct {{ index, generation: u16, }}\n")
	fmt.printf("But sometime index are much more amount than generation.\n")
	fmt.printf("So we decided to cut down the bit of generation for index.\n")
	fmt.printf("But how? We do bit shift or bit fields.\n")

	fmt.println()
	fmt.printf(
		"1. Bit shift work very well, cross-compiler supported, but are too errornous to used.\n",
	)
	fmt.printf(
		"2. That why C supporting bit fields, but not cross-compiler behaviours (undefined behaviour).\n",
	)

	fmt.println()
	fmt.printf("Too use bit shift, we must using integer data type.\n")
	fmt.printf(
		"Can be define a struct look like this: struct Handle32 {{ u32 data; }}. But this is more typing, and too verbose.\n",
	)
	fmt.printf(
		"The code bit shift look like: index = (handle << 8). Assume we use 24bits index.\n",
	)
	fmt.printf(
		"You see, we must remember what bitness of index, and repeated through own code base.\n",
	)
	fmt.printf(
		"Solution is define macros or functions. The trade offs is too learn the api, more code, more typing.\n",
	)
	fmt.printf(
		"All trade offs and typing are accepted, but you need to consider what to use, more cognition loads.\n",
	)

	fmt.println()
	fmt.printf(
		"What about C bit fields? Because it doesnot has cross-compiler behaviours, it is forbidden in many codebases.\n",
	)
	fmt.printf("And I don't recommend use it. Fortunately we have bit fields support in Odin.\n")

	fmt.println()
	fmt.printf("If you want use bit fields, you need to define bit_field data type.\n")
	fmt.printf(
		"They are called bit-packed struct. Simple definition of Handle32 with bit_field:\n",
	)
	fmt.printf(
		`
        Handle32 :: bit_field u32 {{
            index: u32 | 24,
            generation: u32 | 8,
        }}
        `,
	)

	fmt.println()

	Handle32 :: bit_field u32 {
		index:      u32 | 24,
		generation: u32 | 8,
	}

	handle := Handle32 {
		index      = 0,
		generation = 1,
	}

	fmt.printf("You see, this is so simple, C-like struct, but have well-defined behaviour.\n")
	fmt.printf("Let see what is the data of handle: %v\n", handle)
	fmt.printf("Get index from handle with handle.index: %v\n", handle.index)
	fmt.printf("Get generation from handle with handle.generation: %v\n", handle.generation)
	fmt.printf(
		"One of big concerns is size_of handle, it must be 4, print size_of(handle): %v\n",
		size_of(handle),
	)

	fmt.println()
	fmt.printf("We go far enough to understand that Odin have a mindset of Bitsquid Foundation.\n")
	fmt.printf(
		"They should many features that help coding in style of DoD, back to C, but more modern, more easier.\n",
	)
	fmt.printf(
		"They choose supporting bit fields for many things like Handle, but not limited to it.\n",
	)
	fmt.printf(
		"If you are a fan of Doom 3, you will know that the trick to make data type smaller is using bit fields.\n",
	)
	fmt.printf("Using bit shift in C and C++ worked, but too much annoying, errorprone.\n")
	fmt.printf(
		"Just exploring more about bit_field by your self through this link: https://odin-lang.org/docs/overview/#bit-fields\n",
	)

	fmt.println()
	fmt.printf(
		"See code at handle_and_bitfield/main.odin (double click to open file in some terminal)\n",
	)
}
