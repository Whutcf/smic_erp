/*
 Navicat Premium Data Transfer

 Source Server         : windows-mysql
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : smic_erp

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 07/03/2020 10:26:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for smic_account
-- ----------------------------
DROP TABLE IF EXISTS `smic_account`;
CREATE TABLE `smic_account`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `serial_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `initial_amount` decimal(24, 6) NULL DEFAULT NULL COMMENT '期初金额',
  `current_amount` decimal(24, 6) NULL DEFAULT NULL COMMENT '当前余额',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_default` bit(1) NULL DEFAULT NULL COMMENT '是否默认',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `delete_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smic_account
-- ----------------------------
INSERT INTO `smic_account` VALUES (4, '南通建行', '652346523465234623', 1200.000000, 215.000000, '建行账户', b'0', NULL, '0');
INSERT INTO `smic_account` VALUES (9, '流动总账', '65234624523452364', 2000.000000, 393.000000, '现在账户', b'1', NULL, '0');
INSERT INTO `smic_account` VALUES (10, '支付宝', '123456789@qq.com', 10000.000000, NULL, '', b'0', NULL, '0');
INSERT INTO `smic_account` VALUES (11, '微信', '13000000000', 10000.000000, NULL, '', b'0', NULL, '0');
INSERT INTO `smic_account` VALUES (12, '上海农行', '65324345234523211', 10000.000000, 0.000000, '', b'0', NULL, '0');
INSERT INTO `smic_account` VALUES (13, '账户1', 'abcd123', 0.000000, NULL, '', b'1', 1, '0');
INSERT INTO `smic_account` VALUES (14, '账户1', 'zhanghu1', 0.000000, NULL, '', b'1', 117, '0');
INSERT INTO `smic_account` VALUES (15, '账户2222', 'zh2222', 0.000000, NULL, '', b'0', 117, '0');
INSERT INTO `smic_account` VALUES (16, '账户1', '1231241244', 0.000000, NULL, '', b'1', 115, '0');
INSERT INTO `smic_account` VALUES (17, '账户1', 'zzz111', 0.000000, NULL, '', b'1', 63, '0');
INSERT INTO `smic_account` VALUES (18, '账户2', '1234131324', 0.000000, NULL, '', b'0', 63, '0');

-- ----------------------------
-- Table structure for smic_account_head
-- ----------------------------
DROP TABLE IF EXISTS `smic_account_head`;
CREATE TABLE `smic_account_head`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型(支出/收入/收款/付款/转账)',
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT '单位Id(收款/付款单位)',
  `hands_person_id` bigint(20) NULL DEFAULT NULL COMMENT '经手人Id',
  `change_amount` decimal(24, 6) NULL DEFAULT NULL COMMENT '变动金额(优惠/收款/付款/实付)',
  `total_price` decimal(24, 6) NULL DEFAULT NULL COMMENT '合计金额',
  `account_id` bigint(20) NULL DEFAULT NULL COMMENT '账户(收款/付款)',
  `bill_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单据编号',
  `bill_time` datetime(0) NULL DEFAULT NULL COMMENT '单据日期',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `delete_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK9F4C0D8DB610FC06`(`org_id`) USING BTREE,
  INDEX `FK9F4C0D8DAAE50527`(`account_id`) USING BTREE,
  INDEX `FK9F4C0D8DC4170B37`(`hands_person_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '财务主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smic_account_head
-- ----------------------------
INSERT INTO `smic_account_head` VALUES (57, '收预付款', 8, 3, NULL, 1000.000000, NULL, '2342134', '2017-06-27 00:00:00', '', NULL, '0');
INSERT INTO `smic_account_head` VALUES (61, '收预付款', 9, 3, NULL, 33.000000, NULL, 'SYF2017062901721', '2017-06-29 00:00:00', 'aaaaaa', NULL, '0');
INSERT INTO `smic_account_head` VALUES (67, '收预付款', 10, 4, NULL, 2100.000000, NULL, 'SYF2017070222414', '2017-07-02 00:00:00', '', NULL, '0');
INSERT INTO `smic_account_head` VALUES (70, '支出', 4, 3, -60.000000, -60.000000, 4, 'ZC20170703233735', '2017-07-03 00:00:00', '', NULL, '0');
INSERT INTO `smic_account_head` VALUES (74, '转账', NULL, 3, -100.000000, -100.000000, 4, 'ZZ2017070323489', '2017-07-03 00:00:00', '', NULL, '0');
INSERT INTO `smic_account_head` VALUES (77, '收入', 2, 3, 40.000000, 40.000000, 4, 'SR20170704222634', '2017-07-04 00:00:00', '', NULL, '0');
INSERT INTO `smic_account_head` VALUES (78, '收预付款', 9, 3, NULL, 200.000000, NULL, 'SYF201707050257', '2017-07-05 00:00:00', '', NULL, '0');
INSERT INTO `smic_account_head` VALUES (79, '收预付款', 9, 3, NULL, 100.000000, NULL, 'SYF20170705076', '2017-07-05 00:00:00', '', NULL, '0');
INSERT INTO `smic_account_head` VALUES (82, '收款', 2, 3, 0.000000, 2.600000, NULL, 'SK20171008191440', '2017-10-09 00:08:11', '', NULL, '0');
INSERT INTO `smic_account_head` VALUES (83, '付款', 1, 4, 0.000000, -20.000000, NULL, 'FK20171008232825', '2017-10-08 00:00:00', '', NULL, '0');
INSERT INTO `smic_account_head` VALUES (84, '收入', 2, 4, 0.000000, 21.000000, 10, 'SR20171009000300', '2017-10-09 00:03:00', '', NULL, '0');
INSERT INTO `smic_account_head` VALUES (85, '收入', 2, 3, 22.000000, 22.000000, 11, 'SR20171009000637', '2017-10-09 00:06:37', '备注123 备注123 备注123', NULL, '0');
INSERT INTO `smic_account_head` VALUES (86, '转账', NULL, 4, -22.000000, -22.000000, 10, 'ZZ20171009000719', '2017-10-09 00:07:19', '', NULL, '0');
INSERT INTO `smic_account_head` VALUES (87, '付款', 4, 4, 10.000000, -33.000000, NULL, 'FK20171009000747', '2017-10-09 00:07:47', '', NULL, '0');
INSERT INTO `smic_account_head` VALUES (88, '收款', 2, 4, 0.000000, 2.800000, NULL, 'SK20171024220754', '2017-10-24 22:07:54', '', NULL, '0');
INSERT INTO `smic_account_head` VALUES (89, '收款', 2, 4, 0.000000, 11.000000, NULL, 'SK20171030232535', '2017-10-30 23:25:35', '', NULL, '0');
INSERT INTO `smic_account_head` VALUES (90, '收款', 2, 4, 0.000000, 10.000000, NULL, 'SK20171119231440', '2017-11-19 23:14:40', '', NULL, '0');
INSERT INTO `smic_account_head` VALUES (91, '收入', 48, 9, 66.000000, 6.000000, 13, 'SR20190319221438', '2019-03-19 22:14:38', '', 1, '0');
INSERT INTO `smic_account_head` VALUES (92, '支出', 50, 9, -33.000000, -33.000000, 13, 'ZC20190319221454', '2019-03-19 22:14:54', '', 1, '0');
INSERT INTO `smic_account_head` VALUES (93, '收款', 48, 9, NULL, 44.000000, NULL, 'SK20190319221513', '2019-03-19 22:15:13', '', 1, '0');
INSERT INTO `smic_account_head` VALUES (94, '付款', 50, 9, NULL, -66.000000, NULL, 'FK20190319221525', '2019-03-19 22:15:25', '', 1, '0');
INSERT INTO `smic_account_head` VALUES (95, '收预付款', 49, 9, NULL, 6.000000, NULL, 'SYF20190319221556', '2019-03-19 22:15:56', '', 1, '0');
INSERT INTO `smic_account_head` VALUES (96, '收入', 5, 4, 22.000000, 22.000000, 12, 'SR20190321235925', '2019-03-21 23:59:25', '', NULL, '0');

-- ----------------------------
-- Table structure for smic_account_item
-- ----------------------------
DROP TABLE IF EXISTS `smic_account_item`;
CREATE TABLE `smic_account_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `header_id` bigint(20) NOT NULL COMMENT '表头Id',
  `account_id` bigint(20) NULL DEFAULT NULL COMMENT '账户Id',
  `in_out_item_id` bigint(20) NULL DEFAULT NULL COMMENT '收支项目Id',
  `each_amount` decimal(24, 6) NULL DEFAULT NULL COMMENT '单项金额',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单据备注',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `delete_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK9F4CBAC0AAE50527`(`account_id`) USING BTREE,
  INDEX `FK9F4CBAC0C5FE6007`(`header_id`) USING BTREE,
  INDEX `FK9F4CBAC0D203EDC5`(`in_out_item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 98 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '财务子表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smic_account_item
-- ----------------------------
INSERT INTO `smic_account_item` VALUES (58, 57, 9, NULL, 1000.000000, '', NULL, '0');
INSERT INTO `smic_account_item` VALUES (62, 61, 4, NULL, 33.000000, '', NULL, '0');
INSERT INTO `smic_account_item` VALUES (68, 67, 4, NULL, 2100.000000, '', NULL, '0');
INSERT INTO `smic_account_item` VALUES (71, 70, NULL, 11, 60.000000, '', NULL, '0');
INSERT INTO `smic_account_item` VALUES (75, 74, 9, NULL, 100.000000, '', NULL, '0');
INSERT INTO `smic_account_item` VALUES (78, 77, NULL, 14, 40.000000, '', NULL, '0');
INSERT INTO `smic_account_item` VALUES (79, 78, 9, NULL, 200.000000, '', NULL, '0');
INSERT INTO `smic_account_item` VALUES (80, 79, 9, NULL, 100.000000, '', NULL, '0');
INSERT INTO `smic_account_item` VALUES (83, 82, 10, NULL, 2.600000, '', NULL, '0');
INSERT INTO `smic_account_item` VALUES (84, 83, 10, NULL, -20.000000, '', NULL, '0');
INSERT INTO `smic_account_item` VALUES (85, 84, NULL, 13, 21.000000, '', NULL, '0');
INSERT INTO `smic_account_item` VALUES (86, 85, NULL, 12, 22.000000, '44', NULL, '0');
INSERT INTO `smic_account_item` VALUES (87, 86, 11, NULL, 22.000000, '', NULL, '0');
INSERT INTO `smic_account_item` VALUES (88, 87, 10, NULL, -33.000000, '', NULL, '0');
INSERT INTO `smic_account_item` VALUES (89, 88, 10, NULL, 2.800000, '', NULL, '0');
INSERT INTO `smic_account_item` VALUES (90, 89, 11, NULL, 11.000000, '', NULL, '0');
INSERT INTO `smic_account_item` VALUES (91, 90, 12, NULL, 10.000000, '', NULL, '0');
INSERT INTO `smic_account_item` VALUES (92, 91, NULL, 16, 66.000000, '', 1, '0');
INSERT INTO `smic_account_item` VALUES (93, 92, NULL, 17, 33.000000, '', 1, '0');
INSERT INTO `smic_account_item` VALUES (94, 93, 13, NULL, 44.000000, '', 1, '0');
INSERT INTO `smic_account_item` VALUES (95, 94, 13, NULL, -66.000000, '', 1, '0');
INSERT INTO `smic_account_item` VALUES (96, 95, 13, NULL, 6.000000, '', 1, '0');
INSERT INTO `smic_account_item` VALUES (97, 96, NULL, 14, 22.000000, '', NULL, '0');

-- ----------------------------
-- Table structure for smic_depot
-- ----------------------------
DROP TABLE IF EXISTS `smic_depot`;
CREATE TABLE `smic_depot`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仓库名称',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仓库地址',
  `warehousing` decimal(24, 6) NULL DEFAULT NULL COMMENT '仓储费',
  `truckage` decimal(24, 6) NULL DEFAULT NULL COMMENT '搬运费',
  `type` int(10) NULL DEFAULT NULL COMMENT '类型',
  `sort` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `principal` bigint(20) NULL DEFAULT NULL COMMENT '负责人',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `delete_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  `is_default` bit(1) NULL DEFAULT NULL COMMENT '是否默认',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '仓库表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smic_depot
-- ----------------------------
INSERT INTO `smic_depot` VALUES (1, '叠石桥店', '地址222', 33.000000, 22.000000, 0, '2', '上海33', 95, NULL, '0', NULL);
INSERT INTO `smic_depot` VALUES (2, '公司总部', '地址12355', 44.000000, 22.220000, 0, '1', '总部', 64, NULL, '0', NULL);
INSERT INTO `smic_depot` VALUES (3, '金沙店', '地址666', 31.000000, 4.000000, 0, '3', '苏州', 64, NULL, '0', NULL);
INSERT INTO `smic_depot` VALUES (4, '1268200294', '', NULL, NULL, 1, '1', '', NULL, NULL, '0', NULL);
INSERT INTO `smic_depot` VALUES (5, '1268787965', NULL, NULL, NULL, 1, '3', '', NULL, NULL, '0', NULL);
INSERT INTO `smic_depot` VALUES (6, '1269520625', NULL, NULL, NULL, 1, '2', '', NULL, NULL, '0', NULL);
INSERT INTO `smic_depot` VALUES (7, '仓库1', '', NULL, NULL, 0, '', '', NULL, 1, '0', NULL);
INSERT INTO `smic_depot` VALUES (8, '仓库1111', '', NULL, NULL, 0, '', '', 117, 117, '0', NULL);
INSERT INTO `smic_depot` VALUES (9, '仓库567', '', NULL, NULL, 0, '', '', 117, 117, '0', NULL);
INSERT INTO `smic_depot` VALUES (10, '仓库321342', '', NULL, NULL, 0, '', '', NULL, 117, '0', NULL);
INSERT INTO `smic_depot` VALUES (11, '仓库321321', '', NULL, NULL, 0, '', '', NULL, 117, '0', NULL);
INSERT INTO `smic_depot` VALUES (12, '仓库111222', '', NULL, NULL, 0, '', '', NULL, 117, '0', NULL);
INSERT INTO `smic_depot` VALUES (13, '仓库1', '', NULL, NULL, 0, '', '', NULL, 115, '0', NULL);
INSERT INTO `smic_depot` VALUES (14, '仓库1', '', NULL, NULL, 0, '', '', NULL, 63, '0', b'1');
INSERT INTO `smic_depot` VALUES (15, '仓库2', '', NULL, NULL, 0, '', '', NULL, 63, '0', b'0');

-- ----------------------------
-- Table structure for smic_depot_head
-- ----------------------------
DROP TABLE IF EXISTS `smic_depot_head`;
CREATE TABLE `smic_depot_head`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型(出库/入库)',
  `sub_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出入库分类',
  `project_id` bigint(20) NULL DEFAULT NULL COMMENT '项目Id',
  `default_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '初始票据号',
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '票据号',
  `oper_person_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作员名字',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '出入库时间',
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT '供应商Id',
  `hands_person_id` bigint(20) NULL DEFAULT NULL COMMENT '采购/领料-经手人Id',
  `account_id` bigint(20) NULL DEFAULT NULL COMMENT '账户Id',
  `change_amount` decimal(24, 6) NULL DEFAULT NULL COMMENT '变动金额(收款/付款)',
  `allocation_project_id` bigint(20) NULL DEFAULT NULL COMMENT '调拨时，对方项目Id',
  `total_price` decimal(24, 6) NULL DEFAULT NULL COMMENT '合计金额',
  `pay_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付款类型(现金、记账等)',
  `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `sales_man` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务员（可以多个）',
  `account_id_list` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '多账户ID列表',
  `account_money_list` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '多账户金额列表',
  `discount` decimal(24, 6) NULL DEFAULT NULL COMMENT '优惠率',
  `discount_money` decimal(24, 6) NULL DEFAULT NULL COMMENT '优惠金额',
  `discount_last_money` decimal(24, 6) NULL DEFAULT NULL COMMENT '优惠后金额',
  `other_money` decimal(24, 6) NULL DEFAULT NULL COMMENT '销售或采购费用合计',
  `other_money_list` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售或采购费用涉及项目Id数组（包括快递、招待等）',
  `other_money_item` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售或采购费用涉及项目（包括快递、招待等）',
  `account_day` int(10) NULL DEFAULT NULL COMMENT '结算天数',
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态，0未审核、1已审核、2已转采购|销售',
  `link_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联订单号',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `delete_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK2A80F214CA633ABA`(`allocation_project_id`) USING BTREE,
  INDEX `FK2A80F214C4170B37`(`hands_person_id`) USING BTREE,
  INDEX `FK2A80F214B610FC06`(`org_id`) USING BTREE,
  INDEX `FK2A80F2142888F9A`(`project_id`) USING BTREE,
  INDEX `FK2A80F214AAE50527`(`account_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 199 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '单据主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smic_depot_head
-- ----------------------------
INSERT INTO `smic_depot_head` VALUES (7, '入库', '采购', NULL, 'GHDD201708120002', 'GHDD201708120002', '季圣华', '2017-08-12 12:04:07', '2017-08-12 12:03:23', 1, NULL, 12, -30.000000, NULL, -36.000000, '现付', 'abcdefg', '', NULL, NULL, 10.000000, 3.600000, 32.400000, 30.000000, '[\"10\",\"9\"]', '[\"10\",\"20\"]', 45, '1', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (8, '出库', '销售', NULL, 'XHDD201708120001', 'XHDD201708120001', '季圣华', '2017-08-12 18:10:14', '2017-08-12 18:09:45', 2, NULL, 11, 17.000000, NULL, 24.000000, '现付', '', '<7>,<6>', NULL, NULL, 22.000000, 5.280000, 18.720000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (9, '入库', '采购', NULL, 'GHDD201708120003', 'GHDD201708120003', '季圣华', '2017-08-12 21:01:09', '2017-08-12 21:00:36', 1, NULL, 11, -100.000000, NULL, -120.000000, '现付', '', '', NULL, NULL, 10.000000, 12.000000, 108.000000, NULL, NULL, NULL, NULL, '1', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (10, '入库', '采购', NULL, 'GHDD201708120004', 'GHDD201708120004', '季圣华', '2017-08-12 21:10:42', '2017-08-12 21:10:16', 1, NULL, 4, -10.000000, NULL, -12.000000, '现付', '', '', NULL, NULL, 10.000000, 1.200000, 10.800000, NULL, NULL, NULL, NULL, '1', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (11, '入库', '采购', NULL, 'GHDD201708120005', 'smicenghua001', '季圣华', '2017-08-12 22:07:44', '2017-08-12 22:06:37', 1, NULL, 12, -20.000000, NULL, -24.000000, '现付', '', '', NULL, NULL, 10.000000, 2.400000, 21.600000, NULL, NULL, NULL, NULL, '1', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (12, '入库', '采购', NULL, 'GHDD201708120006', 'GHDD201708120006', '季圣华', '2017-08-12 22:17:11', '2017-08-12 22:16:35', 1, NULL, 11, -10.000000, NULL, -12.000000, '现付', '', '', NULL, NULL, 10.000000, 1.200000, 10.800000, 0.000000, '[\"undefined\"]', '[\"undefined\"]', NULL, '1', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (13, '入库', '采购', NULL, 'GHDD201708120007', 'jishenghua3', '季圣华', '2017-08-12 22:17:52', '2017-08-12 22:17:14', 1, NULL, 4, -20.000000, NULL, -24.000000, '现付', '', '', NULL, NULL, 10.000000, 2.400000, 21.600000, NULL, NULL, NULL, NULL, '1', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (14, '入库', '采购', NULL, 'GHDD201708120008', 'jishenghua004', '季圣华', '2017-08-12 22:19:37', '2017-08-12 22:19:07', 1, NULL, 11, -30.000000, NULL, -36.000000, '现付', '', '', NULL, NULL, 10.000000, 3.600000, 32.400000, 0.000000, '[\"undefined\"]', '[\"undefined\"]', NULL, '1', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (16, '入库', '采购', NULL, 'GHDD201708120009', 'jishenghua005', '季圣华', '2017-08-12 22:26:23', '2017-08-12 22:25:14', 1, NULL, 10, -20.000000, NULL, -24.000000, '现付', '', '', NULL, NULL, 10.000000, 2.400000, 21.600000, 0.000000, '[\"undefined\"]', '[\"undefined\"]', NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (17, '入库', '采购', NULL, 'GHDD201708120010', 'GHDD201708120010', '季圣华', '2017-08-12 22:28:20', '2017-08-12 22:28:02', 1, NULL, 9, -30.000000, NULL, -36.000000, '现付', '', '', NULL, NULL, 10.000000, 3.600000, 32.400000, NULL, '[\"undefined\"]', '[\"undefined\"]', NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (18, '入库', '采购', NULL, 'GHDD201708120011', 'GHDD201708120011', '季圣华', '2017-08-12 22:30:08', '2017-08-12 22:29:48', 1, NULL, 4, -20.000000, NULL, -24.000000, '现付', '', '', NULL, NULL, 10.000000, 2.400000, 21.600000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (19, '入库', '采购', NULL, 'GHDD201708120012', 'GHDD201708120012', '季圣华', '2017-08-12 22:30:57', '2017-08-12 22:29:32', 1, NULL, NULL, -10.000000, NULL, -26.400000, '现付', '', '', '[\"4\"]', '[\"-10\"]', 10.000000, 2.640000, 23.760000, 0.000000, '[\"undefined\"]', '[\"undefined\"]', NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (20, '入库', '采购', NULL, 'GHDD201708120013', 'GHDD201708120013', '季圣华', '2017-08-12 22:46:43', '2017-08-12 22:45:55', 1, NULL, 10, -23.000000, NULL, -36.000000, '现付', '', '', NULL, NULL, 20.000000, 7.200000, 28.800000, NULL, NULL, NULL, NULL, '1', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (21, '入库', '采购', NULL, 'GHDD201708120014', 'GHDD201708120014', '季圣华', '2017-08-12 22:46:52', '2017-08-12 22:45:59', 1, NULL, 11, -20.000000, NULL, -26.400000, '现付', '', '', NULL, NULL, 10.000000, 2.640000, 23.760000, 0.000000, '[\"undefined\"]', '[\"undefined\"]', NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (22, '入库', '采购', NULL, 'GHDD201708120015', 'GHDD201708120015', '季圣华', '2017-08-12 23:49:32', '2017-08-12 23:48:24', 1, NULL, 11, -20.000000, NULL, -24.000000, '现付', '', '', NULL, NULL, 10.000000, 2.400000, 21.600000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (23, '入库', '采购', NULL, 'GHDD201708140001', 'GHDD201708140001', '季圣华', '2017-08-14 20:41:54', '2017-08-14 20:40:49', 1, NULL, 4, -300.000000, NULL, -360.000000, '现付', '', '', NULL, NULL, 10.000000, 36.000000, 324.000000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (24, '入库', '采购', NULL, 'GHDD201708150001', 'GHDD201708150001', '季圣华', '2017-08-15 21:36:25', '2017-08-15 21:35:38', 1, NULL, 11, -675.000000, NULL, -750.000000, '现付', '', '', NULL, NULL, 10.000000, 75.000000, 675.000000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (25, '入库', '采购', NULL, 'GHDD201708150002', 'GHDD201708150002', '季圣华', '2017-08-15 22:31:46', '2017-08-15 22:29:47', 1, NULL, NULL, -33.000000, NULL, -75.000000, '现付', 'ababab', '', '[\"9\",\"10\"]', '[\"-22\",\"-11\"]', 10.000000, 7.500000, 67.500000, 22.000000, '[\"10\",\"8\"]', '[\"11\",\"11\"]', NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (26, '入库', '采购', NULL, 'GHDD201708160001', 'GHDD201708160001', '季圣华', '2017-08-16 23:50:35', '2017-08-16 23:47:42', 4, NULL, 9, -162.000000, NULL, -150.000000, '现付', '', '', NULL, NULL, 10.000000, 18.000000, 162.000000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (27, '入库', '采购', NULL, 'GHDD201708180001', 'GHDD201708180001', '季圣华', '2017-08-18 00:25:58', '2017-08-18 00:25:43', 1, NULL, 11, -74.250000, NULL, -75.000000, '现付', '', '', NULL, NULL, 10.000000, 8.250000, 74.250000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (28, '入库', '采购', NULL, 'GHDD201708270001', 'GHDD201708270001', '季圣华', '2017-08-27 23:10:44', '2017-08-27 23:06:05', 46, NULL, 10, -64.800000, NULL, -72.000000, '现付', '', '', NULL, NULL, 10.000000, 7.200000, 64.800000, 10.000000, '[\"10\"]', '[\"10\"]', NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (29, '出库', '销售', NULL, 'XSCK201708280001', 'XSCK201708280001', '季圣华', '2017-08-28 23:06:40', '2017-08-28 23:05:11', 2, NULL, 11, 120.850000, NULL, 130.000000, '现付', '', '<7>', NULL, NULL, 10.000000, 13.650000, 122.850000, 0.000000, '[\"undefined\"]', '[\"undefined\"]', NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (30, '入库', '销售退货', NULL, 'XSTH201708280001', 'XSTH201708280001', '季圣华', '2017-08-28 23:13:08', '2017-08-28 23:12:48', 2, NULL, 10, -48.000000, NULL, -48.000000, '现付', '', '<5>,<6>', NULL, NULL, 0.000000, 0.000000, 48.000000, 0.000000, '[\"undefined\"]', '[\"undefined\"]', NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (31, '出库', '采购退货', NULL, 'CGTH201708280001', 'CGTH201708280001', '季圣华', '2017-08-28 23:15:45', '2017-08-28 23:15:21', 1, NULL, 10, 28.600000, NULL, 26.000000, '现付', '', '', NULL, NULL, 0.000000, 0.000000, 28.600000, 12.000000, '[\"10\"]', '[\"12\"]', NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (32, '入库', '其它', NULL, 'QTRK201708280001', 'QTRK201708280001', '季圣华', '2017-08-28 23:17:55', '2017-08-28 23:17:33', 1, NULL, NULL, NULL, NULL, 12.000000, '现付', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (33, '出库', '其它', NULL, 'QTCK201708280001', 'QTCK201708280001', '季圣华', '2017-08-28 23:21:14', '2017-08-28 23:20:36', 2, NULL, NULL, NULL, NULL, 65.000000, '现付', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (37, '出库', '调拨', NULL, 'DBCK201708280002', 'DBCK201708280002', '季圣华', '2017-08-28 23:56:34', '2017-08-28 23:56:10', NULL, NULL, NULL, NULL, NULL, 1.300000, '现付', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (38, '出库', '调拨', NULL, 'DBCK201708290001', 'DBCK201708290001', '季圣华', '2017-08-29 00:20:11', '2017-08-29 00:19:58', NULL, NULL, NULL, NULL, NULL, 2.600000, '现付', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (41, '出库', '零售', NULL, 'LSCK201708290002', 'LSCK201708290002', '季圣华', '2017-08-29 23:29:39', '2017-08-29 23:29:06', 7, NULL, 10, 42.000000, NULL, 42.000000, '现付', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (42, '出库', '零售', NULL, 'LSCK201708290003', 'LSCK201708290003', '季圣华', '2017-08-29 23:35:12', '2017-08-29 23:33:21', 7, NULL, 11, 11.000000, NULL, 11.000000, '现付', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (43, '出库', '零售', NULL, 'LSCK201708290004', 'LSCK201708290004', '季圣华', '2017-08-29 23:39:44', '2017-08-29 23:39:28', 7, NULL, 9, 12.100000, NULL, 12.100000, '现付', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (44, '入库', '零售退货', NULL, 'LSTH201708290001', 'LSTH201708290001', '季圣华', '2017-08-29 23:48:43', '2017-08-29 23:46:35', 7, NULL, 10, -2.200000, NULL, -2.200000, '现付', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (45, '入库', '零售退货', NULL, 'LSTH201708290002', 'LSTH201708290002', '季圣华', '2017-08-29 23:51:55', '2017-08-29 23:51:31', 7, NULL, 12, -3.300000, NULL, -3.300000, '现付', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (48, '出库', '零售', NULL, 'LSCK201708310001', 'LSCK201708310001', '季圣华', '2017-08-31 00:30:31', '2017-08-31 00:29:10', 7, NULL, NULL, 12.000000, NULL, 12.000000, '现付', '', '', '[\"10\",\"11\"]', '[\"15\",\"20\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (49, '出库', '零售', NULL, 'LSCK201708310002', 'LSCK201708310002', '季圣华', '2017-08-31 00:57:40', '2017-08-31 00:57:08', 7, NULL, NULL, 12.000000, NULL, 12.000000, '现付', '', '', '[\"9\",\"11\"]', '[\"22\",\"11\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (50, '出库', '零售', NULL, 'LSCK201709030001', 'LSCK201709030001', '季圣华', '2017-09-03 12:51:50', '2017-09-03 12:51:21', 10, NULL, 10, 22.000000, NULL, 22.000000, '现付', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (52, '出库', '零售', NULL, 'LSCK201709040001', 'LSCK201709040001', '季圣华', '2017-09-04 21:32:49', '2017-09-04 21:31:24', 7, NULL, 11, 24.200000, NULL, 24.200000, '现付', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (53, '出库', '零售', NULL, 'LSCK201709040002', 'LSCK201709040002', '季圣华', '2017-09-04 21:34:02', '2017-09-04 21:33:30', 7, NULL, 9, 36.300000, NULL, 36.300000, '现付', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (54, '入库', '采购', NULL, 'CGRK201709040001', 'CGRK201709040001', '季圣华', '2017-09-04 22:20:12', '2017-09-04 22:13:00', 1, NULL, 10, -10.800000, NULL, -12.000000, '现付', '', '', NULL, NULL, 10.000000, 1.200000, 10.800000, 12.000000, '[\"9\"]', '[\"12\"]', NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (57, '入库', '采购', NULL, 'CGRK201709050001', 'CGRK201709050001', '季圣华', '2017-09-05 22:37:54', '2017-09-05 22:37:31', 1, NULL, 11, -182.520000, NULL, -182.400000, '现付', '', '', NULL, NULL, 0.000000, 0.000000, 182.520000, 0.000000, '[\"undefined\"]', '[\"undefined\"]', NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (63, '入库', '采购', NULL, 'CGRK201709170001', 'CGRK201709170001', '季圣华', '2017-09-17 21:45:14', '2017-09-17 21:44:50', 1, NULL, 10, -13.200000, NULL, -12.000000, '现付', '', '', NULL, NULL, 0.000000, 0.000000, 13.200000, NULL, NULL, NULL, NULL, '1', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (65, '入库', '采购', NULL, 'CGRK201709170002', 'CGRK201709170002', '季圣华', '2017-09-17 21:47:07', '2017-09-17 20:45:55', 1, NULL, NULL, -42.000000, NULL, -39.000000, '现付', '', '', '[\"12\",\"9\"]', '[\"-20\",\"-22\"]', 0.000000, 0.000000, 42.900000, 0.000000, '[\"undefined\"]', '[\"undefined\"]', NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (68, '其它', '组装单', NULL, 'ZZD2017092000001', 'ZZD2017092000001', '季圣华', '2017-09-20 23:29:28', '2017-09-20 23:29:13', NULL, NULL, NULL, NULL, NULL, 7.000000, '现付', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (69, '其它', '拆卸单', NULL, 'CXD2017092000001', 'CXD2017092000001', '季圣华', '2017-09-20 23:40:55', '2017-09-20 23:40:41', NULL, NULL, NULL, NULL, NULL, 0.000000, '现付', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (70, '入库', '采购', NULL, 'CGRK201709210001', 'CGRK201709210001', '季圣华', '2017-09-21 22:37:20', '2017-09-21 22:36:37', 1, NULL, NULL, -50.000000, NULL, -50.000000, '现付', '', '', '[\"4\",\"9\"]', '[\"-10\",\"-40\"]', 0.000000, 0.000000, 50.000000, 0.000000, '[\"undefined\"]', '[\"undefined\"]', NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (71, '入库', '销售退货', NULL, 'XSTH201709210001', 'XSTH201709210001', '季圣华', '2017-09-21 22:39:00', '2017-09-21 22:38:37', 2, NULL, 11, -48.000000, NULL, -48.000000, '现付', '', '<6>,<7>', NULL, NULL, 0.000000, 0.000000, 48.000000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (72, '入库', '其它', NULL, 'QTRK201709210001', 'QTRK201709210001', '季圣华', '2017-09-21 22:39:26', '2017-09-21 22:39:14', 4, NULL, NULL, NULL, NULL, 24.000000, '现付', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (73, '出库', '销售', NULL, 'XSCK201709210001', 'XSCK201709210001', '季圣华', '2017-09-21 22:40:01', '2017-09-21 22:39:44', 2, NULL, 11, 10.000000, NULL, 10.000000, '现付', '', '<6>', NULL, NULL, 0.000000, 0.000000, 10.000000, 0.000000, '[\"undefined\"]', '[\"undefined\"]', NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (74, '出库', '采购退货', NULL, 'CGTH201709210001', 'CGTH201709210001', '季圣华', '2017-09-21 22:40:57', '2017-09-21 22:40:38', 4, NULL, 4, 5.000000, NULL, 5.000000, '现付', '', '', NULL, NULL, 0.000000, 0.000000, 5.000000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (75, '出库', '其它', NULL, 'QTCK201709210001', 'QTCK201709210001', '季圣华', '2017-09-21 22:41:15', '2017-09-21 22:41:02', 2, NULL, NULL, NULL, NULL, 13.000000, '现付', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (76, '出库', '调拨', NULL, 'DBCK201709210001', 'DBCK201709210001', '季圣华', '2017-09-21 22:41:36', '2017-09-21 22:41:19', NULL, NULL, NULL, NULL, NULL, 10.000000, '现付', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (77, '出库', '零售', NULL, 'LSCK201709210001', 'LSCK201709210001', '季圣华', '2017-09-21 22:42:44', '2017-09-21 22:42:21', 7, NULL, 4, 2.200000, NULL, 2.200000, '现付', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (78, '入库', '零售退货', NULL, 'LSTH201709210001', 'LSTH201709210001', '季圣华', '2017-09-21 22:46:07', '2017-09-21 22:45:49', 7, NULL, 4, -2.200000, NULL, -2.200000, '现付', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (79, '入库', '采购', NULL, 'CGRK201709210002', 'CGRK201709210002', '季圣华', '2017-09-21 23:16:37', '2017-09-21 23:16:21', 1, NULL, 11, -23.760000, NULL, -21.600000, '现付', '', '', NULL, NULL, 0.000000, 0.000000, 23.760000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (80, '其它', '组装单', NULL, 'ZZD2017092100001', 'ZZD2017092100001', '季圣华', '2017-09-21 23:17:16', '2017-09-21 23:16:59', NULL, NULL, NULL, NULL, NULL, 5.000000, '现付', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (82, '入库', '采购', NULL, 'CGRK201709220001', 'CGRK201709220001', '季圣华', '2017-09-22 23:06:01', '2017-09-22 23:05:39', 1, NULL, NULL, -50.000000, NULL, -52.000000, '现付', '', '', '[\"11\",\"9\"]', '[\"-20\",\"-30\"]', 10.000000, 5.720000, 51.480000, 5.000000, '[\"11\",\"10\"]', '[\"2\",\"3\"]', NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (84, '入库', '采购', NULL, 'CGRK201709220002', 'CGRK201709220002', '季圣华', '2017-09-22 23:22:02', '2017-09-22 23:21:48', 1, NULL, 10, -26.400000, NULL, -24.000000, '现付', '', '', NULL, NULL, 0.000000, 0.000000, 26.400000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (85, '入库', '采购', NULL, 'CGRK201709240001', 'CGRK201709240001', '季圣华', '2017-09-24 22:46:00', '2017-09-24 22:44:35', 4, NULL, NULL, -85.000000, NULL, -75.000000, '现付', '', '', '[\"10\",\"9\"]', '[\"-20\",\"-65\"]', 0.000000, 0.000000, 87.750000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (87, '出库', '销售', NULL, 'XSCK201709250001', 'XSCK201709250001', '季圣华', '2017-09-25 22:24:08', '2017-09-25 22:23:47', 2, NULL, 10, 4.000000, NULL, 4.000000, '现付', '', '<6>', NULL, NULL, 0.000000, 0.000000, 4.000000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (88, '出库', '销售', NULL, 'XSCK201709250002', 'XSCK201709250002', '季圣华', '2017-09-25 22:36:51', '2017-09-25 22:35:09', 2, NULL, 10, 39.600000, NULL, 40.000000, '现付', '', '<7>', NULL, NULL, 10.000000, 4.400000, 39.600000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (89, '入库', '零售退货', NULL, 'LSTH201709260001', 'LSTH201709260001', '季圣华', '2017-09-26 00:26:52', '2017-09-26 00:26:19', 7, NULL, 9, -18.000000, NULL, -18.000000, '现付', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (90, '出库', '零售', NULL, 'LSCK201709260001', 'LSCK201709260001', '季圣华', '2017-09-26 22:31:24', '2017-09-26 22:29:50', 7, NULL, NULL, 100.000000, NULL, 100.000000, '现付', '', '', '[\"10\",\"11\"]', '[\"60\",\"40\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (93, '出库', '销售', NULL, 'XSCK201710080001', 'XSCK201710080001', '季圣华', '2017-10-08 19:12:23', '2017-10-08 19:11:44', 2, NULL, 10, 0.000000, NULL, 2.600000, '现付', '', '<7>', NULL, NULL, 0.000000, 0.000000, 2.600000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (94, '出库', '销售', NULL, 'XSCK201710080002', 'XSCK201710080002', '季圣华', '2017-10-08 19:58:55', '2017-10-08 19:58:27', 5, NULL, 9, 0.000000, NULL, 8.000000, '现付', '', '<6>', NULL, NULL, 0.000000, 0.000000, 8.000000, 0.000000, '[\"undefined\"]', '[\"undefined\"]', NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (95, '入库', '采购', NULL, 'CGRK201710180001', 'CGRK201710180001', '季圣华', '2017-10-18 23:21:24', '2017-10-18 23:21:12', 1, NULL, 11, -2.860000, NULL, -2.600000, '现付', '', '', NULL, NULL, 0.000000, 0.000000, 2.860000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (96, '出库', '销售', NULL, 'XSCK201710240001', 'XSCK201710240001', '季圣华', '2017-10-24 22:04:06', '2017-10-24 22:03:08', 2, NULL, 9, 0.000000, NULL, 2.800000, '现付', '', '<7>', NULL, NULL, 10.000000, 0.280000, 2.520000, 0.000000, '[\"undefined\"]', '[\"undefined\"]', NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (97, '入库', '采购', NULL, 'CGRK201710290001', 'CGRK201710290001', '季圣华', '2017-10-29 23:30:47', '2017-10-29 23:30:08', 4, NULL, 10, 0.000000, NULL, -200.000000, '现付', '', '', NULL, NULL, 0.000000, 0.000000, 234.000000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (98, '入库', '采购', NULL, 'CGRK201710290002', 'CGRK201710290002', '季圣华', '2017-10-29 23:32:07', '2017-10-29 23:30:52', 4, NULL, 10, 0.000000, NULL, -300.000000, '现付', '', '', NULL, NULL, 0.000000, 0.000000, 351.000000, NULL, NULL, NULL, NULL, '1', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (99, '入库', '采购', NULL, 'CGRK201710290003', 'CGRK201710290003', '季圣华', '2017-10-29 23:33:45', '2017-10-29 23:32:11', 4, NULL, 11, -10.000000, NULL, -720.000000, '现付', '', '', NULL, NULL, 0.000000, 0.000000, 842.400000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (101, '出库', '调拨', NULL, 'DBCK201711020001', 'DBCK201711020001', '季圣华', '2017-11-02 22:51:17', '2017-11-02 22:48:58', NULL, NULL, NULL, 0.000000, NULL, 50.000000, '现付', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (102, '出库', '零售', NULL, 'LSCK201711060001', 'LSCK201711060001', '季圣华', '2017-11-06 20:38:46', '2017-11-06 20:38:01', 7, NULL, NULL, 12.000000, NULL, 12.000000, '现付', '', '', '[\"9\",\"12\"]', '[\"10\",\"2\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (103, '入库', '采购', NULL, 'CGRK201711070001', 'CGRK201711070001', '季圣华', '2017-11-07 21:07:05', '2017-11-07 21:06:53', 1, NULL, 10, -26.400000, NULL, -24.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 26.400000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (104, '入库', '采购', NULL, 'CGRK201711070002', 'CGRK201711070002', '季圣华', '2017-11-07 21:07:40', '2017-11-07 21:07:08', 4, NULL, NULL, -11.000000, NULL, -10.000000, '现付', '', '', '[\"9\",\"11\"]', '[\"-10\",\"-1\"]', 0.000000, 0.000000, 11.700000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (105, '出库', '销售', NULL, 'XSCK201711070001', 'XSCK201711070001', '季圣华', '2017-11-07 21:08:48', '2017-11-07 21:08:34', 2, NULL, 10, 13.000000, NULL, 13.000000, '现付', '', '<6>', NULL, '', 0.000000, 0.000000, 13.000000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (106, '出库', '销售', NULL, 'XSCK201711070002', 'XSCK201711070002', '季圣华', '2017-11-07 21:09:20', '2017-11-07 21:08:51', 2, NULL, NULL, 13.000000, NULL, 13.000000, '现付', '', '<5>', '[\"9\",\"10\"]', '[\"5\",\"8\"]', 0.000000, 0.000000, 13.000000, 54.000000, '[\"11\",\"10\"]', '[\"21\",\"33\"]', NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (107, '入库', '采购', NULL, 'CGRK201712030001', 'CGRK201712030001', '季圣华', '2017-12-03 22:38:36', '2017-12-03 22:37:26', 4, NULL, 9, -1.000000, NULL, -1.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 1.000000, 0.000000, '[\"undefined\"]', '[\"undefined\"]', NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (108, '入库', '采购', NULL, 'CGRK201712030002', 'sdfasdfa', '季圣华', '2017-12-03 22:40:57', '2017-12-03 22:40:38', 4, NULL, 4, -42.120000, NULL, -36.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 42.120000, NULL, '[\"undefined\"]', '[\"undefined\"]', NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (109, '入库', '采购', NULL, 'CGRK201712030003', 'CGRK201712030003', '季圣华', '2017-12-03 22:41:38', '2017-12-03 22:41:01', 4, NULL, 11, -1.400000, NULL, -1.200000, '现付', '', '', NULL, '', 0.000000, 0.000000, 1.400000, NULL, '[\"undefined\"]', '[\"undefined\"]', NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (110, '入库', '采购', NULL, 'CGRK201712050001', 'CGRK201712050001', '季圣华', '2017-12-05 23:05:48', '2017-12-05 23:05:34', 1, NULL, 10, -11.000000, NULL, -10.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 11.000000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (111, '入库', '采购', NULL, 'CGRK201712050002', 'CGRK201712050002', '季圣华', '2017-12-05 23:12:53', '2017-12-05 23:12:40', 1, NULL, 10, 0.000000, NULL, -20.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 22.000000, 0.000000, '[\"undefined\"]', '[\"undefined\"]', NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (112, '出库', '销售', NULL, 'XSCK201712100001', 'XSCK201712100001', '季圣华', '2017-12-10 21:07:45', '2017-12-10 21:07:25', 2, NULL, 11, 2.600000, NULL, 2.600000, '现付', '', '<>', NULL, '', 0.000000, 0.000000, 2.600000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (114, '其它', '采购订单', NULL, 'CGDD00000000001', 'CGDD00000000001', '季圣华', '2019-03-09 15:49:57', '2019-03-09 15:49:50', 4, NULL, NULL, 0.000000, NULL, -2.400000, '现付', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (115, '入库', '采购', NULL, 'CGRK00000000002', 'CGRK00000000002', '季圣华', '2019-03-09 15:52:05', '2019-03-09 15:51:45', 4, NULL, 9, -257.400000, NULL, -220.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 257.400000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (116, '入库', '采购', NULL, 'CGRK00000000003', 'CGRK00000000003', '季圣华', '2019-03-09 15:52:21', '2019-03-09 15:52:09', 4, NULL, 9, -1029.600000, NULL, -880.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 1029.600000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (117, '出库', '销售', NULL, 'XSCK00000000004', 'XSCK00000000004', '季圣华', '2019-03-09 15:53:07', '2019-03-09 15:52:28', 5, NULL, 9, 110.000000, NULL, 110.000000, '现付', '', '<7>', NULL, '', 0.000000, 0.000000, 110.000000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (118, '出库', '销售', NULL, 'XSCK00000000005', 'XSCK00000000005', '季圣华', '2019-03-09 15:57:26', '2019-03-09 15:53:10', 2, NULL, 9, 11.000000, NULL, 11.000000, '现付', '', '<7>', NULL, '', 0.000000, 0.000000, 11.000000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (119, '入库', '采购', NULL, 'CGRK00000000009', 'CGRK00000000009', '季圣华', '2019-03-09 16:02:30', '2019-03-09 16:01:22', 1, NULL, 9, -88.000000, NULL, -80.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 88.000000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (120, '其它', '销售订单', NULL, 'XSDD00000000012', 'XSDD00000000012', '季圣华', '2019-03-09 16:27:38', '2019-03-09 22:12:14', 5, NULL, NULL, 0.000000, NULL, 3.900000, '现付', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (121, '入库', '采购', NULL, 'CGRK00000000013', 'CGRK00000000013', '季圣华', '2019-03-09 16:35:53', '2019-03-09 16:35:32', 4, NULL, 9, -42.120000, NULL, -36.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 42.120000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (122, '入库', '采购', NULL, 'CGRK00000000015', 'CGRK00000000015', '季圣华', '2019-03-09 16:37:34', '2019-03-09 16:37:01', 4, NULL, 9, 0.000000, NULL, -100.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 117.000000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (123, '出库', '销售', NULL, 'XSCK00000000016', 'XSCK00000000016', '季圣华', '2019-03-09 16:38:03', '2019-03-09 16:37:40', 5, NULL, 9, 0.000000, NULL, 26.000000, '现付', '', '<7>', NULL, '', 0.000000, 0.000000, 26.000000, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (124, '入库', '其它', NULL, 'QTRK00000000074', 'QTRK00000000074', '季圣华', '2019-03-09 22:35:21', '2019-03-09 22:34:56', 4, NULL, NULL, 0.000000, NULL, 800.000000, '现付', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0');
INSERT INTO `smic_depot_head` VALUES (137, '入库', '采购', NULL, 'CGRK00000000125', 'CGRK00000000125', '季圣华', '2019-03-10 16:46:13', '2019-03-10 16:44:32', 4, NULL, 9, -2.400000, NULL, -2.400000, '现付', '', '', NULL, '', 0.000000, 0.000000, 2.400000, 0.000000, '[\"undefined\"]', '[\"undefined\"]', NULL, '0', 'CGDD00000000001', NULL, '0');
INSERT INTO `smic_depot_head` VALUES (139, '其它', '采购订单', NULL, 'CGDD00000000127', 'CGDD00000000127', '季圣华', '2019-03-10 17:00:24', '2019-03-10 18:52:21', 4, NULL, NULL, 0.000000, NULL, -50.000000, '现付', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '', NULL, '0');
INSERT INTO `smic_depot_head` VALUES (141, '出库', '销售', NULL, 'XSCK00000000134', 'XSCK00000000134', '季圣华', '2019-03-10 17:40:13', '2019-03-10 17:39:41', 5, NULL, 9, 3.900000, NULL, 3.900000, '现付', '', '', NULL, '', 0.000000, 0.000000, 3.900000, 0.000000, '[\"undefined\"]', '[\"undefined\"]', NULL, '0', 'XSDD00000000012', NULL, '0');
INSERT INTO `smic_depot_head` VALUES (142, '其它', '销售订单', NULL, 'XSDD00000000135', 'XSDD00000000135', '季圣华', '2019-03-10 17:42:11', '2019-03-10 17:44:07', 2, NULL, NULL, 0.000000, NULL, 7.000000, '现付', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '', NULL, '0');
INSERT INTO `smic_depot_head` VALUES (144, '出库', '销售', NULL, 'XSCK00000000137', 'XSCK00000000137', '季圣华', '2019-03-10 17:44:49', '2019-03-10 17:44:14', 2, NULL, 9, 7.000000, NULL, 7.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 7.000000, 0.000000, '[\"undefined\"]', '[\"undefined\"]', NULL, '0', 'XSDD00000000135', NULL, '0');
INSERT INTO `smic_depot_head` VALUES (147, '其它', '采购订单', NULL, 'CGDD00000000140', 'CGDD00000000140', '季圣华', '2019-03-10 17:49:51', '2019-03-10 17:49:38', 4, NULL, NULL, 0.000000, NULL, -240.000000, '现付', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '', NULL, '0');
INSERT INTO `smic_depot_head` VALUES (148, '入库', '采购', NULL, 'CGRK00000000141', 'CGRK00000000141', '季圣华', '2019-03-10 17:50:19', '2019-03-10 17:50:06', 4, NULL, 9, -240.000000, NULL, -240.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 240.000000, 0.000000, '[\"undefined\"]', '[\"undefined\"]', NULL, '0', 'CGDD00000000140', NULL, '0');
INSERT INTO `smic_depot_head` VALUES (155, '入库', '采购', NULL, 'CGRK00000000173', 'CGRK00000000173', '季圣华', '2019-03-10 19:21:56', '2019-03-10 19:20:30', 4, NULL, 4, -54.080000, NULL, -46.220000, '现付', '', '', NULL, '', 0.000000, 0.000000, 54.080000, 0.000000, '[\"undefined\"]', '[\"undefined\"]', NULL, '0', 'CGDD00000000127', NULL, '0');
INSERT INTO `smic_depot_head` VALUES (158, '出库', '销售', NULL, 'XSCK00000000177', 'XSCK00000000177', '季圣华', '2019-03-10 20:02:32', '2019-03-10 20:02:21', 5, NULL, 9, 10.000000, NULL, 10.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 10.000000, NULL, NULL, NULL, NULL, '0', '', NULL, '0');
INSERT INTO `smic_depot_head` VALUES (159, '入库', '采购', NULL, 'CGRK00000000178', 'CGRK00000000178', '季圣华', '2019-03-15 23:05:40', '2019-03-15 23:05:28', 46, NULL, 9, -19.500000, NULL, -19.500000, '现付', '', '', NULL, '', 0.000000, 0.000000, 19.500000, NULL, NULL, NULL, NULL, '0', '', NULL, '0');
INSERT INTO `smic_depot_head` VALUES (160, '入库', '采购', NULL, 'CGRK00000000179', 'CGRK00000000179', '季圣华', '2019-03-15 23:06:22', '2019-03-15 23:06:03', 46, NULL, 9, -1111.000000, NULL, -1111.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 1111.000000, NULL, NULL, NULL, NULL, '0', '', NULL, '0');
INSERT INTO `smic_depot_head` VALUES (161, '出库', '销售', NULL, 'XSCK00000000180', 'XSCK00000000180', '季圣华', '2019-03-15 23:06:52', '2019-03-15 23:06:38', 2, NULL, 9, 111.000000, NULL, 111.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 111.000000, NULL, NULL, NULL, NULL, '0', '', NULL, '0');
INSERT INTO `smic_depot_head` VALUES (162, '入库', '其它', NULL, 'QTRK00000000181', 'QTRK00000000181', '季圣华', '2019-03-15 23:08:18', '2019-03-15 23:08:11', 4, NULL, NULL, 0.000000, NULL, 144.300000, '现付', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '', NULL, '0');
INSERT INTO `smic_depot_head` VALUES (163, '出库', '调拨', NULL, 'DBCK00000000182', 'DBCK00000000182', '季圣华', '2019-03-15 23:08:32', '2019-03-15 23:08:22', NULL, NULL, NULL, 0.000000, NULL, 111.000000, '现付', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '', NULL, '0');
INSERT INTO `smic_depot_head` VALUES (164, '出库', '零售', NULL, 'LSCK00000000184', 'LSCK00000000184', '季圣华', '2019-03-15 23:15:30', '2019-03-15 23:15:22', 8, NULL, 9, 1.200000, NULL, 1.200000, '预付款', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '', NULL, '0');
INSERT INTO `smic_depot_head` VALUES (165, '入库', '采购', NULL, 'CGRK00000000190', 'CGRK00000000190', 'lili', '2019-03-19 22:10:17', '2019-03-19 22:09:49', 47, NULL, 13, -220.000000, NULL, -220.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 220.000000, NULL, NULL, NULL, NULL, '0', '', 1, '0');
INSERT INTO `smic_depot_head` VALUES (166, '其它', '采购订单', NULL, 'CGDD00000000191', 'CGDD00000000191', 'lili', '2019-03-19 22:10:35', '2019-03-19 22:10:22', 50, NULL, NULL, 0.000000, NULL, -2442.000000, '现付', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '', 1, '0');
INSERT INTO `smic_depot_head` VALUES (167, '出库', '采购退货', NULL, 'CGTH00000000193', 'CGTH00000000193', 'lili', '2019-03-19 22:11:39', '2019-03-19 22:11:12', 47, NULL, 13, 110.000000, NULL, 110.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 110.000000, NULL, NULL, NULL, NULL, '0', '', 1, '0');
INSERT INTO `smic_depot_head` VALUES (168, '其它', '销售订单', NULL, 'XSDD00000000194', 'XSDD00000000194', 'lili', '2019-03-19 22:12:04', '2019-03-19 22:11:55', 48, NULL, NULL, 0.000000, NULL, 22.000000, '现付', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '', 1, '0');
INSERT INTO `smic_depot_head` VALUES (169, '出库', '销售', NULL, 'XSCK00000000195', 'XSCK00000000195', 'lili', '2019-03-19 22:12:18', '2019-03-19 22:12:09', 48, NULL, 13, 22.000000, NULL, 22.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 22.000000, NULL, NULL, NULL, NULL, '0', '', 1, '0');
INSERT INTO `smic_depot_head` VALUES (170, '入库', '销售退货', NULL, 'XSTH00000000196', 'XSTH00000000196', 'lili', '2019-03-19 22:12:29', '2019-03-19 22:12:21', 48, NULL, 13, -22.000000, NULL, -22.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 22.000000, NULL, NULL, NULL, NULL, '0', '', 1, '0');
INSERT INTO `smic_depot_head` VALUES (171, '出库', '零售', NULL, 'LSCK00000000197', 'LSCK00000000197', 'lili', '2019-03-19 22:12:43', '2019-03-19 22:12:35', 49, NULL, 13, 22.000000, NULL, 22.000000, '现付', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '', 1, '0');
INSERT INTO `smic_depot_head` VALUES (172, '入库', '零售退货', NULL, 'LSTH00000000198', 'LSTH00000000198', 'lili', '2019-03-19 22:12:53', '2019-03-19 22:12:46', 49, NULL, 13, -22.000000, NULL, -22.000000, '现付', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '', 1, '0');
INSERT INTO `smic_depot_head` VALUES (173, '入库', '其它', NULL, 'QTRK00000000199', 'QTRK00000000199', 'lili', '2019-03-19 22:13:20', '2019-03-19 22:13:09', 50, NULL, NULL, 0.000000, NULL, 2200.000000, '现付', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '', 1, '0');
INSERT INTO `smic_depot_head` VALUES (174, '出库', '其它', NULL, 'QTCK00000000200', 'QTCK00000000200', 'lili', '2019-03-19 22:13:34', '2019-03-19 22:13:23', 48, NULL, NULL, 0.000000, NULL, 176.000000, '现付', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '', 1, '0');
INSERT INTO `smic_depot_head` VALUES (175, '其它', '采购订单', NULL, 'CGDD00000000203', 'CGDD00000000203', '季圣华', '2019-03-19 22:48:07', '2019-03-19 22:47:55', 46, NULL, NULL, 0.000000, NULL, -10.000000, '现付', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '', NULL, '0');
INSERT INTO `smic_depot_head` VALUES (176, '入库', '采购', NULL, 'CGRK00000000204', 'CGRK00000000204', '季圣华', '2019-03-19 22:48:22', '2019-03-19 22:48:10', 4, NULL, 13, -28.080000, NULL, -24.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 28.080000, NULL, NULL, NULL, NULL, '0', '', NULL, '0');
INSERT INTO `smic_depot_head` VALUES (177, '出库', '销售', NULL, 'XSCK00000000205', 'XSCK00000000205', '季圣华', '2019-03-19 22:48:40', '2019-03-19 22:48:26', 5, NULL, 13, 10.000000, NULL, 10.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 10.000000, NULL, NULL, NULL, NULL, '0', '', NULL, '0');
INSERT INTO `smic_depot_head` VALUES (178, '入库', '采购', NULL, 'CGRK00000000213', 'CGRK00000000213', '季圣华', '2019-03-21 23:58:56', '2019-03-21 23:58:44', 4, NULL, 13, -14.400000, NULL, -14.400000, '现付', '', '', NULL, '', 0.000000, 0.000000, 14.400000, NULL, NULL, NULL, NULL, '0', '', NULL, '1');
INSERT INTO `smic_depot_head` VALUES (179, '出库', '销售', NULL, 'XSCK00000000214', 'XSCK00000000214', '季圣华', '2019-03-21 23:59:18', '2019-03-21 23:59:05', 5, NULL, 10, 317.200000, NULL, 317.200000, '现付', '', '', NULL, '', 0.000000, 0.000000, 317.200000, NULL, NULL, NULL, NULL, '0', '', NULL, '1');
INSERT INTO `smic_depot_head` VALUES (180, '入库', '采购', NULL, 'CGRK00000000242', 'CGRK00000000242', 'laoba123', '2019-04-02 22:30:01', '2019-04-02 22:29:52', 55, NULL, 16, -1221.000000, NULL, -1221.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 1221.000000, NULL, NULL, NULL, NULL, '0', '', 115, '0');
INSERT INTO `smic_depot_head` VALUES (181, '入库', '采购', NULL, 'CGRK00000000243', 'CGRK00000000243', 'laoba123', '2019-04-02 22:30:20', '2019-04-02 22:30:03', 55, NULL, 16, -1342.000000, NULL, -1342.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 1342.000000, NULL, NULL, NULL, NULL, '0', '', 115, '0');
INSERT INTO `smic_depot_head` VALUES (182, '入库', '采购', NULL, 'CGRK00000000245', 'CGRK00000000245', '季圣华', '2019-04-02 22:32:00', '2019-04-02 22:31:48', 46, NULL, 16, -14.400000, NULL, -14.400000, '现付', '', '', NULL, '', 0.000000, 0.000000, 14.400000, NULL, NULL, NULL, NULL, '0', '', NULL, '1');
INSERT INTO `smic_depot_head` VALUES (183, '入库', '采购', NULL, 'CGRK00000000247', 'CGRK00000000247', '季圣华', '2019-04-04 23:06:58', '2019-04-04 23:06:41', 46, NULL, 16, -159.600000, NULL, -159.600000, '现付', '', '', NULL, '', 0.000000, 0.000000, 159.600000, NULL, NULL, NULL, NULL, '0', '', NULL, '1');
INSERT INTO `smic_depot_head` VALUES (184, '入库', '采购', NULL, 'CGRK00000000248', 'CGRK00000000248', '季圣华', '2019-04-07 20:23:23', '2019-04-07 20:22:40', 4, NULL, 4, -35.100000, NULL, -30.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 35.100000, NULL, NULL, NULL, NULL, '0', '', NULL, '1');
INSERT INTO `smic_depot_head` VALUES (185, '入库', '采购', NULL, 'CGRK00000000249', 'CGRK00000000249', '季圣华', '2019-04-07 20:25:30', '2019-04-07 20:25:00', 4, NULL, 16, -35.100000, NULL, -30.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 35.100000, NULL, NULL, NULL, NULL, '0', '', NULL, '1');
INSERT INTO `smic_depot_head` VALUES (186, '入库', '采购', NULL, 'CGRK00000000250', 'CGRK00000000250', '季圣华', '2019-04-07 20:35:00', '2019-04-07 20:34:29', 4, NULL, 16, -11.700000, NULL, -10.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 11.700000, NULL, NULL, NULL, NULL, '0', '', NULL, '1');
INSERT INTO `smic_depot_head` VALUES (187, '入库', '采购', NULL, 'CGRK00000000252', 'CGRK00000000252', '季圣华', '2019-04-07 20:44:09', '2019-04-07 20:43:49', 4, NULL, 4, -421.200000, NULL, -360.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 421.200000, NULL, NULL, NULL, NULL, '0', '', NULL, '0');
INSERT INTO `smic_depot_head` VALUES (188, '其它', '组装单', NULL, 'ZZD00000000254', 'ZZD00000000254', '季圣华', '2019-04-07 20:51:51', '2019-04-07 22:39:59', NULL, NULL, NULL, 0.000000, NULL, 0.000000, '现付', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '', NULL, '0');
INSERT INTO `smic_depot_head` VALUES (189, '入库', '采购', NULL, 'CGRK00000000261', 'CGRK00000000261', '季圣华', '2019-04-10 22:25:49', '2019-04-10 22:26:00', 57, NULL, 17, -24.000000, NULL, -24.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 24.000000, 0.000000, '[\"undefined\"]', '[\"undefined\"]', NULL, '0', '', 63, '0');
INSERT INTO `smic_depot_head` VALUES (190, '入库', '采购', NULL, 'CGRK00000000263', 'CGRK00000000263', '季圣华', '2019-04-13 19:57:43', '2019-04-13 19:57:32', 57, NULL, 17, -24.000000, NULL, -24.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 24.000000, NULL, NULL, NULL, NULL, '0', '', 63, '1');
INSERT INTO `smic_depot_head` VALUES (191, '入库', '采购', NULL, 'CGRK00000000264', 'CGRK00000000264', '季圣华', '2019-04-13 19:57:58', '2019-04-13 19:57:48', 57, NULL, 17, -2.000000, NULL, -2.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 2.000000, NULL, NULL, NULL, NULL, '0', '', 63, '0');
INSERT INTO `smic_depot_head` VALUES (192, '入库', '采购', NULL, 'CGRK00000000265', 'CGRK00000000265', '季圣华', '2019-04-20 00:36:24', '2019-04-20 00:35:57', 57, NULL, 17, -44.000000, NULL, -44.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 44.000000, NULL, NULL, NULL, NULL, '0', '', 63, '0');
INSERT INTO `smic_depot_head` VALUES (193, '出库', '销售', NULL, 'XSCK00000000268', 'XSCK00000000268', '季圣华', '2019-04-29 23:41:02', '2019-04-29 23:40:49', 58, NULL, 17, 0.000000, NULL, 100.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 100.000000, NULL, NULL, NULL, NULL, '0', '', 63, '0');
INSERT INTO `smic_depot_head` VALUES (194, '入库', '采购', NULL, 'CGRK00000000272', 'CGRK00000000272', '季圣华', '2019-04-30 22:33:24', '2019-04-30 22:33:09', 57, NULL, 17, -500.000000, NULL, -500.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 500.000000, NULL, NULL, NULL, NULL, '0', '', 63, '0');
INSERT INTO `smic_depot_head` VALUES (195, '入库', '采购', NULL, 'CGRK00000000273', 'CGRK00000000273', '季圣华', '2019-04-30 22:34:45', '2019-04-30 22:34:32', 57, NULL, 17, -610.000000, NULL, -610.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 610.000000, NULL, NULL, NULL, NULL, '0', '', 63, '0');
INSERT INTO `smic_depot_head` VALUES (196, '入库', '采购', NULL, 'CGRK00000000274', 'CGRK00000000274', '季圣华', '2019-04-30 22:35:53', '2019-05-03 11:57:49', 57, NULL, 18, -670.000000, NULL, -670.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 670.000000, 0.000000, '[\"undefined\"]', '[\"undefined\"]', NULL, '0', '', 63, '0');
INSERT INTO `smic_depot_head` VALUES (197, '出库', '销售', NULL, 'XSCK00000000290', 'XSCK00000000290', '季圣华', '2019-04-30 23:15:27', '2019-04-30 23:15:09', 58, NULL, 17, 90.000000, NULL, 90.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 90.000000, NULL, NULL, NULL, NULL, '0', '', 63, '0');
INSERT INTO `smic_depot_head` VALUES (198, '入库', '采购', NULL, 'CGRK00000000292', 'CGRK00000000292', '季圣华', '2019-05-03 14:20:56', '2019-05-03 14:19:38', 57, NULL, 17, -1.120000, NULL, -1.000000, '现付', '', '', NULL, '', 0.000000, 0.000000, 1.120000, NULL, NULL, NULL, NULL, '0', '', 63, '0');

-- ----------------------------
-- Table structure for smic_depot_item
-- ----------------------------
DROP TABLE IF EXISTS `smic_depot_item`;
CREATE TABLE `smic_depot_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `header_id` bigint(20) NOT NULL COMMENT '表头Id',
  `material_id` bigint(20) NOT NULL COMMENT '材料Id',
  `m_unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品计量单位',
  `oper_number` decimal(24, 6) NULL DEFAULT NULL COMMENT '数量',
  `basic_number` decimal(24, 6) NULL DEFAULT NULL COMMENT '基础数量，如kg、瓶',
  `unit_price` decimal(24, 6) NULL DEFAULT NULL COMMENT '单价',
  `tax_unit_price` decimal(24, 6) NULL DEFAULT NULL COMMENT '含税单价',
  `all_price` decimal(24, 6) NULL DEFAULT NULL COMMENT '金额',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `img` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `incidentals` decimal(24, 6) NULL DEFAULT NULL COMMENT '运杂费',
  `depot_id` bigint(20) NULL DEFAULT NULL COMMENT '仓库ID（库存是统计出来的）',
  `another_depot_id` bigint(20) NULL DEFAULT NULL COMMENT '调拨时，对方仓库Id',
  `tax_rate` decimal(24, 6) NULL DEFAULT NULL COMMENT '税率',
  `tax_money` decimal(24, 6) NULL DEFAULT NULL COMMENT '税额',
  `tax_lastMoney` decimal(24, 6) NULL DEFAULT NULL COMMENT '价税合计',
  `other_field1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义字段1-品名',
  `other_field2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义字段2-型号',
  `other_field3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义字段3-制造商',
  `other_field4` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义字段4',
  `other_field5` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义字段5',
  `m_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品类型',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `delete_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK2A819F475D61CCF7`(`material_id`) USING BTREE,
  INDEX `FK2A819F474BB6190E`(`header_id`) USING BTREE,
  INDEX `FK2A819F479485B3F5`(`depot_id`) USING BTREE,
  INDEX `FK2A819F47729F5392`(`another_depot_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 216 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '单据子表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smic_depot_item
-- ----------------------------
INSERT INTO `smic_depot_item` VALUES (7, 7, 500, '码', 30.000000, 30.000000, 1.200000, 1.320000, 36.000000, 'remark', NULL, NULL, 3, NULL, 10.000000, 3.600000, 39.600000, 'a', 'b', 'c', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (8, 8, 500, '码', 20.000000, 20.000000, 1.200000, 1.200000, 24.000000, '', NULL, NULL, 3, NULL, NULL, 0.000000, 24.000000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (9, 9, 500, '码', 100.000000, 100.000000, 1.200000, 1.320000, 120.000000, '', NULL, NULL, 3, NULL, 10.000000, 12.000000, 132.000000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (10, 10, 500, '码', 10.000000, 10.000000, 1.200000, 1.320000, 12.000000, '', NULL, NULL, 3, NULL, 10.000000, 1.200000, 13.200000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (11, 11, 500, '码', 20.000000, 20.000000, 1.200000, 1.320000, 24.000000, '', NULL, NULL, 3, NULL, 10.000000, 2.400000, 26.400000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (12, 12, 500, '码', 10.000000, 10.000000, 1.200000, 1.320000, 12.000000, '', NULL, NULL, 3, NULL, 10.000000, 1.200000, 13.200000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (13, 13, 500, '码', 20.000000, 20.000000, 1.200000, 1.320000, 24.000000, '', NULL, NULL, 3, NULL, 10.000000, 2.400000, 26.400000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (14, 14, 500, '码', 30.000000, 30.000000, 1.200000, 1.320000, 36.000000, '', NULL, NULL, 3, NULL, 10.000000, 3.600000, 39.600000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (16, 16, 500, '码', 20.000000, 20.000000, 1.200000, 1.320000, 24.000000, '', NULL, NULL, 3, NULL, 10.000000, 2.400000, 26.400000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (17, 17, 500, '码', 30.000000, 30.000000, 1.200000, 1.320000, 36.000000, '', NULL, NULL, 3, NULL, 10.000000, 3.600000, 39.600000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (18, 18, 500, '码', 20.000000, 20.000000, 1.200000, 1.320000, 24.000000, '', NULL, NULL, 3, NULL, 10.000000, 2.400000, 26.400000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (19, 19, 500, '码', 22.000000, 22.000000, 1.200000, 1.320000, 26.400000, '', NULL, NULL, 3, NULL, 10.000000, 2.640000, 29.040000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (20, 20, 500, '码', 30.000000, 30.000000, 1.200000, 1.320000, 36.000000, '', NULL, NULL, 3, NULL, 10.000000, 3.600000, 39.600000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (21, 21, 500, '码', 22.000000, 22.000000, 1.200000, 1.320000, 26.400000, '', NULL, NULL, 3, NULL, 10.000000, 2.640000, 29.040000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (22, 22, 500, '码', 20.000000, 20.000000, 1.200000, 1.320000, 24.000000, '', NULL, NULL, 3, NULL, 10.000000, 2.400000, 26.400000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (23, 23, 517, '箱', 10.000000, 120.000000, 36.000000, 36.000000, 360.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 360.000000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (24, 24, 518, '包', 10.000000, 250.000000, 75.000000, 75.000000, 750.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 750.000000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (25, 25, 518, '包', 1.000000, 25.000000, 75.000000, 75.000000, 75.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 75.000000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (26, 26, 518, '包', 2.000000, 50.000000, 75.000000, 90.000000, 150.000000, '', NULL, NULL, 3, NULL, 20.000000, 30.000000, 180.000000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (27, 27, 518, '包', 1.000000, 25.000000, 75.000000, 82.500000, 75.000000, '', NULL, NULL, 3, NULL, 10.000000, 7.500000, 82.500000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (28, 28, 517, '箱', 2.000000, 24.000000, 36.000000, 36.000000, 72.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 72.000000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (29, 29, 500, '码', 100.000000, 100.000000, 1.300000, 1.370000, 130.000000, '', NULL, NULL, 3, NULL, 5.000000, 6.500000, 136.500000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (30, 30, 500, '码', 40.000000, 40.000000, 1.200000, 1.200000, 48.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 48.000000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (31, 31, 500, '码', 20.000000, 20.000000, 1.300000, 1.430000, 26.000000, '', NULL, NULL, 3, NULL, 10.000000, 2.600000, 28.600000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (32, 32, 500, '码', 10.000000, 10.000000, 1.200000, 1.320000, 12.000000, '', NULL, NULL, 3, NULL, 10.000000, 1.200000, 13.200000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (33, 33, 500, '码', 50.000000, 50.000000, 1.300000, 1.430000, 65.000000, '', NULL, NULL, 3, NULL, 10.000000, 6.500000, 71.500000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (37, 37, 500, '码', 1.000000, 1.000000, 1.300000, 1.300000, 1.300000, '', NULL, NULL, 3, 1, 0.000000, 0.000000, 1.300000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (38, 38, 500, '码', 2.000000, 2.000000, 1.300000, 1.300000, 2.600000, '', NULL, NULL, 3, 1, 0.000000, 0.000000, 2.600000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (41, 41, 500, '码', 20.000000, 20.000000, 2.100000, 2.310000, 42.000000, '', NULL, NULL, 3, NULL, 10.000000, 4.200000, 46.200000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (42, 42, 500, '码', 10.000000, 10.000000, 1.100000, 1.100000, 11.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 11.000000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (43, 43, 500, '码', 11.000000, 11.000000, 1.100000, 1.100000, 12.100000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 12.100000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (44, 44, 499, '码', 1.000000, 1.000000, 2.200000, 2.200000, 2.200000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 2.200000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (45, 45, 500, '码', 3.000000, 3.000000, 1.100000, 1.100000, 3.300000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 3.300000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (48, 48, 498, '码', 10.000000, 10.000000, 1.200000, 1.200000, 12.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 12.000000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (49, 49, 498, '码', 10.000000, 10.000000, 1.200000, 1.200000, 12.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 12.000000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (50, 50, 500, '码', 20.000000, 20.000000, 1.100000, 1.100000, 22.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 22.000000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (52, 52, 500, '码', 22.000000, 22.000000, 1.100000, 1.100000, 24.200000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 24.200000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (53, 53, 500, '码', 33.000000, 33.000000, 1.100000, 1.100000, 36.300000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 36.300000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (54, 54, 500, '码', 10.000000, 10.000000, 1.200000, 1.200000, 12.000000, '', NULL, NULL, 1, NULL, 10.000000, 0.000000, 12.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (57, 57, 500, '码', 2.000000, 2.000000, 1.200000, 1.260000, 2.400000, '', NULL, NULL, 3, NULL, 0.000000, 0.120000, 2.520000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (63, 57, 517, '箱', 5.000000, 60.000000, 36.000000, 36.000000, 180.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 180.000000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (64, 63, 500, '码', 10.000000, 10.000000, 1.200000, 1.320000, 12.000000, '', NULL, NULL, 3, NULL, 10.000000, 1.200000, 13.200000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (66, 65, 498, '码', 30.000000, 30.000000, 1.300000, 1.430000, 39.000000, '', NULL, NULL, 3, NULL, 10.000000, 3.900000, 42.900000, '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_depot_item` VALUES (71, 68, 498, '码', 1.000000, 1.000000, 3.000000, 3.000000, 3.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 3.000000, '', '', '', '', '', '组合件', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (72, 68, 499, '码', 1.000000, 1.000000, 4.000000, 4.000000, 4.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 4.000000, '', '', '', '', '', '普通子件', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (73, 69, 498, '码', 1.000000, 1.000000, 0.000000, 0.000000, 0.000000, '', NULL, NULL, 1, NULL, 0.000000, 0.000000, 0.000000, '', '', '', '', '', '组合件', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (74, 69, 499, '码', 1.000000, 1.000000, 0.000000, 0.000000, 0.000000, '', NULL, NULL, 1, NULL, 0.000000, 0.000000, 0.000000, '', '', '', '', '', '普通子件', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (75, 70, 487, '码', 50.000000, 50.000000, 1.000000, 1.000000, 50.000000, '', NULL, NULL, 1, NULL, 10.000000, 0.000000, 50.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (76, 71, 499, '码', 20.000000, 20.000000, 2.400000, 2.400000, 48.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 48.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (77, 72, 499, '码', 10.000000, 10.000000, 2.400000, 2.810000, 24.000000, '', NULL, NULL, 3, NULL, 17.000000, 4.080000, 28.080000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (78, 73, 487, '码', 10.000000, 10.000000, 1.000000, 1.000000, 10.000000, '', NULL, NULL, 1, NULL, 0.000000, 0.000000, 10.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (79, 74, 487, '码', 5.000000, 5.000000, 1.000000, 1.000000, 5.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 5.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (80, 75, 500, '码', 10.000000, 10.000000, 1.300000, 1.300000, 13.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 13.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (81, 76, 487, '码', 10.000000, 10.000000, 1.000000, 1.000000, 10.000000, '', NULL, NULL, 3, 1, 0.000000, 0.000000, 10.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (82, 77, 499, '码', 1.000000, 1.000000, 2.200000, 2.200000, 2.200000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 2.200000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (83, 78, 499, '码', 1.000000, 1.000000, 2.200000, 2.200000, 2.200000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 2.200000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (84, 79, 499, '码', 9.000000, 9.000000, 2.400000, 2.640000, 21.600000, '', NULL, NULL, 3, NULL, 10.000000, 2.160000, 23.760000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (85, 80, 500, '码', 1.000000, 1.000000, 2.000000, 2.000000, 2.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 2.000000, '', '', '', '', '', '组合件', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (86, 80, 498, '码', 1.000000, 1.000000, 3.000000, 3.000000, 3.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 3.000000, '', '', '', '', '', '普通子件', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (88, 82, 498, '码', 40.000000, 40.000000, 1.300000, 1.430000, 52.000000, '', NULL, NULL, 3, NULL, 10.000000, 5.200000, 57.200000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (90, 84, 499, '码', 10.000000, 10.000000, 2.400000, 2.640000, 24.000000, '', NULL, NULL, 1, NULL, 10.000000, 2.400000, 26.400000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (91, 85, 518, '包', 1.000000, 25.000000, 75.000000, 87.750000, 75.000000, '', NULL, NULL, 3, NULL, 17.000000, 12.750000, 87.750000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (93, 87, 518, 'kg', 1.000000, 1.000000, 4.000000, 4.000000, 4.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 4.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (94, 88, 517, '瓶', 10.000000, 10.000000, 4.000000, 4.400000, 40.000000, '', NULL, NULL, 3, NULL, 10.000000, 4.000000, 44.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (95, 89, 517, '箱', 1.000000, 12.000000, 18.000000, 18.000000, 18.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 18.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (96, 90, 518, '包', 2.000000, 50.000000, 50.000000, 50.000000, 100.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 100.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (101, 94, 517, '瓶', 2.000000, 2.000000, 4.000000, 4.000000, 8.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 8.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (102, 95, 498, '码', 2.000000, 2.000000, 1.300000, 1.430000, 2.600000, '', NULL, NULL, 3, NULL, 10.000000, 0.260000, 2.860000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (103, 96, 498, '码', 2.000000, 2.000000, 1.400000, 1.400000, 2.800000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 2.800000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (104, 97, 485, '码', 200.000000, 200.000000, 1.000000, 1.170000, 200.000000, '', NULL, NULL, 3, NULL, 17.000000, 34.000000, 234.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (105, 98, 487, '码', 300.000000, 300.000000, 1.000000, 1.170000, 300.000000, '', NULL, NULL, 3, NULL, 17.000000, 51.000000, 351.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (106, 99, 517, '箱', 20.000000, 240.000000, 36.000000, 42.120000, 720.000000, '', NULL, NULL, 3, NULL, 17.000000, 122.400000, 842.400000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (107, 100, 487, '码', 1.000000, 1.000000, 1.000000, 1.000000, 1.000000, '', NULL, NULL, 4, NULL, 0.000000, 0.000000, 1.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (108, 101, 485, '码', 50.000000, 50.000000, 1.000000, 1.000000, 50.000000, '', NULL, NULL, 3, 1, 0.000000, 0.000000, 50.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (109, 102, 498, '码', 10.000000, 10.000000, 1.200000, 1.200000, 12.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 12.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (110, 103, 499, '码', 10.000000, 10.000000, 2.400000, 2.640000, 24.000000, '', NULL, NULL, 3, NULL, 10.000000, 2.400000, 26.400000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (111, 104, 487, '码', 10.000000, 10.000000, 1.000000, 1.170000, 10.000000, '', NULL, NULL, 3, NULL, 17.000000, 1.700000, 11.700000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (112, 105, 499, '码', 5.000000, 5.000000, 2.600000, 2.600000, 13.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 13.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (113, 106, 499, '码', 5.000000, 5.000000, 2.600000, 2.600000, 13.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 13.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (114, 107, 487, '码', 1.000000, 1.000000, 1.000000, 1.000000, 1.000000, '', NULL, NULL, 1, NULL, 0.000000, 0.000000, 1.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (116, 108, 517, '箱', 1.000000, 12.000000, 36.000000, 42.120000, 36.000000, '', NULL, NULL, 3, NULL, 17.000000, 6.120000, 42.120000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (117, 109, 500, '码', 1.000000, 1.000000, 1.200000, 1.400000, 1.200000, '', NULL, NULL, 3, NULL, 17.000000, 0.200000, 1.400000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (118, 110, 487, '码', 10.000000, 10.000000, 1.000000, 1.100000, 10.000000, '', NULL, NULL, 3, NULL, 10.000000, 1.000000, 11.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (119, 111, 487, '码', 20.000000, 20.000000, 1.000000, 1.100000, 20.000000, '', NULL, NULL, 1, NULL, 10.000000, 2.000000, 22.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (120, 112, 499, '码', 1.000000, 1.000000, 2.600000, 2.600000, 2.600000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 2.600000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (123, 114, 499, '码', 1.000000, 1.000000, 2.400000, 2.400000, 2.400000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 2.400000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (124, 115, 563, '张', 20.000000, 20.000000, 11.000000, 12.870000, 220.000000, '', NULL, NULL, 1, NULL, 17.000000, 37.400000, 257.400000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (125, 116, 563, '张', 80.000000, 80.000000, 11.000000, 12.870000, 880.000000, '', NULL, NULL, 3, NULL, 17.000000, 149.600000, 1029.600000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (126, 117, 563, '张', 10.000000, 10.000000, 11.000000, 11.000000, 110.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 110.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (127, 118, 563, '张', 1.000000, 1.000000, 11.000000, 11.000000, 11.000000, '', NULL, NULL, 1, NULL, 0.000000, 0.000000, 11.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (128, 119, 562, '个', 10.000000, 10.000000, 8.000000, 8.800000, 80.000000, '', NULL, NULL, 3, NULL, 10.000000, 8.000000, 88.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (129, 120, 500, '码', 3.000000, 3.000000, 1.300000, 1.300000, 3.900000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 3.900000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (130, 121, 517, '箱', 1.000000, 12.000000, 36.000000, 42.120000, 36.000000, '', NULL, NULL, 3, NULL, 17.000000, 6.120000, 42.120000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (131, 122, 487, '码', 100.000000, 100.000000, 1.000000, 1.170000, 100.000000, '', NULL, NULL, 3, NULL, 17.000000, 17.000000, 117.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (132, 123, 499, '码', 10.000000, 10.000000, 2.600000, 2.600000, 26.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 26.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (133, 124, 562, '个', 100.000000, 100.000000, 8.000000, 9.360000, 800.000000, '', NULL, NULL, 1, NULL, 17.000000, 136.000000, 936.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (144, 137, 499, '码', 1.000000, 1.000000, 2.400000, 2.400000, 2.400000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 2.400000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (146, 139, 499, '码', 10.000000, 10.000000, 2.400000, 2.810000, 24.000000, '', NULL, NULL, 3, NULL, 17.000000, 4.080000, 28.080000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (148, 141, 500, '码', 3.000000, 3.000000, 1.300000, 1.300000, 3.900000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 3.900000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (149, 142, 498, '码', 5.000000, 5.000000, 1.400000, 1.400000, 7.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 7.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (151, 144, 498, '码', 5.000000, 5.000000, 1.400000, 1.400000, 7.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 7.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (154, 147, 499, '码', 100.000000, 100.000000, 2.400000, 2.400000, 240.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 240.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (155, 148, 499, '码', 100.000000, 100.000000, 2.400000, 2.400000, 240.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 240.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (158, 139, 498, '码', 20.000000, 20.000000, 1.110000, 1.300000, 22.220000, '', NULL, NULL, 3, NULL, 17.000000, 3.780000, 26.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (161, 155, 499, '码', 10.000000, 10.000000, 2.400000, 2.810000, 24.000000, '', NULL, NULL, 3, NULL, 17.000000, 4.080000, 28.080000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (162, 155, 498, '码', 20.000000, 20.000000, 1.110000, 1.300000, 22.220000, '', NULL, NULL, 3, NULL, 17.000000, 3.780000, 26.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (165, 158, 487, '码', 10.000000, 10.000000, 1.000000, 1.000000, 10.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 10.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (166, 159, 498, '码', 15.000000, 15.000000, 1.300000, 1.300000, 19.500000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 19.500000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (167, 160, 487, '码', 1111.000000, 1111.000000, 1.000000, 1.000000, 1111.000000, '', NULL, NULL, 1, NULL, 0.000000, 0.000000, 1111.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (168, 161, 487, '码', 111.000000, 111.000000, 1.000000, 1.000000, 111.000000, '', NULL, NULL, 1, NULL, 0.000000, 0.000000, 111.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (169, 162, 498, '码', 111.000000, 111.000000, 1.300000, 1.520000, 144.300000, '', NULL, NULL, 3, NULL, 17.000000, 24.530000, 168.830000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (170, 163, 487, '码', 111.000000, 111.000000, 1.000000, 1.000000, 111.000000, '', NULL, NULL, 1, 3, 0.000000, 0.000000, 111.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (171, 164, 498, '码', 1.000000, 1.000000, 1.200000, 1.200000, 1.200000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 1.200000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (172, 165, 564, '个', 10.000000, 10.000000, 22.000000, 22.000000, 220.000000, '', NULL, NULL, 7, NULL, 0.000000, 0.000000, 220.000000, '', '', '', '', '', '', 1, '0');
INSERT INTO `smic_depot_item` VALUES (173, 166, 564, '个', 111.000000, 111.000000, 22.000000, 22.000000, 2442.000000, '', NULL, NULL, 7, NULL, 0.000000, 0.000000, 2442.000000, '', '', '', '', '', '', 1, '0');
INSERT INTO `smic_depot_item` VALUES (174, 167, 564, '个', 5.000000, 5.000000, 22.000000, 22.000000, 110.000000, '', NULL, NULL, 7, NULL, 0.000000, 0.000000, 110.000000, '', '', '', '', '', '', 1, '0');
INSERT INTO `smic_depot_item` VALUES (175, 168, 564, '个', 1.000000, 1.000000, 22.000000, 22.000000, 22.000000, '', NULL, NULL, 7, NULL, 0.000000, 0.000000, 22.000000, '', '', '', '', '', '', 1, '0');
INSERT INTO `smic_depot_item` VALUES (176, 169, 564, '个', 1.000000, 1.000000, 22.000000, 22.000000, 22.000000, '', NULL, NULL, 7, NULL, 0.000000, 0.000000, 22.000000, '', '', '', '', '', '', 1, '0');
INSERT INTO `smic_depot_item` VALUES (177, 170, 564, '个', 1.000000, 1.000000, 22.000000, 22.000000, 22.000000, '', NULL, NULL, 7, NULL, 0.000000, 0.000000, 22.000000, '', '', '', '', '', '', 1, '0');
INSERT INTO `smic_depot_item` VALUES (178, 171, 564, '个', 1.000000, 1.000000, 22.000000, 22.000000, 22.000000, '', NULL, NULL, 7, NULL, 0.000000, 0.000000, 22.000000, '', '', '', '', '', '', 1, '0');
INSERT INTO `smic_depot_item` VALUES (179, 172, 564, '个', 1.000000, 1.000000, 22.000000, 22.000000, 22.000000, '', NULL, NULL, 7, NULL, 0.000000, 0.000000, 22.000000, '', '', '', '', '', '', 1, '0');
INSERT INTO `smic_depot_item` VALUES (180, 173, 564, '个', 100.000000, 100.000000, 22.000000, 22.000000, 2200.000000, '', NULL, NULL, 7, NULL, 0.000000, 0.000000, 2200.000000, '', '', '', '', '', '', 1, '0');
INSERT INTO `smic_depot_item` VALUES (181, 174, 564, '个', 8.000000, 8.000000, 22.000000, 22.000000, 176.000000, '', NULL, NULL, 7, NULL, 0.000000, 0.000000, 176.000000, '', '', '', '', '', '', 1, '0');
INSERT INTO `smic_depot_item` VALUES (182, 175, 487, '码', 10.000000, 10.000000, 1.000000, 1.000000, 10.000000, '', NULL, NULL, 1, NULL, 0.000000, 0.000000, 10.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (183, 176, 499, '码', 10.000000, 10.000000, 2.400000, 2.810000, 24.000000, '', NULL, NULL, 1, NULL, 17.000000, 4.080000, 28.080000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (184, 177, 487, '码', 10.000000, 10.000000, 1.000000, 1.000000, 10.000000, '', NULL, NULL, 1, NULL, 0.000000, 0.000000, 10.000000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (185, 178, 500, '码', 12.000000, 12.000000, 1.200000, 1.200000, 14.400000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 14.400000, '', '', '', '', '', '', NULL, '1');
INSERT INTO `smic_depot_item` VALUES (186, 179, 499, '码', 122.000000, 122.000000, 2.600000, 2.600000, 317.200000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 317.200000, '', '', '', '', '', '', NULL, '1');
INSERT INTO `smic_depot_item` VALUES (187, 180, 567, '个', 111.000000, NULL, 11.000000, 11.000000, 1221.000000, '', NULL, NULL, 13, NULL, 0.000000, 0.000000, 1221.000000, '', '', '', '', '', '', 115, '0');
INSERT INTO `smic_depot_item` VALUES (188, 181, 567, '个', 122.000000, NULL, 11.000000, 11.000000, 1342.000000, '', NULL, NULL, 13, NULL, 0.000000, 0.000000, 1342.000000, '', '', '', '', '', '', 115, '0');
INSERT INTO `smic_depot_item` VALUES (189, 182, 500, '码', 12.000000, NULL, 1.200000, 1.200000, 14.400000, '', NULL, NULL, 1, NULL, 0.000000, 0.000000, 14.400000, '', '', '', '', '', '', NULL, '1');
INSERT INTO `smic_depot_item` VALUES (190, 183, 500, '码', 133.000000, NULL, 1.200000, 1.200000, 159.600000, '', NULL, NULL, 1, NULL, 0.000000, 0.000000, 159.600000, '', '', '', '', '', '', NULL, '1');
INSERT INTO `smic_depot_item` VALUES (191, 184, 517, '瓶', 10.000000, NULL, 3.000000, 3.510000, 30.000000, '', NULL, NULL, 3, NULL, 17.000000, 5.100000, 35.100000, '', '', '', '', '', '', NULL, '1');
INSERT INTO `smic_depot_item` VALUES (192, 185, 517, '瓶', 10.000000, NULL, 3.000000, 3.510000, 30.000000, '', NULL, NULL, 3, NULL, 17.000000, 5.100000, 35.100000, '', '', '', '', '', '', NULL, '1');
INSERT INTO `smic_depot_item` VALUES (193, 186, 487, '码', 10.000000, NULL, 1.000000, 1.170000, 10.000000, '', NULL, NULL, 3, NULL, 17.000000, 1.700000, 11.700000, '', '', '', '', '', '', NULL, '1');
INSERT INTO `smic_depot_item` VALUES (194, 187, 517, '箱', 10.000000, 120.000000, 36.000000, 42.120000, 360.000000, '', NULL, NULL, 3, NULL, 17.000000, 61.200000, 421.200000, '', '', '', '', '', '', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (195, 188, 485, '码', 8.000000, 8.000000, 0.000000, 0.000000, 0.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 0.000000, '', '', '', '', '', '组合件', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (196, 188, 487, '码', 8.000000, 8.000000, 0.000000, 0.000000, 0.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 0.000000, '', '', '', '', '', '普通子件', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (197, 188, 498, '码', 8.000000, 8.000000, 0.000000, 0.000000, 0.000000, '', NULL, NULL, 3, NULL, 0.000000, 0.000000, 0.000000, '', '', '', '', '', '普通子件', NULL, '0');
INSERT INTO `smic_depot_item` VALUES (198, 189, 569, '只', 12.000000, 12.000000, 2.000000, 2.000000, 24.000000, '', NULL, NULL, 14, NULL, 0.000000, 0.000000, 24.000000, '', '', '', '', '', '', 63, '0');
INSERT INTO `smic_depot_item` VALUES (199, 190, 569, '只', 12.000000, 12.000000, 2.000000, 2.000000, 24.000000, '', NULL, NULL, 14, NULL, 0.000000, 0.000000, 24.000000, '', '', '', '', '', '', 63, '1');
INSERT INTO `smic_depot_item` VALUES (200, 191, 569, '只', 1.000000, 1.000000, 2.000000, 2.000000, 2.000000, '', NULL, NULL, 14, NULL, 0.000000, 0.000000, 2.000000, '', '', '', '', '', '', 63, '0');
INSERT INTO `smic_depot_item` VALUES (201, 192, 569, '只', 22.000000, 22.000000, 2.000000, 2.000000, 44.000000, '', NULL, NULL, 14, NULL, 0.000000, 0.000000, 44.000000, '', '', '', '', '', '', 63, '0');
INSERT INTO `smic_depot_item` VALUES (202, 193, 569, '只', 20.000000, 20.000000, 5.000000, 5.000000, 100.000000, '', NULL, NULL, 14, NULL, 0.000000, 0.000000, 100.000000, '', '', '', '', '', '', 63, '0');
INSERT INTO `smic_depot_item` VALUES (203, 194, 569, '只', 100.000000, 100.000000, 5.000000, 5.000000, 500.000000, '', NULL, NULL, 15, NULL, 0.000000, 0.000000, 500.000000, '', '', '', '', '', '', 63, '0');
INSERT INTO `smic_depot_item` VALUES (204, 195, 569, '只', 122.000000, 122.000000, 5.000000, 5.000000, 610.000000, '', NULL, NULL, 15, NULL, 0.000000, 0.000000, 610.000000, '', '', '', '', '', '', 63, '0');
INSERT INTO `smic_depot_item` VALUES (205, 196, 569, '只', 122.000000, 122.000000, 5.000000, 5.000000, 610.000000, '', NULL, NULL, 15, NULL, 0.000000, 0.000000, 610.000000, '', '', '', '', '', '', 63, '0');
INSERT INTO `smic_depot_item` VALUES (206, 197, 569, '只', 18.000000, 18.000000, 5.000000, 5.000000, 90.000000, '', NULL, NULL, 14, NULL, 0.000000, 0.000000, 90.000000, '', '', '', '', '', '', 63, '0');
INSERT INTO `smic_depot_item` VALUES (207, 196, 569, '只', 2.000000, 2.000000, 5.000000, 5.000000, 10.000000, '', NULL, NULL, 15, NULL, 0.000000, 0.000000, 10.000000, '', '', '', '', '', '', 63, '0');
INSERT INTO `smic_depot_item` VALUES (208, 196, 569, '只', 2.000000, 2.000000, 5.000000, 5.000000, 10.000000, '', NULL, NULL, 15, NULL, 0.000000, 0.000000, 10.000000, '', '', '', '', '', '', 63, '0');
INSERT INTO `smic_depot_item` VALUES (209, 196, 568, '个', 2.000000, 2.000000, 0.000000, 0.000000, 0.000000, '', NULL, NULL, 14, NULL, 0.000000, 0.000000, 0.000000, '', '', '', '', '', '', 63, '0');
INSERT INTO `smic_depot_item` VALUES (210, 196, 568, '个', 2.000000, 2.000000, 0.000000, 0.000000, 0.000000, '', NULL, NULL, 14, NULL, 0.000000, 0.000000, 0.000000, '', '', '', '', '', '', 63, '0');
INSERT INTO `smic_depot_item` VALUES (211, 196, 568, '个', 3.000000, 3.000000, 0.000000, 0.000000, 0.000000, '', NULL, NULL, 14, NULL, 0.000000, 0.000000, 0.000000, '', '', '', '', '', '', 63, '0');
INSERT INTO `smic_depot_item` VALUES (212, 196, 568, '个', 4.000000, 4.000000, 0.000000, 0.000000, 0.000000, '', NULL, NULL, 14, NULL, 0.000000, 0.000000, 0.000000, '', '', '', '', '', '', 63, '0');
INSERT INTO `smic_depot_item` VALUES (213, 196, 568, '个', 5.000000, 5.000000, 2.000000, 2.000000, 10.000000, '', NULL, NULL, 14, NULL, 0.000000, 0.000000, 10.000000, '', '', '', '', '', '', 63, '0');
INSERT INTO `smic_depot_item` VALUES (214, 196, 569, '只', 6.000000, 6.000000, 5.000000, 5.000000, 30.000000, '', NULL, NULL, 14, NULL, 0.000000, 0.000000, 30.000000, '', '', '', '', '', '', 63, '0');
INSERT INTO `smic_depot_item` VALUES (215, 198, 578, '箱', 1.000000, 12.000000, 1.000000, 1.120000, 1.000000, '', NULL, NULL, 14, NULL, 12.000000, 0.120000, 1.120000, '', '', '', '', '', '', 63, '0');

-- ----------------------------
-- Table structure for smic_functions
-- ----------------------------
DROP TABLE IF EXISTS `smic_functions`;
CREATE TABLE `smic_functions`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `p_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级编号',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接',
  `state` bit(1) NULL DEFAULT NULL COMMENT '收缩',
  `sort` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序',
  `enabled` bit(1) NULL DEFAULT NULL COMMENT '启用',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `push_btn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能按钮',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `delete_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 252 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '功能模块表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smic_functions
-- ----------------------------
INSERT INTO `smic_functions` VALUES (1, '0001', '系统管理', '0', '', b'1', '0910', b'1', '电脑版', '', 'icon-settings', '0');
INSERT INTO `smic_functions` VALUES (13, '000102', '角色管理', '0001', '/pages/manage/role.html', b'0', '0130', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (14, '000103', '用户管理', '0001', '/pages/manage/user.html', b'0', '0140', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (15, '000104', '日志管理', '0001', '/pages/manage/log.html', b'0', '0160', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (16, '000105', '功能管理', '0001', '/pages/manage/functions.html', b'0', '0135', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (21, '0101', '商品管理', '0', '', b'0', '0620', b'1', '电脑版', NULL, 'icon-social-dropbox', '0');
INSERT INTO `smic_functions` VALUES (22, '010101', '商品类别', '0101', '/pages/materials/materialcategory.html', b'0', '0230', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (23, '010102', '商品信息', '0101', '/pages/materials/material.html', b'0', '0240', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (24, '0102', '基本资料', '0', '', b'0', '0750', b'1', '电脑版', NULL, 'icon-grid', '0');
INSERT INTO `smic_functions` VALUES (25, '01020101', '供应商信息', '0102', '/pages/manage/vendor.html', b'0', '0260', b'1', '电脑版', '1,2', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (26, '010202', '仓库信息', '0102', '/pages/manage/depot.html', b'0', '0270', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (31, '010206', '经手人管理', '0102', '/pages/materials/person.html', b'0', '0284', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (32, '0502', '采购管理', '0', '', b'0', '0330', b'1', '电脑版', '', 'icon-loop', '0');
INSERT INTO `smic_functions` VALUES (33, '050201', '采购入库', '0502', '/pages/materials/purchase_in_list.html', b'0', '0340', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (38, '0603', '销售管理', '0', '', b'0', '0390', b'1', '电脑版', '', 'icon-briefcase', '0');
INSERT INTO `smic_functions` VALUES (40, '080107', '调拨出库', '0801', '/pages/materials/allocation_out_list.html', b'0', '0807', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (41, '060303', '销售出库', '0603', '/pages/materials/sale_out_list.html', b'0', '0394', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (44, '0704', '财务管理', '0', '', b'0', '0450', b'1', '电脑版', '', 'icon-map', '0');
INSERT INTO `smic_functions` VALUES (59, '030101', '库存状况', '0301', '/pages/reports/in_out_stock_report.html', b'0', '0600', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (194, '010204', '收支项目', '0102', '/pages/manage/inOutItem.html', b'0', '0282', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (195, '010205', '结算账户', '0102', '/pages/manage/account.html', b'0', '0283', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (197, '070402', '收入单', '0704', '/pages/financial/item_in.html', b'0', '0465', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (198, '0301', '报表查询', '0', '', b'0', '0570', b'1', '电脑版', NULL, 'icon-pie-chart', '0');
INSERT INTO `smic_functions` VALUES (199, '050204', '采购退货', '0502', '/pages/materials/purchase_back_list.html', b'0', '0345', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (200, '060305', '销售退货', '0603', '/pages/materials/sale_back_list.html', b'0', '0396', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (201, '080103', '其它入库', '0801', '/pages/materials/other_in_list.html', b'0', '0803', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (202, '080105', '其它出库', '0801', '/pages/materials/other_out_list.html', b'0', '0805', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (203, '070403', '支出单', '0704', '/pages/financial/item_out.html', b'0', '0470', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (204, '070404', '收款单', '0704', '/pages/financial/money_in.html', b'0', '0475', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (205, '070405', '付款单', '0704', '/pages/financial/money_out.html', b'0', '0480', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (206, '070406', '转账单', '0704', '/pages/financial/giro.html', b'0', '0490', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (207, '030102', '结算账户', '0301', '/pages/reports/account_report.html', b'0', '0610', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (208, '030103', '进货统计', '0301', '/pages/reports/buy_in_report.html', b'0', '0620', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (209, '030104', '销售统计', '0301', '/pages/reports/sale_out_report.html', b'0', '0630', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (210, '040102', '零售出库', '0401', '/pages/materials/retail_out_list.html', b'0', '0405', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (211, '040104', '零售退货', '0401', '/pages/materials/retail_back_list.html', b'0', '0407', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (212, '070407', '收预付款', '0704', '/pages/financial/advance_in.html', b'0', '0495', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (217, '01020102', '客户信息', '0102', '/pages/manage/customer.html', b'0', '0262', b'1', '电脑版', '1,2', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (218, '01020103', '会员信息', '0102', '/pages/manage/member.html', b'0', '0263', b'1', '电脑版', '1,2', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (219, '000107', '资产管理', '0001', '/pages/asset/asset.html', b'0', '0170', b'0', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (220, '010103', '计量单位', '0101', '/pages/manage/unit.html', b'0', '0245', b'1', '电脑版', NULL, 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (225, '0401', '零售管理', '0', '', b'0', '0101', b'1', '电脑版', '', 'icon-present', '0');
INSERT INTO `smic_functions` VALUES (226, '030106', '入库明细', '0301', '/pages/reports/in_detail.html', b'0', '0640', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (227, '030107', '出库明细', '0301', '/pages/reports/out_detail.html', b'0', '0645', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (228, '030108', '入库汇总', '0301', '/pages/reports/in_material_count.html', b'0', '0650', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (229, '030109', '出库汇总', '0301', '/pages/reports/out_material_count.html', b'0', '0655', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (232, '080109', '组装单', '0801', '/pages/materials/assemble_list.html', b'0', '0809', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (233, '080111', '拆卸单', '0801', '/pages/materials/disassemble_list.html', b'0', '0811', b'1', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (234, '000105', '系统配置', '0001', '/pages/manage/systemConfig.html', b'0', '0165', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (235, '030110', '客户对账', '0301', '/pages/reports/customer_account.html', b'0', '0660', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (236, '000106', '商品属性', '0001', '/pages/materials/materialProperty.html', b'0', '0168', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (237, '030111', '供应商对账', '0301', '/pages/reports/vendor_account.html', b'0', '0665', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (239, '0801', '仓库管理', '0', '', b'0', '0420', b'1', '电脑版', '', 'icon-layers', '0');
INSERT INTO `smic_functions` VALUES (240, '010104', '序列号', '0101', '/pages/manage/serialNumber.html', b'0', '0246', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (241, '050202', '采购订单', '0502', '/pages/materials/purchase_orders_list.html', b'0', '0335', b'1', '电脑版', '3', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (242, '060301', '销售订单', '0603', '/pages/materials/sale_orders_list.html', b'0', '0392', b'1', '电脑版', '3', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (243, '000108', '机构管理', '0001', '/pages/manage/organization.html', b'1', '0139', b'1', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `smic_functions` VALUES (244, '030112', '库存预警', '0301', '/pages/reports/stock_warning_report.html', b'0', '0670', b'1', '电脑版', '', 'icon-notebook', '0');

-- ----------------------------
-- Table structure for smic_inout_item
-- ----------------------------
DROP TABLE IF EXISTS `smic_inout_item`;
CREATE TABLE `smic_inout_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `delete_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收支项目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smic_inout_item
-- ----------------------------
INSERT INTO `smic_inout_item` VALUES (1, '办公耗材', '支出', '办公耗材', NULL, '0');
INSERT INTO `smic_inout_item` VALUES (5, '房租收入', '收入', '房租收入', NULL, '0');
INSERT INTO `smic_inout_item` VALUES (7, '利息收入', '收入', '利息收入', NULL, '0');
INSERT INTO `smic_inout_item` VALUES (8, '水电费', '支出', '水电费水电费', NULL, '0');
INSERT INTO `smic_inout_item` VALUES (9, '快递费', '支出', '快递费', NULL, '0');
INSERT INTO `smic_inout_item` VALUES (10, '交通报销费', '支出', '交通报销费', NULL, '0');
INSERT INTO `smic_inout_item` VALUES (11, '差旅费', '支出', '差旅费', NULL, '0');
INSERT INTO `smic_inout_item` VALUES (12, '全车贴膜-普通', '收入', '', NULL, '0');
INSERT INTO `smic_inout_item` VALUES (13, '全车贴膜-高档', '收入', '', NULL, '0');
INSERT INTO `smic_inout_item` VALUES (14, '洗车', '收入', '', NULL, '0');
INSERT INTO `smic_inout_item` VALUES (15, '保养汽车', '收入', '', NULL, '0');
INSERT INTO `smic_inout_item` VALUES (16, '收入项目1', '收入', '', 1, '0');
INSERT INTO `smic_inout_item` VALUES (17, '支出项目1', '支出', '', 1, '0');
INSERT INTO `smic_inout_item` VALUES (18, '收入1', '收入', '', 117, '0');
INSERT INTO `smic_inout_item` VALUES (19, '支出1', '支出', '', 117, '0');
INSERT INTO `smic_inout_item` VALUES (20, '支出2', '支出', '', 117, '0');

-- ----------------------------
-- Table structure for smic_log
-- ----------------------------
DROP TABLE IF EXISTS `smic_log`;
CREATE TABLE `smic_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '操作用户ID',
  `operation` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作模块名称',
  `client_iP` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端IP',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '操作状态 0==成功，1==失败',
  `contentdetails` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作详情',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKF2696AA13E226853`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6348 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smic_log
-- ----------------------------
INSERT INTO `smic_log` VALUES (1722, 63, '登录系统', '192.168.1.104', '2016-11-27 13:17:17', 0, '管理用户：smic 登录系统', 'smic 登录系统', NULL);
INSERT INTO `smic_log` VALUES (1723, 63, '登录系统', '192.168.1.104', '2016-11-27 13:17:30', 0, '管理用户：smic 登录系统', 'smic 登录系统', NULL);
INSERT INTO `smic_log` VALUES (1724, 63, '退出系统', '192.168.1.104', '2016-11-27 13:17:48', 0, '管理用户：smic 退出系统', 'smic 退出系统', NULL);
INSERT INTO `smic_log` VALUES (1725, 65, '登录系统', '192.168.1.104', '2016-11-27 13:17:52', 0, '管理用户：ls 登录系统', 'ls 登录系统', NULL);
INSERT INTO `smic_log` VALUES (1726, 65, '退出系统', '192.168.1.104', '2016-11-27 13:18:18', 0, '管理用户：ls 退出系统', 'ls 退出系统', NULL);
INSERT INTO `smic_log` VALUES (1727, 63, '登录系统', '192.168.1.104', '2016-11-27 13:18:22', 0, '管理用户：smic 登录系统', 'smic 登录系统', NULL);
INSERT INTO `smic_log` VALUES (1728, 63, '更新UserBusiness', '192.168.1.104', '2016-11-27 13:18:44', 0, '更新UserBusiness的ID为  6 成功！', '更新UserBusiness成功', NULL);
INSERT INTO `smic_log` VALUES (1729, 63, '退出系统', '192.168.1.104', '2016-11-27 13:18:48', 0, '管理用户：smic 退出系统', 'smic 退出系统', NULL);
INSERT INTO `smic_log` VALUES (1730, 65, '登录系统', '192.168.1.104', '2016-11-27 13:18:53', 0, '管理用户：ls 登录系统', 'ls 登录系统', NULL);
INSERT INTO `smic_log` VALUES (1731, 63, '登录系统', '192.168.1.104', '2016-12-04 10:38:50', 0, '管理用户：smic 登录系统', 'smic 登录系统', NULL);
INSERT INTO `smic_log` VALUES (1732, 63, '增加物料', '192.168.1.104', '2016-12-04 10:40:52', 0, '增加物料名称为  11 成功！', '增加物料成功', NULL);
INSERT INTO `smic_log` VALUES (1733, 63, '更新物料', '192.168.1.104', '2016-12-04 10:59:57', 0, '更新物料ID为  499 成功！', '更新物料成功', NULL);
INSERT INTO `smic_log` VALUES (1734, 63, '更新物料', '192.168.1.104', '2016-12-04 11:00:13', 0, '更新物料ID为  499 成功！', '更新物料成功', NULL);
INSERT INTO `smic_log` VALUES (1735, 63, '删除物料', '192.168.1.104', '2016-12-04 11:00:38', 0, '删除物料ID为  499 成功！', '删除物料成功', NULL);
INSERT INTO `smic_log` VALUES (1736, 63, '增加物料', '192.168.1.104', '2016-12-04 11:02:35', 0, '增加物料名称为  11 成功！', '增加物料成功', NULL);
INSERT INTO `smic_log` VALUES (1737, 63, '批量删除物料', '192.168.1.104', '2016-12-04 11:02:41', 0, '批量删除物料ID为  500 成功！', '批量删除物料成功', NULL);
INSERT INTO `smic_log` VALUES (1738, 63, '更新功能', '192.168.1.104', '2016-12-04 11:04:43', 0, '更新功能ID为  26 成功！', '更新功能成功', NULL);
INSERT INTO `smic_log` VALUES (1739, 63, '增加供应商', '192.168.1.104', '2016-12-04 11:38:13', 0, '增加供应商名称为  aa 成功！', '增加供应商成功', NULL);
INSERT INTO `smic_log` VALUES (1740, 63, '增加供应商', '192.168.1.104', '2016-12-04 11:48:36', 0, '增加供应商名称为  aaaa 成功！', '增加供应商成功', NULL);
INSERT INTO `smic_log` VALUES (1741, 63, '删除供应商', '192.168.1.104', '2016-12-04 11:48:53', 0, '删除供应商ID为  3,名称为  aa成功！', '删除供应商成功', NULL);
INSERT INTO `smic_log` VALUES (1742, 63, '更新供应商', '192.168.1.104', '2016-12-04 11:48:59', 0, '更新供应商ID为  4 成功！', '更新供应商成功', NULL);
INSERT INTO `smic_log` VALUES (5852, 63, '单据', '127.0.0.1', '2019-03-09 15:49:57', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5853, 63, '商品', '127.0.0.1', '2019-03-09 15:50:31', 0, '新增商品', '新增商品', NULL);
INSERT INTO `smic_log` VALUES (5854, 63, '商品', '127.0.0.1', '2019-03-09 15:50:49', 0, '更新,id:563商品', '更新,id:563商品', NULL);
INSERT INTO `smic_log` VALUES (5855, 63, '单据', '127.0.0.1', '2019-03-09 15:52:06', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5856, 63, '单据', '127.0.0.1', '2019-03-09 15:52:21', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5857, 63, '单据', '127.0.0.1', '2019-03-09 15:53:07', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5858, 63, '单据', '127.0.0.1', '2019-03-09 15:57:26', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5859, 63, '商品', '127.0.0.1', '2019-03-09 16:00:18', 0, '更新,id:562商品', '更新,id:562商品', NULL);
INSERT INTO `smic_log` VALUES (5860, 63, '商品', '127.0.0.1', '2019-03-09 16:01:17', 0, '更新,id:562商品', '更新,id:562商品', NULL);
INSERT INTO `smic_log` VALUES (5861, 63, '单据', '127.0.0.1', '2019-03-09 16:02:30', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5862, 63, '功能', '127.0.0.1', '2019-03-09 16:10:29', 0, '更新,id:241功能', '更新,id:241功能', NULL);
INSERT INTO `smic_log` VALUES (5863, 63, '单据', '127.0.0.1', '2019-03-09 16:27:38', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5864, 63, '单据', '127.0.0.1', '2019-03-09 16:35:53', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5865, 63, '单据', '127.0.0.1', '2019-03-09 16:37:34', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5866, 63, '单据', '127.0.0.1', '2019-03-09 16:38:03', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5867, 63, '商品', '127.0.0.1', '2019-03-09 16:54:36', 0, '更新,id:563商品', '更新,id:563商品', NULL);
INSERT INTO `smic_log` VALUES (5868, 63, '单据', '127.0.0.1', '2019-03-09 22:35:21', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5869, 63, '单据', '127.0.0.1', '2019-03-09 23:13:40', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5870, 63, '单据', '127.0.0.1', '2019-03-09 23:19:15', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5871, 63, '单据', '127.0.0.1', '2019-03-09 23:27:52', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5872, 63, '单据', '127.0.0.1', '2019-03-09 23:28:43', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5873, 63, '单据', '127.0.0.1', '2019-03-09 23:32:57', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5874, 63, '单据', '127.0.0.1', '2019-03-09 23:35:07', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5875, 63, '单据', '127.0.0.1', '2019-03-09 23:38:10', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5876, 63, '单据', '127.0.0.1', '2019-03-09 23:39:46', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5877, 63, '单据', '127.0.0.1', '2019-03-10 15:48:42', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5878, 63, '单据', '127.0.0.1', '2019-03-10 15:54:30', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5879, 63, '单据', '127.0.0.1', '2019-03-10 15:56:23', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5880, 63, '单据', '127.0.0.1', '2019-03-10 16:05:10', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5881, 63, '单据', '127.0.0.1', '2019-03-10 16:46:13', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5882, 63, '单据', '127.0.0.1', '2019-03-10 16:47:04', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5883, 63, '单据', '127.0.0.1', '2019-03-10 17:00:25', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5884, 63, '单据', '127.0.0.1', '2019-03-10 17:40:13', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5885, 63, '单据', '127.0.0.1', '2019-03-10 17:42:11', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5886, 63, '单据', '127.0.0.1', '2019-03-10 17:44:49', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5887, 63, '单据', '127.0.0.1', '2019-03-10 17:47:23', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5888, 63, '单据', '127.0.0.1', '2019-03-10 17:48:28', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5889, 63, '单据', '127.0.0.1', '2019-03-10 17:49:51', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5890, 63, '单据', '127.0.0.1', '2019-03-10 17:50:19', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5891, 63, '单据', '127.0.0.1', '2019-03-10 18:13:00', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5892, 63, '单据', '127.0.0.1', '2019-03-10 18:16:25', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5893, 63, '单据', '127.0.0.1', '2019-03-10 18:24:54', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5894, 63, '单据', '127.0.0.1', '2019-03-10 18:30:56', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5895, 63, '单据', '127.0.0.1', '2019-03-10 18:43:23', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5896, 63, '单据', '127.0.0.1', '2019-03-10 19:19:45', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5897, 63, '单据', '127.0.0.1', '2019-03-10 19:21:56', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5898, 63, '单据', '127.0.0.1', '2019-03-10 20:00:11', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5899, 63, '单据', '127.0.0.1', '2019-03-10 20:02:01', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5900, 63, '单据', '127.0.0.1', '2019-03-10 20:02:33', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5901, 63, '仓库', '127.0.0.1', '2019-03-15 23:02:54', 0, '更新,id:2仓库', '更新,id:2仓库', NULL);
INSERT INTO `smic_log` VALUES (5902, 63, '仓库', '127.0.0.1', '2019-03-15 23:03:55', 0, '更新,id:2仓库', '更新,id:2仓库', NULL);
INSERT INTO `smic_log` VALUES (5903, 63, '仓库', '127.0.0.1', '2019-03-15 23:04:10', 0, '更新,id:1仓库', '更新,id:1仓库', NULL);
INSERT INTO `smic_log` VALUES (5904, 63, '仓库', '127.0.0.1', '2019-03-15 23:04:15', 0, '更新,id:3仓库', '更新,id:3仓库', NULL);
INSERT INTO `smic_log` VALUES (5905, 63, '单据', '127.0.0.1', '2019-03-15 23:05:40', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5906, 63, '单据', '127.0.0.1', '2019-03-15 23:06:22', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5907, 63, '单据', '127.0.0.1', '2019-03-15 23:06:52', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5908, 63, '单据', '127.0.0.1', '2019-03-15 23:08:18', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5909, 63, '单据', '127.0.0.1', '2019-03-15 23:08:33', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5910, 63, '计量单位', '127.0.0.1', '2019-03-15 23:12:39', 0, '新增计量单位', '新增计量单位', NULL);
INSERT INTO `smic_log` VALUES (5911, 63, '单据', '127.0.0.1', '2019-03-15 23:15:30', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5912, 63, '角色', '0:0:0:0:0:0:0:1', '2019-03-17 21:37:05', 0, '新增角色', '新增角色', NULL);
INSERT INTO `smic_log` VALUES (5913, 63, '角色', '0:0:0:0:0:0:0:1', '2019-03-17 23:26:30', 0, '新增角色', '新增角色', NULL);
INSERT INTO `smic_log` VALUES (5914, 63, '商家', '127.0.0.1', '2019-03-18 22:38:21', 0, '新增商家', '新增商家', 1);
INSERT INTO `smic_log` VALUES (5915, 63, '商家', '127.0.0.1', '2019-03-18 22:38:33', 0, '新增商家', '新增商家', 1);
INSERT INTO `smic_log` VALUES (5916, 63, '仓库', '127.0.0.1', '2019-03-18 22:38:39', 0, '新增仓库', '新增仓库', 1);
INSERT INTO `smic_log` VALUES (5917, 63, '账户', '127.0.0.1', '2019-03-18 22:38:58', 0, '新增账户', '新增账户', 1);
INSERT INTO `smic_log` VALUES (5918, 63, '经手人', '127.0.0.1', '2019-03-18 22:45:08', 0, '新增经手人', '新增经手人', 1);
INSERT INTO `smic_log` VALUES (5919, 63, '商品', '127.0.0.1', '2019-03-18 23:07:31', 0, '新增商品', '新增商品', 1);
INSERT INTO `smic_log` VALUES (5920, 63, '商家', '127.0.0.1', '2019-03-18 23:38:47', 0, '新增商家', '新增商家', 1);
INSERT INTO `smic_log` VALUES (5921, 63, '收支项目', '127.0.0.1', '2019-03-18 23:39:09', 0, '新增收支项目', '新增收支项目', 1);
INSERT INTO `smic_log` VALUES (5922, 63, '计量单位', '127.0.0.1', '2019-03-18 23:49:08', 0, '新增计量单位', '新增计量单位', 1);
INSERT INTO `smic_log` VALUES (5923, 63, '关联关系', '127.0.0.1', '2019-03-18 23:49:31', 0, '新增关联关系', '新增关联关系', 1);
INSERT INTO `smic_log` VALUES (5924, 63, '商家', '127.0.0.1', '2019-03-19 21:57:45', 0, '新增商家', '新增商家', 1);
INSERT INTO `smic_log` VALUES (5925, 63, '关联关系', '127.0.0.1', '2019-03-19 22:00:49', 0, '更新,id:3关联关系', '更新,id:3关联关系', 1);
INSERT INTO `smic_log` VALUES (5926, 63, '关联关系', '127.0.0.1', '2019-03-19 22:01:14', 0, '更新,id:7关联关系', '更新,id:7关联关系', 1);
INSERT INTO `smic_log` VALUES (5927, 63, '关联关系', '127.0.0.1', '2019-03-19 22:01:21', 0, '更新,id:7关联关系', '更新,id:7关联关系', 1);
INSERT INTO `smic_log` VALUES (5928, 63, '关联关系', '127.0.0.1', '2019-03-19 22:05:11', 0, '新增关联关系', '新增关联关系', 1);
INSERT INTO `smic_log` VALUES (5933, 96, '商品', '127.0.0.1', '2019-03-19 22:08:46', 0, '更新,id:564商品', '更新,id:564商品', 1);
INSERT INTO `smic_log` VALUES (5934, 96, '单据', '127.0.0.1', '2019-03-19 22:10:17', 0, '新增单据', '新增单据', 1);
INSERT INTO `smic_log` VALUES (5935, 96, '单据', '127.0.0.1', '2019-03-19 22:10:35', 0, '新增单据', '新增单据', 1);
INSERT INTO `smic_log` VALUES (5936, 96, '单据', '127.0.0.1', '2019-03-19 22:11:39', 0, '新增单据', '新增单据', 1);
INSERT INTO `smic_log` VALUES (5937, 96, '单据', '127.0.0.1', '2019-03-19 22:12:04', 0, '新增单据', '新增单据', 1);
INSERT INTO `smic_log` VALUES (5938, 96, '单据', '127.0.0.1', '2019-03-19 22:12:18', 0, '新增单据', '新增单据', 1);
INSERT INTO `smic_log` VALUES (5939, 96, '单据', '127.0.0.1', '2019-03-19 22:12:29', 0, '新增单据', '新增单据', 1);
INSERT INTO `smic_log` VALUES (5940, 96, '单据', '127.0.0.1', '2019-03-19 22:12:43', 0, '新增单据', '新增单据', 1);
INSERT INTO `smic_log` VALUES (5941, 96, '单据', '127.0.0.1', '2019-03-19 22:12:53', 0, '新增单据', '新增单据', 1);
INSERT INTO `smic_log` VALUES (5942, 96, '单据', '127.0.0.1', '2019-03-19 22:13:20', 0, '新增单据', '新增单据', 1);
INSERT INTO `smic_log` VALUES (5943, 96, '单据', '127.0.0.1', '2019-03-19 22:13:34', 0, '新增单据', '新增单据', 1);
INSERT INTO `smic_log` VALUES (5944, 96, '收支项目', '127.0.0.1', '2019-03-19 22:14:18', 0, '新增收支项目', '新增收支项目', 1);
INSERT INTO `smic_log` VALUES (5945, 96, '经手人', '127.0.0.1', '2019-03-19 22:14:33', 0, '新增经手人', '新增经手人', 1);
INSERT INTO `smic_log` VALUES (5946, 96, '财务', '127.0.0.1', '2019-03-19 22:14:50', 0, '新增财务', '新增财务', 1);
INSERT INTO `smic_log` VALUES (5947, 96, '财务', '127.0.0.1', '2019-03-19 22:15:09', 0, '新增财务', '新增财务', 1);
INSERT INTO `smic_log` VALUES (5948, 96, '财务', '127.0.0.1', '2019-03-19 22:15:22', 0, '新增财务', '新增财务', 1);
INSERT INTO `smic_log` VALUES (5949, 96, '财务', '127.0.0.1', '2019-03-19 22:15:36', 0, '新增财务', '新增财务', 1);
INSERT INTO `smic_log` VALUES (5950, 96, '财务', '127.0.0.1', '2019-03-19 22:16:04', 0, '新增财务', '新增财务', 1);
INSERT INTO `smic_log` VALUES (5951, 96, '商品', '127.0.0.1', '2019-03-19 22:35:56', 0, '新增商品', '新增商品', 1);
INSERT INTO `smic_log` VALUES (5952, 96, '商品', '127.0.0.1', '2019-03-19 22:36:03', 0, '更新,id:565商品', '更新,id:565商品', 1);
INSERT INTO `smic_log` VALUES (5953, 96, '商品', '127.0.0.1', '2019-03-19 22:36:11', 0, '更新,id:565商品', '更新,id:565商品', 1);
INSERT INTO `smic_log` VALUES (5954, 96, '商品', '127.0.0.1', '2019-03-19 22:36:24', 0, '更新,id:565商品', '更新,id:565商品', 1);
INSERT INTO `smic_log` VALUES (5955, 96, '商品', '127.0.0.1', '2019-03-19 22:37:17', 0, '更新,id:565商品', '更新,id:565商品', 1);
INSERT INTO `smic_log` VALUES (5956, 96, '商品', '127.0.0.1', '2019-03-19 22:44:12', 0, '更新,id:565商品', '更新,id:565商品', 1);
INSERT INTO `smic_log` VALUES (5957, 96, '商品', '127.0.0.1', '2019-03-19 22:44:18', 0, '更新,id:565商品', '更新,id:565商品', 1);
INSERT INTO `smic_log` VALUES (5958, 96, '商品', '127.0.0.1', '2019-03-19 22:44:23', 0, '更新,id:565商品', '更新,id:565商品', 1);
INSERT INTO `smic_log` VALUES (5959, 63, '单据', '127.0.0.1', '2019-03-19 22:48:07', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5960, 63, '单据', '127.0.0.1', '2019-03-19 22:48:22', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5961, 63, '单据', '127.0.0.1', '2019-03-19 22:48:40', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5962, 63, '商家', '127.0.0.1', '2019-03-21 23:50:49', 0, '新增商家', '新增商家', NULL);
INSERT INTO `smic_log` VALUES (5963, 63, '商家', '127.0.0.1', '2019-03-21 23:51:05', 0, '批量删除,id集:51商家', '批量删除,id集:51商家', NULL);
INSERT INTO `smic_log` VALUES (5964, 63, NULL, '127.0.0.1', '2019-03-21 23:57:46', 0, '删除,id:101null', '删除,id:101null', NULL);
INSERT INTO `smic_log` VALUES (5965, 63, '单据', '127.0.0.1', '2019-03-21 23:58:56', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5966, 63, '单据', '127.0.0.1', '2019-03-21 23:59:18', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (5967, 63, '财务', '127.0.0.1', '2019-03-21 23:59:38', 0, '新增财务', '新增财务', NULL);
INSERT INTO `smic_log` VALUES (5968, 63, '角色', '127.0.0.1', '2019-03-24 23:51:47', 0, '新增角色', '新增角色', NULL);
INSERT INTO `smic_log` VALUES (5969, 63, '角色', '127.0.0.1', '2019-03-29 00:07:16', 0, '新增角色', '新增角色', NULL);
INSERT INTO `smic_log` VALUES (5970, 63, '关联关系', '127.0.0.1', '2019-03-29 00:07:21', 0, '新增关联关系', '新增关联关系', NULL);
INSERT INTO `smic_log` VALUES (5971, 63, '关联关系', '127.0.0.1', '2019-03-29 00:07:52', 0, '新增关联关系', '新增关联关系', NULL);
INSERT INTO `smic_log` VALUES (5972, 63, '关联关系', '127.0.0.1', '2019-03-29 00:08:07', 0, '修改,id:32关联关系', '修改,id:32关联关系', NULL);
INSERT INTO `smic_log` VALUES (5973, 63, '角色', '127.0.0.1', '2019-03-29 00:08:21', 0, '批量删除,id集:9角色', '批量删除,id集:9角色', NULL);
INSERT INTO `smic_log` VALUES (5974, 63, '角色', '127.0.0.1', '2019-03-29 00:08:24', 0, '删除,id:8角色', '删除,id:8角色', NULL);
INSERT INTO `smic_log` VALUES (5975, 63, '角色', '127.0.0.1', '2019-03-29 00:08:26', 0, '删除,id:7角色', '删除,id:7角色', NULL);
INSERT INTO `smic_log` VALUES (5976, 63, '角色', '127.0.0.1', '2019-03-29 00:08:27', 0, '删除,id:6角色', '删除,id:6角色', NULL);
INSERT INTO `smic_log` VALUES (5977, 63, '关联关系', '127.0.0.1', '2019-03-29 00:08:35', 0, '修改,id:32关联关系', '修改,id:32关联关系', NULL);
INSERT INTO `smic_log` VALUES (5978, 113, '角色', '127.0.0.1', '2019-03-29 00:10:02', 0, '新增角色', '新增角色', 10);
INSERT INTO `smic_log` VALUES (5979, 113, '角色', '127.0.0.1', '2019-03-29 00:11:34', 0, '新增角色', '新增角色', 113);
INSERT INTO `smic_log` VALUES (5980, 113, '角色', '127.0.0.1', '2019-03-29 00:11:39', 0, '删除,id:12角色', '删除,id:12角色', 113);
INSERT INTO `smic_log` VALUES (5981, 115, '用户', '127.0.0.1', '2019-03-31 21:18:29', 0, '新增用户', '新增用户', 115);
INSERT INTO `smic_log` VALUES (5983, 63, '用户', '127.0.0.1', '2019-03-31 21:49:38', 0, '新增用户', '新增用户', NULL);
INSERT INTO `smic_log` VALUES (5984, 63, '用户', '127.0.0.1', '2019-03-31 21:49:49', 0, '删除,id:118用户', '删除,id:118用户', NULL);
INSERT INTO `smic_log` VALUES (6026, 63, '用户', '127.0.0.1', '2019-03-31 22:18:21', 0, '修改,id:63用户', '修改,id:63用户', NULL);
INSERT INTO `smic_log` VALUES (6046, 120, '关联关系', '127.0.0.1', '2019-03-31 23:17:23', 0, '新增关联关系', '新增关联关系', NULL);
INSERT INTO `smic_log` VALUES (6047, 120, '关联关系', '127.0.0.1', '2019-03-31 23:18:10', 0, '新增关联关系', '新增关联关系', NULL);
INSERT INTO `smic_log` VALUES (6048, 63, '角色', '127.0.0.1', '2019-04-01 22:36:16', 0, '新增角色', '新增角色', NULL);
INSERT INTO `smic_log` VALUES (6049, 63, '关联关系', '127.0.0.1', '2019-04-01 22:36:27', 0, '修改,id:17关联关系', '修改,id:17关联关系', NULL);
INSERT INTO `smic_log` VALUES (6050, 63, '关联关系', '127.0.0.1', '2019-04-01 22:36:50', 0, '修改,id:17关联关系', '修改,id:17关联关系', NULL);
INSERT INTO `smic_log` VALUES (6051, 63, '关联关系', '127.0.0.1', '2019-04-01 22:37:14', 0, '修改,id:17关联关系', '修改,id:17关联关系', NULL);
INSERT INTO `smic_log` VALUES (6052, 63, '关联关系', '127.0.0.1', '2019-04-01 22:39:07', 0, '修改,id:17关联关系', '修改,id:17关联关系', NULL);
INSERT INTO `smic_log` VALUES (6053, 63, '关联关系', '127.0.0.1', '2019-04-01 22:39:14', 0, '修改,id:17关联关系', '修改,id:17关联关系', NULL);
INSERT INTO `smic_log` VALUES (6054, 63, '关联关系', '127.0.0.1', '2019-04-01 22:39:52', 0, '新增关联关系', '新增关联关系', NULL);
INSERT INTO `smic_log` VALUES (6055, 63, '关联关系', '127.0.0.1', '2019-04-01 22:41:39', 0, '修改,id:17关联关系', '修改,id:17关联关系', NULL);
INSERT INTO `smic_log` VALUES (6056, 63, '关联关系', '127.0.0.1', '2019-04-01 22:49:09', 0, '修改,id:17关联关系', '修改,id:17关联关系', NULL);
INSERT INTO `smic_log` VALUES (6057, 63, '关联关系', '127.0.0.1', '2019-04-01 22:49:41', 0, '修改,id:17关联关系', '修改,id:17关联关系', NULL);
INSERT INTO `smic_log` VALUES (6058, 63, '关联关系', '127.0.0.1', '2019-04-01 23:16:20', 0, '新增关联关系', '新增关联关系', NULL);
INSERT INTO `smic_log` VALUES (6059, 63, '关联关系', '127.0.0.1', '2019-04-01 23:20:23', 0, '新增关联关系', '新增关联关系', NULL);
INSERT INTO `smic_log` VALUES (6060, 63, '关联关系', '127.0.0.1', '2019-04-01 23:22:00', 0, '新增关联关系', '新增关联关系', NULL);
INSERT INTO `smic_log` VALUES (6061, 63, '关联关系', '127.0.0.1', '2019-04-01 23:23:26', 0, '新增关联关系', '新增关联关系', NULL);
INSERT INTO `smic_log` VALUES (6062, 63, '关联关系', '127.0.0.1', '2019-04-01 23:25:33', 0, '修改,id:45关联关系', '修改,id:45关联关系', NULL);
INSERT INTO `smic_log` VALUES (6063, 63, '关联关系', '127.0.0.1', '2019-04-01 23:34:27', 0, '新增关联关系', '新增关联关系', NULL);
INSERT INTO `smic_log` VALUES (6064, 63, '关联关系', '127.0.0.1', '2019-04-01 23:39:52', 0, '修改,id:46关联关系', '修改,id:46关联关系', NULL);
INSERT INTO `smic_log` VALUES (6065, 63, '关联关系', '127.0.0.1', '2019-04-01 23:43:21', 0, '新增关联关系', '新增关联关系', NULL);
INSERT INTO `smic_log` VALUES (6066, 63, '关联关系', '127.0.0.1', '2019-04-01 23:43:43', 0, '修改,id:48关联关系', '修改,id:48关联关系', NULL);
INSERT INTO `smic_log` VALUES (6067, 63, '关联关系', '127.0.0.1', '2019-04-01 23:43:58', 0, '修改,id:48关联关系', '修改,id:48关联关系', NULL);
INSERT INTO `smic_log` VALUES (6069, 63, '关联关系', '127.0.0.1', '2019-04-01 23:46:01', 0, '修改,id:48关联关系', '修改,id:48关联关系', NULL);
INSERT INTO `smic_log` VALUES (6070, 63, '关联关系', '127.0.0.1', '2019-04-01 23:46:26', 0, '修改,id:21关联关系', '修改,id:21关联关系', NULL);
INSERT INTO `smic_log` VALUES (6071, 63, '关联关系', '127.0.0.1', '2019-04-01 23:48:17', 0, '修改,id:48关联关系', '修改,id:48关联关系', NULL);
INSERT INTO `smic_log` VALUES (6072, 63, '关联关系', '127.0.0.1', '2019-04-01 23:49:09', 0, '修改,id:48关联关系', '修改,id:48关联关系', NULL);
INSERT INTO `smic_log` VALUES (6073, 115, '用户', '127.0.0.1', '2019-04-02 22:21:51', 0, '删除,id:116用户', '删除,id:116用户', 115);
INSERT INTO `smic_log` VALUES (6074, 115, '用户', '127.0.0.1', '2019-04-02 22:21:58', 0, '新增用户', '新增用户', 115);
INSERT INTO `smic_log` VALUES (6075, 120, '关联关系', '127.0.0.1', '2019-04-02 22:23:53', 0, '修改,id:16关联关系', '修改,id:16关联关系', NULL);
INSERT INTO `smic_log` VALUES (6076, 120, '关联关系', '127.0.0.1', '2019-04-02 22:24:16', 0, '新增关联关系', '新增关联关系', NULL);
INSERT INTO `smic_log` VALUES (6077, 115, '商品类型', '127.0.0.1', '2019-04-02 22:28:07', 0, '新增商品类型', '新增商品类型', 115);
INSERT INTO `smic_log` VALUES (6078, 115, '商品', '127.0.0.1', '2019-04-02 22:28:28', 0, '新增商品', '新增商品', 115);
INSERT INTO `smic_log` VALUES (6079, 115, '商家', '127.0.0.1', '2019-04-02 22:28:37', 0, '新增商家', '新增商家', 115);
INSERT INTO `smic_log` VALUES (6080, 115, '仓库', '127.0.0.1', '2019-04-02 22:28:45', 0, '新增仓库', '新增仓库', 115);
INSERT INTO `smic_log` VALUES (6081, 115, '账户', '127.0.0.1', '2019-04-02 22:28:56', 0, '新增账户', '新增账户', 115);
INSERT INTO `smic_log` VALUES (6082, 115, '账户', '127.0.0.1', '2019-04-02 22:28:57', 0, '修改,id:16账户', '修改,id:16账户', 115);
INSERT INTO `smic_log` VALUES (6083, 115, '经手人', '127.0.0.1', '2019-04-02 22:29:11', 0, '新增经手人', '新增经手人', 115);
INSERT INTO `smic_log` VALUES (6084, 115, '关联关系', '127.0.0.1', '2019-04-02 22:29:28', 0, '新增关联关系', '新增关联关系', 115);
INSERT INTO `smic_log` VALUES (6085, 115, '关联关系', '127.0.0.1', '2019-04-02 22:29:46', 0, '新增关联关系', '新增关联关系', 115);
INSERT INTO `smic_log` VALUES (6086, 115, '单据', '127.0.0.1', '2019-04-02 22:30:01', 0, '新增单据', '新增单据', 115);
INSERT INTO `smic_log` VALUES (6087, 115, '单据明细', '127.0.0.1', '2019-04-02 22:30:01', 0, '新增单据明细', '新增单据明细', 115);
INSERT INTO `smic_log` VALUES (6088, 115, '单据明细', '127.0.0.1', '2019-04-02 22:30:01', 0, '删除,id:单据明细', '删除,id:单据明细', 115);
INSERT INTO `smic_log` VALUES (6089, 115, '单据', '127.0.0.1', '2019-04-02 22:30:20', 0, '新增单据', '新增单据', 115);
INSERT INTO `smic_log` VALUES (6090, 115, '单据明细', '127.0.0.1', '2019-04-02 22:30:20', 0, '新增单据明细', '新增单据明细', 115);
INSERT INTO `smic_log` VALUES (6091, 115, '单据明细', '127.0.0.1', '2019-04-02 22:30:20', 0, '删除,id:单据明细', '删除,id:单据明细', 115);
INSERT INTO `smic_log` VALUES (6092, 63, '单据', '127.0.0.1', '2019-04-02 22:32:00', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (6093, 63, '单据明细', '127.0.0.1', '2019-04-02 22:32:00', 0, '新增单据明细', '新增单据明细', NULL);
INSERT INTO `smic_log` VALUES (6094, 63, '单据明细', '127.0.0.1', '2019-04-02 22:32:00', 0, '删除,id:单据明细', '删除,id:单据明细', NULL);
INSERT INTO `smic_log` VALUES (6095, 63, '单据', '127.0.0.1', '2019-04-02 22:39:44', 0, '删除,id:178单据', '删除,id:178单据', NULL);
INSERT INTO `smic_log` VALUES (6096, 63, '单据', '127.0.0.1', '2019-04-02 22:39:45', 0, '删除,id:178单据', '删除,id:178单据', NULL);
INSERT INTO `smic_log` VALUES (6097, 63, '角色', '127.0.0.1', '2019-04-02 22:39:55', 0, '新增角色', '新增角色', NULL);
INSERT INTO `smic_log` VALUES (6098, 63, '序列号', '127.0.0.1', '2019-04-02 22:39:57', 0, '删除,id:14序列号', '删除,id:14序列号', NULL);
INSERT INTO `smic_log` VALUES (6099, 63, '单据', '127.0.0.1', '2019-04-04 23:06:58', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (6100, 63, '单据明细', '127.0.0.1', '2019-04-04 23:06:58', 0, '新增单据明细', '新增单据明细', NULL);
INSERT INTO `smic_log` VALUES (6101, 63, '单据明细', '127.0.0.1', '2019-04-04 23:06:58', 0, '删除,id:单据明细', '删除,id:单据明细', NULL);
INSERT INTO `smic_log` VALUES (6102, 115, '关联关系', '127.0.0.1', '2019-04-05 17:13:49', 0, '修改,id:54关联关系', '修改,id:54关联关系', 115);
INSERT INTO `smic_log` VALUES (6103, 115, '角色', '127.0.0.1', '2019-04-05 17:14:12', 0, '新增角色', '新增角色', 115);
INSERT INTO `smic_log` VALUES (6104, 115, '商家', '127.0.0.1', '2019-04-05 17:14:26', 0, '新增商家', '新增商家', 115);
INSERT INTO `smic_log` VALUES (6105, 115, '关联关系', '127.0.0.1', '2019-04-05 17:14:39', 0, '新增关联关系', '新增关联关系', 115);
INSERT INTO `smic_log` VALUES (6106, 115, '关联关系', '127.0.0.1', '2019-04-05 17:14:52', 0, '修改,id:54关联关系', '修改,id:54关联关系', 115);
INSERT INTO `smic_log` VALUES (6107, 115, '关联关系', '127.0.0.1', '2019-04-05 17:15:20', 0, '新增关联关系', '新增关联关系', 115);
INSERT INTO `smic_log` VALUES (6108, 115, '关联关系', '127.0.0.1', '2019-04-05 17:15:32', 0, '新增关联关系', '新增关联关系', 115);
INSERT INTO `smic_log` VALUES (6109, 115, '用户', '127.0.0.1', '2019-04-05 17:19:53', 0, '修改,id:115用户', '修改,id:115用户', 115);
INSERT INTO `smic_log` VALUES (6110, 115, '用户', '127.0.0.1', '2019-04-05 17:20:05', 0, '修改,id:115用户', '修改,id:115用户', 115);
INSERT INTO `smic_log` VALUES (6111, 115, '关联关系', '127.0.0.1', '2019-04-05 17:20:56', 0, '修改,id:56关联关系', '修改,id:56关联关系', 115);
INSERT INTO `smic_log` VALUES (6112, 115, '关联关系', '127.0.0.1', '2019-04-05 17:21:31', 0, '修改,id:56关联关系', '修改,id:56关联关系', 115);
INSERT INTO `smic_log` VALUES (6113, 63, '单据', '127.0.0.1', '2019-04-07 20:23:23', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (6114, 63, '单据明细', '127.0.0.1', '2019-04-07 20:23:23', 0, '新增单据明细', '新增单据明细', NULL);
INSERT INTO `smic_log` VALUES (6115, 63, '单据明细', '127.0.0.1', '2019-04-07 20:23:23', 0, '删除,id:单据明细', '删除,id:单据明细', NULL);
INSERT INTO `smic_log` VALUES (6116, 63, '单据', '127.0.0.1', '2019-04-07 20:25:30', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (6117, 63, '单据明细', '127.0.0.1', '2019-04-07 20:25:30', 0, '新增单据明细', '新增单据明细', NULL);
INSERT INTO `smic_log` VALUES (6118, 63, '单据明细', '127.0.0.1', '2019-04-07 20:25:30', 0, '删除,id:单据明细', '删除,id:单据明细', NULL);
INSERT INTO `smic_log` VALUES (6119, 63, '单据', '127.0.0.1', '2019-04-07 20:35:00', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (6120, 63, '单据明细', '127.0.0.1', '2019-04-07 20:35:01', 0, '新增单据明细', '新增单据明细', NULL);
INSERT INTO `smic_log` VALUES (6121, 63, '单据明细', '127.0.0.1', '2019-04-07 20:35:01', 0, '删除,id:单据明细', '删除,id:单据明细', NULL);
INSERT INTO `smic_log` VALUES (6122, 63, '单据', '127.0.0.1', '2019-04-07 20:44:09', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (6123, 63, '单据明细', '127.0.0.1', '2019-04-07 20:44:09', 0, '新增单据明细', '新增单据明细', NULL);
INSERT INTO `smic_log` VALUES (6124, 63, '单据明细', '127.0.0.1', '2019-04-07 20:44:09', 0, '删除,id:单据明细', '删除,id:单据明细', NULL);
INSERT INTO `smic_log` VALUES (6125, 63, '单据', '127.0.0.1', '2019-04-07 20:44:25', 0, '删除,id:184单据', '删除,id:184单据', NULL);
INSERT INTO `smic_log` VALUES (6126, 63, '单据', '127.0.0.1', '2019-04-07 20:44:25', 0, '删除,id:184单据', '删除,id:184单据', NULL);
INSERT INTO `smic_log` VALUES (6127, 63, '单据', '127.0.0.1', '2019-04-07 20:44:29', 0, '删除,id:185单据', '删除,id:185单据', NULL);
INSERT INTO `smic_log` VALUES (6128, 63, '单据', '127.0.0.1', '2019-04-07 20:44:29', 0, '删除,id:185单据', '删除,id:185单据', NULL);
INSERT INTO `smic_log` VALUES (6129, 63, '单据', '127.0.0.1', '2019-04-07 20:44:32', 0, '删除,id:186单据', '删除,id:186单据', NULL);
INSERT INTO `smic_log` VALUES (6130, 63, '单据', '127.0.0.1', '2019-04-07 20:44:32', 0, '删除,id:186单据', '删除,id:186单据', NULL);
INSERT INTO `smic_log` VALUES (6131, 63, '单据', '127.0.0.1', '2019-04-07 20:44:58', 0, '删除,id:183,182单据', '删除,id:183,182单据', NULL);
INSERT INTO `smic_log` VALUES (6132, 63, '单据', '127.0.0.1', '2019-04-07 20:44:58', 0, '删除,id:183单据', '删除,id:183单据', NULL);
INSERT INTO `smic_log` VALUES (6133, 63, '单据', '127.0.0.1', '2019-04-07 20:44:58', 0, '删除,id:183单据', '删除,id:183单据', NULL);
INSERT INTO `smic_log` VALUES (6134, 63, '单据', '127.0.0.1', '2019-04-07 20:44:58', 0, '删除,id:182单据', '删除,id:182单据', NULL);
INSERT INTO `smic_log` VALUES (6135, 63, '单据', '127.0.0.1', '2019-04-07 20:44:58', 0, '删除,id:182单据', '删除,id:182单据', NULL);
INSERT INTO `smic_log` VALUES (6136, 63, '单据', '127.0.0.1', '2019-04-07 20:45:09', 0, '删除,id:179单据', '删除,id:179单据', NULL);
INSERT INTO `smic_log` VALUES (6137, 63, '单据', '127.0.0.1', '2019-04-07 20:45:09', 0, '删除,id:179单据', '删除,id:179单据', NULL);
INSERT INTO `smic_log` VALUES (6138, 63, '单据', '127.0.0.1', '2019-04-07 20:51:51', 0, '新增单据', '新增单据', NULL);
INSERT INTO `smic_log` VALUES (6139, 63, '单据明细', '127.0.0.1', '2019-04-07 20:51:51', 0, '新增单据明细', '新增单据明细', NULL);
INSERT INTO `smic_log` VALUES (6140, 63, '单据明细', '127.0.0.1', '2019-04-07 20:51:51', 0, '删除,id:单据明细', '删除,id:单据明细', NULL);
INSERT INTO `smic_log` VALUES (6141, 63, '单据', '127.0.0.1', '2019-04-07 22:36:48', 0, '修改,id:188单据', '修改,id:188单据', NULL);
INSERT INTO `smic_log` VALUES (6142, 63, '单据明细', '127.0.0.1', '2019-04-07 22:36:48', 0, '新增单据明细', '新增单据明细', NULL);
INSERT INTO `smic_log` VALUES (6143, 63, '单据明细', '127.0.0.1', '2019-04-07 22:36:48', 0, '删除,id:单据明细', '删除,id:单据明细', NULL);
INSERT INTO `smic_log` VALUES (6144, 63, '单据', '127.0.0.1', '2019-04-07 22:38:23', 0, '修改,id:188单据', '修改,id:188单据', NULL);
INSERT INTO `smic_log` VALUES (6145, 63, '单据明细', '127.0.0.1', '2019-04-07 22:38:24', 0, '新增单据明细', '新增单据明细', NULL);
INSERT INTO `smic_log` VALUES (6146, 63, '单据明细', '127.0.0.1', '2019-04-07 22:38:24', 0, '删除,id:单据明细', '删除,id:单据明细', NULL);
INSERT INTO `smic_log` VALUES (6147, 63, '单据', '127.0.0.1', '2019-04-07 22:39:59', 0, '修改,id:188单据', '修改,id:188单据', NULL);
INSERT INTO `smic_log` VALUES (6148, 63, '单据明细', '127.0.0.1', '2019-04-07 22:39:59', 0, '新增单据明细', '新增单据明细', NULL);
INSERT INTO `smic_log` VALUES (6149, 63, '单据明细', '127.0.0.1', '2019-04-07 22:39:59', 0, '删除,id:单据明细', '删除,id:单据明细', NULL);
INSERT INTO `smic_log` VALUES (6150, 63, '商品类型', '127.0.0.1', '2019-04-10 22:18:12', 0, '新增商品类型', '新增商品类型', 63);
INSERT INTO `smic_log` VALUES (6151, 63, '商品', '127.0.0.1', '2019-04-10 22:18:23', 0, '新增商品', '新增商品', 63);
INSERT INTO `smic_log` VALUES (6152, 63, '商家', '127.0.0.1', '2019-04-10 22:18:33', 0, '新增商家', '新增商家', 63);
INSERT INTO `smic_log` VALUES (6153, 63, '商家', '127.0.0.1', '2019-04-10 22:18:41', 0, '新增商家', '新增商家', 63);
INSERT INTO `smic_log` VALUES (6154, 63, '账户', '127.0.0.1', '2019-04-10 22:18:54', 0, '新增账户', '新增账户', 63);
INSERT INTO `smic_log` VALUES (6155, 63, '账户', '127.0.0.1', '2019-04-10 22:19:19', 0, '修改,id:17账户', '修改,id:17账户', 63);
INSERT INTO `smic_log` VALUES (6156, 63, '仓库', '127.0.0.1', '2019-04-10 22:20:07', 0, '新增仓库', '新增仓库', 63);
INSERT INTO `smic_log` VALUES (6157, 63, '关联关系', '127.0.0.1', '2019-04-10 22:20:19', 0, '修改,id:18关联关系', '修改,id:18关联关系', 63);
INSERT INTO `smic_log` VALUES (6170, 63, '商品', '127.0.0.1', '2019-04-10 22:24:35', 0, '新增商品', '新增商品', 63);
INSERT INTO `smic_log` VALUES (6179, 63, '商品', '127.0.0.1', '2019-04-10 22:25:23', 0, '修改,id:568商品', '修改,id:568商品', 63);
INSERT INTO `smic_log` VALUES (6180, 63, '商品', '127.0.0.1', '2019-04-10 22:25:32', 0, '修改,id:569商品', '修改,id:569商品', 63);
INSERT INTO `smic_log` VALUES (6181, 63, '单据', '127.0.0.1', '2019-04-10 22:25:49', 0, '新增单据', '新增单据', 63);
INSERT INTO `smic_log` VALUES (6182, 63, '单据明细', '127.0.0.1', '2019-04-10 22:25:49', 0, '新增单据明细', '新增单据明细', 63);
INSERT INTO `smic_log` VALUES (6183, 63, '单据明细', '127.0.0.1', '2019-04-10 22:25:49', 0, '删除,id:单据明细', '删除,id:单据明细', 63);
INSERT INTO `smic_log` VALUES (6184, 63, '单据', '127.0.0.1', '2019-04-10 22:26:00', 0, '修改,id:189单据', '修改,id:189单据', 63);
INSERT INTO `smic_log` VALUES (6185, 63, '单据明细', '127.0.0.1', '2019-04-10 22:26:00', 0, '新增单据明细', '新增单据明细', 63);
INSERT INTO `smic_log` VALUES (6186, 63, '单据明细', '127.0.0.1', '2019-04-10 22:26:00', 0, '删除,id:单据明细', '删除,id:单据明细', 63);
INSERT INTO `smic_log` VALUES (6187, 63, '用户', '127.0.0.1', '2019-04-13 19:38:11', 0, '新增用户', '新增用户', 63);
INSERT INTO `smic_log` VALUES (6188, 63, '用户', '127.0.0.1', '2019-04-13 19:38:22', 0, '删除,id:122用户', '删除,id:122用户', 63);
INSERT INTO `smic_log` VALUES (6189, 63, '单据', '127.0.0.1', '2019-04-13 19:57:43', 0, '新增单据', '新增单据', 63);
INSERT INTO `smic_log` VALUES (6190, 63, '单据明细', '127.0.0.1', '2019-04-13 19:57:43', 0, '新增单据明细', '新增单据明细', 63);
INSERT INTO `smic_log` VALUES (6191, 63, '单据明细', '127.0.0.1', '2019-04-13 19:57:43', 0, '删除,id:单据明细', '删除,id:单据明细', 63);
INSERT INTO `smic_log` VALUES (6192, 63, '单据', '127.0.0.1', '2019-04-13 19:57:58', 0, '新增单据', '新增单据', 63);
INSERT INTO `smic_log` VALUES (6193, 63, '单据明细', '127.0.0.1', '2019-04-13 19:57:58', 0, '新增单据明细', '新增单据明细', 63);
INSERT INTO `smic_log` VALUES (6194, 63, '单据明细', '127.0.0.1', '2019-04-13 19:57:58', 0, '删除,id:单据明细', '删除,id:单据明细', 63);
INSERT INTO `smic_log` VALUES (6195, 63, '单据', '127.0.0.1', '2019-04-13 19:58:02', 0, '删除,id:190单据', '删除,id:190单据', 63);
INSERT INTO `smic_log` VALUES (6196, 63, '单据', '127.0.0.1', '2019-04-13 19:58:02', 0, '删除,id:190单据', '删除,id:190单据', 63);
INSERT INTO `smic_log` VALUES (6197, 63, '商品', '127.0.0.1', '2019-04-13 19:58:23', 0, '新增商品', '新增商品', 63);
INSERT INTO `smic_log` VALUES (6198, 63, '单据', '127.0.0.1', '2019-04-20 00:36:23', 0, '新增单据', '新增单据', 63);
INSERT INTO `smic_log` VALUES (6199, 63, '单据明细', '127.0.0.1', '2019-04-20 00:36:24', 0, '新增单据明细', '新增单据明细', 63);
INSERT INTO `smic_log` VALUES (6200, 63, '单据明细', '127.0.0.1', '2019-04-20 00:36:24', 0, '删除,id:单据明细', '删除,id:单据明细', 63);
INSERT INTO `smic_log` VALUES (6201, 63, '商家', '127.0.0.1', '2019-04-29 23:39:40', 0, '修改,id:58商家', '修改,id:58商家', 63);
INSERT INTO `smic_log` VALUES (6202, 63, '关联关系', '127.0.0.1', '2019-04-29 23:40:06', 0, '修改,id:27关联关系', '修改,id:27关联关系', 63);
INSERT INTO `smic_log` VALUES (6203, 63, '商品', '127.0.0.1', '2019-04-29 23:40:44', 0, '修改,id:569商品', '修改,id:569商品', 63);
INSERT INTO `smic_log` VALUES (6204, 63, '单据', '127.0.0.1', '2019-04-29 23:41:02', 0, '新增单据', '新增单据', 63);
INSERT INTO `smic_log` VALUES (6205, 63, '单据明细', '127.0.0.1', '2019-04-29 23:41:02', 0, '新增单据明细', '新增单据明细', 63);
INSERT INTO `smic_log` VALUES (6206, 63, '单据明细', '127.0.0.1', '2019-04-29 23:41:02', 0, '删除,id:单据明细', '删除,id:单据明细', 63);
INSERT INTO `smic_log` VALUES (6207, 63, '商家', '127.0.0.1', '2019-04-29 23:41:29', 0, '修改,id:58商家', '修改,id:58商家', 63);
INSERT INTO `smic_log` VALUES (6208, 63, '商家', '127.0.0.1', '2019-04-29 23:41:35', 0, '修改,id:58商家', '修改,id:58商家', 63);
INSERT INTO `smic_log` VALUES (6209, 63, '商家', '127.0.0.1', '2019-04-29 23:41:39', 0, '修改,id:58商家', '修改,id:58商家', 63);
INSERT INTO `smic_log` VALUES (6210, 63, '仓库', '127.0.0.1', '2019-04-30 22:31:32', 0, '修改,id:14仓库', '修改,id:14仓库', 63);
INSERT INTO `smic_log` VALUES (6211, 63, '关联关系', '127.0.0.1', '2019-04-30 22:32:09', 0, '修改,id:18关联关系', '修改,id:18关联关系', 63);
INSERT INTO `smic_log` VALUES (6212, 63, '仓库', '127.0.0.1', '2019-04-30 22:32:36', 0, '新增仓库', '新增仓库', 63);
INSERT INTO `smic_log` VALUES (6213, 63, '关联关系', '127.0.0.1', '2019-04-30 22:32:49', 0, '修改,id:18关联关系', '修改,id:18关联关系', 63);
INSERT INTO `smic_log` VALUES (6214, 63, '仓库', '127.0.0.1', '2019-04-30 22:33:04', 0, '修改,id:15仓库', '修改,id:15仓库', 63);
INSERT INTO `smic_log` VALUES (6215, 63, '仓库', '127.0.0.1', '2019-04-30 22:33:04', 0, '修改,id:14仓库', '修改,id:14仓库', 63);
INSERT INTO `smic_log` VALUES (6216, 63, '单据', '127.0.0.1', '2019-04-30 22:33:23', 0, '新增单据', '新增单据', 63);
INSERT INTO `smic_log` VALUES (6217, 63, '单据明细', '127.0.0.1', '2019-04-30 22:33:24', 0, '新增单据明细', '新增单据明细', 63);
INSERT INTO `smic_log` VALUES (6218, 63, '单据明细', '127.0.0.1', '2019-04-30 22:33:24', 0, '删除,id:单据明细', '删除,id:单据明细', 63);
INSERT INTO `smic_log` VALUES (6219, 63, '账户', '127.0.0.1', '2019-04-30 22:34:23', 0, '新增账户', '新增账户', 63);
INSERT INTO `smic_log` VALUES (6220, 63, '单据', '127.0.0.1', '2019-04-30 22:34:45', 0, '新增单据', '新增单据', 63);
INSERT INTO `smic_log` VALUES (6221, 63, '单据明细', '127.0.0.1', '2019-04-30 22:34:45', 0, '新增单据明细', '新增单据明细', 63);
INSERT INTO `smic_log` VALUES (6222, 63, '单据明细', '127.0.0.1', '2019-04-30 22:34:45', 0, '删除,id:单据明细', '删除,id:单据明细', 63);
INSERT INTO `smic_log` VALUES (6223, 63, '单据', '127.0.0.1', '2019-04-30 22:35:53', 0, '新增单据', '新增单据', 63);
INSERT INTO `smic_log` VALUES (6224, 63, '单据明细', '127.0.0.1', '2019-04-30 22:35:53', 0, '新增单据明细', '新增单据明细', 63);
INSERT INTO `smic_log` VALUES (6225, 63, '单据明细', '127.0.0.1', '2019-04-30 22:35:53', 0, '删除,id:单据明细', '删除,id:单据明细', 63);
INSERT INTO `smic_log` VALUES (6226, 120, '功能', '127.0.0.1', '2019-04-30 22:43:37', 0, '新增功能', '新增功能', NULL);
INSERT INTO `smic_log` VALUES (6227, 120, '关联关系', '127.0.0.1', '2019-04-30 22:43:52', 0, '修改,id:5关联关系', '修改,id:5关联关系', NULL);
INSERT INTO `smic_log` VALUES (6228, 120, '功能', '127.0.0.1', '2019-04-30 22:44:46', 0, '修改,id:244功能', '修改,id:244功能', NULL);
INSERT INTO `smic_log` VALUES (6229, 120, '关联关系', '127.0.0.1', '2019-04-30 22:46:03', 0, '修改,id:32关联关系', '修改,id:32关联关系', NULL);
INSERT INTO `smic_log` VALUES (6230, 63, '商品', '127.0.0.1', '2019-04-30 22:47:10', 0, '修改,id:568商品', '修改,id:568商品', 63);
INSERT INTO `smic_log` VALUES (6231, 63, '商品', '127.0.0.1', '2019-04-30 22:47:17', 0, '修改,id:569商品', '修改,id:569商品', 63);
INSERT INTO `smic_log` VALUES (6232, 63, '商品', '127.0.0.1', '2019-04-30 22:47:30', 0, '修改,id:570商品', '修改,id:570商品', 63);
INSERT INTO `smic_log` VALUES (6233, 63, '商家', '127.0.0.1', '2019-04-30 22:48:41', 0, '新增商家', '新增商家', 63);
INSERT INTO `smic_log` VALUES (6234, 63, '商家', '127.0.0.1', '2019-04-30 22:50:03', 0, '新增商家', '新增商家', 63);
INSERT INTO `smic_log` VALUES (6235, 63, '商家', '127.0.0.1', '2019-04-30 22:50:15', 0, '修改,id:60商家', '修改,id:60商家', 63);
INSERT INTO `smic_log` VALUES (6236, 63, '商家', '127.0.0.1', '2019-04-30 22:50:17', 0, '修改,id:60商家', '修改,id:60商家', 63);
INSERT INTO `smic_log` VALUES (6237, 63, '仓库', '127.0.0.1', '2019-04-30 23:04:32', 0, '修改,id:14仓库', '修改,id:14仓库', 63);
INSERT INTO `smic_log` VALUES (6238, 63, '仓库', '127.0.0.1', '2019-04-30 23:04:32', 0, '修改,id:15仓库', '修改,id:15仓库', 63);
INSERT INTO `smic_log` VALUES (6239, 63, '仓库', '127.0.0.1', '2019-04-30 23:04:36', 0, '修改,id:15仓库', '修改,id:15仓库', 63);
INSERT INTO `smic_log` VALUES (6240, 63, '仓库', '127.0.0.1', '2019-04-30 23:04:36', 0, '修改,id:14仓库', '修改,id:14仓库', 63);
INSERT INTO `smic_log` VALUES (6241, 63, '仓库', '127.0.0.1', '2019-04-30 23:09:07', 0, '修改,id:14仓库', '修改,id:14仓库', 63);
INSERT INTO `smic_log` VALUES (6242, 63, '仓库', '127.0.0.1', '2019-04-30 23:09:07', 0, '修改,id:15仓库', '修改,id:15仓库', 63);
INSERT INTO `smic_log` VALUES (6243, 63, '单据', '127.0.0.1', '2019-04-30 23:15:27', 0, '新增单据', '新增单据', 63);
INSERT INTO `smic_log` VALUES (6244, 63, '单据明细', '127.0.0.1', '2019-04-30 23:15:27', 0, '新增单据明细', '新增单据明细', 63);
INSERT INTO `smic_log` VALUES (6245, 63, '单据明细', '127.0.0.1', '2019-04-30 23:15:27', 0, '删除,id:单据明细', '删除,id:单据明细', 63);
INSERT INTO `smic_log` VALUES (6246, 63, '单据', '127.0.0.1', '2019-05-03 11:50:21', 0, '修改,id:196单据', '修改,id:196单据', 63);
INSERT INTO `smic_log` VALUES (6247, 63, '单据明细', '127.0.0.1', '2019-05-03 11:50:21', 0, '新增单据明细', '新增单据明细', 63);
INSERT INTO `smic_log` VALUES (6248, 63, '单据明细', '127.0.0.1', '2019-05-03 11:50:21', 0, '删除,id:单据明细', '删除,id:单据明细', 63);
INSERT INTO `smic_log` VALUES (6249, 63, '单据', '127.0.0.1', '2019-05-03 11:51:52', 0, '修改,id:196单据', '修改,id:196单据', 63);
INSERT INTO `smic_log` VALUES (6250, 63, '单据明细', '127.0.0.1', '2019-05-03 11:51:52', 0, '新增单据明细', '新增单据明细', 63);
INSERT INTO `smic_log` VALUES (6251, 63, '单据明细', '127.0.0.1', '2019-05-03 11:51:52', 0, '删除,id:单据明细', '删除,id:单据明细', 63);
INSERT INTO `smic_log` VALUES (6252, 63, '单据', '127.0.0.1', '2019-05-03 11:57:49', 0, '修改,id:196单据', '修改,id:196单据', 63);
INSERT INTO `smic_log` VALUES (6253, 63, '单据明细', '127.0.0.1', '2019-05-03 11:57:49', 0, '新增单据明细', '新增单据明细', 63);
INSERT INTO `smic_log` VALUES (6254, 63, '单据明细', '127.0.0.1', '2019-05-03 11:57:49', 0, '删除,id:单据明细', '删除,id:单据明细', 63);
INSERT INTO `smic_log` VALUES (6255, 63, '商家', '127.0.0.1', '2019-05-03 13:05:32', 0, '新增商家', '新增商家', 63);
INSERT INTO `smic_log` VALUES (6256, 63, '商家', '127.0.0.1', '2019-05-03 13:20:45', 0, '删除,id:61商家', '删除,id:61商家', 63);
INSERT INTO `smic_log` VALUES (6257, 63, '商家', '127.0.0.1', '2019-05-03 13:25:50', 0, '修改,id:57商家', '修改,id:57商家', 63);
INSERT INTO `smic_log` VALUES (6258, 63, '商家', '127.0.0.1', '2019-05-03 13:25:58', 0, '修改,id:57商家', '修改,id:57商家', 63);
INSERT INTO `smic_log` VALUES (6259, 63, '商家', '127.0.0.1', '2019-05-03 13:27:23', 0, '修改,id:57商家', '修改,id:57商家', 63);
INSERT INTO `smic_log` VALUES (6260, 63, '商家', '127.0.0.1', '2019-05-03 13:27:32', 0, '修改,id:57商家', '修改,id:57商家', 63);
INSERT INTO `smic_log` VALUES (6261, 63, '商家', '127.0.0.1', '2019-05-03 13:28:45', 0, '新增商家', '新增商家', 63);
INSERT INTO `smic_log` VALUES (6262, 63, '商家', '127.0.0.1', '2019-05-03 13:43:28', 0, '新增商家', '新增商家', 63);
INSERT INTO `smic_log` VALUES (6263, 63, '商家', '127.0.0.1', '2019-05-03 13:43:31', 0, '删除,id:63商家', '删除,id:63商家', 63);
INSERT INTO `smic_log` VALUES (6264, 63, '商家', '127.0.0.1', '2019-05-03 13:43:35', 0, '新增商家', '新增商家', 63);
INSERT INTO `smic_log` VALUES (6265, 63, '商家', '127.0.0.1', '2019-05-03 13:43:44', 0, '修改,id:64商家', '修改,id:64商家', 63);
INSERT INTO `smic_log` VALUES (6266, 63, '商家', '127.0.0.1', '2019-05-03 13:45:52', 0, '新增商家', '新增商家', 63);
INSERT INTO `smic_log` VALUES (6267, 63, '商家', '127.0.0.1', '2019-05-03 13:46:17', 0, '修改,id:65商家', '修改,id:65商家', 63);
INSERT INTO `smic_log` VALUES (6268, 63, '商家', '127.0.0.1', '2019-05-03 13:46:23', 0, '删除,id:62,64,65商家', '删除,id:62,64,65商家', 63);
INSERT INTO `smic_log` VALUES (6269, 63, '商家', '127.0.0.1', '2019-05-03 13:46:28', 0, '新增商家', '新增商家', 63);
INSERT INTO `smic_log` VALUES (6270, 63, '商家', '127.0.0.1', '2019-05-03 13:46:34', 0, '删除,id:66商家', '删除,id:66商家', 63);
INSERT INTO `smic_log` VALUES (6271, 63, '商家', '127.0.0.1', '2019-05-03 13:46:58', 0, '新增商家', '新增商家', 63);
INSERT INTO `smic_log` VALUES (6272, 63, '商家', '127.0.0.1', '2019-05-03 13:47:07', 0, '修改,id:67商家', '修改,id:67商家', 63);
INSERT INTO `smic_log` VALUES (6273, 63, '商家', '127.0.0.1', '2019-05-03 13:47:17', 0, '修改,id:67商家', '修改,id:67商家', 63);
INSERT INTO `smic_log` VALUES (6274, 63, '商家', '127.0.0.1', '2019-05-03 13:54:20', 0, '删除,id:67商家', '删除,id:67商家', 63);
INSERT INTO `smic_log` VALUES (6275, 63, '商家', '127.0.0.1', '2019-05-03 13:54:32', 0, '新增商家', '新增商家', 63);
INSERT INTO `smic_log` VALUES (6276, 63, '商家', '127.0.0.1', '2019-05-03 13:55:00', 0, '修改,id:68商家', '修改,id:68商家', 63);
INSERT INTO `smic_log` VALUES (6277, 63, '商家', '127.0.0.1', '2019-05-03 13:55:33', 0, '修改,id:68商家', '修改,id:68商家', 63);
INSERT INTO `smic_log` VALUES (6278, 63, '商家', '127.0.0.1', '2019-05-03 13:56:22', 0, '修改,id:68商家', '修改,id:68商家', 63);
INSERT INTO `smic_log` VALUES (6279, 63, '商家', '127.0.0.1', '2019-05-03 13:56:42', 0, '修改,id:68商家', '修改,id:68商家', 63);
INSERT INTO `smic_log` VALUES (6280, 63, '商家', '127.0.0.1', '2019-05-03 13:57:06', 0, '修改,id:68商家', '修改,id:68商家', 63);
INSERT INTO `smic_log` VALUES (6281, 63, '商家', '127.0.0.1', '2019-05-03 13:57:24', 0, '修改,id:68商家', '修改,id:68商家', 63);
INSERT INTO `smic_log` VALUES (6282, 63, '商家', '127.0.0.1', '2019-05-03 13:57:42', 0, '修改,id:68商家', '修改,id:68商家', 63);
INSERT INTO `smic_log` VALUES (6283, 63, '商家', '127.0.0.1', '2019-05-03 13:57:50', 0, '修改,id:68商家', '修改,id:68商家', 63);
INSERT INTO `smic_log` VALUES (6284, 63, '商家', '127.0.0.1', '2019-05-03 13:58:33', 0, '修改,id:68商家', '修改,id:68商家', 63);
INSERT INTO `smic_log` VALUES (6285, 63, '商家', '127.0.0.1', '2019-05-03 13:58:43', 0, '修改,id:68商家', '修改,id:68商家', 63);
INSERT INTO `smic_log` VALUES (6286, 63, '计量单位', '127.0.0.1', '2019-05-03 14:00:00', 0, '新增计量单位', '新增计量单位', 63);
INSERT INTO `smic_log` VALUES (6287, 63, '商品', '127.0.0.1', '2019-05-03 14:00:56', 0, '新增商品', '新增商品', 63);
INSERT INTO `smic_log` VALUES (6288, 63, '商品', '127.0.0.1', '2019-05-03 14:06:56', 0, '新增商品', '新增商品', 63);
INSERT INTO `smic_log` VALUES (6289, 63, '商品', '127.0.0.1', '2019-05-03 14:07:09', 0, '新增商品', '新增商品', 63);
INSERT INTO `smic_log` VALUES (6290, 63, '商品', '127.0.0.1', '2019-05-03 14:07:19', 0, '删除,id:572,573商品', '删除,id:572,573商品', 63);
INSERT INTO `smic_log` VALUES (6291, 63, '商品', '127.0.0.1', '2019-05-03 14:14:43', 0, '删除,id:571商品', '删除,id:571商品', 63);
INSERT INTO `smic_log` VALUES (6292, 63, '商品', '127.0.0.1', '2019-05-03 14:15:13', 0, '新增商品', '新增商品', 63);
INSERT INTO `smic_log` VALUES (6295, 63, '商品', '127.0.0.1', '2019-05-03 14:16:06', 0, '新增商品', '新增商品', 63);
INSERT INTO `smic_log` VALUES (6296, 63, '商品', '127.0.0.1', '2019-05-03 14:16:15', 0, '删除,id:574,575商品', '删除,id:574,575商品', 63);
INSERT INTO `smic_log` VALUES (6297, 63, '商品', '127.0.0.1', '2019-05-03 14:17:08', 0, '新增商品', '新增商品', 63);
INSERT INTO `smic_log` VALUES (6298, 63, '商品', '127.0.0.1', '2019-05-03 14:17:12', 0, '删除,id:576商品', '删除,id:576商品', 63);
INSERT INTO `smic_log` VALUES (6299, 63, '商品', '127.0.0.1', '2019-05-03 14:17:39', 0, '新增商品', '新增商品', 63);
INSERT INTO `smic_log` VALUES (6300, 63, '商品', '127.0.0.1', '2019-05-03 14:18:59', 0, '新增商品', '新增商品', 63);
INSERT INTO `smic_log` VALUES (6301, 63, '商品', '127.0.0.1', '2019-05-03 14:19:17', 0, '修改,id:578商品', '修改,id:578商品', 63);
INSERT INTO `smic_log` VALUES (6302, 63, '商品', '127.0.0.1', '2019-05-03 14:19:27', 0, '修改,id:578商品', '修改,id:578商品', 63);
INSERT INTO `smic_log` VALUES (6303, 63, '商品', '127.0.0.1', '2019-05-03 14:19:34', 0, '修改,id:578商品', '修改,id:578商品', 63);
INSERT INTO `smic_log` VALUES (6304, 63, '单据', '127.0.0.1', '2019-05-03 14:20:56', 0, '新增单据', '新增单据', 63);
INSERT INTO `smic_log` VALUES (6305, 63, '单据明细', '127.0.0.1', '2019-05-03 14:20:56', 0, '新增单据明细', '新增单据明细', 63);
INSERT INTO `smic_log` VALUES (6306, 63, '单据明细', '127.0.0.1', '2019-05-03 14:20:56', 0, '删除,id:单据明细', '删除,id:单据明细', 63);
INSERT INTO `smic_log` VALUES (6307, 63, '商品', '127.0.0.1', '2019-05-03 14:21:11', 0, '删除,id:578商品', '删除,id:578商品', 63);
INSERT INTO `smic_log` VALUES (6312, 63, '商品', '127.0.0.1', '2019-05-03 14:35:11', 0, '新增商品', '新增商品', 63);
INSERT INTO `smic_log` VALUES (6314, 63, '商品', '127.0.0.1', '2019-05-03 14:36:06', 0, '新增商品', '新增商品', 63);
INSERT INTO `smic_log` VALUES (6315, 63, '商品', '127.0.0.1', '2019-05-03 14:36:18', 0, '新增商品', '新增商品', 63);
INSERT INTO `smic_log` VALUES (6316, 63, '商品', '127.0.0.1', '2019-05-03 14:40:05', 0, '修改,id:581商品', '修改,id:581商品', 63);
INSERT INTO `smic_log` VALUES (6317, 63, '商品', '127.0.0.1', '2019-05-03 14:40:07', 0, '修改,id:581商品', '修改,id:581商品', 63);
INSERT INTO `smic_log` VALUES (6318, 63, '商品', '127.0.0.1', '2019-05-03 14:40:10', 0, '删除,id:581商品', '删除,id:581商品', 63);
INSERT INTO `smic_log` VALUES (6319, 63, '商品', '127.0.0.1', '2019-05-03 14:40:12', 0, '删除,id:580商品', '删除,id:580商品', 63);
INSERT INTO `smic_log` VALUES (6320, 63, '商品', '127.0.0.1', '2019-05-03 14:40:24', 0, '新增商品', '新增商品', 63);
INSERT INTO `smic_log` VALUES (6321, 63, '商品', '127.0.0.1', '2019-05-03 14:40:46', 0, '修改,id:582商品', '修改,id:582商品', 63);
INSERT INTO `smic_log` VALUES (6322, 63, '商品', '127.0.0.1', '2019-05-03 14:43:25', 0, '新增商品', '新增商品', 63);
INSERT INTO `smic_log` VALUES (6323, 63, '商品', '127.0.0.1', '2019-05-03 14:43:28', 0, '删除,id:583商品', '删除,id:583商品', 63);
INSERT INTO `smic_log` VALUES (6324, 63, '商品', '127.0.0.1', '2019-05-03 14:45:57', 0, '删除,id:582商品', '删除,id:582商品', 63);
INSERT INTO `smic_log` VALUES (6325, 63, '商品', '127.0.0.1', '2019-05-03 14:46:18', 0, '新增商品', '新增商品', 63);
INSERT INTO `smic_log` VALUES (6326, 63, '商品', '127.0.0.1', '2019-05-03 14:46:38', 0, '修改,id:584商品', '修改,id:584商品', 63);
INSERT INTO `smic_log` VALUES (6327, 63, '商品', '127.0.0.1', '2019-05-03 14:46:43', 0, '修改,id:584商品', '修改,id:584商品', 63);
INSERT INTO `smic_log` VALUES (6328, 63, '商品', '127.0.0.1', '2019-05-03 14:46:51', 0, '修改,id:584商品', '修改,id:584商品', 63);
INSERT INTO `smic_log` VALUES (6329, 63, '商品', '127.0.0.1', '2019-05-03 14:47:13', 0, '修改,id:584商品', '修改,id:584商品', 63);
INSERT INTO `smic_log` VALUES (6330, 63, '商品', '127.0.0.1', '2019-05-03 14:47:18', 0, '修改,id:584商品', '修改,id:584商品', 63);
INSERT INTO `smic_log` VALUES (6331, 63, '商品', '127.0.0.1', '2019-05-03 14:47:21', 0, '修改,id:584商品', '修改,id:584商品', 63);
INSERT INTO `smic_log` VALUES (6332, 63, '商品', '127.0.0.1', '2019-05-03 14:47:29', 0, '修改,id:584商品', '修改,id:584商品', 63);
INSERT INTO `smic_log` VALUES (6333, 63, '商品', '127.0.0.1', '2019-05-03 14:48:53', 0, '删除,id:584商品', '删除,id:584商品', 63);
INSERT INTO `smic_log` VALUES (6334, 63, '商品', '127.0.0.1', '2019-05-03 14:49:11', 0, '新增商品', '新增商品', 63);
INSERT INTO `smic_log` VALUES (6335, 63, '商家', '127.0.0.1', '2019-05-03 14:55:10', 0, '新增商家', '新增商家', 63);
INSERT INTO `smic_log` VALUES (6336, 63, '商家', '127.0.0.1', '2019-05-03 14:55:26', 0, '删除,id:69商家', '删除,id:69商家', 63);
INSERT INTO `smic_log` VALUES (6337, 63, '商家', '127.0.0.1', '2019-05-03 14:56:46', 0, '新增商家', '新增商家', 63);
INSERT INTO `smic_log` VALUES (6338, 63, '商家', '127.0.0.1', '2019-05-03 14:57:13', 0, '新增商家', '新增商家', 63);
INSERT INTO `smic_log` VALUES (6339, 63, '商家', '127.0.0.1', '2019-05-03 14:58:47', 0, '新增商家', '新增商家', 63);
INSERT INTO `smic_log` VALUES (6340, 63, '商家', '127.0.0.1', '2019-05-03 14:58:52', 0, '新增商家', '新增商家', 63);
INSERT INTO `smic_log` VALUES (6341, 63, '商家', '127.0.0.1', '2019-05-03 14:59:03', 0, '删除,id:70,72,73商家', '删除,id:70,72,73商家', 63);
INSERT INTO `smic_log` VALUES (6342, 120, '关联关系', '127.0.0.1', '2019-05-03 16:37:15', 0, '修改,id:32关联关系', '修改,id:32关联关系', NULL);
INSERT INTO `smic_log` VALUES (6343, 120, '功能', '127.0.0.1', '2019-05-03 16:55:52', 0, '新增功能', '新增功能', NULL);
INSERT INTO `smic_log` VALUES (6344, 120, '关联关系', '127.0.0.1', '2019-05-03 16:56:20', 0, '修改,id:32关联关系', '修改,id:32关联关系', NULL);
INSERT INTO `smic_log` VALUES (6345, 120, '关联关系', '127.0.0.1', '2019-05-03 16:57:24', 0, '修改,id:5关联关系', '修改,id:5关联关系', NULL);
INSERT INTO `smic_log` VALUES (6346, 120, '功能', '127.0.0.1', '2019-05-03 16:58:04', 0, '修改,id:245功能', '修改,id:245功能', NULL);
INSERT INTO `smic_log` VALUES (6347, 63, '角色', '127.0.0.1', '2019-05-03 17:06:47', 0, '新增角色', '新增角色', 63);

-- ----------------------------
-- Table structure for smic_material
-- ----------------------------
DROP TABLE IF EXISTS `smic_material`;
CREATE TABLE `smic_material`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` bigint(20) NULL DEFAULT NULL COMMENT '产品类型',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `mfrs` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '制造商',
  `packing` decimal(24, 6) NULL DEFAULT NULL COMMENT '包装（KG/包）',
  `safety_stock` decimal(24, 6) NULL DEFAULT NULL COMMENT '安全存量（KG）',
  `model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '型号',
  `standard` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格',
  `color` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `unit` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位-单个',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `retail_price` decimal(24, 6) NULL DEFAULT NULL COMMENT '零售价',
  `low_price` decimal(24, 6) NULL DEFAULT NULL COMMENT '最低售价',
  `preset_price_one` decimal(24, 6) NULL DEFAULT NULL COMMENT '预设售价一',
  `preset_price_two` decimal(24, 6) NULL DEFAULT NULL COMMENT '预设售价二',
  `unit_id` bigint(20) NULL DEFAULT NULL COMMENT '计量单位Id',
  `first_out_unit` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首选出库单位',
  `first_in_unit` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首选入库单位',
  `price_strategy` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '价格策略',
  `enabled` bit(1) NULL DEFAULT NULL COMMENT '启用 0-禁用  1-启用',
  `other_field1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义1',
  `other_field2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义2',
  `other_field3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义3',
  `enableSerialNumber` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否开启序列号，0否，1是',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `delete_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK675951272AB6672C`(`category_id`) USING BTREE,
  INDEX `UnitId`(`unit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 586 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smic_material
-- ----------------------------
INSERT INTO `smic_material` VALUES (485, 2, '棉线', 'a1', NULL, 100.000000, 'A21-4321', '5g', '白色', '码', '', 1.000000, 1.000000, 1.000000, 1.000000, NULL, '', '', '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', b'1', 'b2', 'c3', 'd4', '0', NULL, '0');
INSERT INTO `smic_material` VALUES (487, 1, '网布', '制造商b', NULL, 100.000000, '12343', '10g', '', '码', '', 1.000000, 1.000000, 1.000000, 1.000000, NULL, '', '', '[{\"basic\":{\"Unit\":\"kg\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}},{\"other\":{\"Unit\":\"包\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', b'1', NULL, NULL, NULL, '0', NULL, '0');
INSERT INTO `smic_material` VALUES (498, 1, '蕾丝', '制造商c', NULL, NULL, 'B123a', '6g', '', '码', '', 1.200000, 1.000000, 1.300000, 1.400000, NULL, '', '', '[{\"basic\":{\"Unit\":\"kg\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}},{\"other\":{\"Unit\":\"包\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', b'1', NULL, NULL, NULL, '0', NULL, '0');
INSERT INTO `smic_material` VALUES (499, 1, '棉线', '制造商d', NULL, NULL, 'A21-1234', '7g', '', '码', '', 2.200000, 2.000000, 2.400000, 2.600000, NULL, '', '', '[{\"basic\":{\"Unit\":\"kg\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}},{\"other\":{\"Unit\":\"包\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', b'1', NULL, NULL, NULL, '0', NULL, '0');
INSERT INTO `smic_material` VALUES (500, 1, '纯棉线', '制造商e', NULL, NULL, 'AAA666', '11g', '', '码', '', 1.100000, 1.000000, 1.200000, 1.300000, NULL, '', '', '[{\"basic\":{\"Unit\":\"kg\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}},{\"other\":{\"Unit\":\"包\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', b'1', NULL, NULL, NULL, '0', NULL, '0');
INSERT INTO `smic_material` VALUES (517, 1, '奶酪', '制造商', NULL, NULL, 'AAAA', '12ml', '', '', '', NULL, NULL, NULL, NULL, 8, '瓶', '箱', '[{\"basic\":{\"Unit\":\"瓶\",\"RetailPrice\":\"1.5\",\"LowPrice\":\"2\",\"PresetPriceOne\":\"3\",\"PresetPriceTwo\":\"4\"}},{\"other\":{\"Unit\":\"箱\",\"RetailPrice\":\"18\",\"LowPrice\":\"24\",\"PresetPriceOne\":\"36\",\"PresetPriceTwo\":\"48\"}}]', b'1', NULL, NULL, NULL, '0', NULL, '0');
INSERT INTO `smic_material` VALUES (518, 1, '安慕希', '伊利', NULL, NULL, 'abcd', '350ml', '银白色', '', '', NULL, NULL, NULL, NULL, 2, 'kg', '包', '[{\"basic\":{\"Unit\":\"kg\",\"RetailPrice\":\"2\",\"LowPrice\":\"1\",\"PresetPriceOne\":\"3\",\"PresetPriceTwo\":\"4\"}},{\"other\":{\"Unit\":\"包\",\"RetailPrice\":\"50\",\"LowPrice\":\"25\",\"PresetPriceOne\":\"75\",\"PresetPriceTwo\":\"100\"}}]', b'1', '', '', '', '0', NULL, '0');
INSERT INTO `smic_material` VALUES (562, 1, '红苹果（蛇果）', '', NULL, NULL, '60#', '大铁筐', '', '个', '', 12.000000, 10.000000, 8.000000, 11.000000, NULL, '', '', '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"enableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', b'1', '', '', '', '0', NULL, '0');
INSERT INTO `smic_material` VALUES (563, 8, '139电话卡', '', NULL, NULL, '139', '规格1', '绿色', '张', '', 11.000000, 11.000000, 11.000000, 11.000000, NULL, NULL, NULL, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"enableSerialNumber\":\"1\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', b'1', '', '', '', '1', NULL, '0');
INSERT INTO `smic_material` VALUES (564, 14, '商品1', '', NULL, NULL, 'sp1', '', '', '个', '', 22.000000, 22.000000, 22.000000, 22.000000, NULL, NULL, NULL, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"enableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', b'1', '', '', '', '0', 1, '0');
INSERT INTO `smic_material` VALUES (565, 14, '商品2', '', NULL, NULL, 'sp2', '', '', '个', '', 44.000000, 44.000000, 44.000000, 44.000000, NULL, NULL, NULL, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"1\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', b'1', '', '', '', '1', 1, '0');
INSERT INTO `smic_material` VALUES (566, 15, '商品666', '', NULL, NULL, 'sp666', '', '', '个', '', 5.000000, 4.000000, 3.000000, 2.000000, NULL, NULL, NULL, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', b'1', '', '', '', '0', 117, '0');
INSERT INTO `smic_material` VALUES (567, NULL, '商品1', '', NULL, NULL, 'dsp1', '', '', '个', '', 11.000000, 11.000000, 11.000000, 11.000000, NULL, NULL, NULL, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', b'1', '', '', '', '0', 115, '0');
INSERT INTO `smic_material` VALUES (568, 17, '商品1', '', NULL, 100.000000, 'sp1', '', '', '个', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', b'1', '', '', '', '0', 63, '0');
INSERT INTO `smic_material` VALUES (569, 17, '商品2', '', NULL, 200.000000, 'sp2', '', '', '只', '', 5.000000, 5.000000, 5.000000, 5.000000, NULL, NULL, NULL, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', b'1', '', '', '', '0', 63, '0');
INSERT INTO `smic_material` VALUES (570, 17, '商品3', '', NULL, 300.000000, 'sp3', '', '', '个个', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', b'1', '', '', '', '0', 63, '0');
INSERT INTO `smic_material` VALUES (571, NULL, '商品4', '', NULL, NULL, 'sp4', '', '', '', '', NULL, NULL, NULL, NULL, 15, '个', '箱', '[{\"basic\":{\"Unit\":\"个\",\"RetailPrice\":\"3\",\"LowPrice\":\"2\",\"PresetPriceOne\":\"2\",\"PresetPriceTwo\":\"2\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"箱\",\"RetailPrice\":\"36\",\"LowPrice\":\"24\",\"PresetPriceOne\":\"24\",\"PresetPriceTwo\":\"24\"}}]', b'1', '', '', '', '0', 63, '1');
INSERT INTO `smic_material` VALUES (572, NULL, '234234', '', NULL, NULL, '234234', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', b'1', '', '', '', '0', 63, '1');
INSERT INTO `smic_material` VALUES (573, NULL, '12312', '', NULL, NULL, '12', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', b'1', '', '', '', '0', 63, '1');
INSERT INTO `smic_material` VALUES (574, NULL, '商品5', '', NULL, NULL, '213qw', '', '', '个', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', b'1', '', '', '', '0', 63, '1');
INSERT INTO `smic_material` VALUES (575, NULL, '商品6', '', NULL, NULL, 'sp6', '', '', '', '', NULL, NULL, NULL, NULL, 15, '', '', '[{\"basic\":{\"Unit\":\"个\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"箱\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', b'1', '', '', '', '0', 63, '1');
INSERT INTO `smic_material` VALUES (576, NULL, '商品7', '', NULL, NULL, 'sp7', '', '', '', '', NULL, NULL, NULL, NULL, 15, '', '', '[{\"basic\":{\"Unit\":\"个\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"箱\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', b'1', '', '', '', '0', 63, '1');
INSERT INTO `smic_material` VALUES (577, NULL, '商品8', '', NULL, NULL, 'sp8', '', '', '', '', NULL, NULL, NULL, NULL, 15, '', '', '[{\"basic\":{\"Unit\":\"个\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"箱\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', b'1', '', '', '', '0', 63, '0');
INSERT INTO `smic_material` VALUES (578, 17, '商品9', '', NULL, NULL, 'sp9', '', '', '', '', NULL, NULL, NULL, NULL, 15, '', '', '[{\"basic\":{\"Unit\":\"个\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"箱\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', b'1', '', '', '', '0', 63, '1');
INSERT INTO `smic_material` VALUES (579, NULL, '商品17', '', NULL, NULL, 'sp17', '', '', '', '', NULL, NULL, NULL, NULL, 15, '', '', '[{\"basic\":{\"Unit\":\"个\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"箱\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', b'1', '', '', '', '0', 63, '0');
INSERT INTO `smic_material` VALUES (580, NULL, '15', '', NULL, NULL, '15', '', '', '', '', NULL, NULL, NULL, NULL, 15, '', '', '[{\"basic\":{\"Unit\":\"个\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"箱\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', b'1', '', '', '', '0', 63, '1');
INSERT INTO `smic_material` VALUES (581, NULL, '16', '', NULL, NULL, '16', '', '', '', '', NULL, NULL, NULL, NULL, 15, '', '', '[{\"basic\":{\"Unit\":\"个\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"箱\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', b'1', '', '', '', '0', 63, '1');
INSERT INTO `smic_material` VALUES (582, NULL, '商品20', '', NULL, NULL, 'sp2', '', '', '个', '', NULL, NULL, NULL, NULL, NULL, '', '', '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', b'1', '', '', '', '0', 63, '1');
INSERT INTO `smic_material` VALUES (583, NULL, 'wer', '', NULL, NULL, 'rqwe', '', '', '', '', NULL, NULL, NULL, NULL, 15, '', '', '[{\"basic\":{\"Unit\":\"个\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"箱\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', b'1', '', '', '', '0', 63, '1');
INSERT INTO `smic_material` VALUES (584, NULL, 'sfds', '', NULL, NULL, 'a2233', '12', '2', 'ge', '', 1.000000, 2.000000, 3.000000, 4.000000, NULL, '', '', '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', b'1', '', '', '', '0', 63, '1');
INSERT INTO `smic_material` VALUES (585, NULL, 'asdf', '', NULL, NULL, 'adsfasdf', '', '', '', '', NULL, NULL, NULL, NULL, 15, '', '', '[{\"basic\":{\"Unit\":\"个\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"箱\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', b'1', '', '', '', '0', 63, '0');

-- ----------------------------
-- Table structure for smic_material_category
-- ----------------------------
DROP TABLE IF EXISTS `smic_material_category`;
CREATE TABLE `smic_material_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `category_level` smallint(6) NULL DEFAULT NULL COMMENT '等级',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '上级ID',
  `sort` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示顺序',
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态，0系统默认，1启用，2删除',
  `serial_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updater` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK3EE7F725237A77D8`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smic_material_category
-- ----------------------------
INSERT INTO `smic_material_category` VALUES (1, '根目录', 1, -1, NULL, '2', '1', NULL, NULL, NULL, '2019-03-15 23:09:05', 63, NULL);
INSERT INTO `smic_material_category` VALUES (2, '花边一级A', 1, 1, '', '2', '', '', NULL, NULL, '2019-03-15 23:09:05', 63, NULL);
INSERT INTO `smic_material_category` VALUES (3, '花边一级B', 1, 1, NULL, '2', NULL, NULL, NULL, NULL, '2019-03-15 23:09:05', 63, NULL);
INSERT INTO `smic_material_category` VALUES (4, '其他', 2, 3, NULL, '2', NULL, NULL, NULL, NULL, '2019-03-15 23:09:05', 63, NULL);
INSERT INTO `smic_material_category` VALUES (5, '其他', 3, 4, NULL, '2', NULL, NULL, NULL, NULL, '2019-03-15 23:09:05', 63, NULL);
INSERT INTO `smic_material_category` VALUES (6, '花边二级A', 2, 2, NULL, '2', NULL, NULL, NULL, NULL, '2019-03-15 23:09:05', 63, NULL);
INSERT INTO `smic_material_category` VALUES (7, '花边三级A', 3, 6, NULL, '2', NULL, NULL, NULL, NULL, '2019-03-15 23:09:05', 63, NULL);
INSERT INTO `smic_material_category` VALUES (8, '花边二级B', 2, 2, NULL, '2', NULL, NULL, NULL, NULL, '2019-03-15 23:09:05', 63, NULL);
INSERT INTO `smic_material_category` VALUES (9, '花边一级C', 1, 1, NULL, '2', NULL, NULL, NULL, NULL, '2019-03-15 23:09:05', 63, NULL);
INSERT INTO `smic_material_category` VALUES (10, '花边三级B', 3, 6, NULL, '2', NULL, NULL, NULL, NULL, '2019-03-15 23:09:05', 63, NULL);
INSERT INTO `smic_material_category` VALUES (11, 'ddddd', NULL, -1, '', '1', '', '', '2019-03-15 23:09:13', 63, '2019-03-15 23:09:13', 63, NULL);
INSERT INTO `smic_material_category` VALUES (12, 'ffffff', NULL, 11, '', '1', '', '', '2019-03-15 23:09:27', 63, '2019-03-15 23:09:27', 63, NULL);
INSERT INTO `smic_material_category` VALUES (13, '目录1', NULL, -1, '', '1', '111', '', '2019-03-18 22:45:39', 63, '2019-03-18 22:45:39', 63, 1);
INSERT INTO `smic_material_category` VALUES (14, '目录2', NULL, 13, '', '1', '234', '', '2019-03-18 23:39:39', 63, '2019-03-18 23:39:39', 63, 1);
INSERT INTO `smic_material_category` VALUES (15, '目录1', NULL, -1, '', '1', '', '', '2019-03-31 21:53:53', 117, '2019-03-31 21:53:53', 117, 117);
INSERT INTO `smic_material_category` VALUES (16, 'aaaa', NULL, -1, '', '1', '', '', '2019-04-02 22:28:07', 115, '2019-04-02 22:28:07', 115, 115);
INSERT INTO `smic_material_category` VALUES (17, '目录1', NULL, -1, '', '1', '', '', '2019-04-10 22:18:12', 63, '2019-04-10 22:18:12', 63, 63);

-- ----------------------------
-- Table structure for smic_material_property
-- ----------------------------
DROP TABLE IF EXISTS `smic_material_property`;
CREATE TABLE `smic_material_property`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `native_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原始名称',
  `enabled` bit(1) NULL DEFAULT NULL COMMENT '是否启用',
  `sort` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序',
  `another_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '别名',
  `delete_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品扩展字段表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smic_material_property
-- ----------------------------
INSERT INTO `smic_material_property` VALUES (1, '规格', b'1', '02', '规格', '0');
INSERT INTO `smic_material_property` VALUES (2, '颜色', b'1', '01', '颜色', '0');
INSERT INTO `smic_material_property` VALUES (3, '制造商', b'0', '03', '制造商', '0');
INSERT INTO `smic_material_property` VALUES (4, '自定义1', b'0', '04', '自定义1', '0');
INSERT INTO `smic_material_property` VALUES (5, '自定义2', b'0', '05', '自定义2', '0');
INSERT INTO `smic_material_property` VALUES (6, '自定义3', b'0', '06', '自定义3', '0');

-- ----------------------------
-- Table structure for smic_material_stock
-- ----------------------------
DROP TABLE IF EXISTS `smic_material_stock`;
CREATE TABLE `smic_material_stock`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `material_id` bigint(20) NULL DEFAULT NULL COMMENT '产品id',
  `depot_id` bigint(20) NULL DEFAULT NULL COMMENT '仓库id',
  `number` decimal(24, 6) NULL DEFAULT NULL COMMENT '初始库存数量',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `delete_fag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 119 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品初始库存' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for smic_msg
-- ----------------------------
DROP TABLE IF EXISTS `smic_msg`;
CREATE TABLE `smic_msg`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `msg_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息标题',
  `msg_content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息类型',
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态，1未读 2已读',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `delete_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of smic_msg
-- ----------------------------
INSERT INTO `smic_msg` VALUES (2, '标题1', '内容1', '2019-09-10 00:11:39', '类型1', '1', 63, '0');

-- ----------------------------
-- Table structure for smic_orga_user_rel
-- ----------------------------
DROP TABLE IF EXISTS `smic_orga_user_rel`;
CREATE TABLE `smic_orga_user_rel`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orga_id` bigint(20) NOT NULL COMMENT '机构id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `user_blng_orga_dspl_seq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户在所属机构中显示顺序',
  `delete_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updater` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '机构用户关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smic_orga_user_rel
-- ----------------------------
INSERT INTO `smic_orga_user_rel` VALUES (1, 9, 64, '', '0', NULL, NULL, '2019-03-15 23:03:39', 63, NULL);
INSERT INTO `smic_orga_user_rel` VALUES (2, 3, 65, NULL, '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `smic_orga_user_rel` VALUES (3, 3, 67, NULL, '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `smic_orga_user_rel` VALUES (4, 4, 84, NULL, '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `smic_orga_user_rel` VALUES (5, 5, 86, NULL, '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `smic_orga_user_rel` VALUES (6, 3, 91, '', '0', '2019-03-12 21:55:28', 63, '2019-03-12 21:55:28', 63, NULL);
INSERT INTO `smic_orga_user_rel` VALUES (7, 9, 95, '', '0', '2019-03-15 23:03:22', 63, '2019-03-15 23:03:22', 63, NULL);
INSERT INTO `smic_orga_user_rel` VALUES (8, 9, 96, '', '0', '2019-03-17 23:32:08', 63, '2019-03-17 23:32:08', 63, NULL);
INSERT INTO `smic_orga_user_rel` VALUES (9, 10, 117, '', '0', '2019-03-31 21:53:03', 117, '2019-03-31 21:53:12', 117, 117);

-- ----------------------------
-- Table structure for smic_organization
-- ----------------------------
DROP TABLE IF EXISTS `smic_organization`;
CREATE TABLE `smic_organization`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `org_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构编号',
  `org_full_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构全称',
  `org_abr` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构简称',
  `org_tpcd` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构类型',
  `org_stcd` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构状态,1未营业、2正常营业、3暂停营业、4终止营业、5已除名',
  `org_parent_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构父节点编号',
  `sort` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构显示顺序',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updater` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `org_create_time` datetime(0) NULL DEFAULT NULL COMMENT '机构创建时间',
  `org_stop_time` datetime(0) NULL DEFAULT NULL COMMENT '机构停运时间',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '机构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smic_organization
-- ----------------------------
INSERT INTO `smic_organization` VALUES (1, '01', '根机构', '根机构', NULL, '5', '-1', '1', '根机构，初始化存在', NULL, NULL, '2019-03-15 23:01:21', 63, NULL, NULL, NULL);
INSERT INTO `smic_organization` VALUES (2, NULL, '销售', '销售', NULL, '5', '01', '1', '机构表初始化', NULL, NULL, '2019-03-15 23:01:21', 63, NULL, NULL, NULL);
INSERT INTO `smic_organization` VALUES (3, NULL, 'sdf444', 'sdf444', NULL, '5', '01', '2', '机构表初始化', NULL, NULL, '2019-03-15 23:01:19', 63, NULL, NULL, NULL);
INSERT INTO `smic_organization` VALUES (4, NULL, '1231', '1231', NULL, '5', '01', '3', '机构表初始化', NULL, NULL, '2019-03-15 23:01:19', 63, NULL, NULL, NULL);
INSERT INTO `smic_organization` VALUES (5, NULL, '23', '23', NULL, '5', '01', '4', '机构表初始化', NULL, NULL, '2019-03-15 23:01:19', 63, NULL, NULL, NULL);
INSERT INTO `smic_organization` VALUES (6, '4444', 'abcd', 'abcd', NULL, '1', '-1', '', '', '2019-03-15 23:01:30', 63, '2019-03-15 23:01:47', 63, NULL, NULL, NULL);
INSERT INTO `smic_organization` VALUES (7, '123', 'bbbb', 'bbbb', NULL, '1', 'abcd', '', '', '2019-03-15 23:01:42', 63, '2019-03-15 23:01:42', 63, NULL, NULL, NULL);
INSERT INTO `smic_organization` VALUES (8, 'ddddd', 'ddddd', 'ddddd', NULL, '1', '4444', '', '', '2019-03-15 23:02:02', 63, '2019-03-15 23:02:02', 63, NULL, NULL, NULL);
INSERT INTO `smic_organization` VALUES (9, '555', 'dddddddddd', 'dddddddddd', NULL, '1', 'ddddd', '', '', '2019-03-15 23:02:16', 63, '2019-03-15 23:02:16', 63, NULL, NULL, NULL);
INSERT INTO `smic_organization` VALUES (10, '23124', 'gaga', 'gaga', NULL, '1', '-1', '11', '', '2019-03-31 21:52:31', 117, '2019-03-31 21:52:31', 117, NULL, NULL, 117);
INSERT INTO `smic_organization` VALUES (11, '12312', 'fsadfasdf', 'fsadfasdf', NULL, '1', '23124', '12312', '', '2019-03-31 21:52:52', 117, '2019-03-31 21:52:52', 117, NULL, NULL, 117);

-- ----------------------------
-- Table structure for smic_person
-- ----------------------------
DROP TABLE IF EXISTS `smic_person`;
CREATE TABLE `smic_person`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `delete_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '经手人表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smic_person
-- ----------------------------
INSERT INTO `smic_person` VALUES (3, '财务员', '王五-财务', NULL, '0');
INSERT INTO `smic_person` VALUES (4, '财务员', '赵六-财务', NULL, '0');
INSERT INTO `smic_person` VALUES (5, '业务员', '小李', NULL, '0');
INSERT INTO `smic_person` VALUES (6, '业务员', '小军', NULL, '0');
INSERT INTO `smic_person` VALUES (7, '业务员', '小曹', NULL, '0');
INSERT INTO `smic_person` VALUES (8, '仓管员', '小季', 1, '0');
INSERT INTO `smic_person` VALUES (9, '财务员', '小月', 1, '0');
INSERT INTO `smic_person` VALUES (10, '仓管员', '小张', 117, '0');
INSERT INTO `smic_person` VALUES (11, '业务员', '晓丽', 117, '0');
INSERT INTO `smic_person` VALUES (12, '财务员', '小草', 117, '0');
INSERT INTO `smic_person` VALUES (13, '业务员', '经手人1', 115, '0');

-- ----------------------------
-- Table structure for smic_role
-- ----------------------------
DROP TABLE IF EXISTS `smic_role`;
CREATE TABLE `smic_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `value` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `delete_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smic_role
-- ----------------------------
INSERT INTO `smic_role` VALUES (4, '管理员', NULL, NULL, NULL, NULL, '0');
INSERT INTO `smic_role` VALUES (5, '仓管员', NULL, NULL, NULL, NULL, '0');
INSERT INTO `smic_role` VALUES (10, '租户', NULL, NULL, NULL, NULL, '0');
INSERT INTO `smic_role` VALUES (12, '角色123', NULL, NULL, NULL, 117, '0');
INSERT INTO `smic_role` VALUES (13, '角色test', NULL, NULL, NULL, NULL, '0');
INSERT INTO `smic_role` VALUES (14, '44444', NULL, NULL, NULL, NULL, '1');
INSERT INTO `smic_role` VALUES (15, 'laoba角色', NULL, NULL, NULL, 115, '0');
INSERT INTO `smic_role` VALUES (16, '测试角色123', NULL, NULL, NULL, 63, '0');

-- ----------------------------
-- Table structure for smic_sequence
-- ----------------------------
DROP TABLE IF EXISTS `smic_sequence`;
CREATE TABLE `smic_sequence`  (
  `seq_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '序列名称',
  `min_value` bigint(20) NOT NULL COMMENT '最小值',
  `max_value` bigint(20) NOT NULL COMMENT '最大值',
  `current_val` bigint(20) NOT NULL COMMENT '当前值',
  `increment_val` int(11) NOT NULL DEFAULT 1 COMMENT '增长步数',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`seq_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'sequence表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smic_sequence
-- ----------------------------
INSERT INTO `smic_sequence` VALUES ('depot_number_seq', 1, 999999999999999999, 304, 1, '单据编号sequence');

-- ----------------------------
-- Table structure for smic_serial_number
-- ----------------------------
DROP TABLE IF EXISTS `smic_serial_number`;
CREATE TABLE `smic_serial_number`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `material_id` bigint(20) NULL DEFAULT NULL COMMENT '产品表id',
  `serial_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '序列号',
  `is_sell` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否卖出，0未卖出，1卖出',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `delete_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updater` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `depot_head_id` bigint(20) NULL DEFAULT NULL COMMENT '单据主表id，用于跟踪序列号流向',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '序列号表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smic_serial_number
-- ----------------------------
INSERT INTO `smic_serial_number` VALUES (1, 563, '13915521178850971', '1', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:53:07', 63, 117, NULL);
INSERT INTO `smic_serial_number` VALUES (2, 563, '13915521178850972', '1', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:53:07', 63, 117, NULL);
INSERT INTO `smic_serial_number` VALUES (3, 563, '13915521178850973', '1', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:53:07', 63, 117, NULL);
INSERT INTO `smic_serial_number` VALUES (4, 563, '13915521178850974', '1', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:53:07', 63, 117, NULL);
INSERT INTO `smic_serial_number` VALUES (5, 563, '13915521178850975', '1', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:53:07', 63, 117, NULL);
INSERT INTO `smic_serial_number` VALUES (6, 563, '13915521178850976', '1', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:53:07', 63, 117, NULL);
INSERT INTO `smic_serial_number` VALUES (7, 563, '13915521178850977', '1', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:53:07', 63, 117, NULL);
INSERT INTO `smic_serial_number` VALUES (8, 563, '13915521178850978', '1', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:53:07', 63, 117, NULL);
INSERT INTO `smic_serial_number` VALUES (9, 563, '13915521178850979', '1', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:53:07', 63, 117, NULL);
INSERT INTO `smic_serial_number` VALUES (10, 563, '139155211788509710', '1', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:53:07', 63, 117, NULL);
INSERT INTO `smic_serial_number` VALUES (11, 563, '139155211788509711', '1', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:57:26', 63, 118, NULL);
INSERT INTO `smic_serial_number` VALUES (12, 563, '139155211788509712', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (13, 563, '139155211788509713', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (14, 563, '139155211788509714', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (15, 563, '139155211788509715', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (16, 563, '139155211788509716', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (17, 563, '139155211788509717', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (18, 563, '139155211788509718', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (19, 563, '139155211788509719', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (20, 563, '139155211788509720', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (21, 563, '139155211788509721', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (22, 563, '139155211788509722', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (23, 563, '139155211788509723', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (24, 563, '139155211788509724', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (25, 563, '139155211788509725', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (26, 563, '139155211788509726', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (27, 563, '139155211788509727', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (28, 563, '139155211788509728', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (29, 563, '139155211788509729', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (30, 563, '139155211788509730', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (31, 563, '139155211788509731', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (32, 563, '139155211788509732', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (33, 563, '139155211788509733', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (34, 563, '139155211788509734', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (35, 563, '139155211788509735', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (36, 563, '139155211788509736', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (37, 563, '139155211788509737', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (38, 563, '139155211788509738', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (39, 563, '139155211788509739', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (40, 563, '139155211788509740', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (41, 563, '139155211788509741', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (42, 563, '139155211788509742', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (43, 563, '139155211788509743', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (44, 563, '139155211788509744', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (45, 563, '139155211788509745', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (46, 563, '139155211788509746', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (47, 563, '139155211788509747', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (48, 563, '139155211788509748', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (49, 563, '139155211788509749', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (50, 563, '139155211788509750', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (51, 563, '139155211788509751', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (52, 563, '139155211788509752', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (53, 563, '139155211788509753', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (54, 563, '139155211788509754', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (55, 563, '139155211788509755', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (56, 563, '139155211788509756', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (57, 563, '139155211788509757', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (58, 563, '139155211788509758', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (59, 563, '139155211788509759', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (60, 563, '139155211788509760', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (61, 563, '139155211788509761', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (62, 563, '139155211788509762', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (63, 563, '139155211788509763', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (64, 563, '139155211788509764', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (65, 563, '139155211788509765', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (66, 563, '139155211788509766', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (67, 563, '139155211788509767', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (68, 563, '139155211788509768', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (69, 563, '139155211788509769', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (70, 563, '139155211788509770', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (71, 563, '139155211788509771', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (72, 563, '139155211788509772', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (73, 563, '139155211788509773', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (74, 563, '139155211788509774', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (75, 563, '139155211788509775', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (76, 563, '139155211788509776', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (77, 563, '139155211788509777', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (78, 563, '139155211788509778', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (79, 563, '139155211788509779', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (80, 563, '139155211788509780', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (81, 563, '139155211788509781', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (82, 563, '139155211788509782', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (83, 563, '139155211788509783', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (84, 563, '139155211788509784', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (85, 563, '139155211788509785', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (86, 563, '139155211788509786', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (87, 563, '139155211788509787', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (88, 563, '139155211788509788', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (89, 563, '139155211788509789', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (90, 563, '139155211788509790', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (91, 563, '139155211788509791', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (92, 563, '139155211788509792', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (93, 563, '139155211788509793', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (94, 563, '139155211788509794', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (95, 563, '139155211788509795', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (96, 563, '139155211788509796', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (97, 563, '139155211788509797', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (98, 563, '139155211788509798', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (99, 563, '139155211788509799', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (100, 563, '1391552117885097100', '0', '', '0', '2019-03-09 15:51:25', 63, '2019-03-09 15:51:25', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (102, 563, '123123123', '0', '', '0', '2019-03-21 23:57:29', 63, '2019-03-21 23:57:29', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (103, 565, '2222222', '0', '', '0', '2019-03-21 23:57:37', 63, '2019-03-21 23:57:37', 63, NULL, NULL);
INSERT INTO `smic_serial_number` VALUES (104, 563, '234213123', '0', '', '0', '2019-03-21 23:58:00', 63, '2019-03-21 23:58:00', 63, NULL, NULL);

-- ----------------------------
-- Table structure for smic_supplier
-- ----------------------------
DROP TABLE IF EXISTS `smic_supplier`;
CREATE TABLE `smic_supplier`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `supplier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商名称',
  `contacts` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `phone_num` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_system` tinyint(4) NULL DEFAULT NULL COMMENT '是否系统自带 0==系统 1==非系统',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `enabled` bit(1) NULL DEFAULT NULL COMMENT '启用',
  `advance_in` decimal(24, 6) NULL DEFAULT 0.000000 COMMENT '预收款',
  `begin_need_get` decimal(24, 6) NULL DEFAULT NULL COMMENT '期初应收',
  `begin_need_pay` decimal(24, 6) NULL DEFAULT NULL COMMENT '期初应付',
  `all_need_get` decimal(24, 6) NULL DEFAULT NULL COMMENT '累计应收',
  `all_need_pay` decimal(24, 6) NULL DEFAULT NULL COMMENT '累计应付',
  `fax` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `telephone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `tax_num` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纳税人识别号',
  `bank_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户行',
  `account_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `tax_rate` decimal(24, 6) NULL DEFAULT NULL COMMENT '税率',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `delete_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '供应商/客户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smic_supplier
-- ----------------------------
INSERT INTO `smic_supplier` VALUES (1, '上海某某花边工厂', '乔治', '', '', '', 1, '供应商', b'1', 0.000000, NULL, 20.000000, NULL, NULL, '', '', '', '', '', '', 10.000000, NULL, '0');
INSERT INTO `smic_supplier` VALUES (2, '客户AAAA', '佩琪', '', '', '', 1, '客户', b'1', 24.000000, 10.000000, NULL, NULL, NULL, '', '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_supplier` VALUES (4, '苏州新源布料厂', '龙哥', '13000000000', '312341@qq.com', '55', 1, '供应商', b'1', 0.000000, NULL, 44.000000, NULL, NULL, '', '', '', '', '', '', 17.000000, NULL, '0');
INSERT INTO `smic_supplier` VALUES (5, '客户BBBB', '彪哥', '13000000000', '666@qq.com', '', 1, '客户', b'1', 36.000000, 20.000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `smic_supplier` VALUES (6, '南通宝贝家纺', '姗姗', '1231', '31243@qq.com', '备注备注备注', 1, '客户', b'1', 0.000000, 5.000000, NULL, NULL, NULL, '2134', '15678903', '地址地址地址', '纳税人识别号', '开户行', '31234124312', 0.170000, NULL, '0');
INSERT INTO `smic_supplier` VALUES (7, '非会员', '宋江', '13000000000', '123456@qq.com', '', 1, '会员', b'1', 76.600000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `smic_supplier` VALUES (8, 'hy00001', '宋江', '13000000000', '', '', 1, '会员', b'1', 954.800000, NULL, NULL, NULL, NULL, '', '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_supplier` VALUES (9, 'hy00002', '吴用', '13000000000', '', '', 1, '会员', b'1', 344.000000, NULL, NULL, NULL, NULL, '', '', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_supplier` VALUES (10, '1268787965', '李逵', '82567384', '423@qq.com', '', 1, '会员', b'1', 2122.000000, NULL, NULL, NULL, NULL, '', '13000000001', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_supplier` VALUES (45, '666666666', '武松', '82567384', '423@qq.com', '', 1, '会员', b'1', 2100.000000, 0.000000, 0.000000, 0.000000, 0.000000, '', '13000000001', '', '', '', '', 0.000000, NULL, '0');
INSERT INTO `smic_supplier` VALUES (46, '南通居梦莱家纺', '曹操', '', '', '', 1, '供应商', b'1', 0.000000, NULL, NULL, 0.000000, 0.000000, '', '13000000000', '', '', '', '', NULL, NULL, '0');
INSERT INTO `smic_supplier` VALUES (47, '供应商1', '', '', '', '', NULL, '供应商', b'1', 0.000000, NULL, NULL, NULL, NULL, '', '', '', '', '', '', NULL, 1, '0');
INSERT INTO `smic_supplier` VALUES (48, '客户1', '', '', '', '', NULL, '客户', b'1', 0.000000, NULL, NULL, NULL, NULL, '', '', '', '', '', '', NULL, 1, '0');
INSERT INTO `smic_supplier` VALUES (49, 'ddddd123', '', '', '', '', NULL, '会员', b'1', 6.000000, NULL, NULL, NULL, NULL, '', '', '', '', '', '', NULL, 1, '0');
INSERT INTO `smic_supplier` VALUES (50, '供应商2', '', '', '', '', NULL, '供应商', b'1', 0.000000, NULL, NULL, NULL, NULL, '', '', '', '', '', '', NULL, 1, '0');
INSERT INTO `smic_supplier` VALUES (51, '供应商1', '小周', '', '', '', NULL, '供应商', b'1', 0.000000, NULL, 2000.000000, NULL, NULL, '', '', '', '', '', '', NULL, 117, '0');
INSERT INTO `smic_supplier` VALUES (52, '客户123', '', '', '', '', NULL, '客户', b'1', 0.000000, 1000.000000, NULL, NULL, NULL, '', '', '', '', '', '', NULL, 117, '0');
INSERT INTO `smic_supplier` VALUES (53, '会员123123', '', '', '', '', NULL, '会员', b'1', 0.000000, NULL, NULL, NULL, NULL, '', '', '', '', '', '', NULL, 117, '0');
INSERT INTO `smic_supplier` VALUES (54, '供应商2222', '', '', '', '', NULL, '供应商', b'1', 0.000000, NULL, NULL, NULL, NULL, '', '', '', '', '', '', NULL, 117, '0');
INSERT INTO `smic_supplier` VALUES (55, '供应商1', '', '', '', '', NULL, '供应商', b'1', 0.000000, NULL, NULL, NULL, NULL, '', '', '', '', '', '', NULL, 115, '0');
INSERT INTO `smic_supplier` VALUES (56, '客户666', '', '', '', '', NULL, '客户', b'1', 0.000000, NULL, NULL, NULL, NULL, '', '', '', '', '', '', NULL, 115, '0');
INSERT INTO `smic_supplier` VALUES (57, '供应商1', '', '', '', '', NULL, '供应商', b'1', 0.000000, 0.000000, 0.000000, NULL, 0.000000, '', '', '', '', '', '', 12.000000, 63, '0');
INSERT INTO `smic_supplier` VALUES (58, '客户1', '', '', '', '', NULL, '客户', b'1', 0.000000, 200.000000, 0.000000, -100.000000, NULL, '', '', '', '', '', '', NULL, 63, '0');
INSERT INTO `smic_supplier` VALUES (59, 'kh123', '', '', '', '', NULL, '客户', b'1', 0.000000, NULL, NULL, NULL, NULL, '', '', '', '', '', '', NULL, 63, '0');
INSERT INTO `smic_supplier` VALUES (60, '12312666', '', '', '', '', NULL, '会员', b'1', 0.000000, NULL, NULL, NULL, NULL, '', '', '', '', '', '', NULL, 63, '0');
INSERT INTO `smic_supplier` VALUES (61, '', '', '', '', '', NULL, '供应商', b'1', 0.000000, NULL, NULL, NULL, NULL, '', '', '', '', '', '', 12312312.000000, 63, '1');
INSERT INTO `smic_supplier` VALUES (62, '供if', '', '', '', '', NULL, '供应商', b'1', 0.000000, NULL, NULL, NULL, NULL, '', '', '', '', '', '', NULL, 63, '1');
INSERT INTO `smic_supplier` VALUES (63, '', '', '', '', '', NULL, '供应商', b'1', 0.000000, NULL, NULL, NULL, NULL, '', '', '', '', '', '', NULL, 63, '1');
INSERT INTO `smic_supplier` VALUES (64, 'wrwer', '', '', '', '', NULL, '供应商', b'1', 0.000000, 0.000000, 0.000000, NULL, 0.000000, '', '', '', '', '', '', 233.000000, 63, '1');
INSERT INTO `smic_supplier` VALUES (65, '123123', '', '', '', '', NULL, '供应商', b'1', 0.000000, 0.000000, 0.000000, NULL, 0.000000, '', '', '', '', '', '', 44.000000, 63, '1');
INSERT INTO `smic_supplier` VALUES (66, 'rrtt', '', '', '', '', NULL, '供应商', b'1', 0.000000, NULL, NULL, NULL, NULL, '', '', '', '', '', '', NULL, 63, '1');
INSERT INTO `smic_supplier` VALUES (67, '供应商2', '', '', '', '', NULL, '供应商', b'1', 0.000000, 0.000000, 0.000000, NULL, 0.000000, '', '', '', '', '', '', 7.000000, 63, '1');
INSERT INTO `smic_supplier` VALUES (68, '供应商3', '', '', '', '', NULL, '供应商', b'1', 0.000000, 15.000000, 0.000000, NULL, -15.000000, '', '13000000000', '', '', '', '', 22.000000, 63, '0');
INSERT INTO `smic_supplier` VALUES (69, '', '', '', '', '', NULL, '供应商', b'1', 0.000000, NULL, NULL, NULL, NULL, '', '', '', '', '', '', 3123.000000, 63, '1');
INSERT INTO `smic_supplier` VALUES (70, 'rrrrr', '', '', '', '', NULL, '供应商', b'1', 0.000000, NULL, NULL, NULL, NULL, '', '', '', '', '', '', NULL, 63, '1');
INSERT INTO `smic_supplier` VALUES (71, 'fsdfasdf', '', '', '', '', NULL, '客户', b'1', 0.000000, NULL, NULL, NULL, NULL, '', '', '', '', '', '', NULL, 63, '0');
INSERT INTO `smic_supplier` VALUES (72, 'sdfafadsf', '', '', '', '', NULL, '供应商', b'1', 0.000000, NULL, NULL, NULL, NULL, '', '', '', '', '', '', NULL, 63, '1');
INSERT INTO `smic_supplier` VALUES (73, 'sadvczXCvz', '', '', '', '', NULL, '供应商', b'1', 0.000000, NULL, NULL, NULL, NULL, '', '', '', '', '', '', NULL, 63, '1');

-- ----------------------------
-- Table structure for smic_system_config
-- ----------------------------
DROP TABLE IF EXISTS `smic_system_config`;
CREATE TABLE `smic_system_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `company_contacts` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司联系人',
  `company_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司地址',
  `company_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司电话',
  `company_fax` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司传真',
  `company_post_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司邮编',
  `depot_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '仓库启用标记，0未启用，1启用',
  `customer_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '客户启用标记，0未启用，1启用',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `delete_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统参数' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of smic_system_config
-- ----------------------------
INSERT INTO `smic_system_config` VALUES (7, '南通smicERP公司', '张三', '南通市通州区某某路', '0513-10101010', '0513-18181818', '226300', '0', '0', NULL, '0');
INSERT INTO `smic_system_config` VALUES (8, '公司123', '', '', '', '', '', '0', '0', 117, '0');

-- ----------------------------
-- Table structure for smic_tenant
-- ----------------------------
DROP TABLE IF EXISTS `smic_tenant`;
CREATE TABLE `smic_tenant`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `login_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录名',
  `user_num_limit` int(11) NULL DEFAULT NULL COMMENT '用户数量限制',
  `bills_num_limit` int(11) NULL DEFAULT NULL COMMENT '单据数量限制',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '租户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smic_tenant
-- ----------------------------
INSERT INTO `smic_tenant` VALUES (13, 63, 'smic', 20, 2000, NULL);
INSERT INTO `smic_tenant` VALUES (14, 113, 'abc123', 2, 200, NULL);
INSERT INTO `smic_tenant` VALUES (15, 115, 'jzh', 2, 200, NULL);
INSERT INTO `smic_tenant` VALUES (16, 123, 'caoyuli', 2, 200, NULL);
INSERT INTO `smic_tenant` VALUES (17, 124, 'jchb', 2, 200, NULL);
INSERT INTO `smic_tenant` VALUES (18, 126, '123123', 2, 200, NULL);
INSERT INTO `smic_tenant` VALUES (19, 127, '2345123', 2, 200, NULL);
INSERT INTO `smic_tenant` VALUES (20, 128, 'q12341243', 2, 200, NULL);
INSERT INTO `smic_tenant` VALUES (21, 130, 'smic666', 2, 200, NULL);

-- ----------------------------
-- Table structure for smic_unit
-- ----------------------------
DROP TABLE IF EXISTS `smic_unit`;
CREATE TABLE `smic_unit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `u_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称，支持多单位',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `delete_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '多单位表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smic_unit
-- ----------------------------
INSERT INTO `smic_unit` VALUES (2, 'kg,包(1:25)', NULL, '0');
INSERT INTO `smic_unit` VALUES (8, '瓶,箱(1:12)', NULL, '0');
INSERT INTO `smic_unit` VALUES (11, 'qwe,sed(1:33)', NULL, '0');
INSERT INTO `smic_unit` VALUES (12, '1,2(1:33)', NULL, '0');
INSERT INTO `smic_unit` VALUES (13, 'aa,vv(1:22)', 1, '0');
INSERT INTO `smic_unit` VALUES (14, '个,箱(1:12)', 117, '0');
INSERT INTO `smic_unit` VALUES (15, '个,箱(1:12)', 63, '0');

-- ----------------------------
-- Table structure for smic_user
-- ----------------------------
DROP TABLE IF EXISTS `smic_user`;
CREATE TABLE `smic_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓名--例如张三',
  `login_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录用户名--可能为空',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登陆密码',
  `position` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属部门',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `phonenum` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `is_manager` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否为管理者 0==管理者 1==员工',
  `is_system` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否系统自带数据 ',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '状态，0：正常，1：删除，2封禁',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户描述信息',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 131 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smic_user
-- ----------------------------
INSERT INTO `smic_user` VALUES (63, '季圣华', 'smic', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 1, 0, '', NULL, 63);
INSERT INTO `smic_user` VALUES (64, '张三', 'zs', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 0, '', NULL, NULL);
INSERT INTO `smic_user` VALUES (65, '李四', 'ls', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 0, '', NULL, NULL);
INSERT INTO `smic_user` VALUES (67, 'fas666', 'asd555', NULL, 'asdf333', NULL, '11111@qq.com', '222222', 1, 0, 0, 'sdf0000', NULL, NULL);
INSERT INTO `smic_user` VALUES (74, '21312sfdfsdf', '1231234', NULL, '', NULL, '', '', 1, 0, 0, '', NULL, NULL);
INSERT INTO `smic_user` VALUES (84, '123123', 'smic123', NULL, '3123', NULL, '', '', 1, 0, 0, '', NULL, NULL);
INSERT INTO `smic_user` VALUES (86, '2333', 'sdf111aaa', NULL, '3232', NULL, '', '32323', 1, 0, 0, '33232', NULL, NULL);
INSERT INTO `smic_user` VALUES (87, '122123132', 'sdfasd1', NULL, '', NULL, '', '', 1, 0, 0, '', NULL, NULL);
INSERT INTO `smic_user` VALUES (90, '232343', '233', NULL, '', NULL, '', '', 1, 0, 0, '', NULL, NULL);
INSERT INTO `smic_user` VALUES (91, 'smic1231', 'smic1231', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 0, '', NULL, NULL);
INSERT INTO `smic_user` VALUES (92, '213123', 'aaaa', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 1, '', NULL, NULL);
INSERT INTO `smic_user` VALUES (93, '111', 'ffff', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 1, '', NULL, NULL);
INSERT INTO `smic_user` VALUES (94, 'sdfsdf', 'fsdfsdsd', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 1, '', NULL, NULL);
INSERT INTO `smic_user` VALUES (95, '4444444', '4444', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 0, '', NULL, NULL);
INSERT INTO `smic_user` VALUES (96, 'lili', 'lili', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 0, '', NULL, 1);
INSERT INTO `smic_user` VALUES (113, 'yuyu123', 'yuyu123', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 113);
INSERT INTO `smic_user` VALUES (115, 'laoba123', 'laoba123', 'e10adc3949ba59abbe56e057f20f883e', '33333', NULL, '', '', 1, 0, 0, '', NULL, 115);
INSERT INTO `smic_user` VALUES (116, 'gggg123', 'gggg123', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 1, '', NULL, 115);
INSERT INTO `smic_user` VALUES (120, '管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `smic_user` VALUES (121, 'hhhh', 'hhhh', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 0, '', NULL, 115);
INSERT INTO `smic_user` VALUES (122, 'admin1', 'admin1', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '', '', 1, 0, 1, '', NULL, 63);
INSERT INTO `smic_user` VALUES (123, 'caoyuli', 'caoyuli', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 123);
INSERT INTO `smic_user` VALUES (124, 'jchb', 'jchb', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 124);
INSERT INTO `smic_user` VALUES (126, '123123', '123123', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 126);
INSERT INTO `smic_user` VALUES (127, '2345123', '2345123', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 127);
INSERT INTO `smic_user` VALUES (128, 'q12341243', 'q12341243', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 128);
INSERT INTO `smic_user` VALUES (130, 'smic666', 'smic666', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, 130);

-- ----------------------------
-- Table structure for smic_user_business
-- ----------------------------
DROP TABLE IF EXISTS `smic_user_business`;
CREATE TABLE `smic_user_business`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别',
  `key_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主ID',
  `value` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  `btn_str` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮权限',
  `delete_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户/角色/模块关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smic_user_business
-- ----------------------------
INSERT INTO `smic_user_business` VALUES (5, 'RoleFunctions', '4', '[245][13][12][16][243][14][15][234][236][22][23][220][240][25][217][218][26][194][195][31][59][207][208][209][226][227][228][229][235][237][244][210][211][241][33][199][242][41][200][201][202][40][232][233][197][203][204][205][206][212][246]', '[{\"funId\":\"25\",\"btnStr\":\"1\"},{\"funId\":\"217\",\"btnStr\":\"1\"},{\"funId\":\"218\",\"btnStr\":\"1\"},{\"funId\":\"241\",\"btnStr\":\"3\"},{\"funId\":\"242\",\"btnStr\":\"3\"}]', '0');
INSERT INTO `smic_user_business` VALUES (6, 'RoleFunctions', '5', '[22][23][25][26][194][195][31][33][200][201][41][199][202]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (7, 'RoleFunctions', '6', '[22][23][220][240][25][217][218][26][194][195][31][59][207][208][209][226][227][228][229][235][237][210][211][241][33][199][242][41][200][201][202][40][232][233][197][203][204][205][206][212]', '[{\"funId\":\"33\",\"btnStr\":\"4\"}]', '0');
INSERT INTO `smic_user_business` VALUES (9, 'RoleFunctions', '7', '[168][13][12][16][14][15][189][18][19][132]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (10, 'RoleFunctions', '8', '[168][13][12][16][14][15][189][18][19][132][22][23][25][26][27][157][158][155][156][125][31][127][126][128][33][34][35][36][37][39][40][41][42][43][46][47][48][49][50][51][52][53][54][55][56][57][192][59][60][61][62][63][65][66][68][69][70][71][73][74][76][77][79][191][81][82][83][85][89][161][86][176][165][160][28][134][91][92][29][94][95][97][104][99][100][101][102][105][107][108][110][111][113][114][116][117][118][120][121][131][135][123][122][20][130][146][147][138][148][149][153][140][145][184][152][143][170][171][169][166][167][163][164][172][173][179][178][181][182][183][186][187]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (11, 'RoleFunctions', '9', '[168][13][12][16][14][15][189][18][19][132][22][23][25][26][27][157][158][155][156][125][31][127][126][128][33][34][35][36][37][39][40][41][42][43][46][47][48][49][50][51][52][53][54][55][56][57][192][59][60][61][62][63][65][66][68][69][70][71][73][74][76][77][79][191][81][82][83][85][89][161][86][176][165][160][28][134][91][92][29][94][95][97][104][99][100][101][102][105][107][108][110][111][113][114][116][117][118][120][121][131][135][123][122][20][130][146][147][138][148][149][153][140][145][184][152][143][170][171][169][166][167][163][164][172][173][179][178][181][182][183][186][187][188]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (12, 'UserRole', '1', '[5]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (13, 'UserRole', '2', '[6][7]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (14, 'UserDepot', '2', '[1][2][6][7]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (15, 'UserDepot', '1', '[1][2][5][6][7][10][12][14][15][17]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (16, 'UserRole', '63', '[10]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (18, 'UserDepot', '63', '[14][15]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (19, 'UserDepot', '5', '[6][45][46][50]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (20, 'UserRole', '5', '[5]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (21, 'UserRole', '64', '[13]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (22, 'UserDepot', '64', '[1]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (23, 'UserRole', '65', '[5]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (24, 'UserDepot', '65', '[1]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (25, 'UserCustomer', '64', '[5][2]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (26, 'UserCustomer', '65', '[6]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (27, 'UserCustomer', '63', '[58]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (28, 'UserDepot', '96', '[7]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (29, 'UserRole', '96', '[6]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (30, 'UserRole', '113', '[10]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (32, 'RoleFunctions', '10', '[245][13][243][14][15][234][22][23][220][240][25][217][218][26][194][195][31][59][207][208][209][226][227][228][229][235][237][244][210][211][241][33][199][242][41][200][201][202][40][232][233][197][203][204][205][206][212][246]', '[{\"funId\":\"25\",\"btnStr\":\"1\"},{\"funId\":\"217\",\"btnStr\":\"1\"},{\"funId\":\"218\",\"btnStr\":\"1\"},{\"funId\":\"241\",\"btnStr\":\"3\"},{\"funId\":\"242\",\"btnStr\":\"3\"}]', '0');
INSERT INTO `smic_user_business` VALUES (34, 'UserRole', '115', '[10]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (35, 'UserRole', '117', '[10]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (36, 'UserDepot', '117', '[8][9]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (37, 'UserCustomer', '117', '[52]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (38, 'UserRole', '120', '[4]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (39, 'UserDepot', '120', '[7][8][9][10][11][12][2][1][3]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (40, 'UserCustomer', '120', '[52][48][6][5][2]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (41, 'RoleFunctions', '12', '', NULL, '0');
INSERT INTO `smic_user_business` VALUES (48, 'RoleFunctions', '13', '[59][207][208][209][226][227][228][229][235][237][210][211][241][33][199][242][41][200]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (51, 'UserRole', '74', '[10]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (52, 'UserDepot', '121', '[13]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (54, 'UserDepot', '115', '[13]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (56, 'UserCustomer', '115', '[56]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (57, 'UserCustomer', '121', '[56]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (58, 'UserRole', '121', '[15]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (59, 'UserRole', '123', '[10]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (60, 'UserRole', '124', '[10]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (61, 'UserRole', '125', '[10]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (62, 'UserRole', '126', '[10]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (63, 'UserRole', '127', '[10]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (64, 'UserRole', '128', '[10]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (65, 'UserRole', '129', '[10]', NULL, '0');
INSERT INTO `smic_user_business` VALUES (66, 'UserRole', '130', '[10]', NULL, '0');

SET FOREIGN_KEY_CHECKS = 1;