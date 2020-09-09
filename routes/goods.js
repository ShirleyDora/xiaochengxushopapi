var express = require('express');
var router = express.Router();
var Database = require('./mysql_connect');
//  获取商品信息
router.get('/goodinfo',function(req,res,next){
    new Database().getGoodsInfo(res,req.query.goodsid);
})
// 获取指定种类的商品列表
router.get('/typeList', function(req,res,next){
    new Database().getGoodsTypeList(res,req.query.typename);
})

module.exports = router;
