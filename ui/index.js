var express = require('express');
var path = require('path');
var app = express();

app.use(express.static(__dirname));

app.listen(3000)
