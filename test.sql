/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2017-09-15 20:47:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `dir` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of images
-- ----------------------------
INSERT INTO `images` VALUES ('2', '木子楚娇', 'images/headimg2.jpg', '222222222222222222');
INSERT INTO `images` VALUES ('3', '1', 'images/headimg3.jpg', '33333333333333333333333333');
INSERT INTO `images` VALUES ('4', '落泪的蓝天', 'images/headimg4.jpg', '222222222222222222222222222');
INSERT INTO `images` VALUES ('5', '1', 'images/2.jpg', '22222222222222222222222');
INSERT INTO `images` VALUES ('8', '1', 'images/24.jpg', '22222222222222222222222222222');
INSERT INTO `images` VALUES ('12', 'kiki', 'images/lodBg.jpg', '222222222222222222222222');
INSERT INTO `images` VALUES ('14', '1', 'images/111.jpg', '2222222222222222222222222');
INSERT INTO `images` VALUES ('15', '1', 'images/3.jpg', '这是我喜爱的花');
INSERT INTO `images` VALUES ('16', '木子楚娇', 'images/13.jpg', '童年的泡泡，那时的我们真的是特别地开心，不是吗？');
INSERT INTO `images` VALUES ('17', '木子楚娇', 'images/25.jpg', '浓浓情意');
INSERT INTO `images` VALUES ('18', '木子楚娇', 'images/bac3.gif', '巴黎的天空');
INSERT INTO `images` VALUES ('19', '木子楚娇', 'images/1.jpg', '月亮和我');

-- ----------------------------
-- Table structure for left
-- ----------------------------
DROP TABLE IF EXISTS `left`;
CREATE TABLE `left` (
  `id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `cont` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of left
-- ----------------------------
INSERT INTO `left` VALUES ('1', '1', '李楚娇', 'images/p5.png', '好久没见到你了，想你了', '2017-09-14');
INSERT INTO `left` VALUES ('2', 'kiki', '了另外两位了', 'images/pc3.png', '44444444444444444444', '2017-09-24');
INSERT INTO `left` VALUES ('3', '1', '来来来', 'images/pc1.png', '33333333333', '2018-09-2');

-- ----------------------------
-- Table structure for personweb
-- ----------------------------
DROP TABLE IF EXISTS `personweb`;
CREATE TABLE `personweb` (
  `id` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `pwd` varchar(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `saying` varchar(255) DEFAULT NULL,
  `habby` varchar(255) DEFAULT NULL,
  `birth` varchar(255) DEFAULT NULL,
  `headP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of personweb
-- ----------------------------
INSERT INTO `personweb` VALUES ('2', '落泪的蓝天', '女', 'root', null, 'I love you eeeee eee eee ee ee ee ee ee ee ee ee ee ee ee ee ee ee ee ee eee eee eee e', '写字', '2017-08-23', 'images/headimg1.jpg');
INSERT INTO `personweb` VALUES ('3', '1', '男                                                                                                                                  ', '1', '111@qq.com', '1                                                                                                                                  ', '读书、听音乐                                                                                                                                  ', '2016-12-31', 'images/headimg3.jpg');
INSERT INTO `personweb` VALUES ('4', 'kiki', '女', 'root', null, 'I\'m the best!', '听音乐', '1997-08-06', 'images/19.jpg');
INSERT INTO `personweb` VALUES ('5', 'e', '男', 'e', null, '', '', '', 'images/');
INSERT INTO `personweb` VALUES ('6', 'wld', '男', '1', null, '我爱学习', '听音乐', '2017-01-01', 'images/3.png');
INSERT INTO `personweb` VALUES ('7', '李楚娇', '女', 'lichujiao', null, '一切皆有可能。。。', '听音乐，看书', '2000-02-22', 'images/19.jpg');
INSERT INTO `personweb` VALUES ('8', '1234', '男', '123456', null, null, 'qq', '2013-11-30', 'images/headimg2.jpg');
INSERT INTO `personweb` VALUES ('9', '木子楚娇', '女                                                                                                                               ', '111111', '111@qq.com', '走自己的路                                                                                                                               ', '听音乐                                                                                                                                  ', '2012-06-26', 'images/2.jpg');
INSERT INTO `personweb` VALUES ('10', '111111', '无', '111111', '无', '无', '通天塔', '2017-01-01', 'images/18.jpg');
INSERT INTO `personweb` VALUES ('11', '小明', '无', '111111', '无', '无', '听音乐', '2016-02-24', 'images/18.jpg');
INSERT INTO `personweb` VALUES ('12', '小鱼', '男                ', '111111', '111@qq.com', '我是最棒的                       ', '听音乐                          ', '2017-12-31', 'images/2.jpg');

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `cont` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES ('1', 'wld', '我叫王柳迪', '				我爱学习', '2017/9/9/21:18:22');
INSERT INTO `record` VALUES ('2', '木子楚娇', '秋夕赏析', '  此诗写失意宫女孤独的生活和凄凉的心境。前两句已经描绘出一幅深宫生活的图景。在一个秋天的晚上，银白色的蜡烛发出微弱的光，给屏风上的图画添了几分暗淡而幽冷的色调。这时，一个孤单的宫女正用小扇扑打着飞来飞去的萤火虫。“轻罗小扇扑流萤”，这一句十分含蓄，其中含有三层意思：第一，古人说腐草化萤，虽然是不科学的，但萤总是生在草丛冢间那些荒凉的地方。如今，在宫女居住的庭院里竟然有流萤飞动，宫女生活的凄凉也就可想而知。                ', '2017/9/15/13:3:28');
INSERT INTO `record` VALUES ('3', '1', '杜牧', '          杜牧（公元803－约852年），字牧之，号樊川居士，汉族，京兆万年（今陕西西安）人，唐代诗人。杜牧人称“小杜”，以别于杜甫。与李商隐并称“小李杜”。因晚年居长安南樊川别墅，故后世称“杜樊川”，著有《樊川文集》。            ', '2017-09-15');

-- ----------------------------
-- Table structure for record_copy
-- ----------------------------
DROP TABLE IF EXISTS `record_copy`;
CREATE TABLE `record_copy` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `cont` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of record_copy
-- ----------------------------
INSERT INTO `record_copy` VALUES ('1', '来来来', '1', 'images/p1.png', '我爱你，美丽的秋天', '2016-10-24');
INSERT INTO `record_copy` VALUES ('2', '222', '1', 'images/p4.png', '好久没见到你了，想你了', '2017-11-19');
INSERT INTO `record_copy` VALUES ('3', '呃呃呃', 'wld', 'images/p3.png', '				我爱学习', '2017/9/9/21:18:22');
INSERT INTO `record_copy` VALUES ('4', '111', '1', 'images/p3.png', '111111', '2018-09-18');
INSERT INTO `record_copy` VALUES ('5', '小子', '木子楚娇', 'images/p3.png', '好久不见！！！', '2017-09-15');
INSERT INTO `record_copy` VALUES ('6', '一座城', '木子楚娇', 'images/p6.png', '你什么时候回来呀', '2017-09-15');
INSERT INTO `record_copy` VALUES ('7', '111', '木子楚娇', 'images/p3.png', '111111111111', '2017-09-15');
INSERT INTO `record_copy` VALUES ('8', '小黑', '木子楚娇', 'images/p2.png', '踩踩踩······', '2017-09-15');
INSERT INTO `record_copy` VALUES ('9', '小鱼', '木子楚娇', 'images/p5.png', '赞赞赞', '2017-09-15');
