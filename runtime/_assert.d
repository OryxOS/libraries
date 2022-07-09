deprecated("Compiler intrinsics. Do not invoke") module runtime._assert;

import system.io;

extern (C) void __assert(const char* exp, const char* file, uint line) {
    put_str("Userland assert has been triggered!\n");
}