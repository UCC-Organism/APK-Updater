var express = require('express');
var fs = require('fs');
var updater = require('apk-updater');
var bodyParser = require('body-parser');

var conf = JSON.parse(fs.readFileSync(__dirname + '/system.conf', 'utf8'));

var port = (conf.apk_updater_server_port ? conf.apk_updater_server_port : 8088);
var path = (conf.apk_updater_path ? conf.apk_updater_path : "/organism");

var app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true } ));

var server = app.listen(port);

updater.enable(app, path, 'apk-repository');

