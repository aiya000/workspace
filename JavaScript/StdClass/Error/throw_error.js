// How to use
try {
	print("entered try block");
	throw new Error("foo");
	print("finished operation of try block");
} catch (e) {
	print("caught an error");
	print(e);
}

// How to extends
var ExtendedError = function(message) {
	this.name    = "ExtendedError";
	this.message = message || "mewmew";
};
ExtendedError.prototype = new Error();
ExtendedError.prototype.constructor = ExtendedError;

try {
	throw new ExtendedError("ahoge");
} catch (e) {
	print("caught an ExtendedError");
	print(e);
}
