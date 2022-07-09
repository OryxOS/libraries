module au.types;

/// 32 bit pixel
alias pixel = uint;

/// Largest per-arch integer
version (X86_64) {
    alias usize = ulong;
    alias isize = long;
}
