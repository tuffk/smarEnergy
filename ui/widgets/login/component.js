angular.module("login")
    .component("loginComp", {
        templateUrl: '/widgets/login/template.html',
        controller: function ($scope) {
            $scope.executeSubmit = function() {
                var that = $scope.$ctrl;
                var user = that.user;
                var pass = that.pass;
            }
        }
    });