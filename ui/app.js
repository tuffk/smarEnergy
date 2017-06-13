var angular = require('./bower_components/angular');
require("./login/module");

angular.module("main",
    ["login"]
);

/*
angular.
module('main').
component('greetUser', {
    template: 'Hello, {{$ctrl.user}}!',
    controller: function GreetUserController() {
        this.user = 'world';
    }
});*/

/**require('login')

var main = angular.module('main', [
    'login'
]);
 **/