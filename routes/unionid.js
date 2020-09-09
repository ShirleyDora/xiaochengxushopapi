var express= require('express');
var router = express.Router();
var https = require('https');
//  api.weixin.qq.com

router.get('/', function (req,res,next) {
    var appid = '1234567890';
    var secret = '87654321';
    var grant_type = 'authorization_code';
    var js_code = req.query.code; //  从小程序端获取的code
    var https_request =
    {
        host:'api.weixin.qq.com',
        path:'/sns/jscode2session?appid=' + appid + '&secret=' + secret + '&js_code=' +
        js_code + '&grant_type=' + grant_type
    }
    var req = https.request(https_request, function(res){

           res.setEncoding('utf8');
           res.on('data',function(chunk){
              console.log('BODY:' + chunk);
           });
    });
    req.on('error', function(e){
       console.log('error');
    });

})
module.exports = router;