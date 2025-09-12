# Odin Bitsquid Foundation
If Bitsquid was written in Odin. 
Source code of Bitsquid Foundation: https://github.com/niklas-ourmachinery/bitsquid-foundation

## Design of this repo
I'm exploring the idea of interactive blog. It's mean I will provide the code with well written printing messages.
You can run the code to show the messages, edit and experiment you idea. Fortunately, Odin provide simple command to run program,
with the prompt: `odin run <folder>`. Let try it!
> **NOTE:** The output messages have not been looking good now, but I will apply some techniques into printing pretty message to terminal and TUI. 


## Disclaimer
You looking for source code of the library, really? Odin basically come with the same mindset with Bitsquid Foundation.
So currently, this repo just for exploring what Odin offer, do I need add more features or not.
And for learning purposes, we should do some coding. So I organize concepts, data structures and algorithm into sections.
Let's exploring it by yourself.


## Bitsquid Foundation's Library Design
>foundation has been written with data-oriented programming in mind (POD data is preferred over complicated classes, flat arrays are the preferred data structure, etc).
>
>foundation is written in a "back-to-C" style of C++ programming. This means that there is a clear separation between data and code. Data defitions are found in _types.h header files. Function definitions are found in .h header files.
>
>When you are writing a system using foundation, your header files typically only need to include the _types.h files. These are designed to be as compact as possible, meaning your compile times will be short. In the .cpp files you can include the heavier .h files.
>  -- Bitsquid Foundation --
>* **Open structs.** Raw POD structs defined in the \_types.h file. You can directly manipulate the members of these structs.
>
>* **Closed structs.** A closed struct is indicated by the fact that its members start with underscore. You should not manipulate the members of a closed struct directly. Instead, use the functions in the namespace with the same name as the struct. (In this case, object::). These functions are found in the .h file, unlike the struct definition, which is in the \_types.h file.
>
>    Note that since namespaces are "open" you can extend the functionality for the object by adding your own functions to its namespace.
>
>* **Abstract classes.** Used for high-level systems that are only accessed through pointers and/or references. There are predeclared in the \_types.h


## Odin features that embrace Bitsquid Foundation's Library Design
- Struct can only have public members
- Struct have no methods
- No namespace, but package work like open namespace approachs
- You can add more procedures to work with data types, but no need to break the struct, or file
- Bitsquid Foundation's Data types are included in language-level, with good syntaxes: string, array, hash map, queue, allocator, math types
- Bitsquid Foundation's Algorithms are included in language-level: murmur hash (and others), math, memory, string stream, string builder
- Memory layout awareness for struct, with syntaxes and builtin procedures: align, align_of, bit_field
- Working with pointer procedures, and forbidden pointer arithmetic: ptr_sub, ptr_offset


## Table of Contents
- Array, slice, multi items
- Map
- Memory Management