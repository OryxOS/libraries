deprecated("Compiler intrinsics. Do not invoke") module runtime._assert;

import au.string;

import syscalls.oryx;

import system.io;

extern (C) void __assert(const char* exp, const char* file, uint line) {
	writefln("Non-recoverable error has occured at [%s:%d]: \"%s\"", 
	         from_c_string(file),
			 line,
			 from_c_string(exp)
	);

    exit();
}