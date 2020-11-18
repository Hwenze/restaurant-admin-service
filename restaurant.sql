/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : restaurant

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 18/11/2020 18:12:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_category
-- ----------------------------
DROP TABLE IF EXISTS `admin_category`;
CREATE TABLE `admin_category`  (
  `id` int(0) NOT NULL COMMENT '分类id',
  `name` int(0) NULL DEFAULT NULL COMMENT '分类名称',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `operator` int(0) NULL DEFAULT NULL COMMENT '操作者',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `status` int(0) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_category
-- ----------------------------

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限昵称',
  `admin_id` int(0) NULL DEFAULT NULL COMMENT '店id',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `router_ids` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '可以访问的页面id',
  `status` int(0) NULL DEFAULT 1 COMMENT '1:正常，0:冻结',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1000 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES (1, '店主', 1, '2020-11-12 15:14:27', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18', 1);
INSERT INTO `admin_role` VALUES (2, '文泽大保健的店小二', 1, '2020-11-17 11:15:50', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', 1);
INSERT INTO `admin_role` VALUES (999, '游客', 0, '2020-11-14 13:50:48', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15', 1);

-- ----------------------------
-- Table structure for admin_router
-- ----------------------------
DROP TABLE IF EXISTS `admin_router`;
CREATE TABLE `admin_router`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '页面ID',
  `router_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '页面地址',
  `router_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '页面名称',
  `router_icon` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '页面图标',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `status` int(0) NULL DEFAULT 1 COMMENT '1:正常，0:禁用',
  `parent_id` int(0) NULL DEFAULT 0 COMMENT '父级id，0为根节点',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_router
-- ----------------------------
INSERT INTO `admin_router` VALUES (1, '/operate', '运营板块', NULL, NULL, 1, 0);
INSERT INTO `admin_router` VALUES (2, '/operate/user', '运营列表', NULL, NULL, 1, 1);
INSERT INTO `admin_router` VALUES (3, '/operate/detail', '运营详情', NULL, NULL, 1, 1);
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
INSERT INTO `admin_router` VALUES (16, '/operate/home', '运营首页', NULL, NULL, 1, 1);
INSERT INTO `admin_router` VALUES (17, '/other', '其他模块', NULL, NULL, 1, 0);
INSERT INTO `admin_router` VALUES (18, '/other/user-agreement', '用户协议', NULL, NULL, 1, 17);

-- ----------------------------
-- Table structure for admin_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `admin_userinfo`;
CREATE TABLE `admin_userinfo`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nickname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'e10adc3949ba59abbe56e057f20f883e',
  `role` int(0) NULL DEFAULT NULL COMMENT '用户权限',
  `admin_id` int(0) NULL DEFAULT NULL COMMENT '店id',
  `status` int(0) NULL DEFAULT 1 COMMENT '1:正常0:冻结',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_userinfo
-- ----------------------------
INSERT INTO `admin_userinfo` VALUES (1, 'admin', 'admin', '2020-11-11 15:46:22', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, 1);
INSERT INTO `admin_userinfo` VALUES (2, 'joker', '文泽大保健店小二', '2020-11-17 11:14:44', 'e10adc3949ba59abbe56e057f20f883e', 2, 1, 1);

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `open_id` int(0) NOT NULL COMMENT '微信id',
  `avatar` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `nickname` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户昵称',
  PRIMARY KEY (`id`, `open_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (1, 1, NULL, '2020-11-11 15:18:57', NULL);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int(0) NOT NULL COMMENT '订单id',
  `total_price` double NULL DEFAULT NULL COMMENT '订单总额',
  `real_price` double NULL DEFAULT NULL COMMENT '实付金额',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '下单时间',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态',
  `user_id` int(0) NULL DEFAULT NULL COMMENT '用户id',
  `remark` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `table_number` int(0) NULL DEFAULT NULL COMMENT '座位号',
  `people_num` int(0) NULL DEFAULT NULL COMMENT '客户人数',
  `pay_time` timestamp(0) NULL DEFAULT NULL COMMENT '支付时间',
  `pay_status` int(0) NULL DEFAULT NULL COMMENT '支付状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for order_snapshot
-- ----------------------------
DROP TABLE IF EXISTS `order_snapshot`;
CREATE TABLE `order_snapshot`  (
  `id` int(0) NOT NULL COMMENT '订单商品快照id',
  `order_id` int(0) NULL DEFAULT NULL COMMENT '订单id',
  `product_id` int(0) NULL DEFAULT NULL COMMENT '商品id',
  `num` int(0) NULL DEFAULT NULL COMMENT '商品数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单商品快照' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_snapshot
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(0) NOT NULL COMMENT '菜肴id',
  `title` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜品标题',
  `banner` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '轮播图',
  `tag` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜品标签',
  `price` double NULL DEFAULT NULL COMMENT '菜品价格',
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '详情',
  `sub_title` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '副标题',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `operator` int(0) NULL DEFAULT NULL COMMENT '操作者',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜肴商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for user_agreement
-- ----------------------------
DROP TABLE IF EXISTS `user_agreement`;
CREATE TABLE `user_agreement`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `agreement` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '用户协议',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_agreement
-- ----------------------------
INSERT INTO `user_agreement` VALUES (1, '<p>飞洒发撒发是34</p><p style=\"text-align:center;\">法法</p>');

SET FOREIGN_KEY_CHECKS = 1;
