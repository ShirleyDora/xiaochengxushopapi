var express = require('express');
var router = express.Router();
var Database = require('./mysql_connect');
//提交订单
router.get('/addOrder', function(req,res,next){
   new Database().addOrder(req,res);
});
//获取订单信息
router.get("/details", function(req,res,next){
   new Database().getOrderDetails(req,res);
});
//支付
router.get("/pay", function(req,res,next){
   new Database().pay(req,res);
});
//获取订单商品列表
router.get('/orderList', function(req,res,next){
   new Database().getOrderList(req,res);
});
//确定收货
router.get('/getGoods', function(req,res,next){
   new Database().getGoods(req,res);
});
module.exports = router;