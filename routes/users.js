var express = require('express');
var router = express.Router();
var Database = require('./mysql_connect');


/* GET users listing. */
router.get('/login', function(req, res, next) {
    new Database().login(res,req.query.nickName, req.query.avatarUrl);
});

module.exports = router;
