/*
Navicat MySQL Data Transfer

Source Server         : mysql-first
Source Server Version : 50520
Source Host           : 127.0.0.1:3306
Source Database       : cinema

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2018-09-09 23:50:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for comment1
-- ----------------------------
DROP TABLE IF EXISTS `comment1`;
CREATE TABLE `comment1` (
  `idCom` int(11) NOT NULL AUTO_INCREMENT,
  `movie_idCom` int(11) DEFAULT NULL,
  `customer_idCom` int(11) DEFAULT NULL,
  `timeCom` varchar(255) DEFAULT NULL,
  `scoreCom` int(11) DEFAULT NULL,
  `comment1` varchar(255) DEFAULT NULL,
  `statusComment` int(2) DEFAULT '1' COMMENT '1正常 -1回收站',
  PRIMARY KEY (`idCom`),
  KEY `movie_idCom` (`movie_idCom`),
  KEY `customer_idCom` (`customer_idCom`),
  CONSTRAINT `comment1_ibfk_1` FOREIGN KEY (`movie_idCom`) REFERENCES `movie` (`id`),
  CONSTRAINT `comment1_ibfk_2` FOREIGN KEY (`customer_idCom`) REFERENCES `customer` (`idC`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment1
-- ----------------------------
INSERT INTO `comment1` VALUES ('2', '1', '2', '2017-1-6 08:26:33', '6', '标准的好莱坞爆米花，又爽又嗨，所以还挺满足，算是达到了预期！', '1');
INSERT INTO `comment1` VALUES ('3', '2', '1', '2017-01-06 23:54:39', '6', '很好，张艺谋这次终于卸下他过往的艺术家包袱了，华丽转身，与以前的自己彻底说再见。', '-1');
INSERT INTO `comment1` VALUES ('4', '2', '1', '2017-01-07 00:13:57', '6', '怒赞', '1');
INSERT INTO `comment1` VALUES ('5', '3', '1', '2017-01-07 00:27:23', '6', '好', '1');
INSERT INTO `comment1` VALUES ('6', '3', '1', '2017-01-07 00:28:35', '6', '感动', '1');
INSERT INTO `comment1` VALUES ('7', '4', '1', '2017-01-07 00:36:32', '10', '阿拉啦', '1');
INSERT INTO `comment1` VALUES ('8', '4', '1', '2017-01-07 00:40:42', '10', '啦啦啦', '1');
INSERT INTO `comment1` VALUES ('9', '5', '1', '2017-01-07 00:41:22', '10', '吼吼吼', '1');
INSERT INTO `comment1` VALUES ('10', '5', '1', '2017-01-07 00:41:48', '10', '激动', '1');
INSERT INTO `comment1` VALUES ('11', '6', '1', '2017-01-07 00:45:45', '10', '阿兰卡', '1');
INSERT INTO `comment1` VALUES ('12', '6', '1', '2017-01-07 00:46:29', '10', '宽阔', '1');
INSERT INTO `comment1` VALUES ('13', '3', '1', '2017-09-14 09:36:43', '8', '享受，推荐', '1');
INSERT INTO `comment1` VALUES ('14', '1', '1', '2017-09-15 00:06:03', '7', 'very good', '1');
INSERT INTO `comment1` VALUES ('15', '22', '38', '2017-09-15 00:26:57', '8', '超励志！', '1');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `idC` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `payPassword` varchar(255) DEFAULT NULL,
  `nameC` varchar(255) DEFAULT NULL,
  `telC` varchar(255) DEFAULT NULL,
  `IDCard` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idC`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', 'customer01', '123', '123456', '王明01', '17854121270', '370781196214253611', '1523623421@qq.com');
INSERT INTO `customer` VALUES ('2', 'customer02', '123', '123456', '赵峰', '12542635785', '370781196214253621', '1523623421@qq.com');
INSERT INTO `customer` VALUES ('3', 'customer03', '123', '123456', '张珂', '13956215478', '370781196214253631', '1523623421@qq.com');
INSERT INTO `customer` VALUES ('4', 'customer04', '123', '123456', '魏楠', '13745268549', '370781196214253641', '1523623421@qq.com');
INSERT INTO `customer` VALUES ('5', 'customer06', '123', '123456', '斯乃纳', '17652478956', '370781196214253651', '1523623421@qq.com');
INSERT INTO `customer` VALUES ('6', 'customer07', '123', '123456', '超凡饭', '17458462546', '370781196214253661', '1523623421@qq.com');
INSERT INTO `customer` VALUES ('7', 'customer08', '123', '123456', '56', '15016235462', '370781196214253671', '1523623421@qq.com');
INSERT INTO `customer` VALUES ('8', 'customer09', '123', '123456', '56', '13612457854', '370781196214253681', '1523623421@qq.com');
INSERT INTO `customer` VALUES ('9', '545', '123', '123456', '515', '13945856263', '370781196214253691', '1523623421@qq.com');
INSERT INTO `customer` VALUES ('10', '66565', '123', '123456', '56', '13623542689', '370781196214253121', '1523623421@qq.com');
INSERT INTO `customer` VALUES ('11', '556', '123', '123456', '5656', '15026354786', '370781196214253131', '1523623421@qq.com');
INSERT INTO `customer` VALUES ('35', '12', '123', '123456', '12', '15026354785', '370781196214253141', '1523623421@qq.com');
INSERT INTO `customer` VALUES ('38', null, '123', null, 'cat', '17854121230', null, 'cat@qq.com');

-- ----------------------------
-- Table structure for hall
-- ----------------------------
DROP TABLE IF EXISTS `hall`;
CREATE TABLE `hall` (
  `idH` int(11) NOT NULL AUTO_INCREMENT,
  `seat_num` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `pictureName` varchar(255) DEFAULT NULL,
  `statusH` int(11) NOT NULL DEFAULT '1',
  `now_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`idH`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hall
-- ----------------------------
INSERT INTO `hall` VALUES ('1', '100', '3D', 'e7b884148257407793b6099111073a4f.jpg', '1', '100');
INSERT INTO `hall` VALUES ('2', '100', '高级', '8086f5a3bfd04d5884da078f00d2d38f.jpg', '1', '350');
INSERT INTO `hall` VALUES ('3', '100', '中级', '4ff1bc30a8884769a90327b706e351d1.jpg', '1', '300');
INSERT INTO `hall` VALUES ('4', '100', '普通', '697e3eae8e804707b4f5ae0697805bc8.jpg', '-1', '22');
INSERT INTO `hall` VALUES ('5', '100', 'VIP', '7be18bc944544c7e8340826056c4dda6.jpg', '1', '260');

-- ----------------------------
-- Table structure for indent
-- ----------------------------
DROP TABLE IF EXISTS `indent`;
CREATE TABLE `indent` (
  `idI` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `message_id` int(11) DEFAULT NULL,
  `indent_code` varchar(255) DEFAULT NULL COMMENT '时间生成订单编码',
  `seat1` int(11) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `payment` double DEFAULT NULL COMMENT '付款',
  `statusI` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  `seat2` int(11) DEFAULT NULL,
  PRIMARY KEY (`idI`),
  KEY `fk_cust_ind_id` (`customer_id`),
  CONSTRAINT `fk_cust_ind_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`idC`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of indent
-- ----------------------------
INSERT INTO `indent` VALUES ('1', '1', '1', '20161222111212', '1', '16524856963', '30', '1', '1');
INSERT INTO `indent` VALUES ('2', '2', '2', '20161222193013', '9', '16523685945', '38', '1', '9');
INSERT INTO `indent` VALUES ('3', '3', '6', '20161231184718', '7', 'null', '32', '1', '5');
INSERT INTO `indent` VALUES ('4', '3', '6', '20161231184719', '7', 'null', '32', '1', '6');
INSERT INTO `indent` VALUES ('5', '3', '6', '20161231184720', '7', 'null', '32', '1', '7');
INSERT INTO `indent` VALUES ('6', '5', '0', '20170105204757', '5', 'null', '36', '1', '10');
INSERT INTO `indent` VALUES ('7', '5', '0', '20170105210612', '8', 'null', '36', '1', '10');
INSERT INTO `indent` VALUES ('8', '5', '0', '20170105210944', '7', 'null', '36', '1', '9');
INSERT INTO `indent` VALUES ('9', '5', '0', '20170105211325', '8', 'null', '36', '1', '10');
INSERT INTO `indent` VALUES ('10', '5', '0', '20170105211434', '8', 'null', '36', '1', '10');
INSERT INTO `indent` VALUES ('11', '1', '10', '20170106141540', '5', 'null', '34', '1', '10');
INSERT INTO `indent` VALUES ('12', '1', '10', '20170106141624', '8', 'null', '34', '1', '10');
INSERT INTO `indent` VALUES ('13', '1', '10', '20170106141923', '4', 'null', '34', '1', '1');
INSERT INTO `indent` VALUES ('14', '1', '10', '20170106142042', '5', 'null', '34', '1', '1');
INSERT INTO `indent` VALUES ('15', '1', '10', '20170106142113', '6', 'null', '34', '1', '1');
INSERT INTO `indent` VALUES ('16', '1', '10', '20170106160712', '6', 'null', '34', '1', '8');
INSERT INTO `indent` VALUES ('17', '3', '10', '20170106160712', '6', 'null', '34', '1', '7');
INSERT INTO `indent` VALUES ('18', '3', '10', '20170106160749', '10', 'null', '34', '1', '10');
INSERT INTO `indent` VALUES ('19', '3', '10', '20170106160749', '9', 'null', '34', '1', '10');
INSERT INTO `indent` VALUES ('20', '3', '10', '20170106162313', '5', 'null', '34', '1', '10');
INSERT INTO `indent` VALUES ('21', '3', '10', '20170106162313', '6', 'null', '34', '1', '10');
INSERT INTO `indent` VALUES ('22', '3', '13', '20170219151728', '7', 'null', '30', '1', '10');
INSERT INTO `indent` VALUES ('23', '3', '13', '20170219151728', '7', 'null', '30', '1', '9');
INSERT INTO `indent` VALUES ('24', '3', '17', '20170508215330', '5', 'null', '25', '1', '10');
INSERT INTO `indent` VALUES ('25', '3', '17', '20170508215330', '6', 'null', '25', '1', '10');
INSERT INTO `indent` VALUES ('26', '3', '17', '20170508215428', '5', 'null', '25', '1', '6');
INSERT INTO `indent` VALUES ('27', '1', '17', '20170508215428', '5', 'null', '25', '1', '7');
INSERT INTO `indent` VALUES ('28', '4', '17', '20170508215437', '7', 'null', '25', '1', '10');
INSERT INTO `indent` VALUES ('29', '4', '17', '20170508215437', '8', 'null', '25', '1', '10');
INSERT INTO `indent` VALUES ('30', '4', '17', '20170508215441', '7', 'null', '25', '1', '9');
INSERT INTO `indent` VALUES ('31', '4', '17', '20170508215441', '7', 'null', '25', '1', '8');
INSERT INTO `indent` VALUES ('32', '4', '17', '20170508215446', '7', 'null', '25', '1', '2');
INSERT INTO `indent` VALUES ('33', '4', '17', '20170508215446', '8', 'null', '25', '1', '2');
INSERT INTO `indent` VALUES ('34', '1', '17', '20170508215450', '9', 'null', '25', '1', '6');
INSERT INTO `indent` VALUES ('35', '1', '17', '20170508215450', '9', 'null', '25', '1', '7');
INSERT INTO `indent` VALUES ('36', '1', '23', '20170914093900', '5', 'null', '30', '1', '10');
INSERT INTO `indent` VALUES ('37', '1', '23', '20170914093900', '5', 'null', '30', '1', '9');
INSERT INTO `indent` VALUES ('38', '1', '23', '20170914094116', '10', 'null', '30', '1', '10');
INSERT INTO `indent` VALUES ('39', '1', '23', '20170914094116', '10', 'null', '30', '1', '9');
INSERT INTO `indent` VALUES ('40', '1', '23', '20170914181135', '4', 'null', '30', '1', '1');
INSERT INTO `indent` VALUES ('41', '1', '23', '20170914181135', '4', 'null', '30', '1', '2');
INSERT INTO `indent` VALUES ('42', '1', '23', '20170914181145', '5', 'null', '30', '1', '3');
INSERT INTO `indent` VALUES ('43', '1', '23', '20170914181145', '5', 'null', '30', '1', '4');
INSERT INTO `indent` VALUES ('44', '1', '23', '20170914181153', '2', 'null', '30', '1', '4');
INSERT INTO `indent` VALUES ('45', '1', '23', '20170914181153', '2', 'null', '30', '1', '5');
INSERT INTO `indent` VALUES ('46', '1', '23', '20170914181200', '4', 'null', '30', '1', '7');
INSERT INTO `indent` VALUES ('47', '1', '23', '20170914181200', '4', 'null', '30', '1', '8');
INSERT INTO `indent` VALUES ('48', '1', '23', '20170914181207', '7', 'null', '30', '1', '5');
INSERT INTO `indent` VALUES ('49', '1', '23', '20170914181207', '7', 'null', '30', '1', '6');
INSERT INTO `indent` VALUES ('50', '1', '23', '20170914181530', '5', 'null', '30', '1', '6');
INSERT INTO `indent` VALUES ('51', '1', '23', '20170914181536', '7', 'null', '30', '1', '10');
INSERT INTO `indent` VALUES ('52', '1', '23', '20170914181536', '8', 'null', '30', '1', '10');
INSERT INTO `indent` VALUES ('53', '1', '23', '20170914181547', '10', 'null', '30', '1', '5');
INSERT INTO `indent` VALUES ('54', '1', '23', '20170914181547', '10', 'null', '30', '1', '6');
INSERT INTO `indent` VALUES ('55', '1', '23', '20170914181558', '9', 'null', '30', '1', '6');
INSERT INTO `indent` VALUES ('56', '1', '23', '20170914181558', '9', 'null', '30', '1', '7');
INSERT INTO `indent` VALUES ('57', '1', '23', '20170914181601', '9', 'null', '30', '1', '6');
INSERT INTO `indent` VALUES ('58', '1', '23', '20170914181601', '9', 'null', '30', '1', '7');
INSERT INTO `indent` VALUES ('59', '1', '23', '20170914181755', '1', 'null', '30', '1', '9');
INSERT INTO `indent` VALUES ('60', '1', '23', '20170914181755', '1', 'null', '30', '1', '10');
INSERT INTO `indent` VALUES ('61', '1', '23', '20170914182056', '6', 'null', '30', '1', '9');
INSERT INTO `indent` VALUES ('62', '1', '23', '20170914182056', '6', 'null', '30', '1', '10');
INSERT INTO `indent` VALUES ('63', '1', '23', '20170914190624', '5', 'null', '30', '1', '9');
INSERT INTO `indent` VALUES ('64', '1', '23', '20170914190624', '5', 'null', '30', '1', '10');
INSERT INTO `indent` VALUES ('65', '1', '23', '20170914190634', '7', 'null', '30', '1', '8');
INSERT INTO `indent` VALUES ('66', '1', '23', '20170914190634', '7', 'null', '30', '1', '9');
INSERT INTO `indent` VALUES ('67', '1', '24', '20170915000745', '5', 'null', '30', '1', '10');
INSERT INTO `indent` VALUES ('68', '1', '24', '20170915000745', '5', 'null', '30', '1', '9');
INSERT INTO `indent` VALUES ('69', '38', '24', '20170915002730', '5', 'null', '30', '1', '1');
INSERT INTO `indent` VALUES ('70', '38', '24', '20170915002730', '5', 'null', '30', '1', '2');

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `time` int(11) DEFAULT NULL COMMENT '单位 分钟',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1为可用 -1为不可用',
  `creat_time` date DEFAULT NULL COMMENT '上映日期  年月日',
  `pictureName` varchar(255) DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `actor` varchar(255) DEFAULT NULL,
  `ISHot` int(11) NOT NULL DEFAULT '-1',
  `comingSoon` int(11) NOT NULL DEFAULT '-1',
  `plate` int(11) NOT NULL DEFAULT '-1',
  `calendar` int(11) NOT NULL DEFAULT '-1',
  `style` varchar(255) DEFAULT NULL,
  `platepicture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES ('1', '长城 The Great Wall', ' 英语 / 汉语普通话', 'C:/photo/description/1.txt', '104', '1', '2016-12-16', 'fd64a3b62e604999a3bdede8e3eb2c16.webp', '张艺谋', '马克斯·布鲁克斯 / 爱德华·兹威克 / 马歇尔·赫斯科维兹 / 托尼·吉尔罗伊 / 托马斯·图尔', '1', '-1', '1', '1', '剧情 / 动作 / 奇幻 / 冒险', 'b741beaa53154932811f5776216d7699.jpg');
INSERT INTO `movie` VALUES ('2', '2112', '12', 'C:/photo/description/2.txt', '68', '-1', '2016-12-06', '56c6e3f4921d4934be82636a6e2413f4.jpg', '2121', '2121', '-1', '-1', '-1', '2', null, '5.jpg');
INSERT INTO `movie` VALUES ('3', '佩小姐的奇幻城堡', '英语', 'C:/photo/description/3.txt', '127', '1', '2016-12-09', '1d9f06fa33b34cae9c23435f78d12e7d.jpg', '蒂姆·波顿', '伊娃·格林、阿沙·巴特菲尔德、艾拉·珀内尔、塞缪尔·杰克逊等', '1', '-1', '-1', '3', '', 'e79172270d324bd68b91af71d49d44c4.jpg');
INSERT INTO `movie` VALUES ('4', '摆渡人', '国语', 'C:/photo/description/4.txt', '140', '1', '2016-12-23', '178bac2d569b417e880438ef7eaddbb7.jpg', '张嘉佳', '梁朝伟、金城武、陈奕迅、大鹏、杨颖、张榕容、杜鹃、熊黛林等', '-1', '1', '-1', '-1', null, '5.jpg');
INSERT INTO `movie` VALUES ('5', '121', '1221', 'C:/photo/description/27.txt', '21212', '-1', '2016-12-18', '7268a91ce12f448e9584342e1774622c.jpg', null, null, '-1', '-1', '-1', '-1', null, '5.jpg');
INSERT INTO `movie` VALUES ('6', '神奇动物在哪里', '英语', 'C:/photo/description/6.txt', '133', '1', '2016-11-25', '6ab039cf38b04ba190c84229a392a5bc.jpg', '大卫·叶茨', '埃迪·雷德梅恩  凯瑟琳·沃特斯顿  丹·福勒  艾莉森·萨多尔', '-1', '3', '-1', '-1', null, '5.jpg');
INSERT INTO `movie` VALUES ('7', '星球大战外传：侠盗一号', '英语', 'C:/photo/description/7.txt', '134', '1', '2017-01-06', 'd989c0d482504c4289db1807626fb8f4.jpg', '加里斯．爱德华斯', '菲丽希缇．琼斯 /迭戈．鲁纳 /甄子丹 /本．门德尔森 /麦斯．米科', '-1', '1', '1', '-1', '动作/冒险/科幻', '900e94f9294741d79c7572630c25cf13.jpg');
INSERT INTO `movie` VALUES ('8', '21', '21', 'C:/photo/description/27.txt', '190', '1', '2016-05-21', '7268a91ce12f448e9584342e1774622c.jpg', null, null, '-1', '-1', '-1', '-1', null, '5.jpg');
INSERT INTO `movie` VALUES ('9', '12', '21', 'C:/photo/description/27.txt', '1221', '-1', '1979-09-05', '7268a91ce12f448e9584342e1774622c.jpg', null, null, '-1', '-1', '-1', '-1', null, '5.jpg');
INSERT INTO `movie` VALUES ('10', '2121', '2112', 'C:/photo/description/27.txt', '1221', '1', '2016-12-18', '7268a91ce12f448e9584342e1774622c.jpg', null, null, '-1', '-1', '-1', '-1', null, '5.jpg');
INSERT INTO `movie` VALUES ('11', '2121', '1221', 'C:/photo/description/27.txt', '190', '1', '2016-12-18', '7268a91ce12f448e9584342e1774622c.jpg', null, null, '-1', '-1', '-1', '-1', null, '5.jpg');
INSERT INTO `movie` VALUES ('12', '21', '21', 'C:/photo/description/27.txt', '210', '1', '2016-12-18', '7268a91ce12f448e9584342e1774622c.jpg', null, null, '-1', '-1', '-1', '-1', null, '5.jpg');
INSERT INTO `movie` VALUES ('13', '1221', '2121', 'C:/photo/description/27.txt', '201', '1', '2016-12-18', '7268a91ce12f448e9584342e1774622c.jpg', null, null, '-1', '-1', '-1', '-1', null, '5.jpg');
INSERT INTO `movie` VALUES ('14', '2121', '221', 'C:/photo/description/27.txt', '2121', '1', '2016-12-18', '7268a91ce12f448e9584342e1774622c.jpg', null, null, '-1', '-1', '-1', '-1', null, '5.jpg');
INSERT INTO `movie` VALUES ('15', '1221', '212', 'C:/photo/description/27.txt', '2121', '1', '2016-12-18', '7268a91ce12f448e9584342e1774622c.jpg', null, null, '-1', '-1', '-1', '-1', null, '5.jpg');
INSERT INTO `movie` VALUES ('16', '1221', '2121', 'C:/photo/description/27.txt', '213', '1', '2016-12-18', '7268a91ce12f448e9584342e1774622c.jpg', null, null, '-1', '-1', '-1', '-1', null, '5.jpg');
INSERT INTO `movie` VALUES ('17', '中秋', '月饼', 'C:/photo/description/17.txt', '112', '1', '2017-09-13', '7268a91ce12f448e9584342e1774622c.jpg', '12', '12', '-1', '-1', '1', '-1', '12', '7960f9eda66041c3877e0f3a6e69043c.jpg');
INSERT INTO `movie` VALUES ('18', '总有一天 Der kommer en dag', '丹麦语', 'C:/photo/description/18.txt', '115', '1', '2016-04-21', '98d8a0be85ec476cb0660e2135077049.webp', '杰斯珀·W·尼尔森', '拉斯·米克尔森 / 苏菲·格拉宝 / 哈拉尔德·凯泽·赫尔曼 / 艾伯特·鲁德贝克·林哈特 / 劳里斯·斯科夫高·安德森 / 拉斯·兰特 / 索伦·希特-拉森 /', '1', '-1', '-1', '-1', '丹麦', '6cdfb988e3e9420ca148786cf9f9f0f5.jpg');
INSERT INTO `movie` VALUES ('19', '熔炉 도가니', '韩语', 'C:/photo/description/19.txt', '125', '1', '2011-09-22', '9c88b205a79e4fffb23959a4433403fc.webp', '黄东赫', '孔侑 / 郑有美 / 金志英 / 金贤秀 / 郑仁絮 / 白承焕 / 张光 / 严孝燮', '1', '-1', '-1', '-1', '剧情', '571feb62497b47e2b7b616ff1e89abbf.jpg');
INSERT INTO `movie` VALUES ('20', '1221', '221', 'C:/photo/description/27.txt', '2121', '-1', '2016-12-21', '7268a91ce12f448e9584342e1774622c.jpg', null, null, '-1', '-1', '-1', '-1', null, '5.jpg');
INSERT INTO `movie` VALUES ('21', '珍爱 Precious', '英语', 'C:/photo/description/21.txt', '110', '1', '2009-12-01', '8368cb465c7b4cbba6d0c9b1f9f446bb.webp', ' 李·丹尼尔斯', ' 加布蕾·丝迪贝 / 莫妮克 / 宝拉·巴顿 / 玛丽亚·凯莉 / 蓝尼·克罗维兹', '-1', '1', '-1', '-1', '', 'af35b943713a4d38a8d68be3e85b8729.jpg');
INSERT INTO `movie` VALUES ('22', '阿甘正传', '英语', 'C:/photo/description/22.txt', '142', '1', '2016-12-21', 'ba6438a5e01a4fd384209d6a84131207.png', '罗伯特·泽米吉斯', ' 汤姆·汉克斯 / 罗宾·怀特 / 加里·西尼斯 / 麦凯尔泰·威廉逊 / 莎莉·菲尔德 / Michael Conner Humphreys / 海利·乔·奥斯蒙', '1', '-1', '-1', '-1', '剧情 / 爱情', 'f7cce3e7da9f4614916087ca7795d9a4.jpg');
INSERT INTO `movie` VALUES ('23', '1234444444444444444444444444', '44233333333333', 'C:/photo/description/27.txt', '2312', '-1', '2016-12-21', '7268a91ce12f448e9584342e1774622c.jpg', null, null, '-1', '-1', '-1', '-1', null, null);
INSERT INTO `movie` VALUES ('24', '千与千寻 千と千尋の神隠し', '日语', 'C:/photo/description/24.txt', '125', '1', '2001-07-20', 'eec7549fc9674a98bf91578298b1c538.jpg', '宫崎骏', ' 柊瑠美 / 入野自由 / 夏木真理 / 菅原文太 / 内藤刚志 ', '1', '-1', '-1', '-1', '剧情 / 动画 / 奇幻', 'd571603e257c46c898426d561e114d09.jpg');
INSERT INTO `movie` VALUES ('25', '小戏骨：放开那三国', '汉语普通话', 'C:/photo/description/25.txt', '104', '1', '2017-08-28', '7268a91ce12f448e9584342e1774622c.jpg', '潘礼平 / 邹江 / 尹俊欢', ' 陶奕希 / 李俊豪 / 葛奕德 / 赵晨翔 / 陈荣达', '-1', '-1', '-1', '-1', '剧情 / 儿童 / 历史 / 古装', 'ec211f1696db4b39b43b7b3c511e4014.jpg');
INSERT INTO `movie` VALUES ('26', '28岁未成年', '汉语普通话', 'C:/photo/description/26.txt', '210', '1', '2016-12-09', '50741d5af7004fc19f90aa3a3f7cdf7f.webp', '张末', '倪妮 / 霍建华 / 马苏 / 王大陆 / 潘斌龙 / 隋凯 / 刘冰 / 余心恬 / 汪汐潮 / 来喜 / 曲哲明', '1', '-1', '-1', '-1', '喜剧 / 爱情 / 奇幻', 'b47376458c394e5cb27954d72fbc55b9.jpg');
INSERT INTO `movie` VALUES ('27', '你的名字。 君の名は。', '日语', 'C:/photo/description/27.txt', '106', '1', '2016-12-02', 'd449f200c81a4da9892e7c7649ed23b6.jpg', '新海诚', '神木隆之介 / 上白石萌音 / 长泽雅美 / 市原悦子 / 成田凌 / ', '1', '-1', '-1', '-1', ' 剧情 / 爱情 / 动画', '8e4a7e9f6ef24eefba7d580a2df13e2a.jpg');
INSERT INTO `movie` VALUES ('28', '9998', '99998', 'C:/photo/description/28.txt', '218', '-1', '2016-05-08', 'ee19c50c442d41b09356f96f6c3a49b4.jpg', '1218', '1218', '-1', '-1', '-1', '-1', '212', null);
INSERT INTO `movie` VALUES ('29', '摔跤吧！爸爸 Dangal ', '印地语', 'C:/photo/description/29.txt', '161', '1', '2017-05-05', '8c4f2474a4e64b1ca89df1993d99a2df.jpg', '涅提·蒂瓦里', '阿米尔·汗 / 法缇玛·萨那·纱卡 / 桑亚·玛荷塔 / 阿帕尔夏克提·库拉那 / 沙克希·坦沃', '1', '-1', '-1', '-1', '', '0dc868ada50c445dad8d25a47d6ddf88.jpg');
INSERT INTO `movie` VALUES ('30', '模仿游戏 The Imitation Game', '英语 / 德语', 'C:/photo/description/30.txt', '114', '1', '2014-12-25', '09f5bb0fa3d74f08b98f9fb5b6a87b30.webp', '莫滕·泰杜姆', ' 本尼迪克特·康伯巴奇 / 凯拉·奈特莉 / 马修·古迪 / 罗里·金奈尔 / 艾伦·里奇', '1', '-1', '-1', '-1', ' 剧情 / 同性 / 传记 / 战争', '46ec4dabd4264f55b200fb1bcf326cc3.webp');
INSERT INTO `movie` VALUES ('31', '爱乐之城 La La Land', '英语', 'C:/photo/description/31.txt', '128', '1', '2017-02-14', '3585e860b7224730ba43447cb9f0ab4c.webp', '达米恩·查泽雷', '瑞恩·高斯林 / 艾玛·斯通 / 约翰·传奇 / 罗丝玛丽·德薇特 / 芬·维特洛克 / 杰西卡·罗德 ', '1', '-1', '-1', '-1', '剧情 / 爱情 / 歌舞', 'ad741517254845e198fd2635944f9ffb.jpg');
INSERT INTO `movie` VALUES ('32', '疯狂动物城 Zootopia ', '英语 / 挪威语', 'C:/photo/description/32.txt', '109', '1', '2016-03-04', '4c968976eb604d3bae50a6ffde7486cd.webp', '拜伦·霍华德 / 瑞奇·摩尔 / 杰拉德·布什', ' 金妮弗·古德温 / 杰森·贝特曼 / 伊德里斯·艾尔巴 / 珍妮·斯蕾特 / 内特·托伦斯 ', '1', '-1', '-1', '-1', '喜剧 / 动画 / 冒险', '6dfbb27426604b53aeff5d88cdee3c5d.jpg');
INSERT INTO `movie` VALUES ('33', '看不见的客人 ', '西班牙语', 'C:/photo/description/33.txt', '106', '1', '2017-09-15', 'f33314728b294c029b174cf0a3332921.webp', '奥里奥尔·保罗', ' 马里奥·卡萨斯 / 阿娜·瓦格纳 / 何塞·科罗纳多 / 巴巴拉·莱涅 / 弗兰塞斯克·奥雷利亚 ', '1', '-1', '-1', '-1', '悬疑 / 惊悚 / 犯罪', '57d995ce9235418491c81cb1d396ebaa.jpg');
INSERT INTO `movie` VALUES ('34', '驴得水  ', '汉语普通话', 'C:/photo/description/34.txt', '111', '1', '2016-10-28', 'c1465df1ff474e7da0617a108c8b4248.webp', '周申 / 刘露', '任素汐 / 大力 / 刘帅良 / 裴魁山 / 阿如那 / 韩彦博 / 卜冠今 / 王堃 / 高阳 / 苏千越 / 查尔斯·亚瑟 / 王峰', '1', '-1', '1', '-1', '剧情 / 喜剧', 'a47357f21f3f4f16874851ffa4d4a8cb.jpg');
INSERT INTO `movie` VALUES ('35', '哈尔的移动城堡', '日语', 'C:/photo/description/35.txt', '119', '1', '2004-09-05', 'cb3f972e08c54793a808ea64bf561159.webp', '宫崎骏', ' 倍赏千惠子 / 木村拓哉 / 美轮明宏 / 我修院达也 / 神木隆之介 / 伊崎充则 / 大泉洋 / 大塚明夫 / 原田大二郎 / 加藤治子', '-1', '1', '1', '-1', '爱情 / 动画 / 奇幻 / 冒险', 'd425eff3e57e4071be5b4aee05cdcfa2.jpg');
INSERT INTO `movie` VALUES ('36', 'zhouzhou', '12', 'C:/photo/description/36.txt', '121', '-1', '2017-09-05', '1e6fb863a18044d59a136c26c87eb0a4.jpg', '33', '33', '-1', '-1', '-1', '-1', '33', null);
INSERT INTO `movie` VALUES ('37', 'hahh', '12', 'C:/photo/description/37.txt', '12', '-1', '2017-09-13', '9d30161ae6d54c4880bf0c99a7e77704.jpg', '12', '12', '-1', '-1', '-1', '-1', '12', '4b1736ad82c945a086b793d0971722d9.jpg');
INSERT INTO `movie` VALUES ('38', 'etet', '112', 'C:/photo/description/38.txt', '112', '1', '2017-09-14', '036f84baa11b4abca01fdf0f2d8b189c.jpg', '211', '21', '-1', '-1', '-1', '-1', '2112', 'ec749e0fac934ab498d69bd7b6c48b5b.jpg');

-- ----------------------------
-- Table structure for movie_actor
-- ----------------------------
DROP TABLE IF EXISTS `movie_actor`;
CREATE TABLE `movie_actor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) DEFAULT NULL,
  `actor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_movie_id` (`movie_id`),
  CONSTRAINT `fk_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie_actor
-- ----------------------------
INSERT INTO `movie_actor` VALUES ('1', '1', '刘德华');
INSERT INTO `movie_actor` VALUES ('2', '1', '夏缪');
INSERT INTO `movie_actor` VALUES ('3', '3', '阿婆军');
INSERT INTO `movie_actor` VALUES ('4', '3', '为按实际西欧去问问');
INSERT INTO `movie_actor` VALUES ('5', '17', '122121');
INSERT INTO `movie_actor` VALUES ('6', '13', '2121');
INSERT INTO `movie_actor` VALUES ('7', '13', '2111');
INSERT INTO `movie_actor` VALUES ('8', '21', '65');
INSERT INTO `movie_actor` VALUES ('9', '21', '65');
INSERT INTO `movie_actor` VALUES ('10', '21', '6');
INSERT INTO `movie_actor` VALUES ('11', '22', '344334');
INSERT INTO `movie_actor` VALUES ('12', '24', 'ef');
INSERT INTO `movie_actor` VALUES ('13', '25', '1221');
INSERT INTO `movie_actor` VALUES ('14', '25', '121');

-- ----------------------------
-- Table structure for movie_community
-- ----------------------------
DROP TABLE IF EXISTS `movie_community`;
CREATE TABLE `movie_community` (
  `idComm` int(11) NOT NULL,
  `addressComm` varchar(255) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idComm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie_community
-- ----------------------------
INSERT INTO `movie_community` VALUES ('123456', '233456+2', '1');

-- ----------------------------
-- Table structure for movie_picture
-- ----------------------------
DROP TABLE IF EXISTS `movie_picture`;
CREATE TABLE `movie_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) DEFAULT NULL,
  `pictureAddress` varchar(255) DEFAULT NULL,
  `BigPlatePicture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `movie_picture_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie_picture
-- ----------------------------

-- ----------------------------
-- Table structure for movie_score
-- ----------------------------
DROP TABLE IF EXISTS `movie_score`;
CREATE TABLE `movie_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) DEFAULT NULL,
  `total_score` double DEFAULT NULL,
  `average` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `movie_score_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie_score
-- ----------------------------

-- ----------------------------
-- Table structure for movie_style
-- ----------------------------
DROP TABLE IF EXISTS `movie_style`;
CREATE TABLE `movie_style` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `action` int(11) NOT NULL DEFAULT '0' COMMENT '动作',
  `adventure` int(11) NOT NULL DEFAULT '0' COMMENT '冒险',
  `comedy` int(11) NOT NULL DEFAULT '0' COMMENT '喜剧',
  `crime` int(11) NOT NULL DEFAULT '0' COMMENT '犯罪',
  `horror` int(11) NOT NULL DEFAULT '0' COMMENT '惊悚',
  `sci_fi` int(11) NOT NULL DEFAULT '0' COMMENT '科幻',
  `romance` int(11) NOT NULL DEFAULT '0' COMMENT '爱情',
  PRIMARY KEY (`id`),
  KEY `fk_movie_id_style` (`movie_id`),
  CONSTRAINT `fk_movie_id_style` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie_style
-- ----------------------------
INSERT INTO `movie_style` VALUES ('1', '1', '1', '1', '0', '0', '0', '1', '0');
INSERT INTO `movie_style` VALUES ('2', '3', '0', '0', '1', '0', '1', '0', '1');
INSERT INTO `movie_style` VALUES ('3', '17', '1', '0', '1', '1', '1', '0', '0');
INSERT INTO `movie_style` VALUES ('4', '13', '0', '1', '0', '0', '0', '0', '1');
INSERT INTO `movie_style` VALUES ('5', '21', '0', '0', '1', '0', '1', '0', '0');
INSERT INTO `movie_style` VALUES ('6', '22', '0', '0', '1', '1', '1', '0', '0');
INSERT INTO `movie_style` VALUES ('7', '24', '0', '1', '1', '0', '0', '0', '0');
INSERT INTO `movie_style` VALUES ('8', '25', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `movie_style` VALUES ('9', '26', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `movie_style` VALUES ('10', '27', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `movie_style` VALUES ('11', '28', '0', '1', '0', '0', '1', '0', '0');
INSERT INTO `movie_style` VALUES ('12', '6', '0', '1', '0', '0', '0', '0', '0');
INSERT INTO `movie_style` VALUES ('13', '29', '0', '1', '1', '0', '1', '0', '0');

-- ----------------------------
-- Table structure for movie_video
-- ----------------------------
DROP TABLE IF EXISTS `movie_video`;
CREATE TABLE `movie_video` (
  `idV` int(11) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `addressV` varchar(255) DEFAULT NULL,
  `pictureV` varchar(255) DEFAULT NULL,
  `discriptionV` varchar(255) DEFAULT NULL,
  `uploadTime` datetime DEFAULT NULL,
  `titleV` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idV`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `movie_video_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie_video
-- ----------------------------
INSERT INTO `movie_video` VALUES ('1', '1', 'changcheng.mp4', null, null, null, null);

-- ----------------------------
-- Table structure for seat
-- ----------------------------
DROP TABLE IF EXISTS `seat`;
CREATE TABLE `seat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hall_id` int(11) DEFAULT NULL,
  `raw` int(11) DEFAULT NULL,
  `col` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0' COMMENT '状态 待售1  已售2',
  PRIMARY KEY (`id`),
  KEY `hall_id` (`hall_id`),
  CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`hall_id`) REFERENCES `hall` (`idH`)
) ENGINE=InnoDB AUTO_INCREMENT=402 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seat
-- ----------------------------
INSERT INTO `seat` VALUES ('2', '1', '1', '1', '1');
INSERT INTO `seat` VALUES ('3', '1', '1', '2', '1');
INSERT INTO `seat` VALUES ('4', '1', '1', '3', '1');
INSERT INTO `seat` VALUES ('5', '1', '1', '4', '1');
INSERT INTO `seat` VALUES ('6', '1', '1', '5', '1');
INSERT INTO `seat` VALUES ('7', '1', '1', '6', '1');
INSERT INTO `seat` VALUES ('8', '1', '1', '7', '1');
INSERT INTO `seat` VALUES ('9', '1', '1', '8', '1');
INSERT INTO `seat` VALUES ('10', '1', '1', '9', '1');
INSERT INTO `seat` VALUES ('11', '1', '1', '10', '1');
INSERT INTO `seat` VALUES ('12', '1', '2', '1', '1');
INSERT INTO `seat` VALUES ('13', '1', '2', '2', '1');
INSERT INTO `seat` VALUES ('14', '1', '2', '3', '1');
INSERT INTO `seat` VALUES ('15', '1', '2', '4', '1');
INSERT INTO `seat` VALUES ('16', '1', '2', '5', '1');
INSERT INTO `seat` VALUES ('17', '1', '2', '6', '1');
INSERT INTO `seat` VALUES ('18', '1', '2', '7', '1');
INSERT INTO `seat` VALUES ('19', '1', '2', '8', '1');
INSERT INTO `seat` VALUES ('20', '1', '2', '9', '1');
INSERT INTO `seat` VALUES ('21', '1', '2', '10', '1');
INSERT INTO `seat` VALUES ('22', '1', '3', '1', '1');
INSERT INTO `seat` VALUES ('23', '1', '3', '2', '1');
INSERT INTO `seat` VALUES ('24', '1', '3', '3', '1');
INSERT INTO `seat` VALUES ('25', '1', '3', '4', '1');
INSERT INTO `seat` VALUES ('26', '1', '3', '5', '1');
INSERT INTO `seat` VALUES ('27', '1', '3', '6', '1');
INSERT INTO `seat` VALUES ('28', '1', '3', '7', '1');
INSERT INTO `seat` VALUES ('29', '1', '3', '8', '1');
INSERT INTO `seat` VALUES ('30', '1', '3', '9', '1');
INSERT INTO `seat` VALUES ('31', '1', '3', '10', '1');
INSERT INTO `seat` VALUES ('32', '1', '4', '1', '1');
INSERT INTO `seat` VALUES ('33', '1', '4', '2', '1');
INSERT INTO `seat` VALUES ('34', '1', '4', '3', '1');
INSERT INTO `seat` VALUES ('35', '1', '4', '4', '1');
INSERT INTO `seat` VALUES ('36', '1', '4', '5', '1');
INSERT INTO `seat` VALUES ('37', '1', '4', '6', '1');
INSERT INTO `seat` VALUES ('38', '1', '4', '7', '1');
INSERT INTO `seat` VALUES ('39', '1', '4', '8', '1');
INSERT INTO `seat` VALUES ('40', '1', '4', '9', '1');
INSERT INTO `seat` VALUES ('41', '1', '4', '10', '1');
INSERT INTO `seat` VALUES ('42', '1', '5', '1', '2');
INSERT INTO `seat` VALUES ('43', '1', '5', '2', '2');
INSERT INTO `seat` VALUES ('44', '1', '5', '3', '1');
INSERT INTO `seat` VALUES ('45', '1', '5', '4', '1');
INSERT INTO `seat` VALUES ('46', '1', '5', '5', '1');
INSERT INTO `seat` VALUES ('47', '1', '5', '6', '1');
INSERT INTO `seat` VALUES ('48', '1', '5', '7', '1');
INSERT INTO `seat` VALUES ('49', '1', '5', '8', '1');
INSERT INTO `seat` VALUES ('50', '1', '5', '9', '2');
INSERT INTO `seat` VALUES ('51', '1', '5', '10', '2');
INSERT INTO `seat` VALUES ('52', '1', '6', '1', '1');
INSERT INTO `seat` VALUES ('53', '1', '6', '2', '1');
INSERT INTO `seat` VALUES ('54', '1', '6', '3', '1');
INSERT INTO `seat` VALUES ('55', '1', '6', '4', '1');
INSERT INTO `seat` VALUES ('56', '1', '6', '5', '1');
INSERT INTO `seat` VALUES ('57', '1', '6', '6', '1');
INSERT INTO `seat` VALUES ('58', '1', '6', '7', '1');
INSERT INTO `seat` VALUES ('59', '1', '6', '8', '1');
INSERT INTO `seat` VALUES ('60', '1', '6', '9', '1');
INSERT INTO `seat` VALUES ('61', '1', '6', '10', '1');
INSERT INTO `seat` VALUES ('62', '1', '7', '1', '1');
INSERT INTO `seat` VALUES ('63', '1', '7', '2', '1');
INSERT INTO `seat` VALUES ('64', '1', '7', '3', '1');
INSERT INTO `seat` VALUES ('65', '1', '7', '4', '1');
INSERT INTO `seat` VALUES ('66', '1', '7', '5', '1');
INSERT INTO `seat` VALUES ('67', '1', '7', '6', '1');
INSERT INTO `seat` VALUES ('68', '1', '7', '7', '1');
INSERT INTO `seat` VALUES ('69', '1', '7', '8', '1');
INSERT INTO `seat` VALUES ('70', '1', '7', '9', '1');
INSERT INTO `seat` VALUES ('71', '1', '7', '10', '1');
INSERT INTO `seat` VALUES ('72', '1', '8', '1', '1');
INSERT INTO `seat` VALUES ('73', '1', '8', '2', '1');
INSERT INTO `seat` VALUES ('74', '1', '8', '3', '1');
INSERT INTO `seat` VALUES ('75', '1', '8', '4', '1');
INSERT INTO `seat` VALUES ('76', '1', '8', '5', '1');
INSERT INTO `seat` VALUES ('77', '1', '8', '6', '1');
INSERT INTO `seat` VALUES ('78', '1', '8', '7', '1');
INSERT INTO `seat` VALUES ('79', '1', '8', '8', '1');
INSERT INTO `seat` VALUES ('80', '1', '8', '9', '1');
INSERT INTO `seat` VALUES ('81', '1', '8', '10', '1');
INSERT INTO `seat` VALUES ('82', '1', '9', '1', '1');
INSERT INTO `seat` VALUES ('83', '1', '9', '2', '1');
INSERT INTO `seat` VALUES ('84', '1', '9', '3', '1');
INSERT INTO `seat` VALUES ('85', '1', '9', '4', '1');
INSERT INTO `seat` VALUES ('86', '1', '9', '5', '1');
INSERT INTO `seat` VALUES ('87', '1', '9', '6', '1');
INSERT INTO `seat` VALUES ('88', '1', '9', '7', '1');
INSERT INTO `seat` VALUES ('89', '1', '9', '8', '1');
INSERT INTO `seat` VALUES ('90', '1', '9', '9', '1');
INSERT INTO `seat` VALUES ('91', '1', '9', '10', '1');
INSERT INTO `seat` VALUES ('92', '1', '10', '1', '1');
INSERT INTO `seat` VALUES ('93', '1', '10', '2', '1');
INSERT INTO `seat` VALUES ('94', '1', '10', '3', '1');
INSERT INTO `seat` VALUES ('95', '1', '10', '4', '1');
INSERT INTO `seat` VALUES ('96', '1', '10', '5', '1');
INSERT INTO `seat` VALUES ('97', '1', '10', '6', '1');
INSERT INTO `seat` VALUES ('98', '1', '10', '7', '1');
INSERT INTO `seat` VALUES ('99', '1', '10', '8', '1');
INSERT INTO `seat` VALUES ('100', '1', '10', '9', '1');
INSERT INTO `seat` VALUES ('101', '1', '10', '10', '1');
INSERT INTO `seat` VALUES ('102', '2', '1', '1', '1');
INSERT INTO `seat` VALUES ('103', '2', '1', '2', '1');
INSERT INTO `seat` VALUES ('104', '2', '1', '3', '1');
INSERT INTO `seat` VALUES ('105', '2', '1', '4', '1');
INSERT INTO `seat` VALUES ('106', '2', '1', '5', '1');
INSERT INTO `seat` VALUES ('107', '2', '1', '6', '1');
INSERT INTO `seat` VALUES ('108', '2', '1', '7', '1');
INSERT INTO `seat` VALUES ('109', '2', '1', '8', '1');
INSERT INTO `seat` VALUES ('110', '2', '1', '9', '1');
INSERT INTO `seat` VALUES ('111', '2', '1', '10', '1');
INSERT INTO `seat` VALUES ('112', '2', '2', '1', '1');
INSERT INTO `seat` VALUES ('113', '2', '2', '2', '1');
INSERT INTO `seat` VALUES ('114', '2', '2', '3', '1');
INSERT INTO `seat` VALUES ('115', '2', '2', '4', '1');
INSERT INTO `seat` VALUES ('116', '2', '2', '5', '1');
INSERT INTO `seat` VALUES ('117', '2', '2', '6', '1');
INSERT INTO `seat` VALUES ('118', '2', '2', '7', '1');
INSERT INTO `seat` VALUES ('119', '2', '2', '8', '1');
INSERT INTO `seat` VALUES ('120', '2', '2', '9', '1');
INSERT INTO `seat` VALUES ('121', '2', '2', '10', '1');
INSERT INTO `seat` VALUES ('122', '2', '3', '1', '1');
INSERT INTO `seat` VALUES ('123', '2', '3', '2', '1');
INSERT INTO `seat` VALUES ('124', '2', '3', '3', '1');
INSERT INTO `seat` VALUES ('125', '2', '3', '4', '1');
INSERT INTO `seat` VALUES ('126', '2', '3', '5', '1');
INSERT INTO `seat` VALUES ('127', '2', '3', '6', '1');
INSERT INTO `seat` VALUES ('128', '2', '3', '7', '1');
INSERT INTO `seat` VALUES ('129', '2', '3', '8', '1');
INSERT INTO `seat` VALUES ('130', '2', '3', '9', '1');
INSERT INTO `seat` VALUES ('131', '2', '3', '10', '1');
INSERT INTO `seat` VALUES ('132', '2', '4', '1', '1');
INSERT INTO `seat` VALUES ('133', '2', '4', '2', '1');
INSERT INTO `seat` VALUES ('134', '2', '4', '3', '1');
INSERT INTO `seat` VALUES ('135', '2', '4', '4', '1');
INSERT INTO `seat` VALUES ('136', '2', '4', '5', '1');
INSERT INTO `seat` VALUES ('137', '2', '4', '6', '1');
INSERT INTO `seat` VALUES ('138', '2', '4', '7', '1');
INSERT INTO `seat` VALUES ('139', '2', '4', '8', '1');
INSERT INTO `seat` VALUES ('140', '2', '4', '9', '1');
INSERT INTO `seat` VALUES ('141', '2', '4', '10', '1');
INSERT INTO `seat` VALUES ('142', '2', '5', '1', '1');
INSERT INTO `seat` VALUES ('143', '2', '5', '2', '1');
INSERT INTO `seat` VALUES ('144', '2', '5', '3', '1');
INSERT INTO `seat` VALUES ('145', '2', '5', '4', '1');
INSERT INTO `seat` VALUES ('146', '2', '5', '5', '1');
INSERT INTO `seat` VALUES ('147', '2', '5', '6', '1');
INSERT INTO `seat` VALUES ('148', '2', '5', '7', '1');
INSERT INTO `seat` VALUES ('149', '2', '5', '8', '1');
INSERT INTO `seat` VALUES ('150', '2', '5', '9', '1');
INSERT INTO `seat` VALUES ('151', '2', '5', '10', '1');
INSERT INTO `seat` VALUES ('152', '2', '6', '1', '1');
INSERT INTO `seat` VALUES ('153', '2', '6', '2', '1');
INSERT INTO `seat` VALUES ('154', '2', '6', '3', '1');
INSERT INTO `seat` VALUES ('155', '2', '6', '4', '1');
INSERT INTO `seat` VALUES ('156', '2', '6', '5', '1');
INSERT INTO `seat` VALUES ('157', '2', '6', '6', '1');
INSERT INTO `seat` VALUES ('158', '2', '6', '7', '1');
INSERT INTO `seat` VALUES ('159', '2', '6', '8', '1');
INSERT INTO `seat` VALUES ('160', '2', '6', '9', '1');
INSERT INTO `seat` VALUES ('161', '2', '6', '10', '1');
INSERT INTO `seat` VALUES ('162', '2', '7', '1', '1');
INSERT INTO `seat` VALUES ('163', '2', '7', '2', '1');
INSERT INTO `seat` VALUES ('164', '2', '7', '3', '1');
INSERT INTO `seat` VALUES ('165', '2', '7', '4', '1');
INSERT INTO `seat` VALUES ('166', '2', '7', '5', '1');
INSERT INTO `seat` VALUES ('167', '2', '7', '6', '1');
INSERT INTO `seat` VALUES ('168', '2', '7', '7', '1');
INSERT INTO `seat` VALUES ('169', '2', '7', '8', '1');
INSERT INTO `seat` VALUES ('170', '2', '7', '9', '1');
INSERT INTO `seat` VALUES ('171', '2', '7', '10', '1');
INSERT INTO `seat` VALUES ('172', '2', '8', '1', '1');
INSERT INTO `seat` VALUES ('173', '2', '8', '2', '1');
INSERT INTO `seat` VALUES ('174', '2', '8', '3', '1');
INSERT INTO `seat` VALUES ('175', '2', '8', '4', '1');
INSERT INTO `seat` VALUES ('176', '2', '8', '5', '1');
INSERT INTO `seat` VALUES ('177', '2', '8', '6', '1');
INSERT INTO `seat` VALUES ('178', '2', '8', '7', '1');
INSERT INTO `seat` VALUES ('179', '2', '8', '8', '1');
INSERT INTO `seat` VALUES ('180', '2', '8', '9', '1');
INSERT INTO `seat` VALUES ('181', '2', '8', '10', '1');
INSERT INTO `seat` VALUES ('182', '2', '9', '1', '1');
INSERT INTO `seat` VALUES ('183', '2', '9', '2', '1');
INSERT INTO `seat` VALUES ('184', '2', '9', '3', '1');
INSERT INTO `seat` VALUES ('185', '2', '9', '4', '1');
INSERT INTO `seat` VALUES ('186', '2', '9', '5', '1');
INSERT INTO `seat` VALUES ('187', '2', '9', '6', '1');
INSERT INTO `seat` VALUES ('188', '2', '9', '7', '1');
INSERT INTO `seat` VALUES ('189', '2', '9', '8', '1');
INSERT INTO `seat` VALUES ('190', '2', '9', '9', '1');
INSERT INTO `seat` VALUES ('191', '2', '9', '10', '1');
INSERT INTO `seat` VALUES ('192', '2', '10', '1', '1');
INSERT INTO `seat` VALUES ('193', '2', '10', '2', '1');
INSERT INTO `seat` VALUES ('194', '2', '10', '3', '1');
INSERT INTO `seat` VALUES ('195', '2', '10', '4', '1');
INSERT INTO `seat` VALUES ('196', '2', '10', '5', '1');
INSERT INTO `seat` VALUES ('197', '2', '10', '6', '1');
INSERT INTO `seat` VALUES ('198', '2', '10', '7', '1');
INSERT INTO `seat` VALUES ('199', '2', '10', '8', '1');
INSERT INTO `seat` VALUES ('200', '2', '10', '9', '1');
INSERT INTO `seat` VALUES ('201', '2', '10', '10', '1');
INSERT INTO `seat` VALUES ('202', '3', '1', '1', '1');
INSERT INTO `seat` VALUES ('203', '3', '1', '2', '1');
INSERT INTO `seat` VALUES ('204', '3', '1', '3', '1');
INSERT INTO `seat` VALUES ('205', '3', '1', '4', '1');
INSERT INTO `seat` VALUES ('206', '3', '1', '5', '1');
INSERT INTO `seat` VALUES ('207', '3', '1', '6', '1');
INSERT INTO `seat` VALUES ('208', '3', '1', '7', '1');
INSERT INTO `seat` VALUES ('209', '3', '1', '8', '1');
INSERT INTO `seat` VALUES ('210', '3', '1', '9', '1');
INSERT INTO `seat` VALUES ('211', '3', '1', '10', '1');
INSERT INTO `seat` VALUES ('212', '3', '2', '1', '1');
INSERT INTO `seat` VALUES ('213', '3', '2', '2', '1');
INSERT INTO `seat` VALUES ('214', '3', '2', '3', '1');
INSERT INTO `seat` VALUES ('215', '3', '2', '4', '1');
INSERT INTO `seat` VALUES ('216', '3', '2', '5', '1');
INSERT INTO `seat` VALUES ('217', '3', '2', '6', '1');
INSERT INTO `seat` VALUES ('218', '3', '2', '7', '1');
INSERT INTO `seat` VALUES ('219', '3', '2', '8', '1');
INSERT INTO `seat` VALUES ('220', '3', '2', '9', '1');
INSERT INTO `seat` VALUES ('221', '3', '2', '10', '1');
INSERT INTO `seat` VALUES ('222', '3', '3', '1', '1');
INSERT INTO `seat` VALUES ('223', '3', '3', '2', '1');
INSERT INTO `seat` VALUES ('224', '3', '3', '3', '1');
INSERT INTO `seat` VALUES ('225', '3', '3', '4', '1');
INSERT INTO `seat` VALUES ('226', '3', '3', '5', '1');
INSERT INTO `seat` VALUES ('227', '3', '3', '6', '1');
INSERT INTO `seat` VALUES ('228', '3', '3', '7', '1');
INSERT INTO `seat` VALUES ('229', '3', '3', '8', '1');
INSERT INTO `seat` VALUES ('230', '3', '3', '9', '1');
INSERT INTO `seat` VALUES ('231', '3', '3', '10', '1');
INSERT INTO `seat` VALUES ('232', '3', '4', '1', '1');
INSERT INTO `seat` VALUES ('233', '3', '4', '2', '1');
INSERT INTO `seat` VALUES ('234', '3', '4', '3', '1');
INSERT INTO `seat` VALUES ('235', '3', '4', '4', '1');
INSERT INTO `seat` VALUES ('236', '3', '4', '5', '1');
INSERT INTO `seat` VALUES ('237', '3', '4', '6', '1');
INSERT INTO `seat` VALUES ('238', '3', '4', '7', '1');
INSERT INTO `seat` VALUES ('239', '3', '4', '8', '1');
INSERT INTO `seat` VALUES ('240', '3', '4', '9', '1');
INSERT INTO `seat` VALUES ('241', '3', '4', '10', '1');
INSERT INTO `seat` VALUES ('242', '3', '5', '1', '1');
INSERT INTO `seat` VALUES ('243', '3', '5', '2', '1');
INSERT INTO `seat` VALUES ('244', '3', '5', '3', '1');
INSERT INTO `seat` VALUES ('245', '3', '5', '4', '1');
INSERT INTO `seat` VALUES ('246', '3', '5', '5', '1');
INSERT INTO `seat` VALUES ('247', '3', '5', '6', '1');
INSERT INTO `seat` VALUES ('248', '3', '5', '7', '1');
INSERT INTO `seat` VALUES ('249', '3', '5', '8', '1');
INSERT INTO `seat` VALUES ('250', '3', '5', '9', '1');
INSERT INTO `seat` VALUES ('251', '3', '5', '10', '1');
INSERT INTO `seat` VALUES ('252', '3', '6', '1', '1');
INSERT INTO `seat` VALUES ('253', '3', '6', '2', '1');
INSERT INTO `seat` VALUES ('254', '3', '6', '3', '1');
INSERT INTO `seat` VALUES ('255', '3', '6', '4', '1');
INSERT INTO `seat` VALUES ('256', '3', '6', '5', '1');
INSERT INTO `seat` VALUES ('257', '3', '6', '6', '1');
INSERT INTO `seat` VALUES ('258', '3', '6', '7', '1');
INSERT INTO `seat` VALUES ('259', '3', '6', '8', '1');
INSERT INTO `seat` VALUES ('260', '3', '6', '9', '1');
INSERT INTO `seat` VALUES ('261', '3', '6', '10', '1');
INSERT INTO `seat` VALUES ('262', '3', '7', '1', '1');
INSERT INTO `seat` VALUES ('263', '3', '7', '2', '1');
INSERT INTO `seat` VALUES ('264', '3', '7', '3', '1');
INSERT INTO `seat` VALUES ('265', '3', '7', '4', '1');
INSERT INTO `seat` VALUES ('266', '3', '7', '5', '1');
INSERT INTO `seat` VALUES ('267', '3', '7', '6', '1');
INSERT INTO `seat` VALUES ('268', '3', '7', '7', '1');
INSERT INTO `seat` VALUES ('269', '3', '7', '8', '1');
INSERT INTO `seat` VALUES ('270', '3', '7', '9', '1');
INSERT INTO `seat` VALUES ('271', '3', '7', '10', '1');
INSERT INTO `seat` VALUES ('272', '3', '8', '1', '1');
INSERT INTO `seat` VALUES ('273', '3', '8', '2', '1');
INSERT INTO `seat` VALUES ('274', '3', '8', '3', '1');
INSERT INTO `seat` VALUES ('275', '3', '8', '4', '1');
INSERT INTO `seat` VALUES ('276', '3', '8', '5', '1');
INSERT INTO `seat` VALUES ('277', '3', '8', '6', '1');
INSERT INTO `seat` VALUES ('278', '3', '8', '7', '1');
INSERT INTO `seat` VALUES ('279', '3', '8', '8', '1');
INSERT INTO `seat` VALUES ('280', '3', '8', '9', '1');
INSERT INTO `seat` VALUES ('281', '3', '8', '10', '1');
INSERT INTO `seat` VALUES ('282', '3', '9', '1', '1');
INSERT INTO `seat` VALUES ('283', '3', '9', '2', '1');
INSERT INTO `seat` VALUES ('284', '3', '9', '3', '1');
INSERT INTO `seat` VALUES ('285', '3', '9', '4', '1');
INSERT INTO `seat` VALUES ('286', '3', '9', '5', '1');
INSERT INTO `seat` VALUES ('287', '3', '9', '6', '1');
INSERT INTO `seat` VALUES ('288', '3', '9', '7', '1');
INSERT INTO `seat` VALUES ('289', '3', '9', '8', '1');
INSERT INTO `seat` VALUES ('290', '3', '9', '9', '1');
INSERT INTO `seat` VALUES ('291', '3', '9', '10', '1');
INSERT INTO `seat` VALUES ('292', '3', '10', '1', '1');
INSERT INTO `seat` VALUES ('293', '3', '10', '2', '1');
INSERT INTO `seat` VALUES ('294', '3', '10', '3', '1');
INSERT INTO `seat` VALUES ('295', '3', '10', '4', '1');
INSERT INTO `seat` VALUES ('296', '3', '10', '5', '1');
INSERT INTO `seat` VALUES ('297', '3', '10', '6', '1');
INSERT INTO `seat` VALUES ('298', '3', '10', '7', '1');
INSERT INTO `seat` VALUES ('299', '3', '10', '8', '1');
INSERT INTO `seat` VALUES ('300', '3', '10', '9', '1');
INSERT INTO `seat` VALUES ('301', '3', '10', '10', '1');
INSERT INTO `seat` VALUES ('302', '5', '1', '1', '1');
INSERT INTO `seat` VALUES ('303', '5', '1', '2', '1');
INSERT INTO `seat` VALUES ('304', '5', '1', '3', '1');
INSERT INTO `seat` VALUES ('305', '5', '1', '4', '1');
INSERT INTO `seat` VALUES ('306', '5', '1', '5', '1');
INSERT INTO `seat` VALUES ('307', '5', '1', '6', '1');
INSERT INTO `seat` VALUES ('308', '5', '1', '7', '1');
INSERT INTO `seat` VALUES ('309', '5', '1', '8', '1');
INSERT INTO `seat` VALUES ('310', '5', '1', '9', '1');
INSERT INTO `seat` VALUES ('311', '5', '1', '10', '1');
INSERT INTO `seat` VALUES ('312', '5', '2', '1', '1');
INSERT INTO `seat` VALUES ('313', '5', '2', '2', '1');
INSERT INTO `seat` VALUES ('314', '5', '2', '3', '1');
INSERT INTO `seat` VALUES ('315', '5', '2', '4', '1');
INSERT INTO `seat` VALUES ('316', '5', '2', '5', '1');
INSERT INTO `seat` VALUES ('317', '5', '2', '6', '1');
INSERT INTO `seat` VALUES ('318', '5', '2', '7', '1');
INSERT INTO `seat` VALUES ('319', '5', '2', '8', '1');
INSERT INTO `seat` VALUES ('320', '5', '2', '9', '1');
INSERT INTO `seat` VALUES ('321', '5', '2', '10', '1');
INSERT INTO `seat` VALUES ('322', '5', '3', '1', '1');
INSERT INTO `seat` VALUES ('323', '5', '3', '2', '1');
INSERT INTO `seat` VALUES ('324', '5', '3', '3', '1');
INSERT INTO `seat` VALUES ('325', '5', '3', '4', '1');
INSERT INTO `seat` VALUES ('326', '5', '3', '5', '1');
INSERT INTO `seat` VALUES ('327', '5', '3', '6', '1');
INSERT INTO `seat` VALUES ('328', '5', '3', '7', '1');
INSERT INTO `seat` VALUES ('329', '5', '3', '8', '1');
INSERT INTO `seat` VALUES ('330', '5', '3', '9', '1');
INSERT INTO `seat` VALUES ('331', '5', '3', '10', '1');
INSERT INTO `seat` VALUES ('332', '5', '4', '1', '1');
INSERT INTO `seat` VALUES ('333', '5', '4', '2', '1');
INSERT INTO `seat` VALUES ('334', '5', '4', '3', '1');
INSERT INTO `seat` VALUES ('335', '5', '4', '4', '1');
INSERT INTO `seat` VALUES ('336', '5', '4', '5', '1');
INSERT INTO `seat` VALUES ('337', '5', '4', '6', '1');
INSERT INTO `seat` VALUES ('338', '5', '4', '7', '1');
INSERT INTO `seat` VALUES ('339', '5', '4', '8', '1');
INSERT INTO `seat` VALUES ('340', '5', '4', '9', '1');
INSERT INTO `seat` VALUES ('341', '5', '4', '10', '1');
INSERT INTO `seat` VALUES ('342', '5', '5', '1', '1');
INSERT INTO `seat` VALUES ('343', '5', '5', '2', '1');
INSERT INTO `seat` VALUES ('344', '5', '5', '3', '1');
INSERT INTO `seat` VALUES ('345', '5', '5', '4', '1');
INSERT INTO `seat` VALUES ('346', '5', '5', '5', '1');
INSERT INTO `seat` VALUES ('347', '5', '5', '6', '1');
INSERT INTO `seat` VALUES ('348', '5', '5', '7', '1');
INSERT INTO `seat` VALUES ('349', '5', '5', '8', '1');
INSERT INTO `seat` VALUES ('350', '5', '5', '9', '1');
INSERT INTO `seat` VALUES ('351', '5', '5', '10', '1');
INSERT INTO `seat` VALUES ('352', '5', '6', '1', '1');
INSERT INTO `seat` VALUES ('353', '5', '6', '2', '1');
INSERT INTO `seat` VALUES ('354', '5', '6', '3', '1');
INSERT INTO `seat` VALUES ('355', '5', '6', '4', '1');
INSERT INTO `seat` VALUES ('356', '5', '6', '5', '1');
INSERT INTO `seat` VALUES ('357', '5', '6', '6', '1');
INSERT INTO `seat` VALUES ('358', '5', '6', '7', '1');
INSERT INTO `seat` VALUES ('359', '5', '6', '8', '1');
INSERT INTO `seat` VALUES ('360', '5', '6', '9', '1');
INSERT INTO `seat` VALUES ('361', '5', '6', '10', '1');
INSERT INTO `seat` VALUES ('362', '5', '7', '1', '1');
INSERT INTO `seat` VALUES ('363', '5', '7', '2', '1');
INSERT INTO `seat` VALUES ('364', '5', '7', '3', '1');
INSERT INTO `seat` VALUES ('365', '5', '7', '4', '1');
INSERT INTO `seat` VALUES ('366', '5', '7', '5', '1');
INSERT INTO `seat` VALUES ('367', '5', '7', '6', '1');
INSERT INTO `seat` VALUES ('368', '5', '7', '7', '1');
INSERT INTO `seat` VALUES ('369', '5', '7', '8', '1');
INSERT INTO `seat` VALUES ('370', '5', '7', '9', '1');
INSERT INTO `seat` VALUES ('371', '5', '7', '10', '1');
INSERT INTO `seat` VALUES ('372', '5', '8', '1', '1');
INSERT INTO `seat` VALUES ('373', '5', '8', '2', '1');
INSERT INTO `seat` VALUES ('374', '5', '8', '3', '1');
INSERT INTO `seat` VALUES ('375', '5', '8', '4', '1');
INSERT INTO `seat` VALUES ('376', '5', '8', '5', '1');
INSERT INTO `seat` VALUES ('377', '5', '8', '6', '1');
INSERT INTO `seat` VALUES ('378', '5', '8', '7', '1');
INSERT INTO `seat` VALUES ('379', '5', '8', '8', '1');
INSERT INTO `seat` VALUES ('380', '5', '8', '9', '1');
INSERT INTO `seat` VALUES ('381', '5', '8', '10', '1');
INSERT INTO `seat` VALUES ('382', '5', '9', '1', '1');
INSERT INTO `seat` VALUES ('383', '5', '9', '2', '1');
INSERT INTO `seat` VALUES ('384', '5', '9', '3', '1');
INSERT INTO `seat` VALUES ('385', '5', '9', '4', '1');
INSERT INTO `seat` VALUES ('386', '5', '9', '5', '1');
INSERT INTO `seat` VALUES ('387', '5', '9', '6', '1');
INSERT INTO `seat` VALUES ('388', '5', '9', '7', '1');
INSERT INTO `seat` VALUES ('389', '5', '9', '8', '1');
INSERT INTO `seat` VALUES ('390', '5', '9', '9', '1');
INSERT INTO `seat` VALUES ('391', '5', '9', '10', '1');
INSERT INTO `seat` VALUES ('392', '5', '10', '1', '1');
INSERT INTO `seat` VALUES ('393', '5', '10', '2', '1');
INSERT INTO `seat` VALUES ('394', '5', '10', '3', '1');
INSERT INTO `seat` VALUES ('395', '5', '10', '4', '1');
INSERT INTO `seat` VALUES ('396', '5', '10', '5', '1');
INSERT INTO `seat` VALUES ('397', '5', '10', '6', '1');
INSERT INTO `seat` VALUES ('398', '5', '10', '7', '1');
INSERT INTO `seat` VALUES ('399', '5', '10', '8', '1');
INSERT INTO `seat` VALUES ('400', '5', '10', '9', '1');
INSERT INTO `seat` VALUES ('401', '5', '10', '10', '1');

-- ----------------------------
-- Table structure for showmessage
-- ----------------------------
DROP TABLE IF EXISTS `showmessage`;
CREATE TABLE `showmessage` (
  `idM` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) DEFAULT NULL,
  `hall_id` int(11) DEFAULT NULL,
  `price` double(10,0) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `shop_num` int(11) DEFAULT NULL,
  `statusM` int(11) NOT NULL DEFAULT '1' COMMENT '1为成功发布 -1未成功发布',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`idM`),
  KEY `movie_id` (`movie_id`),
  KEY `hall_id` (`hall_id`),
  CONSTRAINT `showmessage_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  CONSTRAINT `showmessage_ibfk_2` FOREIGN KEY (`hall_id`) REFERENCES `hall` (`idH`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of showmessage
-- ----------------------------
INSERT INTO `showmessage` VALUES ('1', '1', '1', '36', '2017-01-05 23:34:02', '0', '1', 'null');
INSERT INTO `showmessage` VALUES ('2', '2', '1', '21', '2016-12-31 16:56:00', '0', '1', '2121211\r\n1');
INSERT INTO `showmessage` VALUES ('3', '3', '5', '1221', '2016-12-21 17:12:00', null, '-1', '212121sdddddddddddsds');
INSERT INTO `showmessage` VALUES ('4', '6', '1', '11', '2016-12-21 17:22:00', null, '1', '2111111111');
INSERT INTO `showmessage` VALUES ('5', '1', '2', '30', '2016-12-29 23:32:05', null, '1', null);
INSERT INTO `showmessage` VALUES ('6', '3', '1', '32', '2016-12-14 22:54:58', '0', '1', 'null');
INSERT INTO `showmessage` VALUES ('7', '6', '1', '32', '2016-12-31 22:54:58', null, '1', null);
INSERT INTO `showmessage` VALUES ('8', '6', '2', '23', '2017-01-06 20:28:43', null, '1', null);
INSERT INTO `showmessage` VALUES ('9', '4', '2', '32', '2017-01-19 23:29:32', null, '1', null);
INSERT INTO `showmessage` VALUES ('10', '3', '1', '34', '2017-01-07 20:30:10', null, '1', null);
INSERT INTO `showmessage` VALUES ('11', '1', '1', '36', '2017-01-05 23:34:02', null, '1', null);
INSERT INTO `showmessage` VALUES ('12', '30', '3', '30', '2017-01-07 22:17:10', null, '1', '9*');
INSERT INTO `showmessage` VALUES ('13', '34', '1', '30', '2017-02-19 20:12:47', null, '1', null);
INSERT INTO `showmessage` VALUES ('14', '31', '2', '25', '2017-02-20 15:13:35', null, '1', null);
INSERT INTO `showmessage` VALUES ('15', '1', '1', '26', '2017-02-21 15:15:17', null, '1', null);
INSERT INTO `showmessage` VALUES ('16', '35', '2', '20', '2017-05-24 21:50:57', null, '1', '宫崎骏经典作品，满满的感动，适合周末放松');
INSERT INTO `showmessage` VALUES ('17', '35', '1', '25', '2017-05-08 23:52:38', null, '1', null);
INSERT INTO `showmessage` VALUES ('18', '35', '1', '30', '2017-05-09 21:53:15', null, '1', null);
INSERT INTO `showmessage` VALUES ('19', '35', '1', '36', '2017-05-10 21:53:37', null, '1', null);
INSERT INTO `showmessage` VALUES ('20', '35', '1', '30', '2017-05-09 21:53:53', null, '1', null);
INSERT INTO `showmessage` VALUES ('21', '35', '1', '26', '2017-05-09 21:54:09', null, '1', null);
INSERT INTO `showmessage` VALUES ('22', '34', '1', '35', '2017-09-19 19:37:06', null, '1', null);
INSERT INTO `showmessage` VALUES ('23', '34', '1', '30', '2017-09-14 19:38:33', null, '1', null);
INSERT INTO `showmessage` VALUES ('24', '35', '1', '30', '2017-09-15 23:59:29', '0', '1', 'null');
INSERT INTO `showmessage` VALUES ('25', '33', '2', '30', '2017-09-16 19:01:11', null, '1', '影片首映宣传');
INSERT INTO `showmessage` VALUES ('26', '31', '3', '32', '2017-09-15 18:02:58', null, '1', null);
INSERT INTO `showmessage` VALUES ('27', '29', '2', '28', '2017-09-15 19:03:54', null, '1', null);
INSERT INTO `showmessage` VALUES ('28', '22', '1', '23', '2017-09-16 19:05:04', null, '1', null);
INSERT INTO `showmessage` VALUES ('29', '19', '3', '36', '2017-09-17 19:05:53', null, '1', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '1' COMMENT '1在职 -1离职',
  `power` int(11) DEFAULT '1' COMMENT '1为普通员工 2管理员 3超级管理员',
  `tel` varchar(255) DEFAULT NULL,
  `IDCard` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', 'admin', 'admin', '豆子', '1', '2', '15062535248', '632574859632541252');
INSERT INTO `user` VALUES ('3', 'sea', '123', '笑容', '-1', '1', '17652632541', '652478526956325415');
INSERT INTO `user` VALUES ('5', 'red', '123', '王右', '-1', '1', 'null', 'null');
INSERT INTO `user` VALUES ('6', 'kenny', '123', '王友', '-1', '1', 'null', 'null');
INSERT INTO `user` VALUES ('7', 'jhon', '123', '王有', '-1', '1', 'null', 'null');
INSERT INTO `user` VALUES ('8', 'kim', '123', '王由', '-1', '1', '21', '21');
INSERT INTO `user` VALUES ('9', 'sam', '123', '王游', '1', '1', '1589698563', '245623658965236541');
INSERT INTO `user` VALUES ('10', 'amy', '123', '王呦', '1', '1', '334', '25547');
INSERT INTO `user` VALUES ('11', 'smith', '123', '王尤', '1', '1', '43', '43');
INSERT INTO `user` VALUES ('12', 'robot', '123', '王佑', '1', '1', '543', '54335');
INSERT INTO `user` VALUES ('13', 'fly', '123', '王悠', '-1', '1', '543', '35');
INSERT INTO `user` VALUES ('14', 'gone', '123', '王酉', '-1', '1', '34', '53');
INSERT INTO `user` VALUES ('15', 'miss', '123', '王囿', '-1', '1', '1212', '121221');
INSERT INTO `user` VALUES ('16', 'bean', '123', '王侑', '1', '1', '1212', '2112');
INSERT INTO `user` VALUES ('17', 'cat', '123', '王秀', '-1', '1', '3232', '3232');
INSERT INTO `user` VALUES ('18', 'nana', '123', '王休', '1', '2', '5699', '5699');
INSERT INTO `user` VALUES ('19', 'ready', '123', '王修', '1', '2', '555', '555');
INSERT INTO `user` VALUES ('20', 'baby', '123', '王琇', '1', '1', '5623132', '321');
INSERT INTO `user` VALUES ('21', 'gogo', '123', '王脩', '-1', '2', '1654852639299', '99999998888888888888');
INSERT INTO `user` VALUES ('22', 'son', '123', '王珛', '-1', '1', '123', '123');
INSERT INTO `user` VALUES ('23', 'blue', '123', '王苬', '-1', '1', 'ddd', 'dd');
INSERT INTO `user` VALUES ('24', 'white', '123', '白', '-1', '1', '16235478963', '354128549663528574');
INSERT INTO `user` VALUES ('25', 'bey', '123', null, '1', '1', null, null);
