module syscalls.oryx;

// OryxOS syscall implementations

extern (C) void putChr(char chr, uint col) {
    asm {
        mov R10, 0;
        mov RDI, chr;
        mov RSI, col;
        syscall;
    }
}