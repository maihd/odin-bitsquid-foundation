package reflection

import "base:intrinsics"
import "base:runtime"
import "core:fmt"
import "core:reflect"
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
	fmt.printf(
		"After look at generated assembly code, I found that type_info_of just a intrinsics that translated to accessing global variable that hold data with type of Type_Info.\n",
	)

	fmt.println()
	fmt.printf(
		"Let see other feature, one of good and simple reflection syntax helping Go and Odin do serialization, struct fields tags.\n",
	)

	Login_Request :: struct {
		username: string `json:"username"`,
		password: string `json:"password"`,
	}

	login_request_tags := reflect.struct_field_tags(Login_Request)

	fmt.printf(
		"Assume we have this struct: %v :: %#v\n",
		typeid_of(Login_Request),
		runtime.type_info_base(type_info_of(typeid_of(Login_Request))),
	)
	fmt.printf(
		"Type info of field `username`: %v - with json tag: %v\n",
		typeid_of(intrinsics.type_field_type(Login_Request, "username")),
		reflect.struct_tag_get(login_request_tags[0], "json"),
	)
	fmt.printf(
		"Type info of field `password`: %v - with json tag: %v\n",
		typeid_of(intrinsics.type_field_type(Login_Request, "password")),
		reflect.struct_tag_get(login_request_tags[1], "json"),
	)

	fmt.println()
	fmt.printf(
		"I dont deep dive into reflection rabbit holes, it's have more usages than just serialization.\n",
	)
	fmt.printf(
		"But reflection are big and maybe complex topics, even that Odin just mimic Go for simplicity.\n",
	)
	fmt.printf("You can learn more from Odin core:reflect and core:encoding/json source code.\n")

	fmt.println()
	fmt.printf(
		"See the code at reflection/main.odin (double click to open the file in some terminal)\n",
	)
}
