// How to use
try {
	console.log("entered try block");
	throw new Error("foo");
	console.log("finished operation of try block");
} catch (e) {
	console.log("caught an error");
	console.log(e);
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
	console.log("caught an ExtendedError");
	console.log(e);
}
