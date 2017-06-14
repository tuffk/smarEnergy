/**
 * Created by rafaelhaber on 6/14/17.
 */
require("../../widgets/login/module");
require("../../widgets/register/module");

angular.module("signin",
    [
        "login",
        "register"
    ]
);
require("./component");