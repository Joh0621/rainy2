/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : data-middle-platform

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 14/09/2022 18:28:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_config
-- ----------------------------
DROP TABLE IF EXISTS `t_config`;
CREATE TABLE `t_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分类编码',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '配置名称',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '唯一编码',
  `data_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '数据类型',
  `value` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '值',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint DEFAULT NULL COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='配置表';

-- ----------------------------
-- Records of t_config
-- ----------------------------
BEGIN;
INSERT INTO `t_config` (`id`, `category_code`, `name`, `code`, `data_type`, `value`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (3, 'system', '系统标题', 'sysTitle', 'string', 'Ant Design ', '系统名称', NULL, NULL, 'admin', '2022-08-29 14:51:30', 0);
INSERT INTO `t_config` (`id`, `category_code`, `name`, `code`, `data_type`, `value`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (26, 'system', '系统logo', 'sysLogo', 'string', '/vite.svg', NULL, 'admin', '2022-04-16 18:52:48', 'admin', '2022-05-29 06:31:15', 0);
INSERT INTO `t_config` (`id`, `category_code`, `name`, `code`, `data_type`, `value`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (35, 'system', '是否开启验证码', 'captchaEnable', 'boolean', 'true', '是否开启验证码', 'admin', '2022-05-03 10:08:49', 'admin', '2022-06-04 18:39:34', 0);
INSERT INTO `t_config` (`id`, `category_code`, `name`, `code`, `data_type`, `value`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (47, 'system', '系统描述', 'sysDescription', 'string', '一个后台管理系统', '一个后台管理系统', 'admin', '2022-05-29 06:27:57', 'admin', '2022-05-29 06:31:28', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分类编码',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典名称',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '唯一编码',
  `data_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '数据类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint DEFAULT NULL COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code_idx` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='字典表';

-- ----------------------------
-- Records of t_dict
-- ----------------------------
BEGIN;
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1, '1001', '字典分类', 'SYS_DICT_CATEGORY', 'string', NULL, '字典分类', NULL, NULL, NULL, '2022-04-12 23:19:57', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (2, '1001', '数据类型', 'SYS_DATA_TYPE', 'string', NULL, '字典数据类型', NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (3, '1001', '菜单类型', 'SYS_MENU_TYPE', 'string', NULL, '菜单类型', NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (4, '1001', '菜单打开方式', 'SYS_MENU_OPEN_TYPE', 'string', NULL, '菜单打开方式', NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (5, '1001', '系统配置分类', 'SYS_CONFIG_CATEGORY', 'string', NULL, '系统配置分类', NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (6, '1001', '定时任务分组', 'SYS_TASK_GROUP', 'string', NULL, '定时任务分组', NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (7, '1001', '定时任务状态', 'SYS_TASK_STATUS', 'int', NULL, '定时任务状态', NULL, NULL, 'admin', '2022-05-28 00:35:19', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (8, '1001', '操作日志类型', 'SYS_OPERATION_LOG_TYPE', 'string', NULL, '操作日志类型', NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (12, '1001', '安全响应头', 'SYS_SECURITY_RESPONSE_HEADER', 'string', NULL, NULL, 'admin', '2022-04-13 09:53:08', 'admin', '2022-04-13 09:53:08', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (13, '1001', '请求方式', 'SYS_HTTP_METHOD', 'string', NULL, NULL, 'admin', '2022-04-13 09:54:48', 'admin', '2022-04-19 10:42:19', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (14, '1001', '通用是否', 'SYS_YES_OR_NO', 'boolean', NULL, '通用是否', 'admin', '2022-04-15 11:17:28', 'admin', '2022-05-29 15:50:13', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (15, '1001', '登录类型', 'SYS_LOGIN_TYPE', 'int', NULL, '登录类型：登录，退出', 'admin', '2022-04-16 16:52:00', 'admin', '2022-04-16 16:52:21', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (17, '1001', '通用成功失败', 'SYS_SUCCESS_FAIL', 'string', NULL, '成功失败', 'admin', '2022-04-22 17:31:47', 'admin', '2022-04-22 17:31:47', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (18, '1001', '允许的http请求方法', 'SYS_HTTP_ALLOW_METHOD', 'string', NULL, '允许的http请求方法,其他方法返回405状态码或请求方法不允许类似的提示', 'admin', '2022-06-22 09:42:08', 'admin', '2022-06-22 09:42:08', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (19, '1001', '通用禁用启用', 'SYS_ENABLE_DISABLE', 'int', NULL, '通用禁用启用', 'admin', '2022-07-18 17:45:05', 'admin', '2022-07-18 17:45:05', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (20, '1001', '系统模块', 'SYS_MODULE', 'string', NULL, '操作日志系统模块查询条件使用', 'admin', '2022-07-19 11:21:37', 'admin', '2022-07-19 11:21:37', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (21, '1002', '调整类型', 'BIZ_ADJUST_TYPE', 'string', NULL, '场站类型', 'admin', '2022-08-24 10:59:22', 'admin', '2022-08-24 10:59:22', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (22, '1002', '场站类型', 'BIZ_STATION_TYPE', 'int', NULL, NULL, 'admin', '2022-08-24 11:23:47', 'admin', '2022-08-24 11:23:47', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (23, '1002', '准确率算法', 'BIZ_ACCURACY_ALG', 'string', NULL, '功率预测准确率算法', 'admin', '2022-08-28 01:45:46', 'admin', '2022-08-28 01:45:46', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `t_dict_item`;
CREATE TABLE `t_dict_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dict_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典编码',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '唯一编码',
  `value` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典项值',
  `sort` int DEFAULT NULL COMMENT '排序',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint DEFAULT NULL COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='字典项表';

-- ----------------------------
-- Records of t_dict_item
-- ----------------------------
BEGIN;
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (53, 'SYS_DICT_CATEGORY', '1001', '系统分类', 99, 'asdf ', NULL, NULL, 'admin', '2022-05-29 19:28:38', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (54, 'SYS_DICT_CATEGORY', '1002', '业务分类', 99, NULL, NULL, NULL, 'admin', '2022-05-29 19:28:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (55, 'SYS_YES_OR_NO', 'true', '是', 99, NULL, NULL, NULL, 'admin', '2022-05-28 00:34:35', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (56, 'SYS_YES_OR_NO', 'false', '否', 99, NULL, NULL, NULL, 'admin', '2022-05-28 00:34:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (57, 'SYS_SECURITY_RESPONSE_HEADER', 'X-Frame-Options', 'ALLOW-FROM uri=http//localhost:8088', 99, '是否可以在iframe显示视图： DENY=不可以 | SAMEORIGIN=同域下可以 | ALLOW-FROM uri=指定域名下可以', NULL, NULL, 'admin', '2022-06-29 17:20:30', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (58, 'SYS_SECURITY_RESPONSE_HEADER', 'X-XSS-Protection', '1; mode=block', 99, '是否启用浏览器默认XSS防护： 0=禁用 | 1=启用 | 1; mode=block 启用, 并在检查到XSS攻击时，停止渲染页面', NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (59, 'SYS_SECURITY_RESPONSE_HEADER', 'X-Content-Type-Options', 'nosniff', 99, '禁用浏览器内容嗅探', NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (60, 'SYS_SECURITY_RESPONSE_HEADER', 'Server', 'springboot', 99, '服务器名称', NULL, NULL, 'admin', '2022-06-06 22:11:56', 1);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (61, 'SYS_HTTP_METHOD', 'GET', 'GET', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (62, 'SYS_HTTP_METHOD', 'POST', 'POST', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (63, 'SYS_HTTP_METHOD', 'DELETE', 'DELETE', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (64, 'SYS_HTTP_METHOD', 'PUT', 'PUT', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (65, 'SYS_HTTP_METHOD', 'ALL', 'ALL', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (66, 'SYS_TASK_STATUS', '0', '启动中', 99, NULL, NULL, NULL, 'admin', '2022-05-31 11:15:26', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (67, 'SYS_TASK_STATUS', '1', '暂停中', 99, NULL, NULL, NULL, 'admin', '2022-05-31 11:15:32', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (68, 'SYS_TASK_GROUP', 'default', '默认', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (69, 'SYS_TASK_GROUP', 'test', '测试', 99, NULL, NULL, NULL, 'admin', '2022-08-27 16:25:46', 1);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (70, 'SYS_MENU_TYPE', 'catalog_breadcrumb', '目录(面包屑)', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (71, 'SYS_MENU_TYPE', 'catalog', '目录', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (72, 'SYS_MENU_TYPE', 'menu', '菜单', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (73, 'SYS_MENU_OPEN_TYPE', '_self', '内链', 2, NULL, NULL, NULL, 'admin', '2022-05-01 22:18:28', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (74, 'SYS_MENU_OPEN_TYPE', '_blank', '外链', 3, NULL, NULL, NULL, 'admin', '2022-05-01 22:18:31', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (75, 'SYS_MENU_OPEN_TYPE', '_component', '组件', 1, NULL, NULL, NULL, 'admin', '2022-05-01 22:18:12', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (76, 'SYS_DATA_TYPE', 'int', '数字', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (77, 'SYS_DATA_TYPE', 'string', '字符串', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (78, 'SYS_DATA_TYPE', 'boolean', '布尔', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (80, 'SYS_CONFIG_CATEGORY', 'test', '测试', 99, NULL, NULL, NULL, 'admin', '2022-05-03 10:28:21', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (81, 'SYS_OPERATION_LOG_TYPE', 'add', '新增', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (82, 'SYS_OPERATION_LOG_TYPE', 'delete', '删除', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (83, 'SYS_OPERATION_LOG_TYPE', 'update', '修改', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (84, 'SYS_OPERATION_LOG_TYPE', 'query', '查询', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (85, 'SYS_CONFIG_CATEGORY', 'SA_TOKEN', '安全配置', 99, '安全配置', 'admin', '2022-04-13 10:29:50', 'admin', '2022-05-20 00:15:32', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (86, 'SYS_LOGIN_TYPE', '0', '登录', 99, '登录', 'admin', '2022-04-16 16:52:40', 'admin', '2022-04-16 16:52:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (87, 'SYS_LOGIN_TYPE', '1', '退出', 99, '退出', 'admin', '2022-04-16 16:52:54', 'admin', '2022-04-16 16:52:54', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (88, 'SYS_SUCCESS_FAIL', 'true', '成功', 99, NULL, 'admin', '2022-04-22 17:32:20', 'admin', '2022-04-22 17:32:20', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (89, 'SYS_SUCCESS_FAIL', 'false', '失败', 99, NULL, 'admin', '2022-04-22 17:32:45', 'admin', '2022-04-22 17:32:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (90, 'SYS_MENU_TYPE', 'button', '按钮', 99, '按钮', 'admin', '2022-05-01 20:31:22', 'admin', '2022-05-01 20:31:22', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (91, 'SYS_MENU_OPEN_TYPE', 'none', '无', 4, '菜单是按钮时无打开方式', 'admin', '2022-05-01 21:46:21', 'admin', '2022-05-31 12:04:21', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (92, 'SYS_CONFIG_CATEGORY', 'mail', '邮件配置', 99, NULL, 'admin', '2022-05-03 10:22:25', 'admin', '2022-05-03 10:28:38', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (93, 'SYS_CONFIG_CATEGORY', 'system', '系统配置', 99, NULL, 'admin', '2022-05-03 10:26:10', 'admin', '2022-05-03 10:28:32', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (94, 'SYS_SECURITY_RESPONSE_HEADER', 'Access-Control-Allow-Origin', '*', 99, NULL, NULL, NULL, 'admin', '2022-07-25 18:35:52', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (95, 'SYS_SECURITY_RESPONSE_HEADER', 'Access-Control-Allow-Methods', 'GET,POST,DELETE,PUT', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (96, 'SYS_SECURITY_RESPONSE_HEADER', 'Access-Control-Allow-Headers', '*', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (97, 'SYS_SECURITY_RESPONSE_HEADER', 'Access-Control-Max-Age', '3600', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (98, 'SYS_LOGIN_TYPE', '2', '被踢下线', 99, '被踢下线', 'admin', '2022-05-19 23:52:41', 'admin', '2022-05-19 23:52:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (99, 'SYS_LOGIN_TYPE', '3', '被顶下线', 99, '被顶下线', 'admin', '2022-05-19 23:52:51', 'admin', '2022-05-19 23:52:51', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (100, 'SYS_LOGIN_TYPE', '4', '被锁定', 99, '被锁定', 'admin', '2022-05-19 23:53:00', 'admin', '2022-05-19 23:53:00', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (101, 'SYS_LOGIN_TYPE', '5', '解除锁定', 99, '解除锁定', 'admin', '2022-05-19 23:53:08', 'admin', '2022-05-19 23:53:08', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (102, 'SYS_CONFIG_CATEGORY', 'SA_SSO', '单点登录', 99, '单点登录', 'admin', '2022-05-20 00:15:20', 'admin', '2022-05-20 00:15:20', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (103, 'SYS_CONFIG_CATEGORY', 'front', '前端配置', 99, '前端配置', 'admin', '2022-05-29 06:30:27', 'admin', '2022-05-29 06:30:27', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (104, 'SYS_SECURITY_RESPONSE_HEADER', 'Access-Control-Expose-Headers', 'Content-Disposition', 99, NULL, 'admin', '2022-06-03 00:07:25', 'admin', '2022-06-03 00:07:25', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (105, 'SYS_OPERATION_LOG_TYPE', 'export', '导出', 99, NULL, 'admin', '2022-06-03 23:44:05', 'admin', '2022-06-03 23:44:05', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (106, 'SYS_HTTP_ALLOW_METHOD', 'options', 'options', 99, NULL, 'admin', '2022-06-22 09:42:38', 'admin', '2022-06-22 09:42:38', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (107, 'SYS_HTTP_ALLOW_METHOD', 'get', 'get', 99, NULL, 'admin', '2022-06-22 09:42:46', 'admin', '2022-06-22 09:42:46', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (108, 'SYS_HTTP_ALLOW_METHOD', 'post', 'post', 99, NULL, 'admin', '2022-06-22 09:42:58', 'admin', '2022-06-22 09:42:58', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (109, 'SYS_HTTP_ALLOW_METHOD', 'put', 'put', 99, NULL, 'admin', '2022-06-22 09:43:06', 'admin', '2022-06-22 09:43:06', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (110, 'SYS_HTTP_ALLOW_METHOD', 'delete', 'delete', 99, NULL, 'admin', '2022-06-22 09:43:15', 'admin', '2022-06-22 09:43:15', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (111, 'SYS_ENABLE_DISABLE', '0', '启用', 99, NULL, 'admin', '2022-07-18 17:45:32', 'admin', '2022-07-18 17:45:32', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (112, 'SYS_ENABLE_DISABLE', '1', '禁用', 99, NULL, 'admin', '2022-07-18 17:45:38', 'admin', '2022-07-18 17:45:38', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (113, 'SYS_MODULE', '菜单管理', '菜单管理', 99, NULL, 'admin', '2022-07-19 11:22:19', 'admin', '2022-07-19 11:22:19', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (114, 'SYS_MODULE', '应用管理', '应用管理', 99, NULL, 'admin', '2022-07-19 11:22:35', 'admin', '2022-07-19 11:22:35', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (115, 'SYS_MODULE', '配置管理', '配置管理', 99, NULL, 'admin', '2022-07-19 11:22:46', 'admin', '2022-07-19 11:22:46', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (116, 'SYS_MODULE', '字典管理', '字典管理', 99, NULL, 'admin', '2022-07-19 11:22:54', 'admin', '2022-07-19 11:22:54', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (117, 'SYS_MODULE', '日志管理', '日志管理', 99, NULL, 'admin', '2022-07-19 11:23:10', 'admin', '2022-07-19 11:26:25', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (118, 'SYS_MODULE', '通知公告', '通知公告', 99, NULL, 'admin', '2022-07-19 11:23:31', 'admin', '2022-07-19 11:23:31', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (120, 'SYS_MODULE', '组织管理', '组织管理', 99, NULL, 'admin', '2022-07-19 11:23:46', 'admin', '2022-07-19 11:23:46', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (121, 'SYS_MODULE', '职位管理', '职位管理', 99, NULL, 'admin', '2022-07-19 11:23:54', 'admin', '2022-07-19 11:23:54', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (122, 'SYS_MODULE', '角色管理', '角色管理', 99, NULL, 'admin', '2022-07-19 11:24:07', 'admin', '2022-07-19 11:24:07', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (123, 'SYS_MODULE', '系统监控', '系统监控', 99, NULL, 'admin', '2022-07-19 11:24:23', 'admin', '2022-07-19 11:24:23', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (124, 'SYS_MODULE', '定时任务', '定时任务', 99, NULL, 'admin', '2022-07-19 11:24:31', 'admin', '2022-07-19 11:24:31', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (125, 'SYS_MODULE', '用户管理', '用户管理', 99, NULL, 'admin', '2022-07-19 11:26:02', 'admin', '2022-07-19 11:26:02', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (126, 'SYS_MODULE', '功率预测', '功率预测', 99, NULL, 'admin', '2022-07-19 14:48:14', 'admin', '2022-07-19 14:48:14', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (127, 'SYS_OPERATION_LOG_TYPE', 'download', '下载', 99, NULL, 'admin', '2022-07-21 17:21:33', 'admin', '2022-07-21 17:21:33', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (128, 'SYS_OPERATION_LOG_TYPE', 'preview', '文件预览', 99, NULL, 'admin', '2022-07-21 17:21:47', 'admin', '2022-07-21 17:21:47', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (129, 'SYS_SECURITY_RESPONSE_HEADER', 'Access-Control-Allow-Credentials', 'false', 99, '是否允许浏览器发送凭证信息', 'admin', '2022-07-25 18:42:23', 'admin', '2022-07-27 10:39:27', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (130, 'BIZ_ADJUST_TYPE', 'up', '上调', 99, NULL, 'admin', '2022-08-24 10:59:43', 'admin', '2022-08-24 10:59:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (131, 'BIZ_ADJUST_TYPE', 'down', '下调', 99, NULL, 'admin', '2022-08-24 10:59:50', 'admin', '2022-08-24 10:59:50', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (132, 'BIZ_STATION_TYPE', '1', '区域', 99, NULL, 'admin', '2022-08-24 11:24:13', 'admin', '2022-08-28 01:53:10', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (133, 'BIZ_STATION_TYPE', '2', '场站', 99, NULL, 'admin', '2022-08-24 11:24:19', 'admin', '2022-08-24 11:24:19', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (134, 'SYS_CONFIG_CATEGORY', 'biz_power_forecast', '功率预测', 99, NULL, 'admin', '2022-08-25 14:58:16', 'admin', '2022-08-25 14:58:16', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (135, 'SYS_TASK_GROUP', 'power_forecast', '功率预测', 99, NULL, 'admin', '2022-08-25 15:09:11', 'admin', '2022-08-25 15:09:11', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (136, 'BIZ_ACCURACY_ALG', 'alg_1', '算法1', 99, NULL, 'admin', '2022-08-28 01:46:11', 'admin', '2022-08-28 01:46:11', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (137, 'BIZ_ACCURACY_ALG', 'alg_2', '算法2', 99, NULL, 'admin', '2022-08-28 01:46:19', 'admin', '2022-08-28 01:46:19', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (138, 'SYS_TASK_GROUP', 'actual', '实际功率数据采集', 99, NULL, 'admin', '2022-08-29 14:23:10', 'admin', '2022-08-29 14:23:10', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (139, 'SYS_TASK_GROUP', 'short_power', '短期功率数据采集', 99, NULL, 'admin', '2022-08-29 14:23:30', 'admin', '2022-08-29 14:23:30', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (140, 'SYS_TASK_GROUP', 'cft', '测风塔数据采集', 99, NULL, 'admin', '2022-08-29 14:23:45', 'admin', '2022-08-29 14:23:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (141, 'SYS_TASK_GROUP', 'short_power_upload', '短期功率预测修正数据上传', 99, NULL, 'admin', '2022-08-29 14:24:18', 'admin', '2022-08-29 14:26:13', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (142, 'SYS_TASK_GROUP', 'c_short_power', '超短期功率数据采集', 99, NULL, 'admin', '2022-08-29 14:24:48', 'admin', '2022-08-29 14:24:48', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_login_log
-- ----------------------------
DROP TABLE IF EXISTS `t_login_log`;
CREATE TABLE `t_login_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `login_type` tinyint DEFAULT NULL COMMENT '登录类型，0登录，1退出',
  `datetime` datetime DEFAULT NULL COMMENT '登录时间',
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '登录ip',
  `browser` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '浏览器',
  `os` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作系统',
  `success` tinyint DEFAULT NULL COMMENT '是否成功',
  `error_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '错误信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_login_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT NULL COMMENT '父id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由名称',
  `path` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由地址',
  `component` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '前端vue组件',
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单类型',
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单名称',
  `icon` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图标',
  `url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '内外链访问地址',
  `target` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '打开方式',
  `show` tinyint DEFAULT NULL COMMENT '是否展示',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint DEFAULT NULL COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='菜单表';

-- ----------------------------
-- Records of t_menu
-- ----------------------------
BEGIN;
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1, 0, '工作台', '/workspace', 'system/dashboard/Workplace', 'menu', '工作台', 'desktop', '', '_component', 1, 2, 'admin', '2022-05-05 16:16:19', 'admin', '2022-06-15 19:22:38', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (2, 0, '组织架构', '', 'PageView', 'catalog_breadcrumb', '组织架构', 'cluster', '', '_component', 1, 4, 'admin', '2022-05-05 16:16:46', 'admin', '2022-05-09 10:05:29', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (3, 0, '权限管理', '', 'RouteView', 'catalog', '权限管理', 'team', '', '_component', 1, 6, 'admin', '2022-05-05 16:17:24', 'admin', '2022-05-09 10:06:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (4, 0, '系统管理', '', 'RouteView', 'catalog', '系统管理', 'setting', '', '_component', 1, 8, 'admin', '2022-05-05 16:17:34', 'admin', '2022-05-09 10:05:42', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (5, 0, '日志管理', '', 'RouteView', 'catalog', '日志管理', 'credit-card', '', '_component', 1, 16, 'admin', '2022-05-05 16:17:47', 'admin', '2022-05-09 10:10:44', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (6, 0, '系统监控', '', 'RouteView', 'catalog', '系统监控', 'fund', '', '_component', 1, 10, 'admin', '2022-05-05 16:18:10', 'admin', '2022-05-09 10:06:25', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (7, 0, '通知公告', '', 'RouteView', 'catalog', '通知公告', 'sound', '', '_component', 1, 12, 'admin', '2022-05-05 16:18:21', 'admin', '2022-05-09 10:06:46', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (8, 0, '定时任务', '', 'RouteView', 'catalog', '定时任务', 'hourglass', '', '_component', 1, 14, 'admin', '2022-05-05 16:18:31', 'admin', '2022-05-09 10:09:53', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (9, 0, '开发管理', '', 'PageView', 'catalog_breadcrumb', '开发管理', 'solution', '', '_component', 1, 99, 'admin', '2022-05-05 16:19:00', 'admin', '2022-05-09 10:11:16', 1);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (10, 2, '组织机构管理', '/org', 'system/org/Org', 'menu', '组织机构管理', 'pause-circle', '', '_component', 1, 2, 'admin', '2022-05-05 16:19:53', 'admin', '2022-05-06 19:17:24', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (11, 2, '岗位管理', '/position', 'system/org/Position', 'menu', '岗位管理', 'pause-circle', '', '_component', 1, 4, 'admin', '2022-05-05 16:20:32', 'admin', '2022-05-06 19:17:35', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (12, 3, '用户管理', '/users', 'system/permission/User', 'menu', '用户管理', 'user', '', '_component', 1, 2, 'admin', '2022-05-05 16:20:54', 'admin', '2022-05-09 10:08:17', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (13, 3, '角色管理', '/role', 'system/permission/Role', 'menu', '角色管理', 'usergroup-delete', '', '_component', 1, 4, 'admin', '2022-05-05 16:21:12', 'admin', '2022-05-09 10:09:12', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (14, 3, '菜单管理', '/menu', 'system/permission/Menu', 'menu', '菜单管理', 'bars', '', '_component', 1, 6, 'admin', '2022-05-05 16:21:34', 'admin', '2022-05-09 10:08:06', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (15, 4, '配置管理', '/config', 'system/sys/Config', 'menu', '配置管理', 'pause-circle', '', '_component', 1, 2, 'admin', '2022-05-05 16:58:38', 'admin', '2022-05-06 19:18:10', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (16, 4, '字典管理', '/dict', 'system/sys/Dict', 'menu', '字典管理', 'pause-circle', '', '_component', 1, 4, 'admin', '2022-05-05 16:59:19', 'admin', '2022-05-06 19:18:15', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (17, 4, '字典项管理', '/dict/items', 'system/sys/DictItem', 'menu', '字典项管理', 'pause-circle', '', '_component', 1, 6, 'admin', '2022-05-05 16:59:57', 'admin', '2022-07-25 15:46:25', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (18, 6, '服务监控', '/sys/monitor', 'system/sys/Monitor', 'menu', '服务监控', 'pause-circle', '', '_component', 1, 2, 'admin', '2022-05-05 17:02:28', 'admin', '2022-05-06 19:18:56', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (19, 6, '在线用户', '/user/online', 'system/sys/UserOnline', 'menu', '在线用户', 'pause-circle', '', '_component', 1, 6, 'admin', '2022-05-05 17:03:27', 'admin', '2022-07-18 15:25:25', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (20, 7, '公告管理', '/notice', 'system/notice/Notice', 'menu', '公告管理', 'pause-circle', '', '_component', 1, 99, 'admin', '2022-05-05 17:06:38', 'admin', '2022-05-05 17:06:38', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (21, 8, '任务管理', '/task', 'system/task/Task', 'menu', '任务管理', 'pause-circle', '', '_component', 1, 2, 'admin', '2022-05-05 17:07:16', 'admin', '2022-05-06 19:19:15', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (22, 8, '执行日志', '/task/log', 'system/task/TaskLog', 'menu', '执行日志', 'pause-circle', '', '_component', 1, 4, 'admin', '2022-05-05 17:08:11', 'admin', '2022-05-06 19:19:20', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (23, 10, '查询组织树', NULL, '', 'button', '查询组织树', 'pause-circle', '/orgs/tree', 'none', 1, 99, 'admin', '2022-05-05 17:35:19', 'admin', '2022-05-05 17:47:22', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (24, 10, '查询组织列表', NULL, '', 'button', '查询组织列表', 'pause-circle', '/orgs', 'none', 1, 99, 'admin', '2022-05-05 17:36:08', 'admin', '2022-05-05 17:47:43', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (25, 10, '新增组织', NULL, '', 'button', '新增组织', 'pause-circle', '/org', 'none', 1, 99, 'admin', '2022-05-05 17:36:42', 'admin', '2022-05-05 17:47:49', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (26, 10, '删除组织', NULL, '', 'button', '删除组织', 'pause-circle', '/org', 'none', 1, 99, 'admin', '2022-05-05 17:37:08', 'admin', '2022-06-04 17:36:14', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (27, 10, '批量删除组织', NULL, '', 'button', '批量删除组织', 'pause-circle', '/orgs', 'none', 1, 99, 'admin', '2022-05-05 17:37:29', 'admin', '2022-05-05 17:48:04', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (28, 10, '编辑组织', NULL, '', 'button', '编辑组织', 'pause-circle', '/org', 'none', 1, 99, 'admin', '2022-05-05 17:38:54', 'admin', '2022-05-05 17:48:10', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (29, 11, '查询岗位列表', NULL, '', 'button', '查询岗位列表', 'pause-circle', '/positions', 'none', 1, 99, 'admin', '2022-05-05 17:48:43', 'admin', '2022-05-05 17:48:51', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (30, 11, '新增岗位', NULL, '', 'button', '新增岗位', 'pause-circle', '/position', 'none', 1, 99, 'admin', '2022-05-05 17:49:28', 'admin', '2022-05-05 17:49:37', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (31, 11, '删除岗位', NULL, '', 'button', '删除岗位', 'pause-circle', '/position', 'none', 1, 99, 'admin', '2022-05-05 17:50:02', 'admin', '2022-06-04 17:36:45', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (32, 11, '批量删除岗位', NULL, '', 'button', '批量删除岗位', 'pause-circle', '/positions', 'none', 1, 99, 'admin', '2022-05-05 17:50:27', 'admin', '2022-05-05 17:50:27', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (33, 11, '编辑岗位', NULL, '', 'button', '编辑岗位', 'pause-circle', '/position', 'none', 1, 99, 'admin', '2022-05-05 17:50:47', 'admin', '2022-05-05 22:28:41', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (34, 13, '查询角色列表', NULL, '', 'button', '查询角色列表', 'pause-circle', '/roles', 'none', 1, 99, 'admin', '2022-05-05 17:56:36', 'admin', '2022-05-05 17:56:36', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (35, 13, '新增角色', NULL, '', 'button', '新增角色', 'pause-circle', '/role', 'none', 1, 99, 'admin', '2022-05-05 17:56:58', 'admin', '2022-05-05 17:56:58', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (36, 13, '删除角色', NULL, '', 'button', '删除角色', 'pause-circle', '/role', 'none', 1, 99, 'admin', '2022-05-05 17:57:20', 'admin', '2022-05-05 17:57:28', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (37, 13, '批量删除角色', NULL, '', 'button', '批量删除角色', 'pause-circle', '/roles', 'none', 1, 99, 'admin', '2022-05-05 17:57:51', 'admin', '2022-05-05 17:57:51', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (38, 13, '编辑角色', NULL, '', 'button', '编辑角色', 'pause-circle', '/role', 'none', 1, 99, 'admin', '2022-05-05 17:58:24', 'admin', '2022-05-05 17:58:24', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (39, 13, '分配菜单', NULL, '', 'button', '分配菜单', 'pause-circle', '/role/menus', 'none', 1, 99, 'admin', '2022-05-05 18:00:33', 'admin', '2022-06-04 17:37:36', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (40, 12, '查询用户列表', NULL, '', 'button', '查询用户列表', 'pause-circle', '/users', 'none', 1, 99, 'admin', '2022-05-05 20:50:38', 'admin', '2022-05-05 20:50:38', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (41, 12, '新增用户', NULL, '', 'button', '新增用户', 'pause-circle', '/user', 'none', 1, 99, 'admin', '2022-05-05 20:51:20', 'admin', '2022-05-05 20:51:20', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (42, 12, '删除用户', NULL, '', 'button', '删除用户', 'pause-circle', '/user', 'none', 1, 99, 'admin', '2022-05-05 20:51:52', 'admin', '2022-06-04 17:36:58', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (43, 12, '批量删除用户', NULL, '', 'button', '批量删除用户', 'pause-circle', '/users', 'none', 1, 99, 'admin', '2022-05-05 20:52:12', 'admin', '2022-05-05 20:52:44', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (44, 12, '编辑用户', NULL, '', 'button', '编辑用户', 'pause-circle', '/user', 'none', 1, 99, 'admin', '2022-05-05 20:53:13', 'admin', '2022-05-05 20:53:13', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (45, 12, '分配角色', NULL, '', 'button', '分配角色', 'pause-circle', '/user/roles', 'none', 1, 99, 'admin', '2022-05-05 20:55:13', 'admin', '2022-06-04 17:37:06', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (46, 12, '重置密码', NULL, '', 'button', '重置密码', 'pause-circle', '/user/password/reset', 'none', 1, 99, 'admin', '2022-05-05 20:55:54', 'admin', '2022-06-04 17:37:15', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (47, 14, '新增菜单', NULL, '', 'button', '新增菜单', 'pause-circle', '/menu', 'none', 1, 99, 'admin', '2022-05-05 20:58:36', 'admin', '2022-05-05 20:58:36', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (48, 14, '删除菜单', NULL, '', 'button', '删除菜单', 'pause-circle', '/menu', 'none', 1, 99, 'admin', '2022-05-05 20:59:50', 'admin', '2022-06-04 17:37:43', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (49, 14, '编辑菜单', NULL, '', 'button', '编辑菜单', 'pause-circle', '/menu', 'none', 1, 99, 'admin', '2022-05-05 21:00:31', 'admin', '2022-05-05 21:00:31', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (50, 14, '查询菜单列表', NULL, '', 'button', '查询菜单列表', 'pause-circle', '/menus/tree', 'none', 1, 99, 'admin', '2022-05-05 21:07:36', 'admin', '2022-05-05 21:08:19', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (51, 16, '查询字典列表', NULL, '', 'button', '查询字典列表', 'pause-circle', '/dicts', 'none', 1, 99, 'admin', '2022-05-05 21:11:45', 'admin', '2022-05-05 21:14:27', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (52, 16, '新增字典', NULL, '', 'button', '新增字典', 'pause-circle', '/dict', 'none', 1, 99, 'admin', '2022-05-05 21:12:12', 'admin', '2022-05-05 21:12:12', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (53, 16, '删除字典', NULL, '', 'button', '删除字典', 'pause-circle', '/dict', 'none', 1, 99, 'admin', '2022-05-05 21:12:42', 'admin', '2022-06-04 17:38:10', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (54, 16, '批量删除字典', NULL, '', 'button', '批量删除字典', 'pause-circle', '/dicts', 'none', 1, 99, 'admin', '2022-05-05 21:13:09', 'admin', '2022-05-05 21:13:09', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (55, 16, '编辑字典', NULL, '', 'button', '编辑字典', 'pause-circle', '/dict', 'none', 1, 99, 'admin', '2022-05-05 21:13:34', 'admin', '2022-05-05 21:13:34', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (56, 17, '查询字典项列表', NULL, '', 'button', '查询字典项列表', 'pause-circle', '/dict/items', 'none', 1, 99, 'admin', '2022-05-05 21:15:58', 'admin', '2022-05-05 21:15:58', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (57, 17, '新增字典项', NULL, '', 'button', '新增字典项', 'pause-circle', '/dict/item', 'none', 1, 99, 'admin', '2022-05-05 21:16:23', 'admin', '2022-05-05 21:16:23', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (58, 17, '删除字典项', NULL, '', 'button', '删除字典项', 'pause-circle', '/dict/item', 'none', 1, 99, 'admin', '2022-05-05 21:17:00', 'admin', '2022-06-04 17:38:19', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (59, 17, '批量删除字典项', NULL, '', 'button', '批量删除字典项', 'pause-circle', '/dict/items', 'none', 1, 99, 'admin', '2022-05-05 21:17:30', 'admin', '2022-05-05 21:17:30', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (60, 17, '编辑字典项', NULL, '', 'button', '编辑字典项', 'pause-circle', '/dict/item', 'none', 1, 99, 'admin', '2022-05-05 21:18:18', 'admin', '2022-05-05 21:18:18', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (61, 15, '查询配置列表', NULL, '', 'button', '查询配置列表', 'pause-circle', '/configs', 'none', 1, 99, 'admin', '2022-05-05 21:19:58', 'admin', '2022-05-05 21:19:58', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (62, 15, '新增配置', NULL, '', 'button', '新增配置', 'pause-circle', '/config', 'none', 1, 99, 'admin', '2022-05-05 21:20:30', 'admin', '2022-05-05 21:20:30', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (63, 15, '删除配置', NULL, '', 'button', '删除配置', 'pause-circle', '/config', 'none', 1, 99, 'admin', '2022-05-05 21:20:58', 'admin', '2022-06-04 17:38:01', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (64, 15, '批量删除配置', NULL, '', 'button', '批量删除配置', 'pause-circle', '/configs', 'none', 1, 99, 'admin', '2022-05-05 21:21:24', 'admin', '2022-05-05 21:21:24', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (65, 15, '编辑配置', NULL, '', 'button', '编辑配置', 'pause-circle', '/config', 'none', 1, 99, 'admin', '2022-05-05 21:21:53', 'admin', '2022-05-05 21:21:53', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (66, 19, '查询在线用户', NULL, '', 'button', '查询在线用户', 'pause-circle', '/users/online', 'none', 1, 99, 'admin', '2022-05-05 21:23:22', 'admin', '2022-05-05 21:23:22', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (67, 19, '下线用户', NULL, '', 'button', '下线用户', 'pause-circle', '/user/kickOut', 'none', 1, 99, 'admin', '2022-05-05 21:23:56', 'admin', '2022-06-04 17:38:31', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (68, 19, '批量下线用户', NULL, '', 'button', '批量下线用户', 'pause-circle', '/users/kickOut', 'none', 1, 99, 'admin', '2022-05-05 21:24:27', 'admin', '2022-05-05 21:25:53', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (69, 18, '查询监控信息', NULL, '', 'button', '查询监控信息', 'pause-circle', '/sys/monitor', 'none', 1, 99, 'admin', '2022-05-05 21:26:42', 'admin', '2022-05-06 11:24:08', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (70, 20, '查询公告列表', NULL, '', 'button', '查询公告列表', 'pause-circle', '/notices', 'none', 1, 99, 'admin', '2022-05-05 21:44:04', 'admin', '2022-05-05 21:44:29', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (71, 20, '新增公告', NULL, '', 'button', '新增公告', 'pause-circle', '/notice', 'none', 1, 99, 'admin', '2022-05-05 21:47:37', 'admin', '2022-05-05 21:52:02', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (72, 20, '删除公告', NULL, '', 'button', '删除公告', 'pause-circle', '/notice', 'none', 1, 99, 'admin', '2022-05-05 21:51:07', 'admin', '2022-06-04 17:38:38', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (73, 20, '批量删除公告', NULL, '', 'button', '批量删除公告', 'pause-circle', '/notices', 'none', 1, 99, 'admin', '2022-05-05 21:52:32', 'admin', '2022-05-05 21:52:32', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (74, 21, '查询任务列表', NULL, '', 'button', '查询任务列表', 'pause-circle', '/tasks', 'none', 1, 99, 'admin', '2022-05-05 21:53:26', 'admin', '2022-05-05 21:53:26', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (75, 21, '新增任务', NULL, '', 'button', '新增任务', 'pause-circle', '/task', 'none', 1, 99, 'admin', '2022-05-05 21:54:14', 'admin', '2022-05-05 21:54:14', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (76, 21, '删除任务', NULL, '', 'button', '删除任务', 'pause-circle', '/task', 'none', 1, 99, 'admin', '2022-05-05 21:54:37', 'admin', '2022-06-04 17:38:49', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (77, 21, '批量删除任务', NULL, '', 'button', '批量删除任务', 'pause-circle', '/tasks', 'none', 1, 99, 'admin', '2022-05-05 21:55:03', 'admin', '2022-05-05 21:55:03', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (78, 21, '编辑任务', NULL, '', 'button', '编辑任务', 'pause-circle', '/task', 'none', 1, 99, 'admin', '2022-05-05 21:55:25', 'admin', '2022-05-05 21:55:25', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (79, 21, '暂停任务', NULL, '', 'button', '暂停任务', 'pause-circle', '/task/pause', 'none', 1, 99, 'admin', '2022-05-05 21:56:31', 'admin', '2022-06-04 17:38:55', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (80, 21, '启动任务', NULL, '', 'button', '启动任务', 'pause-circle', '/task/resume', 'none', 1, 99, 'admin', '2022-05-05 21:57:09', 'admin', '2022-06-04 17:39:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (81, 22, '查询执行日志列表', NULL, '', 'button', '查询执行日志列表', 'pause-circle', '/taskLogs', 'none', 1, 99, 'admin', '2022-05-05 21:58:58', 'admin', '2022-05-05 21:58:58', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (82, 22, '删除执行日志', NULL, '', 'button', '删除执行日志', 'pause-circle', '/taskLog', 'none', 1, 99, 'admin', '2022-05-05 21:59:54', 'admin', '2022-06-04 17:39:07', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (83, 22, '批量删除执行日志', NULL, '', 'button', '批量删除执行日志', 'pause-circle', '/taskLogs', 'none', 1, 99, 'admin', '2022-05-05 22:00:23', 'admin', '2022-05-05 22:00:23', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (84, 22, '清空执行日志', NULL, '', 'button', '清空执行日志', 'pause-circle', '/taskLogs/clear', 'none', 1, 99, 'admin', '2022-05-05 22:01:01', 'admin', '2022-05-05 22:01:01', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (85, 5, '登录日志', '/log/login', 'system/log/LoginLog', 'menu', '登录日志', 'pause-circle', '', '_component', 1, 2, 'admin', '2022-05-05 22:07:05', 'admin', '2022-05-06 19:18:38', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (86, 5, '操作日志', '/log/operation', 'system/log/OperationLog', 'menu', '操作日志', 'pause-circle', '', '_component', 1, 4, 'admin', '2022-05-05 22:07:42', 'admin', '2022-05-06 19:18:43', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (87, 85, '查询日志列表', NULL, '', 'button', '查询日志列表', 'pause-circle', '/loginLogs', 'none', 1, 99, 'admin', '2022-05-05 22:09:37', 'admin', '2022-05-06 11:25:05', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (88, 85, '删除登录日志', NULL, '', 'button', '删除登录日志', 'pause-circle', '/loginLog', 'none', 1, 99, 'admin', '2022-05-05 22:10:09', 'admin', '2022-06-04 17:39:16', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (89, 85, '批量删除日志', NULL, '', 'button', '批量删除日志', 'pause-circle', '/loginLogs', 'none', 1, 99, 'admin', '2022-05-05 22:10:43', 'admin', '2022-05-06 11:25:13', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (90, 85, '清空登录日志', NULL, '', 'button', '清空登录日志', 'pause-circle', '/loginLogs/clear', 'none', 1, 99, 'admin', '2022-05-05 22:11:06', 'admin', '2022-05-05 22:11:06', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (91, 86, '查询操作日志列表', NULL, '', 'button', '查询操作日志列表', 'pause-circle', '/operationLogs', 'none', 1, 99, 'admin', '2022-05-05 22:12:05', 'admin', '2022-05-05 22:12:05', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (92, 86, '删除操作日志', NULL, '', 'button', '删除操作日志', 'pause-circle', '/operationLog', 'none', 1, 99, 'admin', '2022-05-05 22:12:30', 'admin', '2022-06-04 17:39:24', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (93, 86, '批量删除操作日志', NULL, '', 'button', '批量删除操作日志', 'pause-circle', '/operationLogs', 'none', 1, 99, 'admin', '2022-05-05 22:12:57', 'admin', '2022-05-05 22:12:57', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (94, 86, '清空操作日志', NULL, '', 'button', '清空操作日志', 'pause-circle', '/operationLogs/clear', 'none', 1, 99, 'admin', '2022-05-05 22:13:30', 'admin', '2022-05-05 22:13:30', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (95, 0, '流程设计', '/flow', 'system/flow/Design', 'menu', '流程设计', 'pause-circle', '', '_component', 0, 99, 'admin', '2022-06-02 21:41:00', 'admin', '2022-07-21 17:53:02', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (96, 10, '导出组织列表', NULL, '', 'button', '导出组织列表', 'pause-circle', '/roles/export', 'none', 1, 99, 'admin', '2022-06-04 17:40:21', 'admin', '2022-06-04 17:41:19', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (97, 11, '导出岗位列表', NULL, '', 'button', '导出岗位列表', 'pause-circle', '/positions/export', 'none', 1, 99, 'admin', '2022-06-04 17:41:05', 'admin', '2022-06-04 17:41:05', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (98, 12, '导出用户列表', NULL, '', 'button', '导出用户列表', 'pause-circle', '/users/export', 'none', 1, 99, 'admin', '2022-06-04 17:41:42', 'admin', '2022-06-04 17:42:43', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (99, 13, '导出角色列表', NULL, '', 'button', '导出角色列表', 'pause-circle', '/roles/export', 'none', 1, 99, 'admin', '2022-06-04 17:42:30', 'admin', '2022-06-04 17:42:30', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (100, 14, '导出菜单列表', NULL, '', 'button', '导出菜单列表', 'pause-circle', '/menus/export', 'none', 1, 99, 'admin', '2022-06-04 17:43:20', 'admin', '2022-06-04 17:43:20', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (101, 15, '导出配置列表', NULL, '', 'button', '导出配置列表', 'pause-circle', '/configs/export', 'none', 1, 99, 'admin', '2022-06-04 17:43:48', 'admin', '2022-06-04 17:43:48', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (102, 16, '导出字典列表', NULL, '', 'button', '导出字典列表', 'pause-circle', '/dicts/export', 'none', 1, 99, 'admin', '2022-06-04 17:44:22', 'admin', '2022-06-04 17:44:22', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (103, 17, '导出字典项列表', NULL, '', 'button', '导出字典项列表', 'pause-circle', '/dict/items/export', 'none', 1, 99, 'admin', '2022-06-04 17:44:58', 'admin', '2022-06-04 17:44:58', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (104, 21, '导出任务列表', NULL, '', 'button', '导出任务列表', 'pause-circle', '/tasks/export', 'none', 1, 99, 'admin', '2022-06-04 17:46:38', 'admin', '2022-06-04 17:46:38', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (105, 22, '导出任务执行日志', NULL, '', 'button', '导出任务执行日志', 'pause-circle', '/taskLogs/export', 'none', 1, 99, 'admin', '2022-06-04 17:47:19', 'admin', '2022-06-04 17:47:19', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (106, 85, '导出登录日志', NULL, '', 'button', '导出登录日志', 'pause-circle', '/loginLogs/export', 'none', 1, 99, 'admin', '2022-06-04 17:47:49', 'admin', '2022-06-04 17:47:49', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (107, 86, '导出操作日志', NULL, '', 'button', '导出操作日志', 'pause-circle', '/operationLogs/export', 'none', 1, 99, 'admin', '2022-06-04 17:48:14', 'admin', '2022-06-04 17:48:28', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (108, 0, '报告管理', '/report', 'Iframe', 'menu', '报告管理', 'pause-circle', 'http://172.16.22.207:18282/dist/#/PerformancEvaluation', '_self', 1, 100, 'admin', '2022-05-20 09:41:31', 'admin', '2022-05-20 09:59:44', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (109, 122, '场站基本信息台账', '/ledger', 'Iframe', 'menu', '场站基本信息台账', 'pause-circle', 'http://172.16.22.207:18282/dist/#/PerformancInfoLedger', '_self', 1, 99, 'admin', '2022-05-20 10:19:46', 'admin', '2022-06-21 11:23:24', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (110, 128, '报告配置', '/ReportConfig', 'Iframe', 'menu', '报告配置', 'pause-circle', 'http://172.16.22.207:18282/dist/#/ReportConfig', '_self', 1, 99, 'admin', '2022-05-20 10:23:17', 'admin', '2022-06-21 12:44:44', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (111, 128, '报告模板配置', '/TemplateConfig', 'Iframe', 'menu', '报告模板配置', 'pause-circle', 'http://172.16.22.207:18282/dist/#/TemplateConfig', '_self', 1, 99, 'admin', '2022-05-20 10:23:45', 'admin', '2022-06-21 12:44:29', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (112, 125, '设备树管理', '/EquipTreeManage', 'Iframe', 'menu', '设备树管理', 'pause-circle', 'http://172.16.22.207:18282/dist/#/EquipTreeManage', '_self', 1, 99, 'admin', '2022-05-20 10:24:28', 'admin', '2022-06-21 12:23:39', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (113, 0, '报告管理开发', '', 'PageView', 'catalog_breadcrumb', '报告管理开发', 'pause-circle', '', '_component', 1, 99, 'admin', '2022-05-24 09:42:18', 'admin', '2022-05-24 09:42:18', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (114, 113, 'api列表', '/reportmng/list', 'Iframe', 'menu', 'api列表', 'pause-circle', 'http://172.16.22.207:18282/reportmng/doc.html#/home', '_self', 1, 99, 'admin', '2022-05-24 09:44:02', 'admin', '2022-05-24 09:44:02', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (115, 113, '业务数据接口', '/reportmng/apicreator', 'Iframe', 'menu', '业务数据接口', 'pause-circle', 'http://172.16.22.207:18585/interface-ui/#/', '_self', 1, 99, 'admin', '2022-05-24 09:45:56', 'admin', '2022-05-24 09:48:05', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (118, 128, '报告脚本定义', '/ReportScriptDefine', 'Iframe', 'menu', '报告脚本定义', 'pause-circle', 'http://172.16.22.207:18282/dist/#/ReportScriptDefine', '_self', 1, 99, 'admin', '2022-06-01 15:00:25', 'admin', '2022-06-21 12:44:52', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (119, 3, '应用管理', '/app', 'system/permission/App', 'menu', '应用管理', 'pause-circle', '', '_component', 1, 99, 'admin', '2022-06-07 10:44:03', 'admin', '2022-06-07 10:44:03', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (120, 0, '功率预测修正', '/power/forecast', 'main/power/PowerForecast', 'menu', '功率预测修正', 'line-chart', '', '_component', 1, 203, 'admin', '2022-06-07 16:57:47', 'admin', '2022-08-29 14:53:33', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (121, 0, 'hello', '', 'PageView', 'catalog_breadcrumb', 'hello', 'pause-circle', '', '_component', 1, 99, 'admin', '2022-06-09 11:18:05', 'admin', '2022-06-09 11:18:05', 1);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (122, 0, '台账管理', '', 'RouteView', 'catalog', '台账管理', 'pause-circle', '', '_component', 1, 99, 'admin', '2022-06-21 11:22:58', 'admin', '2022-06-22 13:13:26', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (123, 122, '设备台账', '', 'PageView', 'catalog_breadcrumb', '设备台账', 'pause-circle', '', '_component', 1, 99, 'admin', '2022-06-21 11:27:45', 'admin', '2022-06-21 11:27:45', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (124, 0, '后台管理', '', 'RouteView', 'catalog', '后台管理', 'pause-circle', '', '_component', 1, 99, 'admin', '2022-06-21 12:13:27', 'admin', '2022-06-22 13:13:03', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (125, 124, '设备台账管理', '', 'RouteView', 'catalog', '设备台账管理', 'pause-circle', '', '_component', 1, 99, 'admin', '2022-06-21 12:23:09', 'admin', '2022-06-22 13:13:11', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (127, 125, '设备型号库管理', '/EquipModelManage', 'Iframe', 'menu', '设备型号库管理', 'pause-circle', 'http://172.16.22.207:18282/dist/#/EquipModelManage', '_self', 1, 99, 'admin', '2022-06-21 12:43:25', 'admin', '2022-06-21 13:00:46', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (128, 124, '报告配置管理', '', 'RouteView', 'catalog', '报告配置管理', 'pause-circle', '', '_component', 1, 99, 'admin', '2022-06-21 12:44:02', 'admin', '2022-06-22 13:13:18', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (131, 125, '设备基本参数配置', '/EquipBasicInfoConfig', 'Iframe', 'menu', '设备基本参数配置', 'pause-circle', 'http://172.16.22.207:18282/dist/#/EquipBasicInfoConfig', '_self', 1, 99, 'admin', '2022-06-21 12:53:54', 'admin', '2022-06-21 12:58:22', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (132, 0, '场站管理', '/power/station', 'main/power/Station', 'menu', '场站管理', 'bars', '', '_component', 1, 209, 'admin', '2022-06-27 17:20:18', 'admin', '2022-08-29 14:54:01', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (133, 6, '应用监控', '/druid', 'Iframe', 'menu', '应用监控', 'pause-circle', 'http://localhost:8088/api/druid/', '_self', 1, 4, 'admin', '2022-06-29 17:17:13', 'admin', '2022-07-18 15:25:35', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (134, 0, 'hoppscotch', '/hoppscotch', 'Iframe', 'menu', 'hoppscotch', 'bars', './hoppscotch', '_self', 1, 99, 'admin', '2022-07-08 10:14:33', 'admin', '2022-07-08 10:14:33', 1);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (135, 0, '数据库管理', '/database', 'system/database', 'menu', '数据库管理', 'bars', '', '_component', 0, 99, 'admin', '2022-07-08 16:25:01', 'admin', '2022-07-21 17:52:57', 1);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (136, 119, '查询应用列表', NULL, '', 'button', '查询应用列表', 'bars', '/apps', 'none', 1, 99, 'admin', '2022-07-18 20:03:13', 'admin', '2022-07-18 20:03:13', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (137, 0, '功率预测准确率评价', '/power/accuracy', 'main/power/PowerPredictionAccuracy', 'menu', '功率预测准确率评价', 'bar-chart', '', '_component', 1, 205, 'admin', '2022-07-19 14:57:30', 'admin', '2022-08-29 14:53:39', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (138, 120, '查询场站树结构', NULL, '', 'button', '查询场站树结构', 'bars', '/resources/tree', 'none', 1, 99, 'admin', '2022-07-20 09:22:17', 'admin', '2022-07-20 09:22:26', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (139, 120, '查询功率预测数据', NULL, '', 'button', '查询功率预测数据', 'pause-circle', '/powerForecasts', 'none', 1, 99, 'admin', '2022-07-20 09:23:07', 'admin', '2022-07-20 09:23:07', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (140, 120, '文件下载', NULL, '', 'button', '文件下载', 'pause-circle', '/powerForecasts/download', 'none', 1, 99, 'admin', '2022-07-20 09:23:55', 'admin', '2022-07-20 09:23:55', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (141, 120, '调整功率预测数据', NULL, '', 'button', '调整功率预测数据', 'pause-circle', '/powerForecasts', 'none', 1, 99, 'admin', '2022-07-20 09:24:17', 'admin', '2022-07-20 09:24:17', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (142, 7, '已收公告', '/notcice/receive', 'system/notice/NoticeReceive', 'menu', '已收公告', 'bars', '', '_component', 1, 99, 'admin', '2022-07-21 14:21:36', 'admin', '2022-07-21 14:21:36', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (144, 0, '文件管理', '/file', 'system/file/File', 'menu', '文件管理', 'folder-open', '', '_component', 1, 99, 'admin', '2022-07-21 14:24:59', 'admin', '2022-07-22 15:48:40', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (145, 7, '查看公告', '/notice/:id', 'system/notice/NoticeView', 'menu', '查看公告', 'bars', '', '_component', 0, 99, 'admin', '2022-07-23 17:56:41', 'admin', '2022-07-25 14:47:21', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (146, 0, '聊天室', '/chat', 'system/chat/Chat', 'menu', '聊天室', 'bars', '', '_component', 0, 99, 'admin', '2022-07-25 16:31:27', 'admin', '2022-08-29 14:52:06', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (147, 0, '数据查看', '', 'RouteView', 'catalog', '数据查看', 'bars', '', '_component', 1, 99, 'admin', '2022-08-24 14:27:42', 'admin', '2022-08-24 14:27:42', 1);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (148, 0, '数据监测', '/power/monitor', 'main/power/DataMonitor', 'menu', '数据监测', 'fund', '', '_component', 1, 201, 'admin', '2022-08-24 14:28:41', 'admin', '2022-08-29 14:53:14', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (149, 0, '采集上传日志', '/power/log', 'system/task/TaskLog', 'menu', '采集上传日志', 'bars', '', '_component', 1, 207, 'admin', '2022-08-24 19:22:01', 'admin', '2022-08-29 14:53:46', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `name`, `path`, `component`, `type`, `title`, `icon`, `url`, `target`, `show`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (150, 147, '超短期功率预测', '/powerForecast/ultraShortTerm', 'main/power/PowerUltraShortTerm', 'menu', '超短期功率预测', 'bars', '', '_component', 1, 99, 'admin', '2022-08-24 19:37:50', 'admin', '2022-08-24 19:37:50', 1);
COMMIT;

-- ----------------------------
-- Table structure for t_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `t_operation_log`;
CREATE TABLE `t_operation_log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `module` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '模块',
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作类型',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作人',
  `datetime` datetime DEFAULT NULL COMMENT '操作时间',
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '操作详情',
  `path` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求路径',
  `method` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求方法',
  `remote_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ip地址',
  `browser` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '浏览器',
  `os` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作系统',
  `class_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类名',
  `method_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '方法名',
  `params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '参数',
  `result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '返回结果',
  `process_time` int DEFAULT NULL COMMENT '执行时长',
  `success` tinyint DEFAULT NULL COMMENT '成功失败',
  `error_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '错误信息',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_datetime` (`datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_operation_log
-- ----------------------------
BEGIN;
INSERT INTO `t_operation_log` (`id`, `module`, `type`, `username`, `datetime`, `detail`, `path`, `method`, `remote_ip`, `browser`, `os`, `class_name`, `method_name`, `params`, `result`, `process_time`, `success`, `error_message`) VALUES (1, '配置管理', 'delete', NULL, '2022-09-14 18:24:58', '删除了配置[sm4密钥].', '/api/configs', 'POST', '127.0.0.1', 'Chrome', 'OSX', 'com.renguangli.rainy.controller.ConfigController', 'remove', '[IdNamesParam(ids=[48], names=[sm4密钥])]', NULL, 3, 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_org
-- ----------------------------
DROP TABLE IF EXISTS `t_org`;
CREATE TABLE `t_org` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `code` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '唯一编码',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `del_flag` tinyint DEFAULT NULL COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='组织机构表';

-- ----------------------------
-- Records of t_org
-- ----------------------------
BEGIN;
INSERT INTO `t_org` (`id`, `parent_id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1, 0, '东方国信', NULL, '东方国信', 99, '2022-04-05 17:57:52', 'admin', '2022-05-31 12:04:37', 'admin', 0);
INSERT INTO `t_org` (`id`, `parent_id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (2, 1, '工业事业部', NULL, '工业事业部', 99, '2022-04-05 17:57:52', 'admin', '2022-04-05 21:25:00', 'admin', 0);
INSERT INTO `t_org` (`id`, `parent_id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (3, 1, '联通事业部', NULL, '联通事业部', 99, '2022-04-05 17:57:52', 'admin', '2022-05-31 12:04:40', 'admin', 0);
INSERT INTO `t_org` (`id`, `parent_id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (4, 2, '电力行业中心', NULL, '联通事业部', 99, '2022-04-05 17:57:52', 'admin', '2022-05-19 15:20:36', 'admin', 0);
INSERT INTO `t_org` (`id`, `parent_id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (5, 1, '电信事业部', NULL, '电信事业部', 99, '2022-04-05 17:57:52', 'admin', '2022-05-31 12:04:41', 'admin', 0);
INSERT INTO `t_org` (`id`, `parent_id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (6, 1, '移动事业部', NULL, '移动事业部', 99, '2022-04-10 19:53:58', 'admin', '2022-04-22 17:05:44', 'admin', 0);
INSERT INTO `t_org` (`id`, `parent_id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (7, 2, '开发组', NULL, '开发组', 99, '2022-04-10 19:54:30', 'admin', '2022-06-04 17:35:28', 'bonctest', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_org_user_rel
-- ----------------------------
DROP TABLE IF EXISTS `t_org_user_rel`;
CREATE TABLE `t_org_user_rel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `org_id` int DEFAULT NULL COMMENT '组织id',
  `user_id` int DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='组织用户关系表';

-- ----------------------------
-- Records of t_org_user_rel
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_position
-- ----------------------------
DROP TABLE IF EXISTS `t_position`;
CREATE TABLE `t_position` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '职位名称',
  `code` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '唯一编码',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `del_flag` tinyint DEFAULT NULL COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_position
-- ----------------------------
BEGIN;
INSERT INTO `t_position` (`id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1, '董事长', NULL, '管理公司一切事物，大老板', 99, '2022-04-04 00:02:33', 'admin', '2022-05-30 19:07:23', 'admin', 0);
INSERT INTO `t_position` (`id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (2, '副董事长', NULL, '跑腿的', 99, '2022-04-04 00:02:44', 'admin', '2022-04-04 14:12:48', 'admin', 0);
INSERT INTO `t_position` (`id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (3, '普通员工', NULL, '端茶，倒水，刷厕所', 99, '2022-04-04 14:13:18', 'admin', '2022-04-21 18:43:47', 'admin', 0);
INSERT INTO `t_position` (`id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (4, '总监', NULL, '腿腿', 99, '2022-04-10 19:54:55', 'admin', '2022-04-21 18:44:06', 'admin', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色名称',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色码',
  `sort` int DEFAULT NULL COMMENT '排序',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `defaultd` tinyint DEFAULT NULL COMMENT '是否是默认角色，默认角色不能删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `del_flag` tinyint DEFAULT NULL COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色表';

-- ----------------------------
-- Records of t_role
-- ----------------------------
BEGIN;
INSERT INTO `t_role` (`id`, `name`, `code`, `sort`, `description`, `defaultd`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1, '超级管理员', 'role_superAdmin', 99, '超级管理员', 1, '2022-04-26 17:04:04', 'admin', '2022-05-05 17:59:30', 'admin', 0);
INSERT INTO `t_role` (`id`, `name`, `code`, `sort`, `description`, `defaultd`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (2, '系统管理员', 'role_admin', 99, '对系统进行配置', 0, '2022-04-05 22:44:44', 'admin', '2022-05-05 16:06:00', 'admin', 0);
INSERT INTO `t_role` (`id`, `name`, `code`, `sort`, `description`, `defaultd`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (3, '审计管理员', 'role_audit', 99, '查看各种日志', 0, '2022-04-16 17:19:45', 'admin', '2022-05-05 16:06:12', 'admin', 0);
INSERT INTO `t_role` (`id`, `name`, `code`, `sort`, `description`, `defaultd`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (4, '默认角色', 'role_default', 99, '默认角色', 0, '2022-04-22 16:16:44', 'admin', '2022-05-05 16:06:28', 'admin', 0);
INSERT INTO `t_role` (`id`, `name`, `code`, `sort`, `description`, `defaultd`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (5, '公告发布员', 'role_notice', 99, '公告发布员', 0, '2022-05-05 16:07:10', 'admin', '2022-05-05 16:07:10', 'admin', 0);
INSERT INTO `t_role` (`id`, `name`, `code`, `sort`, `description`, `defaultd`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (6, '测试', 'role_test', 99, '测试', 0, '2022-05-05 22:14:19', 'admin', '2022-05-26 21:25:37', 'admin', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_role_menu_rel
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu_rel`;
CREATE TABLE `t_role_menu_rel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int DEFAULT NULL COMMENT '角色id',
  `menu_id` int DEFAULT NULL COMMENT '菜单id',
  `all` tinyint DEFAULT NULL COMMENT '是否包含所有子菜单',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色菜单关系表';

-- ----------------------------
-- Records of t_role_menu_rel
-- ----------------------------
BEGIN;
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (157, 3, 5, 0);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (158, 3, 85, 0);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (159, 3, 87, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (160, 3, 88, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (161, 3, 89, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (162, 3, 90, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (163, 3, 86, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (164, 3, 91, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (165, 3, 92, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (166, 3, 93, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (167, 3, 94, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (168, 3, 1, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (169, 4, 1, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (170, 5, 7, 0);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (171, 5, 20, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (172, 5, 70, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (173, 5, 71, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (174, 5, 72, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (175, 5, 73, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (176, 5, 1, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (246, 2, 61, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (247, 2, 62, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (248, 2, 63, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (249, 2, 64, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (250, 2, 65, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (251, 2, 51, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (252, 2, 52, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (253, 2, 53, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (254, 2, 54, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (255, 2, 55, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (256, 2, 56, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (257, 2, 57, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (258, 2, 58, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (259, 2, 59, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (260, 2, 60, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (261, 2, 6, 0);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (262, 2, 18, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (263, 2, 69, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (264, 2, 19, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (265, 2, 66, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (266, 2, 67, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (267, 2, 68, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (268, 2, 122, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (269, 2, 109, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (270, 2, 123, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (271, 2, 124, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (272, 2, 125, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (273, 2, 112, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (274, 2, 127, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (275, 2, 128, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (276, 2, 110, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (277, 2, 111, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (278, 2, 131, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (279, 2, 118, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (280, 2, 15, 0);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (281, 2, 4, 0);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (282, 2, 16, 0);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (283, 2, 17, 0);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (284, 6, 1, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (285, 6, 23, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (286, 6, 96, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (287, 6, 29, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (288, 6, 97, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (289, 6, 146, 1);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (290, 6, 10, 0);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (291, 6, 2, 0);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `all`) VALUES (292, 6, 11, 0);
COMMIT;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `org_id` int DEFAULT NULL COMMENT '组织id',
  `position_id` int DEFAULT NULL COMMENT '职位id',
  `username` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `salt` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '摘要算法盐',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `avatar` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像',
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `telephone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机号',
  `status` tinyint DEFAULT NULL COMMENT '用户状态：0 未激活，1 正常',
  `deleted` tinyint DEFAULT NULL COMMENT '删除标志',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `account_expired_time` datetime DEFAULT NULL COMMENT '账号过期时间',
  `password_expired_time` datetime DEFAULT NULL COMMENT '密码过期时间',
  `login_count` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '登录次数',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '最后登录ip',
  `browser` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '最后登录浏览器',
  `os` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '最后登录操作系统',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
BEGIN;
INSERT INTO `t_user` (`id`, `org_id`, `position_id`, `username`, `password`, `salt`, `name`, `avatar`, `email`, `telephone`, `status`, `deleted`, `create_time`, `account_expired_time`, `password_expired_time`, `login_count`, `last_login_time`, `last_login_ip`, `browser`, `os`) VALUES (1, 4, 1, 'admin', '7d94c691e3788c510cce539ae9680435', 'admin', '超级管理员', '/avatar/4a5972c0dea543d885d0802b8c2b7f2f', '1@qq.com', '17600902030', 1, 0, '2022-03-29 18:52:44', NULL, NULL, '942', '2022-08-29 14:50:03', '127.0.0.1', 'Chrome', 'OSX');
INSERT INTO `t_user` (`id`, `org_id`, `position_id`, `username`, `password`, `salt`, `name`, `avatar`, `email`, `telephone`, `status`, `deleted`, `create_time`, `account_expired_time`, `password_expired_time`, `login_count`, `last_login_time`, `last_login_ip`, `browser`, `os`) VALUES (2, 4, 27, 'notice', '7d94c691e3788c510cce539ae9680435', NULL, '公告发布员', '/avatar/avatar.jpg', '2@qq.com', '17600902030', 1, 0, NULL, NULL, NULL, '1', '2022-05-05 16:11:38', '127.0.0.1', 'Chrome/97.0.4692.71', 'OSX/10_15_7');
INSERT INTO `t_user` (`id`, `org_id`, `position_id`, `username`, `password`, `salt`, `name`, `avatar`, `email`, `telephone`, `status`, `deleted`, `create_time`, `account_expired_time`, `password_expired_time`, `login_count`, `last_login_time`, `last_login_ip`, `browser`, `os`) VALUES (3, 3, 21, '234234', '7d94c691e3788c510cce539ae9680435', NULL, '23423', '/avatar/avatar.jpg', '24242424@qq.com', '24242222422', 1, 1, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` (`id`, `org_id`, `position_id`, `username`, `password`, `salt`, `name`, `avatar`, `email`, `telephone`, `status`, `deleted`, `create_time`, `account_expired_time`, `password_expired_time`, `login_count`, `last_login_time`, `last_login_ip`, `browser`, `os`) VALUES (4, 4, 28, 'audit', '7d94c691e3788c510cce539ae9680435', NULL, '审计管理员', '/avatar/avatar.jpg', '3@qq.com', '13131111311', 1, 0, NULL, NULL, NULL, '1', '2022-04-16 17:20:53', '127.0.0.1', 'Chrome/100.0.4896.127', 'Windows 10 or Windows Server 2016/10.0');
INSERT INTO `t_user` (`id`, `org_id`, `position_id`, `username`, `password`, `salt`, `name`, `avatar`, `email`, `telephone`, `status`, `deleted`, `create_time`, `account_expired_time`, `password_expired_time`, `login_count`, `last_login_time`, `last_login_ip`, `browser`, `os`) VALUES (5, 1, 20, 'admin123', '7d94c691e3788c510cce539ae9680435', NULL, '123', '/avatar/avatar.jpg', '8@qq.com', '123', 1, 1, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` (`id`, `org_id`, `position_id`, `username`, `password`, `salt`, `name`, `avatar`, `email`, `telephone`, `status`, `deleted`, `create_time`, `account_expired_time`, `password_expired_time`, `login_count`, `last_login_time`, `last_login_ip`, `browser`, `os`) VALUES (6, 6, 27, 'admin11', '7d94c691e3788c510cce539ae9680435', NULL, 'fgc', '/avatar/avatar.jpg', '4@qq.com', '13131111311', 1, 1, NULL, NULL, NULL, '2', '2022-04-16 17:32:10', '127.0.0.1', 'Chrome/100.0.4896.127', 'Windows 10 or Windows Server 2016/10.0');
INSERT INTO `t_user` (`id`, `org_id`, `position_id`, `username`, `password`, `salt`, `name`, `avatar`, `email`, `telephone`, `status`, `deleted`, `create_time`, `account_expired_time`, `password_expired_time`, `login_count`, `last_login_time`, `last_login_ip`, `browser`, `os`) VALUES (10, 1, 3, '211887977@qq.com', 'c28415d54995ff0c99a32786a4f4e1e5', NULL, '96094c1', '/avatar/avatar.jpg', '7@qq.com', '13131111311', 1, 0, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` (`id`, `org_id`, `position_id`, `username`, `password`, `salt`, `name`, `avatar`, `email`, `telephone`, `status`, `deleted`, `create_time`, `account_expired_time`, `password_expired_time`, `login_count`, `last_login_time`, `last_login_ip`, `browser`, `os`) VALUES (13, 7, 28, 'bonctest', '7d94c691e3788c510cce539ae9680435', NULL, 'test', '/avatar/ddf00dd81b974cbf97330861228f5dc2', '5@qq.com', '232', 1, 0, NULL, NULL, NULL, '50', '2022-08-09 09:19:07', '127.0.0.1', 'Chrome', 'OSX');
INSERT INTO `t_user` (`id`, `org_id`, `position_id`, `username`, `password`, `salt`, `name`, `avatar`, `email`, `telephone`, `status`, `deleted`, `create_time`, `account_expired_time`, `password_expired_time`, `login_count`, `last_login_time`, `last_login_ip`, `browser`, `os`) VALUES (14, 7, 27, 'test', '7d94c691e3788c510cce539ae9680435', NULL, 'test', '/avatar/avatar.jpg', '6@qq.com', '17600902030', 1, 1, NULL, NULL, NULL, '1', '2022-05-18 22:14:08', '10.10.108.79', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `t_user` (`id`, `org_id`, `position_id`, `username`, `password`, `salt`, `name`, `avatar`, `email`, `telephone`, `status`, `deleted`, `create_time`, `account_expired_time`, `password_expired_time`, `login_count`, `last_login_time`, `last_login_ip`, `browser`, `os`) VALUES (15, 1, NULL, NULL, '7d94c691e3788c510cce539ae9680435', NULL, '9cb64f40a5a804b99701d863', '/avatar/avatar.jpg', '211887977@qq.com', NULL, 1, 1, NULL, NULL, NULL, '1', '2022-05-21 17:16:32', '127.0.0.1', 'Chrome', 'OSX');
INSERT INTO `t_user` (`id`, `org_id`, `position_id`, `username`, `password`, `salt`, `name`, `avatar`, `email`, `telephone`, `status`, `deleted`, `create_time`, `account_expired_time`, `password_expired_time`, `login_count`, `last_login_time`, `last_login_ip`, `browser`, `os`) VALUES (16, 7, 4, 'test', 'c28415d54995ff0c99a32786a4f4e1e5', NULL, 'sdf', '/avatar/avatar.jpg', '211887977@qq.com', '131', 1, 1, NULL, NULL, NULL, '2', '2022-05-31 12:08:22', '127.0.0.1', 'Chrome', 'OSX');
COMMIT;

-- ----------------------------
-- Table structure for t_user_role_rel
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role_rel`;
CREATE TABLE `t_user_role_rel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL COMMENT '用户id',
  `role_id` int DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户角色关系表';

-- ----------------------------
-- Records of t_user_role_rel
-- ----------------------------
BEGIN;
INSERT INTO `t_user_role_rel` (`id`, `user_id`, `role_id`) VALUES (1, 1, 1);
INSERT INTO `t_user_role_rel` (`id`, `user_id`, `role_id`) VALUES (2, 2, 5);
INSERT INTO `t_user_role_rel` (`id`, `user_id`, `role_id`) VALUES (3, 4, 3);
INSERT INTO `t_user_role_rel` (`id`, `user_id`, `role_id`) VALUES (7, 13, 6);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
