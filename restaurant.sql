/*
 Navicat Premium Data Transfer

 Source Server         : restaurant
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : restaurant

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 16/11/2020 10:00:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_category
-- ----------------------------
DROP TABLE IF EXISTS `admin_category`;
CREATE TABLE `admin_category` (
  `id` int NOT NULL COMMENT '分类id',
  `name` int DEFAULT NULL COMMENT '分类名称',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `operator` int DEFAULT NULL COMMENT '操作者',
  `sort` int DEFAULT NULL COMMENT '排序',
  `status` int DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品分类';

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '权限昵称',
  `admin_id` int DEFAULT NULL COMMENT '店id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `router_ids` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '可以访问的页面id',
  `status` int DEFAULT '1' COMMENT '1:正常，0:冻结',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
BEGIN;
INSERT INTO `admin_role` VALUES (1, '店主', 1, '2020-11-12 15:14:27', '1,3,4,5,6,7,8,9,10,11,13,14,15', 1);
INSERT INTO `admin_role` VALUES (999, '游客', 0, '2020-11-14 13:50:48', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15', 1);
COMMIT;

-- ----------------------------
-- Table structure for admin_router
-- ----------------------------
DROP TABLE IF EXISTS `admin_router`;
CREATE TABLE `admin_router` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '页面ID',
  `router_path` varchar(200) DEFAULT NULL COMMENT '页面地址',
  `router_name` varchar(200) DEFAULT NULL COMMENT '页面名称',
  `router_icon` varchar(200) DEFAULT NULL COMMENT '页面图标',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `status` int DEFAULT '1' COMMENT '1:正常，0:禁用',
  `parent_id` int DEFAULT '0' COMMENT '父级id，0为根节点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of admin_router
-- ----------------------------
BEGIN;
INSERT INTO `admin_router` VALUES (1, '/operate', '运营板块', NULL, NULL, 1, 0);
INSERT INTO `admin_router` VALUES (2, '/operate/list', '用户列表', NULL, NULL, 1, 1);
INSERT INTO `admin_router` VALUES (3, '/operate/detail', '用户详情', NULL, NULL, 1, 1);
INSERT INTO `admin_router` VALUES (4, '/member', '会员模块', NULL, NULL, 1, 0);
INSERT INTO `admin_router` VALUES (5, '/member/list', '会员列表', NULL, NULL, 1, 4);
INSERT INTO `admin_router` VALUES (6, '/member/detail', '会员详情', NULL, NULL, 1, 4);
INSERT INTO `admin_router` VALUES (7, '/order', '订单模块', NULL, NULL, 1, 0);
INSERT INTO `admin_router` VALUES (8, '/order/list', '订单列表', NULL, NULL, 1, 7);
INSERT INTO `admin_router` VALUES (9, '/order/detail', '订单详情', NULL, NULL, 1, 7);
INSERT INTO `admin_router` VALUES (10, '/report', '报表模块', NULL, NULL, 1, 0);
INSERT INTO `admin_router` VALUES (11, '/report/finance', '财务报表', NULL, NULL, 1, 10);
INSERT INTO `admin_router` VALUES (12, '/product', '商品模块', NULL, NULL, 1, 0);
INSERT INTO `admin_router` VALUES (13, '/product/list', '商品列表', NULL, NULL, 1, 12);
INSERT INTO `admin_router` VALUES (14, '/product/detail', '商品详情', NULL, NULL, 1, 12);
INSERT INTO `admin_router` VALUES (15, '/product/category', '商品分类', NULL, NULL, 1, 12);
COMMIT;

-- ----------------------------
-- Table structure for admin_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `admin_userinfo`;
CREATE TABLE `admin_userinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nickname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'e10adc3949ba59abbe56e057f20f883e',
  `role` int DEFAULT NULL COMMENT '用户权限',
  `admin_id` int DEFAULT NULL COMMENT '店id',
  `status` int DEFAULT '1' COMMENT '1:正常0:冻结',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of admin_userinfo
-- ----------------------------
BEGIN;
INSERT INTO `admin_userinfo` VALUES (1, 'admin', 'admin', '2020-11-11 15:46:22', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `open_id` int NOT NULL COMMENT '微信id',
  `avatar` varchar(0) DEFAULT NULL COMMENT '用户头像',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `nickname` varchar(0) DEFAULT NULL COMMENT '用户昵称',
  PRIMARY KEY (`id`,`open_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';

-- ----------------------------
-- Records of member
-- ----------------------------
BEGIN;
INSERT INTO `member` VALUES (1, 1, NULL, '2020-11-11 15:18:57', NULL);
COMMIT;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int NOT NULL COMMENT '订单id',
  `total_price` double DEFAULT NULL COMMENT '订单总额',
  `real_price` double DEFAULT NULL COMMENT '实付金额',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `status` int DEFAULT NULL COMMENT '订单状态',
  `user_id` int DEFAULT NULL COMMENT '用户id',
  `remark` varchar(0) DEFAULT NULL COMMENT '备注',
  `table_number` int DEFAULT NULL COMMENT '座位号',
  `people_num` int DEFAULT NULL COMMENT '客户人数',
  `pay_time` timestamp NULL DEFAULT NULL COMMENT '支付时间',
  `pay_status` int DEFAULT NULL COMMENT '支付状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单表';

-- ----------------------------
-- Table structure for order_snapshot
-- ----------------------------
DROP TABLE IF EXISTS `order_snapshot`;
CREATE TABLE `order_snapshot` (
  `id` int NOT NULL COMMENT '订单商品快照id',
  `order_id` int DEFAULT NULL COMMENT '订单id',
  `product_id` int DEFAULT NULL COMMENT '商品id',
  `num` int DEFAULT NULL COMMENT '商品数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单商品快照';

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int NOT NULL COMMENT '菜肴id',
  `title` varchar(0) DEFAULT NULL COMMENT '菜品标题',
  `banner` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '轮播图',
  `tag` varchar(0) DEFAULT NULL COMMENT '菜品标签',
  `price` double DEFAULT NULL COMMENT '菜品价格',
  `desc` text COMMENT '详情',
  `sub_title` varchar(0) DEFAULT NULL COMMENT '副标题',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `operator` int DEFAULT NULL COMMENT '操作者',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜肴商品表';

SET FOREIGN_KEY_CHECKS = 1;
