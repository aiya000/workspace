angular
	.module("helloDirective", [])
	.directive("fooDirective", function () {
		// AngularJS recommends 'restrict'
		return {
			  restrict : "A" // Attribute
			, template : "<h1>あずにゃん</h1>"
		};
	})
	.directive("barDirective", function () {
		return {
			  restrict : "E"  // Element
			, template : "<h2>あずにゃん</h2>"
		};
	});
