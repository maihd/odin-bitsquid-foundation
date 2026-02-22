package odin_bitsquid_foundation

import "core:c/libc"
import "core:strings"
import "core:strconv"
import "core:bufio"
import "core:fmt"
import "core:os"

main :: proc() {
    root_dir_fd, err := os.open(".")
    if err != nil {
        fmt.eprintf("Failed to open fd of current folder. Error: %v\n", err)
        return
    }

    root_dir, err2 := os.read_dir(root_dir_fd, -1)
    if err2 != nil {
        fmt.eprintf("Failed to read entries of current folder. Error: %v\n", err2)
    }

    examples := make([dynamic]os.File_Info)
    for entry in root_dir {
        if entry.is_dir && entry.name != ".git" {
            append(&examples, entry)
        }
    }

    r: bufio.Reader
    buffer: [1024]byte
    bufio.reader_init_with_buf(&r, os.stream_from_handle(os.stdin), buffer[:])

    for true {
        fmt.printf("Examples:\n")

        for example, index in examples {
            fmt.printf("  - %d. %s\n", index, example.name)
        }

        fmt.printf("Your choice: ")
        line, err := bufio.reader_read_string(&r, '\n')
        defer delete(line)

        if err != nil {
            fmt.eprintf("Failed to read input, choose again!\n\n")
            continue
        }

        trim_line := strings.trim(line, " \n\r\t")
        choice, ok := strconv.parse_int(trim_line)
        if !ok {
            fmt.eprintf("You must input chosen example in number!\n\n")
            continue
        }

        cmd := fmt.tprintf("odin run %q", examples[choice].fullpath)

        cmd_cstr, mem_err := strings.clone_to_cstring(cmd)
        defer delete(cmd_cstr)

        if mem_err != nil {
            fmt.eprintf("Failed to convert cmd to cstring. Error: %v\n", mem_err)
            continue
        }

        libc.system(cmd_cstr)

        // fmt.printf("Press any key to do again...\n")
    }
}