package memory

import "core:fmt"
import "base:runtime"

main :: proc() {
    fmt.printf("Hellope! We will do some experiment with memory manage in Odin.\n")
    fmt.printf("Conceptually, Odin come with context system, holding allocator and temp_allocator for memory allocations.\n")

    fmt.println()
    fmt.printf("Let see what a context structure look like: %v\n", runtime.default_context())

    fmt.println()
    fmt.printf("Hard to see? Let find the definition of its: \n")
    fmt.printf("Context :: struct {{\n")
    fmt.printf("    allocator:              Allocator,\n")
	fmt.printf("    temp_allocator:         Allocator,\n")
	fmt.printf("    assertion_failure_proc: Assertion_Failure_Proc,\n")
	fmt.printf("    logger:                 Logger,\n")
	fmt.printf("    random_generator:       Random_Generator,\n")
	fmt.printf("    user_ptr:               rawptr,\n")
	fmt.printf("    user_index:             int,\n")
	fmt.printf("    // Internal use only    \n")
	fmt.printf("    _internal:              rawptr,\n")
    fmt.printf("}}\n")

    fmt.println()
    fmt.printf("Yeah! Its just simple in struct contains global data for all common usages: memory allocations, logging, random generators, assertion handling.\n")
    fmt.printf("And a robust system/runtime should look like that.\n")
    fmt.printf("You can exploring big game engine code (idTech, Unreal Engine, engine from GEA book), they will have similars things like this.\n")
    fmt.printf("Comparing with Bitsquid Foundation, they do the same, but implementations and terms may have some slight differences.\n")
    fmt.printf("But when force user to passing around context structs or allocators, its may be make the code verbose, take longer to typing, the look code more dense.\n")
    fmt.printf("Fortunately, Odin have default arguments, and implicit context calling convention.\n")
    fmt.printf("Please reading the core:strings source code, that a starter point the see how working with small and often memory allocations.\n")

    fmt.println()
    fmt.printf("Okay, that all things need to know about context system, let move other rule: pointer arithmetic is avoid.\n")
    fmt.printf("Pointer arithmetic are consider harmful in practice, it hard to see and recognize where the variable are pointers or not.\n")
    fmt.printf("So, Odin provide ptr_offset, ptr_sub as replacement, we can still manipulate pointer address, but avoid headache of pointer arithmetric.\n")

    fmt.println()
    fmt.printf("Memory management are big topics, that I cant cover all this file, please read theses articles of Gingle Bill (author of Odin):\n")
    fmt.printf("- https://www.gingerbill.org/series/memory-allocation-strategies/ (double click to open the url in some terminal).\n")

    fmt.println()
    fmt.printf("See the code from memory/main.odin (double click can open the file in some terminal)\n")
}