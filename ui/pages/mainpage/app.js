var angular = require('../../bower_components/angular');
require("../signin/module");
require("../dashboard/module");

angular.module("main",
    [
        "signin",
        "dashboard"
    ]
);
require("./controller");