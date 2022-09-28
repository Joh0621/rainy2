/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : dm-platform

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 29/09/2022 00:14:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_user_role_rel
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role_rel`;
CREATE TABLE `t_user_role_rel`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL COMMENT '用户id',
  `role_id` int NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user_role_rel
-- ----------------------------
INSERT INTO `t_user_role_rel` VALUES (1, 1, 1);
INSERT INTO `t_user_role_rel` VALUES (7, 13, 6);
INSERT INTO `t_user_role_rel` VALUES (11, 2, 5);
INSERT INTO `t_user_role_rel` VALUES (12, 2, 6);
INSERT INTO `t_user_role_rel` VALUES (15, 4, 3);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `org_id` int NULL DEFAULT NULL COMMENT '组织id',
  `position_id` int NULL DEFAULT NULL COMMENT '职位id',
  `username` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '摘要算法盐',
  `nick_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `birthday` date NULL DEFAULT NULL,
  `avatar` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `telephone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint NULL DEFAULT NULL COMMENT '用户状态：0 未激活，1 正常',
  `username_expired_time` datetime NULL DEFAULT NULL COMMENT '账号过期时间',
  `password_expired_time` datetime NULL DEFAULT NULL COMMENT '密码过期时间',
  `login_count` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '登录次数',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后登录ip',
  `browser` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后登录浏览器',
  `os` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后登录操作系统',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标志',
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 124 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 4, 1, 'admin', '123456', 'admin', '超级管理员', '2022-09-01', '/avatar/4a5972c0dea543d885d0802b8c2b7f2f', '1@qq.com', '17600902030', 0, NULL, NULL, '942', '2022-08-29 14:50:03', '127.0.0.1', 'Chrome', 'OSX', '2022-03-29 18:52:44', NULL, NULL, 0, NULL);
INSERT INTO `t_user` VALUES (2, 4, 27, 'notice', '123456', 'admin', '公告发布员', '2022-09-01', '/avatar/avatar.jpg', '2@qq.com', '17600902030', 0, NULL, NULL, '1', '2022-05-05 16:11:38', '127.0.0.1', 'Chrome/97.0.4692.71', 'OSX/10_15_7', NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_user` VALUES (3, 3, 21, '234234', '123456', 'admin', '23423', '2022-09-01', '/avatar/avatar.jpg', '24242424@qq.com', '24242222422', 0, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `t_user` VALUES (4, 4, 28, 'audit', '123456', 'admin', '审计管理员', '2022-09-01', '/avatar/avatar.jpg', '3@qq.com', '13131111311', 0, NULL, NULL, '1', '2022-04-16 17:20:53', '127.0.0.1', 'Chrome/100.0.4896.127', 'Windows 10 or Windows Server 2016/10.0', NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_user` VALUES (5, 1, 20, 'admin123', '123456', 'admin', '123', '2022-09-01', '/avatar/avatar.jpg', '8@qq.com', '123', 0, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `t_user` VALUES (6, 6, 27, 'admin11', '123456', 'admin', 'fgc', '2022-09-01', '/avatar/avatar.jpg', '4@qq.com', '13131111311', 0, NULL, NULL, '2', '2022-04-16 17:32:10', '127.0.0.1', 'Chrome/100.0.4896.127', 'Windows 10 or Windows Server 2016/10.0', NULL, NULL, NULL, 1, NULL);

-- ----------------------------
-- Table structure for t_role_menu_rel
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu_rel`;
CREATE TABLE `t_role_menu_rel`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NULL DEFAULT NULL COMMENT '角色id',
  `menu_id` int NULL DEFAULT NULL COMMENT '菜单id',
  `half` tinyint NULL DEFAULT NULL COMMENT '是否半选状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 293 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色菜单关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_role_menu_rel
-- ----------------------------
INSERT INTO `t_role_menu_rel` VALUES (19, 1, 11, 0);
INSERT INTO `t_role_menu_rel` VALUES (20, 1, 29, 0);
INSERT INTO `t_role_menu_rel` VALUES (21, 1, 30, 0);
INSERT INTO `t_role_menu_rel` VALUES (22, 1, 31, 0);
INSERT INTO `t_role_menu_rel` VALUES (23, 1, 32, 0);
INSERT INTO `t_role_menu_rel` VALUES (24, 1, 33, 0);
INSERT INTO `t_role_menu_rel` VALUES (25, 1, 97, 0);
INSERT INTO `t_role_menu_rel` VALUES (26, 1, 2, 1);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色码',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `is_default` tinyint NULL DEFAULT NULL COMMENT '是否是默认角色，默认角色不能删除',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `del_flag` tinyint NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '超级管理员', 'role_superAdmin', 99, '超级管理员', 0, '2022-04-26 17:04:04', 'admin', '2022-09-20 09:45:23', NULL, 0);
INSERT INTO `t_role` VALUES (2, '系统管理员', 'role_admin', 99, '对系统进行配置', 0, '2022-04-05 22:44:44', 'admin', '2022-05-05 16:06:00', 'admin', 0);
INSERT INTO `t_role` VALUES (3, '审计管理员', 'role_audit', 99, '查看各种日志', 0, '2022-04-16 17:19:45', 'admin', '2022-05-05 16:06:12', 'admin', 0);
INSERT INTO `t_role` VALUES (4, '默认角色', 'role_default', 99, '默认角色', 1, '2022-04-22 16:16:44', 'admin', '2022-09-19 11:49:09', NULL, 0);
INSERT INTO `t_role` VALUES (5, '公告发布员', 'role_notice', 99, '公告发布员', 0, '2022-05-05 16:07:10', 'admin', '2022-05-05 16:07:10', 'admin', 0);
INSERT INTO `t_role` VALUES (6, '测试', 'role_test', 99, '测试', 0, '2022-05-05 22:14:19', 'admin', '2022-05-26 21:25:37', 'admin', 0);
INSERT INTO `t_role` VALUES (23, '审计管理员1', '1', 1, NULL, 0, '2022-09-19 23:05:49', NULL, '2022-09-19 23:05:54', NULL, 1);
INSERT INTO `t_role` VALUES (24, '审批角色', 'sys_approval', 99, '拥有该角色时可进行审批', 0, '2022-09-21 10:48:59', NULL, '2022-09-21 10:48:59', NULL, 0);

-- ----------------------------
-- Table structure for t_position
-- ----------------------------
DROP TABLE IF EXISTS `t_position`;
CREATE TABLE `t_position`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职位名称',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '唯一编码',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `del_flag` tinyint NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_position
-- ----------------------------
INSERT INTO `t_position` VALUES (1, '董事长', 'dsz', '管理公司一切事物，大老板', 99, '2022-04-04 00:02:33', 'admin', '2022-09-21 09:32:16', NULL, 0);
INSERT INTO `t_position` VALUES (2, '副董事长', 'fdsz', '跑腿的111', 99, '2022-04-04 00:02:44', 'admin', '2022-09-18 21:18:38', NULL, 0);
INSERT INTO `t_position` VALUES (3, '普通员工', 'normal', '端茶，倒水，刷厕所', 99, '2022-04-04 14:13:18', 'admin', '2022-09-19 10:51:01', NULL, 0);
INSERT INTO `t_position` VALUES (4, '总监', 'zj', '腿腿', 99, '2022-04-10 19:54:55', 'admin', '2022-09-19 10:51:05', NULL, 0);
INSERT INTO `t_position` VALUES (5, '2323', '23', '23', 99, '2022-09-18 21:16:31', NULL, '2022-09-18 21:16:31', NULL, 1);
INSERT INTO `t_position` VALUES (6, '2323', '23', '23', 99, '2022-09-18 21:16:58', NULL, '2022-09-18 21:16:58', NULL, 1);
INSERT INTO `t_position` VALUES (7, '111', '222', '2222', 99, '2022-09-19 10:51:13', NULL, '2022-09-19 10:51:13', NULL, 1);

-- ----------------------------
-- Table structure for t_org_user_rel
-- ----------------------------
DROP TABLE IF EXISTS `t_org_user_rel`;
CREATE TABLE `t_org_user_rel`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `org_id` int NULL DEFAULT NULL COMMENT '组织id',
  `user_id` int NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织用户关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_org_user_rel
-- ----------------------------

-- ----------------------------
-- Table structure for t_org
-- ----------------------------
DROP TABLE IF EXISTS `t_org`;
CREATE TABLE `t_org`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '唯一编码',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `del_flag` tinyint NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织机构表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_org
-- ----------------------------
INSERT INTO `t_org` VALUES (1, 0, '电科院', 'dfgx', '电科院', 99, '2022-04-05 17:57:52', 'admin', '2022-09-28 14:47:57', NULL, 0);
INSERT INTO `t_org` VALUES (2, 1, '工业事业部', 'gy', '工业事业部', 99, '2022-04-05 17:57:52', 'admin', '2022-09-18 20:53:05', NULL, 1);
INSERT INTO `t_org` VALUES (3, 1, '联通事业部', 'lt', '联通事业部', 99, '2022-04-05 17:57:52', 'admin', '2022-05-31 12:04:40', 'admin', 1);
INSERT INTO `t_org` VALUES (4, 2, '电力行业中心', 'dlhezx', '电力行业中心', 99, '2022-04-05 17:57:52', 'admin', '2022-09-18 21:00:28', NULL, 1);
INSERT INTO `t_org` VALUES (5, 1, '新能源', '5', '新能源', 99, '2022-04-05 17:57:52', 'admin', '2022-09-28 16:02:11', NULL, 0);
INSERT INTO `t_org` VALUES (6, 1, '金属', '6', '金属', 99, '2022-04-10 19:53:58', 'admin', '2022-09-28 16:02:14', NULL, 0);
INSERT INTO `t_org` VALUES (7, 2, '开发组', '7', '开发组', 99, '2022-04-10 19:54:30', 'admin', '2022-06-04 17:35:28', 'bonctest', 1);
INSERT INTO `t_org` VALUES (14, 2, '112', '1212', 'asdfasdf', 99, '2022-09-18 21:02:51', NULL, '2022-09-18 21:02:51', NULL, 1);
INSERT INTO `t_org` VALUES (15, 0, '2323', '23', NULL, 99, '2022-09-18 21:03:55', NULL, '2022-09-18 21:03:55', NULL, 1);
INSERT INTO `t_org` VALUES (16, 1, '锅炉', 'gls', '锅炉', 99, '2022-09-26 17:16:35', NULL, '2022-09-28 16:02:07', NULL, 0);
INSERT INTO `t_org` VALUES (17, 1, '测试', 'test', NULL, 98, '2022-09-26 17:17:12', NULL, '2022-09-26 17:17:20', NULL, 0);
INSERT INTO `t_org` VALUES (18, 17, 'test1', 'test1', NULL, 99, '2022-09-26 17:19:13', NULL, '2022-09-26 17:19:13', NULL, 0);
INSERT INTO `t_org` VALUES (19, 17, 'test2', 'test2', NULL, 99, '2022-09-26 17:19:20', NULL, '2022-09-26 17:19:20', NULL, 0);

-- ----------------------------
-- Table structure for t_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `t_operation_log`;
CREATE TABLE `t_operation_log`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `module` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模块',
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作类型',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `datetime` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作详情',
  `path` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求路径',
  `method` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `remote_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `browser` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器',
  `os` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `class_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类名',
  `method_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方法名',
  `params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '参数',
  `result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '返回结果',
  `process_time` int NULL DEFAULT NULL COMMENT '执行时长',
  `success` tinyint NULL DEFAULT NULL COMMENT '成功失败',
  `error_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '错误信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_datetime`(`datetime` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_operation_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int NULL DEFAULT NULL COMMENT '父id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由名称',
  `path` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由地址',
  `component` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '前端vue组件',
  `permission` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限码',
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单类型',
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `icon` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内外链访问地址',
  `target` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '打开方式',
  `show` tinyint NULL DEFAULT NULL COMMENT '是否展示',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint NULL DEFAULT NULL COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 151 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES (1, 0, '工作台', '/workspace', 'system/dashboard/Workplace', NULL, '1', '工作台', 'desktop', '', '_component', 1, 2, NULL, 'admin', '2022-05-05 16:16:19', 'admin', '2022-06-15 19:22:38', 0);
INSERT INTO `t_menu` VALUES (2, 0, '组织架构', '', 'PageView', NULL, '1', '组织架构', 'cluster', '', '_component', 1, 4, NULL, 'admin', '2022-05-05 16:16:46', 'admin', '2022-05-09 10:05:29', 0);
INSERT INTO `t_menu` VALUES (3, 0, '权限管理', '', 'RouteView', NULL, '1', '权限管理', 'team', '', '_component', 1, 6, NULL, 'admin', '2022-05-05 16:17:24', 'admin', '2022-05-09 10:06:00', 0);
INSERT INTO `t_menu` VALUES (4, 0, '系统管理', '', 'RouteView', NULL, '1', '系统管理', 'setting', '', '_component', 1, 8, NULL, 'admin', '2022-05-05 16:17:34', 'admin', '2022-05-09 10:05:42', 0);
INSERT INTO `t_menu` VALUES (5, 0, '日志管理', '', 'RouteView', NULL, '1', '日志管理', 'credit-card', '', '_component', 1, 16, NULL, 'admin', '2022-05-05 16:17:47', 'admin', '2022-05-09 10:10:44', 0);
INSERT INTO `t_menu` VALUES (6, 0, '系统监控', '', 'RouteView', NULL, '1', '系统监控', 'fund', '', '_component', 1, 10, NULL, 'admin', '2022-05-05 16:18:10', 'admin', '2022-05-09 10:06:25', 0);
INSERT INTO `t_menu` VALUES (7, 0, '通知公告', '', 'RouteView', NULL, '1', '通知公告', 'sound', '', '_component', 1, 12, NULL, 'admin', '2022-05-05 16:18:21', 'admin', '2022-05-09 10:06:46', 0);
INSERT INTO `t_menu` VALUES (8, 0, '定时任务', '', 'RouteView', NULL, '1', '定时任务', 'hourglass', '', '_component', 1, 14, NULL, 'admin', '2022-05-05 16:18:31', 'admin', '2022-05-09 10:09:53', 0);
INSERT INTO `t_menu` VALUES (9, 0, '开发管理', '', 'PageView', NULL, '1', '开发管理', 'solution', '', '_component', 1, 99, NULL, 'admin', '2022-05-05 16:19:00', 'admin', '2022-05-09 10:11:16', 1);
INSERT INTO `t_menu` VALUES (10, 2, '组织机构管理', '/org', 'system/org/Org', NULL, '1', '组织机构管理', 'pause-circle', '', '_component', 1, 2, NULL, 'admin', '2022-05-05 16:19:53', 'admin', '2022-05-06 19:17:24', 0);
INSERT INTO `t_menu` VALUES (11, 2, '岗位管理', '/position', 'system/org/Position', NULL, '1', '岗位管理', 'pause-circle', '', '_component', 1, 4, NULL, 'admin', '2022-05-05 16:20:32', 'admin', '2022-05-06 19:17:35', 0);
INSERT INTO `t_menu` VALUES (12, 3, '用户管理', '/users', 'system/permission/User', NULL, '1', '用户管理', 'user', '', '_component', 1, 2, NULL, 'admin', '2022-05-05 16:20:54', 'admin', '2022-05-09 10:08:17', 0);
INSERT INTO `t_menu` VALUES (13, 3, '角色管理', '/role', 'system/permission/Role', NULL, '1', '角色管理', 'usergroup-delete', '', '_component', 1, 4, NULL, 'admin', '2022-05-05 16:21:12', 'admin', '2022-05-09 10:09:12', 0);
INSERT INTO `t_menu` VALUES (14, 3, '菜单管理', '/menu', 'system/permission/Menu', NULL, '1', '菜单管理', 'bars', '', '_component', 1, 6, NULL, 'admin', '2022-05-05 16:21:34', 'admin', '2022-05-09 10:08:06', 0);
INSERT INTO `t_menu` VALUES (15, 4, '配置管理', '/config', 'system/sys/Config', NULL, '1', '配置管理', 'pause-circle', '', '_component', 1, 2, NULL, 'admin', '2022-05-05 16:58:38', 'admin', '2022-05-06 19:18:10', 0);
INSERT INTO `t_menu` VALUES (16, 4, '字典管理', '/dict', 'system/sys/Dict', NULL, '1', '字典管理', 'pause-circle', '', '_component', 1, 4, NULL, 'admin', '2022-05-05 16:59:19', 'admin', '2022-05-06 19:18:15', 0);
INSERT INTO `t_menu` VALUES (17, 4, '字典项管理', '/dict/items', 'system/sys/DictItem', NULL, '1', '字典项管理', 'pause-circle', '', '_component', 1, 6, NULL, 'admin', '2022-05-05 16:59:57', 'admin', '2022-07-25 15:46:25', 0);
INSERT INTO `t_menu` VALUES (18, 6, '服务监控', '/sys/monitor', 'system/sys/Monitor', NULL, '1', '服务监控', 'pause-circle', '', '_component', 1, 2, NULL, 'admin', '2022-05-05 17:02:28', 'admin', '2022-05-06 19:18:56', 0);
INSERT INTO `t_menu` VALUES (19, 6, '在线用户', '/user/online', 'system/sys/UserOnline', NULL, '1', '在线用户', 'pause-circle', '', '_component', 1, 6, NULL, 'admin', '2022-05-05 17:03:27', 'admin', '2022-07-18 15:25:25', 0);
INSERT INTO `t_menu` VALUES (20, 7, '公告管理', '/notice', 'system/notice/Notice', NULL, '1', '公告管理', 'pause-circle', '', '_component', 1, 99, NULL, 'admin', '2022-05-05 17:06:38', 'admin', '2022-05-05 17:06:38', 0);
INSERT INTO `t_menu` VALUES (21, 8, '任务管理', '/task', 'system/task/Task', NULL, '1', '任务管理', 'pause-circle', '', '_component', 1, 2, NULL, 'admin', '2022-05-05 17:07:16', 'admin', '2022-05-06 19:19:15', 0);
INSERT INTO `t_menu` VALUES (22, 8, '执行日志', '/task/log', 'system/task/TaskLog', NULL, '1', '执行日志', 'pause-circle', '', '_component', 1, 4, NULL, 'admin', '2022-05-05 17:08:11', 'admin', '2022-05-06 19:19:20', 0);
INSERT INTO `t_menu` VALUES (23, 10, '查询组织树', NULL, '', NULL, '1', '查询组织树', 'pause-circle', '/orgs/tree', 'none', 1, 99, NULL, 'admin', '2022-05-05 17:35:19', 'admin', '2022-05-05 17:47:22', 0);
INSERT INTO `t_menu` VALUES (24, 10, '查询组织列表', NULL, '', NULL, '1', '查询组织列表', 'pause-circle', '/orgs', 'none', 1, 99, NULL, 'admin', '2022-05-05 17:36:08', 'admin', '2022-05-05 17:47:43', 0);
INSERT INTO `t_menu` VALUES (25, 10, '新增组织', NULL, '', NULL, '1', '新增组织', 'pause-circle', '/org', 'none', 1, 99, NULL, 'admin', '2022-05-05 17:36:42', 'admin', '2022-05-05 17:47:49', 0);
INSERT INTO `t_menu` VALUES (26, 10, '删除组织', NULL, '', NULL, '1', '删除组织', 'pause-circle', '/org', 'none', 1, 99, NULL, 'admin', '2022-05-05 17:37:08', 'admin', '2022-06-04 17:36:14', 0);
INSERT INTO `t_menu` VALUES (27, 10, '批量删除组织', NULL, '', NULL, '1', '批量删除组织', 'pause-circle', '/orgs', 'none', 1, 99, NULL, 'admin', '2022-05-05 17:37:29', 'admin', '2022-05-05 17:48:04', 0);
INSERT INTO `t_menu` VALUES (28, 10, '编辑组织', NULL, '', NULL, '1', '编辑组织', 'pause-circle', '/org', 'none', 1, 99, NULL, 'admin', '2022-05-05 17:38:54', 'admin', '2022-05-05 17:48:10', 0);
INSERT INTO `t_menu` VALUES (29, 11, '查询岗位列表', NULL, '', NULL, '1', '查询岗位列表', 'pause-circle', '/positions', 'none', 1, 99, NULL, 'admin', '2022-05-05 17:48:43', 'admin', '2022-05-05 17:48:51', 0);
INSERT INTO `t_menu` VALUES (30, 11, '新增岗位', NULL, '', NULL, '1', '新增岗位', 'pause-circle', '/position', 'none', 1, 99, NULL, 'admin', '2022-05-05 17:49:28', 'admin', '2022-05-05 17:49:37', 0);
INSERT INTO `t_menu` VALUES (31, 11, '删除岗位', NULL, '', NULL, '1', '删除岗位', 'pause-circle', '/position', 'none', 1, 99, NULL, 'admin', '2022-05-05 17:50:02', 'admin', '2022-06-04 17:36:45', 0);
INSERT INTO `t_menu` VALUES (32, 11, '批量删除岗位', NULL, '', NULL, '1', '批量删除岗位', 'pause-circle', '/positions', 'none', 1, 99, NULL, 'admin', '2022-05-05 17:50:27', 'admin', '2022-05-05 17:50:27', 0);
INSERT INTO `t_menu` VALUES (33, 11, '编辑岗位', NULL, '', NULL, '1', '编辑岗位', 'pause-circle', '/position', 'none', 1, 99, NULL, 'admin', '2022-05-05 17:50:47', 'admin', '2022-05-05 22:28:41', 0);
INSERT INTO `t_menu` VALUES (34, 13, '查询角色列表', NULL, '', NULL, '1', '查询角色列表', 'pause-circle', '/roles', 'none', 1, 99, NULL, 'admin', '2022-05-05 17:56:36', 'admin', '2022-05-05 17:56:36', 0);
INSERT INTO `t_menu` VALUES (35, 13, '新增角色', NULL, '', NULL, '1', '新增角色', 'pause-circle', '/role', 'none', 1, 99, NULL, 'admin', '2022-05-05 17:56:58', 'admin', '2022-05-05 17:56:58', 0);
INSERT INTO `t_menu` VALUES (36, 13, '删除角色', NULL, '', NULL, '1', '删除角色', 'pause-circle', '/role', 'none', 1, 99, NULL, 'admin', '2022-05-05 17:57:20', 'admin', '2022-05-05 17:57:28', 0);
INSERT INTO `t_menu` VALUES (37, 13, '批量删除角色', NULL, '', NULL, '1', '批量删除角色', 'pause-circle', '/roles', 'none', 1, 99, NULL, 'admin', '2022-05-05 17:57:51', 'admin', '2022-05-05 17:57:51', 0);
INSERT INTO `t_menu` VALUES (38, 13, '编辑角色', NULL, '', NULL, '1', '编辑角色', 'pause-circle', '/role', 'none', 1, 99, NULL, 'admin', '2022-05-05 17:58:24', 'admin', '2022-05-05 17:58:24', 0);
INSERT INTO `t_menu` VALUES (39, 13, '分配菜单', NULL, '', NULL, '1', '分配菜单', 'pause-circle', '/role/menus', 'none', 1, 99, NULL, 'admin', '2022-05-05 18:00:33', 'admin', '2022-06-04 17:37:36', 0);
INSERT INTO `t_menu` VALUES (40, 12, '查询用户列表', NULL, '', NULL, '1', '查询用户列表', 'pause-circle', '/users', 'none', 1, 99, NULL, 'admin', '2022-05-05 20:50:38', 'admin', '2022-05-05 20:50:38', 0);
INSERT INTO `t_menu` VALUES (41, 12, '新增用户', NULL, '', NULL, '1', '新增用户', 'pause-circle', '/user', 'none', 1, 99, NULL, 'admin', '2022-05-05 20:51:20', 'admin', '2022-05-05 20:51:20', 0);
INSERT INTO `t_menu` VALUES (42, 12, '删除用户', NULL, '', NULL, '1', '删除用户', 'pause-circle', '/user', 'none', 1, 99, NULL, 'admin', '2022-05-05 20:51:52', 'admin', '2022-06-04 17:36:58', 0);
INSERT INTO `t_menu` VALUES (43, 12, '批量删除用户', NULL, '', NULL, '1', '批量删除用户', 'pause-circle', '/users', 'none', 1, 99, NULL, 'admin', '2022-05-05 20:52:12', 'admin', '2022-05-05 20:52:44', 0);
INSERT INTO `t_menu` VALUES (44, 12, '编辑用户', NULL, '', NULL, '1', '编辑用户', 'pause-circle', '/user', 'none', 1, 99, NULL, 'admin', '2022-05-05 20:53:13', 'admin', '2022-05-05 20:53:13', 0);
INSERT INTO `t_menu` VALUES (45, 12, '分配角色', NULL, '', NULL, '1', '分配角色', 'pause-circle', '/user/roles', 'none', 1, 99, NULL, 'admin', '2022-05-05 20:55:13', 'admin', '2022-06-04 17:37:06', 0);
INSERT INTO `t_menu` VALUES (46, 12, '重置密码', NULL, '', NULL, '1', '重置密码', 'pause-circle', '/user/password/reset', 'none', 1, 99, NULL, 'admin', '2022-05-05 20:55:54', 'admin', '2022-06-04 17:37:15', 0);
INSERT INTO `t_menu` VALUES (47, 14, '新增菜单', NULL, '', NULL, '1', '新增菜单', 'pause-circle', '/menu', 'none', 1, 99, NULL, 'admin', '2022-05-05 20:58:36', 'admin', '2022-05-05 20:58:36', 0);
INSERT INTO `t_menu` VALUES (48, 14, '删除菜单', NULL, '', NULL, '1', '删除菜单', 'pause-circle', '/menu', 'none', 1, 99, NULL, 'admin', '2022-05-05 20:59:50', 'admin', '2022-06-04 17:37:43', 0);
INSERT INTO `t_menu` VALUES (49, 14, '编辑菜单', NULL, '', NULL, '1', '编辑菜单', 'pause-circle', '/menu', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:00:31', 'admin', '2022-05-05 21:00:31', 0);
INSERT INTO `t_menu` VALUES (50, 14, '查询菜单列表', NULL, '', NULL, '1', '查询菜单列表', 'pause-circle', '/menus/tree', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:07:36', 'admin', '2022-05-05 21:08:19', 0);
INSERT INTO `t_menu` VALUES (51, 16, '查询字典列表', NULL, '', NULL, '1', '查询字典列表', 'pause-circle', '/dicts', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:11:45', 'admin', '2022-05-05 21:14:27', 0);
INSERT INTO `t_menu` VALUES (52, 16, '新增字典', NULL, '', NULL, '1', '新增字典', 'pause-circle', '/dict', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:12:12', 'admin', '2022-05-05 21:12:12', 0);
INSERT INTO `t_menu` VALUES (53, 16, '删除字典', NULL, '', NULL, '1', '删除字典', 'pause-circle', '/dict', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:12:42', 'admin', '2022-06-04 17:38:10', 0);
INSERT INTO `t_menu` VALUES (54, 16, '批量删除字典', NULL, '', NULL, '1', '批量删除字典', 'pause-circle', '/dicts', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:13:09', 'admin', '2022-05-05 21:13:09', 0);
INSERT INTO `t_menu` VALUES (55, 16, '编辑字典', NULL, '', NULL, '1', '编辑字典', 'pause-circle', '/dict', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:13:34', 'admin', '2022-05-05 21:13:34', 0);
INSERT INTO `t_menu` VALUES (56, 17, '查询字典项列表', NULL, '', NULL, '1', '查询字典项列表', 'pause-circle', '/dict/items', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:15:58', 'admin', '2022-05-05 21:15:58', 0);
INSERT INTO `t_menu` VALUES (57, 17, '新增字典项', NULL, '', NULL, '1', '新增字典项', 'pause-circle', '/dict/item', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:16:23', 'admin', '2022-05-05 21:16:23', 0);
INSERT INTO `t_menu` VALUES (58, 17, '删除字典项', NULL, '', NULL, '1', '删除字典项', 'pause-circle', '/dict/item', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:17:00', 'admin', '2022-06-04 17:38:19', 0);
INSERT INTO `t_menu` VALUES (59, 17, '批量删除字典项', NULL, '', NULL, '1', '批量删除字典项', 'pause-circle', '/dict/items', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:17:30', 'admin', '2022-05-05 21:17:30', 0);
INSERT INTO `t_menu` VALUES (60, 17, '编辑字典项', NULL, '', NULL, '1', '编辑字典项', 'pause-circle', '/dict/item', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:18:18', 'admin', '2022-05-05 21:18:18', 0);
INSERT INTO `t_menu` VALUES (61, 15, '查询配置列表', NULL, '', NULL, '1', '查询配置列表', 'pause-circle', '/configs', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:19:58', 'admin', '2022-05-05 21:19:58', 0);
INSERT INTO `t_menu` VALUES (62, 15, '新增配置', NULL, '', NULL, '1', '新增配置', 'pause-circle', '/config', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:20:30', 'admin', '2022-05-05 21:20:30', 0);
INSERT INTO `t_menu` VALUES (63, 15, '删除配置', NULL, '', NULL, '1', '删除配置', 'pause-circle', '/config', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:20:58', 'admin', '2022-06-04 17:38:01', 0);
INSERT INTO `t_menu` VALUES (64, 15, '批量删除配置', NULL, '', NULL, '1', '批量删除配置', 'pause-circle', '/configs', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:21:24', 'admin', '2022-05-05 21:21:24', 0);
INSERT INTO `t_menu` VALUES (65, 15, '编辑配置', NULL, '', NULL, '1', '编辑配置', 'pause-circle', '/config', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:21:53', 'admin', '2022-05-05 21:21:53', 0);
INSERT INTO `t_menu` VALUES (66, 19, '查询在线用户', NULL, '', NULL, '1', '查询在线用户', 'pause-circle', '/users/online', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:23:22', 'admin', '2022-05-05 21:23:22', 0);
INSERT INTO `t_menu` VALUES (67, 19, '下线用户', NULL, '', NULL, '1', '下线用户', 'pause-circle', '/user/kickOut', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:23:56', 'admin', '2022-06-04 17:38:31', 0);
INSERT INTO `t_menu` VALUES (68, 19, '批量下线用户', NULL, '', NULL, '1', '批量下线用户', 'pause-circle', '/users/kickOut', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:24:27', 'admin', '2022-05-05 21:25:53', 0);
INSERT INTO `t_menu` VALUES (69, 18, '查询监控信息', NULL, '', NULL, '1', '查询监控信息', 'pause-circle', '/sys/monitor', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:26:42', 'admin', '2022-05-06 11:24:08', 0);
INSERT INTO `t_menu` VALUES (70, 20, '查询公告列表', NULL, '', NULL, '1', '查询公告列表', 'pause-circle', '/notices', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:44:04', 'admin', '2022-05-05 21:44:29', 0);
INSERT INTO `t_menu` VALUES (71, 20, '新增公告', NULL, '', NULL, '1', '新增公告', 'pause-circle', '/notice', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:47:37', 'admin', '2022-05-05 21:52:02', 0);
INSERT INTO `t_menu` VALUES (72, 20, '删除公告', NULL, '', NULL, '1', '删除公告', 'pause-circle', '/notice', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:51:07', 'admin', '2022-06-04 17:38:38', 0);
INSERT INTO `t_menu` VALUES (73, 20, '批量删除公告', NULL, '', NULL, '1', '批量删除公告', 'pause-circle', '/notices', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:52:32', 'admin', '2022-05-05 21:52:32', 0);
INSERT INTO `t_menu` VALUES (74, 21, '查询任务列表', NULL, '', NULL, '1', '查询任务列表', 'pause-circle', '/tasks', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:53:26', 'admin', '2022-05-05 21:53:26', 0);
INSERT INTO `t_menu` VALUES (75, 21, '新增任务', NULL, '', NULL, '1', '新增任务', 'pause-circle', '/task', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:54:14', 'admin', '2022-05-05 21:54:14', 0);
INSERT INTO `t_menu` VALUES (76, 21, '删除任务', NULL, '', NULL, '1', '删除任务', 'pause-circle', '/task', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:54:37', 'admin', '2022-06-04 17:38:49', 0);
INSERT INTO `t_menu` VALUES (77, 21, '批量删除任务', NULL, '', NULL, '1', '批量删除任务', 'pause-circle', '/tasks', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:55:03', 'admin', '2022-05-05 21:55:03', 0);
INSERT INTO `t_menu` VALUES (78, 21, '编辑任务', NULL, '', NULL, '1', '编辑任务', 'pause-circle', '/task', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:55:25', 'admin', '2022-05-05 21:55:25', 0);
INSERT INTO `t_menu` VALUES (79, 21, '暂停任务', NULL, '', NULL, '1', '暂停任务', 'pause-circle', '/task/pause', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:56:31', 'admin', '2022-06-04 17:38:55', 0);
INSERT INTO `t_menu` VALUES (80, 21, '启动任务', NULL, '', NULL, '1', '启动任务', 'pause-circle', '/task/resume', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:57:09', 'admin', '2022-06-04 17:39:00', 0);
INSERT INTO `t_menu` VALUES (81, 22, '查询执行日志列表', NULL, '', NULL, '1', '查询执行日志列表', 'pause-circle', '/taskLogs', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:58:58', 'admin', '2022-05-05 21:58:58', 0);
INSERT INTO `t_menu` VALUES (82, 22, '删除执行日志', NULL, '', NULL, '1', '删除执行日志', 'pause-circle', '/taskLog', 'none', 1, 99, NULL, 'admin', '2022-05-05 21:59:54', 'admin', '2022-06-04 17:39:07', 0);
INSERT INTO `t_menu` VALUES (83, 22, '批量删除执行日志', NULL, '', NULL, '1', '批量删除执行日志', 'pause-circle', '/taskLogs', 'none', 1, 99, NULL, 'admin', '2022-05-05 22:00:23', 'admin', '2022-05-05 22:00:23', 0);
INSERT INTO `t_menu` VALUES (84, 22, '清空执行日志', NULL, '', NULL, '1', '清空执行日志', 'pause-circle', '/taskLogs/clear', 'none', 1, 99, NULL, 'admin', '2022-05-05 22:01:01', 'admin', '2022-05-05 22:01:01', 0);
INSERT INTO `t_menu` VALUES (85, 5, '登录日志', '/log/login', 'system/log/LoginLog', NULL, '1', '登录日志', 'pause-circle', '', '_component', 1, 2, NULL, 'admin', '2022-05-05 22:07:05', 'admin', '2022-05-06 19:18:38', 0);
INSERT INTO `t_menu` VALUES (86, 5, '操作日志', '/log/operation', 'system/log/OperationLog', NULL, '1', '操作日志', 'pause-circle', '', '_component', 1, 4, NULL, 'admin', '2022-05-05 22:07:42', 'admin', '2022-05-06 19:18:43', 0);
INSERT INTO `t_menu` VALUES (87, 85, '查询日志列表', NULL, '', NULL, '1', '查询日志列表', 'pause-circle', '/loginLogs', 'none', 1, 99, NULL, 'admin', '2022-05-05 22:09:37', 'admin', '2022-05-06 11:25:05', 0);
INSERT INTO `t_menu` VALUES (88, 85, '删除登录日志', NULL, '', NULL, '1', '删除登录日志', 'pause-circle', '/loginLog', 'none', 1, 99, NULL, 'admin', '2022-05-05 22:10:09', 'admin', '2022-06-04 17:39:16', 0);
INSERT INTO `t_menu` VALUES (89, 85, '批量删除日志', NULL, '', NULL, '1', '批量删除日志', 'pause-circle', '/loginLogs', 'none', 1, 99, NULL, 'admin', '2022-05-05 22:10:43', 'admin', '2022-05-06 11:25:13', 0);
INSERT INTO `t_menu` VALUES (90, 85, '清空登录日志', NULL, '', NULL, '1', '清空登录日志', 'pause-circle', '/loginLogs/clear', 'none', 1, 99, NULL, 'admin', '2022-05-05 22:11:06', 'admin', '2022-05-05 22:11:06', 0);
INSERT INTO `t_menu` VALUES (91, 86, '查询操作日志列表', NULL, '', NULL, '1', '查询操作日志列表', 'pause-circle', '/operationLogs', 'none', 1, 99, NULL, 'admin', '2022-05-05 22:12:05', 'admin', '2022-05-05 22:12:05', 0);
INSERT INTO `t_menu` VALUES (92, 86, '删除操作日志', NULL, '', NULL, '1', '删除操作日志', 'pause-circle', '/operationLog', 'none', 1, 99, NULL, 'admin', '2022-05-05 22:12:30', 'admin', '2022-06-04 17:39:24', 0);
INSERT INTO `t_menu` VALUES (93, 86, '批量删除操作日志', NULL, '', NULL, '1', '批量删除操作日志', 'pause-circle', '/operationLogs', 'none', 1, 99, NULL, 'admin', '2022-05-05 22:12:57', 'admin', '2022-05-05 22:12:57', 0);
INSERT INTO `t_menu` VALUES (94, 86, '清空操作日志', NULL, '', NULL, '1', '清空操作日志', 'pause-circle', '/operationLogs/clear', 'none', 1, 99, NULL, 'admin', '2022-05-05 22:13:30', 'admin', '2022-05-05 22:13:30', 0);
INSERT INTO `t_menu` VALUES (96, 10, '导出组织列表', NULL, '', NULL, '1', '导出组织列表', 'pause-circle', '/roles/export', 'none', 1, 99, NULL, 'admin', '2022-06-04 17:40:21', 'admin', '2022-06-04 17:41:19', 0);
INSERT INTO `t_menu` VALUES (97, 11, '导出岗位列表', NULL, '', NULL, '1', '导出岗位列表', 'pause-circle', '/positions/export', 'none', 1, 99, NULL, 'admin', '2022-06-04 17:41:05', 'admin', '2022-06-04 17:41:05', 0);
INSERT INTO `t_menu` VALUES (98, 12, '导出用户列表', NULL, '', NULL, '1', '导出用户列表', 'pause-circle', '/users/export', 'none', 1, 99, NULL, 'admin', '2022-06-04 17:41:42', 'admin', '2022-06-04 17:42:43', 0);
INSERT INTO `t_menu` VALUES (99, 13, '导出角色列表', NULL, '', NULL, '1', '导出角色列表', 'pause-circle', '/roles/export', 'none', 1, 99, NULL, 'admin', '2022-06-04 17:42:30', 'admin', '2022-06-04 17:42:30', 0);
INSERT INTO `t_menu` VALUES (100, 14, '导出菜单列表', NULL, '', NULL, '1', '导出菜单列表', 'pause-circle', '/menus/export', 'none', 1, 99, NULL, 'admin', '2022-06-04 17:43:20', 'admin', '2022-06-04 17:43:20', 0);
INSERT INTO `t_menu` VALUES (101, 15, '导出配置列表', NULL, '', NULL, '1', '导出配置列表', 'pause-circle', '/configs/export', 'none', 1, 99, NULL, 'admin', '2022-06-04 17:43:48', 'admin', '2022-06-04 17:43:48', 0);
INSERT INTO `t_menu` VALUES (102, 16, '导出字典列表', NULL, '', NULL, '1', '导出字典列表', 'pause-circle', '/dicts/export', 'none', 1, 99, NULL, 'admin', '2022-06-04 17:44:22', 'admin', '2022-06-04 17:44:22', 0);
INSERT INTO `t_menu` VALUES (103, 17, '导出字典项列表', NULL, '', NULL, '1', '导出字典项列表', 'pause-circle', '/dict/items/export', 'none', 1, 99, NULL, 'admin', '2022-06-04 17:44:58', 'admin', '2022-06-04 17:44:58', 0);
INSERT INTO `t_menu` VALUES (104, 21, '导出任务列表', NULL, '', NULL, '1', '导出任务列表', 'pause-circle', '/tasks/export', 'none', 1, 99, NULL, 'admin', '2022-06-04 17:46:38', 'admin', '2022-06-04 17:46:38', 0);
INSERT INTO `t_menu` VALUES (105, 22, '导出任务执行日志', NULL, '', NULL, '1', '导出任务执行日志', 'pause-circle', '/taskLogs/export', 'none', 1, 99, NULL, 'admin', '2022-06-04 17:47:19', 'admin', '2022-06-04 17:47:19', 0);
INSERT INTO `t_menu` VALUES (106, 85, '导出登录日志', NULL, '', NULL, '1', '导出登录日志', 'pause-circle', '/loginLogs/export', 'none', 1, 99, NULL, 'admin', '2022-06-04 17:47:49', 'admin', '2022-06-04 17:47:49', 0);
INSERT INTO `t_menu` VALUES (107, 86, '导出操作日志', NULL, '', NULL, '1', '导出操作日志', 'pause-circle', '/operationLogs/export', 'none', 1, 99, NULL, 'admin', '2022-06-04 17:48:14', 'admin', '2022-06-04 17:48:28', 0);

-- ----------------------------
-- Table structure for t_login_log
-- ----------------------------
DROP TABLE IF EXISTS `t_login_log`;
CREATE TABLE `t_login_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `login_type` tinyint NULL DEFAULT NULL COMMENT '登录类型，0登录，1退出',
  `datetime` datetime NULL DEFAULT NULL COMMENT '登录时间',
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录ip',
  `browser` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器',
  `os` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `success` tinyint NULL DEFAULT NULL COMMENT '是否成功',
  `error_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '错误信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `t_dict_item`;
CREATE TABLE `t_dict_item`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `dict_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典编码',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '唯一编码',
  `value` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典项值',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 155 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典项表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_dict_item
-- ----------------------------
INSERT INTO `t_dict_item` VALUES (1, 'sys_yes_or_no', 'true', '是', 98, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` VALUES (2, 'sys_yes_or_no', 'false', '否', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` VALUES (3, 'sys_user_status', '0', '正常', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` VALUES (4, 'sys_user_status', '1', '禁用', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` VALUES (53, 'sys_dict_category', '1001', '系统分类', 99, 'asdf ', NULL, NULL, 'admin', '2022-05-29 19:28:38', 0);
INSERT INTO `t_dict_item` VALUES (54, 'sys_dict_category', '1002', '业务分类', 99, NULL, NULL, NULL, 'admin', '2022-05-29 19:28:40', 0);
INSERT INTO `t_dict_item` VALUES (57, 'sys_response_header', 'X-Frame-Options', 'ALLOW-FROM uri=http//localhost:8088', 99, '是否可以在iframe显示视图： DENY=不可以 | SAMEORIGIN=同域下可以 | ALLOW-FROM uri=指定域名下可以', NULL, NULL, 'admin', '2022-06-29 17:20:30', 0);
INSERT INTO `t_dict_item` VALUES (58, 'sys_response_header', 'X-XSS-Protection', '1; mode=block', 99, '是否启用浏览器默认XSS防护： 0=禁用 | 1=启用 | 1; mode=block 启用, 并在检查到XSS攻击时，停止渲染页面', NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` VALUES (59, 'sys_response_header', 'X-Content-Type-Options', 'nosniff', 99, '禁用浏览器内容嗅探', NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` VALUES (60, 'sys_response_header', 'Server', 'Server', 99, '服务器名称', NULL, NULL, 'admin', '2022-06-06 22:11:56', 1);
INSERT INTO `t_dict_item` VALUES (76, 'sys_data_type', 'int', '数字', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` VALUES (77, 'sys_data_type', 'string', '字符串', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` VALUES (78, 'sys_data_type', 'boolean', '布尔', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` VALUES (81, 'sys_operation_log_type', 'add', '新增', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` VALUES (82, 'sys_operation_log_type', 'delete', '删除', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` VALUES (83, 'sys_operation_log_type', 'update', '修改', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` VALUES (84, 'sys_operation_log_type', 'query', '查询', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` VALUES (86, 'sys_login_type', '0', '登录', 99, '登录', 'admin', '2022-04-16 16:52:40', 'admin', '2022-04-16 16:52:40', 0);
INSERT INTO `t_dict_item` VALUES (87, 'sys_login_type', '1', '退出', 99, '退出', 'admin', '2022-04-16 16:52:54', 'admin', '2022-04-16 16:52:54', 0);
INSERT INTO `t_dict_item` VALUES (93, 'sys_config_category', 'system', '系统配置', 99, NULL, 'admin', '2022-05-03 10:26:10', 'admin', '2022-05-03 10:28:32', 0);
INSERT INTO `t_dict_item` VALUES (94, 'sys_response_header', 'Access-Control-Allow-Origin', '*', 99, NULL, NULL, NULL, 'admin', '2022-07-25 18:35:52', 0);
INSERT INTO `t_dict_item` VALUES (95, 'sys_response_header', 'Access-Control-Allow-Methods', 'GET,POST,DELETE,PUT', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` VALUES (96, 'sys_response_header', 'Access-Control-Allow-Headers', '*', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` VALUES (97, 'sys_response_header', 'Access-Control-Max-Age', '3600', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` VALUES (98, 'sys_login_type', '2', '被踢下线', 99, '被踢下线', 'admin', '2022-05-19 23:52:41', 'admin', '2022-05-19 23:52:41', 0);
INSERT INTO `t_dict_item` VALUES (99, 'sys_login_type', '3', '被顶下线', 99, '被顶下线', 'admin', '2022-05-19 23:52:51', 'admin', '2022-05-19 23:52:51', 0);
INSERT INTO `t_dict_item` VALUES (100, 'sys_login_type', '4', '被锁定', 99, '被锁定', 'admin', '2022-05-19 23:53:00', 'admin', '2022-05-19 23:53:00', 0);
INSERT INTO `t_dict_item` VALUES (101, 'sys_login_type', '5', '解除锁定', 99, '解除锁定', 'admin', '2022-05-19 23:53:08', 'admin', '2022-05-19 23:53:08', 0);
INSERT INTO `t_dict_item` VALUES (105, 'sys_operation_log_type', 'export', '导出', 99, NULL, 'admin', '2022-06-03 23:44:05', 'admin', '2022-06-03 23:44:05', 0);
INSERT INTO `t_dict_item` VALUES (107, 'sys_http_allow_method', 'get', 'get', 99, NULL, 'admin', '2022-06-22 09:42:46', 'admin', '2022-06-22 09:42:46', 0);
INSERT INTO `t_dict_item` VALUES (108, 'sys_http_allow_method', 'post', 'post', 99, NULL, 'admin', '2022-06-22 09:42:58', 'admin', '2022-06-22 09:42:58', 0);
INSERT INTO `t_dict_item` VALUES (111, 'sys_enable_disable', '0', '启用', 99, NULL, 'admin', '2022-07-18 17:45:32', 'admin', '2022-07-18 17:45:32', 0);
INSERT INTO `t_dict_item` VALUES (112, 'sys_enable_disable', '1', '禁用', 99, NULL, 'admin', '2022-07-18 17:45:38', 'admin', '2022-07-18 17:45:38', 0);
INSERT INTO `t_dict_item` VALUES (113, 'sys_module', '菜单管理', '菜单管理', 99, NULL, 'admin', '2022-07-19 11:22:19', 'admin', '2022-07-19 11:22:19', 0);
INSERT INTO `t_dict_item` VALUES (114, 'sys_module', '应用管理', '应用管理', 99, NULL, 'admin', '2022-07-19 11:22:35', 'admin', '2022-07-19 11:22:35', 0);
INSERT INTO `t_dict_item` VALUES (115, 'sys_module', '配置管理', '配置管理', 99, NULL, 'admin', '2022-07-19 11:22:46', 'admin', '2022-07-19 11:22:46', 0);
INSERT INTO `t_dict_item` VALUES (116, 'sys_module', '字典管理', '字典管理', 99, NULL, 'admin', '2022-07-19 11:22:54', 'admin', '2022-07-19 11:22:54', 0);
INSERT INTO `t_dict_item` VALUES (117, 'sys_module', '日志管理', '日志管理', 99, NULL, 'admin', '2022-07-19 11:23:10', 'admin', '2022-07-19 11:26:25', 0);
INSERT INTO `t_dict_item` VALUES (118, 'sys_module', '通知公告', '通知公告', 99, NULL, 'admin', '2022-07-19 11:23:31', 'admin', '2022-07-19 11:23:31', 0);
INSERT INTO `t_dict_item` VALUES (120, 'sys_module', '组织管理', '组织管理', 99, NULL, 'admin', '2022-07-19 11:23:46', 'admin', '2022-07-19 11:23:46', 0);
INSERT INTO `t_dict_item` VALUES (121, 'sys_module', '职位管理', '职位管理', 99, NULL, 'admin', '2022-07-19 11:23:54', 'admin', '2022-07-19 11:23:54', 0);
INSERT INTO `t_dict_item` VALUES (122, 'sys_module', '角色管理', '角色管理', 99, NULL, 'admin', '2022-07-19 11:24:07', 'admin', '2022-07-19 11:24:07', 0);
INSERT INTO `t_dict_item` VALUES (123, 'sys_module', '系统监控', '系统监控', 99, NULL, 'admin', '2022-07-19 11:24:23', 'admin', '2022-07-19 11:24:23', 0);
INSERT INTO `t_dict_item` VALUES (124, 'sys_module', '定时任务', '定时任务', 99, NULL, 'admin', '2022-07-19 11:24:31', 'admin', '2022-07-19 11:24:31', 0);
INSERT INTO `t_dict_item` VALUES (125, 'sys_module', '用户管理', '用户管理', 99, NULL, 'admin', '2022-07-19 11:26:02', 'admin', '2022-07-19 11:26:02', 0);
INSERT INTO `t_dict_item` VALUES (143, 'biz_data_directory_type', '0', '时序数据', 99, NULL, NULL, NULL, NULL, '2022-09-21 09:23:40', 0);
INSERT INTO `t_dict_item` VALUES (144, 'biz_data_directory_type', '1', '关系表', 99, NULL, NULL, NULL, NULL, '2022-09-21 09:23:26', 0);
INSERT INTO `t_dict_item` VALUES (145, 'biz_major', '0', '所有', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` VALUES (146, 'biz_major', '1', '光伏', 99, NULL, NULL, NULL, NULL, '2022-09-20 18:40:54', 0);
INSERT INTO `t_dict_item` VALUES (147, 'biz_major', '2', '储能', 99, NULL, NULL, NULL, NULL, '2022-09-20 18:40:46', 0);
INSERT INTO `t_dict_item` VALUES (148, 'biz_major', '3', '火电', 99, NULL, NULL, NULL, NULL, '2022-09-20 18:36:37', 0);
INSERT INTO `t_dict_item` VALUES (149, 'biz_major', '4', '风电', 99, NULL, NULL, NULL, NULL, '2022-09-20 18:39:31', 0);
INSERT INTO `t_dict_item` VALUES (150, 'sys_user_status', '111', 'asdf ', 99, 'asdf ', NULL, '2022-09-20 18:53:33', NULL, '2022-09-20 18:53:36', 1);
INSERT INTO `t_dict_item` VALUES (151, 'sys_approve_status', '0', '审批中', 99, NULL, NULL, '2022-09-26 18:15:52', NULL, '2022-09-26 18:15:52', 0);
INSERT INTO `t_dict_item` VALUES (152, 'sys_approve_status', '1', '通过', 99, NULL, NULL, '2022-09-26 18:16:06', NULL, '2022-09-26 18:16:06', 0);
INSERT INTO `t_dict_item` VALUES (153, 'sys_approve_status', '2', '未通过', 99, NULL, NULL, '2022-09-26 18:16:18', NULL, '2022-09-26 18:16:18', 0);
INSERT INTO `t_dict_item` VALUES (154, 'sys_config_category', 'test', 'test', 99, NULL, NULL, '2022-09-28 14:38:32', NULL, '2022-09-28 14:38:32', 0);

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类编码',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典名称',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '唯一编码',
  `data_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code_idx`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_dict
-- ----------------------------
INSERT INTO `t_dict` VALUES (1, '1001', '字典分类', 'sys_dict_category', 'string', 99, '字典分类', NULL, NULL, NULL, '2022-04-12 23:19:57', 0);
INSERT INTO `t_dict` VALUES (2, '1001', '数据类型', 'sys_data_type', 'string', 99, '数据类型', NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict` VALUES (3, '1001', '通用是否', 'sys_yes_or_no', 'boolean', 99, '通用是否', NULL, NULL, NULL, '2022-09-21 09:23:57', 0);
INSERT INTO `t_dict` VALUES (4, '1001', '用户状态', 'sys_user_status', 'int', 99, '用户状态', NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict` VALUES (5, '1001', '系统配置分类', 'sys_config_category', 'string', 99, '系统配置分类', NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict` VALUES (8, '1001', '操作日志类型', 'sys_operation_log_type', 'string', 99, '操作日志类型', NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict` VALUES (12, '1001', 'http响应头', 'sys_response_header', 'string', 99, NULL, 'admin', '2022-04-13 09:53:08', 'admin', '2022-04-13 09:53:08', 0);
INSERT INTO `t_dict` VALUES (15, '1001', '登录类型', 'sys_login_type', 'int', 99, '登录类型：登录，退出', 'admin', '2022-04-16 16:52:00', 'admin', '2022-04-16 16:52:21', 0);
INSERT INTO `t_dict` VALUES (18, '1001', '允许的http请求方法', 'sys_http_allow_method', 'string', 99, '允许的http请求方法,其他方法返回405状态码或请求方法不允许类似的提示', 'admin', '2022-06-22 09:42:08', 'admin', '2022-06-22 09:42:08', 0);
INSERT INTO `t_dict` VALUES (19, '1001', '通用禁用启用', 'sys_enable_disable', 'string', 99, '通用禁用启用', 'admin', '2022-07-18 17:45:05', NULL, '2022-09-21 09:27:47', 0);
INSERT INTO `t_dict` VALUES (20, '1001', '系统模块', 'sys_module', 'string', 99, '操作日志系统模块查询条件使用', 'admin', '2022-07-19 11:21:37', 'admin', '2022-07-19 11:21:37', 0);
INSERT INTO `t_dict` VALUES (24, '1002', '数据目录类型', 'biz_data_directory_type', 'int', NULL, '数据目录类型', NULL, '2022-09-20 14:41:57', NULL, '2022-09-20 14:41:57', 0);
INSERT INTO `t_dict` VALUES (25, '1002', '数据专业', 'biz_major', 'int', NULL, '数据所属专业', NULL, '2022-09-20 16:33:33', NULL, '2022-09-20 16:55:10', 0);
INSERT INTO `t_dict` VALUES (26, '1001', '审批状态', 'sys_approve_status', 'int', NULL, '审批状态: 0 审批中，1 审批通过，2 审批未通过', NULL, '2022-09-26 18:13:52', NULL, '2022-09-26 18:13:52', 0);

-- ----------------------------
-- Table structure for t_config
-- ----------------------------
DROP TABLE IF EXISTS `t_config`;
CREATE TABLE `t_config`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类编码',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配置名称',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '唯一编码',
  `data_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据类型',
  `value` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '值',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_config
-- ----------------------------
INSERT INTO `t_config` VALUES (3, 'system', '系统服务', 'sysTitle', 'string', '数据服务', '系统名称', NULL, NULL, NULL, '2022-09-26 22:06:11', 0);
INSERT INTO `t_config` VALUES (26, 'system', '系统logo', 'sysLogo', 'string', '/vite.svg', '系统logo', 'admin', '2022-04-16 18:52:48', NULL, '2022-09-21 12:02:01', 0);
INSERT INTO `t_config` VALUES (35, 'system', '是否开启验证码', 'captchaEnable', 'boolean', 'true', '是否开启验证码', 'admin', '2022-05-03 10:08:49', NULL, '2022-09-17 02:42:19', 0);
INSERT INTO `t_config` VALUES (47, 'system', '系统描述', 'sysDescription', 'string', '一个后台管理系统', '一个后台管理系统', 'admin', '2022-05-29 06:27:57', NULL, '2022-09-17 02:42:23', 0);
INSERT INTO `t_config` VALUES (63, 'biz_power_forecast', '11', '1', 'string', '1', '1', NULL, '2022-09-17 02:37:59', NULL, '2022-09-17 02:42:11', 1);
INSERT INTO `t_config` VALUES (64, 'system', '超级用户名', 'sys_admin_username', 'string', 'admin', NULL, NULL, '2022-09-23 15:23:04', NULL, '2022-09-23 15:23:04', 1);

-- ----------------------------
-- Table structure for dw_interface_release
-- ----------------------------
DROP TABLE IF EXISTS `dw_interface_release`;
CREATE TABLE `dw_interface_release`  (
  `pub_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Publish ID',
  `pub_api_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '所属API ID',
  `pub_method` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'HttpMethod：GET、PUT、POST',
  `pub_path` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '拦截路径',
  `pub_status` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '状态：0有效，1无效（可能被下线）',
  `pub_type` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '脚本类型：SQL、DataQL',
  `pub_script` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '查询脚本：xxxxxxx',
  `pub_script_ori` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '原始查询脚本，仅当类型为SQL时不同',
  `pub_schema` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '接口的请求/响应数据结构',
  `pub_sample` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '请求/响应/请求头样本数据',
  `pub_option` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '扩展配置信息',
  `pub_release_time` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '发布时间（下线不更新）',
  `pub_comment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '备注',
  PRIMARY KEY (`pub_id`) USING BTREE,
  INDEX `idx_interface_release`(`pub_api_id` ASC) USING BTREE,
  INDEX `idx_interface_release_path`(`pub_path` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 'Dataway API 发布记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dw_interface_release
-- ----------------------------
INSERT INTO `dw_interface_release` VALUES ('r_f2hmemm6e-bli', 'i_f2hmemj3k-42e', 'POST', '/api/test', '3', 'DataQL', '// a new Query.\nreturn ${message};', '// a new Query.\nreturn ${message};', '{\"requestHeader\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{}},\"requestBody\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"message\":{\"type\":\"string\"}}},\"responseHeader\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{}},\"responseBody\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"executionTime\":{\"type\":\"number\"},\"code\":{\"type\":\"number\"},\"success\":{\"type\":\"boolean\"},\"lifeCycleTime\":{\"type\":\"number\"},\"location\":{\"type\":[\"string\",\"boolean\",\"number\",\"object\",\"array\",\"null\"]},\"message\":{\"type\":\"string\"},\"value\":{\"type\":\"string\"}}}}', '{\"requestHeader\":\"[]\",\"requestBody\":\"{\\\"message\\\":\\\"Hello DataQL.\\\"}\",\"responseHeader\":\"{}\",\"responseBody\":\"{\\n\\t\\\"success\\\":true,\\n\\t\\\"message\\\":\\\"OK\\\",\\n\\t\\\"code\\\":0,\\n\\t\\\"lifeCycleTime\\\":5,\\n\\t\\\"executionTime\\\":0,\\n\\t\\\"value\\\":\\\"Hello DataQL.\\\"\\n}\"}', '{\"enableCrossDomain\":false,\"hasor.dataway.globalConfig.responseFormat\":\"{\\n    \\\"success\\\"      : \\\"@resultStatus\\\",\\n    \\\"message\\\"      : \\\"@resultMessage\\\",\\n    \\\"location\\\"     : \\\"@blockLocation\\\",\\n    \\\"code\\\"         : \\\"@resultCode\\\",\\n    \\\"lifeCycleTime\\\": \\\"@timeLifeCycle\\\",\\n    \\\"executionTime\\\": \\\"@timeExecution\\\",\\n    \\\"value\\\"        : \\\"@resultData\\\"\\n}\",\"API_BASE_URL\":\"/api/\",\"resultStructure\":true,\"showGitButton\":true,\"hasor.dataway.globalConfig.enableCrossDomain\":\"true\",\"CONTEXT_PATH\":\"/api\",\"hasor.dataway.globalConfig.resultStructure\":\"true\",\"responseFormat\":\"{\\n  \\\"success\\\"      : \\\"@resultStatus\\\",\\n  \\\"message\\\"      : \\\"@resultMessage\\\",\\n  \\\"location\\\"     : \\\"@codeLocation\\\",\\n  \\\"code\\\"         : \\\"@resultCode\\\",\\n  \\\"lifeCycleTime\\\": \\\"@timeLifeCycle\\\",\\n  \\\"executionTime\\\": \\\"@timeExecution\\\",\\n  \\\"value\\\"        : \\\"@resultData\\\"\\n}\",\"wrapAllParameters\":false,\"hasor.dataway.globalConfig.wrapAllParameters\":\"false\",\"hasor.dataway.globalConfig.showGitButton\":\"true\",\"hasor.dataway.globalConfig.wrapParameterName\":\"root\",\"wrapParameterName\":\"root\"}', '1663731545630', 'test');
INSERT INTO `dw_interface_release` VALUES ('r_f2hmf29acafen', 'i_f2hmemj3k-42e', 'GET', '/api/test', '3', 'DataQL', '// a new Query.\nreturn ${message};', '// a new Query.\nreturn ${message};', '{\"requestHeader\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{}},\"requestBody\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"message\":{\"type\":\"string\"}}},\"responseHeader\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{}},\"responseBody\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"executionTime\":{\"type\":\"number\"},\"code\":{\"type\":\"number\"},\"success\":{\"type\":\"boolean\"},\"lifeCycleTime\":{\"type\":\"number\"},\"location\":{\"type\":[\"string\",\"boolean\",\"number\",\"object\",\"array\",\"null\"]},\"message\":{\"type\":\"string\"},\"value\":{\"type\":\"string\"}}}}', '{\"requestHeader\":\"[]\",\"requestBody\":\"{\\\"message\\\":\\\"Hello DataQL.\\\"}\",\"responseHeader\":\"{}\",\"responseBody\":\"{\\n\\t\\\"success\\\":true,\\n\\t\\\"message\\\":\\\"OK\\\",\\n\\t\\\"code\\\":0,\\n\\t\\\"lifeCycleTime\\\":3,\\n\\t\\\"executionTime\\\":0,\\n\\t\\\"value\\\":\\\"Hello DataQL.\\\"\\n}\"}', '{\"enableCrossDomain\":false,\"hasor.dataway.globalConfig.responseFormat\":\"{\\n    \\\"success\\\"      : \\\"@resultStatus\\\",\\n    \\\"message\\\"      : \\\"@resultMessage\\\",\\n    \\\"location\\\"     : \\\"@blockLocation\\\",\\n    \\\"code\\\"         : \\\"@resultCode\\\",\\n    \\\"lifeCycleTime\\\": \\\"@timeLifeCycle\\\",\\n    \\\"executionTime\\\": \\\"@timeExecution\\\",\\n    \\\"value\\\"        : \\\"@resultData\\\"\\n}\",\"API_BASE_URL\":\"/api/\",\"resultStructure\":true,\"showGitButton\":true,\"hasor.dataway.globalConfig.enableCrossDomain\":\"true\",\"CONTEXT_PATH\":\"/api\",\"hasor.dataway.globalConfig.resultStructure\":\"true\",\"responseFormat\":\"{\\n  \\\"success\\\"      : \\\"@resultStatus\\\",\\n  \\\"message\\\"      : \\\"@resultMessage\\\",\\n  \\\"location\\\"     : \\\"@codeLocation\\\",\\n  \\\"code\\\"         : \\\"@resultCode\\\",\\n  \\\"lifeCycleTime\\\": \\\"@timeLifeCycle\\\",\\n  \\\"executionTime\\\": \\\"@timeExecution\\\",\\n  \\\"value\\\"        : \\\"@resultData\\\"\\n}\",\"wrapAllParameters\":false,\"hasor.dataway.globalConfig.wrapAllParameters\":\"false\",\"hasor.dataway.globalConfig.showGitButton\":\"true\",\"hasor.dataway.globalConfig.wrapParameterName\":\"root\",\"wrapParameterName\":\"root\"}', '1663731593532', 'test');
INSERT INTO `dw_interface_release` VALUES ('r_f2hmf3kbk-2dj', 'i_f2hmemj3k-42e', 'GET', '/api/test', '3', 'DataQL', '// a new Query.\nreturn ${message};', '// a new Query.\nreturn ${message};', '{\"requestHeader\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{}},\"requestBody\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"message\":{\"type\":\"string\"}}},\"responseHeader\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{}},\"responseBody\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"executionTime\":{\"type\":\"number\"},\"code\":{\"type\":\"number\"},\"success\":{\"type\":\"boolean\"},\"lifeCycleTime\":{\"type\":\"number\"},\"location\":{\"type\":[\"string\",\"boolean\",\"number\",\"object\",\"array\",\"null\"]},\"message\":{\"type\":\"string\"},\"value\":{\"type\":\"string\"}}}}', '{\"requestHeader\":\"[]\",\"requestBody\":\"{\\\"message\\\":\\\"Hello DataQL.\\\"}\",\"responseHeader\":\"{}\",\"responseBody\":\"{\\n\\t\\\"success\\\":true,\\n\\t\\\"message\\\":\\\"OK\\\",\\n\\t\\\"code\\\":0,\\n\\t\\\"lifeCycleTime\\\":4,\\n\\t\\\"executionTime\\\":0,\\n\\t\\\"value\\\":\\\"Hello DataQL.\\\"\\n}\"}', '{\"enableCrossDomain\":false,\"hasor.dataway.globalConfig.responseFormat\":\"{\\n    \\\"success\\\"      : \\\"@resultStatus\\\",\\n    \\\"message\\\"      : \\\"@resultMessage\\\",\\n    \\\"location\\\"     : \\\"@blockLocation\\\",\\n    \\\"code\\\"         : \\\"@resultCode\\\",\\n    \\\"lifeCycleTime\\\": \\\"@timeLifeCycle\\\",\\n    \\\"executionTime\\\": \\\"@timeExecution\\\",\\n    \\\"value\\\"        : \\\"@resultData\\\"\\n}\",\"API_BASE_URL\":\"/api/\",\"resultStructure\":true,\"showGitButton\":true,\"hasor.dataway.globalConfig.enableCrossDomain\":\"true\",\"CONTEXT_PATH\":\"/api\",\"hasor.dataway.globalConfig.resultStructure\":\"true\",\"responseFormat\":\"{\\n  \\\"success\\\"      : \\\"@resultStatus\\\",\\n  \\\"message\\\"      : \\\"@resultMessage\\\",\\n  \\\"location\\\"     : \\\"@codeLocation\\\",\\n  \\\"code\\\"         : \\\"@resultCode\\\",\\n  \\\"lifeCycleTime\\\": \\\"@timeLifeCycle\\\",\\n  \\\"executionTime\\\": \\\"@timeExecution\\\",\\n  \\\"value\\\"        : \\\"@resultData\\\"\\n}\",\"wrapAllParameters\":false,\"hasor.dataway.globalConfig.wrapAllParameters\":\"false\",\"hasor.dataway.globalConfig.showGitButton\":\"true\",\"hasor.dataway.globalConfig.wrapParameterName\":\"root\",\"wrapParameterName\":\"root\"}', '1663731613724', 'test');
INSERT INTO `dw_interface_release` VALUES ('r_f2hmf4j0kai95', 'i_f2hmemj3k-42e', 'GET', '/api/test', '1', 'DataQL', '// a new Query.\nreturn ${message};', '// a new Query.\nreturn ${message};', '{\"requestHeader\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{}},\"requestBody\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"message\":{\"type\":\"string\"}}},\"responseHeader\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{}},\"responseBody\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"executionTime\":{\"type\":\"number\"},\"code\":{\"type\":\"number\"},\"data\":{\"type\":\"string\"},\"success\":{\"type\":\"boolean\"},\"lifeCycleTime\":{\"type\":\"number\"},\"location\":{\"type\":[\"string\",\"boolean\",\"number\",\"object\",\"array\",\"null\"]},\"message\":{\"type\":\"string\"}}}}', '{\"requestHeader\":\"[]\",\"requestBody\":\"{\\\"message\\\":\\\"Hello DataQL.\\\"}\",\"responseHeader\":\"{}\",\"responseBody\":\"{\\n\\t\\\"success\\\":true,\\n\\t\\\"message\\\":\\\"OK\\\",\\n\\t\\\"code\\\":0,\\n\\t\\\"lifeCycleTime\\\":3,\\n\\t\\\"executionTime\\\":0,\\n\\t\\\"data\\\":\\\"Hello DataQL.\\\"\\n}\"}', '{\"enableCrossDomain\":false,\"hasor.dataway.globalConfig.responseFormat\":\"{\\n    \\\"success\\\"      : \\\"@resultStatus\\\",\\n    \\\"message\\\"      : \\\"@resultMessage\\\",\\n    \\\"location\\\"     : \\\"@blockLocation\\\",\\n    \\\"code\\\"         : \\\"@resultCode\\\",\\n    \\\"lifeCycleTime\\\": \\\"@timeLifeCycle\\\",\\n    \\\"executionTime\\\": \\\"@timeExecution\\\",\\n    \\\"value\\\"        : \\\"@resultData\\\"\\n}\",\"API_BASE_URL\":\"/api/\",\"resultStructure\":true,\"showGitButton\":true,\"hasor.dataway.globalConfig.enableCrossDomain\":\"true\",\"CONTEXT_PATH\":\"/api\",\"hasor.dataway.globalConfig.resultStructure\":\"true\",\"responseFormat\":\"{\\n  \\\"success\\\"      : \\\"@resultStatus\\\",\\n  \\\"message\\\"      : \\\"@resultMessage\\\",\\n  \\\"location\\\"     : \\\"@codeLocation\\\",\\n  \\\"code\\\"         : \\\"@resultCode\\\",\\n  \\\"lifeCycleTime\\\": \\\"@timeLifeCycle\\\",\\n  \\\"executionTime\\\": \\\"@timeExecution\\\",\\n  \\\"data\\\"        : \\\"@resultData\\\"\\n}\",\"wrapAllParameters\":false,\"hasor.dataway.globalConfig.wrapAllParameters\":\"false\",\"hasor.dataway.globalConfig.showGitButton\":\"true\",\"hasor.dataway.globalConfig.wrapParameterName\":\"root\",\"wrapParameterName\":\"root\"}', '1663731626708', 'test');

-- ----------------------------
-- Table structure for dw_interface_info
-- ----------------------------
DROP TABLE IF EXISTS `dw_interface_info`;
CREATE TABLE `dw_interface_info`  (
  `api_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ID',
  `api_method` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'HttpMethod：GET、PUT、POST',
  `api_path` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '拦截路径',
  `api_status` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '状态：0，1，2，3',
  `api_comment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '注释',
  `api_type` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '脚本类型：SQL、DataQL',
  `api_script` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '查询脚本：xxxxxxx',
  `api_schema` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '接口的请求/响应数据结构',
  `api_sample` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '请求/响应/请求头样本数据',
  `api_option` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '扩展配置信息',
  `api_create_time` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '创建时间',
  `api_gmt_time` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '修改时间',
  `project_id` int NULL DEFAULT NULL COMMENT '所属项目id',
  PRIMARY KEY (`api_id`) USING BTREE,
  UNIQUE INDEX `idx_interface_info`(`api_path` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 'Dataway 中的API' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dw_interface_info
-- ----------------------------
INSERT INTO `dw_interface_info` VALUES ('i_f2hmemj3k-42e', 'GET', '/api/test', '1', 'test', 'DataQL', '// a new Query.\nreturn ${message};', '{\"requestHeader\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{}},\"requestBody\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"message\":{\"type\":\"string\"}}},\"responseHeader\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{}},\"responseBody\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"executionTime\":{\"type\":\"number\"},\"code\":{\"type\":\"number\"},\"data\":{\"type\":\"string\"},\"success\":{\"type\":\"boolean\"},\"lifeCycleTime\":{\"type\":\"number\"},\"location\":{\"type\":[\"string\",\"boolean\",\"number\",\"object\",\"array\",\"null\"]},\"message\":{\"type\":\"string\"}}}}', '{\"requestHeader\":\"[]\",\"requestBody\":\"{\\\"message\\\":\\\"Hello DataQL.\\\"}\",\"responseHeader\":\"{}\",\"responseBody\":\"{\\n\\t\\\"success\\\":true,\\n\\t\\\"message\\\":\\\"OK\\\",\\n\\t\\\"code\\\":0,\\n\\t\\\"lifeCycleTime\\\":3,\\n\\t\\\"executionTime\\\":0,\\n\\t\\\"data\\\":\\\"Hello DataQL.\\\"\\n}\"}', '{\"enableCrossDomain\":false,\"hasor.dataway.globalConfig.responseFormat\":\"{\\n    \\\"success\\\"      : \\\"@resultStatus\\\",\\n    \\\"message\\\"      : \\\"@resultMessage\\\",\\n    \\\"location\\\"     : \\\"@blockLocation\\\",\\n    \\\"code\\\"         : \\\"@resultCode\\\",\\n    \\\"lifeCycleTime\\\": \\\"@timeLifeCycle\\\",\\n    \\\"executionTime\\\": \\\"@timeExecution\\\",\\n    \\\"value\\\"        : \\\"@resultData\\\"\\n}\",\"API_BASE_URL\":\"/api/\",\"resultStructure\":true,\"showGitButton\":true,\"hasor.dataway.globalConfig.enableCrossDomain\":\"true\",\"CONTEXT_PATH\":\"/api\",\"hasor.dataway.globalConfig.resultStructure\":\"true\",\"responseFormat\":\"{\\n  \\\"success\\\"      : \\\"@resultStatus\\\",\\n  \\\"message\\\"      : \\\"@resultMessage\\\",\\n  \\\"location\\\"     : \\\"@codeLocation\\\",\\n  \\\"code\\\"         : \\\"@resultCode\\\",\\n  \\\"lifeCycleTime\\\": \\\"@timeLifeCycle\\\",\\n  \\\"executionTime\\\": \\\"@timeExecution\\\",\\n  \\\"data\\\"        : \\\"@resultData\\\"\\n}\",\"wrapAllParameters\":false,\"hasor.dataway.globalConfig.wrapAllParameters\":\"false\",\"hasor.dataway.globalConfig.showGitButton\":\"true\",\"hasor.dataway.globalConfig.wrapParameterName\":\"root\",\"wrapParameterName\":\"root\"}', '1663731543836', '1663731626705', NULL);

-- ----------------------------
-- Table structure for biz_user_data_rel
-- ----------------------------
DROP TABLE IF EXISTS `biz_user_data_rel`;
CREATE TABLE `biz_user_data_rel`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `org_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `data_direction_id` int NULL DEFAULT NULL,
  `data_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'device/table',
  `apply_username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `apply_time` datetime NULL DEFAULT NULL COMMENT '申请时间',
  `approved` tinyint NULL DEFAULT NULL COMMENT '审批状态：0 审批中，1审批通过，2审批未通过',
  `approved_time` datetime NULL DEFAULT NULL COMMENT '审批时间',
  `approved_username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批zhuangtai',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of biz_user_data_rel
-- ----------------------------
INSERT INTO `biz_user_data_rel` VALUES (1, NULL, 1, 2, '17', NULL, NULL, 0, NULL, NULL);
INSERT INTO `biz_user_data_rel` VALUES (2, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `biz_user_data_rel` VALUES (3, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `biz_user_data_rel` VALUES (4, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `biz_user_data_rel` VALUES (5, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `biz_user_data_rel` VALUES (6, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `biz_user_data_rel` VALUES (7, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `biz_user_data_rel` VALUES (8, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `biz_user_data_rel` VALUES (9, NULL, 1, 4, '1', NULL, NULL, 0, NULL, NULL);
INSERT INTO `biz_user_data_rel` VALUES (10, NULL, 1, 1, '2', NULL, NULL, 0, NULL, NULL);
INSERT INTO `biz_user_data_rel` VALUES (11, NULL, 1, 153, '5', NULL, NULL, 0, NULL, NULL);
INSERT INTO `biz_user_data_rel` VALUES (12, NULL, 1, 153, '20', NULL, NULL, 0, NULL, NULL);

-- ----------------------------
-- Table structure for biz_point
-- ----------------------------
DROP TABLE IF EXISTS `biz_point`;
CREATE TABLE `biz_point`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `device_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备编码',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据点码',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '点名',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_code`(`code` ASC) USING BTREE,
  INDEX `idx_device_code`(`device_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of biz_point
-- ----------------------------
INSERT INTO `biz_point` VALUES (1, 'fj001', 'dsz', 'asdf');
INSERT INTO `biz_point` VALUES (2, 'fj001', 'fdsz', '跑腿的111');
INSERT INTO `biz_point` VALUES (3, 'fj001', 'normal', '端茶，倒水，刷厕所');
INSERT INTO `biz_point` VALUES (4, 'fj001', 'zj', '腿腿');

-- ----------------------------
-- Table structure for biz_device
-- ----------------------------
DROP TABLE IF EXISTS `biz_device`;
CREATE TABLE `biz_device`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_directory_id` int NULL DEFAULT NULL COMMENT '所属数据目录',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '唯一编码',
  `major` tinyint NULL DEFAULT NULL COMMENT '专业',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `responsible` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `del_flag` tinyint NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织机构表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of biz_device
-- ----------------------------
INSERT INTO `biz_device` VALUES (1, 4, '风机001', 'fj001', 4, '风机001，包含风速，功率，电量等数据...', 'xiaoming', '2022-04-05 17:57:52', 'admin', '2022-09-18 20:58:36', NULL, 0);
INSERT INTO `biz_device` VALUES (2, 1, '风机008', 'fdsz', 4, '风机001，包含风速，功率，电量等数据...', 'xiaoming', '2022-04-05 17:57:52', 'admin', '2022-09-28 14:16:28', NULL, 0);
INSERT INTO `biz_device` VALUES (3, 5, '风机001', 'fj001', 4, '风机001，包含风速，功率，电量等数据...', 'xiaoming', '2022-04-05 17:57:52', 'admin', '2022-09-28 14:16:32', NULL, 0);
INSERT INTO `biz_device` VALUES (4, 5, '风机002', 'fj002', 4, '风机001，包含风速，功率，电量等数据...', 'xiaoming', '2022-04-05 17:57:52', 'admin', '2022-09-28 14:16:38', NULL, 0);
INSERT INTO `biz_device` VALUES (5, 153, '风机010', '23', 4, '风机001，包含风速，功率，电量等数据...', 'xiaoming', '2022-04-05 17:57:52', 'admin', '2022-09-28 16:05:55', NULL, 0);
INSERT INTO `biz_device` VALUES (6, 6, 'fj002', 'fj002', 4, '风机001，包含风速，功率，电量等数据...', 'xiaoming', '2022-04-10 19:53:58', 'admin', '2022-09-28 14:16:48', NULL, 0);
INSERT INTO `biz_device` VALUES (16, 2, '卡拉胶是大方', 'asdf', 2, 'asdf ', 'xiaoming', NULL, NULL, '2022-09-26 17:39:24', NULL, 1);
INSERT INTO `biz_device` VALUES (17, 2, '锅炉001', 'gl001', 1, '22222', NULL, '2022-09-26 17:38:08', NULL, '2022-09-26 17:38:08', NULL, 0);
INSERT INTO `biz_device` VALUES (18, 2, '撒地方', '啊是大方', 4, NULL, NULL, '2022-09-26 17:39:02', NULL, '2022-09-26 17:39:02', NULL, 0);
INSERT INTO `biz_device` VALUES (19, 2, 'fj0002', 'code01', 1, NULL, 'ssss', '2022-09-28 14:32:38', NULL, '2022-09-28 14:33:04', NULL, 1);
INSERT INTO `biz_device` VALUES (20, 153, 'js001', 'js001', 1, '1', '1', '2022-09-28 14:44:03', NULL, '2022-09-28 14:44:03', NULL, 0);

-- ----------------------------
-- Table structure for biz_data_directory
-- ----------------------------
DROP TABLE IF EXISTS `biz_data_directory`;
CREATE TABLE `biz_data_directory`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `org_id` int NULL DEFAULT NULL,
  `parent_id` int NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '唯一编码',
  `type` tinyint NULL DEFAULT NULL COMMENT '类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 156 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of biz_data_directory
-- ----------------------------
INSERT INTO `biz_data_directory` VALUES (1, 5, 0, '新能源', 'fj001', 0, 99, '东方国信', 'admin', '2022-05-05 16:16:19', NULL, '2022-09-26 17:20:11', 0);
INSERT INTO `biz_data_directory` VALUES (2, 16, 0, '锅炉所', 'fj002', 0, 99, '232323', 'admin', '2022-05-05 16:16:46', NULL, '2022-09-26 17:44:59', 0);
INSERT INTO `biz_data_directory` VALUES (3, NULL, 0, 'fj001', 'fj001', 0, NULL, 'asdf ', 'admin', '2022-05-05 16:17:24', NULL, '2022-09-20 16:56:55', 1);
INSERT INTO `biz_data_directory` VALUES (4, 5, 1, '迎风岭', 'ln', 0, 99, NULL, 'admin', '2022-05-05 16:17:34', NULL, '2022-09-26 17:19:48', 0);
INSERT INTO `biz_data_directory` VALUES (5, 5, 1, '天桥山', 'fj001', 0, 98, '电信事业部', 'admin', '2022-05-05 16:17:47', NULL, '2022-09-28 14:30:18', 0);
INSERT INTO `biz_data_directory` VALUES (6, 5, 1, '大苏计', 'fj002', 0, 99, '移动事业部', 'admin', '2022-05-05 16:18:10', NULL, '2022-09-26 17:20:03', 0);
INSERT INTO `biz_data_directory` VALUES (153, 6, 0, '金属所', NULL, 0, 99, '金属所', NULL, '2022-09-26 17:20:48', NULL, '2022-09-26 17:20:48', 0);
INSERT INTO `biz_data_directory` VALUES (154, 1, 0, 'test2', NULL, 0, 99, NULL, NULL, '2022-09-28 12:55:57', NULL, '2022-09-28 12:56:08', 1);
INSERT INTO `biz_data_directory` VALUES (155, 1, 1, 'test11asdf', NULL, 0, 99, '111', NULL, '2022-09-28 14:29:29', NULL, '2022-09-28 14:29:42', 1);

SET FOREIGN_KEY_CHECKS = 1;
