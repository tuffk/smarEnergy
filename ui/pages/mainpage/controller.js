/**
 * Created by rafaelhaber on 6/14/17.
 */
angular.module("main")
    .controller('mainController', ['$scope', function($scope) {
        $scope.$on("to-dashboard", function (info, obj) {
            $scope.id = obj.id;
            // $scope.$emit("to-dashboard", obj);
        });
    }]);