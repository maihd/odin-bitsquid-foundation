package math_examples

import "core:fmt"

main :: proc() {
	fmt.printf(
		"Hellope! Game programming, especially game engine, cannot avoid math programming.\n",
	)
	fmt.printf("But C and C++ doesnot battery including support math programming.\n")
	fmt.printf("We must add abstraction on top of SIMD data types and operator overloading.\n")
	fmt.printf(
		"Its complicating the code base, programmer must including, and fragments to many implements.\n",
	)
	fmt.printf("And creating a good math library by yourself is time consuming.\n")
	fmt.printf("Bitsquid Foundation its own must defined math_types.h, cheating as basic types.\n")
	fmt.printf(
		"Come from background as a graphics progammer, Odin's creator just included math programming in Odin.\n",
	)
	fmt.printf(
		"He called its array programming, supported operators, SIMD, common procedures use in math.\n",
	)
	fmt.printf("core:math also support GLSL/HLSL math api.\n")

	fmt.println()
	fmt.printf("Math types just declaring and defining as fixed array of number.\n")
	fmt.printf("So, math types are cross-library, you can choose or create your own.\n")
	fmt.printf(
		"Example, in Raylib bindings, they just define Vector2 as [2]f32, and using the core:math/linalg or GLSL/HLSL procedures as they preferred.\n",
	)
	fmt.printf(
		"And other god-send features of math programming in Odin are swizzles and operators support for theses types.\n",
	)
	fmt.printf("You can do .xy on [2]f32, .rgb on [3]f32, .rgba on [4]f32.\n")
	fmt.printf("")

	fmt.println()
	fmt.printf(
		"Odin also included matrix types in language-level. With syntax like: matrix[N, M]T.\n",
	)
	fmt.printf("Where N and M are rows and columns, T are data type, should be number types.\n")

	fmt.println()
	fmt.printf(
		"Math programming is natural and intuitive when programming Odin programs, so I dont talk too much about its.\n",
	)
	fmt.printf("Let exploring its yourself through theses links:\n")
	fmt.printf(
		"\t- Odin array programming: https://odin-lang.org/docs/overview/#array-programming\n",
	)
	fmt.printf("\t- Odin matrix: https://odin-lang.org/docs/overview/#matrix-type\n")
	fmt.printf(
		"\t- `bitsquid-foundation/math_types.h`: https://github.com/niklas-ourmachinery/bitsquid-foundation/blob/master/math_types.h\n",
	)
	fmt.printf("\t- `core:math`: https://pkg.odin-lang.org/core/math/\n")
	fmt.printf("\t- `core:math/linalg`: https://pkg.odin-lang.org/core/math/linalg\n")
	fmt.printf("\t- `core:math/linalg/glsl`: https://pkg.odin-lang.org/core/math/linalg/glsl\n")
	fmt.printf("\t- `core:math/linalg/hlsl`: https://pkg.odin-lang.org/core/math/linalg/hlsl\n")

	fmt.println()
	fmt.printf("See the code at math/main.odin (double click to open the file in some terminal)\n")
}
