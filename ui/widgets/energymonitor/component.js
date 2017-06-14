var config = require('../../config');
angular.module("energymonitor")
    .component("energymonitorComp", {
        templateUrl: '/widgets/energymonitor/template.html',
        controller: function ($scope, $http, $interval) {
        	var user_id = 1;
        	var url = config.base_url + "/captures";
        	var posturl = config.base_url + "/gen";

        	$interval(function() {
	        	$http.get(url, []).then(function(response) {
	    			if (response.status == 200) {
	    				$scope.devices = response.data;
	    				angular.forEach($scope.devices, function(value, key) {
	    					$scope.devices[key].amount = parseInt($scope.devices[key].amount);
	    				});
	    			}
	    		});


	    		$http.post(posturl, {}, []);
	        }, 5000);
        }
    });