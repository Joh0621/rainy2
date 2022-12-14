/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : rainy2

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 07/11/2022 16:21:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for biz_access_token
-- ----------------------------
DROP TABLE IF EXISTS `biz_access_token`;
CREATE TABLE `biz_access_token` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_data_id` bigint DEFAULT NULL,
  `access_token` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='่ๅ่กจ';

-- ----------------------------
-- Records of biz_access_token
-- ----------------------------
BEGIN;
INSERT INTO `biz_access_token` (`id`, `user_data_id`, `access_token`) VALUES (1, 1, 'ac018e2b-1d2c-4529-8ca0-f6b16ef13c18');
INSERT INTO `biz_access_token` (`id`, `user_data_id`, `access_token`) VALUES (2, 2, 'b874e8eba63b479fa53519f06bff3f4a');
INSERT INTO `biz_access_token` (`id`, `user_data_id`, `access_token`) VALUES (3, 3, '229dcffe1e1a41859fa18c133f2ca424');
COMMIT;

-- ----------------------------
-- Table structure for biz_api_record
-- ----------------------------
DROP TABLE IF EXISTS `biz_api_record`;
CREATE TABLE `biz_api_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `api_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_size` bigint DEFAULT NULL,
  `response_time` int DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of biz_api_record
-- ----------------------------
BEGIN;
INSERT INTO `biz_api_record` (`id`, `api_code`, `data_size`, `response_time`, `datetime`, `username`) VALUES (1, 'real_data', 143, 42, '2022-11-02 15:02:52', 'admin');
INSERT INTO `biz_api_record` (`id`, `api_code`, `data_size`, `response_time`, `datetime`, `username`) VALUES (2, 'real_data', 143, 22, '2022-11-02 15:03:21', 'admin');
INSERT INTO `biz_api_record` (`id`, `api_code`, `data_size`, `response_time`, `datetime`, `username`) VALUES (3, 'history_data', 60, 22, '2022-11-02 15:05:10', 'admin');
INSERT INTO `biz_api_record` (`id`, `api_code`, `data_size`, `response_time`, `datetime`, `username`) VALUES (4, 'history_data', 62, 28, '2022-11-02 15:27:08', 'admin');
INSERT INTO `biz_api_record` (`id`, `api_code`, `data_size`, `response_time`, `datetime`, `username`) VALUES (5, 'history_data', 60, 33, '2022-11-02 17:02:59', 'admin');
INSERT INTO `biz_api_record` (`id`, `api_code`, `data_size`, `response_time`, `datetime`, `username`) VALUES (6, 'history_data', 61, 31, '2022-11-02 17:03:07', 'admin');
INSERT INTO `biz_api_record` (`id`, `api_code`, `data_size`, `response_time`, `datetime`, `username`) VALUES (7, 'history_data', 2, 59, '2022-11-02 17:05:03', 'admin');
INSERT INTO `biz_api_record` (`id`, `api_code`, `data_size`, `response_time`, `datetime`, `username`) VALUES (8, 'history_data', 2, 25, '2022-11-02 17:05:04', 'admin');
INSERT INTO `biz_api_record` (`id`, `api_code`, `data_size`, `response_time`, `datetime`, `username`) VALUES (9, 'history_data', 1226881, 222, '2022-11-02 17:05:20', 'admin');
INSERT INTO `biz_api_record` (`id`, `api_code`, `data_size`, `response_time`, `datetime`, `username`) VALUES (10, 'history_data', 1226881, 200, '2022-11-02 17:05:22', 'admin');
INSERT INTO `biz_api_record` (`id`, `api_code`, `data_size`, `response_time`, `datetime`, `username`) VALUES (11, 'history_data', 1226881, 232, '2022-11-02 17:05:37', 'admin');
INSERT INTO `biz_api_record` (`id`, `api_code`, `data_size`, `response_time`, `datetime`, `username`) VALUES (12, 'history_data', 1226881, 193, '2022-11-02 17:05:39', 'admin');
INSERT INTO `biz_api_record` (`id`, `api_code`, `data_size`, `response_time`, `datetime`, `username`) VALUES (13, 'history_data', 1226881, 201, '2022-11-02 17:05:53', 'admin');
INSERT INTO `biz_api_record` (`id`, `api_code`, `data_size`, `response_time`, `datetime`, `username`) VALUES (14, 'history_data', 1226881, 232, '2022-11-02 17:06:25', 'admin');
INSERT INTO `biz_api_record` (`id`, `api_code`, `data_size`, `response_time`, `datetime`, `username`) VALUES (15, 'history_data', 1226881, 211, '2022-11-02 17:40:24', 'admin');
INSERT INTO `biz_api_record` (`id`, `api_code`, `data_size`, `response_time`, `datetime`, `username`) VALUES (16, 'history_data', 1226881, 295, '2022-11-02 17:41:08', 'admin');
INSERT INTO `biz_api_record` (`id`, `api_code`, `data_size`, `response_time`, `datetime`, `username`) VALUES (17, 'history_data', 1226881, 215, '2022-11-02 17:45:43', 'admin');
COMMIT;

-- ----------------------------
-- Table structure for biz_data_directory
-- ----------------------------
DROP TABLE IF EXISTS `biz_data_directory`;
CREATE TABLE `biz_data_directory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint DEFAULT NULL,
  `org_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '้จ้จๅ็งฐ',
  `parent_id` bigint DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅ็งฐ',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅฏไธ็ผ็?',
  `type` tinyint DEFAULT NULL COMMENT '็ฑปๅ',
  `is_directory` tinyint DEFAULT NULL COMMENT 'ๆฏๅฆๆฏ็ฎๅฝ',
  `sort` int DEFAULT NULL COMMENT 'ๆๅบ',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆ่ฟฐ',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅๅปบ่',
  `create_time` datetime DEFAULT NULL COMMENT 'ๅๅปบๆถ้ด',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆดๆฐ่',
  `update_time` datetime DEFAULT NULL COMMENT 'ๆดๆฐๆถ้ด',
  `del_flag` tinyint DEFAULT '0' COMMENT 'ๅ?้คๆ?ๅฟ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='่ๅ่กจ';

-- ----------------------------
-- Records of biz_data_directory
-- ----------------------------
BEGIN;
INSERT INTO `biz_data_directory` (`id`, `org_id`, `org_name`, `parent_id`, `name`, `code`, `type`, `is_directory`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1, 5, 'ๆฐ่ฝๆบๆ', 0, 'ๆฐ่ฝๆบ', 'xny', 0, 1, 99, 'ๆฐ่ฝๆบ', 'admin', '2022-05-05 16:16:19', 'admin', '2022-10-13 19:55:44', 0);
INSERT INTO `biz_data_directory` (`id`, `org_id`, `org_name`, `parent_id`, `name`, `code`, `type`, `is_directory`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (2, 5, '111', 0, '็ซ็ตๅ', 'hdc', 0, 1, 99, '็ซ็ตๅ', 'admin', '2022-05-05 16:16:46', 'admin', '2022-11-02 18:19:25', 0);
INSERT INTO `biz_data_directory` (`id`, `org_id`, `org_name`, `parent_id`, `name`, `code`, `type`, `is_directory`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (3, 2, 'ๆฐ่ฝๆบๆ', 1, '้ฒ่ฝ่ฟ้ฃๅฒญ', 'lnyfl', 0, 0, 98, '้ฒ่ฝ่ฟ้ฃๅฒญ้ฃ็ตๅบ', 'admin', '2022-05-05 16:17:34', 'admin', '2022-11-02 18:18:28', 0);
INSERT INTO `biz_data_directory` (`id`, `org_id`, `org_name`, `parent_id`, `name`, `code`, `type`, `is_directory`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (4, 2, 'ๆฐ่ฝๆบๆ', 1, 'ๅคฉๆกฅๅฑฑ', 'tqs', 0, 0, 98, 'ๅคฉๆกฅๅฑฑ้ฃ็ตๅบ', 'admin', '2022-05-05 16:17:47', 'admin', '2022-11-02 18:19:00', 0);
INSERT INTO `biz_data_directory` (`id`, `org_id`, `org_name`, `parent_id`, `name`, `code`, `type`, `is_directory`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (5, 2, 'ๆฐ่ฝๆบๆ', 1, 'ๅคง่่ฎก', 'dsj', 0, 0, 99, 'ๅคง่่ฎก้ฃ็ตๅบ', 'admin', '2022-05-05 16:18:10', 'admin', '2022-11-02 18:19:06', 0);
INSERT INTO `biz_data_directory` (`id`, `org_id`, `org_name`, `parent_id`, `name`, `code`, `type`, `is_directory`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (6, 2, 'ๆฐ่ฝๆบๆ', 1, '้้ณ้ฃๅๅจ', NULL, 0, 0, 99, NULL, 'admin', '2022-10-11 15:46:08', 'admin', '2022-11-02 18:19:17', 0);
COMMIT;

-- ----------------------------
-- Table structure for biz_device
-- ----------------------------
DROP TABLE IF EXISTS `biz_device`;
CREATE TABLE `biz_device` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `data_directory_id` bigint DEFAULT NULL COMMENT 'ๆๅฑๆฐๆฎ็ฎๅฝ',
  `data_directory_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆๅฑๆฐๆฎ็ฎๅฝๅ็งฐ',
  `org_id` bigint DEFAULT NULL COMMENT '้จ้จid',
  `org_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '้จ้จๅ็งฐ',
  `responsible` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '่ดฃไปปไบบ',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅ็งฐ',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅฏไธ็ผ็?',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆ่ฟฐ',
  `update_frequency` tinyint DEFAULT NULL COMMENT 'ๆดๆฐ้ข็',
  `major` tinyint DEFAULT NULL COMMENT 'ไธไธ',
  `point_count` int DEFAULT NULL COMMENT 'ๆต็นๆฐ้',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='็ป็ปๆบๆ่กจ';

-- ----------------------------
-- Records of biz_device
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for biz_interface
-- ----------------------------
DROP TABLE IF EXISTS `biz_interface`;
CREATE TABLE `biz_interface` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅ็งฐ',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅฏไธ็ผ็?',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆ่ฟฐ',
  `status` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='็ป็ปๆบๆ่กจ';

-- ----------------------------
-- Records of biz_interface
-- ----------------------------
BEGIN;
INSERT INTO `biz_interface` (`id`, `name`, `code`, `description`, `status`) VALUES (1, 'ๅฎๆถๆฐๆฎๆฅๅฃ', 'real_data', '่ทๅๅฎๆถๆฐๆฎ', 0);
INSERT INTO `biz_interface` (`id`, `name`, `code`, `description`, `status`) VALUES (2, 'ๅๅฒๆฐๆฎๆฅๅฃ', 'history_data', '่ทๅๅๅฒๆฐๆฎ', 0);
COMMIT;

-- ----------------------------
-- Table structure for biz_point
-- ----------------------------
DROP TABLE IF EXISTS `biz_point`;
CREATE TABLE `biz_point` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `device_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '่ฎพๅค็ผ็?',
  `device_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '่ฎพๅคๅ็งฐ',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆฐๆฎ็น็?',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '็นๅ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_device_code` (`device_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of biz_point
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for biz_user_data_rel
-- ----------------------------
DROP TABLE IF EXISTS `biz_user_data_rel`;
CREATE TABLE `biz_user_data_rel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `data_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆฐๆฎ็ฑปๅ',
  `data_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆฐๆฎ็ผ็?',
  `data_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆฐๆฎๅ็งฐ',
  `data_direction_id` bigint DEFAULT NULL COMMENT 'ๆฐๆฎ็ฎๅฝid',
  `data_direction_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆฐๆฎ็ฎๅฝๅ็งฐ',
  `org_id` bigint DEFAULT NULL COMMENT '้จ้จid',
  `org_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '่ดฃไปป้จ้จ',
  `apply_user_id` bigint DEFAULT NULL,
  `apply_username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '็ณ่ฏทไบบ',
  `apply_time` datetime DEFAULT NULL COMMENT '็ณ่ฏทๆถ้ด',
  `approved` tinyint DEFAULT NULL COMMENT 'ๅฎกๆน็ถๆ๏ผ0 ๅฎกๆนไธญ๏ผ1ๅฎกๆน้่ฟ๏ผ2ๅฎกๆนๆช้่ฟ',
  `status` tinyint DEFAULT NULL COMMENT '็ถๆ๏ผ0ๅฏ็จ๏ผ1็ฆ็จ',
  `approved_time` datetime DEFAULT NULL COMMENT 'ๅฎกๆนๆถ้ด',
  `process_instance_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `process_definition_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='่ๅ่กจ';

-- ----------------------------
-- Records of biz_user_data_rel
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for dw_interface_info
-- ----------------------------
DROP TABLE IF EXISTS `dw_interface_info`;
CREATE TABLE `dw_interface_info` (
  `api_id` varchar(64) NOT NULL COMMENT 'ID',
  `api_method` varchar(12) NOT NULL COMMENT 'HttpMethod๏ผGETใPUTใPOST',
  `api_path` varchar(512) NOT NULL COMMENT 'ๆฆๆช่ทฏๅพ',
  `api_status` varchar(4) NOT NULL COMMENT '็ถๆ๏ผ0๏ผ1๏ผ2๏ผ3',
  `api_comment` varchar(255) NOT NULL COMMENT 'ๆณจ้',
  `api_type` varchar(24) NOT NULL COMMENT '่ๆฌ็ฑปๅ๏ผSQLใDataQL',
  `api_script` mediumtext NOT NULL COMMENT 'ๆฅ่ฏข่ๆฌ๏ผxxxxxxx',
  `api_schema` mediumtext NOT NULL COMMENT 'ๆฅๅฃ็่ฏทๆฑ/ๅๅบๆฐๆฎ็ปๆ',
  `api_sample` mediumtext NOT NULL COMMENT '่ฏทๆฑ/ๅๅบ/่ฏทๆฑๅคดๆ?ทๆฌๆฐๆฎ',
  `api_option` mediumtext NOT NULL COMMENT 'ๆฉๅฑ้็ฝฎไฟกๆฏ',
  `api_create_time` varchar(32) NOT NULL COMMENT 'ๅๅปบๆถ้ด',
  `api_gmt_time` varchar(32) NOT NULL COMMENT 'ไฟฎๆนๆถ้ด',
  `project_id` int DEFAULT NULL COMMENT 'ๆๅฑ้กน็ฎid',
  PRIMARY KEY (`api_id`) USING BTREE,
  UNIQUE KEY `idx_interface_info` (`api_path`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Dataway ไธญ็API';

-- ----------------------------
-- Records of dw_interface_info
-- ----------------------------
BEGIN;
INSERT INTO `dw_interface_info` (`api_id`, `api_method`, `api_path`, `api_status`, `api_comment`, `api_type`, `api_script`, `api_schema`, `api_sample`, `api_option`, `api_create_time`, `api_gmt_time`, `project_id`) VALUES ('i_f2hmemj3k-42e', 'GET', '/api/test', '1', 'test', 'DataQL', '// a new Query.\nreturn ${message};', '{\"requestHeader\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{}},\"requestBody\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"message\":{\"type\":\"string\"}}},\"responseHeader\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{}},\"responseBody\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"executionTime\":{\"type\":\"number\"},\"code\":{\"type\":\"number\"},\"data\":{\"type\":\"string\"},\"success\":{\"type\":\"boolean\"},\"lifeCycleTime\":{\"type\":\"number\"},\"location\":{\"type\":[\"string\",\"boolean\",\"number\",\"object\",\"array\",\"null\"]},\"message\":{\"type\":\"string\"}}}}', '{\"requestHeader\":\"[]\",\"requestBody\":\"{\\\"message\\\":\\\"Hello DataQL.\\\"}\",\"responseHeader\":\"{}\",\"responseBody\":\"{\\n\\t\\\"success\\\":true,\\n\\t\\\"message\\\":\\\"OK\\\",\\n\\t\\\"code\\\":0,\\n\\t\\\"lifeCycleTime\\\":3,\\n\\t\\\"executionTime\\\":0,\\n\\t\\\"data\\\":\\\"Hello DataQL.\\\"\\n}\"}', '{\"enableCrossDomain\":false,\"hasor.dataway.globalConfig.responseFormat\":\"{\\n    \\\"success\\\"      : \\\"@resultStatus\\\",\\n    \\\"message\\\"      : \\\"@resultMessage\\\",\\n    \\\"location\\\"     : \\\"@blockLocation\\\",\\n    \\\"code\\\"         : \\\"@resultCode\\\",\\n    \\\"lifeCycleTime\\\": \\\"@timeLifeCycle\\\",\\n    \\\"executionTime\\\": \\\"@timeExecution\\\",\\n    \\\"value\\\"        : \\\"@resultData\\\"\\n}\",\"API_BASE_URL\":\"/api/\",\"resultStructure\":true,\"showGitButton\":true,\"hasor.dataway.globalConfig.enableCrossDomain\":\"true\",\"CONTEXT_PATH\":\"/api\",\"hasor.dataway.globalConfig.resultStructure\":\"true\",\"responseFormat\":\"{\\n  \\\"success\\\"      : \\\"@resultStatus\\\",\\n  \\\"message\\\"      : \\\"@resultMessage\\\",\\n  \\\"location\\\"     : \\\"@codeLocation\\\",\\n  \\\"code\\\"         : \\\"@resultCode\\\",\\n  \\\"lifeCycleTime\\\": \\\"@timeLifeCycle\\\",\\n  \\\"executionTime\\\": \\\"@timeExecution\\\",\\n  \\\"data\\\"        : \\\"@resultData\\\"\\n}\",\"wrapAllParameters\":false,\"hasor.dataway.globalConfig.wrapAllParameters\":\"false\",\"hasor.dataway.globalConfig.showGitButton\":\"true\",\"hasor.dataway.globalConfig.wrapParameterName\":\"root\",\"wrapParameterName\":\"root\"}', '1663731543836', '1663731626705', NULL);
COMMIT;

-- ----------------------------
-- Table structure for dw_interface_release
-- ----------------------------
DROP TABLE IF EXISTS `dw_interface_release`;
CREATE TABLE `dw_interface_release` (
  `pub_id` varchar(64) NOT NULL COMMENT 'Publish ID',
  `pub_api_id` varchar(64) NOT NULL COMMENT 'ๆๅฑAPI ID',
  `pub_method` varchar(12) NOT NULL COMMENT 'HttpMethod๏ผGETใPUTใPOST',
  `pub_path` varchar(512) NOT NULL COMMENT 'ๆฆๆช่ทฏๅพ',
  `pub_status` varchar(4) NOT NULL COMMENT '็ถๆ๏ผ0ๆๆ๏ผ1ๆ?ๆ๏ผๅฏ่ฝ่ขซไธ็บฟ๏ผ',
  `pub_type` varchar(24) NOT NULL COMMENT '่ๆฌ็ฑปๅ๏ผSQLใDataQL',
  `pub_script` mediumtext NOT NULL COMMENT 'ๆฅ่ฏข่ๆฌ๏ผxxxxxxx',
  `pub_script_ori` mediumtext NOT NULL COMMENT 'ๅๅงๆฅ่ฏข่ๆฌ๏ผไปๅฝ็ฑปๅไธบSQLๆถไธๅ',
  `pub_schema` mediumtext NOT NULL COMMENT 'ๆฅๅฃ็่ฏทๆฑ/ๅๅบๆฐๆฎ็ปๆ',
  `pub_sample` mediumtext NOT NULL COMMENT '่ฏทๆฑ/ๅๅบ/่ฏทๆฑๅคดๆ?ทๆฌๆฐๆฎ',
  `pub_option` mediumtext NOT NULL COMMENT 'ๆฉๅฑ้็ฝฎไฟกๆฏ',
  `pub_release_time` varchar(32) NOT NULL COMMENT 'ๅๅธๆถ้ด๏ผไธ็บฟไธๆดๆฐ๏ผ',
  `pub_comment` varchar(255) NOT NULL COMMENT 'ๅคๆณจ',
  PRIMARY KEY (`pub_id`) USING BTREE,
  KEY `idx_interface_release` (`pub_api_id`) USING BTREE,
  KEY `idx_interface_release_path` (`pub_path`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Dataway API ๅๅธ่ฎฐๅฝ';

-- ----------------------------
-- Records of dw_interface_release
-- ----------------------------
BEGIN;
INSERT INTO `dw_interface_release` (`pub_id`, `pub_api_id`, `pub_method`, `pub_path`, `pub_status`, `pub_type`, `pub_script`, `pub_script_ori`, `pub_schema`, `pub_sample`, `pub_option`, `pub_release_time`, `pub_comment`) VALUES ('r_f2hmemm6e-bli', 'i_f2hmemj3k-42e', 'POST', '/api/test', '3', 'DataQL', '// a new Query.\nreturn ${message};', '// a new Query.\nreturn ${message};', '{\"requestHeader\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{}},\"requestBody\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"message\":{\"type\":\"string\"}}},\"responseHeader\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{}},\"responseBody\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"executionTime\":{\"type\":\"number\"},\"code\":{\"type\":\"number\"},\"success\":{\"type\":\"boolean\"},\"lifeCycleTime\":{\"type\":\"number\"},\"location\":{\"type\":[\"string\",\"boolean\",\"number\",\"object\",\"array\",\"null\"]},\"message\":{\"type\":\"string\"},\"value\":{\"type\":\"string\"}}}}', '{\"requestHeader\":\"[]\",\"requestBody\":\"{\\\"message\\\":\\\"Hello DataQL.\\\"}\",\"responseHeader\":\"{}\",\"responseBody\":\"{\\n\\t\\\"success\\\":true,\\n\\t\\\"message\\\":\\\"OK\\\",\\n\\t\\\"code\\\":0,\\n\\t\\\"lifeCycleTime\\\":5,\\n\\t\\\"executionTime\\\":0,\\n\\t\\\"value\\\":\\\"Hello DataQL.\\\"\\n}\"}', '{\"enableCrossDomain\":false,\"hasor.dataway.globalConfig.responseFormat\":\"{\\n    \\\"success\\\"      : \\\"@resultStatus\\\",\\n    \\\"message\\\"      : \\\"@resultMessage\\\",\\n    \\\"location\\\"     : \\\"@blockLocation\\\",\\n    \\\"code\\\"         : \\\"@resultCode\\\",\\n    \\\"lifeCycleTime\\\": \\\"@timeLifeCycle\\\",\\n    \\\"executionTime\\\": \\\"@timeExecution\\\",\\n    \\\"value\\\"        : \\\"@resultData\\\"\\n}\",\"API_BASE_URL\":\"/api/\",\"resultStructure\":true,\"showGitButton\":true,\"hasor.dataway.globalConfig.enableCrossDomain\":\"true\",\"CONTEXT_PATH\":\"/api\",\"hasor.dataway.globalConfig.resultStructure\":\"true\",\"responseFormat\":\"{\\n  \\\"success\\\"      : \\\"@resultStatus\\\",\\n  \\\"message\\\"      : \\\"@resultMessage\\\",\\n  \\\"location\\\"     : \\\"@codeLocation\\\",\\n  \\\"code\\\"         : \\\"@resultCode\\\",\\n  \\\"lifeCycleTime\\\": \\\"@timeLifeCycle\\\",\\n  \\\"executionTime\\\": \\\"@timeExecution\\\",\\n  \\\"value\\\"        : \\\"@resultData\\\"\\n}\",\"wrapAllParameters\":false,\"hasor.dataway.globalConfig.wrapAllParameters\":\"false\",\"hasor.dataway.globalConfig.showGitButton\":\"true\",\"hasor.dataway.globalConfig.wrapParameterName\":\"root\",\"wrapParameterName\":\"root\"}', '1663731545630', 'test');
INSERT INTO `dw_interface_release` (`pub_id`, `pub_api_id`, `pub_method`, `pub_path`, `pub_status`, `pub_type`, `pub_script`, `pub_script_ori`, `pub_schema`, `pub_sample`, `pub_option`, `pub_release_time`, `pub_comment`) VALUES ('r_f2hmf29acafen', 'i_f2hmemj3k-42e', 'GET', '/api/test', '3', 'DataQL', '// a new Query.\nreturn ${message};', '// a new Query.\nreturn ${message};', '{\"requestHeader\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{}},\"requestBody\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"message\":{\"type\":\"string\"}}},\"responseHeader\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{}},\"responseBody\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"executionTime\":{\"type\":\"number\"},\"code\":{\"type\":\"number\"},\"success\":{\"type\":\"boolean\"},\"lifeCycleTime\":{\"type\":\"number\"},\"location\":{\"type\":[\"string\",\"boolean\",\"number\",\"object\",\"array\",\"null\"]},\"message\":{\"type\":\"string\"},\"value\":{\"type\":\"string\"}}}}', '{\"requestHeader\":\"[]\",\"requestBody\":\"{\\\"message\\\":\\\"Hello DataQL.\\\"}\",\"responseHeader\":\"{}\",\"responseBody\":\"{\\n\\t\\\"success\\\":true,\\n\\t\\\"message\\\":\\\"OK\\\",\\n\\t\\\"code\\\":0,\\n\\t\\\"lifeCycleTime\\\":3,\\n\\t\\\"executionTime\\\":0,\\n\\t\\\"value\\\":\\\"Hello DataQL.\\\"\\n}\"}', '{\"enableCrossDomain\":false,\"hasor.dataway.globalConfig.responseFormat\":\"{\\n    \\\"success\\\"      : \\\"@resultStatus\\\",\\n    \\\"message\\\"      : \\\"@resultMessage\\\",\\n    \\\"location\\\"     : \\\"@blockLocation\\\",\\n    \\\"code\\\"         : \\\"@resultCode\\\",\\n    \\\"lifeCycleTime\\\": \\\"@timeLifeCycle\\\",\\n    \\\"executionTime\\\": \\\"@timeExecution\\\",\\n    \\\"value\\\"        : \\\"@resultData\\\"\\n}\",\"API_BASE_URL\":\"/api/\",\"resultStructure\":true,\"showGitButton\":true,\"hasor.dataway.globalConfig.enableCrossDomain\":\"true\",\"CONTEXT_PATH\":\"/api\",\"hasor.dataway.globalConfig.resultStructure\":\"true\",\"responseFormat\":\"{\\n  \\\"success\\\"      : \\\"@resultStatus\\\",\\n  \\\"message\\\"      : \\\"@resultMessage\\\",\\n  \\\"location\\\"     : \\\"@codeLocation\\\",\\n  \\\"code\\\"         : \\\"@resultCode\\\",\\n  \\\"lifeCycleTime\\\": \\\"@timeLifeCycle\\\",\\n  \\\"executionTime\\\": \\\"@timeExecution\\\",\\n  \\\"value\\\"        : \\\"@resultData\\\"\\n}\",\"wrapAllParameters\":false,\"hasor.dataway.globalConfig.wrapAllParameters\":\"false\",\"hasor.dataway.globalConfig.showGitButton\":\"true\",\"hasor.dataway.globalConfig.wrapParameterName\":\"root\",\"wrapParameterName\":\"root\"}', '1663731593532', 'test');
INSERT INTO `dw_interface_release` (`pub_id`, `pub_api_id`, `pub_method`, `pub_path`, `pub_status`, `pub_type`, `pub_script`, `pub_script_ori`, `pub_schema`, `pub_sample`, `pub_option`, `pub_release_time`, `pub_comment`) VALUES ('r_f2hmf3kbk-2dj', 'i_f2hmemj3k-42e', 'GET', '/api/test', '3', 'DataQL', '// a new Query.\nreturn ${message};', '// a new Query.\nreturn ${message};', '{\"requestHeader\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{}},\"requestBody\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"message\":{\"type\":\"string\"}}},\"responseHeader\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{}},\"responseBody\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"executionTime\":{\"type\":\"number\"},\"code\":{\"type\":\"number\"},\"success\":{\"type\":\"boolean\"},\"lifeCycleTime\":{\"type\":\"number\"},\"location\":{\"type\":[\"string\",\"boolean\",\"number\",\"object\",\"array\",\"null\"]},\"message\":{\"type\":\"string\"},\"value\":{\"type\":\"string\"}}}}', '{\"requestHeader\":\"[]\",\"requestBody\":\"{\\\"message\\\":\\\"Hello DataQL.\\\"}\",\"responseHeader\":\"{}\",\"responseBody\":\"{\\n\\t\\\"success\\\":true,\\n\\t\\\"message\\\":\\\"OK\\\",\\n\\t\\\"code\\\":0,\\n\\t\\\"lifeCycleTime\\\":4,\\n\\t\\\"executionTime\\\":0,\\n\\t\\\"value\\\":\\\"Hello DataQL.\\\"\\n}\"}', '{\"enableCrossDomain\":false,\"hasor.dataway.globalConfig.responseFormat\":\"{\\n    \\\"success\\\"      : \\\"@resultStatus\\\",\\n    \\\"message\\\"      : \\\"@resultMessage\\\",\\n    \\\"location\\\"     : \\\"@blockLocation\\\",\\n    \\\"code\\\"         : \\\"@resultCode\\\",\\n    \\\"lifeCycleTime\\\": \\\"@timeLifeCycle\\\",\\n    \\\"executionTime\\\": \\\"@timeExecution\\\",\\n    \\\"value\\\"        : \\\"@resultData\\\"\\n}\",\"API_BASE_URL\":\"/api/\",\"resultStructure\":true,\"showGitButton\":true,\"hasor.dataway.globalConfig.enableCrossDomain\":\"true\",\"CONTEXT_PATH\":\"/api\",\"hasor.dataway.globalConfig.resultStructure\":\"true\",\"responseFormat\":\"{\\n  \\\"success\\\"      : \\\"@resultStatus\\\",\\n  \\\"message\\\"      : \\\"@resultMessage\\\",\\n  \\\"location\\\"     : \\\"@codeLocation\\\",\\n  \\\"code\\\"         : \\\"@resultCode\\\",\\n  \\\"lifeCycleTime\\\": \\\"@timeLifeCycle\\\",\\n  \\\"executionTime\\\": \\\"@timeExecution\\\",\\n  \\\"value\\\"        : \\\"@resultData\\\"\\n}\",\"wrapAllParameters\":false,\"hasor.dataway.globalConfig.wrapAllParameters\":\"false\",\"hasor.dataway.globalConfig.showGitButton\":\"true\",\"hasor.dataway.globalConfig.wrapParameterName\":\"root\",\"wrapParameterName\":\"root\"}', '1663731613724', 'test');
INSERT INTO `dw_interface_release` (`pub_id`, `pub_api_id`, `pub_method`, `pub_path`, `pub_status`, `pub_type`, `pub_script`, `pub_script_ori`, `pub_schema`, `pub_sample`, `pub_option`, `pub_release_time`, `pub_comment`) VALUES ('r_f2hmf4j0kai95', 'i_f2hmemj3k-42e', 'GET', '/api/test', '1', 'DataQL', '// a new Query.\nreturn ${message};', '// a new Query.\nreturn ${message};', '{\"requestHeader\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{}},\"requestBody\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"message\":{\"type\":\"string\"}}},\"responseHeader\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{}},\"responseBody\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"executionTime\":{\"type\":\"number\"},\"code\":{\"type\":\"number\"},\"data\":{\"type\":\"string\"},\"success\":{\"type\":\"boolean\"},\"lifeCycleTime\":{\"type\":\"number\"},\"location\":{\"type\":[\"string\",\"boolean\",\"number\",\"object\",\"array\",\"null\"]},\"message\":{\"type\":\"string\"}}}}', '{\"requestHeader\":\"[]\",\"requestBody\":\"{\\\"message\\\":\\\"Hello DataQL.\\\"}\",\"responseHeader\":\"{}\",\"responseBody\":\"{\\n\\t\\\"success\\\":true,\\n\\t\\\"message\\\":\\\"OK\\\",\\n\\t\\\"code\\\":0,\\n\\t\\\"lifeCycleTime\\\":3,\\n\\t\\\"executionTime\\\":0,\\n\\t\\\"data\\\":\\\"Hello DataQL.\\\"\\n}\"}', '{\"enableCrossDomain\":false,\"hasor.dataway.globalConfig.responseFormat\":\"{\\n    \\\"success\\\"      : \\\"@resultStatus\\\",\\n    \\\"message\\\"      : \\\"@resultMessage\\\",\\n    \\\"location\\\"     : \\\"@blockLocation\\\",\\n    \\\"code\\\"         : \\\"@resultCode\\\",\\n    \\\"lifeCycleTime\\\": \\\"@timeLifeCycle\\\",\\n    \\\"executionTime\\\": \\\"@timeExecution\\\",\\n    \\\"value\\\"        : \\\"@resultData\\\"\\n}\",\"API_BASE_URL\":\"/api/\",\"resultStructure\":true,\"showGitButton\":true,\"hasor.dataway.globalConfig.enableCrossDomain\":\"true\",\"CONTEXT_PATH\":\"/api\",\"hasor.dataway.globalConfig.resultStructure\":\"true\",\"responseFormat\":\"{\\n  \\\"success\\\"      : \\\"@resultStatus\\\",\\n  \\\"message\\\"      : \\\"@resultMessage\\\",\\n  \\\"location\\\"     : \\\"@codeLocation\\\",\\n  \\\"code\\\"         : \\\"@resultCode\\\",\\n  \\\"lifeCycleTime\\\": \\\"@timeLifeCycle\\\",\\n  \\\"executionTime\\\": \\\"@timeExecution\\\",\\n  \\\"data\\\"        : \\\"@resultData\\\"\\n}\",\"wrapAllParameters\":false,\"hasor.dataway.globalConfig.wrapAllParameters\":\"false\",\"hasor.dataway.globalConfig.showGitButton\":\"true\",\"hasor.dataway.globalConfig.wrapParameterName\":\"root\",\"wrapParameterName\":\"root\"}', '1663731626708', 'test');
COMMIT;

-- ----------------------------
-- Table structure for t_config
-- ----------------------------
DROP TABLE IF EXISTS `t_config`;
CREATE TABLE `t_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅ็ฑป็ผ็?',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '้็ฝฎๅ็งฐ',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅฏไธ็ผ็?',
  `data_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆฐๆฎ็ฑปๅ',
  `value` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅผ',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆ่ฟฐ',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅๅปบ่',
  `create_time` datetime DEFAULT NULL COMMENT 'ๅๅปบๆถ้ด',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆดๆฐ่',
  `update_time` datetime DEFAULT NULL COMMENT 'ๆดๆฐๆถ้ด',
  `del_flag` tinyint DEFAULT '0' COMMENT 'ๅ?้คๆ?ๅฟ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='้็ฝฎ่กจ';

-- ----------------------------
-- Records of t_config
-- ----------------------------
BEGIN;
INSERT INTO `t_config` (`id`, `category_code`, `name`, `code`, `data_type`, `value`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1, 'system', 'test', 'sysTitle', 'string', 'ๆฐๆฎ้จๆท', 'ๆๅฐไธๅฅ่ฏ', NULL, NULL, 'admin', '2022-10-31 17:01:34', 0);
INSERT INTO `t_config` (`id`, `category_code`, `name`, `code`, `data_type`, `value`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (2, 'system', '็ณป็ปlogo', 'sysLogo', 'string', '/vite.svg', '็ณป็ปlogo', 'admin', '2022-04-16 18:52:48', NULL, '2022-09-21 12:02:01', 0);
INSERT INTO `t_config` (`id`, `category_code`, `name`, `code`, `data_type`, `value`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (3, 'system', '็ณป็ปๆ่ฟฐ', 'sysDescription', 'string', 'ไธไธชๅๅฐ็ฎก็็ณป็ป', 'ไธไธชๅๅฐ็ฎก็็ณป็ป', 'admin', '2022-05-29 06:27:57', NULL, '2022-09-17 02:42:23', 0);
INSERT INTO `t_config` (`id`, `category_code`, `name`, `code`, `data_type`, `value`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (4, 'system', 'ๆฏๅฆๅผๅฏ้ช่ฏ็?', 'captchaEnable', 'boolean', 'true', 'ๆฏๅฆๅผๅฏ้ช่ฏ็?', 'admin', '2022-05-03 10:08:49', NULL, '2022-09-17 02:42:19', 0);
INSERT INTO `t_config` (`id`, `category_code`, `name`, `code`, `data_type`, `value`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (5, 'system', 'ๆไปถๅญๅจ่ทฏๅพ', 'sys_file_storage_path', 'string', '/opt/data/file/', NULL, 'admin', '2022-10-10 15:36:15', 'admin', '2022-10-10 15:39:01', 0);
INSERT INTO `t_config` (`id`, `category_code`, `name`, `code`, `data_type`, `value`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (6, 'system', '้็ฝฎๅฏ็?', 'sys_reset_password', 'string', '123456', NULL, 'admin', '2022-10-25 10:19:29', 'admin', '2022-10-25 10:19:29', 0);
INSERT INTO `t_config` (`id`, `category_code`, `name`, `code`, `data_type`, `value`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (7, 'system', 'ๆฅๅฟไฟ็ๅคฉๆฐ', 'sys_log_retention_days', 'int', '180', '็ปๅฝ/ๆไฝๆฅๅฟไฟ็ๅคฉๆฐ', 'admin', '2022-10-31 23:20:05', 'admin', '2022-10-31 23:20:05', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅ็ฑป็ผ็?',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅญๅธๅ็งฐ',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅฏไธ็ผ็?',
  `data_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆฐๆฎ็ฑปๅ',
  `sort` int DEFAULT NULL COMMENT 'ๆๅบ',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆ่ฟฐ',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅๅปบ่',
  `create_time` datetime DEFAULT NULL COMMENT 'ๅๅปบๆถ้ด',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆดๆฐ่',
  `update_time` datetime DEFAULT NULL COMMENT 'ๆดๆฐๆถ้ด',
  `del_flag` tinyint DEFAULT '0' COMMENT 'ๅ?้คๆ?ๅฟ',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code_idx` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='ๅญๅธ่กจ';

-- ----------------------------
-- Records of t_dict
-- ----------------------------
BEGIN;
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1, '1001', 'ๅญๅธๅ็ฑป', 'sys_dict_category', 'string', 99, 'ๅญๅธๅ็ฑป', NULL, NULL, NULL, '2022-04-12 23:19:57', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (2, '1001', 'ๆฐๆฎ็ฑปๅ', 'sys_data_type', 'string', 99, 'ๆฐๆฎ็ฑปๅ', NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (3, '1001', '้็จๆฏๅฆ', 'sys_yes_or_no', 'boolean', 99, '้็จๆฏๅฆ', NULL, NULL, NULL, '2022-09-21 09:23:57', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (4, '1001', '็จๆท็ถๆ', 'sys_user_status', 'int', 99, '็จๆท็ถๆ', NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (5, '1001', '็ณป็ป้็ฝฎๅ็ฑป', 'sys_config_category', 'string', 99, '็ณป็ป้็ฝฎๅ็ฑป', NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (8, '1001', 'ๆไฝๆฅๅฟ็ฑปๅ', 'sys_operation_log_type', 'string', 99, 'ๆไฝๆฅๅฟ็ฑปๅ', NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (12, '1001', 'httpๅๅบๅคด', 'sys_response_header', 'string', 99, NULL, 'admin', '2022-04-13 09:53:08', 'admin', '2022-04-13 09:53:08', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (15, '1001', '็ปๅฝ็ฑปๅ', 'sys_login_type', 'int', 99, '็ปๅฝ็ฑปๅ๏ผ็ปๅฝ๏ผ้ๅบ', 'admin', '2022-04-16 16:52:00', 'admin', '2022-04-16 16:52:21', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (18, '1001', 'ๅ่ฎธ็http่ฏทๆฑๆนๆณ', 'sys_http_allow_method', 'string', 99, 'ๅ่ฎธ็http่ฏทๆฑๆนๆณ,ๅถไปๆนๆณ่ฟๅ405็ถๆ็?ๆ่ฏทๆฑๆนๆณไธๅ่ฎธ็ฑปไผผ็ๆ็คบ', 'admin', '2022-06-22 09:42:08', 'admin', '2022-06-22 09:42:08', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (19, '1001', '้็จ็ฆ็จๅฏ็จ', 'sys_enable_disable', 'string', 99, '้็จ็ฆ็จๅฏ็จ', 'admin', '2022-07-18 17:45:05', NULL, '2022-09-21 09:27:47', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (20, '1001', '็ณป็ปๆจกๅ', 'sys_module', 'string', 99, 'ๆไฝๆฅๅฟ็ณป็ปๆจกๅๆฅ่ฏขๆกไปถไฝฟ็จ', 'admin', '2022-07-19 11:21:37', 'admin', '2022-07-19 11:21:37', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (24, '1002', 'ๆฐๆฎ็ฎๅฝ็ฑปๅ', 'biz_data_directory_type', 'int', NULL, 'ๆฐๆฎ็ฎๅฝ็ฑปๅ', NULL, '2022-09-20 14:41:57', 'admin', '2022-10-11 16:49:28', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (25, '1002', 'ๆฐๆฎไธไธ', 'biz_major', 'int', NULL, 'ๆฐๆฎๆๅฑไธไธ', NULL, '2022-09-20 16:33:33', NULL, '2022-09-20 16:55:10', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (26, '1001', 'ๅฎกๆน็ถๆ', 'wf_approve_status', 'int', NULL, 'ๅฎกๆน็ถๆ: 0 ๅฎกๆนไธญ๏ผ1 ๅฎกๆน้่ฟ๏ผ2 ๅฎกๆนๆช้่ฟ', NULL, '2022-09-26 18:13:52', NULL, '2022-09-26 18:13:52', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (27, '1001', '่ๅ็ฑปๅ', 'sys_menu_type', 'int', NULL, '่ๅๅ็ฑป', NULL, '2022-09-29 09:46:43', NULL, '2022-09-29 16:34:34', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (28, '1001', '่ๅๆๅผๆนๅผ', 'sys_menu_target', 'string', NULL, NULL, NULL, '2022-09-29 17:23:02', NULL, '2022-09-29 17:48:16', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (30, '1002', 'ๆฐๆฎๆดๆฐ้ข็', 'biz_data_update_frequency', 'int', NULL, NULL, 'admin', '2022-10-10 14:47:49', 'admin', '2022-10-10 14:54:46', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (31, '1001', 'ไปปๅกๅ็ฑป', 'sys_task_category', 'string', NULL, '111', 'admin', '2022-10-31 15:43:53', 'admin', '2022-10-31 15:43:53', 0);
INSERT INTO `t_dict` (`id`, `category_code`, `name`, `code`, `data_type`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (32, '1001', 'ไปปๅก็ถๆ', 'sys_task_status', 'int', NULL, 'ๅฎๆถไปปๅก็ถๆ', 'admin', '2022-10-31 16:57:35', 'admin', '2022-10-31 16:57:35', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `t_dict_item`;
CREATE TABLE `t_dict_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dict_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅญๅธ็ผ็?',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅฏไธ็ผ็?',
  `value` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅญๅธ้กนๅผ',
  `sort` int DEFAULT NULL COMMENT 'ๆๅบ',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆ่ฟฐ',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅๅปบ่',
  `create_time` datetime DEFAULT NULL COMMENT 'ๅๅปบๆถ้ด',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆดๆฐ่',
  `update_time` datetime DEFAULT NULL COMMENT 'ๆดๆฐๆถ้ด',
  `del_flag` tinyint DEFAULT '0' COMMENT 'ๅ?้คๆ?ๅฟ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=510 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='ๅญๅธ้กน่กจ';

-- ----------------------------
-- Records of t_dict_item
-- ----------------------------
BEGIN;
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1, 'sys_yes_or_no', 'true', 'ๆฏ', 98, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (2, 'sys_yes_or_no', 'false', 'ๅฆ', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (3, 'sys_user_status', '0', 'ๆญฃๅธธ', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (4, 'sys_user_status', '1', '็ฆ็จ', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (52, 'sys_dict_category', '1003', 'ๅทฅไฝๆต', 99, NULL, 'admin', '2022-10-19 09:31:41', 'admin', '2022-10-19 09:31:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (53, 'sys_dict_category', '1001', '็ณป็ปๅ็ฑป', 99, 'asdf ', NULL, NULL, 'admin', '2022-05-29 19:28:38', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (54, 'sys_dict_category', '1002', 'ไธๅกๅ็ฑป', 99, NULL, NULL, NULL, 'admin', '2022-05-29 19:28:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (57, 'sys_response_header', 'X-Frame-Options', 'SAMEORIGIN', 99, 'ๆฏๅฆๅฏไปฅๅจiframeๆพ็คบ่งๅพ๏ผ DENY=ไธๅฏไปฅ | SAMEORIGIN=ๅๅไธๅฏไปฅ | ALLOW-FROM uri=ๆๅฎๅๅไธๅฏไปฅ', NULL, NULL, 'admin', '2022-10-10 11:20:22', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (58, 'sys_response_header', 'X-XSS-Protection', '1; mode=block', 99, 'ๆฏๅฆๅฏ็จๆต่งๅจ้ป่ฎคXSS้ฒๆค๏ผ 0=็ฆ็จ | 1=ๅฏ็จ | 1; mode=block ๅฏ็จ, ๅนถๅจๆฃๆฅๅฐXSSๆปๅปๆถ๏ผๅๆญขๆธฒๆ้กต้ข', NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (59, 'sys_response_header', 'X-Content-Type-Options', 'nosniff', 99, '็ฆ็จๆต่งๅจๅๅฎนๅๆข', NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (60, 'sys_response_header', 'Server', 'Server', 99, 'ๆๅกๅจๅ็งฐ', NULL, NULL, 'admin', '2022-06-06 22:11:56', 1);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (76, 'sys_data_type', 'int', 'ๆฐๅญ', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (77, 'sys_data_type', 'string', 'ๅญ็ฌฆไธฒ', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (78, 'sys_data_type', 'boolean', 'ๅธๅฐ', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (81, 'sys_operation_log_type', 'add', 'ๆฐๅข', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (82, 'sys_operation_log_type', 'delete', 'ๅ?้ค', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (83, 'sys_operation_log_type', 'update', 'ไฟฎๆน', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (84, 'sys_operation_log_type', 'query', 'ๆฅ่ฏข', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (86, 'sys_login_type', '0', '็ปๅฝ', 99, '็ปๅฝ', 'admin', '2022-04-16 16:52:40', 'admin', '2022-04-16 16:52:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (87, 'sys_login_type', '1', '้ๅบ', 99, '้ๅบ', 'admin', '2022-04-16 16:52:54', 'admin', '2022-04-16 16:52:54', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (93, 'sys_config_category', 'system', '็ณป็ป้็ฝฎ', 99, NULL, 'admin', '2022-05-03 10:26:10', 'admin', '2022-05-03 10:28:32', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (94, 'sys_response_header', 'Access-Control-Allow-Origin', '*', 99, NULL, NULL, NULL, 'admin', '2022-07-25 18:35:52', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (95, 'sys_response_header', 'Access-Control-Allow-Methods', 'GET,POST', 99, NULL, NULL, NULL, 'admin', '2022-10-10 11:21:27', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (96, 'sys_response_header', 'Access-Control-Allow-Headers', '*', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (97, 'sys_response_header', 'Access-Control-Max-Age', '3600', 99, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (98, 'sys_login_type', '2', '่ขซ่ธขไธ็บฟ', 99, '่ขซ่ธขไธ็บฟ', 'admin', '2022-05-19 23:52:41', 'admin', '2022-05-19 23:52:41', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (99, 'sys_login_type', '3', '่ขซ้กถไธ็บฟ', 99, '่ขซ้กถไธ็บฟ', 'admin', '2022-05-19 23:52:51', 'admin', '2022-05-19 23:52:51', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (100, 'sys_login_type', '4', '่ขซ้ๅฎ', 99, '่ขซ้ๅฎ', 'admin', '2022-05-19 23:53:00', 'admin', '2022-05-19 23:53:00', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (101, 'sys_login_type', '5', '่งฃ้ค้ๅฎ', 99, '่งฃ้ค้ๅฎ', 'admin', '2022-05-19 23:53:08', 'admin', '2022-05-19 23:53:08', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (105, 'sys_operation_log_type', 'export', 'ๅฏผๅบ', 99, NULL, 'admin', '2022-06-03 23:44:05', 'admin', '2022-06-03 23:44:05', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (107, 'sys_http_allow_method', 'get', 'get', 99, NULL, 'admin', '2022-06-22 09:42:46', 'admin', '2022-06-22 09:42:46', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (108, 'sys_http_allow_method', 'post', 'post', 99, NULL, 'admin', '2022-06-22 09:42:58', 'admin', '2022-06-22 09:42:58', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (111, 'sys_enable_disable', '0', 'ๅฏ็จ', 99, NULL, 'admin', '2022-07-18 17:45:32', 'admin', '2022-07-18 17:45:32', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (112, 'sys_enable_disable', '1', '็ฆ็จ', 99, NULL, 'admin', '2022-07-18 17:45:38', 'admin', '2022-07-18 17:45:38', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (113, 'sys_module', '่ๅ็ฎก็', '่ๅ็ฎก็', 99, NULL, 'admin', '2022-07-19 11:22:19', 'admin', '2022-07-19 11:22:19', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (114, 'sys_module', 'ๅบ็จ็ฎก็', 'ๅบ็จ็ฎก็', 99, NULL, 'admin', '2022-07-19 11:22:35', 'admin', '2022-07-19 11:22:35', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (115, 'sys_module', '้็ฝฎ็ฎก็', '้็ฝฎ็ฎก็', 99, NULL, 'admin', '2022-07-19 11:22:46', 'admin', '2022-07-19 11:22:46', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (116, 'sys_module', 'ๅญๅธ็ฎก็', 'ๅญๅธ็ฎก็', 99, NULL, 'admin', '2022-07-19 11:22:54', 'admin', '2022-07-19 11:22:54', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (117, 'sys_module', 'ๆฅๅฟ็ฎก็', 'ๆฅๅฟ็ฎก็', 99, NULL, 'admin', '2022-07-19 11:23:10', 'admin', '2022-07-19 11:26:25', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (118, 'sys_module', '้็ฅๅฌๅ', '้็ฅๅฌๅ', 99, NULL, 'admin', '2022-07-19 11:23:31', 'admin', '2022-07-19 11:23:31', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (120, 'sys_module', '็ป็ป็ฎก็', '็ป็ป็ฎก็', 99, NULL, 'admin', '2022-07-19 11:23:46', 'admin', '2022-07-19 11:23:46', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (121, 'sys_module', '่ไฝ็ฎก็', '่ไฝ็ฎก็', 99, NULL, 'admin', '2022-07-19 11:23:54', 'admin', '2022-07-19 11:23:54', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (122, 'sys_module', '่ง่ฒ็ฎก็', '่ง่ฒ็ฎก็', 99, NULL, 'admin', '2022-07-19 11:24:07', 'admin', '2022-07-19 11:24:07', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (123, 'sys_module', '็ณป็ป็ๆง', '็ณป็ป็ๆง', 99, NULL, 'admin', '2022-07-19 11:24:23', 'admin', '2022-07-19 11:24:23', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (124, 'sys_module', 'ๅฎๆถไปปๅก', 'ๅฎๆถไปปๅก', 99, NULL, 'admin', '2022-07-19 11:24:31', 'admin', '2022-07-19 11:24:31', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (125, 'sys_module', '็จๆท็ฎก็', '็จๆท็ฎก็', 99, NULL, 'admin', '2022-07-19 11:26:02', 'admin', '2022-07-19 11:26:02', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (143, 'biz_data_directory_type', '0', 'ๆถๅบๆฐๆฎ', 99, NULL, NULL, NULL, 'admin', '2022-09-21 09:23:40', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (144, 'biz_data_directory_type', '1', 'ๅณ็ณป่กจ', 99, NULL, NULL, NULL, 'admin', '2022-09-21 09:23:26', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (145, 'biz_major', '0', 'ๆๆ', 99, NULL, NULL, NULL, 'admin', '2022-10-20 09:52:20', 1);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (146, 'biz_major', '1', 'ๅไผ', 99, NULL, NULL, NULL, 'admin', '2022-09-20 18:40:54', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (147, 'biz_major', '2', 'ๅจ่ฝ', 99, NULL, NULL, NULL, 'admin', '2022-09-20 18:40:46', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (148, 'biz_major', '3', '็ซ็ต', 99, NULL, NULL, NULL, 'admin', '2022-09-20 18:36:37', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (149, 'biz_major', '4', '้ฃ็ต', 99, NULL, NULL, NULL, 'admin', '2022-09-20 18:39:31', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (151, 'wf_approve_status', '0', 'ๅฎกๆนไธญ', 99, NULL, NULL, '2022-09-26 18:15:52', 'admin', '2022-09-26 18:15:52', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (152, 'wf_approve_status', '1', '้่ฟ', 99, NULL, NULL, '2022-09-26 18:16:06', 'admin', '2022-09-26 18:16:06', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (153, 'wf_approve_status', '2', 'ๆช้่ฟ', 99, NULL, NULL, '2022-09-26 18:16:18', 'admin', '2022-09-26 18:16:18', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (154, 'sys_config_category', 'test', 'test', 99, NULL, NULL, '2022-09-28 14:38:32', 'admin', '2022-09-28 14:38:32', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (155, 'sys_menu_type', '0', '็ฎๅฝ', 99, '็ฎๅฝ', NULL, '2022-09-29 09:47:16', 'admin', '2022-09-29 09:47:16', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (156, 'sys_menu_type', '1', '่ๅ', 99, '่ๅ', NULL, '2022-09-29 09:47:27', 'admin', '2022-09-29 09:47:27', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (157, 'sys_menu_type', '2', 'ๆ้ฎ', 99, 'ๆ้ฎ', NULL, '2022-09-29 09:47:36', 'admin', '2022-09-29 09:47:36', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (158, 'sys_menu_target', '_component', '็ปไปถ', 99, NULL, NULL, '2022-09-29 17:24:04', 'admin', '2022-09-29 17:24:04', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (159, 'sys_menu_target', '_self', 'ๅ้พ', 99, NULL, NULL, '2022-09-29 17:24:28', 'admin', '2022-09-29 17:24:28', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (160, 'sys_menu_target', '_blank', 'ๅค้พ', 99, 'ๅค้พ', NULL, '2022-10-02 18:03:24', 'admin', '2022-10-02 18:03:24', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (161, 'sys_menu_target', '_none', 'ๆ?', 99, NULL, NULL, '2022-09-29 17:24:44', 'admin', '2022-09-29 17:24:44', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (162, 'biz_data_update_frequency', '0', '5็ง', 99, NULL, 'admin', '2022-10-25 15:42:39', 'admin', '2022-10-25 15:55:31', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (163, 'biz_data_update_frequency', '1', '20็ง', 99, NULL, 'admin', '2022-10-25 15:42:54', 'admin', '2022-10-25 15:55:20', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (164, 'sys_task_category', 'test', 'test', 99, 'test', 'admin', '2022-10-31 15:44:30', 'admin', '2022-10-31 15:44:30', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (165, 'sys_task_status', '0', '่ฟ่กไธญ', 99, NULL, 'admin', '2022-10-31 16:57:54', 'admin', '2022-10-31 16:57:54', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (166, 'sys_task_status', '1', 'ๆๅไธญ', 99, NULL, 'admin', '2022-10-31 16:58:02', 'admin', '2022-10-31 16:58:02', 0);
INSERT INTO `t_dict_item` (`id`, `dict_code`, `code`, `value`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (167, 'sys_task_category', 'system', '็ณป็ปไปปๅก', 99, NULL, 'admin', '2022-10-31 23:17:38', 'admin', '2022-10-31 23:17:38', 0);
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
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '็จๆทๅ',
  `type` tinyint DEFAULT NULL COMMENT '็ปๅฝ็ฑปๅ๏ผ0็ปๅฝ๏ผ1้ๅบ',
  `datetime` datetime DEFAULT NULL COMMENT '็ปๅฝๆถ้ด',
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '็ปๅฝip',
  `browser` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆต่งๅจ',
  `os` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆไฝ็ณป็ป',
  `success` tinyint DEFAULT NULL COMMENT 'ๆฏๅฆๆๅ',
  `error_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '้่ฏฏไฟกๆฏ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_login_log
-- ----------------------------
BEGIN;
INSERT INTO `t_login_log` (`id`, `username`, `type`, `datetime`, `ip`, `browser`, `os`, `success`, `error_message`) VALUES (1, 'admin', 0, '2022-11-02 15:02:22', '127.0.0.1', 'Chrome', 'OSX', 0, '่ดฆๅทไธๅฏ็?ไธๅน้!');
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
INSERT INTO `t_login_log` (`id`, `username`, `type`, `datetime`, `ip`, `browser`, `os`, `success`, `error_message`) VALUES (14, 'admin', 0, '2022-11-04 16:04:56', '127.0.0.1', 'Chrome', 'OSX', 1, NULL);
INSERT INTO `t_login_log` (`id`, `username`, `type`, `datetime`, `ip`, `browser`, `os`, `success`, `error_message`) VALUES (15, 'admin', 1, '2022-11-04 16:05:03', '127.0.0.1', 'Chrome', 'OSX', 1, NULL);
INSERT INTO `t_login_log` (`id`, `username`, `type`, `datetime`, `ip`, `browser`, `os`, `success`, `error_message`) VALUES (16, 'admin', 0, '2022-11-04 16:29:06', '127.0.0.1', 'Chrome', 'OSX', 1, NULL);
INSERT INTO `t_login_log` (`id`, `username`, `type`, `datetime`, `ip`, `browser`, `os`, `success`, `error_message`) VALUES (17, 'admin', 1, '2022-11-04 16:34:41', '127.0.0.1', 'Chrome', 'OSX', 1, NULL);
INSERT INTO `t_login_log` (`id`, `username`, `type`, `datetime`, `ip`, `browser`, `os`, `success`, `error_message`) VALUES (18, 'admin', 3, '2022-11-06 13:45:51', '127.0.0.1', 'Chrome', 'OSX', 1, NULL);
INSERT INTO `t_login_log` (`id`, `username`, `type`, `datetime`, `ip`, `browser`, `os`, `success`, `error_message`) VALUES (19, 'admin', 0, '2022-11-06 13:45:49', '127.0.0.1', 'Chrome', 'OSX', 0, 'Tokenๅทฒ่ขซ้กถไธ็บฟ๏ผ753d637c-bb48-49fb-9ee1-d092268d0c58');
INSERT INTO `t_login_log` (`id`, `username`, `type`, `datetime`, `ip`, `browser`, `os`, `success`, `error_message`) VALUES (20, 'admin', 0, '2022-11-06 13:45:50', '127.0.0.1', 'Chrome', 'OSX', 1, NULL);
INSERT INTO `t_login_log` (`id`, `username`, `type`, `datetime`, `ip`, `browser`, `os`, `success`, `error_message`) VALUES (21, 'admin', 3, '2022-11-06 13:45:56', '127.0.0.1', 'Chrome', 'OSX', 1, NULL);
INSERT INTO `t_login_log` (`id`, `username`, `type`, `datetime`, `ip`, `browser`, `os`, `success`, `error_message`) VALUES (22, 'admin', 0, '2022-11-06 13:45:56', '127.0.0.1', 'Chrome', 'OSX', 1, NULL);
INSERT INTO `t_login_log` (`id`, `username`, `type`, `datetime`, `ip`, `browser`, `os`, `success`, `error_message`) VALUES (23, 'admin', 1, '2022-11-06 13:46:00', '127.0.0.1', 'Chrome', 'OSX', 1, NULL);
INSERT INTO `t_login_log` (`id`, `username`, `type`, `datetime`, `ip`, `browser`, `os`, `success`, `error_message`) VALUES (24, 'admin', 0, '2022-11-06 13:46:06', '127.0.0.1', 'Chrome', 'OSX', 1, NULL);
INSERT INTO `t_login_log` (`id`, `username`, `type`, `datetime`, `ip`, `browser`, `os`, `success`, `error_message`) VALUES (25, 'admin', 1, '2022-11-06 14:38:41', '127.0.0.1', 'Chrome', 'OSX', 1, NULL);
INSERT INTO `t_login_log` (`id`, `username`, `type`, `datetime`, `ip`, `browser`, `os`, `success`, `error_message`) VALUES (26, 'admin', 0, '2022-11-07 11:23:58', '127.0.0.1', 'Chrome', 'OSX', 1, NULL);
INSERT INTO `t_login_log` (`id`, `username`, `type`, `datetime`, `ip`, `browser`, `os`, `success`, `error_message`) VALUES (27, 'admin', 0, '2022-11-07 11:51:47', '127.0.0.1', 'Chrome', 'OSX', 1, NULL);
INSERT INTO `t_login_log` (`id`, `username`, `type`, `datetime`, `ip`, `browser`, `os`, `success`, `error_message`) VALUES (28, 'admin', 0, '2022-11-07 12:08:29', '127.0.0.1', 'Chrome', 'OSX', 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL COMMENT '็ถid',
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '่ๅ็ฑปๅ',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '่ๅๅ็งฐ',
  `path` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '่ทฏ็ฑๅฐๅ',
  `component` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅ็ซฏvue็ปไปถ',
  `permission` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆ้็?',
  `icon` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅพๆ?',
  `url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅๅค้พ่ฎฟ้ฎๅฐๅ',
  `target` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆๅผๆนๅผ',
  `show` tinyint DEFAULT NULL COMMENT 'ๆฏๅฆๅฑ็คบ',
  `sort` int DEFAULT NULL COMMENT 'ๆๅบ',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆ่ฟฐ',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅๅปบ่',
  `create_time` datetime DEFAULT NULL COMMENT 'ๅๅปบๆถ้ด',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆดๆฐ่',
  `update_time` datetime DEFAULT NULL COMMENT 'ๆดๆฐๆถ้ด',
  `del_flag` tinyint DEFAULT '0' COMMENT 'ๅ?้คๆ?ๅฟ',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_permission` (`permission`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='่ๅ่กจ';

-- ----------------------------
-- Records of t_menu
-- ----------------------------
BEGIN;
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1, 0, '0', '็ณป็ป็ฎก็', NULL, 'RouteView', NULL, 'icon-setting', NULL, '_component', 1, 10, NULL, 'admin', '2022-05-05 16:17:34', 'admin', '2022-10-20 09:41:34', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (2, 1, '1', '็ป็ป็ฎก็', '/org', 'system/org/Org', NULL, 'icon-Report', NULL, '_component', 1, 2, NULL, 'admin', '2022-05-05 16:19:53', 'admin', '2022-05-06 19:17:24', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (3, 1, '1', '่ไฝ็ฎก็', '/position', 'system/org/Position', NULL, 'icon-Report', NULL, '_component', 1, 2, NULL, 'admin', '2022-05-05 16:20:32', NULL, '2022-10-02 21:33:34', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (4, 1, '1', '็จๆท็ฎก็', '/user', 'system/permission/User', NULL, 'icon-Report', NULL, '_component', 1, 2, NULL, 'admin', '2022-05-05 16:20:54', 'admin', '2022-05-09 10:08:17', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (5, 1, '1', '่ง่ฒ็ฎก็', '/role', 'system/permission/Role', NULL, 'icon-Report', NULL, '_component', 1, 4, NULL, 'admin', '2022-05-05 16:21:12', 'admin', '2022-05-09 10:09:12', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (6, 1, '1', '่ๅ็ฎก็', '/menu', 'system/permission/Menu', NULL, 'icon-Report', NULL, '_component', 1, 6, NULL, 'admin', '2022-05-05 16:21:34', 'admin', '2022-05-09 10:08:06', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (7, 1, '1', 'ๅญๅธ็ฎก็', '/dict', 'system/dict/Dict', NULL, 'icon-Report', NULL, '_component', 1, 99, 'ๅญๅธ็ฎก็', NULL, '2022-10-02 18:52:10', NULL, '2022-10-02 18:52:24', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (8, 1, '1', '็ณป็ป้็ฝฎ', '/config', 'system/config/Config', NULL, 'icon-Report', NULL, '_component', 1, 99, '้็ฝฎ็ฎก็', NULL, '2022-10-02 18:52:52', 'admin', '2022-10-05 01:08:34', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (9, 0, '0', '็ณป็ป็ๆง', '', 'PageView', NULL, 'icon-Report', '', '_component', 1, 11, '็ณป็ป็ๆง', NULL, '2022-10-02 18:53:18', 'admin', '2022-10-20 09:41:08', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (10, 9, '1', 'ๆๅก็ๆง', '/monitor', 'Iframe', NULL, 'icon-Report', '/api/druid', '_self', 1, 99, 'druid ๆๅก็ๆง', NULL, '2022-10-02 18:54:30', NULL, '2022-10-02 18:54:30', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (11, 9, '1', 'ๅจ็บฟ็จๆท', '/user/online', 'system/permission/UserOnline', NULL, 'icon-Report', NULL, '_component', 1, 99, NULL, NULL, '2022-10-02 18:55:12', NULL, '2022-10-02 19:14:24', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (12, 0, '0', 'ๆฅๅฟ็ฎก็', NULL, 'PageView', NULL, 'icon-appstore', '', '_component', 1, 12, 'ๆฅๅฟ็ฎก็', NULL, '2022-10-02 19:38:39', 'admin', '2022-10-20 09:41:45', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (13, 12, '1', '็ปๅฝๆฅๅฟ', '/log/login', 'system/log/LoginLog', NULL, 'icon-Report', NULL, '_component', 1, 99, '็ปๅฝๆฅๅฟ', NULL, '2022-10-02 19:39:15', NULL, '2022-10-02 19:39:15', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (14, 12, '1', 'ๆไฝๆฅๅฟ', '/log/operation', 'system/log/OperationLog', NULL, 'icon-Report', NULL, '_component', 1, 99, 'ๆไฝๆฅๅฟ', NULL, '2022-10-02 19:39:50', NULL, '2022-10-02 19:39:50', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (15, 0, '1', '้ฆ้กต', '/workbench', 'main/Index', NULL, 'icon-home', NULL, '_component', 1, 0, '้ฆ้กต', NULL, '2022-10-02 19:42:24', 'admin', '2022-10-24 14:19:39', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (16, 2, '2', 'ๆฅ่ฏข็ป็ปๅ่กจ', NULL, NULL, 'org:query', NULL, NULL, '_none', 1, 99, 'ๆฅ่ฏข็ป็ปๅ่กจ', NULL, '2022-10-02 21:03:11', NULL, '2022-10-02 21:10:17', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (17, 2, '2', 'ๆฐๅข็ป็ป', NULL, NULL, 'org:add', NULL, NULL, '_none', 1, 99, 'ๆฐๅข็ป็ป', NULL, '2022-10-02 21:20:13', NULL, '2022-10-02 21:20:23', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (18, 2, '2', 'ๅ?้ค็ป็ป', NULL, NULL, 'org:del', NULL, NULL, '_none', 1, 99, 'ๅ?้ค็ป็ป', NULL, '2022-10-02 21:20:45', NULL, '2022-10-02 21:26:10', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (19, 2, '2', '็ผ่พ็ป็ป', NULL, NULL, 'org:update', NULL, NULL, '_none', 1, 99, '็ผ่พ็ป็ป', NULL, '2022-10-02 21:21:41', NULL, '2022-10-02 21:22:11', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (20, 2, '2', 'ๅฏผๅบ็ป็ปๅ่กจ', NULL, NULL, 'org:export', NULL, NULL, '_none', 1, 99, 'ๅฏผๅบ็ป็ปๅ่กจ', NULL, '2022-10-02 21:22:42', NULL, '2022-10-02 21:22:42', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (21, 3, '2', 'ๆฐๅข่ไฝ', NULL, NULL, 'position:query', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (22, 3, '2', 'ๅ?้ค่ไฝ', NULL, NULL, 'position:add', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (23, 3, '2', '็ผ่พ่ไฝ', NULL, NULL, 'position:del', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (24, 3, '2', 'ๆฅ่ฏข่ไฝๅ่กจ', NULL, NULL, 'position:update', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (25, 3, '2', 'ๅฏผๅบ่ไฝๅ่กจ', NULL, NULL, 'position:export', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', NULL, '2022-10-02 21:36:21', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (26, 4, '2', 'ๆฐๅข็จๆท', NULL, NULL, 'user:query', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (27, 4, '2', 'ๅ?้ค็จๆท', NULL, NULL, 'user:add', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (28, 4, '2', '็ผ่พ็จๆท', NULL, NULL, 'user:del', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (29, 4, '2', 'ๆฅ่ฏข็จๆทๅ่กจ', NULL, NULL, 'user:update', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (30, 4, '2', 'ๅฏผๅบ็จๆทๅ่กจ', NULL, NULL, 'user:export', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', NULL, '2022-10-02 21:36:46', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (31, 5, '2', 'ๆฐๅข่ง่ฒ', NULL, NULL, 'role:query', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (32, 5, '2', 'ๅ?้ค่ง่ฒ', NULL, NULL, 'role:add', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (33, 5, '2', '็ผ่พ่ง่ฒ', NULL, NULL, 'role:del', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (34, 5, '2', 'ๆฅ่ฏข่ง่ฒๅ่กจ', NULL, NULL, 'role:update', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (35, 5, '2', 'ๅฏผๅบ่ง่ฒๅ่กจ', NULL, NULL, 'role:export', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', NULL, '2022-10-02 21:36:58', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (36, 4, '2', 'ๅ้่ง่ฒ', NULL, NULL, 'user:assignRole', NULL, NULL, '_none', 1, 99, 'ๅ้่ง่ฒ', NULL, '2022-10-02 21:37:42', NULL, '2022-10-02 21:37:42', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (37, 4, '2', '้็ฝฎๅฏ็?', NULL, NULL, 'user:resetPassword', NULL, NULL, '_none', 1, 99, '้็ฝฎๅฏ็?', NULL, '2022-10-02 21:38:01', 'admin', '2022-10-04 22:14:04', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (38, 5, '2', 'ๅ้่ๅ', NULL, NULL, 'role:assignMenu', NULL, NULL, '_none', 1, 99, 'ๅ้่ๅ', NULL, '2022-10-02 21:39:03', NULL, '2022-10-02 21:39:03', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (39, 6, '2', 'ๆฐๅข่ๅ', NULL, NULL, 'menu:query', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (40, 6, '2', 'ๅ?้ค่ๅ', NULL, NULL, 'menu:add', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (41, 6, '2', '็ผ่พ่ๅ', NULL, NULL, 'menu:del', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (42, 6, '2', 'ๆฅ่ฏข่ๅๅ่กจ', NULL, NULL, 'menu:update', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (43, 6, '2', 'ๅฏผๅบ่ๅๅ่กจ', NULL, NULL, 'menu:export', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (44, 7, '2', 'ๆฐๅขๅญๅธ', NULL, NULL, 'dict:query', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (45, 7, '2', 'ๅ?้คๅญๅธ', NULL, NULL, 'dict:add', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (46, 7, '2', '็ผ่พๅญๅธ', NULL, NULL, 'dict:del', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (47, 7, '2', 'ๆฅ่ฏขๅญๅธๅ่กจ', NULL, NULL, 'dict:update', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (48, 7, '2', 'ๅฏผๅบๅญๅธๅ่กจ', NULL, NULL, 'dict:export', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (49, 7, '2', 'ๆฐๅขๅญๅธ้กน', NULL, NULL, 'dictItem:query', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (50, 7, '2', 'ๅ?้คๅญๅธ้กน', NULL, NULL, 'dictItem:add', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (51, 7, '2', '็ผ่พๅญๅธ้กน', NULL, NULL, 'dictItem:del', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (52, 7, '2', 'ๆฅ่ฏขๅญๅธ้กนๅ่กจ', NULL, NULL, 'dictItem:update', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (53, 7, '2', 'ๅฏผๅบๅญๅธ้กนๅ่กจ', NULL, NULL, 'dictItem:export', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (54, 8, '2', 'ๆฐๅข้็ฝฎ', NULL, NULL, 'config:query', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (55, 8, '2', 'ๅ?้ค้็ฝฎ', NULL, NULL, 'config:add', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (56, 8, '2', '็ผ่พ้็ฝฎ', NULL, NULL, 'config:del', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (57, 8, '2', 'ๆฅ่ฏข้็ฝฎๅ่กจ', NULL, NULL, 'config:update', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (58, 8, '2', 'ๅฏผๅบ้็ฝฎๅ่กจ', NULL, NULL, 'config:export', 'icon-Report', NULL, '_none', 1, 99, NULL, 'admin', '2022-10-01 00:00:00', 'admin', '2022-10-01 00:00:00', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (59, 11, '2', 'ๆฅ่ฏข็จๆทๅ่กจ', NULL, NULL, 'onlineUser:query', NULL, NULL, '_none', 1, 99, 'ๆฅ่ฏขๅจ็บฟๅ่กจ', 'admin', '2022-10-02 21:44:51', 'admin', '2022-10-02 21:45:33', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (60, 11, '2', 'ไธ็บฟ็จๆท', NULL, NULL, 'onlineUser:kickOut', NULL, NULL, '_none', 1, 99, 'ไธ็บฟ็จๆท', 'admin', '2022-10-02 21:45:18', 'admin', '2022-10-02 21:45:18', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (61, 13, '2', 'ๆฅ่ฏข็ปๅฝๆฅๅฟๅ่กจ', NULL, NULL, 'loginLog:query', NULL, NULL, '_none', 1, 99, 'ๆฅ่ฏข็ปๅฝๆฅๅฟๅ่กจ', 'admin', '2022-10-02 23:45:37', 'admin', '2022-10-02 23:55:26', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (62, 13, '2', 'ๅ?้ค็ปๅฝๆฅๅฟ', NULL, NULL, 'loginLog:del', NULL, NULL, '_none', 1, 99, 'ๅ?้ค็ปๅฝๆฅๅฟ', 'admin', '2022-10-02 23:55:43', 'admin', '2022-10-02 23:56:01', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (63, 13, '2', 'ๅฏผๅบ็ปๅฝๆฅๅฟๅ่กจ', NULL, NULL, 'loginLog:export', NULL, NULL, '_none', 1, 99, 'ๅฏผๅบ็ปๅฝๆฅๅฟๅ่กจ', 'admin', '2022-10-03 00:11:33', 'admin', '2022-10-03 00:12:16', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (64, 14, '2', 'ๆฅ่ฏขๆไฝๆฅๅฟๅ่กจ', NULL, NULL, 'operationLog:query', NULL, NULL, '_none', 1, 99, 'ๆฅ่ฏขๆไฝๆฅๅฟๅ่กจ', 'admin', '2022-10-03 00:12:10', 'admin', '2022-10-03 00:12:10', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (65, 14, '2', 'ๅ?้คๆไฝๆฅๅฟ', NULL, NULL, 'operationLog:del', NULL, NULL, '_none', 1, 99, 'ๅ?้คๆไฝๆฅๅฟ', 'admin', '2022-10-03 00:12:37', 'admin', '2022-10-03 00:12:37', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (66, 14, '2', 'ๅฏผๅบๆไฝๆฅๅฟๅ่กจ', NULL, NULL, 'operationLog:export', NULL, NULL, '_none', 1, 99, 'ๅฏผๅบๆไฝๆฅๅฟๅ่กจ', 'admin', '2022-10-03 00:13:02', 'admin', '2022-10-03 00:13:02', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (67, 0, '0', 'ๅทฅไฝๆต', NULL, 'PageView', NULL, 'icon-branches', '', '_component', 0, 5, 'ๅทฅไฝๆต', 'admin', '2022-10-05 19:59:20', 'admin', '2022-10-25 18:35:32', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (68, 67, '1', 'ๆต็จๅฎไน', '/process/definition', 'system/workflow/ProcessDefinition', NULL, 'icon-Report', NULL, '_component', 1, 99, NULL, 'admin', '2022-10-05 20:00:20', 'admin', '2022-10-05 20:00:34', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (69, 0, '1', 'ๆฐๆฎ็ฎก็', '/data/directory/mgt', 'main/dataDirectory/DataDirectory', NULL, 'icon-Report', NULL, '_component', 1, 1, 'ๆฐๆฎ็ฎก็', 'admin', '2022-10-05 20:01:16', 'admin', '2022-10-20 09:40:31', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (70, 0, '1', 'ๆฐๆฎ็ฎๅฝ', '/data/directory', 'main/DataDirectory', NULL, 'icon-Report', NULL, '_component', 1, 3, 'ๆฐๆฎ็ฎๅฝ', 'admin', '2022-10-05 20:02:07', 'admin', '2022-10-25 18:38:52', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (71, 0, '0', 'ๆ็ไปปๅก', NULL, 'PageView', NULL, 'icon-Report', '', '_component', 1, 5, 'ๆ็ไปปๅก', 'admin', '2022-10-05 20:02:39', 'admin', '2022-10-25 18:38:39', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (72, 0, '1', 'ๆ็็ณ่ฏท', '/apply', 'main/TaskApply', NULL, 'icon-Report', NULL, '_component', 1, 4, 'ๆ็็ณ่ฏท', 'admin', '2022-10-05 20:03:06', 'admin', '2022-10-25 18:38:59', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (73, 71, '1', 'ๆ็ๅพๅ', '/workflow/task/todo', 'system/workflow/TaskTodo', NULL, 'icon-Report', NULL, '_component', 1, 99, 'ๆ็ๅพๅ', 'admin', '2022-10-05 20:03:30', 'admin', '2022-10-05 20:03:30', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (74, 71, '1', 'ๆ็ๅทฒๅ', '/workflow/task/done', 'system/workflow/TaskDone', NULL, 'icon-Report', NULL, '_component', 1, 99, 'ๆ็ๅทฒๅ', 'admin', '2022-10-05 20:03:51', 'admin', '2022-10-05 20:13:57', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (75, 67, '1', '่ฎพ่ฎกๅจ', '/process/designer', 'system/workflow/ProcessDesigner', NULL, 'icon-Report', NULL, '_component', 1, 99, '่ฎพ่ฎกๅจ', 'admin', '2022-10-05 20:04:22', 'admin', '2022-10-05 20:07:42', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (76, 0, '1', 'ๆฅๅฃ็ฎก็', '/interface', 'main/interface/Interface', NULL, 'icon-Report', NULL, '_component', 1, 2, 'ๆฅๅฃ็ฎก็', 'admin', '2022-10-25 14:07:42', 'admin', '2022-10-25 18:38:23', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (77, 0, '1', 'ๅฎๆถไปปๅก', '/task', 'system/task/Task', NULL, 'icon-Report', NULL, '_component', 1, 99, NULL, 'admin', '2022-10-28 17:35:14', 'admin', '2022-10-28 17:38:07', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (78, 77, '2', 'ๆฅ่ฏขไปปๅกๅ่กจ', NULL, NULL, 'task:query', NULL, NULL, '_none', 1, 99, '', 'admin', '2022-10-28 17:49:44', 'admin', '2022-10-31 15:41:01', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (79, 77, '2', '็ผ่พไปปๅก', NULL, NULL, 'task:update', NULL, NULL, '_none', 1, 99, NULL, 'admin', '2022-10-31 17:07:12', 'admin', '2022-10-31 17:07:12', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (80, 77, '2', 'ๆฐๅขไปปๅก', NULL, NULL, 'task:add', NULL, NULL, '_none', 1, 99, NULL, 'admin', '2022-10-31 17:07:44', 'admin', '2022-10-31 17:07:44', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (81, 77, '2', 'ๅ?้คไปปๅก', NULL, NULL, 'task:del', NULL, NULL, '_none', 1, 99, NULL, 'admin', '2022-10-31 17:08:02', 'admin', '2022-10-31 17:08:02', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (82, 77, '2', 'ๅฏผๅบไปปๅกๅ่กจ', NULL, NULL, 'task:export', NULL, NULL, '_none', 1, 99, NULL, 'admin', '2022-10-31 17:08:20', 'admin', '2022-10-31 17:08:20', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (83, 77, '2', 'ๆง่กไปปๅก', NULL, NULL, 'task:execute', NULL, NULL, '_none', 1, 99, NULL, 'admin', '2022-11-01 16:44:44', 'admin', '2022-11-01 16:44:44', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (84, 77, '2', 'ๅฏๅจไปปๅก', NULL, NULL, 'task:start', NULL, NULL, '_none', 1, 99, NULL, 'admin', '2022-11-01 16:59:40', 'admin', '2022-11-01 16:59:40', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (85, 77, '2', 'ๆๅไปปๅก', NULL, NULL, 'task:stop', NULL, NULL, '_none', 1, 99, NULL, 'admin', '2022-11-01 16:59:54', 'admin', '2022-11-01 16:59:54', 0);
INSERT INTO `t_menu` (`id`, `parent_id`, `type`, `name`, `path`, `component`, `permission`, `icon`, `url`, `target`, `show`, `sort`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (86, 12, '1', 'ไปปๅกๆฅๅฟ', '/log/task', 'system/task/TaskLog', NULL, 'icon-Report', NULL, '_component', 1, 99, NULL, 'admin', '2022-11-07 11:57:09', 'admin', '2022-11-07 11:57:09', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `t_operation_log`;
CREATE TABLE `t_operation_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ไธป้ฎid',
  `module` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆจกๅ',
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆไฝ็ฑปๅ',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆไฝไบบ',
  `datetime` datetime DEFAULT NULL COMMENT 'ๆไฝๆถ้ด',
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'ๆไฝ่ฏฆๆ',
  `path` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '่ฏทๆฑ่ทฏๅพ',
  `method` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '่ฏทๆฑๆนๆณ',
  `remote_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ipๅฐๅ',
  `browser` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆต่งๅจ',
  `os` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆไฝ็ณป็ป',
  `class_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '็ฑปๅ',
  `method_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆนๆณๅ',
  `params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'ๅๆฐ',
  `result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '่ฟๅ็ปๆ',
  `process_time` int DEFAULT NULL COMMENT 'ๆง่กๆถ้ฟ',
  `success` tinyint DEFAULT NULL COMMENT 'ๆๅๅคฑ่ดฅ',
  `error_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '้่ฏฏไฟกๆฏ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_datetime` (`datetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_operation_log
-- ----------------------------
BEGIN;
INSERT INTO `t_operation_log` (`id`, `module`, `type`, `username`, `datetime`, `detail`, `path`, `method`, `remote_ip`, `browser`, `os`, `class_name`, `method_name`, `params`, `result`, `process_time`, `success`, `error_message`) VALUES (1, 'ๆฅๅฃ็ฎก็', 'update', 'admin', '2022-11-02 15:05:30', 'ๆดๆฐไบๆฅๅฃ[null].', '/api/interface/update', 'POST', '127.0.0.1', 'Chrome', 'OSX', 'com.rainy.dmplatfrom.controller.InterfaceController', 'update', '[Interface(id=null, name=null, code=null, description=null, status=0, totalCount=2, avgResponseTime=32, totalDataSize=286)]', NULL, 3, 1, NULL);
INSERT INTO `t_operation_log` (`id`, `module`, `type`, `username`, `datetime`, `detail`, `path`, `method`, `remote_ip`, `browser`, `os`, `class_name`, `method_name`, `params`, `result`, `process_time`, `success`, `error_message`) VALUES (2, 'ๆฅๅฃ็ฎก็', 'update', 'admin', '2022-11-02 15:05:31', 'ๆดๆฐไบๆฅๅฃ[null].', '/api/interface/update', 'POST', '127.0.0.1', 'Chrome', 'OSX', 'com.rainy.dmplatfrom.controller.InterfaceController', 'update', '[Interface(id=null, name=null, code=null, description=null, status=0, totalCount=1, avgResponseTime=22, totalDataSize=60)]', NULL, 1, 1, NULL);
INSERT INTO `t_operation_log` (`id`, `module`, `type`, `username`, `datetime`, `detail`, `path`, `method`, `remote_ip`, `browser`, `os`, `class_name`, `method_name`, `params`, `result`, `process_time`, `success`, `error_message`) VALUES (3, 'ๆฅๅฃ็ฎก็', 'update', 'admin', '2022-11-02 15:05:34', 'ๆดๆฐไบๆฅๅฃ[null].', '/api/interface/update', 'POST', '127.0.0.1', 'Chrome', 'OSX', 'com.rainy.dmplatfrom.controller.InterfaceController', 'update', '[Interface(id=null, name=null, code=null, description=null, status=1, totalCount=2, avgResponseTime=32, totalDataSize=286)]', NULL, 1, 1, NULL);
INSERT INTO `t_operation_log` (`id`, `module`, `type`, `username`, `datetime`, `detail`, `path`, `method`, `remote_ip`, `browser`, `os`, `class_name`, `method_name`, `params`, `result`, `process_time`, `success`, `error_message`) VALUES (4, 'ๆฅๅฃ็ฎก็', 'update', 'admin', '2022-11-02 15:05:34', 'ๆดๆฐไบๆฅๅฃ[null].', '/api/interface/update', 'POST', '127.0.0.1', 'Chrome', 'OSX', 'com.rainy.dmplatfrom.controller.InterfaceController', 'update', '[Interface(id=null, name=null, code=null, description=null, status=1, totalCount=1, avgResponseTime=22, totalDataSize=60)]', NULL, 1, 1, NULL);
INSERT INTO `t_operation_log` (`id`, `module`, `type`, `username`, `datetime`, `detail`, `path`, `method`, `remote_ip`, `browser`, `os`, `class_name`, `method_name`, `params`, `result`, `process_time`, `success`, `error_message`) VALUES (5, 'ๆฐๆฎ็ฎๅฝ', 'update', 'admin', '2022-11-02 18:18:28', 'ๆดๆฐไบๆฐๆฎ็ฎๅฝ[้ฒ่ฝ่ฟ้ฃๅฒญ].', '/api/dataDirectory/update', 'POST', '127.0.0.1', 'Chrome', 'OSX', 'com.rainy.dmplatfrom.controller.DataDirectoryController', 'update', '[DataDirectory(orgId=2, orgName=ๆฐ่ฝๆบๆ, parentId=1, name=้ฒ่ฝ่ฟ้ฃๅฒญ, code=null, type=0, isDirectory=false, sort=98, description=้ฒ่ฝ่ฟ้ฃๅฒญ้ฃ็ตๅบ, children=null)]', NULL, 170, 1, NULL);
INSERT INTO `t_operation_log` (`id`, `module`, `type`, `username`, `datetime`, `detail`, `path`, `method`, `remote_ip`, `browser`, `os`, `class_name`, `method_name`, `params`, `result`, `process_time`, `success`, `error_message`) VALUES (6, 'ๆฐๆฎ็ฎๅฝ', 'update', 'admin', '2022-11-02 18:19:00', 'ๆดๆฐไบๆฐๆฎ็ฎๅฝ[ๅคฉๆกฅๅฑฑ].', '/api/dataDirectory/update', 'POST', '127.0.0.1', 'Chrome', 'OSX', 'com.rainy.dmplatfrom.controller.DataDirectoryController', 'update', '[DataDirectory(orgId=2, orgName=ๆฐ่ฝๆบๆ, parentId=1, name=ๅคฉๆกฅๅฑฑ, code=null, type=0, isDirectory=false, sort=98, description=ๅคฉๆกฅๅฑฑ้ฃ็ตๅบ, children=null)]', NULL, 5, 1, NULL);
INSERT INTO `t_operation_log` (`id`, `module`, `type`, `username`, `datetime`, `detail`, `path`, `method`, `remote_ip`, `browser`, `os`, `class_name`, `method_name`, `params`, `result`, `process_time`, `success`, `error_message`) VALUES (7, 'ๆฐๆฎ็ฎๅฝ', 'update', 'admin', '2022-11-02 18:19:06', 'ๆดๆฐไบๆฐๆฎ็ฎๅฝ[ๅคง่่ฎก].', '/api/dataDirectory/update', 'POST', '127.0.0.1', 'Chrome', 'OSX', 'com.rainy.dmplatfrom.controller.DataDirectoryController', 'update', '[DataDirectory(orgId=2, orgName=ๆฐ่ฝๆบๆ, parentId=1, name=ๅคง่่ฎก, code=null, type=0, isDirectory=false, sort=99, description=ๅคง่่ฎก้ฃ็ตๅบ, children=null)]', NULL, 8, 1, NULL);
INSERT INTO `t_operation_log` (`id`, `module`, `type`, `username`, `datetime`, `detail`, `path`, `method`, `remote_ip`, `browser`, `os`, `class_name`, `method_name`, `params`, `result`, `process_time`, `success`, `error_message`) VALUES (8, 'ๆฐๆฎ็ฎๅฝ', 'update', 'admin', '2022-11-02 18:19:17', 'ๆดๆฐไบๆฐๆฎ็ฎๅฝ[้้ณ้ฃๅๅจ].', '/api/dataDirectory/update', 'POST', '127.0.0.1', 'Chrome', 'OSX', 'com.rainy.dmplatfrom.controller.DataDirectoryController', 'update', '[DataDirectory(orgId=2, orgName=ๆฐ่ฝๆบๆ, parentId=1, name=้้ณ้ฃๅๅจ, code=null, type=0, isDirectory=false, sort=99, description=null, children=null)]', NULL, 7, 1, NULL);
INSERT INTO `t_operation_log` (`id`, `module`, `type`, `username`, `datetime`, `detail`, `path`, `method`, `remote_ip`, `browser`, `os`, `class_name`, `method_name`, `params`, `result`, `process_time`, `success`, `error_message`) VALUES (9, 'ๆฐๆฎ็ฎๅฝ', 'update', 'admin', '2022-11-02 18:19:25', 'ๆดๆฐไบๆฐๆฎ็ฎๅฝ[็ซ็ตๅ].', '/api/dataDirectory/update', 'POST', '127.0.0.1', 'Chrome', 'OSX', 'com.rainy.dmplatfrom.controller.DataDirectoryController', 'update', '[DataDirectory(orgId=5, orgName=111, parentId=0, name=็ซ็ตๅ, code=null, type=0, isDirectory=true, sort=99, description=็ซ็ตๅ, children=null)]', NULL, 7, 1, NULL);
INSERT INTO `t_operation_log` (`id`, `module`, `type`, `username`, `datetime`, `detail`, `path`, `method`, `remote_ip`, `browser`, `os`, `class_name`, `method_name`, `params`, `result`, `process_time`, `success`, `error_message`) VALUES (10, '็ป็ป็ฎก็', 'update', 'admin', '2022-11-02 18:19:35', 'ๆดๆฐไบ็ป็ป[test].', '/api/org/update', 'POST', '127.0.0.1', 'Chrome', 'OSX', 'com.rainy.system.controller.OrgController', 'update', '[Org(parentId=0, name=test, code=11111, sort=99, description=11, children=null)]', NULL, 2, 1, NULL);
INSERT INTO `t_operation_log` (`id`, `module`, `type`, `username`, `datetime`, `detail`, `path`, `method`, `remote_ip`, `browser`, `os`, `class_name`, `method_name`, `params`, `result`, `process_time`, `success`, `error_message`) VALUES (11, '่ฎพๅค็ฎก็', 'import', 'admin', '2022-11-02 18:20:13', 'ๅฏผๅฅไบ่ฎพๅคๅ่กจ', '/api/devices/import', 'POST', '127.0.0.1', 'Chrome', 'OSX', 'com.rainy.dmplatfrom.controller.DeviceController', 'importExcel', '[org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@6bd979c6]', NULL, 10, 1, 'You need to add dependency of \'poi-ooxml\' to your project, and version >= 4.1.2');
INSERT INTO `t_operation_log` (`id`, `module`, `type`, `username`, `datetime`, `detail`, `path`, `method`, `remote_ip`, `browser`, `os`, `class_name`, `method_name`, `params`, `result`, `process_time`, `success`, `error_message`) VALUES (12, '่ฎพๅค็ฎก็', 'import', 'admin', '2022-11-02 18:21:45', 'ๅฏผๅฅไบ่ฎพๅคๅ่กจ', '/api/devices/import', 'POST', '127.0.0.1', 'Chrome', 'OSX', 'com.rainy.dmplatfrom.controller.DeviceController', 'importExcel', '[org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@4cdb14c1]', NULL, 11684, 1, NULL);
INSERT INTO `t_operation_log` (`id`, `module`, `type`, `username`, `datetime`, `detail`, `path`, `method`, `remote_ip`, `browser`, `os`, `class_name`, `method_name`, `params`, `result`, `process_time`, `success`, `error_message`) VALUES (13, 'ๅฎๆถไปปๅก็ฎก็', 'add', 'admin', '2022-11-07 11:51:52', 'ๆง่กไบๅฎๆถไปปๅก[ๅฎๆถๆๅฐไธๅฅ่ฏ].', '/api/task/execute', 'POST', '127.0.0.1', 'Chrome', 'OSX', 'com.rainy.job.controller.ScheduleTaskController', 'executeTask', '[ScheduleTask(id=1, category=test, name=ๅฎๆถๆๅฐไธๅฅ่ฏ, cron=*/2 * * * * ?, className=com.rainy.job.SampleJob, status=1, description=ๆๅฐไธๅฅ่ฏ)]', NULL, 10, 1, NULL);
INSERT INTO `t_operation_log` (`id`, `module`, `type`, `username`, `datetime`, `detail`, `path`, `method`, `remote_ip`, `browser`, `os`, `class_name`, `method_name`, `params`, `result`, `process_time`, `success`, `error_message`) VALUES (14, '่ๅ็ฎก็', 'add', 'admin', '2022-11-07 11:57:09', 'ๆฐๅขไบ่ๅ[ไปปๅกๆฅๅฟ].', '/api/menu', 'POST', '127.0.0.1', 'Chrome', 'OSX', 'com.rainy.system.controller.MenuController', 'save', '[Menu(parentId=12, name=ไปปๅกๆฅๅฟ, path=/log/task, component=system/task/TaskLog, target=_component, type=1, icon=icon-Report, url=null, permission=null, show=true, sort=99, description=null, children=null)]', NULL, 9, 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_org
-- ----------------------------
DROP TABLE IF EXISTS `t_org`;
CREATE TABLE `t_org` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅ็งฐ',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅฏไธ็ผ็?',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆ่ฟฐ',
  `sort` int DEFAULT NULL COMMENT 'ๆๅบ',
  `create_time` datetime DEFAULT NULL COMMENT 'ๅๅปบๆถ้ด',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅๅปบ่',
  `update_time` datetime DEFAULT NULL COMMENT 'ๆดๆฐๆถ้ด',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆดๆฐ่',
  `del_flag` tinyint DEFAULT '0' COMMENT 'ๅ?้คๆ?ๅฟ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='็ป็ปๆบๆ่กจ';

-- ----------------------------
-- Records of t_org
-- ----------------------------
BEGIN;
INSERT INTO `t_org` (`id`, `parent_id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1, 0, '็ต็ง้ข', 'dky', '็ต็ง้ข', 99, '2022-04-05 17:57:52', 'admin', '2022-10-11 16:57:02', 'admin', 0);
INSERT INTO `t_org` (`id`, `parent_id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (2, 1, 'ๆฐ่ฝๆบๆ', 'xny', 'ๆฐ่ฝๆบๆ', 99, '2022-04-05 17:57:52', 'admin', '2022-10-11 16:57:18', 'admin', 0);
INSERT INTO `t_org` (`id`, `parent_id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (3, 1, '้ๅฑๆ', 'jss', '้ๅฑๆ', 99, '2022-04-10 19:53:58', 'admin', '2022-09-26 17:16:16', NULL, 0);
INSERT INTO `t_org` (`id`, `parent_id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (4, 1, '้็ๆ', 'gls', '้็ๆ', 99, '2022-09-26 17:16:35', NULL, '2022-09-26 17:16:49', NULL, 0);
INSERT INTO `t_org` (`id`, `parent_id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (5, 0, 'test', 'test', '11', 99, '2022-10-21 12:26:51', 'admin', '2022-11-02 18:19:35', 'admin', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_org_user_rel
-- ----------------------------
DROP TABLE IF EXISTS `t_org_user_rel`;
CREATE TABLE `t_org_user_rel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint DEFAULT NULL COMMENT '็ป็ปid',
  `user_id` bigint DEFAULT NULL COMMENT '็จๆทid',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='็ป็ป็จๆทๅณ็ณป่กจ';

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
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '่ไฝๅ็งฐ',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅฏไธ็ผ็?',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆ่ฟฐ',
  `sort` int DEFAULT NULL COMMENT 'ๆๅบ',
  `create_time` datetime DEFAULT NULL COMMENT 'ๅๅปบๆถ้ด',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅๅปบ่',
  `update_time` datetime DEFAULT NULL COMMENT 'ๆดๆฐๆถ้ด',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆดๆฐ่',
  `del_flag` tinyint DEFAULT '0' COMMENT 'ๅ?้คๆ?ๅฟ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_position
-- ----------------------------
BEGIN;
INSERT INTO `t_position` (`id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1, '่ฃไบ้ฟ', 'dsz', '', 99, '2022-04-04 00:02:33', 'admin', '2022-10-25 10:20:46', 'admin', 0);
INSERT INTO `t_position` (`id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (2, 'ๅฏ่ฃไบ้ฟ', 'fdsz', '', 99, '2022-04-04 00:02:44', 'admin', '2022-10-25 10:20:49', 'admin', 0);
INSERT INTO `t_position` (`id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (3, 'ๆฎ้ๅๅทฅ', 'normal', '', 99, '2022-04-04 14:13:18', 'admin', '2022-10-25 10:20:53', 'admin', 0);
INSERT INTO `t_position` (`id`, `name`, `code`, `description`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (4, 'ๆป็', 'zj', '', 99, '2022-04-10 19:54:55', 'admin', '2022-10-25 10:20:55', 'admin', 0);
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
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '่ง่ฒๅ็งฐ',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '่ง่ฒ็?',
  `sort` int DEFAULT NULL COMMENT 'ๆๅบ',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆ่ฟฐ',
  `is_default` tinyint DEFAULT NULL COMMENT 'ๆฏๅฆๆฏ้ป่ฎค่ง่ฒ๏ผ้ป่ฎค่ง่ฒไธ่ฝๅ?้ค',
  `create_time` datetime DEFAULT NULL COMMENT 'ๅๅปบๆถ้ด',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅๅปบ่',
  `update_time` datetime DEFAULT NULL COMMENT 'ๆดๆฐๆถ้ด',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆดๆฐ่',
  `del_flag` tinyint DEFAULT '0' COMMENT 'ๅ?้คๆ?ๅฟ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='่ง่ฒ่กจ';

-- ----------------------------
-- Records of t_role
-- ----------------------------
BEGIN;
INSERT INTO `t_role` (`id`, `name`, `code`, `sort`, `description`, `is_default`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1, '่ถ็บง็ฎก็ๅ', 'role_superAdmin', 99, '่ถ็บง็ฎก็ๅ', 1, '2022-04-26 17:04:04', 'admin', '2022-10-11 16:49:15', 'admin', 0);
INSERT INTO `t_role` (`id`, `name`, `code`, `sort`, `description`, `is_default`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (2, '็ณป็ป็ฎก็ๅ', 'role_admin', 99, 'ๅฏน็ณป็ป่ฟ่ก้็ฝฎ', 1, '2022-04-05 22:44:44', 'admin', '2022-10-02 21:58:27', NULL, 0);
INSERT INTO `t_role` (`id`, `name`, `code`, `sort`, `description`, `is_default`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (3, 'ๅฎก่ฎก็ฎก็ๅ', 'role_audit', 99, 'ๆฅ็ๅ็งๆฅๅฟ', 1, '2022-04-16 17:19:45', 'admin', '2022-10-02 21:58:30', NULL, 0);
INSERT INTO `t_role` (`id`, `name`, `code`, `sort`, `description`, `is_default`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (4, '้ป่ฎค่ง่ฒ', 'role_default', 99, '้ป่ฎค่ง่ฒ', 1, '2022-04-22 16:16:44', 'admin', '2022-09-19 11:49:09', NULL, 0);
INSERT INTO `t_role` (`id`, `name`, `code`, `sort`, `description`, `is_default`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (5, 'ๅฌๅๅๅธๅ', 'role_notice', 99, 'ๅฌๅๅๅธๅ', 0, '2022-05-05 16:07:10', 'admin', '2022-10-25 14:37:23', 'admin', 1);
INSERT INTO `t_role` (`id`, `name`, `code`, `sort`, `description`, `is_default`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (6, 'ๆต่ฏ', 'role_test', 99, 'ๆต่ฏ', 0, '2022-05-05 22:14:19', 'admin', '2022-05-26 21:25:37', 'admin', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_role_data_permission_rel
-- ----------------------------
DROP TABLE IF EXISTS `t_role_data_permission_rel`;
CREATE TABLE `t_role_data_permission_rel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint DEFAULT NULL COMMENT '่ง่ฒid',
  `org_id` bigint DEFAULT NULL COMMENT '่ง่ฒid',
  `half` tinyint DEFAULT NULL COMMENT 'ๆฏๅฆๅๅซๆๆๅญ่ๅ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=958 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='่ง่ฒ่ๅๅณ็ณป่กจ';

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
  `role_id` bigint DEFAULT NULL COMMENT '่ง่ฒid',
  `menu_id` bigint DEFAULT NULL COMMENT '่ๅid',
  `half` tinyint DEFAULT NULL COMMENT 'ๆฏๅฆๅๅซๆๆๅญ่ๅ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='่ง่ฒ่ๅๅณ็ณป่กจ';

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
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '้็ฝฎๅ็งฐ',
  `category` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅ็ฑป็ผ็?',
  `cron` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'cron ่กจ่พพๅผ',
  `class_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'class็ฑปๅ',
  `status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ไปปๅก็ถๆ',
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆ่ฟฐ',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅๅปบ่',
  `create_time` datetime DEFAULT NULL COMMENT 'ๅๅปบๆถ้ด',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆดๆฐ่',
  `update_time` datetime DEFAULT NULL COMMENT 'ๆดๆฐๆถ้ด',
  `del_flag` tinyint DEFAULT '0' COMMENT 'ๅ?้คๆ?ๅฟ',
  PRIMARY KEY (`id`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='้็ฝฎ่กจ';

-- ----------------------------
-- Records of t_task
-- ----------------------------
BEGIN;
INSERT INTO `t_task` (`id`, `name`, `category`, `cron`, `class_name`, `status`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1, 'ๅฎๆถๆๅฐไธๅฅ่ฏ', 'test', '*/2 * * * * ?', 'com.rainy.job.SampleJob', '1', 'ๆๅฐไธๅฅ่ฏ', 'admin', '2022-10-31 17:11:13', 'admin', '2022-11-01 17:01:23', 0);
INSERT INTO `t_task` (`id`, `name`, `category`, `cron`, `class_name`, `status`, `description`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (2, 'ๆธ็ๆฅๅฟ', 'system', '0 0 1 * * ?', 'com.rainy.job.ClearLogTask', '0', 'ๆฏๅคฉๅๆจ1็นๆธ็็ปๅฝๆฅๅฟ๏ผๆไฝๆฅๅฟ', 'admin', '2022-10-31 23:27:44', 'admin', '2022-11-01 17:02:21', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_task_log
-- ----------------------------
DROP TABLE IF EXISTS `t_task_log`;
CREATE TABLE `t_task_log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ไธป้ฎid',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ไปปๅกๅ็งฐ',
  `category` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ไปปๅกๅ็ฑป',
  `class_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'java ็ฑปๅ',
  `datetime` datetime DEFAULT NULL COMMENT 'ๆง่กๆถ้ด',
  `process_time` int DEFAULT NULL COMMENT 'ๆง่กๆถ้ฟ',
  `success` tinyint DEFAULT NULL COMMENT 'ไปปๅก็ถๆ๏ผ0ๆๅ๏ผ1ๅคฑ่ดฅ',
  `error_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '้่ฏฏไฟกๆฏ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='ๅฎๆถไปปๅกๆง่กๆฅๅฟ';

-- ----------------------------
-- Records of t_task_log
-- ----------------------------
BEGIN;
INSERT INTO `t_task_log` (`id`, `name`, `category`, `class_name`, `datetime`, `process_time`, `success`, `error_message`) VALUES (1, 'ๅฎๆถๆๅฐไธๅฅ่ฏ', 'test', 'com.rainy.job.SampleJob', '2022-11-07 11:51:52', 5, 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ไธป้ฎid',
  `org_id` bigint DEFAULT NULL COMMENT '็ป็ปid',
  `position_id` bigint DEFAULT NULL COMMENT '่ไฝid',
  `username` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '็จๆทๅ',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅฏ็?',
  `salt` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆ่ฆ็ฎๆณ็',
  `nick_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅ็งฐ',
  `birthday` date DEFAULT NULL,
  `avatar` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅคดๅ',
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '้ฎ็ฎฑ',
  `telephone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๅบงๆบ',
  `phone_number` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆๆบๅท',
  `status` tinyint DEFAULT '0' COMMENT '็จๆท็ถๆ๏ผ0 ๆชๆฟๆดป๏ผ1 ๆญฃๅธธ',
  `username_expired_time` datetime DEFAULT NULL COMMENT '่ดฆๅท่ฟๆๆถ้ด',
  `password_expired_time` datetime DEFAULT NULL COMMENT 'ๅฏ็?่ฟๆๆถ้ด',
  `login_count` bigint DEFAULT '0' COMMENT '็ปๅฝๆฌกๆฐ',
  `last_login_time` datetime DEFAULT NULL COMMENT 'ๆๅ็ปๅฝๆถ้ด',
  `last_login_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆๅ็ปๅฝip',
  `browser` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆๅ็ปๅฝๆต่งๅจ',
  `os` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ๆๅ็ปๅฝๆไฝ็ณป็ป',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT 'ๅๅปบๆถ้ด',
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT '0' COMMENT 'ๅ?้คๆ?ๅฟ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='็จๆท่กจ';

-- ----------------------------
-- Records of t_user
-- ----------------------------
BEGIN;
INSERT INTO `t_user` (`id`, `org_id`, `position_id`, `username`, `password`, `salt`, `nick_name`, `birthday`, `avatar`, `email`, `telephone`, `phone_number`, `status`, `username_expired_time`, `password_expired_time`, `login_count`, `last_login_time`, `last_login_ip`, `browser`, `os`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1, 1, 1, 'admin', 'Bonc@123', 'admin', '่ถ็บง็ฎก็ๅ', '2022-09-30', '/avatar.jpg', '1@qq.com', '0311-8852588', '13131111311', 0, NULL, NULL, 11, '2022-11-07 12:08:29', '127.0.0.1', 'Chrome', 'OSX', 'admin', '2022-03-29 18:52:44', 'admin', '2022-11-07 12:08:29', 0);
INSERT INTO `t_user` (`id`, `org_id`, `position_id`, `username`, `password`, `salt`, `nick_name`, `birthday`, `avatar`, `email`, `telephone`, `phone_number`, `status`, `username_expired_time`, `password_expired_time`, `login_count`, `last_login_time`, `last_login_ip`, `browser`, `os`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (2, 1, 27, 'system', 'system', 'admin', '็ณป็ป็ฎก็ๅ', '2022-09-01', '/avatar.jpg', '2@qq.com', '0311-8852588', '13131111311', 0, NULL, NULL, 1, '2022-05-05 16:11:38', '127.0.0.1', 'Chrome/97.0.4692.71', 'OSX/10_15_7', 'admin', NULL, 'admin', '2022-10-25 14:56:21', 0);
INSERT INTO `t_user` (`id`, `org_id`, `position_id`, `username`, `password`, `salt`, `nick_name`, `birthday`, `avatar`, `email`, `telephone`, `phone_number`, `status`, `username_expired_time`, `password_expired_time`, `login_count`, `last_login_time`, `last_login_ip`, `browser`, `os`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (3, 1, 28, 'audit', '123456', 'admin', 'ๅฎก่ฎก็ฎก็ๅ', '2022-09-01', '/avatar.jpg', '3@qq.com', '0311-8852588', '13131111311', 0, NULL, NULL, 1, '2022-04-16 17:20:53', '127.0.0.1', 'Chrome/100.0.4896.127', 'Windows 10 or Windows Server 2016/10.0', 'admin', NULL, 'admin', '2022-10-04 21:31:06', 0);
INSERT INTO `t_user` (`id`, `org_id`, `position_id`, `username`, `password`, `salt`, `nick_name`, `birthday`, `avatar`, `email`, `telephone`, `phone_number`, `status`, `username_expired_time`, `password_expired_time`, `login_count`, `last_login_time`, `last_login_ip`, `browser`, `os`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (4, 6, NULL, 'test', 'test', NULL, 'test', '2022-01-01', '/avatar.jpg', '131@qq.com', '0311-8852588', '13131111311', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'admin', '2022-10-02 22:31:51', 'admin', '2022-10-26 10:29:29', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_user_role_rel
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role_rel`;
CREATE TABLE `t_user_role_rel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL COMMENT '็จๆทid',
  `role_id` bigint DEFAULT NULL COMMENT '่ง่ฒid',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='็จๆท่ง่ฒๅณ็ณป่กจ';

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
