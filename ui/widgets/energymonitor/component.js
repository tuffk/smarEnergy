var config = require('../../config');

var table = [
	{name: 'TV', output: 80.0},
	{name: 'AC-Unit', output: 165.0},
	{name: 'Refrigerator', output: 258.0},
	{name: 'Fan', output: 139.0},
	{name: 'Fish Tank', output: 75.0}
];
angular.module("energymonitor")
    .component("energymonitorComp", {
        templateUrl: '/widgets/energymonitor/template.html',
        controller: function ($scope, $interval) {

        	$interval(function() {
        		$scope.devices = table;
        		angular.forEach($scope.devices, function(value, key) {
        			$scope.devices[key].output *= (Math.random() * 2);
        		})
	        }, 2000);
        }
    });