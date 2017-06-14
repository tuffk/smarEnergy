var config = require('../../config');
angular.module("energymonitor")
    .component("energymonitorComp", {
        templateUrl: '/widgets/energymonitor/template.html',
        controller: function ($scope, $http, $interval) {
        	var user_id = 1;
        	var url = config.base_url + "/capture/" + user_id;
        	$http.get(url, []).then(function(response) {
        			if (response.status == 200) {
        				console.log(response);
        			}
        		});
        }
    });