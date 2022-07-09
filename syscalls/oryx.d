module syscalls.oryx;

// OryxOS syscalls

import au.elf;
import au.types;

extern (C) void yield() {
	asm {
		// Save registers
		push RAX ;
 		push RBX ;
 		push RCX ;
 		push RDX ;
 		push RBP ;
 		push RSI ;
 		push RDI ;
 		push R8  ;
 		push R9  ;
 		push R10 ;
 		push R11 ;
 		push R12 ;
 		push R13 ;
		push R14 ;
		push R15 ;

		mov R10, 0;
		syscall;

		// Restore registers
		pop R15 ;
		pop R14 ;
		pop R13 ;
		pop R12 ;
		pop R11 ;
		pop R10 ;
		pop R9  ;
		pop R8  ;
		pop RDI ;
		pop RSI ;
		pop RBP ;
		pop RDX ;
		pop RCX ;
		pop RBX ;
		pop RAX ;
	}
}

extern (C) void exit() {
	asm {
		// Save registers
		push RAX ;
 		push RBX ;
 		push RCX ;
 		push RDX ;
 		push RBP ;
 		push RSI ;
 		push RDI ;
 		push R8  ;
 		push R9  ;
 		push R10 ;
 		push R11 ;
 		push R12 ;
 		push R13 ;
		push R14 ;
		push R15 ;

		mov R10, 1;
		syscall;

		// Restore registers
		pop R15 ;
		pop R14 ;
		pop R13 ;
		pop R12 ;
		pop R11 ;
		pop R10 ;
		pop R9  ;
		pop R8  ;
		pop RDI ;
		pop RSI ;
		pop RBP ;
		pop RDX ;
		pop RCX ;
		pop RBX ;
		pop RAX ;
	}
}

//////////////////////////////
//         Temporary        //
//////////////////////////////

extern (C) void put_chr(char chr, uint col) {
	asm {
		// Save registers
		push RAX ;
 		push RBX ;
 		push RCX ;
 		push RDX ;
 		push RBP ;
 		push RSI ;
 		push RDI ;
 		push R8  ;
 		push R9  ;
 		push R10 ;
 		push R11 ;
 		push R12 ;
 		push R13 ;
		push R14 ;
		push R15 ;

		mov R10, 2   ;
		mov RDI, chr ;
		mov RSI, col ;
		syscall      ;

		// Restore registers
		pop R15 ;
		pop R14 ;
		pop R13 ;
		pop R12 ;
		pop R11 ;
		pop R10 ;
		pop R9  ;
		pop R8  ;
		pop RDI ;
		pop RSI ;
		pop RBP ;
		pop RDX ;
		pop RCX ;
		pop RBX ;
		pop RAX ;
	}
}

extern (C) void clear_console() {
	asm {
		// Save registers
		push RAX ;
 		push RBX ;
 		push RCX ;
 		push RDX ;
 		push RBP ;
 		push RSI ;
 		push RDI ;
 		push R8  ;
 		push R9  ;
 		push R10 ;
 		push R11 ;
 		push R12 ;
 		push R13 ;
		push R14 ;
		push R15 ;

		mov R10, 3;
		syscall;

		// Restore registers
		pop R15 ;
		pop R14 ;
		pop R13 ;
		pop R12 ;
		pop R11 ;
		pop R10 ;
		pop R9  ;
		pop R8  ;
		pop RDI ;
		pop RSI ;
		pop RBP ;
		pop RDX ;
		pop RCX ;
		pop RBX ;
		pop RAX ;
	}
}

extern (C) void show_cursor(bool show) {
	asm {
		// Save registers
		push RAX ;
 		push RBX ;
 		push RCX ;
 		push RDX ;
 		push RBP ;
 		push RSI ;
 		push RDI ;
 		push R8  ;
 		push R9  ;
 		push R10 ;
 		push R11 ;
 		push R12 ;
 		push R13 ;
		push R14 ;
		push R15 ;

		mov R10, 4    ;
		mov RDI, show ;
		syscall       ;

		// Restore registers
		pop R15 ;
		pop R14 ;
		pop R13 ;
		pop R12 ;
		pop R11 ;
		pop R10 ;
		pop R9  ;
		pop R8  ;
		pop RDI ;
		pop RSI ;
		pop RBP ;
		pop RDX ;
		pop RCX ;
		pop RBX ;
		pop RAX ;
	}
}

extern (C) char get_keystroke() {
	char output; 

	asm {
		// Save registers
		push RAX ;
 		push RBX ;
 		push RCX ;
 		push RDX ;
 		push RBP ;
 		push RSI ;
 		push RDI ;
 		push R8  ;
 		push R9  ;
 		push R10 ;
 		push R11 ;
 		push R12 ;
 		push R13 ;
		push R14 ;
		push R15 ;

		mov R10, 5 ;
		syscall    ;

		mov output, RAX ;

		// Restore registers
		pop R15 ;
		pop R14 ;
		pop R13 ;
		pop R12 ;
		pop R11 ;
		pop R10 ;
		pop R9  ;
		pop R8  ;
		pop RDI ;
		pop RSI ;
		pop RBP ;
		pop RDX ;
		pop RCX ;
		pop RBX ;
		pop RAX ;
	}

	return output;
}