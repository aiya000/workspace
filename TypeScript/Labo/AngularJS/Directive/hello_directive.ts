/// <reference path="../../typings/angularjs/angular.d.ts"/>
class HelloDirective implements ng.IDirective {
	template = "NekoThunder!!!";
}

let app = angular.module("helloDirectiveApp", []);
app.directive("helloDirective", () => new HelloDirective());
