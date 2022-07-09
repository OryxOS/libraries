module system.io;

import au.types;

import syscalls.oryx;

static immutable pixel[4] colours = [0xFDFAEF, 0x3A4D53, 0x00866B, 0xEDEDED];

void writefln(T...)(const string fmt, T args) {
	writef(fmt, args);
	put_chr('\n', colours[1]);
}

void writef(T...)(const string fmt, T args) {
	uint strPos;

	foreach (arg; args) {
		// look for format specifier
		for (uint i = strPos; i < fmt.length; i++) {
			if (fmt[i] == '%') {
				switch (fmt[i + 1]) {
				// String
				case 's':
					put_arg(arg, true);
					break;

				// Char
				case 'c':
					put_arg(arg, true);
					break;

				// Boolean
				case 'l':
					put_arg(arg, true);			
					break;

				// Decimal number
				case 'd':
					put_arg(arg, true);
					break;
				
				// hexadecimal numner
				case 'h':
					put_arg(arg, false);
					break;

				default:
					assert(0, "Format specifier expected");
				}
				strPos = i + 2; // % + Format specifier
				break;
			} else {
				put_chr(fmt[i], colours[1]);
			}
		}
	}

	// Print remainder of string after last format specifier
	for (int i = strPos; i < fmt.length; i++) {
		put_chr(fmt[i], colours[1]);
	}
}

/* The following is boilerplate, but is unfortunately the 
 * best option using BetterC, which doesn't have typeinfo
 */

// Yes, the bool here is neccessary because of how templates work
void put_arg(string item, bool dec) {
	put_str(item);
}

void put_arg(char item, bool dec) {
	put_chr(item, colours[1]);
}

void put_arg(bool item, bool dec) {
	if (item == true) {
		put_str("true", colours[2]);
	} else {
		put_str("false", colours[2]);
	}
}

void put_arg(void* item, bool dec) {
	dec ? print_dec(cast(usize) item) : print_hex(cast(usize) item);
}

void put_arg(ulong item, bool dec) {
	dec ? print_dec(item) : print_hex(item);
}

void put_arg(uint item, bool dec) {
	dec ? print_dec(cast(ulong) item) : print_hex(cast(ulong) item);
}

void put_arg(ushort item, bool dec) {
	dec ? print_dec(cast(ulong) item) : print_hex(cast(ulong) item);
}

void put_arg(ubyte item, bool dec) {
	dec ? print_dec(cast(ulong) item) : print_hex(cast(ulong) item);
}

//////////////////////////////
//        Formatting        //
//////////////////////////////

private immutable TableB16 = "0123456789ABCDEF";
private immutable TableB10 = "0123456789";

// Integer to Hexadecimal conversion
private void print_hex(ulong item) {
	char[16] buf;

	if (item == 0) {
		put_str("0x0", colours[2]);
		return;
	}

	put_str("0x", colours[2]);
	for (int i = 15; item; i--) {
		buf[i] = TableB16[item % 16];
		item /= 16;
	}

	foreach(c; buf) {
		// Don't print unused whitespace
		if (c != char.init) {
			put_chr(c, colours[2]);
		}
	}
}

private void print_dec(ulong item) {
	char[32] buf;

	if (item == 0) {
		put_str("0", colours[2]);
		return;
	}

	for (int i = 31; item; i--) {
		buf[i] = TableB10[item % 10];
		item /= 10;
	}

	foreach(c; buf) {
		// Don't print unused whitespace
		if (c != char.init) {
			put_chr(c, colours[2]);
		}
	}
}

void put_str(const string s, uint col = colours[1]) {
	foreach (c; s) {
		put_chr(c, col);
	}
}
