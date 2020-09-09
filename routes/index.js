var express = require('express');
var Database = require('./mysql_connect');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  var database = new Database();
  console.dir(database.connection);
  res.render('index', { title: 'Express' });
});

module.exports = router;
