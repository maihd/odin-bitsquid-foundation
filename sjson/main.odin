package sjson_sample

import "core:encoding/json"
import "core:fmt"

main :: proc() {
	fmt.printf("Hellope! Bitsquid Engine has it own data file format called Simplified JSON.\n")
	fmt.printf("See the benifits of sjson, Odin core support its natively.\n")

	User_Info :: struct {
		name:  string,
		email: string,
	}

	user_info := User_Info {
		name  = "maihd",
		email = "maihd.dev@gmail.com",
	}

	fmt.println()
	fmt.printf("Asumming we have this struct: %#v\n", user_info)

	json_str, _ := json.marshal(user_info, {pretty = true, spec = .JSON})
	fmt.printf("The JSON representation is: %s\n", json_str)

	sjson_str, _ := json.marshal(user_info, {pretty = false, spec = .SJSON})
	fmt.printf("The SJSON representation is: %s\n", sjson_str)

	fmt.println()
	user_info_2: User_Info
	json.unmarshal(sjson_str, &user_info_2, .SJSON)
	fmt.printf("Let parsing the SJSON back to User_Info: %#v\n", user_info_2)

	fmt.println()
	fmt.printf("Yeah, just like that, sjson is battery included in Odin, worked seamlessly.\n")
	fmt.printf("It make Odin more like a Bitsquid Foundation.\n")
	fmt.printf(
		"Check the blog about SJSON specs: https://bitsquid.blogspot.com/2009/10/simplified-json-notation.html\n",
	)

	fmt.println()
	fmt.printf("See the code at sjson/main.odin (double click to open the in some terminals)\n")
}
