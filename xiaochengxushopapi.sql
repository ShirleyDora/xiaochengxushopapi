/*
Navicat MySQL Data Transfer

Source Server         : xiaochengxushopapi
Source Server Version : 50726
Source Host           : 127.0.0.1:3306
Source Database       : xiaochengxushopapi

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-09-09 11:10:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_cart
-- ----------------------------
DROP TABLE IF EXISTS `t_cart`;
CREATE TABLE `t_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `goodid` int(11) NOT NULL,
  `goodnum` int(11) NOT NULL,
  `style` varchar(255) DEFAULT '"标准配置1"',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cart
-- ----------------------------

-- ----------------------------
-- Table structure for t_details
-- ----------------------------
DROP TABLE IF EXISTS `t_details`;
CREATE TABLE `t_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) NOT NULL,
  `goodid` int(11) NOT NULL,
  `goodnum` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `style` varchar(255) DEFAULT '"标准配置1"',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_details
-- ----------------------------
INSERT INTO `t_details` VALUES ('90', '42', '1', '7', '343', '\"标准配置1\"');
INSERT INTO `t_details` VALUES ('91', '42', '8', '8', '528', '\"标准配置1\"');
INSERT INTO `t_details` VALUES ('92', '42', '13', '8', '124792', '\"标准配置1\"');
INSERT INTO `t_details` VALUES ('96', '44', '9', '1', '13', '\"标准配置1\"');
INSERT INTO `t_details` VALUES ('97', '44', '5', '2', '40', '\"标准配置1\"');
INSERT INTO `t_details` VALUES ('98', '44', '10', '1', '55', '\"标准配置1\"');
INSERT INTO `t_details` VALUES ('99', '44', '7', '1', '23', '\"标准配置1\"');
INSERT INTO `t_details` VALUES ('100', '45', '2', '1', '75', '\"标准配置1\"');
INSERT INTO `t_details` VALUES ('101', '45', '11', '1', '2222', '\"标准配置1\"');
INSERT INTO `t_details` VALUES ('102', '46', '8', '2', '132', '\"标准配置1\"');

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(10) NOT NULL DEFAULT '0' COMMENT '库存',
  `intro` longtext NOT NULL,
  `img` varchar(255) NOT NULL,
  `browsernum` int(11) NOT NULL,
  `salenum` int(11) NOT NULL,
  `createtime` int(11) NOT NULL,
  `num` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES ('1', '1', '微信小程序开发入门精要', '49', '\r\n从零学小程序开发\r\n实例经典\r\n从微信公众平台的基础知识入手，详尽地阐述了开发原理、应用场景，并讲解了公众平台开发相关的关键功能和概念，如微信支付、网页授权账号绑定、JS-SDK、微信小程序等；微信公众平台开发的主要调试工具及方法的相关内容，可以帮助开发者快速定位问题；搭建基于CodeIgniter的PHP微信公众平台开发框架，是非常实用的知识，本书在此基础上介绍了多个案例实现。', 'https://geekori.com/images/books/b1.png', '222', '5', '1492652815', '2000');
INSERT INTO `t_goods` VALUES ('2', '1', 'Cocos2d-x游戏实战指南', '75', '\r\n正版\r\nCocos2d-x游戏实战指南Cocos2d-x游戏实战指南Cocos2d-x游戏实战指南', 'https://geekori.com/images/books/b3.png', '516', '6', '1492652816', '3355');
INSERT INTO `t_goods` VALUES ('3', '1', 'Android权威指南(第二版)', '73', '《Android开发指南(第二版)》是畅销书《Android开发指南》的升级版，内容更新超过80%，是一本全面介绍Android应用开发的专著，拥有45章精彩内容供读者学习。　　《Android开发指南(第二版)》全面介绍了Android应用开发的各种技术，主要内容包括Android的四大应用程序组件(Activity、Service、Content Provider和Broadcast Receiver)、布局、菜单、控件、资源和本地化、可视化UI设计、对话框、Toast和通知栏(Notificati', 'https://geekori.com/images/books/b2.png', '2', '0', '1492652819', '15');
INSERT INTO `t_goods` VALUES ('5', '1', '他们都看见了一只猫', '20', '凯迪克银奖绘本：他们都看见了一只猫 [3-6岁] [They all saw a cat]\r\n斩获2017凯迪克银奖、纽约时报畅销书等诸多奖项，美国青少年图书馆协会选书；描绘了一只猫眼中的全世界、和全世界眼中的这只猫；精准启蒙孩子对自我认知的好奇心和对世界的想象力 未小读出品', 'https://img14.360buyimg.com/n1/s200x200_jfs/t5776/214/2638816015/151766/72fcb984/5932c8abN7bc0b53c.jpg', '5', '0', '1500000000', '2');
INSERT INTO `t_goods` VALUES ('6', '1', '我的小小忧伤（套装共8册）', '66', '送给孩子一本好书，就是给孩子很多很多爱。是为了告诉孩子一些生活中很难讲清楚的东西，是为了帮助他们成长。成长的路上不会一帆风顺，但我们可以和孩子一起体会和分享各种情感，可以和孩子一起去面对成长中的小小忧伤。 \r\n　　《我的小小忧伤》是一套可以安慰孩子心灵同时让家长更深入了解孩子的好书，可以帮助家长和孩子共同进步。这得益于该书作者与绘者完美默契的配合。作者艾瑞克?爱格雷贝特博士用充满细腻情感的动人语言，配以绘者克洛德?K.杜博先生温馨感人并充满童真的图画，为大家编创了一套精美的作品。那些看似清清淡淡，不那么起眼的色彩和表情，却能在情感和图画世界里给大家带来极大精神上和视觉上的冲击与享受。作者与绘者将他们细致的洞察力与丰富的生活经验都倾入了这套书，倾入了这套小小的而寓意又无限大的画书。 ', 'http://img10.360buyimg.com/n1/jfs/t3214/185/6361319678/453327/17e68fed/58a4f4c6Nf3ebf483.jpg', '42', '20', '1500000011', '3');
INSERT INTO `t_goods` VALUES ('7', '1', '围城(精装) ', '23', '钱锺书所著的《围城》是一幅栩栩如生的世井百态图，人生的酸甜苦辣千般滋味均在其中得到了淋漓尽致的体现。钱钟书先生将自己的语言天才并入极其渊博的知识，再添加上一些讽刺主义的幽默调料，以一书而定江山。《围城》显示给我们一个真正的聪明人是怎样看人生，又怎样用所有作家都必得使用的文字来表述自己的“观”和“感”的。', 'http://img11.360buyimg.com/n1/jfs/t2983/353/260927770/513998/a958d131/57525676N30dced49.png', '1', '0', '1500000022', '5');
INSERT INTO `t_goods` VALUES ('8', '1', '意林杂志10本打包', '66', '专注国内期刊！满68元可享包邮！进店查看更多相关优惠商品！', 'https://img13.360buyimg.com/n1/s200x200_jfs/t3277/172/7948885186/614975/5db0729c/58bd004eN7062e755.jpg', '8', '0', '1500000033', '500');
INSERT INTO `t_goods` VALUES ('9', '1', '不做你的青梅竹马', '13', '情感，是人生中无法扑灭的火苗。也许……我们一直在寻找。寻找，可以做到的善良有多少；寻找，*美丽的朋友在何处飘摇。时光如恒河细沙，浅浅流逝，四季更迭之中，不做你的青梅竹马，只愿伴你渡过春实秋华……\r\n思索每个故事所蕴含的生活意义，慢慢用心去呜呼哀哉，您会发现每个故事都能从不同方面滋养灵魂。面临挑战、遭受挫折和感到无望之时，这本书会给您以力量；惶惑、痛苦和失落之际，这本书会给您以慰藉。\r\n梦、胡弦、海宁……17位《读者》杂志一线签约作家纯美文字精选！93篇精致短文让你一次看个过瘾！\r\n每天你都能从本书中得到人生的感悟、理解和爱，他会让你相信世界的美好，不仅能提高自己的生活质量，还可以带动改变周围人的生活态度。《不做你的青梅竹马》在您生活的点滴中，渗透深沉的理解和智慧。\r\n世上有一种爱，的爱，以陌生的姿态，以不爱的妆容，涂抹在深爱着的人的脸上。心里，却是*辽阔的情分，*深沉的大牵挂，*浓烈的爱。\r\n陈志宏\r\n人生充满了选择。每一种选择都携带着快乐和痛苦。快乐是一种营养，痛苦是比快乐更丰盛的营养，它们共同滋补人生，让生命迸发出无限活力和蓬勃生机。\r\n林夕\r\n那笑脸，让我想起她眼神里可爱的狡黠。我丝毫不怀疑，她的愿望会实现。一个不放纵喜好，明白用理性的方式实现自我的女孩子，她必定会走得更好。\r\n海宁\r\n幸存者坐得累了，倚着墙，慢慢躺下来。她在午后的阳光里睡着了，蜷缩着，如同一只可怜的流浪至此的猫。她看到了她的母亲。她清晰地看到了她的母亲。只有在梦里，她才能够看到母亲。\r\n周海亮\r\n原来世界上还是有奇迹的。亲人不抛弃，自己不放弃，那么就算人像一颗铜豌豆火上蒸着，水里煮着，棒下狠狠地捶着，锅里滋啦滋啦地炒着，也可以不破不碎，在岁月的长河里响的。\r\n凉月满天\r\n露珠一样的生命，不是消失，是把自己留存在了更广阔的生命里，使我们的情感世界变得透明、单纯而又深邃。\r\n胡弦', 'http://img3x0.ddimg.cn/91/28/1390163140-1_b_2.jpg', '15', '0', '1500003333', '200');
INSERT INTO `t_goods` VALUES ('10', '1', '朱自清散文集', '55', '朱自清是中国现代的散文家之一，他的很多作品人们都耳熟能详，如《背影》《桨声灯影里的秦淮河》《绿》《荷塘月色》《匆匆》，对后世读者产生了深远的影响，并长期被各种语文教材选为课文。《丰子恺插图朱自清散文全集（套装上下册）》收录了朱自清的全部散文作品，包括近年来一些学者最近找到的佚文，是目前最完整的朱自清散文作品。同时，本书还收录了100多幅丰子恺的漫画作品，这些作品有的是丰子恺专门为朱自清创作的，有的则是与朱自清散文内容有关的丰子恺漫画作品。\r\n　　朱自清的散文按照题材，主要有四类，一是借景抒情；二是表达亲友之情；三是社会现象谈；四是游记。朱自清的散文语言朴实，情感真挚，结构严谨，意象隽永，无论是写人还是状物，都能够给人以想象的空间，并产生内心的共鸣。朱自清与丰子恺不仅是浙江同乡，而且二人曾长期一同在浙江上虞春辉中学任教，结下了身后的友谊，二人时常在一起讨论创作，互相影响，早在1948年，出版朱自清的散文集《背影》时，就收录了丰子恺的漫画作品。所以丰子恺的漫画能够比较准确生动地反应朱自清散文作品中的一些人物形象和社会风貌，帮助读者增加对朱自清的理解与把握。\r\n　　《丰子恺插图朱自清散文全集（套装上下册）》不仅是目前最完整的朱自清散文集，而且是新中国成立后，首部配以丰子恺漫画的朱自清散文作品。具有极高的收藏价值。\r\n作者简介', 'https://img13.360buyimg.com/n1/s200x200_jfs/t187/327/526411740/98189/9b9bdcdb/538fc732Na7a1be01.jpg', '3', '0', '1500000025', '30');
INSERT INTO `t_goods` VALUES ('11', '2', '华为 Mate 9 全网通4GB+64GB', '2222', '品牌： 华为型号：Mate9 (MHA-AL00) 摩卡金机身颜色： 金色像素： 1600万以上网络： 双卡 移动4G/联通4G/电信4G屏幕尺寸： 5.6英寸及以上CPU核数： 八核系统： 安卓（Android）机身内存： 64GB运行内存： 4GB电池容量： 4000mAh-5999mAh\r\n所属分类：\r\n手机通讯>手机', 'http://img3x5.ddimg.cn/60/32/1411554435-1_b_3.jpg', '564', '2', '1666666666', '20');
INSERT INTO `t_goods` VALUES ('12', '2', '华为 Mate 9 全网通', '5555', '华为 Mate 9 全网通6GB+128GB版 摩卡金 华为 Mate 9 全网通6GB+128GB版 摩卡金 华为 Mate 9 全网通6GB+128GB版 摩卡金 ', 'http://img3x9.ddimg.cn/31/17/1255240039-1_b_6.jpg', '224', '0', '1555555555', '555');
INSERT INTO `t_goods` VALUES ('13', '2', 'MacBook Air 13.3英寸', '15599', '品牌： 苹果型号：MMGF2CH/A显存容量： 共享内存显卡： 核芯产品定位： 轻薄便携触控： 非触控屏幕尺寸： 13英寸硬盘： 128GB操作系统： MacOS内存： 8GB处理器： Intel i5\r\n所属分类：\r\n电脑办公>电脑整机>笔记本\r\n数码影音>苹果/配件>Mac', 'http://img3x2.ddimg.cn/0/3/1231637022-1_l_3.jpg', '15574', '0', '1000000000', '222');

-- ----------------------------
-- Table structure for t_goods_imgs
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_imgs`;
CREATE TABLE `t_goods_imgs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodid` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods_imgs
-- ----------------------------
INSERT INTO `t_goods_imgs` VALUES ('1', '1', 'https://geekori.com/images/books/b1.png');
INSERT INTO `t_goods_imgs` VALUES ('2', '1', 'https://geekori.com/images/books/b1.png');
INSERT INTO `t_goods_imgs` VALUES ('3', '1', 'https://geekori.com/images/books/b1.png');
INSERT INTO `t_goods_imgs` VALUES ('4', '1', 'https://geekori.com/images/books/b3.png');
INSERT INTO `t_goods_imgs` VALUES ('5', '2', 'https://img13.360buyimg.com/n1/s200x200_jfs/t3268/26/4812317415/58580/5bfd702f/585a2e86Ncc8ada8a.jpg');
INSERT INTO `t_goods_imgs` VALUES ('6', '2', 'https://img14.360buyimg.com/n1/s200x200_jfs/t5767/76/2831830313/22032/5198a135/59343900Nfd20073a.jpg');
INSERT INTO `t_goods_imgs` VALUES ('7', '2', 'https://geekori.com/images/books/b3.png');
INSERT INTO `t_goods_imgs` VALUES ('8', '3', 'https://geekori.com/images/books/b2.png');
INSERT INTO `t_goods_imgs` VALUES ('9', '3', 'https://img12.360buyimg.com/n1/s200x200_g14/M06/0D/10/rBEhV1IgBCwIAAAAAARGt3A3gTcAACo6ABbVnUABEbP637.jpg');
INSERT INTO `t_goods_imgs` VALUES ('10', '3', 'https://img14.360buyimg.com/n1/s200x200_jfs/t4657/228/2105785847/151890/f912151d/58eb0576N6d247264.jpg');
INSERT INTO `t_goods_imgs` VALUES ('11', '5', 'https://img14.360buyimg.com/n1/s200x200_jfs/t5776/214/2638816015/151766/72fcb984/5932c8abN7bc0b53c.jpg');
INSERT INTO `t_goods_imgs` VALUES ('12', '5', 'https://img14.360buyimg.com/n1/s200x200_jfs/t5776/214/2638816015/151766/72fcb984/5932c8abN7bc0b53c.jpg');
INSERT INTO `t_goods_imgs` VALUES ('13', '5', 'https://img14.360buyimg.com/n1/s200x200_jfs/t6031/203/1796793608/17257/5a5e5b4/593690ceNd443df7a.jpg');
INSERT INTO `t_goods_imgs` VALUES ('14', '8', 'https://img13.360buyimg.com/n1/s200x200_jfs/t3277/172/7948885186/614975/5db0729c/58bd004eN7062e755.jpg');
INSERT INTO `t_goods_imgs` VALUES ('15', '8', 'https://img12.360buyimg.com/n1/s200x200_jfs/t2851/139/1975543698/515684/e37ace36/57526900N04851a6f.jpg');
INSERT INTO `t_goods_imgs` VALUES ('16', '8', 'https://img12.360buyimg.com/n1/s200x200_jfs/t3889/48/2561895953/307676/396b3695/58ac1393N705e27a4.jpg');
INSERT INTO `t_goods_imgs` VALUES ('17', '8', 'https://img12.360buyimg.com/n1/s200x200_jfs/t3277/150/2972758751/470970/fdb35865/57e8d168N008a73f8.jpg');
INSERT INTO `t_goods_imgs` VALUES ('18', '6', 'https://img10.360buyimg.com/n1/s200x200_jfs/t3301/250/6216203282/483212/97c7a3/58a1266bNa4fdc3f4.jpg');
INSERT INTO `t_goods_imgs` VALUES ('19', '6', 'https://img12.360buyimg.com/n1/s200x200_jfs/t5857/315/509118722/101547/6e2679c8/591fe185Nb8fedbc1.jpg');
INSERT INTO `t_goods_imgs` VALUES ('20', '6', 'https://img12.360buyimg.com/cms/s200x200_g12/M00/09/0C/rBEQYVGdxdIIAAAAAALLDnun2iwAAB1fwAAAAAAAssm176.jpg');
INSERT INTO `t_goods_imgs` VALUES ('21', '6', 'https://img11.360buyimg.com/n1/s200x200_19239/d498c327-48bc-4b8a-ada6-ca35ab0416b9.jpg');
INSERT INTO `t_goods_imgs` VALUES ('22', '7', 'https://img12.360buyimg.com/n1/s200x200_g15/M07/01/01/rBEhWVG5n3IIAAAAAAsWUKFtxGsAAANCwG0u7cACxZo396.jpg');
INSERT INTO `t_goods_imgs` VALUES ('23', '7', 'https://img11.360buyimg.com/n1/s200x200_jfs/t2983/353/260927770/513998/a958d131/57525676N30dced49.png');
INSERT INTO `t_goods_imgs` VALUES ('24', '7', 'https://img13.360buyimg.com/n1/s200x200_jfs/t2851/52/810236149/238297/59b154d1/57283a07Na14f2194.jpg');
INSERT INTO `t_goods_imgs` VALUES ('25', '9', 'https://img12.360buyimg.com/n1/s200x200_jfs/t5812/338/4009913879/105478/f64e062b/59462ad4N0dff6d83.jpg');
INSERT INTO `t_goods_imgs` VALUES ('26', '9', 'https://img30.360buyimg.com/popWaterMark/jfs/t5608/296/4024154541/63268/bff22cae/59462ad4Nb555cd0e.jpg');
INSERT INTO `t_goods_imgs` VALUES ('27', '10', 'https://img13.360buyimg.com/n1/s200x200_jfs/t187/327/526411740/98189/9b9bdcdb/538fc732Na7a1be01.jpg');
INSERT INTO `t_goods_imgs` VALUES ('28', '10', 'https://img14.360buyimg.com/n1/s200x200_g13/M05/0F/15/rBEhUlLFKjQIAAAAABTy7lgSiDAAAHhzAIWUoIAFPMG146.jpg');
INSERT INTO `t_goods_imgs` VALUES ('29', '10', 'https://img12.360buyimg.com/n1/s200x200_g14/M08/01/12/rBEhV1KK8QYIAAAAAARd1yA5000AAFzIQCmrk0ABF3v522.jpg');
INSERT INTO `t_goods_imgs` VALUES ('30', '11', 'http://img3x5.ddimg.cn/60/32/1411554435-1_b_3.jpg');
INSERT INTO `t_goods_imgs` VALUES ('31', '11', 'http://img3x9.ddimg.cn/31/9/1263120439-1_b_3.jpg');
INSERT INTO `t_goods_imgs` VALUES ('32', '12', 'http://img3x5.ddimg.cn/9/30/1410638535-1_b_2.jpg');
INSERT INTO `t_goods_imgs` VALUES ('33', '12', 'http://img3x5.ddimg.cn/95/29/1306587245-1_b_2.jpg');
INSERT INTO `t_goods_imgs` VALUES ('34', '12', 'http://img3x0.ddimg.cn/78/1/1140807570-1_b_2.jpg');
INSERT INTO `t_goods_imgs` VALUES ('35', '13', 'http://img3x1.ddimg.cn/84/4/60595311-1_b_2.jpg');
INSERT INTO `t_goods_imgs` VALUES ('36', '13', 'http://img3x2.ddimg.cn/28/25/1033166602-1_b_5.jpg');
INSERT INTO `t_goods_imgs` VALUES ('37', '13', 'http://img3x2.ddimg.cn/7/5/1161327922-1_b_3.jpg');

-- ----------------------------
-- Table structure for t_orders
-- ----------------------------
DROP TABLE IF EXISTS `t_orders`;
CREATE TABLE `t_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(9) NOT NULL,
  `price` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL COMMENT '订单号',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未付款 1已付款 2已发货 3已收货',
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orders
-- ----------------------------
INSERT INTO `t_orders` VALUES ('42', '26', '125663', '微信小程序开发入门精要7:意林杂志10本打包8:MacBook Air 13.3英寸8:', '1599524088000', '597763884410113997551', '3', '河北省  秦皇岛市  山海关区  222 收货人：mm 电话：1111111111');
INSERT INTO `t_orders` VALUES ('43', '26', '125663', '微信小程序开发入门精要7:意林杂志10本打包8:MacBook Air 13.3英寸8:', '1599524092000', '5195910367102887654318', '0', '河北省  秦皇岛市  山海关区  222 收货人：mm 电话：1111111111');
INSERT INTO `t_orders` VALUES ('44', '26', '131', '不做你的青梅竹马1:他们都看见了一只猫2:朱自清散文集1:围城(精装) 1:', '1599524972000', '6266572910487181023913', '1', '河北省  秦皇岛市  山海关区  222 收货人：mm 电话：1111111111');
INSERT INTO `t_orders` VALUES ('45', '26', '2297', 'Cocos2d-x游戏实战指南1:华为 Mate 9 全网通4GB+64GB1:', '1599525217000', '4141019799109575819735', '0', '上海  上海市  黄浦区  333 收货人：可可爱爱 电话：111');
INSERT INTO `t_orders` VALUES ('46', '26', '132', '意林杂志10本打包2:', '1599525298000', '68410671087253775101918', '2', '上海  上海市  黄浦区  333 收货人：可可爱爱 电话：111');

-- ----------------------------
-- Table structure for t_type
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES ('1', '精品图书', 'http://cdn-img.easyicon.net/png/11780/1178089.gif');
INSERT INTO `t_type` VALUES ('2', '手机电脑', 'http://cdn-img.easyicon.net/png/12087/1208792.gif');
INSERT INTO `t_type` VALUES ('3', '孕婴儿童', 'http://cdn-img.easyicon.net/png/40/4006.gif');
INSERT INTO `t_type` VALUES ('4', '床上用品', 'http://cdn-img.easyicon.net/png/11252/1125213.gif');
INSERT INTO `t_type` VALUES ('6', '生活日用', 'http://cdn-img.easyicon.net/png/11812/1181272.gif');
INSERT INTO `t_type` VALUES ('7', '男装女装', 'http://cdn-img.easyicon.net/png/11419/1141901.gif');

-- ----------------------------
-- Table structure for t_users
-- ----------------------------
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickName` varchar(255) NOT NULL,
  `avatarUrl` varchar(255) NOT NULL,
  `loginnum` int(11) NOT NULL DEFAULT '1' COMMENT '登录次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_users
-- ----------------------------
INSERT INTO `t_users` VALUES ('26', 'Shirley', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLxxBhqMDy8tiamd4LaHtQlk5KUds0T0F3QGRP2vcJ38upvaaa6ms9G9gTziclK62eibfY1Lck1TJSgA/132', '33');

-- ----------------------------
-- View structure for v_cart
-- ----------------------------
DROP VIEW IF EXISTS `v_cart`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_cart` AS select `t1`.`name` AS `name`,`t1`.`price` AS `price`,`t1`.`img` AS `img`,`t2`.`id` AS `id`,`t2`.`uid` AS `uid`,`t2`.`goodid` AS `goodid`,`t2`.`goodnum` AS `goodnum`,`t2`.`style` AS `style` from (`t_goods` `t1` join `t_cart` `t2` on((`t1`.`id` = `t2`.`goodid`))) ;

-- ----------------------------
-- View structure for v_details
-- ----------------------------
DROP VIEW IF EXISTS `v_details`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_details` AS select `t2`.`id` AS `id`,`t2`.`orderid` AS `orderid`,`t2`.`goodid` AS `goodid`,`t2`.`goodnum` AS `goodnum`,`t2`.`price` AS `price`,`t2`.`style` AS `style`,`t1`.`name` AS `name`,`t1`.`price` AS `allprice`,`t1`.`state` AS `state`,`t1`.`address` AS `address`,`t3`.`name` AS `goodname`,`t3`.`img` AS `img` from ((`t_orders` `t1` join `t_details` `t2` on((`t1`.`id` = `t2`.`orderid`))) join `t_goods` `t3` on((`t3`.`id` = `t2`.`goodid`))) ;

-- ----------------------------
-- View structure for v_goods
-- ----------------------------
DROP VIEW IF EXISTS `v_goods`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_goods` AS select `t1`.`id` AS `id`,`t1`.`typeid` AS `typeid`,`t1`.`name` AS `name`,`t1`.`price` AS `price`,`t1`.`intro` AS `intro`,`t1`.`img` AS `img`,`t1`.`browsernum` AS `browsernum`,`t1`.`salenum` AS `salenum`,`t1`.`createtime` AS `createtime`,`t1`.`num` AS `num`,`t2`.`name` AS `typename`,(`t1`.`browsernum` + (`t1`.`salenum` * 5)) AS `hot` from (`t_goods` `t1` join `t_type` `t2` on((`t1`.`typeid` = `t2`.`id`))) ;
