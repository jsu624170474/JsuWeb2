-- ----------------------------
--  商品类型
-- ----------------------------
DROP TABLE IF EXISTS `cfg_goods_type`;
CREATE TABLE `cfg_goods_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '商品类型编号',
  `name` varchar(32) NOT NULL COMMENT '商品类型名称',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='商品类型表';

-- ----------------------------
--  商品表
-- ----------------------------
DROP TABLE IF EXISTS `cfg_goods`;
CREATE TABLE `cfg_goods` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '商品编号',
  `name` varchar(200) COMMENT '商品名称',
  `goods_type_id` int(10) COMMENT '所属商品类型',
  `flag` char(2) NOT NULL COMMENT '上下架标志',
  `period_amt` double(16,2) COMMENT '单价',
  `stock` int(10) COMMENT '库存',
  `is_Recommend` char(1) COMMENT '是否推荐',
  `sales_amt` double(16,2) COMMENT '促销单价',
  `sales_date_begin` varchar(20) COMMENT '促销起始日期',
  `sales_date_end` varchar(20) COMMENT '促销结束日期',
  `sales_limit_num` varchar(20) COMMENT '促销限购数量',
  `pic_url` varchar(100) COMMENT '商品图片路径',
  `remark` varchar(500) COMMENT '商品描述',
  `order_seq` varchar(10) COMMENT '商品排序',
  `update_Time` varchar(20) COMMENT '更新时间',
  `update_User` varchar(32) COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
--  商品关联图片表
-- ----------------------------
DROP TABLE IF EXISTS `cfg_goods_pic`;
CREATE TABLE `cfg_goods_pic` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `goods_id` int(10) COMMENT '商品编号',
  `pic_url` varchar(200) COMMENT '图片路径',
  `remark` varchar(500) COMMENT '图片描述',
  `order_seq` varchar(10) COMMENT '显示顺序',
  updateTime varchar(20) COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='商品关联图片表';
