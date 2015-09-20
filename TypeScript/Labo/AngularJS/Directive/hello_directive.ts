/// <reference path="../../typings/angularjs/angular.d.ts"/>
class HelloDirective implements ng.IDirective {
	template = "<p>NekoThunder!!!</p>";
}

angular.module("helloDirectiveApp", []);
       .directive("helloDirective", () => new HelloDirective());
