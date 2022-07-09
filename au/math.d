module au.math;
// Module containing useful mathematical functions

/// Divides, rounding up if remainder is > 0
/// Params:
/// 	num = number to be divided
/// 	den = number to divide by
auto div_round_up(T)(T num, T den) {
	return (num + (den - 1)) / den; 
}

/// Alignes a value up to a given alignment
/// Params:
/// 	num       = number to align
/// 	alignment = value to align num to
auto align_up(T)(T num, T alignment) {
	return div_round_up(num, alignment) * alignment;
}

/// Alignes a value down to a given alignment
/// Params:
/// 	num       = number to align
/// 	alignment = value to align num to
auto align_down(T)(T num, T alignment) {
	return (num / alignment) * alignment;
}
