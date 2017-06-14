/**
 * Created by rafaelhaber on 6/14/17.
 */
angular.module("signin")
    .component("signinpage", {
        templateUrl: '/pages/signin/template.html',
        controller : function($scope) {
            $scope.$on("id-acquired", function(info, obj) {
                $scope.$emit("to-dashboard", obj);
            });
        }
    });