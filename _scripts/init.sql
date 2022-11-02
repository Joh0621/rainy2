/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : dm-platform

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 02/11/2022 19:09:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_config
-- ----------------------------
DROP TABLE IF EXISTS `t_config`;
CREATE TABLE `t_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
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
  `del_flag` tinyint DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='配置表';

-- ----------------------------
-- Records of t_config
-- ----------------------------
BEGIN;
INSERT INTO `t_config` (`id`, `category_code`, `name`, `code`, `data_type`, `value`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1, 'system', 'test', 'sysTitle', 'string', '数据门户', '打印一句话', NULL, NULL, 'admin', '2022-10-31 17:01:34', 0);
INSERT INTO `t_config` (`id`, `category_code`, `name`, `code`, `data_type`, `value`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (2, 'system', '系统logo', 'sysLogo', 'string', '/vite.svg', '系统logo', 'admin', '2022-04-16 18:52:48', NULL, '2022-09-21 12:02:01', 0);
INSERT INTO `t_config` (`id`, `category_code`, `name`, `code`, `data_type`, `value`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (3, 'system', '系统描述', 'sysDescription', 'string', '一个后台管理系统', '一个后台管理系统', 'admin', '2022-05-29 06:27:57', NULL, '2022-09-17 02:42:23', 0);
INSERT INTO `t_config` (`id`, `category_code`, `name`, `code`, `data_type`, `value`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (4, 'system', '是否开启验证码', 'captchaEnable', 'boolean', 'true', '是否开启验证码', 'admin', '2022-05-03 10:08:49', NULL, '2022-09-17 02:42:19', 0);
INSERT INTO `t_config` (`id`, `category_code`, `name`, `code`, `data_type`, `value`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (5, 'system', '文件存储路径', 'sys_file_storage_path', 'string', '/opt/data/file/', NULL, 'admin', '2022-10-10 15:36:15', 'admin', '2022-10-10 15:39:01', 0);
INSERT INTO `t_config` (`id`, `category_code`, `name`, `code`, `data_type`, `value`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (6, 'system', '重置密码', 'sys_reset_password', 'string', '123456', NULL, 'admin', '2022-10-25 10:19:29', 'admin', '2022-10-25 10:19:29', 0);
INSERT INTO `t_config` (`id`, `category_code`, `name`, `code`, `data_type`, `value`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (7, 'system', '日志保留天数', 'sys_log_retention_days', 'int', '180', '登录/操作日志保留天数', 'admin', '2022-10-31 23:20:05', 'admin', '2022-10-31 23:20:05', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict` (
  `id` bigint NOT NULL AUTO_INCREMENT,
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
  `del_flag` tinyint DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code_idx` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='字典表';

-- ----------------------------
-- Records of t_dict
-- ----------------------------
BEGIN;
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1, '1001', '字典分类', 'sys_dict_category', 'string', 99, '字典分类', NULL, NULL, NULL, '2022-04-12 23:19:57', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (2, '1001', '数据类型', 'sys_data_type', 'string', 99, '数据类型', NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (3, '1001', '通用是否', 'sys_yes_or_no', 'boolean', 99, '通用是否', NULL, NULL, NULL, '2022-09-21 09:23:57', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (4, '1001', '用户状态', 'sys_user_status', 'int', 99, '用户状态', NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (5, '1001', '系统配置分类', 'sys_config_category', 'string', 99, '系统配置分类', NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (8, '1001', '操作日志类型', 'sys_operation_log_type', 'string', 99, '操作日志类型', NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (12, '1001', 'http响应头', 'sys_response_header', 'string', 99, NULL, 'admin', '2022-04-13 09:53:08', 'admin', '2022-04-13 09:53:08', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (15, '1001', '登录类型', 'sys_login_type', 'int', 99, '登录类型：登录，退出', 'admin', '2022-04-16 16:52:00', 'admin', '2022-04-16 16:52:21', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (18, '1001', '允许的http请求方法', 'sys_http_allow_method', 'string', 99, '允许的http请求方法,其他方法返回405状态码或请求方法不允许类似的提示', 'admin', '2022-06-22 09:42:08', 'admin', '2022-06-22 09:42:08', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (19, '1001', '通用禁用启用', 'sys_enable_disable', 'string', 99, '通用禁用启用', 'admin', '2022-07-18 17:45:05', NULL, '2022-09-21 09:27:47', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (20, '1001', '系统模块', 'sys_module', 'string', 99, '操作日志系统模块查询条件使用', 'admin', '2022-07-19 11:21:37', 'admin', '2022-07-19 11:21:37', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (24, '1002', '数据目录类型', 'biz_data_directory_type', 'int', NULL, '数据目录类型', NULL, '2022-09-20 14:41:57', 'admin', '2022-10-11 16:49:28', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (25, '1002', '数据专业', 'biz_major', 'int', NULL, '数据所属专业', NULL, '2022-09-20 16:33:33', NULL, '2022-09-20 16:55:10', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (26, '1001', '审批状态', 'wf_approve_status', 'int', NULL, '审批状态: 0 审批中，1 审批通过，2 审批未通过', NULL, '2022-09-26 18:13:52', NULL, '2022-09-26 18:13:52', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (27, '1001', '菜单类型', 'sys_menu_type', 'int', NULL, '菜单分类', NULL, '2022-09-29 09:46:43', NULL, '2022-09-29 16:34:34', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (28, '1001', '菜单打开方式', 'sys_menu_target', 'string', NULL, NULL, NULL, '2022-09-29 17:23:02', NULL, '2022-09-29 17:48:16', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (30, '1002', '数据更新频率', 'biz_data_update_frequency', 'int', NULL, NULL, 'admin', '2022-10-10 14:47:49', 'admin', '2022-10-10 14:54:46', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (31, '1001', '任务分类', 'sys_task_category', 'string', NULL, '111', 'admin', '2022-10-31 15:43:53', 'admin', '2022-10-31 15:43:53', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (32, '1001', '任务状态', 'sys_task_status', 'int', NULL, '定时任务状态', 'admin', '2022-10-31 16:57:35', 'admin', '2022-10-31 16:57:35', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `t_dict_item`;
CREATE TABLE `t_dict_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dict_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典编码',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '唯一编码',
  `value` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典项值',
  `sort` int DEFAULT NULL COMMENT '排序',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=510 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='字典项表';

-- ----------------------------
-- Records of t_dict_item
-- ----------------------------
BEGIN;
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1, 'sys_yes_or_no', 'true', '是', 98, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (2, 'sys_yes_or_no', 'false', '否', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (3, 'sys_user_status', '0', '正常', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (4, 'sys_user_status', '1', '禁用', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (52, 'sys_dict_category', '1003', '工作流', 99, NULL, 'admin', '2022-10-19 09:31:41', 'admin', '2022-10-19 09:31:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (53, 'sys_dict_category', '1001', '系统分类', 99, 'asdf ', NULL, NULL, 'admin', '2022-05-29 19:28:38', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (54, 'sys_dict_category', '1002', '业务分类', 99, NULL, NULL, NULL, 'admin', '2022-05-29 19:28:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (57, 'sys_response_header', 'X-Frame-Options', 'SAMEORIGIN', 99, '是否可以在iframe显示视图： DENY=不可以 | SAMEORIGIN=同域下可以 | ALLOW-FROM uri=指定域名下可以', NULL, NULL, 'admin', '2022-10-10 11:20:22', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (58, 'sys_response_header', 'X-XSS-Protection', '1; mode=block', 99, '是否启用浏览器默认XSS防护： 0=禁用 | 1=启用 | 1; mode=block 启用, 并在检查到XSS攻击时，停止渲染页面', NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (59, 'sys_response_header', 'X-Content-Type-Options', 'nosniff', 99, '禁用浏览器内容嗅探', NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (60, 'sys_response_header', 'Server', 'Server', 99, '服务器名称', NULL, NULL, 'admin', '2022-06-06 22:11:56', 1);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (76, 'sys_data_type', 'int', '数字', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (77, 'sys_data_type', 'string', '字符串', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (78, 'sys_data_type', 'boolean', '布尔', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (81, 'sys_operation_log_type', 'add', '新增', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (82, 'sys_operation_log_type', 'delete', '删除', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (83, 'sys_operation_log_type', 'update', '修改', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (84, 'sys_operation_log_type', 'query', '查询', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (86, 'sys_login_type', '0', '登录', 99, '登录', 'admin', '2022-04-16 16:52:40', 'admin', '2022-04-16 16:52:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (87, 'sys_login_type', '1', '退出', 99, '退出', 'admin', '2022-04-16 16:52:54', 'admin', '2022-04-16 16:52:54', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (93, 'sys_config_category', 'system', '系统配置', 99, NULL, 'admin', '2022-05-03 10:26:10', 'admin', '2022-05-03 10:28:32', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (94, 'sys_response_header', 'Access-Control-Allow-Origin', '*', 99, NULL, NULL, NULL, 'admin', '2022-07-25 18:35:52', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (95, 'sys_response_header', 'Access-Control-Allow-Methods', 'GET,POST', 99, NULL, NULL, NULL, 'admin', '2022-10-10 11:21:27', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (96, 'sys_response_header', 'Access-Control-Allow-Headers', '*', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (97, 'sys_response_header', 'Access-Control-Max-Age', '3600', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (98, 'sys_login_type', '2', '被踢下线', 99, '被踢下线', 'admin', '2022-05-19 23:52:41', 'admin', '2022-05-19 23:52:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (99, 'sys_login_type', '3', '被顶下线', 99, '被顶下线', 'admin', '2022-05-19 23:52:51', 'admin', '2022-05-19 23:52:51', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (100, 'sys_login_type', '4', '被锁定', 99, '被锁定', 'admin', '2022-05-19 23:53:00', 'admin', '2022-05-19 23:53:00', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (101, 'sys_login_type', '5', '解除锁定', 99, '解除锁定', 'admin', '2022-05-19 23:53:08', 'admin', '2022-05-19 23:53:08', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (105, 'sys_operation_log_type', 'export', '导出', 99, NULL, 'admin', '2022-06-03 23:44:05', 'admin', '2022-06-03 23:44:05', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (107, 'sys_http_allow_method', 'get', 'get', 99, NULL, 'admin', '2022-06-22 09:42:46', 'admin', '2022-06-22 09:42:46', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (108, 'sys_http_allow_method', 'post', 'post', 99, NULL, 'admin', '2022-06-22 09:42:58', 'admin', '2022-06-22 09:42:58', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (111, 'sys_enable_disable', '0', '启用', 99, NULL, 'admin', '2022-07-18 17:45:32', 'admin', '2022-07-18 17:45:32', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (112, 'sys_enable_disable', '1', '禁用', 99, NULL, 'admin', '2022-07-18 17:45:38', 'admin', '2022-07-18 17:45:38', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (113, 'sys_module', '菜单管理', '菜单管理', 99, NULL, 'admin', '2022-07-19 11:22:19', 'admin', '2022-07-19 11:22:19', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (114, 'sys_module', '应用管理', '应用管理', 99, NULL, 'admin', '2022-07-19 11:22:35', 'admin', '2022-07-19 11:22:35', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (115, 'sys_module', '配置管理', '配置管理', 99, NULL, 'admin', '2022-07-19 11:22:46', 'admin', '2022-07-19 11:22:46', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (116, 'sys_module', '字典管理', '字典管理', 99, NULL, 'admin', '2022-07-19 11:22:54', 'admin', '2022-07-19 11:22:54', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (117, 'sys_module', '日志管理', '日志管理', 99, NULL, 'admin', '2022-07-19 11:23:10', 'admin', '2022-07-19 11:26:25', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (118, 'sys_module', '通知公告', '通知公告', 99, NULL, 'admin', '2022-07-19 11:23:31', 'admin', '2022-07-19 11:23:31', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (120, 'sys_module', '组织管理', '组织管理', 99, NULL, 'admin', '2022-07-19 11:23:46', 'admin', '2022-07-19 11:23:46', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (121, 'sys_module', '职位管理', '职位管理', 99, NULL, 'admin', '2022-07-19 11:23:54', 'admin', '2022-07-19 11:23:54', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (122, 'sys_module', '角色管理', '角色管理', 99, NULL, 'admin', '2022-07-19 11:24:07', 'admin', '2022-07-19 11:24:07', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (123, 'sys_module', '系统监控', '系统监控', 99, NULL, 'admin', '2022-07-19 11:24:23', 'admin', '2022-07-19 11:24:23', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (124, 'sys_module', '定时任务', '定时任务', 99, NULL, 'admin', '2022-07-19 11:24:31', 'admin', '2022-07-19 11:24:31', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (125, 'sys_module', '用户管理', '用户管理', 99, NULL, 'admin', '2022-07-19 11:26:02', 'admin', '2022-07-19 11:26:02', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (143, 'biz_data_directory_type', '0', '时序数据', 99, NULL, NULL, NULL, 'admin', '2022-09-21 09:23:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (144, 'biz_data_directory_type', '1', '关系表', 99, NULL, NULL, NULL, 'admin', '2022-09-21 09:23:26', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (145, 'biz_major', '0', '所有', 99, NULL, NULL, NULL, 'admin', '2022-10-20 09:52:20', 1);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (146, 'biz_major', '1', '光伏', 99, NULL, NULL, NULL, 'admin', '2022-09-20 18:40:54', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (147, 'biz_major', '2', '储能', 99, NULL, NULL, NULL, 'admin', '2022-09-20 18:40:46', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (148, 'biz_major', '3', '火电', 99, NULL, NULL, NULL, 'admin', '2022-09-20 18:36:37', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (149, 'biz_major', '4', '风电', 99, NULL, NULL, NULL, 'admin', '2022-09-20 18:39:31', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (151, 'wf_approve_status', '0', '审批中', 99, NULL, NULL, '2022-09-26 18:15:52', 'admin', '2022-09-26 18:15:52', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (152, 'wf_approve_status', '1', '通过', 99, NULL, NULL, '2022-09-26 18:16:06', 'admin', '2022-09-26 18:16:06', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (153, 'wf_approve_status', '2', '未通过', 99, NULL, NULL, '2022-09-26 18:16:18', 'admin', '2022-09-26 18:16:18', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (154, 'sys_config_category', 'test', 'test', 99, NULL, NULL, '2022-09-28 14:38:32', 'admin', '2022-09-28 14:38:32', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (155, 'sys_menu_type', '0', '目录', 99, '目录', NULL, '2022-09-29 09:47:16', 'admin', '2022-09-29 09:47:16', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (156, 'sys_menu_type', '1', '菜单', 99, '菜单', NULL, '2022-09-29 09:47:27', 'admin', '2022-09-29 09:47:27', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (157, 'sys_menu_type', '2', '按钮', 99, '按钮', NULL, '2022-09-29 09:47:36', 'admin', '2022-09-29 09:47:36', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (158, 'sys_menu_target', '_component', '组件', 99, NULL, NULL, '2022-09-29 17:24:04', 'admin', '2022-09-29 17:24:04', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (159, 'sys_menu_target', '_self', '内链', 99, NULL, NULL, '2022-09-29 17:24:28', 'admin', '2022-09-29 17:24:28', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (160, 'sys_menu_target', '_blank', '外链', 99, '外链', NULL, '2022-10-02 18:03:24', 'admin', '2022-10-02 18:03:24', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (161, 'sys_menu_target', '_none', '无', 99, NULL, NULL, '2022-09-29 17:24:44', 'admin', '2022-09-29 17:24:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (162, 'biz_data_update_frequency', '0', '5秒', 99, NULL, 'admin', '2022-10-25 15:42:39', 'admin', '2022-10-25 15:55:31', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (163, 'biz_data_update_frequency', '1', '20秒', 99, NULL, 'admin', '2022-10-25 15:42:54', 'admin', '2022-10-25 15:55:20', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (164, 'sys_task_category', 'test', 'test', 99, 'test', 'admin', '2022-10-31 15:44:30', 'admin', '2022-10-31 15:44:30', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (165, 'sys_task_status', '0', '运行中', 99, NULL, 'admin', '2022-10-31 16:57:54', 'admin', '2022-10-31 16:57:54', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (166, 'sys_task_status', '1', '暂停中', 99, NULL, 'admin', '2022-10-31 16:58:02', 'admin', '2022-10-31 16:58:02', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (167, 'sys_task_category', 'system', '系统任务', 99, NULL, 'admin', '2022-10-31 23:17:38', 'admin', '2022-10-31 23:17:38', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (168, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:38', 'admin', '2022-11-02 18:21:38', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (169, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:38', 'admin', '2022-11-02 18:21:38', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (170, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:38', 'admin', '2022-11-02 18:21:38', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (171, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:38', 'admin', '2022-11-02 18:21:38', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (172, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:38', 'admin', '2022-11-02 18:21:38', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (173, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:38', 'admin', '2022-11-02 18:21:38', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (174, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:38', 'admin', '2022-11-02 18:21:38', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (175, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:38', 'admin', '2022-11-02 18:21:38', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (176, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:38', 'admin', '2022-11-02 18:21:38', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (177, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:38', 'admin', '2022-11-02 18:21:38', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (178, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:38', 'admin', '2022-11-02 18:21:38', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (179, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:38', 'admin', '2022-11-02 18:21:38', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (180, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:38', 'admin', '2022-11-02 18:21:38', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (181, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:39', 'admin', '2022-11-02 18:21:39', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (182, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:39', 'admin', '2022-11-02 18:21:39', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (183, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:39', 'admin', '2022-11-02 18:21:39', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (184, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:39', 'admin', '2022-11-02 18:21:39', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (185, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:39', 'admin', '2022-11-02 18:21:39', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (186, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:39', 'admin', '2022-11-02 18:21:39', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (187, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:39', 'admin', '2022-11-02 18:21:39', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (188, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:39', 'admin', '2022-11-02 18:21:39', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (189, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:39', 'admin', '2022-11-02 18:21:39', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (190, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:39', 'admin', '2022-11-02 18:21:39', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (191, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:39', 'admin', '2022-11-02 18:21:39', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (192, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:39', 'admin', '2022-11-02 18:21:39', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (193, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:39', 'admin', '2022-11-02 18:21:39', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (194, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:39', 'admin', '2022-11-02 18:21:39', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (195, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:39', 'admin', '2022-11-02 18:21:39', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (196, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:39', 'admin', '2022-11-02 18:21:39', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (197, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:39', 'admin', '2022-11-02 18:21:39', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (198, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:39', 'admin', '2022-11-02 18:21:39', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (199, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:39', 'admin', '2022-11-02 18:21:39', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (200, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:39', 'admin', '2022-11-02 18:21:39', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (201, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:39', 'admin', '2022-11-02 18:21:39', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (202, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:39', 'admin', '2022-11-02 18:21:39', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (203, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (204, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (205, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (206, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (207, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (208, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (209, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (210, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (211, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (212, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (213, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (214, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (215, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (216, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (217, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (218, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (219, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (220, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (221, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (222, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (223, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (224, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (225, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (226, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (227, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (228, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (229, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (230, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (231, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (232, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (233, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (234, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (235, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (236, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (237, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:40', 'admin', '2022-11-02 18:21:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (238, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (239, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (240, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (241, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (242, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (243, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (244, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (245, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (246, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (247, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (248, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (249, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (250, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (251, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (252, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (253, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (254, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (255, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (256, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (257, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (258, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (259, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (260, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (261, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (262, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (263, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (264, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (265, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (266, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (267, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (268, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (269, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (270, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (271, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (272, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (273, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (274, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (275, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (276, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (277, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (278, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (279, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (280, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (281, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (282, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (283, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (284, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (285, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (286, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (287, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (288, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (289, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (290, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (291, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (292, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (293, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (294, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (295, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (296, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (297, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (298, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (299, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (300, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (301, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (302, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (303, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (304, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:41', 'admin', '2022-11-02 18:21:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (305, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (306, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (307, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (308, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (309, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (310, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (311, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (312, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (313, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (314, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (315, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (316, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (317, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (318, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (319, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (320, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (321, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (322, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (323, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (324, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (325, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (326, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (327, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (328, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (329, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (330, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (331, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (332, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (333, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (334, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (335, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (336, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (337, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (338, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (339, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (340, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (341, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (342, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (343, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (344, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (345, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (346, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (347, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (348, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (349, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (350, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:42', 'admin', '2022-11-02 18:21:42', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (351, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (352, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (353, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (354, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (355, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (356, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (357, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (358, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (359, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (360, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (361, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (362, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (363, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (364, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (365, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (366, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (367, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (368, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (369, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (370, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (371, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (372, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (373, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (374, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (375, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (376, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (377, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (378, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (379, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (380, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (381, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (382, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (383, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (384, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (385, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (386, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (387, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (388, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (389, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (390, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (391, 'biz_data_update_frequency', '1', '5s', 99, '5s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (392, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (393, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (394, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (395, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (396, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (397, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (398, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:43', 'admin', '2022-11-02 18:21:43', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (399, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (400, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (401, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (402, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (403, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (404, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (405, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (406, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (407, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (408, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (409, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (410, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (411, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (412, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (413, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (414, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (415, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (416, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (417, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (418, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (419, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (420, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (421, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (422, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (423, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (424, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (425, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (426, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (427, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (428, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (429, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (430, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (431, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (432, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (433, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (434, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (435, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (436, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (437, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (438, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (439, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (440, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (441, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (442, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (443, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (444, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (445, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (446, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (447, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (448, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (449, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (450, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (451, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (452, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (453, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (454, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (455, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (456, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (457, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (458, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (459, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (460, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (461, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (462, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (463, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (464, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (465, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (466, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (467, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:44', 'admin', '2022-11-02 18:21:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (468, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (469, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (470, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (471, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (472, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (473, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (474, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (475, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (476, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (477, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (478, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (479, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (480, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (481, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (482, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (483, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (484, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (485, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (486, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (487, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (488, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (489, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (490, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (491, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (492, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (493, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (494, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (495, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (496, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (497, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (498, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (499, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (500, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (501, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (502, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (503, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (504, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (505, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (506, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (507, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (508, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (509, 'biz_data_update_frequency', '1', '20s', 99, '20s', 'admin', '2022-11-02 18:21:45', 'admin', '2022-11-02 18:21:45', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_login_log
-- ----------------------------
DROP TABLE IF EXISTS `t_login_log`;
CREATE TABLE `t_login_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `type` tinyint DEFAULT NULL COMMENT '登录类型，0登录，1退出',
  `datetime` datetime DEFAULT NULL COMMENT '登录时间',
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '登录ip',
  `browser` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '浏览器',
  `os` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作系统',
  `success` tinyint DEFAULT NULL COMMENT '是否成功',
  `error_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '错误信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_login_log
-- ----------------------------
BEGIN;
INSERT INTO `t_login_log` (`id`, `username`, `type`, `datetime`, `ip`, `browser`, `os`, `success`, `error_message`) VALUES (1, 'admin', 0, '2022-11-02 15:02:22', '127.0.0.1', 'Chrome', 'OSX', 0, '账号与密码不匹配!');
INSERT INTO `t_login_log` (`id`, `username`, `type`, `datetime`, `ip`, `browser`, `os`, `success`, `error_message`) VALUES (2, 'admin', 0, '2022-11-02 15:02:26', '127.0.0.1', 'Chrome', 'OSX', 1, NULL);
INSERT INTO `t_login_log` (`id`, `username`, `type`, `datetime`, `ip`, `browser`, `os`, `success`, `error_message`) VALUES (3, 'admin', 0, '2022-11-02 15:20:16', '127.0.0.1', 'Chrome', 'OSX', 1, NULL);
INSERT INTO `t_login_log` (`id`, `username`, `type`, `datetime`, `ip`, `browser`, `os`, `success`, `error_message`) VALUES (4, 'admin', 0, '2022-11-02 15:20:14', '127.0.0.1', 'Chrome', 'OSX', 1, NULL);
INSERT INTO `t_login_log` (`id`, `username`, `type`, `datetime`, `ip`, `browser`, `os`, `success`, `error_message`) VALUES (5, 'admin', 0, '2022-11-02 15:24:01', '127.0.0.1', 'Chrome', 'OSX', 1, NULL);
INSERT INTO `t_login_log` (`id`, `username`, `type`, `datetime`, `ip`, `browser`, `os`, `success`, `error_message`) VALUES (6, 'admin', 0, '2022-11-02 15:24:41', '127.0.0.1', 'Chrome', 'OSX', 1, NULL);
INSERT INTO `t_login_log` (`id`, `username`, `type`, `datetime`, `ip`, `browser`, `os`, `success`, `error_message`) VALUES (7, 'admin', 0, '2022-11-02 15:26:43', '127.0.0.1', 'Chrome', 'OSX', 1, NULL);
INSERT INTO `t_login_log` (`id`, `username`, `type`, `datetime`, `ip`, `browser`, `os`, `success`, `error_message`) VALUES (8, 'admin', 0, '2022-11-02 18:17:39', '127.0.0.1', 'Chrome', 'OSX', 1, NULL);
INSERT INTO `t_login_log` (`id`, `username`, `type`, `datetime`, `ip`, `browser`, `os`, `success`, `error_message`) VALUES (9, 'admin', 0, '2022-11-02 18:17:37', '127.0.0.1', 'Chrome', 'OSX', 1, NULL);
INSERT INTO `t_login_log` (`id`, `username`, `type`, `datetime`, `ip`, `browser`, `os`, `success`, `error_message`) VALUES (10, 'admin', 0, '2022-11-02 18:18:53', '127.0.0.1', 'Chrome', 'OSX', 1, NULL);
INSERT INTO `t_login_log` (`id`, `username`, `type`, `datetime`, `ip`, `browser`, `os`, `success`, `error_message`) VALUES (11, 'admin', 0, '2022-11-02 18:21:30', '127.0.0.1', 'Chrome', 'OSX', 1, NULL);
INSERT INTO `t_login_log` (`id`, `username`, `type`, `datetime`, `ip`, `browser`, `os`, `success`, `error_message`) VALUES (12, 'admin', 0, '2022-11-02 18:58:44', '127.0.0.1', 'Chrome', 'OSX', 1, NULL);
INSERT INTO `t_login_log` (`id`, `username`, `type`, `datetime`, `ip`, `browser`, `os`, `success`, `error_message`) VALUES (13, 'admin', 0, '2022-11-02 19:01:35', '127.0.0.1', 'Chrome', 'OSX', 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL COMMENT '父id',
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单类型',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单名称',
  `path` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由地址',
  `component` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '前端vue组件',
  `permission` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限码',
  `icon` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图标',
  `url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '内外链访问地址',
  `target` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '打开方式',
  `show` tinyint DEFAULT NULL COMMENT '是否展示',
  `sort` int DEFAULT NULL COMMENT '排序',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_permission` (`permission`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='菜单表';

-- ----------------------------
-- Records of t_menu
-- ----------------------------
BEGIN;
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1, 0, '0', '系统管理', NULL, 'RouteView', NULL, 'icon-setting', NULL, '_component', 1, 10, NULL, 'admin', '2022-05-05 16:17:34', 'admin', '2022-10-20 09:41:34', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (2, 1, '1', '组织管理', '/org', 'system/org/Org', NULL, 'icon-Report', NULL, '_component', 1, 2, NULL, 'admin', '2022-05-05 16:19:53', 'admin', '2022-05-06 19:17:24', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (3, 1, '1', '职位管理', '/position', 'system/org/Position', NULL, 'icon-Report', NULL, '_component', 1, 2, NULL, 'admin', '2022-05-05 16:20:32', NULL, '2022-10-02 21:33:34', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (4, 1, '1', '用户管理', '/user', 'system/permission/User', NULL, 'icon-Report', NULL, '_component', 1, 2, NULL, 'admin', '2022-05-05 16:20:54', 'admin', '2022-05-09 10:08:17', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (5, 1, '1', '角色管理', '/role', 'system/permission/Role', NULL, 'icon-Report', NULL, '_component', 1, 4, NULL, 'admin', '2022-05-05 16:21:12', 'admin', '2022-05-09 10:09:12', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (6, 1, '1', '菜单管理', '/menu', 'system/permission/Menu', NULL, 'icon-Report', NULL, '_component', 1, 6, NULL, 'admin', '2022-05-05 16:21:34', 'admin', '2022-05-09 10:08:06', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (7, 1, '1', '字典管理', '/dict', 'system/dict/Dict', NULL, 'icon-Report', NULL, '_component', 1, 99, '字典管理', NULL, '2022-10-02 18:52:10', NULL, '2022-10-02 18:52:24', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (8, 1, '1', '系统配置', '/config', 'system/config/Config', NULL, 'icon-Report', NULL, '_component', 1, 99, '配置管理', NULL, '2022-10-02 18:52:52', 'admin', '2022-10-05 01:08:34', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (9, 0, '0', '系统监控', '', 'PageView', NULL, 'icon-Report', '', '_component', 1, 11, '系统监控', NULL, '2022-10-02 18:53:18', 'admin', '2022-10-20 09:41:08', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (10, 9, '1', '服务监控', '/monitor', 'Iframe', NULL, 'icon-Report', '/api/druid', '_self', 1, 99, 'druid 服务监控', NULL, '2022-10-02 18:54:30', NULL, '2022-10-02 18:54:30', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (11, 9, '1', '在线用户', '/user/online', 'system/permission/UserOnline', NULL, 'icon-Report', NULL, '_component', 1, 99, NULL, NULL, '2022-10-02 18:55:12', NULL, '2022-10-02 19:14:24', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (12, 0, '0', '日志管理', NULL, 'PageView', NULL, 'icon-appstore', '', '_component', 1, 12, '日志管理', NULL, '2022-10-02 19:38:39', 'admin', '2022-10-20 09:41:45', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (13, 12, '1', '登录日志', '/log/login', 'system/log/LoginLog', NULL, 'icon-Report', NULL, '_component', 1, 99, '登录日志', NULL, '2022-10-02 19:39:15', NULL, '2022-10-02 19:39:15', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (14, 12, '1', '操作日志', '/log/operation', 'system/log/OperationLog', NULL, 'icon-Report', NULL, '_component', 1, 99, '操作日志', NULL, '2022-10-02 19:39:50', NULL, '2022-10-02 19:39:50', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (15, 0, '1', '首页', '/workbench', 'main/Index', NULL, 'icon-home', NULL, '_component', 1, 0, '首页', NULL, '2022-10-02 19:42:24', 'admin', '2022-10-24 14:19:39', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (16, 2, '2', '查询组织列表', NULL, NULL, 'org:query', NULL, NULL, '_none', 1, 99, '查询组织列表', NULL, '2022-10-02 21:03:11', NULL, '2022-10-02 21:10:17', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (17, 2, '2', '新增组织', NULL, NULL, 'org:add', NULL, NULL, '_none', 1, 99, '新增组织', NULL, '2022-10-02 21:20:13', NULL, '2022-10-02 21:20:23', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (18, 2, '2', '删除组织', NULL, NULL, 'org:del', NULL, NULL, '_none', 1, 99, '删除组织', NULL, '2022-10-02 21:20:45', NULL, '2022-10-02 21:26:10', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (19, 2, '2', '编辑组织', NULL, NULL, 'org:update', NULL, NULL, '_none', 1, 99, '编辑组织', NULL, '2022-10-02 21:21:41', NULL, '2022-10-02 21:22:11', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (20, 2, '2', '导出组织列表', NULL, NULL, 'org:export', NULL, NULL, '_none', 1, 99, '导出组织列表', NULL, '2022-10-02 21:22:42', NULL, '2022-10-02 21:22:42', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (21, 3, '2', '新增职位', NULL, NULL, 'position:query', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (22, 3, '2', '删除职位', NULL, NULL, 'position:add', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (23, 3, '2', '编辑职位', NULL, NULL, 'position:del', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (24, 3, '2', '查询职位列表', NULL, NULL, 'position:update', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (25, 3, '2', '导出职位列表', NULL, NULL, 'position:export', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', NULL, '2022-10-02 21:36:21', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (26, 4, '2', '新增用户', NULL, NULL, 'user:query', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (27, 4, '2', '删除用户', NULL, NULL, 'user:add', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (28, 4, '2', '编辑用户', NULL, NULL, 'user:del', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (29, 4, '2', '查询用户列表', NULL, NULL, 'user:update', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (30, 4, '2', '导出用户列表', NULL, NULL, 'user:export', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', NULL, '2022-10-02 21:36:46', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (31, 5, '2', '新增角色', NULL, NULL, 'role:query', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (32, 5, '2', '删除角色', NULL, NULL, 'role:add', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (33, 5, '2', '编辑角色', NULL, NULL, 'role:del', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (34, 5, '2', '查询角色列表', NULL, NULL, 'role:update', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (35, 5, '2', '导出角色列表', NULL, NULL, 'role:export', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', NULL, '2022-10-02 21:36:58', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (36, 4, '2', '分配角色', NULL, NULL, 'user:assignRole', NULL, NULL, '_none', 1, 99, '分配角色', NULL, '2022-10-02 21:37:42', NULL, '2022-10-02 21:37:42', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (37, 4, '2', '重置密码', NULL, NULL, 'user:resetPassword', NULL, NULL, '_none', 1, 99, '重置密码', NULL, '2022-10-02 21:38:01', 'admin', '2022-10-04 22:14:04', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (38, 5, '2', '分配菜单', NULL, NULL, 'role:assignMenu', NULL, NULL, '_none', 1, 99, '分配菜单', NULL, '2022-10-02 21:39:03', NULL, '2022-10-02 21:39:03', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (39, 6, '2', '新增菜单', NULL, NULL, 'menu:query', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (40, 6, '2', '删除菜单', NULL, NULL, 'menu:add', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (41, 6, '2', '编辑菜单', NULL, NULL, 'menu:del', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (42, 6, '2', '查询菜单列表', NULL, NULL, 'menu:update', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (43, 6, '2', '导出菜单列表', NULL, NULL, 'menu:export', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (44, 7, '2', '新增字典', NULL, NULL, 'dict:query', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (45, 7, '2', '删除字典', NULL, NULL, 'dict:add', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (46, 7, '2', '编辑字典', NULL, NULL, 'dict:del', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (47, 7, '2', '查询字典列表', NULL, NULL, 'dict:update', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (48, 7, '2', '导出字典列表', NULL, NULL, 'dict:export', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (49, 7, '2', '新增字典项', NULL, NULL, 'dictItem:query', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (50, 7, '2', '删除字典项', NULL, NULL, 'dictItem:add', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (51, 7, '2', '编辑字典项', NULL, NULL, 'dictItem:del', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (52, 7, '2', '查询字典项列表', NULL, NULL, 'dictItem:update', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (53, 7, '2', '导出字典项列表', NULL, NULL, 'dictItem:export', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (54, 8, '2', '新增配置', NULL, NULL, 'config:query', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (55, 8, '2', '删除配置', NULL, NULL, 'config:add', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (56, 8, '2', '编辑配置', NULL, NULL, 'config:del', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (57, 8, '2', '查询配置列表', NULL, NULL, 'config:update', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (58, 8, '2', '导出配置列表', NULL, NULL, 'config:export', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (59, 11, '2', '查询用户列表', NULL, NULL, 'onlineUser:query', NULL, NULL, '_none', 1, 99, '查询在线列表', 'admin', '2022-10-02 21:44:51', 'admin', '2022-10-02 21:45:33', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (60, 11, '2', '下线用户', NULL, NULL, 'onlineUser:kickOut', NULL, NULL, '_none', 1, 99, '下线用户', 'admin', '2022-10-02 21:45:18', 'admin', '2022-10-02 21:45:18', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (61, 13, '2', '查询登录日志列表', NULL, NULL, 'loginLog:query', NULL, NULL, '_none', 1, 99, '查询登录日志列表', 'admin', '2022-10-02 23:45:37', 'admin', '2022-10-02 23:55:26', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (62, 13, '2', '删除登录日志', NULL, NULL, 'loginLog:del', NULL, NULL, '_none', 1, 99, '删除登录日志', 'admin', '2022-10-02 23:55:43', 'admin', '2022-10-02 23:56:01', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (63, 13, '2', '导出登录日志列表', NULL, NULL, 'loginLog:export', NULL, NULL, '_none', 1, 99, '导出登录日志列表', 'admin', '2022-10-03 00:11:33', 'admin', '2022-10-03 00:12:16', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (64, 14, '2', '查询操作日志列表', NULL, NULL, 'operationLog:query', NULL, NULL, '_none', 1, 99, '查询操作日志列表', 'admin', '2022-10-03 00:12:10', 'admin', '2022-10-03 00:12:10', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (65, 14, '2', '删除操作日志', NULL, NULL, 'operationLog:del', NULL, NULL, '_none', 1, 99, '删除操作日志', 'admin', '2022-10-03 00:12:37', 'admin', '2022-10-03 00:12:37', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (66, 14, '2', '导出操作日志列表', NULL, NULL, 'operationLog:export', NULL, NULL, '_none', 1, 99, '导出操作日志列表', 'admin', '2022-10-03 00:13:02', 'admin', '2022-10-03 00:13:02', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (67, 0, '0', '工作流', NULL, 'PageView', NULL, 'icon-branches', '', '_component', 0, 5, '工作流', 'admin', '2022-10-05 19:59:20', 'admin', '2022-10-25 18:35:32', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (68, 67, '1', '流程定义', '/process/definition', 'system/workflow/ProcessDefinition', NULL, 'icon-Report', NULL, '_component', 1, 99, NULL, 'admin', '2022-10-05 20:00:20', 'admin', '2022-10-05 20:00:34', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (69, 0, '1', '数据管理', '/data/directory/mgt', 'main/dataDirectory/DataDirectory', NULL, 'icon-Report', NULL, '_component', 1, 1, '数据管理', 'admin', '2022-10-05 20:01:16', 'admin', '2022-10-20 09:40:31', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (70, 0, '1', '数据目录', '/data/directory', 'main/DataDirectory', NULL, 'icon-Report', NULL, '_component', 1, 3, '数据目录', 'admin', '2022-10-05 20:02:07', 'admin', '2022-10-25 18:38:52', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (71, 0, '0', '我的任务', NULL, 'PageView', NULL, 'icon-Report', '', '_component', 1, 5, '我的任务', 'admin', '2022-10-05 20:02:39', 'admin', '2022-10-25 18:38:39', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (72, 0, '1', '我的申请', '/apply', 'main/TaskApply', NULL, 'icon-Report', NULL, '_component', 1, 4, '我的申请', 'admin', '2022-10-05 20:03:06', 'admin', '2022-10-25 18:38:59', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (73, 71, '1', '我的待办', '/workflow/task/todo', 'system/workflow/TaskTodo', NULL, 'icon-Report', NULL, '_component', 1, 99, '我的待办', 'admin', '2022-10-05 20:03:30', 'admin', '2022-10-05 20:03:30', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (74, 71, '1', '我的已办', '/workflow/task/done', 'system/workflow/TaskDone', NULL, 'icon-Report', NULL, '_component', 1, 99, '我的已办', 'admin', '2022-10-05 20:03:51', 'admin', '2022-10-05 20:13:57', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (75, 67, '1', '设计器', '/process/designer', 'system/workflow/ProcessDesigner', NULL, 'icon-Report', NULL, '_component', 1, 99, '设计器', 'admin', '2022-10-05 20:04:22', 'admin', '2022-10-05 20:07:42', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (76, 0, '1', '接口管理', '/interface', 'main/interface/Interface', NULL, 'icon-Report', NULL, '_component', 1, 2, '接口管理', 'admin', '2022-10-25 14:07:42', 'admin', '2022-10-25 18:38:23', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (77, 0, '1', '定时任务', '/task', 'system/task/Task', NULL, 'icon-Report', NULL, '_component', 1, 99, NULL, 'admin', '2022-10-28 17:35:14', 'admin', '2022-10-28 17:38:07', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (78, 77, '2', '查询任务列表', NULL, NULL, 'task:query', NULL, NULL, '_none', 1, 99, '', 'admin', '2022-10-28 17:49:44', 'admin', '2022-10-31 15:41:01', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (79, 77, '2', '编辑任务', NULL, NULL, 'task:update', NULL, NULL, '_none', 1, 99, NULL, 'admin', '2022-10-31 17:07:12', 'admin', '2022-10-31 17:07:12', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (80, 77, '2', '新增任务', NULL, NULL, 'task:add', NULL, NULL, '_none', 1, 99, NULL, 'admin', '2022-10-31 17:07:44', 'admin', '2022-10-31 17:07:44', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (81, 77, '2', '删除任务', NULL, NULL, 'task:del', NULL, NULL, '_none', 1, 99, NULL, 'admin', '2022-10-31 17:08:02', 'admin', '2022-10-31 17:08:02', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (82, 77, '2', '导出任务列表', NULL, NULL, 'task:export', NULL, NULL, '_none', 1, 99, NULL, 'admin', '2022-10-31 17:08:20', 'admin', '2022-10-31 17:08:20', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (83, 77, '2', '执行任务', NULL, NULL, 'task:execute', NULL, NULL, '_none', 1, 99, NULL, 'admin', '2022-11-01 16:44:44', 'admin', '2022-11-01 16:44:44', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (84, 77, '2', '启动任务', NULL, NULL, 'task:start', NULL, NULL, '_none', 1, 99, NULL, 'admin', '2022-11-01 16:59:40', 'admin', '2022-11-01 16:59:40', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (85, 77, '2', '暂停任务', NULL, NULL, 'task:stop', NULL, NULL, '_none', 1, 99, NULL, 'admin', '2022-11-01 16:59:54', 'admin', '2022-11-01 16:59:54', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `t_operation_log`;
CREATE TABLE `t_operation_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
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
  `class_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类名',
  `method_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '方法名',
  `params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '参数',
  `result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '返回结果',
  `process_time` int DEFAULT NULL COMMENT '执行时长',
  `success` tinyint DEFAULT NULL COMMENT '成功失败',
  `error_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '错误信息',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_datetime` (`datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_operation_log
-- ----------------------------
BEGIN;
INSERT INTO `t_operation_log` (`id`, `module`, `type`, `username`, `datetime`, `detail`, `path`, `method`, `remote_ip`, `browser`, `os`, `class_name`, `method_name`, `params`, `result`, `process_time`, `success`, `error_message`) VALUES (1, '接口管理', 'update', 'admin', '2022-11-02 15:05:30', '更新了接口[null].', '/api/interface/update', 'POST', '127.0.0.1', 'Chrome', 'OSX', 'com.rainy.dmplatfrom.controller.InterfaceController', 'update', '[Interface(id=null, name=null, code=null, description=null, status=0, totalCount=2, avgResponseTime=32, totalDataSize=286)]', NULL, 3, 1, NULL);
INSERT INTO `t_operation_log` (`id`, `module`, `type`, `username`, `datetime`, `detail`, `path`, `method`, `remote_ip`, `browser`, `os`, `class_name`, `method_name`, `params`, `result`, `process_time`, `success`, `error_message`) VALUES (2, '接口管理', 'update', 'admin', '2022-11-02 15:05:31', '更新了接口[null].', '/api/interface/update', 'POST', '127.0.0.1', 'Chrome', 'OSX', 'com.rainy.dmplatfrom.controller.InterfaceController', 'update', '[Interface(id=null, name=null, code=null, description=null, status=0, totalCount=1, avgResponseTime=22, totalDataSize=60)]', NULL, 1, 1, NULL);
INSERT INTO `t_operation_log` (`id`, `module`, `type`, `username`, `datetime`, `detail`, `path`, `method`, `remote_ip`, `browser`, `os`, `class_name`, `method_name`, `params`, `result`, `process_time`, `success`, `error_message`) VALUES (3, '接口管理', 'update', 'admin', '2022-11-02 15:05:34', '更新了接口[null].', '/api/interface/update', 'POST', '127.0.0.1', 'Chrome', 'OSX', 'com.rainy.dmplatfrom.controller.InterfaceController', 'update', '[Interface(id=null, name=null, code=null, description=null, status=1, totalCount=2, avgResponseTime=32, totalDataSize=286)]', NULL, 1, 1, NULL);
INSERT INTO `t_operation_log` (`id`, `module`, `type`, `username`, `datetime`, `detail`, `path`, `method`, `remote_ip`, `browser`, `os`, `class_name`, `method_name`, `params`, `result`, `process_time`, `success`, `error_message`) VALUES (4, '接口管理', 'update', 'admin', '2022-11-02 15:05:34', '更新了接口[null].', '/api/interface/update', 'POST', '127.0.0.1', 'Chrome', 'OSX', 'com.rainy.dmplatfrom.controller.InterfaceController', 'update', '[Interface(id=null, name=null, code=null, description=null, status=1, totalCount=1, avgResponseTime=22, totalDataSize=60)]', NULL, 1, 1, NULL);
INSERT INTO `t_operation_log` (`id`, `module`, `type`, `username`, `datetime`, `detail`, `path`, `method`, `remote_ip`, `browser`, `os`, `class_name`, `method_name`, `params`, `result`, `process_time`, `success`, `error_message`) VALUES (5, '数据目录', 'update', 'admin', '2022-11-02 18:18:28', '更新了数据目录[鲁能迎风岭].', '/api/dataDirectory/update', 'POST', '127.0.0.1', 'Chrome', 'OSX', 'com.rainy.dmplatfrom.controller.DataDirectoryController', 'update', '[DataDirectory(orgId=2, orgName=新能源所, parentId=1, name=鲁能迎风岭, code=null, type=0, isDirectory=false, sort=98, description=鲁能迎风岭风电场, children=null)]', NULL, 170, 1, NULL);
INSERT INTO `t_operation_log` (`id`, `module`, `type`, `username`, `datetime`, `detail`, `path`, `method`, `remote_ip`, `browser`, `os`, `class_name`, `method_name`, `params`, `result`, `process_time`, `success`, `error_message`) VALUES (6, '数据目录', 'update', 'admin', '2022-11-02 18:19:00', '更新了数据目录[天桥山].', '/api/dataDirectory/update', 'POST', '127.0.0.1', 'Chrome', 'OSX', 'com.rainy.dmplatfrom.controller.DataDirectoryController', 'update', '[DataDirectory(orgId=2, orgName=新能源所, parentId=1, name=天桥山, code=null, type=0, isDirectory=false, sort=98, description=天桥山风电场, children=null)]', NULL, 5, 1, NULL);
INSERT INTO `t_operation_log` (`id`, `module`, `type`, `username`, `datetime`, `detail`, `path`, `method`, `remote_ip`, `browser`, `os`, `class_name`, `method_name`, `params`, `result`, `process_time`, `success`, `error_message`) VALUES (7, '数据目录', 'update', 'admin', '2022-11-02 18:19:06', '更新了数据目录[大苏计].', '/api/dataDirectory/update', 'POST', '127.0.0.1', 'Chrome', 'OSX', 'com.rainy.dmplatfrom.controller.DataDirectoryController', 'update', '[DataDirectory(orgId=2, orgName=新能源所, parentId=1, name=大苏计, code=null, type=0, isDirectory=false, sort=99, description=大苏计风电场, children=null)]', NULL, 8, 1, NULL);
INSERT INTO `t_operation_log` (`id`, `module`, `type`, `username`, `datetime`, `detail`, `path`, `method`, `remote_ip`, `browser`, `os`, `class_name`, `method_name`, `params`, `result`, `process_time`, `success`, `error_message`) VALUES (8, '数据目录', 'update', 'admin', '2022-11-02 18:19:17', '更新了数据目录[金阳风光储].', '/api/dataDirectory/update', 'POST', '127.0.0.1', 'Chrome', 'OSX', 'com.rainy.dmplatfrom.controller.DataDirectoryController', 'update', '[DataDirectory(orgId=2, orgName=新能源所, parentId=1, name=金阳风光储, code=null, type=0, isDirectory=false, sort=99, description=null, children=null)]', NULL, 7, 1, NULL);
INSERT INTO `t_operation_log` (`id`, `module`, `type`, `username`, `datetime`, `detail`, `path`, `method`, `remote_ip`, `browser`, `os`, `class_name`, `method_name`, `params`, `result`, `process_time`, `success`, `error_message`) VALUES (9, '数据目录', 'update', 'admin', '2022-11-02 18:19:25', '更新了数据目录[火电厂].', '/api/dataDirectory/update', 'POST', '127.0.0.1', 'Chrome', 'OSX', 'com.rainy.dmplatfrom.controller.DataDirectoryController', 'update', '[DataDirectory(orgId=5, orgName=111, parentId=0, name=火电厂, code=null, type=0, isDirectory=true, sort=99, description=火电厂, children=null)]', NULL, 7, 1, NULL);
INSERT INTO `t_operation_log` (`id`, `module`, `type`, `username`, `datetime`, `detail`, `path`, `method`, `remote_ip`, `browser`, `os`, `class_name`, `method_name`, `params`, `result`, `process_time`, `success`, `error_message`) VALUES (10, '组织管理', 'update', 'admin', '2022-11-02 18:19:35', '更新了组织[test].', '/api/org/update', 'POST', '127.0.0.1', 'Chrome', 'OSX', 'com.rainy.system.controller.OrgController', 'update', '[Org(parentId=0, name=test, code=11111, sort=99, description=11, children=null)]', NULL, 2, 1, NULL);
INSERT INTO `t_operation_log` (`id`, `module`, `type`, `username`, `datetime`, `detail`, `path`, `method`, `remote_ip`, `browser`, `os`, `class_name`, `method_name`, `params`, `result`, `process_time`, `success`, `error_message`) VALUES (11, '设备管理', 'import', 'admin', '2022-11-02 18:20:13', '导入了设备列表', '/api/devices/import', 'POST', '127.0.0.1', 'Chrome', 'OSX', 'com.rainy.dmplatfrom.controller.DeviceController', 'importExcel', '[org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@6bd979c6]', NULL, 10, 1, 'You need to add dependency of \'poi-ooxml\' to your project, and version >= 4.1.2');
INSERT INTO `t_operation_log` (`id`, `module`, `type`, `username`, `datetime`, `detail`, `path`, `method`, `remote_ip`, `browser`, `os`, `class_name`, `method_name`, `params`, `result`, `process_time`, `success`, `error_message`) VALUES (12, '设备管理', 'import', 'admin', '2022-11-02 18:21:45', '导入了设备列表', '/api/devices/import', 'POST', '127.0.0.1', 'Chrome', 'OSX', 'com.rainy.dmplatfrom.controller.DeviceController', 'importExcel', '[org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@4cdb14c1]', NULL, 11684, 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_org
-- ----------------------------
DROP TABLE IF EXISTS `t_org`;
CREATE TABLE `t_org` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '唯一编码',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `del_flag` tinyint DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='组织机构表';

-- ----------------------------
-- Records of t_org
-- ----------------------------
BEGIN;
INSERT INTO `t_org` (`id`, `parent_id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1, 0, '电科院', 'dfgx', '电科院', 99, '2022-04-05 17:57:52', 'admin', '2022-10-11 16:57:02', 'admin', 0);
INSERT INTO `t_org` (`id`, `parent_id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (2, 1, '新能源所', '5', '新能源所', 99, '2022-04-05 17:57:52', 'admin', '2022-10-11 16:57:18', 'admin', 0);
INSERT INTO `t_org` (`id`, `parent_id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (3, 1, '金属所', '6', '金属所', 99, '2022-04-10 19:53:58', 'admin', '2022-09-26 17:16:16', NULL, 0);
INSERT INTO `t_org` (`id`, `parent_id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (4, 1, '锅炉所', 'gls', '锅炉所', 99, '2022-09-26 17:16:35', NULL, '2022-09-26 17:16:49', NULL, 0);
INSERT INTO `t_org` (`id`, `parent_id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (5, 0, 'test', '11111', '11', 99, '2022-10-21 12:26:51', 'admin', '2022-11-02 18:19:35', 'admin', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_org_user_rel
-- ----------------------------
DROP TABLE IF EXISTS `t_org_user_rel`;
CREATE TABLE `t_org_user_rel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint DEFAULT NULL COMMENT '组织id',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '职位名称',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '唯一编码',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `del_flag` tinyint DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_position
-- ----------------------------
BEGIN;
INSERT INTO `t_position` (`id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1, '董事长', 'dsz', '', 99, '2022-04-04 00:02:33', 'admin', '2022-10-25 10:20:46', 'admin', 0);
INSERT INTO `t_position` (`id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (2, '副董事长', 'fdsz', '', 99, '2022-04-04 00:02:44', 'admin', '2022-10-25 10:20:49', 'admin', 0);
INSERT INTO `t_position` (`id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (3, '普通员工', 'normal', '', 99, '2022-04-04 14:13:18', 'admin', '2022-10-25 10:20:53', 'admin', 0);
INSERT INTO `t_position` (`id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (4, '总监', 'zj', '', 99, '2022-04-10 19:54:55', 'admin', '2022-10-25 10:20:55', 'admin', 0);
INSERT INTO `t_position` (`id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (5, '2323', '23', '23', 99, '2022-09-18 21:16:31', NULL, '2022-09-18 21:16:31', NULL, 1);
INSERT INTO `t_position` (`id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (6, '2323', '23', '23', 99, '2022-09-18 21:16:58', NULL, '2022-09-18 21:16:58', NULL, 1);
INSERT INTO `t_position` (`id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (7, '111', '222', '2222', 99, '2022-09-19 10:51:13', NULL, '2022-09-19 10:51:13', NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色名称',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色码',
  `sort` int DEFAULT NULL COMMENT '排序',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `is_default` tinyint DEFAULT NULL COMMENT '是否是默认角色，默认角色不能删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `del_flag` tinyint DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色表';

-- ----------------------------
-- Records of t_role
-- ----------------------------
BEGIN;
INSERT INTO `t_role` (`id`, `name`, `code`, `sort`, `description`, `is_default`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1, '超级管理员', 'role_superAdmin', 99, '超级管理员', 1, '2022-04-26 17:04:04', 'admin', '2022-10-11 16:49:15', 'admin', 0);
INSERT INTO `t_role` (`id`, `name`, `code`, `sort`, `description`, `is_default`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (2, '系统管理员', 'role_admin', 99, '对系统进行配置', 1, '2022-04-05 22:44:44', 'admin', '2022-10-02 21:58:27', NULL, 0);
INSERT INTO `t_role` (`id`, `name`, `code`, `sort`, `description`, `is_default`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (3, '审计管理员', 'role_audit', 99, '查看各种日志', 1, '2022-04-16 17:19:45', 'admin', '2022-10-02 21:58:30', NULL, 0);
INSERT INTO `t_role` (`id`, `name`, `code`, `sort`, `description`, `is_default`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (4, '默认角色', 'role_default', 99, '默认角色', 1, '2022-04-22 16:16:44', 'admin', '2022-09-19 11:49:09', NULL, 0);
INSERT INTO `t_role` (`id`, `name`, `code`, `sort`, `description`, `is_default`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (5, '公告发布员', 'role_notice', 99, '公告发布员', 0, '2022-05-05 16:07:10', 'admin', '2022-10-25 14:37:23', 'admin', 1);
INSERT INTO `t_role` (`id`, `name`, `code`, `sort`, `description`, `is_default`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (6, '测试', 'role_test', 99, '测试', 0, '2022-05-05 22:14:19', 'admin', '2022-05-26 21:25:37', 'admin', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_role_data_permission_rel
-- ----------------------------
DROP TABLE IF EXISTS `t_role_data_permission_rel`;
CREATE TABLE `t_role_data_permission_rel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint DEFAULT NULL COMMENT '角色id',
  `org_id` bigint DEFAULT NULL COMMENT '角色id',
  `half` tinyint DEFAULT NULL COMMENT '是否包含所有子菜单',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=958 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色菜单关系表';

-- ----------------------------
-- Records of t_role_data_permission_rel
-- ----------------------------
BEGIN;
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (877, 4, 15, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (878, 4, 72, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (879, 4, 71, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (880, 4, 73, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (881, 4, 74, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (882, 4, 70, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (883, 1, 3, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (884, 1, 4, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (885, 1, 5, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (886, 1, 6, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (887, 1, 8, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (888, 1, 7, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (889, 1, 16, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (890, 1, 17, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (891, 1, 18, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (892, 1, 19, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (893, 1, 21, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (894, 1, 22, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (895, 1, 23, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (896, 1, 24, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (897, 1, 25, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (898, 1, 26, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (899, 1, 27, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (900, 1, 28, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (901, 1, 29, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (902, 1, 30, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (903, 1, 36, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (904, 1, 37, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (905, 1, 31, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (906, 1, 32, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (907, 1, 33, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (908, 1, 34, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (909, 1, 35, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (910, 1, 38, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (911, 1, 39, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (912, 1, 40, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (913, 1, 41, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (914, 1, 42, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (915, 1, 43, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (916, 1, 44, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (917, 1, 45, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (918, 1, 46, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (919, 1, 47, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (920, 1, 48, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (921, 1, 49, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (922, 1, 50, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (923, 1, 51, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (924, 1, 52, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (925, 1, 53, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (926, 1, 54, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (927, 1, 55, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (928, 1, 56, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (929, 1, 57, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (930, 1, 58, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (931, 1, 9, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (932, 1, 10, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (933, 1, 11, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (934, 1, 59, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (935, 1, 60, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (936, 1, 12, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (937, 1, 13, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (938, 1, 14, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (939, 1, 61, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (940, 1, 62, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (941, 1, 63, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (942, 1, 64, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (943, 1, 65, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (944, 1, 66, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (945, 1, 1, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (946, 1, 2, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (947, 1, 20, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (948, 1, 15, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (949, 1, 67, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (950, 1, 68, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (951, 1, 69, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (952, 1, 70, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (953, 1, 71, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (954, 1, 73, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (955, 1, 74, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (956, 1, 72, 0);
INSERT INTO `t_role_data_permission_rel` (`id`, `role_id`, `org_id`, `half`) VALUES (957, 1, 75, 0);
COMMIT;

-- ----------------------------
-- Table structure for t_role_menu_rel
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu_rel`;
CREATE TABLE `t_role_menu_rel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint DEFAULT NULL COMMENT '角色id',
  `menu_id` bigint DEFAULT NULL COMMENT '菜单id',
  `half` tinyint DEFAULT NULL COMMENT '是否包含所有子菜单',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色菜单关系表';

-- ----------------------------
-- Records of t_role_menu_rel
-- ----------------------------
BEGIN;
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `half`) VALUES (1, 4, 15, 0);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `half`) VALUES (2, 4, 72, 0);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `half`) VALUES (3, 4, 70, 0);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `half`) VALUES (4, 4, 71, 0);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `half`) VALUES (5, 4, 73, 0);
INSERT INTO `t_role_menu_rel` (`id`, `role_id`, `menu_id`, `half`) VALUES (6, 4, 74, 0);
COMMIT;

-- ----------------------------
-- Table structure for t_task
-- ----------------------------
DROP TABLE IF EXISTS `t_task`;
CREATE TABLE `t_task` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '配置名称',
  `category` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分类编码',
  `cron` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'cron 表达式',
  `class_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'class类名',
  `status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务状态',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='配置表';

-- ----------------------------
-- Records of t_task
-- ----------------------------
BEGIN;
INSERT INTO `t_task` (`id`, `name`, `category`, `cron`, `class_name`, `status`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1, '定时打印一句话', 'test', '*/2 * * * * ?', 'com.rainy.job.SampleJob', '1', '打印一句话', 'admin', '2022-10-31 17:11:13', 'admin', '2022-11-01 17:01:23', 0);
INSERT INTO `t_task` (`id`, `name`, `category`, `cron`, `class_name`, `status`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (2, '清理日志', 'system', '0 0 1 * * ?', 'com.rainy.job.ClearLogTask', '0', '每天凌晨1点清理登录日志，操作日志', 'admin', '2022-10-31 23:27:44', 'admin', '2022-11-01 17:02:21', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `org_id` bigint DEFAULT NULL COMMENT '组织id',
  `position_id` bigint DEFAULT NULL COMMENT '职位id',
  `username` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `salt` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '摘要算法盐',
  `nick_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `birthday` date DEFAULT NULL,
  `avatar` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像',
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `telephone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '座机',
  `phone_number` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机号',
  `status` tinyint DEFAULT '0' COMMENT '用户状态：0 未激活，1 正常',
  `username_expired_time` datetime DEFAULT NULL COMMENT '账号过期时间',
  `password_expired_time` datetime DEFAULT NULL COMMENT '密码过期时间',
  `login_count` bigint DEFAULT '0' COMMENT '登录次数',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '最后登录ip',
  `browser` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '最后登录浏览器',
  `os` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '最后登录操作系统',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
BEGIN;
INSERT INTO `t_user` (`id`, `org_id`, `position_id`, `username`, `password`, `salt`, `nick_name`, `birthday`, `avatar`, `email`, `telephone`, `phone_number`, `status`, `username_expired_time`, `password_expired_time`, `login_count`, `last_login_time`, `last_login_ip`, `browser`, `os`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1, 1, 1, 'admin', 'Bonc@123', 'admin', '超级管理员', '2022-09-30', '/avatar.jpg', '1@qq.com', '0311-8852588', '13131111311', 0, NULL, NULL, 3, '2022-11-02 19:01:35', '127.0.0.1', 'Chrome', 'OSX', 'admin', '2022-03-29 18:52:44', 'admin', '2022-11-02 19:01:35', 0);
INSERT INTO `t_user` (`id`, `org_id`, `position_id`, `username`, `password`, `salt`, `nick_name`, `birthday`, `avatar`, `email`, `telephone`, `phone_number`, `status`, `username_expired_time`, `password_expired_time`, `login_count`, `last_login_time`, `last_login_ip`, `browser`, `os`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (2, 1, 27, 'system', 'system', 'admin', '系统管理员', '2022-09-01', '/avatar.jpg', '2@qq.com', '0311-8852588', '13131111311', 0, NULL, NULL, 1, '2022-05-05 16:11:38', '127.0.0.1', 'Chrome/97.0.4692.71', 'OSX/10_15_7', 'admin', NULL, 'admin', '2022-10-25 14:56:21', 0);
INSERT INTO `t_user` (`id`, `org_id`, `position_id`, `username`, `password`, `salt`, `nick_name`, `birthday`, `avatar`, `email`, `telephone`, `phone_number`, `status`, `username_expired_time`, `password_expired_time`, `login_count`, `last_login_time`, `last_login_ip`, `browser`, `os`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (3, 1, 28, 'audit', '123456', 'admin', '审计管理员', '2022-09-01', '/avatar.jpg', '3@qq.com', '0311-8852588', '13131111311', 0, NULL, NULL, 1, '2022-04-16 17:20:53', '127.0.0.1', 'Chrome/100.0.4896.127', 'Windows 10 or Windows Server 2016/10.0', 'admin', NULL, 'admin', '2022-10-04 21:31:06', 0);
INSERT INTO `t_user` (`id`, `org_id`, `position_id`, `username`, `password`, `salt`, `nick_name`, `birthday`, `avatar`, `email`, `telephone`, `phone_number`, `status`, `username_expired_time`, `password_expired_time`, `login_count`, `last_login_time`, `last_login_ip`, `browser`, `os`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (4, 6, NULL, 'test', 'test', NULL, 'test', '2022-01-01', '/avatar.jpg', '131@qq.com', '0311-8852588', '13131111311', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'admin', '2022-10-02 22:31:51', 'admin', '2022-10-26 10:29:29', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_user_role_rel
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role_rel`;
CREATE TABLE `t_user_role_rel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `role_id` bigint DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户角色关系表';

-- ----------------------------
-- Records of t_user_role_rel
-- ----------------------------
BEGIN;
INSERT INTO `t_user_role_rel` (`id`, `user_id`, `role_id`) VALUES (1, 1, 1);
INSERT INTO `t_user_role_rel` (`id`, `user_id`, `role_id`) VALUES (2, 126, 4);
INSERT INTO `t_user_role_rel` (`id`, `user_id`, `role_id`) VALUES (3, 3, 3);
INSERT INTO `t_user_role_rel` (`id`, `user_id`, `role_id`) VALUES (4, 2, 2);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
