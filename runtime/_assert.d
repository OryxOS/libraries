deprecated("Compiler intrinsics. Do not invoke") module runtime._assert;

import system.io;

extern (C) void __assert(const char* exp, const char* file, uint line) {
    putStr("Userland assert has been triggered!\n");
}