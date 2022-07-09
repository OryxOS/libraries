module au.bitmap;

import au.types;

// Module for working with bitmaps, used in both our heap and physical allocator

/// Standard bitmap structure
struct BitMap {
	ubyte* map;     // The actual bitmap
	usize size;     // Size (bits) of the bitmap
	usize next_free; // Next available bit
	bool   full;

	this(ubyte* map, usize size) {
		this.map = map;
		this.size = size;
	}

    /// Checks if a bit is set
	bool test_bit(usize bit) {
		assert(bit <= this.size);
		return !!(map[bit / 8] & (1 << (bit % 8)));
	}
	
	/// Sets a bit
	void set_bit(usize bit) {
		assert(bit <= this.size);
		this.map[bit / 8] |= (1 << (bit % 8));
	}

	/// Unsets a bit
	void unset_bit(usize bit) {
		assert(bit <= this.size);
		this.map[bit / 8] &= ~(1 << (bit % 8));
	}
}
