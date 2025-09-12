#+feature dynamic-literals
package map

import "core:fmt"
import "base:runtime"
import "base:intrinsics"

main :: proc() {
    fmt.printf("Hellope! Let's deep dive into Hash Map of Odin\n")
    fmt.printf("Map are a data type embedded directly to Odin language-level.\n")
    fmt.printf("With nice and simple syntaxes: `map[K]V`, which map is keyword, K is key data type, V is value data type.\n")
    
    str_dict:= make(map[string]string)
    defer delete(str_dict)

    str_dict["A"] = "First character of alphabet"
    str_dict["B"] = "Is second character of alphabet"

    fmt.printf("Value for str_dict: %v\n", str_dict)

    fmt.println()
    fmt.printf("One other good thing of Odin Map, is that it supporting syntax to create map like JS. (Require #+feature dynamic-literals)\n")
    str_dict_like_js := map[string]string{
        "C" = "The third character",
        "D" = "The character after C character"
    }
    defer delete(str_dict_like_js) // map is always allocated on heap

    fmt.printf("Value of str_dict_like_js: %v\n", str_dict_like_js)

    fmt.printf("Let do some checking when work with map. \"A\" in str_dict = %v\n", "A" in str_dict)

    fmt.println()
    fmt.printf("For the case HashMap of Bitsquid Foundation only supports hash value as key for map.\n")
    fmt.printf("You can use map[u32]T or map[u64]T. But the algorithms underlying are unsure. So we move to next topic.\n")

    fmt.println()
    fmt.printf("Let's reverse engineering the map memory layout.\n")
    fmt.printf("Size of map[string]string: %d\n", size_of(map[string]string))
    fmt.printf("Size of len(map[string]string): %d\n", size_of(len(str_dict)))
    fmt.printf("Size of cap(map[string]string): %d\n", size_of(cap(str_dict)))
    // fmt.printf("Can we do raw_data(map[string]string): %p\n", raw_data(str_dict))
    // -> No, we cant get raw_data of map

    fmt.printf("Maybe the struct look like: struct {{ len, cap: int, nexts: [^]int, key_value_pairs: [^]KV }}\n")

    fmt.println()
    fmt.printf("Let make transarent by transmute to an intermediate struct.\n")
    Map_Details :: struct {
        len, cap: int,
        nexts: [^]int,
        key_value_pairs: [^]struct {
            key: string,
            value: string
        }
    }
    str_dict_details := transmute(Map_Details)str_dict
    fmt.printf("str_dict_details.len: %v\n", str_dict_details.len)
    fmt.printf("str_dict_details.cap: %v\n", str_dict_details.cap)
    fmt.printf("str_dict_details.nexts: %v\n", str_dict_details.nexts)
    fmt.printf("str_dict_details.key_value_pairs: %v\n", str_dict_details.key_value_pairs)

    fmt.println()
    fmt.printf("I predicted wrong struct layout. Do some reflection may help.\n")

    str_dict_info := intrinsics.type_map_info(type_of(str_dict))
    fmt.printf("Map_Info: %v\n", str_dict_info)
    fmt.printf("Map_Info keys info: %v\n", str_dict_info.ks)
    fmt.printf("Map_Info values info: %v\n", str_dict_info.vs)

    fmt.println()
    fmt.printf("Found out Odin have Raw_Map, help destruct map fields.\n")
    fmt.printf("Raw_Map of str_dict: %v\n", transmute(runtime.Raw_Map)str_dict)
    fmt.printf("Size of Allocator: %v\n", size_of(runtime.Allocator))
    fmt.printf("Finally, we can conclusion that, Odin map are not the same with Bitsquid Foundation HashMap.\n")
    fmt.printf("If you truely want the exact Open Addressing Hash Map like Bitsquid Foundation, create a custom struct are enough.\n")

    fmt.println()
    fmt.printf("See code in hash_map/main.odin (you can double click to open file in some terminal)")
}