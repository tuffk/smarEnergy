/**
 * Created by rafaelhaber on 6/14/17.
 */
require("../../widgets/homeselector/module");
require("../../widgets/energymonitor/module");

angular.module("dashboard",
    [
        "homeselector",
        "energymonitor"
    ]
);
require("./component");