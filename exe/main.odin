package exe

import "base:runtime"

import "core:dynlib"
import "core:fmt"
import "core:os/os2"
import "core:path/filepath"

DLL_PATH :: "./dll.dylib"

DLL :: struct {
	__handle: dynlib.Library,
	init:     proc(),
}

dll: DLL
ctx: runtime.Context

load_dll :: proc() -> (dll: DLL, ok: bool) {
	_, ok = dynlib.initialize_symbols(&dll, DLL_PATH, "dll_")
	return dll, ok
}

main :: proc() {
	ctx = context

	exe_path := os2.args[0]
	exe_dir := filepath.dir(string(exe_path), context.temp_allocator)
	os2.set_working_directory(exe_dir)

	dll_ok: bool

	dll, dll_ok = load_dll()
	if !dll_ok {
		fmt.eprintfln("Failed initializing symbols: {0}", dynlib.last_error())
		return
	}

	dll.init()
	fmt.printfln("We made it past the DLL init proc! :)")

	free_all(context.temp_allocator)
}

init :: proc "c" () {
	context = ctx

	dll.init()
}
