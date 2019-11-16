/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50712
 Source Host           : localhost:3306
 Source Schema         : membersystem

 Target Server Type    : MySQL
 Target Server Version : 50712
 File Encoding         : 65001

 Date: 28/05/2019 21:39:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `uid` int(11) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录系统的用户名账号',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '123');
INSERT INTO `admin` VALUES (2, 'Atlantis', '123');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日志类型',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作者',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作者的ip',
  `date` datetime(0) NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (5, '危险', '修改管理员密码成功', 'admin', '0:0:0:0:0:0:0:1', '2019-05-28 20:44:47');
INSERT INTO `log` VALUES (6, '信息', '登录成功', 'admin', '0:0:0:0:0:0:0:1', '2019-05-28 20:44:51');
INSERT INTO `log` VALUES (7, '危险', '修改管理员密码成功', 'admin', '0:0:0:0:0:0:0:1', '2019-05-28 20:44:56');
INSERT INTO `log` VALUES (9, '警告', '删除会员[会员卡号：25]', 'admin', '0:0:0:0:0:0:0:1', '2019-05-28 20:59:56');
INSERT INTO `log` VALUES (17, '信息', '登录成功', 'admin', '0:0:0:0:0:0:0:1', '2019-05-28 21:38:58');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id` int(10) NOT NULL COMMENT '会员卡编号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员名',
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别：1男 - 0女  -  null保密',
  `money` decimal(9, 2) NULL DEFAULT NULL COMMENT '可使用的余额',
  `date` datetime(0) NOT NULL COMMENT '会员注册的时间',
  PRIMARY KEY (`id`, `tel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (1, '张三', '15100000025', '男', 352.00, '2019-05-24 17:18:04');
INSERT INTO `member` VALUES (2, '李四', '15100000011', '男', 10.00, '2019-04-09 00:00:00');
INSERT INTO `member` VALUES (3, 'Atlantis', '15172790000', '保密', 100.00, '2019-04-22 00:00:00');
INSERT INTO `member` VALUES (4, '小张', '15172791112', '男', 11.00, '2019-04-22 17:50:27');
INSERT INTO `member` VALUES (5, '小张2', '15172791113', '女', 111.00, '2019-04-22 17:50:43');
INSERT INTO `member` VALUES (6, '员时', '15172790122', '男', 2.00, '2019-04-22 17:52:09');
INSERT INTO `member` VALUES (7, '小张3', '15172790000', '保密', 1.00, '2019-04-22 17:53:30');
INSERT INTO `member` VALUES (8, '小张4', '15172790000', '女', 1.00, '2019-04-22 17:53:43');
INSERT INTO `member` VALUES (9, '小张221', '15172790000', '保密', 5.00, '2019-04-22 17:53:55');
INSERT INTO `member` VALUES (10, '乌云', '15172720110', '保密', 20.00, '2019-04-29 14:55:45');
INSERT INTO `member` VALUES (11, '赵雷', '123123111', '保密 ', 100.00, '2019-04-29 14:56:37');
INSERT INTO `member` VALUES (12, 'aaa', '11', '男', 28.00, '2019-04-30 18:19:06');
INSERT INTO `member` VALUES (13, '伍灵奇', '15172791100', '保密', 9.70, '2019-04-30 18:20:27');
INSERT INTO `member` VALUES (14, 'asc', '12313111111', '女', 0.00, '2019-04-30 18:21:18');
INSERT INTO `member` VALUES (15, 'asdad', '15172791234', '保密', -25.00, '2019-05-05 10:32:21');
INSERT INTO `member` VALUES (16, '1111', '15172790005', '保密', 15.00, '2019-05-05 11:10:08');
INSERT INTO `member` VALUES (17, 'Anderson', '15172791112', '保密', 0.00, '2019-05-05 13:59:43');
INSERT INTO `member` VALUES (18, '小张111', '', '保密 ', 0.00, '2019-05-05 14:01:50');
INSERT INTO `member` VALUES (19, 'Atlantis11', '', '保密', 100.00, '2019-05-05 14:11:51');
INSERT INTO `member` VALUES (20, '111111', '15172790000', '保密', 40.00, '2019-05-05 14:12:44');
INSERT INTO `member` VALUES (21, '1112311', '11172791112', '保密', 0.00, '2019-05-06 17:25:30');
INSERT INTO `member` VALUES (22, '111asad', '15172790003', '保密', 0.00, '2019-05-06 17:26:41');
INSERT INTO `member` VALUES (23, '大宗', '15172120000', '男', 12.50, '2019-05-06 18:30:53');
INSERT INTO `member` VALUES (24, '萨达   ', '15172790022', '女', 2.00, '2019-05-06 18:31:36');
INSERT INTO `member` VALUES (26, '11', '15100000025', '保密', 10.00, '2019-05-28 20:59:37');

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '记录编号',
  `memberid` int(20) NOT NULL COMMENT '外键，会员卡号',
  `recorddate` datetime(0) NOT NULL COMMENT '记录时间',
  `recordtype` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录类型：1消费 - 0充值',
  `changemoney` decimal(9, 2) NOT NULL COMMENT '消费金额或充值金额，不代表会员余额',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (1, 1, '2019-04-08 17:29:00', '消费', 25.00, '无');
INSERT INTO `record` VALUES (2, 2, '2019-04-11 21:56:31', '充值', 200.00, '无');
INSERT INTO `record` VALUES (3, 1, '2019-04-21 21:46:05', '消费', 65.00, '1111');
INSERT INTO `record` VALUES (5, 11, '2019-04-29 16:49:11', '充值', 100.00, '11');
INSERT INTO `record` VALUES (6, 11, '2019-04-29 16:49:31', '消费', 25.00, '');
INSERT INTO `record` VALUES (7, 11, '2019-04-29 16:50:12', '消费', 25.00, '记录');
INSERT INTO `record` VALUES (8, 11, '2019-04-29 17:19:31', '充值', 100.00, '');
INSERT INTO `record` VALUES (9, 11, '2019-04-30 17:12:48', '消费', 11.00, '');
INSERT INTO `record` VALUES (10, 12, '2019-04-30 18:44:39', '充值', 1.00, '');
INSERT INTO `record` VALUES (11, 12, '2019-04-30 18:44:43', '充值', 1.00, '');
INSERT INTO `record` VALUES (14, 12, '2019-04-30 18:44:50', '充值', 1.00, '');
INSERT INTO `record` VALUES (15, 12, '2019-04-30 18:44:52', '充值', 1.00, '');
INSERT INTO `record` VALUES (17, 12, '2019-04-30 18:44:57', '充值', 12.00, '');
INSERT INTO `record` VALUES (22, 16, '2019-05-12 12:16:18', '消费', 1.00, '1');
INSERT INTO `record` VALUES (23, 16, '2019-05-04 12:16:30', '消费', 1.00, '1111');
INSERT INTO `record` VALUES (24, 16, '2019-05-01 12:17:00', '充值', 1.00, '');
INSERT INTO `record` VALUES (25, 16, '2019-05-05 09:17:59', '消费', 2.00, '112');
INSERT INTO `record` VALUES (26, 19, '2019-05-05 14:11:51', '充值', 100.00, '会员注册时所充值的初始余额');
INSERT INTO `record` VALUES (39, 15, '2019-05-06 18:21:24', '消费', 25.00, '');
INSERT INTO `record` VALUES (45, 20, '2019-05-06 16:34:21', '充值', 50.00, '');
INSERT INTO `record` VALUES (47, 20, '2019-05-06 16:35:00', '消费', 10.00, '');
INSERT INTO `record` VALUES (48, 23, '2019-05-06 18:30:53', '充值', 12.50, '会员注册时所充值的初始余额');
INSERT INTO `record` VALUES (49, 13, '2019-05-06 19:32:49', '充值', 10.00, '');
INSERT INTO `record` VALUES (50, 13, '2019-05-06 19:42:30', '消费', 0.50, '');
INSERT INTO `record` VALUES (51, 13, '2019-05-06 19:42:48', '充值', 0.20, '1111');

SET FOREIGN_KEY_CHECKS = 1;
