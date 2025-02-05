- macOS M1 Max with Sonoma version 14.6.1
- Odin, commit `b86d2c3`
- `/opt/homebrew/Cellar/llvm@17/17.0.6/`

Mostly this happens:

```
$ ./build.sh
./build.sh: line 23: 90206 Segmentation fault: 11  ./build/exe
```

Sometimes this:

```
$ ./build.sh
/<my-path-to-odin>/Odin/core/fmt/fmt.odin(2509:8) panic: Invalid union tag type
./build.sh: line 23: 90880 Trace/BPT trap: 5       ./build/exe
```

And rarely this:

```
$ ./build.sh
%!(BAD ENUM VALUE=4365655997)
We made it past the DLL init proc! :)
```
