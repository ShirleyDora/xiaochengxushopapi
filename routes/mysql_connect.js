var mysql = require('mysql');

class Database
{
    constructor()
    {
        this.connection = mysql.createConnection({
            host:'127.0.0.1',
            user:'shirley04',
            password:'123456',
            database:'xiaochengxushopapi',
            port:3306
        });
    }

    //  将最热的、销售最好的以及最新的商品作为轮询图显示
    getHnf(res)
    {
        var resultData = {};
        var that = this;
        this.connection.query('select * from v_goods order by hot desc limit 0,1',
            function(err,result){
                if(err){
                    console.log(err);
                }
                else
                {
                    resultData.hot = result;
                    that.connection.query('select * from v_goods order by salenum desc limit 0, 1',
                        function(err,result){
                            if(err)
                            {
                                console.log(err)
                            }
                            else
                            {
                                resultData.sell = result;
                                that.connection.query('select * from v_goods order by createtime desc limit 0,1',
                                function(err,result){
                                    if(err)
                                    {
                                        console.log(err);
                                    }
                                    else
                                    {
                                        resultData.new = result;
                                        res.send({result:resultData});
                                    }
                                })
                            }
                        })
                }
            })

    }

    // 获取商品种类
    getType(res){
        this.connection.query('select * from t_type',function(err, result){
            if(err)
            {
                console.log(err);
            }
            else
            {
                res.send({type:result});
            }
        })

    }
    // 根据商品的ID获取商品的详细信息
    getGoodsInfo(res, goodsId)
    {
        //  1  更新t_goods表中的browsernum（加1）
        //  2  从v_goods视图里获取商品的信息
        //  3  从t_goods_imgs表中查询商品所有轮询图的信息

        //  更新t_goods表中的browsernum字段值（加1）
        var that = this;
        var goods = {};
        this.connection.query('update t_goods set browsernum = browsernum + 1 where id=?',[goodsId],function(err,result){
            if(err)
            {
                console.log(err);
            }
            else
            {
                that.connection.query('select * from v_goods where ?',{id:goodsId},function(err,result){
                    if(err)
                    {
                        console.log(err);
                    }
                    else
                    {
                        //  设置指定商品的信息
                        goods.info = result[0];
                        that.connection.query("select * from t_goods_imgs where ?",{goodid:goodsId},function(err,result){
                            if(err)
                            {
                                console.log(err);
                            }
                            else
                            {
                                goods.img = result;
                                res.send({goodsinfo:goods});
                            }
                        });
                    }
                });
            }
        });

    }
    //  登录
    login(res,nickName, avatarUrl)
    {
        var connect = this.connection;
        this.connection.query("select * from t_users where nickname=? and " +
            "avatarurl=?", [nickName, avatarUrl],function(err,result){
            try {
                if (result.length > 0) {
                    res.send({userinfo: result});
                    connect.query("update t_users set loginnum=? where nickname=? and avatarurl=?",
                        [result[0].loginnum + 1, nickName, avatarUrl]);
                }
                else {
                    connect.query("insert into t_users set ?", {
                        nickname: nickName,
                        avatarurl: avatarUrl
                    }, function (err, result) {
                        connect.query("select * from t_users where nickname=? and avatarurl=?", [nickName, avatarUrl], function (err, result) {
                            res.send({userinfo: result});
                        })
                    });
                }
            }catch (e)
            {

            }
        });

    }
    // 添加商品到购物车
    addCart(req,res)
    {
        var connect = this.connection;
        connect.query('select * from t_cart where uid=? and goodid=?',[req.query.uid,req.query.goodid],function (err,result){
                if(err)
                {
                    console.log(err);
                }
                else
                {
                    if(result.length > 0)
                    {
                        connect.query('update t_cart set goodnum = ? where id=?', [result[0].goodnum + parseInt(req.query.shopBuyCount),
                            result[0].id],function(err,result){
                            if(err)
                            {
                                console.log(err);
                            }
                            else
                            {
                                res.send({succ:1});
                            }
                        })
                    }
                    else
                    {
                        connect.query('insert into t_cart set ?',{uid:req.query.uid,goodid:req.query.goodid,
                            goodnum:req.query.shopBuyCount},function(err,result){
                            if(err)
                            {
                                console.log(err);
                            }
                            else
                            {
                                res.send({succ:1});
                            }
                        })
                    }
                }
            }

        )
    }
    //  获取类别商品列表
    getGoodsTypeList(res,typename)
    {
        this.connection.query('select * from v_goods where ? order by hot desc',
            {typename:typename},function(err,result){
                if(err)
                {
                    console.log(err);
                }
                else
                {
                    res.send({goodlist:result});
                }
            })
    }
    // 用户获取购物车信息
    getCartInfo(req,res)
    {
        this.connection.query("select * from v_cart where ?", {uid:req.query.uid},
            function (err,result) {
                if(err)
                {
                    console.log(err)
                }
                else
                {
                    res.send({cartInfo:result})
                }
        })
    }
    //  添加订单
    addOrder(req,res)
    {
        var connect = this.connection;
        var names = "";
        var price = 0;

        var orderInfo = eval(req.query.info);

        for(var k in orderInfo)
        {
            names += orderInfo[k].name + orderInfo[k].goodnum + ":";
            price += orderInfo[k].price * orderInfo[k].goodnum;
        }

        var time = Date.parse(new Date());

        //  订单号
        var number = "";
        for(var i = 0; i < 20;i++)
        {
            number += Math.ceil(Math.random() * 10);
        }
        this.connection.query('insert into t_orders set ?',{
                price:price,
                name:names,
                time:time,
                uid:req.query.uid,number:number,
                address:req.query.address
            },function(err,result)
            {
                if(err)
                {
                    console.log(err);
                }
                else
                {
                    var orderId = result.insertId;
                    for(var k in orderInfo)
                    {
                        connect.query("insert into t_details set ?",{
                            orderid:orderId,
                            goodid:orderInfo[k].goodid,
                            goodnum:orderInfo[k].goodnum,
                            price:orderInfo[k].price * orderInfo[k].goodnum
                        });
                    }
                    connect.query('delete from t_cart where uid=?', [req.query.uid]);
                    res.send({orderid:orderId});
                }
            }
        );
    }
    //  清空购物车
    clearCart(req,res)
    {
        this.connection.query("delete from t_cart where uid=?",[req.query.uid],function(err,result){
           if(err)
           {
               console.log(err);
           }
        });
    }
    //  获取订单信息
    getOrderDetails(req,res)
    {
        this.connection.query("select * from v_details where ?", {orderid:req.query.orderid},function(err,result){
            if(err)
            {
                console.log(err)
            }
            else
            {
                console.log({details:result})
                res.send({details:result})
            }
        })
    }
    //支付
    pay(req,res)
    {
        this.connection.query("update t_orders set state=? where id=?",
        [1, req.query.orderid],function(err,result){
            if(err)
            {
                console.log(err);
            }
            });
    }
    //获取订单商品列表
    getOrderList(req,res)
    {
        this.connection.query("select * from t_orders where ? order by state",{uid:req.query.uid},function(err,result){
           if(err)
           {
               console.log(err);
           }
           else
           {
               res.send({orderList:result});
           }
        });
    }
    //  确定收货
    getGoods(req,res)
    {
        this.connection.query("update t_orders set state=? where id=?", [3, req.query.orderid],function(err,result){
            if(err)
            {
                console.log(err);
            }
        })
    }
}

module.exports = Database;
