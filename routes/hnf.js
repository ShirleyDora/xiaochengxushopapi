var express = require('express');
var Database = require('./mysql_connect');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  new Database().getHnf(res);

});

module.exports = router;
