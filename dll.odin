package dll

import "core:fmt"

G :: 1

@(export)
dll_init :: proc() {
	crash := fmt.tprintf("%v", G)

	fmt.println("Hello from DLL!")
}
