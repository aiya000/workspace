/// <reference path="../typings/angularjs/angular.d.ts"/>

// Controller don't has to use $scope
class AhogeController {
	public ahoge: string;
	constructor() {
		this.ahoge = "afoo!!";
	}
	public getFoo(): string {
		return "foofoo";
	}
}

// .controller don't specify "$scope" in list
let appTSController = angular.module("appTSController", []);
appTSController.controller("AhogeController", [AhogeController]);
