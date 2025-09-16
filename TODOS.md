# Todos

## Flags and bit_set
- Add proof when boolean make padding, bad for struct layout
- Add proof when boolean make configuration are hard, too centered
- Add proof when boolean make procedural api are harder understand
- Cases that boolean are good
- More advantages of flags


## More Topics
- String
- SJSON
- Code structure:
    - Odin compile time are good
    - Odin prefer POD, avoid completely inheritance by dont had it
    - Odin code are clean, more relaxed than C, easy to read and recognize patterns
    - Odin follow DoD, data and code are seperated, processing data with procedures
    - No methods, no class, no v-table, no grouping data and code into single object
    - Embrace system-based programming, combine with compression programming to manage codebase
- Error handling:
    - Error context
    - Crashing as unignorable error
    - Return multiple values and or_* operator
    - Logging supported by context system
    - Context pass as last argument
- Math
- Follow on one of good philosiphy: 
    - Modern computer are fast, so dont pessimize your code, plain and simple are fast enough
    - Struct as based concepts for every data structures (in real life it must more complex than this)
- Source code in Odin, converted from Bitsquid blogs.