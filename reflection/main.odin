package reflection

import "core:fmt"
import "core:time"

main :: proc() {
	fmt.printf(
		"Hellope! Let some reflection in Odin languagee (even Bitsquid usually not prefer reflection)\n",
	)
	fmt.printf(
		"Reflection in Odin work like GoLang, with RTTI and struct tags, come with compiler intrinsics.\n",
	)

	// context_type_info := type_info_of(typeid_of(type_of(context)))
	fmt.printf("Let see Type_Info of an int: %#v\n", type_info_of(int)^)

	fmt.printf(
		"Let see if RTTI worked on runtime or compile-time, we will do an 1000 iterations loop to get type_info_of int.\n",
	)

	sum := 0
	start := time.now()
	for i in 0 ..< 1000 {
		x := 1
		sum += x
	}

	fmt.printf(
		"Elapse time of loop without type_info_of (sum = %d): %vns\n",
		sum,
		time.duration_nanoseconds(time.since(start)),
	)

	sum = 0
	start = time.now()
	for i in 0 ..< 1000 {
		x := type_info_of(int)
		sum += x.size
	}

	fmt.printf(
		"Elapse time of loop has type_info_of (sum = %d): %vns\n",
		sum,
		time.duration_nanoseconds(time.since(start)),
	)
	fmt.printf(
		"I see that elapsed time of two loops are closed (run odin with -o:none), but if you in doubt, copy the code to godbolt and check the results assembly.\n",
	)

	fmt.println()
	fmt.printf(
		"See the code at reflection/main.odin (double click to open the file in some terminal)\n",
	)
}
