var express = require('express');
var path = require('path');
var app = express();
var cors = require('cors');

app.use(express.static(__dirname));
app.use(cors());

app.listen(8080)
