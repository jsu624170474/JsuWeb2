CREATE TABLE jsuweb.cfg_goods (
	id int(10) NOT NULL auto_increment,
	name varchar(200),
	goods_type_id int(10),
	flag char(2) NOT NULL,
	period_amt double,
	stock int(10),
	is_Recommend char(1),
	sales_amt double,
	sales_date_begin varchar(20),
	sales_date_end varchar(20),
	sales_limit_num varchar(20),
	pic_url varchar(100),
	remark varchar(500),
	order_seq varchar(10),
	update_Time varchar(20),
	update_User varchar(32),
	PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE jsuweb.cfg_goods_pic (
	id int(10) NOT NULL auto_increment,
	goods_id int(10),
	pic_url varchar(200),
	remark varchar(500),
	order_seq varchar(10),
	updateTime varchar(20),
	PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE jsuweb.cfg_goods_type (
	id int(10) NOT NULL auto_increment,
	name varchar(32) NOT NULL,
	remark varchar(200),
	PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE jsuweb.leave_message (
	id int(10) NOT NULL auto_increment,
	name varchar(80),
	phone varchar(20),
	email varchar(100),
	message varchar(255),
	create_time timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE jsuweb.sys_menu_info (
	menu_id varchar(20) NOT NULL,
	menu_name varchar(80),
	menu_order varchar(20),
	link_url varchar(768),
	disp_image varchar(192),
	status char(1) DEFAULT '1',
	remark varchar(100),
	PRIMARY KEY (menu_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE jsuweb.sys_role_info (
	role_id varchar(20) NOT NULL,
	role_name varchar(32),
	create_user int(10),
	create_time datetime,
	remark varchar(100),
	PRIMARY KEY (role_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE jsuweb.sys_seq (
	name varchar(50) NOT NULL,
	val bigint(20) NOT NULL,
	raise int(10) DEFAULT 1 NOT NULL,
	`desc` varchar(128),
	PRIMARY KEY (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE jsuweb.sys_user_info (
	user_id int(10) NOT NULL auto_increment,
	login_name varchar(32),
	name varchar(32),
	password varchar(64),
	salt varchar(64),
	phone varchar(32),
	email varchar(64),
	status varchar(2),
	create_time datetime,
	update_time datetime,
	login_time datetime,
	PRIMARY KEY (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE jsuweb.sys_user_menu (
	user_id int(10) NOT NULL,
	menu_id varchar(20) NOT NULL,
	create_user varchar(32),
	create_time datetime,
	PRIMARY KEY (user_id,menu_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE jsuweb.sys_user_role (
	user_id int(10) DEFAULT 0 NOT NULL,
	role_id varchar(20) NOT NULL,
	creator int(10),
	create_time datetime,
	PRIMARY KEY (user_id,role_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO jsuweb.cfg_goods(id, name, goods_type_id, flag, period_amt, stock, is_Recommend, sales_amt, sales_date_begin, sales_date_end, sales_limit_num, pic_url, remark, order_seq, update_Time, update_User) VALUES (1, '基本原则', 3, '10', 50.00, 100, 'Y', 50.00, '', '', '', '20170112/nar_17011217132346.jpg', '', null, '2017-01-13 16:58:04', '1');
INSERT INTO jsuweb.cfg_goods(id, name, goods_type_id, flag, period_amt, stock, is_Recommend, sales_amt, sales_date_begin, sales_date_end, sales_limit_num, pic_url, remark, order_seq, update_Time, update_User) VALUES (2, '推荐商品2', 3, '10', 45.00, 200, 'Y', 29.90, '', '', '', '20170112/nar_170112171401881.jpg', '', null, '2017-01-12 17:14:01', '1');
INSERT INTO jsuweb.cfg_goods(id, name, goods_type_id, flag, period_amt, stock, is_Recommend, sales_amt, sales_date_begin, sales_date_end, sales_limit_num, pic_url, remark, order_seq, update_Time, update_User) VALUES (3, '援藏东奔西走东奔西走苦 顶替', 3, '10', 50.00, 100, 'Y', 99.90, '', '', '', '20170112/nar_170112175311458.jpg', '', null, '2017-01-12 17:53:22', '1');
INSERT INTO jsuweb.cfg_goods(id, name, goods_type_id, flag, period_amt, stock, is_Recommend, sales_amt, sales_date_begin, sales_date_end, sales_limit_num, pic_url, remark, order_seq, update_Time, update_User) VALUES (4, '苛枯硅村苛枯硅械无可奈何花落去 模压 苛1232', 3, '10', 100.00, 100, 'Y', 100.00, '', '', '', '20170112/nar_170112181637729.jpg', '', null, '2017-01-13 16:58:39', '1');
INSERT INTO jsuweb.cfg_goods_pic(id, goods_id, pic_url, remark, order_seq, updateTime) VALUES (37, 2, '20170112/nar_170112141158146.jpg', null, '01', '2017-01-12 17:14:01');
INSERT INTO jsuweb.cfg_goods_pic(id, goods_id, pic_url, remark, order_seq, updateTime) VALUES (38, 2, '20170112/nar_170112141158383.jpg', null, '02', '2017-01-12 17:14:02');
INSERT INTO jsuweb.cfg_goods_pic(id, goods_id, pic_url, remark, order_seq, updateTime) VALUES (39, 2, '20170112/nar_17011214120802.jpg', null, '03', '2017-01-12 17:14:02');
INSERT INTO jsuweb.cfg_goods_pic(id, goods_id, pic_url, remark, order_seq, updateTime) VALUES (40, 2, '20170112/nar_17011214122045.jpg', null, '04', '2017-01-12 17:14:02');
INSERT INTO jsuweb.cfg_goods_pic(id, goods_id, pic_url, remark, order_seq, updateTime) VALUES (41, 3, '20170112/nar_170112151425897.jpg', null, '01', '2017-01-12 17:53:11');
INSERT INTO jsuweb.cfg_goods_pic(id, goods_id, pic_url, remark, order_seq, updateTime) VALUES (42, 3, '20170112/nar_170112151425989.jpg', null, '02', '2017-01-12 17:53:11');
INSERT INTO jsuweb.cfg_goods_pic(id, goods_id, pic_url, remark, order_seq, updateTime) VALUES (43, 3, '20170112/nar_17011215142679.jpg', null, '03', '2017-01-12 17:53:11');
INSERT INTO jsuweb.cfg_goods_pic(id, goods_id, pic_url, remark, order_seq, updateTime) VALUES (44, 3, '20170112/nar_170112151426143.jpg', null, '04', '2017-01-12 17:53:11');
INSERT INTO jsuweb.cfg_goods_pic(id, goods_id, pic_url, remark, order_seq, updateTime) VALUES (45, 1, '', null, '01', '2017-01-13 16:58:04');
INSERT INTO jsuweb.cfg_goods_pic(id, goods_id, pic_url, remark, order_seq, updateTime) VALUES (46, 1, '', null, '02', '2017-01-13 16:58:04');
INSERT INTO jsuweb.cfg_goods_pic(id, goods_id, pic_url, remark, order_seq, updateTime) VALUES (47, 1, '', null, '03', '2017-01-13 16:58:04');
INSERT INTO jsuweb.cfg_goods_pic(id, goods_id, pic_url, remark, order_seq, updateTime) VALUES (48, 1, '', null, '04', '2017-01-13 16:58:04');
INSERT INTO jsuweb.cfg_goods_pic(id, goods_id, pic_url, remark, order_seq, updateTime) VALUES (49, 4, '', null, '01', '2017-01-13 16:58:39');
INSERT INTO jsuweb.cfg_goods_pic(id, goods_id, pic_url, remark, order_seq, updateTime) VALUES (50, 4, '', null, '02', '2017-01-13 16:58:39');
INSERT INTO jsuweb.cfg_goods_pic(id, goods_id, pic_url, remark, order_seq, updateTime) VALUES (51, 4, '', null, '03', '2017-01-13 16:58:39');
INSERT INTO jsuweb.cfg_goods_pic(id, goods_id, pic_url, remark, order_seq, updateTime) VALUES (52, 4, '', null, '04', '2017-01-13 16:58:39');
INSERT INTO jsuweb.cfg_goods_type(id, name, remark) VALUES (1, '西点', null);
INSERT INTO jsuweb.cfg_goods_type(id, name, remark) VALUES (2, '面包', null);
INSERT INTO jsuweb.cfg_goods_type(id, name, remark) VALUES (3, '巧克力', '1321312321');
INSERT INTO jsuweb.cfg_goods_type(id, name, remark) VALUES (4, '商品类型测试1', '苛枯硅苛枯硅123213');
INSERT INTO jsuweb.leave_message(id, name, phone, email, message, create_time) VALUES (1, '苏测留言', '123123123123', '', '但所发生的方式地方苛枯硅 枯萎', '2017-04-10 15:35:42');
INSERT INTO jsuweb.sys_menu_info(menu_id, menu_name, menu_order, link_url, disp_image, status, remark) VALUES ('000', '首页', '000', '/backStage/home', 'icon-dashboard', '1', null);
INSERT INTO jsuweb.sys_menu_info(menu_id, menu_name, menu_order, link_url, disp_image, status, remark) VALUES ('100', '系统管理', '100', '', 'icon-gears (alias)', '1', null);
INSERT INTO jsuweb.sys_menu_info(menu_id, menu_name, menu_order, link_url, disp_image, status, remark) VALUES ('100100', '用户管理', '100100', '/backStage/sys/user/list', null, '1', null);
INSERT INTO jsuweb.sys_menu_info(menu_id, menu_name, menu_order, link_url, disp_image, status, remark) VALUES ('200', '产品管理', '200', '', 'icon-screenshot', '1', null);
INSERT INTO jsuweb.sys_menu_info(menu_id, menu_name, menu_order, link_url, disp_image, status, remark) VALUES ('200100', '产品类型', '200100', '/backStage/goods/type/list', null, '1', null);
INSERT INTO jsuweb.sys_menu_info(menu_id, menu_name, menu_order, link_url, disp_image, status, remark) VALUES ('200200', '商品管理', '200200', '/backStage/goods/list', null, '1', null);
INSERT INTO jsuweb.sys_menu_info(menu_id, menu_name, menu_order, link_url, disp_image, status, remark) VALUES ('200300', '商品回收站', '200300', '/backStage/goods/recycle/list', null, '1', null);
INSERT INTO jsuweb.sys_menu_info(menu_id, menu_name, menu_order, link_url, disp_image, status, remark) VALUES ('700', '留言信息', '700', '/backStage/conatct/listLeaveMessage', ' icon-list-alt', '1', null);
INSERT INTO jsuweb.sys_user_info(user_id, login_name, name, password, salt, phone, email, status, create_time, update_time, login_time) VALUES (1, 'system', '系统管理员', '46mQqhbPwrQemicSNP4VNm3w==', '46aNz2yXqTceulVt', '13311111111', 'sujian@qq.com', '1', null, null, '2017-04-10 17:44:42');
INSERT INTO jsuweb.sys_user_info(user_id, login_name, name, password, salt, phone, email, status, create_time, update_time, login_time) VALUES (2, 'sujian', '苏测试', '46mQqhbPwrQemicSNP4VNm3w==', '46aNz2yXqTceulVt', '13311112111', 'sujian@qq.com', '1', null, null, '2017-04-01 18:07:46');
INSERT INTO jsuweb.sys_user_info(user_id, login_name, name, password, salt, phone, email, status, create_time, update_time, login_time) VALUES (4, 'sujian1', '苏测试', '46mQqhbPwrQemicSNP4VNm3w==', '46aNz2yXqTceulVt', '13311112111', 'sujian@qq.com', '1', null, null, '2017-04-01 18:07:46');
INSERT INTO jsuweb.sys_user_info(user_id, login_name, name, password, salt, phone, email, status, create_time, update_time, login_time) VALUES (5, 'sujian2', '苏测试', '46mQqhbPwrQemicSNP4VNm3w==', '46aNz2yXqTceulVt', '13311112111', 'sujian@qq.com', '1', null, null, '2017-04-01 18:07:46');
INSERT INTO jsuweb.sys_user_info(user_id, login_name, name, password, salt, phone, email, status, create_time, update_time, login_time) VALUES (6, 'sujian3', '苏测试', '46mQqhbPwrQemicSNP4VNm3w==', '46aNz2yXqTceulVt', '13311112111', 'sujian@qq.com', '1', null, null, '2017-04-01 18:07:46');
INSERT INTO jsuweb.sys_user_info(user_id, login_name, name, password, salt, phone, email, status, create_time, update_time, login_time) VALUES (7, 'sujian4', '苏测试', '46mQqhbPwrQemicSNP4VNm3w==', '46aNz2yXqTceulVt', '13311112111', 'sujian@qq.com', '1', null, null, '2017-04-01 18:07:46');
INSERT INTO jsuweb.sys_user_info(user_id, login_name, name, password, salt, phone, email, status, create_time, update_time, login_time) VALUES (8, 'sujian5', '苏测试', '46mQqhbPwrQemicSNP4VNm3w==', '46aNz2yXqTceulVt', '13311112111', 'sujian@qq.com', '1', null, null, '2017-04-01 18:07:46');
INSERT INTO jsuweb.sys_user_info(user_id, login_name, name, password, salt, phone, email, status, create_time, update_time, login_time) VALUES (9, 'sujian6', '苏测试', '46mQqhbPwrQemicSNP4VNm3w==', '46aNz2yXqTceulVt', '13311112111', 'sujian@qq.com', '1', null, null, '2017-04-01 18:07:46');
INSERT INTO jsuweb.sys_user_info(user_id, login_name, name, password, salt, phone, email, status, create_time, update_time, login_time) VALUES (10, 'sujian7', '苏测试', '46mQqhbPwrQemicSNP4VNm3w==', '46aNz2yXqTceulVt', '13311112111', 'sujian@qq.com', '1', null, null, '2017-04-01 18:07:46');
INSERT INTO jsuweb.sys_user_info(user_id, login_name, name, password, salt, phone, email, status, create_time, update_time, login_time) VALUES (11, 'sujian8', '苏测试', '46mQqhbPwrQemicSNP4VNm3w==', '46aNz2yXqTceulVt', '13311112111', 'sujian@qq.com', '1', null, null, '2017-04-01 18:07:46');
INSERT INTO jsuweb.sys_user_info(user_id, login_name, name, password, salt, phone, email, status, create_time, update_time, login_time) VALUES (12, 'sujian9', '苏测试', '46mQqhbPwrQemicSNP4VNm3w==', '46aNz2yXqTceulVt', '13311112111', 'sujian@qq.com', '1', null, null, '2017-04-01 18:07:46');
INSERT INTO jsuweb.sys_user_info(user_id, login_name, name, password, salt, phone, email, status, create_time, update_time, login_time) VALUES (13, 'sujian10', '苏测试', '46mQqhbPwrQemicSNP4VNm3w==', '46aNz2yXqTceulVt', '13311112111', 'sujian@qq.com', '1', null, null, '2017-04-01 18:07:46');
INSERT INTO jsuweb.sys_user_info(user_id, login_name, name, password, salt, phone, email, status, create_time, update_time, login_time) VALUES (14, 'sujian11', '苏测试', '46mQqhbPwrQemicSNP4VNm3w==', '46aNz2yXqTceulVt', '13311112111', 'sujian@qq.com', '1', null, null, '2017-04-01 18:07:46');
INSERT INTO jsuweb.sys_user_info(user_id, login_name, name, password, salt, phone, email, status, create_time, update_time, login_time) VALUES (15, 'sujian12', '苏测试', '46mQqhbPwrQemicSNP4VNm3w==', '46aNz2yXqTceulVt', '13311112111', 'sujian@qq.com', '1', null, null, '2017-04-01 18:07:46');
INSERT INTO jsuweb.sys_user_info(user_id, login_name, name, password, salt, phone, email, status, create_time, update_time, login_time) VALUES (20, 'test', '模压苛枯硅 棋', 'uMaXS4ojaJTqL5K0RTvX3bBA==', 'uMd4N5hEChTzcdLlhiLNzvzgL4', '', '', '1', '2017-04-06 16:09:04', '2017-04-06 16:09:04', null);
INSERT INTO jsuweb.sys_user_info(user_id, login_name, name, password, salt, phone, email, status, create_time, update_time, login_time) VALUES (21, 'asd', 'asdfsf', 'd8Nrj1zG00wJfwAnDaihnPNg==', 'd8IM8OsDEMhE5GIx5jLJAu586u', '', '', '1', '2017-04-06 16:42:11', '2017-04-06 16:42:11', null);
INSERT INTO jsuweb.sys_user_info(user_id, login_name, name, password, salt, phone, email, status, create_time, update_time, login_time) VALUES (22, 'adaaaa', 'aaaaaa', 'vQlEU+ElimDHi2+2L+xUg0aA==', 'vQNWxPMqTISUh2kIXO6ClsUyVx', '', '', '1', '2017-04-06 16:43:51', '2017-04-06 16:43:51', null);
INSERT INTO jsuweb.sys_user_info(user_id, login_name, name, password, salt, phone, email, status, create_time, update_time, login_time) VALUES (23, 'asdf', 'sdf', 'DE0T8X3GIx9VmxnLGMynDSqQ==', 'DELAA33kb0t5ffOOTTw9ELNYVm', '', '', '1', '2017-04-06 18:38:26', '2017-04-06 18:38:26', null);
INSERT INTO jsuweb.sys_user_info(user_id, login_name, name, password, salt, phone, email, status, create_time, update_time, login_time) VALUES (24, 'qwer123', '123', 'QH5zbrONSU518iKAZLRnqreQ==', 'QHOOX5leq2iy82bTjZ8BX22LJY', '', '', '1', '2017-04-06 18:41:58', '2017-04-06 18:41:58', null);
INSERT INTO jsuweb.sys_user_menu(user_id, menu_id, create_user, create_time) VALUES (1, '000', null, null);
INSERT INTO jsuweb.sys_user_menu(user_id, menu_id, create_user, create_time) VALUES (1, '100', null, null);
INSERT INTO jsuweb.sys_user_menu(user_id, menu_id, create_user, create_time) VALUES (1, '100100', null, null);
INSERT INTO jsuweb.sys_user_menu(user_id, menu_id, create_user, create_time) VALUES (1, '100200', null, null);
INSERT INTO jsuweb.sys_user_menu(user_id, menu_id, create_user, create_time) VALUES (1, '200', null, null);
INSERT INTO jsuweb.sys_user_menu(user_id, menu_id, create_user, create_time) VALUES (1, '200100', null, null);
INSERT INTO jsuweb.sys_user_menu(user_id, menu_id, create_user, create_time) VALUES (1, '200200', null, null);
INSERT INTO jsuweb.sys_user_menu(user_id, menu_id, create_user, create_time) VALUES (1, '200300', null, null);
INSERT INTO jsuweb.sys_user_menu(user_id, menu_id, create_user, create_time) VALUES (1, '700', null, null);
