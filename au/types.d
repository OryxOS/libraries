module au.types;

/// Physical and Virtual memory addresses, Virtual ones should be > than 0xFFFF800000000000
alias VirtAddress = void*;
alias PhysAddress = void*;

/// 32 bit pixel
alias pixel = uint;

/// Largest per-arch integer
version (X86_64) {
    alias usize = ulong;
    alias isize = long;
}
