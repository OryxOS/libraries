module libraries.au.result;

/* OryxOS Result<T, E> implementation
 * This is a Result<T, E> implementation similar to that found in languages
 * such as rust.
 */

struct Result(T, E) {
	private T    result;  // Result presuming success
	private E    error;   // Error presuming failure

	bool is_good;          // Was the funtion successful (is result valid)

	this (T good) {
		result = good;
		is_good = true;
	}

	this (E fail) {
	   error = fail;
	   is_good = false;
	}

	T unwrap_result(string message = "Unwrap failed: no result") {
		assert(is_good, message);

		return result;
	}

	E unwrap_error(string message = "Unwrap failed: no error") {
		assert(!is_good, message);

		return error;
	}
}