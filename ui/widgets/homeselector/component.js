/**
 * Created by rafaelhaber on 6/14/17.
 */
angular
    .module('homeselector')
    .component("homeselectorComp", {
        templateUrl : "widgets/homeselector/template.html",
        controller : function($scope) {
            $scope.$ctrl.homes = ["first", "second"];
            $scope.clicked = function(args) {
                console.log(args);
            }

        }
    });