var Hello = (function () {
	function Hello(message) {
		this.message = message;
	}
	Hello.prototype.hello = function () {
		return "Hello, " + this.message + "!!";
	};
	return Hello;
})();

console.log(new Hello("JavaScript").hello());
