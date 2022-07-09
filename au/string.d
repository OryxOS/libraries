module au.string;

import au.types;

private usize get_str_len(const char* str) {
	usize len;
	for(len = 0; str[len] != '\0'; len++) {}

	return len;
}

/// Converts a C style string to a D style string
string from_c_string(const char* str) {
	return str != "\0" ? cast(string) str[0..get_str_len(str)] : "";
}