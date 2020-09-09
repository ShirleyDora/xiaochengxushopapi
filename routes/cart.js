var express= require('express');
var router = express.Router();
var Database = require('./mysql_connect');
//添加到购物车
router.get('/addCart', function(req,res,next)
{
    new Database().addCart(req,res);
})
//获取购物车信息
router.get('/', function (req,res,next) {
    new Database().getCartInfo(req,res);
})
//清空购物车
router.get('/clear', function(req,res,next){
   new Database().clearCart(req,res);
});
module.exports = router;