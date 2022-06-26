module libraries.au.result;

/* OryxOS Result<T, E> implementation
 * This is a Result<T, E> implementation similar to that found in languages
 * such as rust.
 */

struct Result(T, E) {
	private T    result;  // Result presuming success
	private E    error;   // Error presuming failure

	bool isOkay;          // Was the funtion successful (is result valid)

	this (T good) {
		result = good;
		isOkay = true;
	}

	this (E fail) {
	   error = fail;
	   isOkay = false;
	}

	T unwrapResult(string message = "Unwrap failed: no result") {
		assert(isOkay, message);

		return result;
	}

	E unwrapError(string message = "Unwrap failed: no error") {
		assert(!isOkay, message);

		return error;
	}
}