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

 Date: 08/12/2020 17:24:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_category
-- ----------------------------
DROP TABLE IF EXISTS `admin_category`;
CREATE TABLE `admin_category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类名称',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `operator` int(0) NULL DEFAULT NULL COMMENT '操作者',
  `sort` int(0) NULL DEFAULT 1 COMMENT '排序',
  `status` int(0) NULL DEFAULT 1 COMMENT '状态',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '说明',
  `admin_id` int(0) NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_category
-- ----------------------------
INSERT INTO `admin_category` VALUES (1, '饮料、汽水', '2020-11-19 16:40:33', 1, 1, 1, '测试1', 1, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1606067176162&di=da298234f28102ee7b1595929f620320&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20171207%2F24ea177e9caf46c6b59d11ed5df14e54.jpeg');
INSERT INTO `admin_category` VALUES (2, '其他', '2020-11-20 15:12:40', 1, 2, 0, '测试2', 1, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3722815331,2657432749&fm=26&gp=0.jpg');
INSERT INTO `admin_category` VALUES (3, '麻辣', '2020-11-20 17:34:33', 1, 1, 1, '测试3', 1, 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1488573834,725410443&fm=26&gp=0.jpg');

-- ----------------------------
-- Table structure for admin_info
-- ----------------------------
DROP TABLE IF EXISTS `admin_info`;
CREATE TABLE `admin_info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '店铺id',
  `shop_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '店铺名称',
  `shop_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '店铺头像',
  `shop_user_id` int(0) NULL DEFAULT NULL COMMENT '店长id',
  `shop_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '店铺说明',
  `shop_status` int(0) NULL DEFAULT 1 COMMENT '店铺状态',
  `sort` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '店铺排序',
  `shop_background` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '店铺背景',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_info
-- ----------------------------
INSERT INTO `admin_info` VALUES (1, '徐闻粤皇楼', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2313222484,1037127654&fm=26&gp=0.jpg', 1, '广东徐闻正宗粤皇楼', 1, 3, 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2313222484,1037127654&fm=26&gp=0.jpg', '2020-11-30 16:31:49', '2020-12-08 15:34:14');

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
INSERT INTO `admin_role` VALUES (1, '店主', 1, '2020-11-12 15:14:27', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25', 1);
INSERT INTO `admin_role` VALUES (2, '文泽大保健的店小二', 1, '2020-11-17 11:15:50', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', 0);
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
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `status` int(0) NULL DEFAULT 1 COMMENT '1:正常，0:禁用',
  `parent_id` int(0) NULL DEFAULT 0 COMMENT '父级id，0为根节点',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_router
-- ----------------------------
INSERT INTO `admin_router` VALUES (1, '/operate', '运营板块', NULL, NULL, 1, 0);
INSERT INTO `admin_router` VALUES (2, '/operate/user', '运营列表', NULL, NULL, 1, 1);
INSERT INTO `admin_router` VALUES (3, '/operate/role', '权限列表', NULL, NULL, 1, 1);
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
INSERT INTO `admin_router` VALUES (19, '/operate/role/detail', '权限详情', NULL, NULL, 1, 1);
INSERT INTO `admin_router` VALUES (20, '/activity', '活动模块', NULL, NULL, 1, 0);
INSERT INTO `admin_router` VALUES (21, '/activity/real-time-info', '活动资讯', NULL, NULL, 1, 20);
INSERT INTO `admin_router` VALUES (22, '/activity/real-time-info/detail', '活动资讯详情', NULL, NULL, 1, 20);
INSERT INTO `admin_router` VALUES (23, '/other/home-rotation', '首页轮播', NULL, NULL, 1, 17);
INSERT INTO `admin_router` VALUES (24, '/other/home-rotation/details', '首页轮播编辑', NULL, NULL, 1, 17);
INSERT INTO `admin_router` VALUES (25, '/operate/shop', '店铺配置', NULL, '2020-11-30 15:17:16', 1, 1);

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
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_userinfo
-- ----------------------------
INSERT INTO `admin_userinfo` VALUES (1, 'admin', 'admin', '2020-11-11 15:46:22', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, 1, NULL);
INSERT INTO `admin_userinfo` VALUES (2, 'joker', '文泽大保健店小二', '2020-11-17 11:14:44', 'e10adc3949ba59abbe56e057f20f883e', 2, 2, 1, NULL);
INSERT INTO `admin_userinfo` VALUES (3, 'test', '技师8号', '2020-11-21 15:06:21', '6ac1e56bc78f031059be7be854522c4c', 2, 1, 1, NULL);

-- ----------------------------
-- Table structure for home_rotation
-- ----------------------------
DROP TABLE IF EXISTS `home_rotation`;
CREATE TABLE `home_rotation`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片地址',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联路径',
  `status` int(0) NOT NULL COMMENT '1:显示0:隐藏',
  `sort` int(0) NOT NULL COMMENT '权重排序',
  `admin_id` int(0) NULL DEFAULT NULL COMMENT '店ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of home_rotation
-- ----------------------------
INSERT INTO `home_rotation` VALUES (1, 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2313222484,1037127654&fm=26&gp=0.jpg', NULL, 1, 1, 1);
INSERT INTO `home_rotation` VALUES (2, 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2313222484,1037127654&fm=26&gp=0.jpg', NULL, 1, 2, 1);
INSERT INTO `home_rotation` VALUES (3, 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2313222484,1037127654&fm=26&gp=0.jpg', NULL, 1, 3, 1);
INSERT INTO `home_rotation` VALUES (4, 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2313222484,1037127654&fm=26&gp=0.jpg', NULL, 0, 4, 1);
INSERT INTO `home_rotation` VALUES (5, 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2313222484,1037127654&fm=26&gp=0.jpg', NULL, 1, 5, 1);
INSERT INTO `home_rotation` VALUES (6, 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2313222484,1037127654&fm=26&gp=0.jpg', NULL, 0, 6, 1);

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `open_id` int(0) NOT NULL COMMENT '微信id',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户昵称',
  PRIMARY KEY (`id`, `open_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (1, 1, 'http://fhk255.cn/wp-content/uploads/2020/02/joker.jpg', '2020-11-11 15:18:57', '小饭');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `total_price` double NULL DEFAULT 0 COMMENT '订单总额',
  `real_price` double NULL DEFAULT 0 COMMENT '实付金额',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '下单时间',
  `status` int(0) NULL DEFAULT 0 COMMENT '订单状态',
  `member_id` int(0) NULL DEFAULT NULL COMMENT '用户id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `table_num` int(0) NULL DEFAULT NULL COMMENT '座位号',
  `people_num` int(0) NOT NULL COMMENT '客户人数',
  `pay_time` timestamp(0) NULL DEFAULT NULL COMMENT '支付时间',
  `admin_id` int(0) NULL DEFAULT NULL,
  `order_id` bigint(0) NULL DEFAULT NULL,
  `tea_price` double NULL DEFAULT NULL COMMENT '茶位费',
  `product_price` double NULL DEFAULT NULL,
  `shop_id` int(0) NOT NULL COMMENT '店铺ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (9, 30, 30, '2020-11-24 14:44:09', 0, 1, '', 1, 2, NULL, 1, 120201124144409140, 4, 26, 1);
INSERT INTO `order` VALUES (10, 20, 20, '2020-11-29 18:02:08', 0, 1, '', 1, 1, NULL, 1, 120201129180208030, 2, 18, 1);
INSERT INTO `order` VALUES (11, 20, 20, '2020-11-29 18:04:39', 0, 1, '', 1, 1, NULL, 1, 120201129180439220, 2, 18, 1);
INSERT INTO `order` VALUES (12, 20, 20, '2020-11-29 18:13:06', 0, 1, '', 1, 1, NULL, 1, 120201129181306100, 2, 18, 1);
INSERT INTO `order` VALUES (13, 20, 20, '2020-11-29 18:13:07', 0, 1, '', 1, 1, NULL, 1, 120201129181307280, 2, 18, 1);
INSERT INTO `order` VALUES (14, 20, 20, '2020-11-29 18:14:14', 0, 1, '', 1, 1, NULL, 1, 120201129181414300, 2, 18, 1);
INSERT INTO `order` VALUES (15, 20, 20, '2020-11-29 18:39:52', 0, 1, '', 1, 1, NULL, 1, 120201129183952430, 2, 18, 1);
INSERT INTO `order` VALUES (16, 17, 17, '2020-12-08 09:40:10', 0, 1, '哈哈', 1, 6, NULL, 1, 120201208094010270, 12, 5, 1);
INSERT INTO `order` VALUES (17, 10, 10, '2020-12-08 14:55:36', 0, 1, '放散阀', 1, 3, NULL, 1, 120201208145536180, 6, 4, 1);

-- ----------------------------
-- Table structure for order_snapshot
-- ----------------------------
DROP TABLE IF EXISTS `order_snapshot`;
CREATE TABLE `order_snapshot`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '订单商品快照id',
  `order_id` int(0) NULL DEFAULT NULL COMMENT '订单id',
  `product_id` int(0) NULL DEFAULT NULL COMMENT '商品id',
  `count` int(0) NULL DEFAULT NULL COMMENT '商品数量',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `banner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT 0 COMMENT '快照单价',
  `total_price` double NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单商品快照' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_snapshot
-- ----------------------------
INSERT INTO `order_snapshot` VALUES (14, 9, 4, 1, '红烧排骨', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3438952604,626888534&fm=26&gp=0.jpg', 2, 2);
INSERT INTO `order_snapshot` VALUES (15, 9, 1, 2, '可口可乐', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1606066317983&di=835aa7b8d8f7ca520bc921f0013ffe6a&imgtype=0&src=http%3A%2F%2F4888152.s21i-4.faidns.com%2F2%2FABUIABACGAAgzvv_pQUog7udqwQwrAI4rAI.jpg', 3, 6);
INSERT INTO `order_snapshot` VALUES (16, 9, 2, 4, '雪碧', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3987685708,3519441173&fm=26&gp=0.jpg', 2, 8);
INSERT INTO `order_snapshot` VALUES (17, 9, 3, 5, '王老吉', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1686637159,3901112649&fm=26&gp=0.jpg', 2, 10);
INSERT INTO `order_snapshot` VALUES (18, 10, 1, 2, '可口可乐', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1606066317983&di=835aa7b8d8f7ca520bc921f0013ffe6a&imgtype=0&src=http%3A%2F%2F4888152.s21i-4.faidns.com%2F2%2FABUIABACGAAgzvv_pQUog7udqwQwrAI4rAI.jpg', 3, 6);
INSERT INTO `order_snapshot` VALUES (19, 10, 5, 1, '辣椒炒肉', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1815888668,904241512&fm=26&gp=0.jpg', 2, 2);
INSERT INTO `order_snapshot` VALUES (20, 10, 3, 2, '王老吉', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1686637159,3901112649&fm=26&gp=0.jpg', 2, 4);
INSERT INTO `order_snapshot` VALUES (21, 10, 2, 3, '雪碧', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3987685708,3519441173&fm=26&gp=0.jpg', 2, 6);
INSERT INTO `order_snapshot` VALUES (22, 11, 5, 1, '辣椒炒肉', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1815888668,904241512&fm=26&gp=0.jpg', 2, 2);
INSERT INTO `order_snapshot` VALUES (23, 11, 1, 2, '可口可乐', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1606066317983&di=835aa7b8d8f7ca520bc921f0013ffe6a&imgtype=0&src=http%3A%2F%2F4888152.s21i-4.faidns.com%2F2%2FABUIABACGAAgzvv_pQUog7udqwQwrAI4rAI.jpg', 3, 6);
INSERT INTO `order_snapshot` VALUES (24, 11, 2, 3, '雪碧', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3987685708,3519441173&fm=26&gp=0.jpg', 2, 6);
INSERT INTO `order_snapshot` VALUES (25, 11, 3, 2, '王老吉', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1686637159,3901112649&fm=26&gp=0.jpg', 2, 4);
INSERT INTO `order_snapshot` VALUES (26, 12, 1, 2, '可口可乐', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1606066317983&di=835aa7b8d8f7ca520bc921f0013ffe6a&imgtype=0&src=http%3A%2F%2F4888152.s21i-4.faidns.com%2F2%2FABUIABACGAAgzvv_pQUog7udqwQwrAI4rAI.jpg', 3, 6);
INSERT INTO `order_snapshot` VALUES (27, 12, 2, 3, '雪碧', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3987685708,3519441173&fm=26&gp=0.jpg', 2, 6);
INSERT INTO `order_snapshot` VALUES (28, 12, 3, 2, '王老吉', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1686637159,3901112649&fm=26&gp=0.jpg', 2, 4);
INSERT INTO `order_snapshot` VALUES (29, 12, 5, 1, '辣椒炒肉', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1815888668,904241512&fm=26&gp=0.jpg', 2, 2);
INSERT INTO `order_snapshot` VALUES (30, 13, 5, 1, '辣椒炒肉', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1815888668,904241512&fm=26&gp=0.jpg', 2, 2);
INSERT INTO `order_snapshot` VALUES (31, 13, 1, 2, '可口可乐', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1606066317983&di=835aa7b8d8f7ca520bc921f0013ffe6a&imgtype=0&src=http%3A%2F%2F4888152.s21i-4.faidns.com%2F2%2FABUIABACGAAgzvv_pQUog7udqwQwrAI4rAI.jpg', 3, 6);
INSERT INTO `order_snapshot` VALUES (32, 13, 2, 3, '雪碧', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3987685708,3519441173&fm=26&gp=0.jpg', 2, 6);
INSERT INTO `order_snapshot` VALUES (33, 13, 3, 2, '王老吉', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1686637159,3901112649&fm=26&gp=0.jpg', 2, 4);
INSERT INTO `order_snapshot` VALUES (34, 14, 1, 2, '可口可乐', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1606066317983&di=835aa7b8d8f7ca520bc921f0013ffe6a&imgtype=0&src=http%3A%2F%2F4888152.s21i-4.faidns.com%2F2%2FABUIABACGAAgzvv_pQUog7udqwQwrAI4rAI.jpg', 3, 6);
INSERT INTO `order_snapshot` VALUES (35, 14, 2, 3, '雪碧', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3987685708,3519441173&fm=26&gp=0.jpg', 2, 6);
INSERT INTO `order_snapshot` VALUES (36, 14, 3, 2, '王老吉', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1686637159,3901112649&fm=26&gp=0.jpg', 2, 4);
INSERT INTO `order_snapshot` VALUES (37, 14, 5, 1, '辣椒炒肉', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1815888668,904241512&fm=26&gp=0.jpg', 2, 2);
INSERT INTO `order_snapshot` VALUES (38, 15, 5, 1, '辣椒炒肉', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1815888668,904241512&fm=26&gp=0.jpg', 2, 2);
INSERT INTO `order_snapshot` VALUES (39, 15, 1, 2, '可口可乐', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1606066317983&di=835aa7b8d8f7ca520bc921f0013ffe6a&imgtype=0&src=http%3A%2F%2F4888152.s21i-4.faidns.com%2F2%2FABUIABACGAAgzvv_pQUog7udqwQwrAI4rAI.jpg', 3, 6);
INSERT INTO `order_snapshot` VALUES (40, 15, 2, 3, '雪碧', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3987685708,3519441173&fm=26&gp=0.jpg', 2, 6);
INSERT INTO `order_snapshot` VALUES (41, 15, 3, 2, '王老吉', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1686637159,3901112649&fm=26&gp=0.jpg', 2, 4);
INSERT INTO `order_snapshot` VALUES (42, 16, 2, 1, '雪碧', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3987685708,3519441173&fm=26&gp=0.jpg', 2, 2);
INSERT INTO `order_snapshot` VALUES (43, 16, 1, 1, '可口可乐', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1606066317983&di=835aa7b8d8f7ca520bc921f0013ffe6a&imgtype=0&src=http%3A%2F%2F4888152.s21i-4.faidns.com%2F2%2FABUIABACGAAgzvv_pQUog7udqwQwrAI4rAI.jpg', 3, 3);
INSERT INTO `order_snapshot` VALUES (44, 17, 5, 1, '辣椒炒肉', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1815888668,904241512&fm=26&gp=0.jpg', 2, 2);
INSERT INTO `order_snapshot` VALUES (45, 17, 3, 1, '王老吉', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1686637159,3901112649&fm=26&gp=0.jpg', 2, 2);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '菜肴id',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜品标题',
  `banner` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '轮播图',
  `category_ids` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜品标签',
  `price` double UNSIGNED NOT NULL COMMENT '菜品价格',
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '详情',
  `sub_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '副标题',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `operator` int(0) NULL DEFAULT NULL COMMENT '操作者',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `admin_id` int(0) NULL DEFAULT NULL COMMENT '店铺id',
  `status` int(0) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜肴商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '可口可乐', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1606066317983&di=835aa7b8d8f7ca520bc921f0013ffe6a&imgtype=0&src=http%3A%2F%2F4888152.s21i-4.faidns.com%2F2%2FABUIABACGAAgzvv_pQUog7udqwQwrAI4rAI.jpg', '1', 3, NULL, '冰镇一下更可口哦', '2020-11-19 14:02:19', 1, '2020-11-22 22:44:07', 1, 1);
INSERT INTO `product` VALUES (2, '雪碧', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3987685708,3519441173&fm=26&gp=0.jpg', '1', 2, NULL, NULL, '2020-11-20 15:09:14', 1, '2020-11-29 15:44:10', 1, 1);
INSERT INTO `product` VALUES (3, '王老吉', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1686637159,3901112649&fm=26&gp=0.jpg', '1', 2, NULL, NULL, '2020-11-20 15:09:20', 1, '2020-11-29 15:44:11', 1, 1);
INSERT INTO `product` VALUES (4, '红烧排骨', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3438952604,626888534&fm=26&gp=0.jpg', '2,1', 2, NULL, NULL, '2020-11-20 15:16:07', 1, '2020-11-22 22:45:13', 1, 0);
INSERT INTO `product` VALUES (5, '辣椒炒肉', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1815888668,904241512&fm=26&gp=0.jpg', '1', 2, NULL, NULL, '2020-11-21 15:54:47', 1, '2020-11-22 22:45:51', 1, 1);

-- ----------------------------
-- Table structure for real_time_info
-- ----------------------------
DROP TABLE IF EXISTS `real_time_info`;
CREATE TABLE `real_time_info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `picture` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动图片',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '活动内容',
  `star_time` timestamp(0) NULL DEFAULT NULL COMMENT '活动开始时间',
  `end_time` timestamp(0) NULL DEFAULT NULL COMMENT '活动结束时间',
  `admin_id` int(0) NULL DEFAULT NULL COMMENT '店ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of real_time_info
-- ----------------------------
INSERT INTO `real_time_info` VALUES (1, 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2313222484,1037127654&fm=26&gp=0.jpg', '测试1', '11111111', '2020-11-19 14:27:36', '2020-11-20 14:27:41', 1);
INSERT INTO `real_time_info` VALUES (3, 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2313222484,1037127654&fm=26&gp=0.jpg', '测试3', '33333333', '2020-11-20 14:39:04', '2020-11-21 14:39:08', 1);
INSERT INTO `real_time_info` VALUES (4, 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2313222484,1037127654&fm=26&gp=0.jpg', '发生', '<p>发生吧</p>', '2020-11-19 00:00:00', '2020-11-20 00:00:00', 1);
INSERT INTO `real_time_info` VALUES (5, 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2313222484,1037127654&fm=26&gp=0.jpg', '哈哈', '<p>发顺丰</p>', '2020-11-19 00:00:00', '2020-11-21 00:00:00', 1);
INSERT INTO `real_time_info` VALUES (6, 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2313222484,1037127654&fm=26&gp=0.jpg', '发生2223', '<p>2223</p>', '2020-11-21 00:00:00', '2020-11-22 00:00:00', 1);
INSERT INTO `real_time_info` VALUES (8, 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2313222484,1037127654&fm=26&gp=0.jpg', '新增1', '<p>新增1新增1新增1新增1新增1</p>', '2020-11-20 00:00:00', '2020-11-29 00:00:00', 1);

-- ----------------------------
-- Table structure for user_agreement
-- ----------------------------
DROP TABLE IF EXISTS `user_agreement`;
CREATE TABLE `user_agreement`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `agreement` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '用户协议',
  `admin_id` int(0) NULL DEFAULT NULL COMMENT '店ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_agreement
-- ----------------------------
INSERT INTO `user_agreement` VALUES (1, '<p>飞洒发撒发是34</p><p style=\"text-align:center;\">法法</p>', 1);

SET FOREIGN_KEY_CHECKS = 1;
