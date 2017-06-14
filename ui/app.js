var angular = require('./bower_components/angular');
require("./login/module");

angular.module("main",
    ["login"]
);