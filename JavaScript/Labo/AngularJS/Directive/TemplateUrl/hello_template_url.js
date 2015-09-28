angular
	.module("helloTemplateUrl", [])
	.directive("templateDirective", function () {
		return {
			  restrict : "A"
			, templateUrl : "./template.html"
		};
	});
