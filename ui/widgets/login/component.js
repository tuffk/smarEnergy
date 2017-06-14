var config = require('../../config');
angular.module("login")
    .component("loginComp", {
        templateUrl: '/widgets/login/template.html',
        controller: function ($scope, $http, $window) {
            $scope.executeSubmit = function() {
                var that = $scope.$ctrl;
                var user = that.user;
                var pass = that.pass;

                var url = config.base_url + "/login";
                $http({
                    url: url,
                    method: "POST",
                    data: {
                        'name': user,
                        'password': pass
                    }
                }).then(function(response){
                    if (response.status == 200) {
                        $window.location.href = '../../pages/mainpage/template.html';
                    } else {
                        // display an alarm
                    }
                });
            }
        }
    });