/*
 Navicat MySQL Data Transfer

 Source Server         : sujian
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost
 Source Database       : shop

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : utf-8

 Date: 01/02/2017 18:06:40 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `globle_configs`
-- ----------------------------
DROP TABLE IF EXISTS `globle_configs`;
CREATE TABLE `globle_configs` (
  `gc_id` int(4) NOT NULL AUTO_INCREMENT,
  `gc_key` varchar(100) NOT NULL,
  `gc_value` varchar(255) NOT NULL,
  `gc_rmk` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gc_id`),
  KEY `globleconfigskeyindex` (`gc_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='全局配置表';

-- ----------------------------
--  Records of `globle_configs`
-- ----------------------------
BEGIN;
INSERT INTO `globle_configs` VALUES ('1', 'WITHHOLD_ADVANCE_DAY', '3', '代扣提前天数');
COMMIT;

-- ----------------------------
--  Table structure for `sys_field_info`
-- ----------------------------
DROP TABLE IF EXISTS `sys_field_info`;
CREATE TABLE `sys_field_info` (
  `busi_id` varchar(22) NOT NULL COMMENT '业务编号',
  `field_name` varchar(32) NOT NULL COMMENT '字典名称',
  `cn_name` varchar(64) DEFAULT NULL COMMENT '字典名称描述',
  `field_value` varchar(32) NOT NULL COMMENT '字典值',
  `field_desc` varchar(128) DEFAULT NULL COMMENT '字典值描述',
  `field_order` bigint(8) DEFAULT NULL COMMENT '顺序',
  `remark` varchar(8) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`busi_id`,`field_name`,`field_value`),
  KEY `sys_field_info_index` (`field_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_field_info`
-- ----------------------------
BEGIN;
INSERT INTO `sys_field_info` VALUES ('status', 'resSelect', '不通过', 'F', '不通过', '2', null), ('status', 'resSelect', '异常', 'P', '异常', '3', null), ('status', 'resSelect', '通过', 'S', '通过', '1', null);
COMMIT;

-- ----------------------------
--  Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `oper_id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `oper_user` varchar(60) DEFAULT NULL COMMENT '用户名',
  `oper_ip` varchar(60) DEFAULT NULL COMMENT '所在IP地址',
  `oper_type` varchar(10) DEFAULT NULL COMMENT '操作类型',
  `oper_name` varchar(300) DEFAULT NULL COMMENT '操作名称',
  `oper_content` varchar(300) DEFAULT NULL COMMENT '执行内容',
  `oper_status` char(1) DEFAULT NULL COMMENT '执行状态',
  `oper_dt` varchar(32) DEFAULT NULL COMMENT '当前时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='系统操作日志表';

-- ----------------------------
--  Records of `sys_log`
-- ----------------------------
BEGIN;
INSERT INTO `sys_log` VALUES ('3', 'system', '0:0:0:0:0:0:0:1', '10', '系统登录', '', 'S', '2016-12-09 16:00:34'), ('4', 'system', '0:0:0:0:0:0:0:1', '10', '系统登录', '', 'S', '2016-12-09 16:01:37'), ('5', 'system', '0:0:0:0:0:0:0:1', '10', '系统登录', '', 'S', '2016-12-12 11:27:50'), ('6', 'system', '0:0:0:0:0:0:0:1', '10', '系统登录', '', 'S', '2016-12-31 18:07:21'), ('7', 'system', '0:0:0:0:0:0:0:1', '10', '系统登录', '', 'S', '2016-12-31 18:09:39'), ('8', 'system', '0:0:0:0:0:0:0:1', '10', '系统登录', '', 'S', '2016-12-31 18:36:40'), ('9', 'system', '0:0:0:0:0:0:0:1', '10', '系统登录', '', 'S', '2016-12-31 22:25:32'), ('10', 'system', '192.168.1.100', '10', '系统登录', '', 'S', '2017-01-01 20:04:03'), ('11', 'system', '192.168.1.103', '10', '系统登录', '', 'S', '2017-01-01 20:06:11');
COMMIT;

-- ----------------------------
--  Table structure for `sys_menu_info`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_info`;
CREATE TABLE `sys_menu_info` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `menu_name` varchar(192) DEFAULT NULL COMMENT '名称',
  `superior_id` varchar(90) DEFAULT NULL COMMENT '上级编号',
  `link_url` varchar(768) DEFAULT NULL COMMENT '连接地址',
  `disp_image` varchar(192) DEFAULT NULL,
  `menu_order` int(11) DEFAULT '0' COMMENT '菜单顺序',
  `perm_valid` varchar(48) DEFAULT NULL COMMENT '权限',
  `valid_action` varchar(384) DEFAULT NULL,
  `valid_oper` varchar(384) DEFAULT NULL COMMENT '操作员',
  `status` int(11) DEFAULT '0' COMMENT '状态，0禁用，1正常',
  `remark` varchar(192) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='系统菜单信息表';

-- ----------------------------
--  Records of `sys_menu_info`
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu_info` VALUES ('1', '我的工作台', 'ROOT', 'workbench', 'icon-home', '1', null, null, null, '1', null), ('2', '系统管理', 'ROOT', 'sys', 'hfq-shezhi', '7', null, null, null, '0', null), ('3', '用户管理', '2', 'sys/user', null, '1', null, null, null, '0', null), ('4', '角色管理', '2', 'sys/role', null, '2', null, null, null, '1', null), ('5', '权限管理', '2', 'sys/per', null, '3', null, null, null, '1', null), ('6', '修改密码', '2', 'sys/updatepwd', null, '4', null, null, null, '0', null), ('7', '系统日志', '2', 'syslog/list', null, '5', null, null, null, '0', null);
COMMIT;

-- ----------------------------
--  Table structure for `sys_perm_info`
-- ----------------------------
DROP TABLE IF EXISTS `sys_perm_info`;
CREATE TABLE `sys_perm_info` (
  `perm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `perm_name` varchar(32) DEFAULT NULL COMMENT '权限名称',
  `perm_string` varchar(32) DEFAULT NULL COMMENT '权限英文',
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`perm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统权限信息表';

-- ----------------------------
--  Records of `sys_perm_info`
-- ----------------------------
BEGIN;
INSERT INTO `sys_perm_info` VALUES ('1', '新增产品', 'pro:show', 'system', '2015-01-05 17:17:27'), ('2', '修改产品', 'pro:update', 'system', '2015-01-05 17:17:27');
COMMIT;

-- ----------------------------
--  Table structure for `sys_role_info`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_info`;
CREATE TABLE `sys_role_info` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_name` varchar(32) DEFAULT NULL COMMENT '角色名称',
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `audit_sequence` int(11) DEFAULT NULL COMMENT '审核级别',
  `role_disc` varchar(256) DEFAULT NULL COMMENT '角色备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='系统角色信息表';

-- ----------------------------
--  Records of `sys_role_info`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_info` VALUES ('1', '初审员', 'system', '2015-01-05 17:17:27', '1', '初始角色'), ('3', '复审员', 'system', '2015-03-01 11:01:37', '2', '初始角色'), ('4', '终审员', 'system', '2015-03-01 11:01:55', '3', '初始角色'), ('17', '风控', 'system', '2016-09-12 17:55:57', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `sys_role_perm`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_perm`;
CREATE TABLE `sys_role_perm` (
  `role_perm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `perm_id` int(11) DEFAULT NULL COMMENT '权限id',
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_perm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='角色权限表';

-- ----------------------------
--  Records of `sys_role_perm`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_perm` VALUES ('3', '2', '1', 'system', '2015-01-05 17:20:13'), ('5', '4', '1', 'haha', '2015-10-21 03:26:19'), ('6', '4', '2', 'haha', '2015-10-21 03:26:19');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user_info`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_info`;
CREATE TABLE `sys_user_info` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(32) DEFAULT NULL COMMENT '用户名',
  `true_name` varchar(32) DEFAULT NULL COMMENT '姓名or昵称',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `salt` varchar(64) DEFAULT NULL COMMENT '盐',
  `phone` varchar(32) DEFAULT NULL COMMENT '电话',
  `email` varchar(64) DEFAULT NULL COMMENT '电子邮件',
  `user_status` varchar(2) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `login_time` datetime DEFAULT NULL COMMENT '最近一次登录时间',
  `locked` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统用户信息表';

-- ----------------------------
--  Records of `sys_user_info`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_info` VALUES ('1', 'system', '管理员', 'e5644408871cc3e2adab68b43b723fd9', 'e21a09abc1560003d38d152b8ecc2d30', '18143113212', 'zhangxx@yqjr.com.cn', '0', '2015-01-05 17:16:23', '2016-12-27 13:50:59', '2017-01-01 20:06:11', null);
COMMIT;

-- ----------------------------
--  Table structure for `sys_user_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_menu`;
CREATE TABLE `sys_user_menu` (
  `user_menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `menu_id` int(11) DEFAULT NULL COMMENT '菜单ID',
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15031 DEFAULT CHARSET=utf8 COMMENT='系统用户菜单表';

-- ----------------------------
--  Records of `sys_user_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_menu` VALUES ('15025', '1', '2', 'system', '2016-12-27 13:50:59'), ('15026', '1', '3', 'system', '2016-12-27 13:50:59'), ('15027', '1', '4', 'system', '2016-12-27 13:50:59'), ('15028', '1', '5', 'system', '2016-12-27 13:50:59'), ('15029', '1', '6', 'system', '2016-12-27 13:50:59'), ('15030', '1', '7', 'system', '2016-12-27 13:50:59');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户角色表';

SET FOREIGN_KEY_CHECKS = 1;
