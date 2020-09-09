var express = require('express');
var Database = require('./mysql_connect');
var router = express.Router();

router.get('/',function(req,res,next){
   var database = new Database();
   database.getType(res);
});

module.exports = router;
