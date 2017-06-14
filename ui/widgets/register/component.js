var cnfg = require("../../config");
/**
 * Created by rafaelhaber on 6/14/17.
 */
angular.module("register")
    .component("registerComp", {
        templateUrl: '/widgets/register/template.html',
        controller: function ($scope, $http) {
            $scope.executeSubmit = function() {
                var that = $scope.$ctrl;
                var user = that.user;
                var pass = that.pass;
            }
        }
    });