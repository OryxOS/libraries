module system.io;

import au.types;

import syscalls.oryx;

static immutable pixel[4] theme = [0xFDFAEF, 0x3A4D53, 0x00866B, 0xEDEDED];

void writefln(T...)(const string fmt, T args) {
	writef(fmt, args);
	putChr('\n', theme[1]);
}

void writef(T...)(const string fmt, T args) {
	uint strPos;

	foreach (arg; args) {
		// look for format specifier
		for (uint i = strPos; i < fmt.length; i++) {
			if (fmt[i] == '%') {
				switch (fmt[i + 1]) {
				case 's':              // String
					putItem(arg, true);
					break;

				case 'c':
					putItem(arg, true);
					break;

				case 'l':              // Bool
					putItem(arg, true);			
					break;

				case 'd':              // Decimal
					putItem(arg, true);
					break;

				case 'h':              // Hexadecimal
					putItem(arg, false);
					break;

				default:
					assert(0, "Format specifier expected");
				}
				strPos = i + 2;       // % + Format specifier
				break;
			} else {
				putChr(fmt[i]);
			}
		}
	}

	// Print remainder of string after last format specifier
	for (int i = strPos; i < fmt.length; i++) {
		putChr(fmt[i], theme[1]);
	}
}

/* The following is boilerplate, but is unfortunately the 
 * best option using BetterC, which doesn't have typeinfo
 */

// Yes, the bool here is neccessary because of how templates work
void putItem(string item, bool dec) {
	putStr(item);
}

void putItem(char item, bool dec) {
	putChr(item, theme[1]);
}

void putItem(bool item, bool dec) {
	if (item == true) {
		putStr("true", theme[2]);
	} else {
		putStr("false", theme[2]);
	}
}

void putItem(void* item, bool dec) {
	dec ? printDecNum(cast(usize) item) : printHexNum(cast(usize) item);
}

void putItem(ulong item, bool dec) {
	dec ? printDecNum(item) : printHexNum(item);
}

void putItem(uint item, bool dec) {
	dec ? printDecNum(cast(ulong) item) : printHexNum(cast(ulong) item);
}

void putItem(ushort item, bool dec) {
	dec ? printDecNum(cast(ulong) item) : printHexNum(cast(ulong) item);
}

void putItem(ubyte item, bool dec) {
	dec ? printDecNum(cast(ulong) item) : printHexNum(cast(ulong) item);
}

//////////////////////////////
//        Formatting        //
//////////////////////////////

private immutable TABLE_B16 = "0123456789ABCDEF";
private immutable TABLE_B10 = "0123456789";

// Integer to Hexadecimal conversion
private void printHexNum(ulong item) {
	char[16] buf;

	if (item == 0) {
		putStr("0x0", theme[2]);
		return;
	}

	putStr("0x", theme[2]);
	for (int i = 15; item; i--) {
		buf[i] = TABLE_B16[item % 16];
		item /= 16;
	}

	foreach(c; buf) {
		// Don't print unused whitespace
		if (c != char.init) {
			putChr(c, theme[2]);
		}
	}
}

private void printDecNum(ulong item) {
	char[32] buf;

	if (item == 0) {
		putStr("0", theme[2]);
		return;
	}

	for (int i = 31; item; i--) {
		buf[i] = TABLE_B10[item % 10];
		item /= 10;
	}

	foreach(c; buf) {
		// Don't print unused whitespace
		if (c != char.init) {
			putChr(c, theme[2]);
		}
	}
} 

//////////////////////////////
//         Syscalls         //
//////////////////////////////

void putStr(const string s, uint col = theme[1]) {
	foreach (c; s) {
		putChr(c, col);
	}
}
