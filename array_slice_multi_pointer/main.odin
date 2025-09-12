package array_slice_multi_pointer

import "base:runtime"
import "core:fmt"

@(export)
game :: proc() {
}

main :: proc() {
	fmt.printf(
		"Hellope! Let exploring what Odin offer to work with buffer/batch/bulk (or group of items in continous memory array)\n",
	)
	fmt.printf("First, the well know concept, array:\n")
	fmt.printf("Array come with 2 types: static and dynamic size\n")
	fmt.printf("Static array: `[N]T`, which N is size of array, T is data type of item\n")
	fmt.printf(
		"Dynamic array: `[dynamic]T`, which dynamic mean the array is can be grown (size are unfixed, dynamic growing), T is data type of item\n",
	)

	static_array := [3]f32{1, 2, 3}
	fmt.printf("Value of `[3]f32{{1, 2, 3}}`: %v\n", static_array)

	dynamic_array := make([dynamic]f32, 3)
	defer delete(dynamic_array)

	dynamic_array[0] = 4
	dynamic_array[1] = 5
	dynamic_array[2] = 6
	fmt.printf("Value of `[dynamic]f32` = %v\n", dynamic_array)

	fmt.println("")
	fmt.printf("Good, next goto next concept, slice:\n")
	fmt.printf("The syntax of slice is simple: `[]T`, which T is data type of item.\n")
	fmt.printf(
		"But, the eval in the details, underlying, it's a struct contains length and pointer to data, it's like `Span<T>` from C#, but in language-level.\n",
	)
	fmt.printf(
		"When the slices are a language feature, you have some syntax sugars to make working with slice easier.\n",
	)

	fmt.printf(
		"You can easy create a slice from array. The syntax is `array[S:E]`, which S is start index, E is end index (exclusive).\n",
	)

	fmt.printf("In common case, you want cast array to slice which full size, use [:]\n")

	fmt.printf("Value of `[3]f32` after cast to slice: %v\n", static_array[:])
	fmt.printf("Value of `[dynamic]f32` after cast to slice: %v\n", dynamic_array[:])

	fmt.printf("Value of slice from range 1:3 of `[3]f32`: %v\n", static_array[1:3])

	fmt.println()
	fmt.printf(
		"And the last concept, multi pointer, a pointer to multi items (no size, just address).\n",
	)
	fmt.printf("For short, its just C pointer, but cheat as array.\n")
	fmt.printf("It's used for foreign procedure bindings.\n")
	fmt.printf(
		"This is other good features, that help your API cleaner, even the C functions are used in Odin mean safer (no misleading with pointer and array).\n",
	)
	fmt.printf(
		"Because multi pointer is just a pointer, we just need get the pointer from array or slice, with raw_data() procedure.\n",
	)
	fmt.printf(
		"Value of raw_data(static_array[:]): %v. Note: we cannot get ptr from static array\n",
		raw_data(static_array[:]),
	)
	fmt.printf("Value of raw_data(dynamic_array): %v\n", raw_data(dynamic_array))

	fmt.println()
	fmt.printf("Let reverse engineering dynamic array.\n")
	fmt.printf("Size of [dynamic]int: %v\n", size_of([dynamic]int))
	fmt.printf(
		`Based on the size of [dynamic]int, struct layout maybe: 
		struct {{ 
			len, cap: 	int, 
			data: 		rawptr, 
			allocator: 	runtime.Allocator, 
		}}`,
	)
	fmt.println()

	Dynamic_Array_Details :: struct {
		len, cap:  int,
		data:      rawptr,
		allocator: runtime.Allocator,
	}
	dynamic_array_details := transmute(Dynamic_Array_Details)dynamic_array
	fmt.printf("Value of dynamic_array_details: %v\n", dynamic_array_details)
	fmt.printf(
		"Look like the len are wrong, let check the docs of Odin. Found out we have runtime.Raw_Dynamic_Array.\n",
	)
	fmt.printf(
		"Value of transmute(runtime.Raw_Dynamic_Array)dynamic_array: %v\n",
		transmute(runtime.Raw_Dynamic_Array)dynamic_array,
	)
	fmt.printf("Good looking now! So the struct layout of a dynamic array is:")
	fmt.printf(
		`
	struct {{
		data: 		rawptr, 
		len, cap: 	int, 
		allocator: 	runtime.Allocator, 
	}}	
	`,
	)

	fmt.println()
	fmt.printf("Skip the prediction, jump direct into the doc, the struct of slice look like:")
	fmt.printf(`
	struct {{
		data: 		rawptr, 
		len: 		int,
	}}	
	`)

	fmt.println()
	fmt.printf(
		"Value of transmute(runtime.Raw_Slice)dynamic_array[:]: %v\n",
		transmute(runtime.Raw_Slice)dynamic_array[:],
	)

	// fmt.printf(
	// 	"If you look closer, Odin prefer but the data member intro front, because this will support transmute ops on slice to multi pointer.\n",
	// )

	fmt.println()
	fmt.printf(
		"Conclusion, the bulk data types work like exactly what Bitsquid Foundation design goals, but with features that make code better.\n",
	)

	fmt.println()
	fmt.printf(
		"See the code in array_slice_multi_pointer/main.odin (you can double click to open file in some terminals)\n",
	)
}
