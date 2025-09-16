/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80042 (8.0.42)
 Source Host           : localhost:3306
 Source Schema         : ry-cloud

 Target Server Type    : MySQL
 Target Server Version : 80042 (8.0.42)
 File Encoding         : 65001

 Date: 16/09/2025 18:22:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (6, 'we_model', '模特表', NULL, NULL, 'WeModel', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'model', '模特', 'ruoyi', '0', '/', '{\"parentMenuId\":3}', 'admin', '2025-09-14 10:46:14', '', '2025-09-14 11:16:03', NULL);
INSERT INTO `gen_table` VALUES (7, 'we_back', '背景表', NULL, NULL, 'WeBack', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'back', '背景', 'ruoyi', '0', '/', '{\"parentMenuId\":3}', 'admin', '2025-09-14 11:33:41', '', '2025-09-14 15:26:25', NULL);
INSERT INTO `gen_table` VALUES (8, 'we_cloth', '服装表', NULL, NULL, 'WeCloth', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'cloth', '服装', 'ruoyi', '0', '/', '{\"parentMenuId\":3}', 'admin', '2025-09-14 11:33:41', '', '2025-09-14 11:50:40', NULL);
INSERT INTO `gen_table` VALUES (9, 'we_ai_picture', 'AI图片表', NULL, NULL, 'WeAiPicture', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'picture', 'AI图片', 'ruoyi', '0', '/', '{\"parentMenuId\":3}', 'admin', '2025-09-14 15:51:33', '', '2025-09-14 17:37:27', NULL);
INSERT INTO `gen_table` VALUES (11, 'we_look', '外观表', NULL, NULL, 'WeLook', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'look', '外观', 'ruoyi', '0', '/', '{\"parentMenuId\":3}', 'admin', '2025-09-14 16:59:39', '', '2025-09-14 17:02:04', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 158 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (71, 6, 'id', '主键', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, '1', 'EQ', 'input', '', 1, 'admin', '2025-09-14 10:46:14', '', '2025-09-14 11:16:03');
INSERT INTO `gen_table_column` VALUES (72, 6, 'name', '模特名称', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-09-14 10:46:14', '', '2025-09-14 11:16:03');
INSERT INTO `gen_table_column` VALUES (73, 6, 'model_url', '模特文件URL', 'varchar(500)', 'String', 'modelUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2025-09-14 10:46:14', '', '2025-09-14 11:16:03');
INSERT INTO `gen_table_column` VALUES (74, 6, 'model_we_id', '模特ID', 'varchar(100)', 'String', 'modelWeId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-09-14 10:46:14', '', '2025-09-14 11:16:03');
INSERT INTO `gen_table_column` VALUES (75, 6, 'type', '模特类型', 'varchar(50)', 'String', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'brand_type', 5, 'admin', '2025-09-14 10:46:14', '', '2025-09-14 11:16:03');
INSERT INTO `gen_table_column` VALUES (76, 6, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2025-09-14 10:46:14', '', '2025-09-14 11:16:03');
INSERT INTO `gen_table_column` VALUES (77, 6, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2025-09-14 10:46:14', '', '2025-09-14 11:16:03');
INSERT INTO `gen_table_column` VALUES (78, 6, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2025-09-14 10:46:14', '', '2025-09-14 11:16:03');
INSERT INTO `gen_table_column` VALUES (79, 6, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2025-09-14 10:46:14', '', '2025-09-14 11:16:03');
INSERT INTO `gen_table_column` VALUES (80, 6, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2025-09-14 10:46:14', '', '2025-09-14 11:16:03');
INSERT INTO `gen_table_column` VALUES (81, 6, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 11, 'admin', '2025-09-14 10:46:14', '', '2025-09-14 11:16:03');
INSERT INTO `gen_table_column` VALUES (82, 7, 'id', '主键', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, '1', 'EQ', 'input', '', 1, 'admin', '2025-09-14 11:33:41', '', '2025-09-14 15:26:25');
INSERT INTO `gen_table_column` VALUES (83, 7, 'name', '背景名称', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-09-14 11:33:41', '', '2025-09-14 15:26:25');
INSERT INTO `gen_table_column` VALUES (84, 7, 'back_url', '背景图片URL', 'varchar(500)', 'String', 'backUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2025-09-14 11:33:41', '', '2025-09-14 15:26:25');
INSERT INTO `gen_table_column` VALUES (85, 7, 'back_we_id', '背景ID', 'varchar(100)', 'String', 'backWeId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-09-14 11:33:41', '', '2025-09-14 15:26:25');
INSERT INTO `gen_table_column` VALUES (86, 7, 'promot', '背景描述', 'varchar(500)', 'String', 'promot', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2025-09-14 11:33:41', '', '2025-09-14 15:26:25');
INSERT INTO `gen_table_column` VALUES (87, 7, 'type', '背景类型', 'varchar(50)', 'String', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'brand_type', 6, 'admin', '2025-09-14 11:33:41', '', '2025-09-14 15:26:25');
INSERT INTO `gen_table_column` VALUES (88, 7, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2025-09-14 11:33:41', '', '2025-09-14 15:26:25');
INSERT INTO `gen_table_column` VALUES (89, 7, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2025-09-14 11:33:41', '', '2025-09-14 15:26:25');
INSERT INTO `gen_table_column` VALUES (90, 7, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2025-09-14 11:33:41', '', '2025-09-14 15:26:25');
INSERT INTO `gen_table_column` VALUES (91, 7, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2025-09-14 11:33:41', '', '2025-09-14 15:26:25');
INSERT INTO `gen_table_column` VALUES (92, 7, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2025-09-14 11:33:41', '', '2025-09-14 15:26:25');
INSERT INTO `gen_table_column` VALUES (93, 7, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 12, 'admin', '2025-09-14 11:33:41', '', '2025-09-14 15:26:25');
INSERT INTO `gen_table_column` VALUES (94, 8, 'id', '主键', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, '1', 'EQ', 'input', '', 1, 'admin', '2025-09-14 11:33:41', '', '2025-09-14 11:50:40');
INSERT INTO `gen_table_column` VALUES (95, 8, 'name', '服装名称', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-09-14 11:33:41', '', '2025-09-14 11:50:40');
INSERT INTO `gen_table_column` VALUES (96, 8, 'cloth_url', '服装图片URL', 'varchar(500)', 'String', 'clothUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2025-09-14 11:33:41', '', '2025-09-14 11:50:40');
INSERT INTO `gen_table_column` VALUES (97, 8, 'type', '服装类型', 'varchar(50)', 'String', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'brand_type', 4, 'admin', '2025-09-14 11:33:41', '', '2025-09-14 11:50:40');
INSERT INTO `gen_table_column` VALUES (98, 8, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2025-09-14 11:33:41', '', '2025-09-14 11:50:40');
INSERT INTO `gen_table_column` VALUES (99, 8, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2025-09-14 11:33:41', '', '2025-09-14 11:50:40');
INSERT INTO `gen_table_column` VALUES (100, 8, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2025-09-14 11:33:41', '', '2025-09-14 11:50:40');
INSERT INTO `gen_table_column` VALUES (101, 8, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2025-09-14 11:33:41', '', '2025-09-14 11:50:40');
INSERT INTO `gen_table_column` VALUES (102, 8, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2025-09-14 11:33:41', '', '2025-09-14 11:50:40');
INSERT INTO `gen_table_column` VALUES (103, 8, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 10, 'admin', '2025-09-14 11:33:41', '', '2025-09-14 11:50:40');
INSERT INTO `gen_table_column` VALUES (104, 9, 'id', '主键', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, '1', 'EQ', 'input', '', 1, 'admin', '2025-09-14 15:51:33', '', '2025-09-14 17:37:27');
INSERT INTO `gen_table_column` VALUES (105, 9, 'name', '图片名称', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-09-14 15:51:33', '', '2025-09-14 17:37:27');
INSERT INTO `gen_table_column` VALUES (106, 9, 'ai_url', 'AI生成图片URL', 'varchar(500)', 'String', 'aiUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2025-09-14 15:51:33', '', '2025-09-14 17:37:27');
INSERT INTO `gen_table_column` VALUES (107, 9, 'task_id', '任务ID', 'varchar(100)', 'String', 'taskId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-09-14 15:51:33', '', '2025-09-14 17:37:27');
INSERT INTO `gen_table_column` VALUES (108, 9, 'execute_id', '执行ID', 'varchar(100)', 'String', 'executeId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-09-14 15:51:33', '', '2025-09-14 17:37:27');
INSERT INTO `gen_table_column` VALUES (109, 9, 'type', '图片类型', 'varchar(50)', 'String', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'brand_type', 6, 'admin', '2025-09-14 15:51:33', '', '2025-09-14 17:37:27');
INSERT INTO `gen_table_column` VALUES (110, 9, 'look_id', '关联we_look表的主键', 'bigint', 'Long', 'lookId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-09-14 15:51:33', '', '2025-09-14 17:37:27');
INSERT INTO `gen_table_column` VALUES (111, 9, 'look_url', '外观图片URL', 'varchar(500)', 'String', 'lookUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 8, 'admin', '2025-09-14 15:51:33', '', '2025-09-14 17:37:27');
INSERT INTO `gen_table_column` VALUES (112, 9, 'pid', '父id', 'bigint', 'Long', 'pid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2025-09-14 15:51:33', '', '2025-09-14 17:37:28');
INSERT INTO `gen_table_column` VALUES (113, 9, 'data_status', '状态（0,1,2）', 'char(1)', 'String', 'dataStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'we_data_status', 10, 'admin', '2025-09-14 15:51:33', '', '2025-09-14 17:37:28');
INSERT INTO `gen_table_column` VALUES (114, 9, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2025-09-14 15:51:33', '', '2025-09-14 17:37:28');
INSERT INTO `gen_table_column` VALUES (115, 9, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2025-09-14 15:51:33', '', '2025-09-14 17:37:28');
INSERT INTO `gen_table_column` VALUES (116, 9, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2025-09-14 15:51:33', '', '2025-09-14 17:37:28');
INSERT INTO `gen_table_column` VALUES (117, 9, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2025-09-14 15:51:33', '', '2025-09-14 17:37:28');
INSERT INTO `gen_table_column` VALUES (118, 9, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2025-09-14 15:51:33', '', '2025-09-14 17:37:28');
INSERT INTO `gen_table_column` VALUES (119, 9, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 16, 'admin', '2025-09-14 15:51:33', '', '2025-09-14 17:37:28');
INSERT INTO `gen_table_column` VALUES (138, 11, 'id', '主键', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, '1', 'EQ', 'input', '', 1, 'admin', '2025-09-14 16:59:39', '', '2025-09-14 17:02:04');
INSERT INTO `gen_table_column` VALUES (139, 11, 'name', '外观名称', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-09-14 16:59:39', '', '2025-09-14 17:02:04');
INSERT INTO `gen_table_column` VALUES (140, 11, 'look_url', '外观图片URL', 'varchar(500)', 'String', 'lookUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2025-09-14 16:59:39', '', '2025-09-14 17:02:04');
INSERT INTO `gen_table_column` VALUES (141, 11, 'task_id', '任务ID', 'varchar(100)', 'String', 'taskId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-09-14 16:59:39', '', '2025-09-14 17:02:04');
INSERT INTO `gen_table_column` VALUES (142, 11, 'execute_id', '执行ID', 'varchar(100)', 'String', 'executeId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-09-14 16:59:39', '', '2025-09-14 17:02:04');
INSERT INTO `gen_table_column` VALUES (143, 11, 'type', '外观类型', 'varchar(50)', 'String', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'brand_type', 6, 'admin', '2025-09-14 16:59:39', '', '2025-09-14 17:02:04');
INSERT INTO `gen_table_column` VALUES (144, 11, 'model_id', '关联we_model表的主键', 'bigint', 'Long', 'modelId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-09-14 16:59:39', '', '2025-09-14 17:02:04');
INSERT INTO `gen_table_column` VALUES (145, 11, 'model_we_id', '模特ID', 'varchar(100)', 'String', 'modelWeId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2025-09-14 16:59:39', '', '2025-09-14 17:02:04');
INSERT INTO `gen_table_column` VALUES (146, 11, 'model_url', '模特文件URL', 'varchar(500)', 'String', 'modelUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 9, 'admin', '2025-09-14 16:59:39', '', '2025-09-14 17:02:04');
INSERT INTO `gen_table_column` VALUES (147, 11, 'back_id', '关联we_back表的主键', 'bigint', 'Long', 'backId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2025-09-14 16:59:39', '', '2025-09-14 17:02:04');
INSERT INTO `gen_table_column` VALUES (148, 11, 'back_we_id', '背景ID', 'varchar(100)', 'String', 'backWeId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2025-09-14 16:59:39', '', '2025-09-14 17:02:04');
INSERT INTO `gen_table_column` VALUES (149, 11, 'back_url', '背景图片URL', 'varchar(500)', 'String', 'backUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 12, 'admin', '2025-09-14 16:59:39', '', '2025-09-14 17:02:04');
INSERT INTO `gen_table_column` VALUES (150, 11, 'cloth_id', '关联we_cloth表的主键', 'bigint', 'Long', 'clothId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2025-09-14 16:59:39', '', '2025-09-14 17:02:04');
INSERT INTO `gen_table_column` VALUES (151, 11, 'cloth_url', '服装图片URL', 'varchar(500)', 'String', 'clothUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 14, 'admin', '2025-09-14 16:59:39', '', '2025-09-14 17:02:04');
INSERT INTO `gen_table_column` VALUES (152, 11, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2025-09-14 16:59:39', '', '2025-09-14 17:02:04');
INSERT INTO `gen_table_column` VALUES (153, 11, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2025-09-14 16:59:39', '', '2025-09-14 17:02:04');
INSERT INTO `gen_table_column` VALUES (154, 11, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 17, 'admin', '2025-09-14 16:59:39', '', '2025-09-14 17:02:04');
INSERT INTO `gen_table_column` VALUES (155, 11, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 18, 'admin', '2025-09-14 16:59:39', '', '2025-09-14 17:02:04');
INSERT INTO `gen_table_column` VALUES (156, 11, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 19, 'admin', '2025-09-14 16:59:39', '', '2025-09-14 17:02:04');
INSERT INTO `gen_table_column` VALUES (157, 11, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 20, 'admin', '2025-09-14 16:59:39', '', '2025-09-14 17:02:04');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-09-13 16:40:17', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-09-13 16:40:17', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2025-09-13 16:40:17', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2025-09-13 16:40:17', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-09-13 16:40:17', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2025-09-13 16:40:17', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2025-09-13 16:40:17', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-09-13 16:40:16', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-09-13 16:40:16', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-09-13 16:40:16', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-09-13 16:40:16', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-09-13 16:40:16', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-09-13 16:40:16', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-09-13 16:40:16', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-09-13 16:40:16', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-09-13 16:40:16', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-09-13 16:40:16', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '波司登', '1', 'brand_type', NULL, 'success', 'N', '0', 'admin', '2025-09-14 09:48:17', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 2, 'tanni', '2', 'brand_type', NULL, 'primary', 'N', '0', 'admin', '2025-09-14 09:48:31', 'admin', '2025-09-14 09:49:04', NULL);
INSERT INTO `sys_dict_data` VALUES (102, 0, '待审核', '0', 'we_data_status', NULL, 'warning', 'N', '0', 'admin', '2025-09-14 10:42:30', 'admin', '2025-09-14 10:43:43', NULL);
INSERT INTO `sys_dict_data` VALUES (103, 1, '审核通过', '1', 'we_data_status', NULL, 'success', 'N', '0', 'admin', '2025-09-14 10:42:49', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 2, '审核未通过', '2', 'we_data_status', NULL, 'danger', 'N', '0', 'admin', '2025-09-14 10:43:26', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-09-13 16:40:17', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '品牌类型', 'brand_type', '0', 'admin', '2025-09-14 09:45:15', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, 'we数据状态', 'we_data_status', '0', 'admin', '2025-09-14 10:41:43', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2025-09-13 16:40:18', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2025-09-13 16:40:18', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2025-09-13 16:40:18', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示信息',
  `access_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`access_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '0', '登录成功', '2025-09-13 17:11:22');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '0', '登录成功', '2025-09-13 17:11:23');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '0', '退出成功', '2025-09-13 21:56:59');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '0', '登录成功', '2025-09-13 21:57:10');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '0', '登录成功', '2025-09-14 09:28:18');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '0', '登录成功', '2025-09-14 09:28:54');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '0', '退出成功', '2025-09-14 10:08:04');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '0', '登录成功', '2025-09-14 10:08:08');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '0', '退出成功', '2025-09-14 11:04:47');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '0', '登录成功', '2025-09-14 11:04:51');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '0', '登录成功', '2025-09-14 16:04:52');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '0', '退出成功', '2025-09-14 17:20:31');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '0', '登录成功', '2025-09-14 17:20:41');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '0', '退出成功', '2025-09-15 11:35:28');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '0', '登录成功', '2025-09-15 11:35:39');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '0', '退出成功', '2025-09-15 11:45:17');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '0', '登录成功', '2025-09-15 11:45:22');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '0', '登录成功', '2025-09-16 08:44:43');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2030 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-09-13 16:40:16', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2025-09-13 16:40:16', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2025-09-13 16:40:16', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2025-09-13 16:40:16', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-09-13 16:40:16', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-09-13 16:40:16', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-09-13 16:40:16', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2025-09-13 16:40:16', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2025-09-13 16:40:16', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2025-09-13 16:40:16', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2025-09-13 16:40:16', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2025-09-13 16:40:16', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2025-09-13 16:40:16', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-09-13 16:40:16', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2025-09-13 16:40:16', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, 'Sentinel控制台', 2, 3, 'http://localhost:8718', '', '', '', 0, 0, 'C', '0', '0', 'monitor:sentinel:list', 'sentinel', 'admin', '2025-09-13 16:40:16', '', NULL, '流量控制菜单');
INSERT INTO `sys_menu` VALUES (112, 'Nacos控制台', 2, 4, 'http://localhost:8848/nacos', '', '', '', 0, 0, 'C', '0', '0', 'monitor:nacos:list', 'nacos', 'admin', '2025-09-13 16:40:16', '', NULL, '服务治理菜单');
INSERT INTO `sys_menu` VALUES (113, 'Admin控制台', 2, 5, 'http://localhost:9100/login', '', '', '', 0, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-09-13 16:40:16', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2025-09-13 16:40:16', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2025-09-13 16:40:16', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'http://localhost:8080/swagger-ui/index.html', '', '', '', 0, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2025-09-13 16:40:16', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'system/operlog/index', '', '', 1, 0, 'C', '0', '0', 'system:operlog:list', 'form', 'admin', '2025-09-13 16:40:16', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'system/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'system:logininfor:list', 'logininfor', 'admin', '2025-09-13 16:40:16', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:operlog:query', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:operlog:remove', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:operlog:export', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:query', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:remove', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:export', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:unlock', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '模特', 3, 1, 'model', 'system/model/index', NULL, '', 1, 0, 'C', '0', '0', 'system:model:list', '#', 'admin', '2025-09-13 21:50:33', '', NULL, '模特菜单');
INSERT INTO `sys_menu` VALUES (2001, '模特查询', 2000, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:model:query', '#', 'admin', '2025-09-13 21:50:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '模特新增', 2000, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:model:add', '#', 'admin', '2025-09-13 21:50:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '模特修改', 2000, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:model:edit', '#', 'admin', '2025-09-13 21:50:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '模特删除', 2000, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:model:remove', '#', 'admin', '2025-09-13 21:50:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '模特导出', 2000, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:model:export', '#', 'admin', '2025-09-13 21:50:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '服装', 3, 1, 'cloth', 'system/cloth/index', NULL, '', 1, 0, 'C', '0', '0', 'system:cloth:list', '#', 'admin', '2025-09-14 11:52:25', '', NULL, '服装菜单');
INSERT INTO `sys_menu` VALUES (2007, '服装查询', 2006, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:cloth:query', '#', 'admin', '2025-09-14 11:52:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '服装新增', 2006, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:cloth:add', '#', 'admin', '2025-09-14 11:52:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '服装修改', 2006, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:cloth:edit', '#', 'admin', '2025-09-14 11:52:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '服装删除', 2006, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:cloth:remove', '#', 'admin', '2025-09-14 11:52:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '服装导出', 2006, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:cloth:export', '#', 'admin', '2025-09-14 11:52:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '背景', 3, 1, 'back', 'system/back/index', NULL, '', 1, 0, 'C', '0', '0', 'system:back:list', '#', 'admin', '2025-09-14 15:28:04', '', NULL, '背景菜单');
INSERT INTO `sys_menu` VALUES (2013, '背景查询', 2012, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:back:query', '#', 'admin', '2025-09-14 15:28:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '背景新增', 2012, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:back:add', '#', 'admin', '2025-09-14 15:28:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '背景修改', 2012, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:back:edit', '#', 'admin', '2025-09-14 15:28:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '背景删除', 2012, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:back:remove', '#', 'admin', '2025-09-14 15:28:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '背景导出', 2012, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:back:export', '#', 'admin', '2025-09-14 15:28:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, 'look', 3, 1, 'look', 'system/look/index', NULL, '', 1, 0, 'C', '0', '0', 'system:look:list', '#', 'admin', '2025-09-14 15:56:08', '', NULL, '外观菜单');
INSERT INTO `sys_menu` VALUES (2019, '外观查询', 2018, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:look:query', '#', 'admin', '2025-09-14 15:56:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '外观新增', 2018, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:look:add', '#', 'admin', '2025-09-14 15:56:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '外观修改', 2018, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:look:edit', '#', 'admin', '2025-09-14 15:56:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '外观删除', 2018, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:look:remove', '#', 'admin', '2025-09-14 15:56:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '外观导出', 2018, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:look:export', '#', 'admin', '2025-09-14 15:56:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, 'AI图片', 3, 1, 'picture', 'system/picture/index', NULL, '', 1, 0, 'C', '0', '0', 'system:picture:list', '#', 'admin', '2025-09-14 17:40:53', '', NULL, 'AI图片菜单');
INSERT INTO `sys_menu` VALUES (2025, 'AI图片查询', 2024, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:picture:query', '#', 'admin', '2025-09-14 17:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, 'AI图片新增', 2024, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:picture:add', '#', 'admin', '2025-09-14 17:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, 'AI图片修改', 2024, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:picture:edit', '#', 'admin', '2025-09-14 17:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, 'AI图片删除', 2024, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:picture:remove', '#', 'admin', '2025-09-14 17:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, 'AI图片导出', 2024, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:picture:export', '#', 'admin', '2025-09-14 17:40:53', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2025-09-13 16:40:18', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2025-09-13 16:40:18', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 224 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"we_ai_picture,we_back,we_cloth,we_look,we_model\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-13 21:30:46', 735);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"model\",\"className\":\"WeModel\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":59,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-09-13 21:30:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"模特名称\",\"columnId\":60,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-13 21:30:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ModelUrl\",\"columnComment\":\"模特文件URL\",\"columnId\":61,\"columnName\":\"model_url\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-13 21:30:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"modelUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ModelWeId\",\"columnComment\":\"模特ID\",\"columnId\":62,\"columnName\":\"model_we_id\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-13 21:30:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"modelWeId\",\"javaType\":\"String\",\"list\":true,\"params\":{', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-13 21:47:54', 102);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"we_model\"}', NULL, 0, NULL, '2025-09-13 21:48:12', 99);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.genCode()', 'GET', 1, 'admin', NULL, '/gen/genCode/we_model', '127.0.0.1', '', '{}', '{\"msg\":\"【系统预设】不允许生成文件覆盖到本地\",\"code\":500}', 0, NULL, '2025-09-13 21:48:25', 0);
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.genCode()', 'GET', 1, 'admin', NULL, '/gen/genCode/we_model', '127.0.0.1', '', '{}', '{\"msg\":\"【系统预设】不允许生成文件覆盖到本地\",\"code\":500}', 0, NULL, '2025-09-13 21:48:30', 1);
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"we_model\"}', NULL, 0, NULL, '2025-09-13 21:48:35', 58);
INSERT INTO `sys_oper_log` VALUES (106, '模特', 1, 'com.ruoyi.system.controller.WeModelController.add()', 'POST', 1, 'admin', NULL, '/model', '127.0.0.1', '', '{\"createTime\":\"2025-09-13 22:09:35\",\"modelUrl\":\"https://ai-image.weshop.com/20250911_1_3c3602d7-777f-4655-98a1-78e4248a2e6d_1024x1280.png_crop512.jpeg\",\"modelWeId\":\"10000345929\",\"name\":\"bs2\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\r\n### The error may exist in file [C:\\1qianjue\\daima\\RuoYi-Cloud\\ruoyi-modules\\ruoyi-system\\target\\classes\\mapper\\system\\WeModelMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.WeModelMapper.insertWeModel-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into we_model          ( name,             model_url,             model_we_id,                                                                 create_time )           values ( ?,             ?,             ?,                                                                 ? )\r\n### Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\n; Field \'status\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'status\' doesn\'t have a default value', '2025-09-13 22:09:35', 168);
INSERT INTO `sys_oper_log` VALUES (107, '模特', 1, 'com.ruoyi.system.controller.WeModelController.add()', 'POST', 1, 'admin', NULL, '/model', '127.0.0.1', '', '{\"createTime\":\"2025-09-13 22:09:54\",\"delFlag\":\"0\",\"modelUrl\":\"https://ai-image.weshop.com/20250911_1_3c3602d7-777f-4655-98a1-78e4248a2e6d_1024x1280.png_crop512.jpeg\",\"modelWeId\":\"10000345929\",\"name\":\"bs2\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\r\n### The error may exist in file [C:\\1qianjue\\daima\\RuoYi-Cloud\\ruoyi-modules\\ruoyi-system\\target\\classes\\mapper\\system\\WeModelMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.WeModelMapper.insertWeModel-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into we_model          ( name,             model_url,             model_we_id,                                       del_flag,                          create_time )           values ( ?,             ?,             ?,                                       ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\n; Field \'status\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'status\' doesn\'t have a default value', '2025-09-13 22:09:54', 6);
INSERT INTO `sys_oper_log` VALUES (108, '模特', 1, 'com.ruoyi.system.controller.WeModelController.add()', 'POST', 1, 'admin', NULL, '/model', '127.0.0.1', '', '{\"createTime\":\"2025-09-13 22:14:49\",\"id\":1,\"modelUrl\":\"https://ai-image.weshop.com/20250911_1_3c3602d7-777f-4655-98a1-78e4248a2e6d_1024x1280.png_crop512.jpeg\",\"modelWeId\":\"10000345929\",\"name\":\"bs2\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-13 22:14:49', 33);
INSERT INTO `sys_oper_log` VALUES (109, '模特', 5, 'com.ruoyi.system.controller.WeModelController.export()', 'POST', 1, 'admin', NULL, '/model/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-09-13 22:16:38', 5864);
INSERT INTO `sys_oper_log` VALUES (110, '字典类型', 1, 'com.ruoyi.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"品牌类型\",\"dictType\":\"brand_type\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 09:45:16', 30);
INSERT INTO `sys_oper_log` VALUES (111, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"波司登\",\"dictSort\":1,\"dictType\":\"brand_type\",\"dictValue\":\"1\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 09:48:17', 20);
INSERT INTO `sys_oper_log` VALUES (112, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"tanni\",\"dictSort\":2,\"dictType\":\"brand_type\",\"dictValue\":\"2\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 09:48:31', 15);
INSERT INTO `sys_oper_log` VALUES (113, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2025-09-14 09:48:31\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"tanni\",\"dictSort\":2,\"dictType\":\"brand_type\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 09:48:41', 27);
INSERT INTO `sys_oper_log` VALUES (114, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2025-09-14 09:48:31\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"tanni\",\"dictSort\":2,\"dictType\":\"brand_type\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 09:48:50', 21);
INSERT INTO `sys_oper_log` VALUES (115, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2025-09-14 09:48:31\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"tanni\",\"dictSort\":2,\"dictType\":\"brand_type\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 09:48:57', 22);
INSERT INTO `sys_oper_log` VALUES (116, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2025-09-14 09:48:31\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"tanni\",\"dictSort\":2,\"dictType\":\"brand_type\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 09:49:04', 15);
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"model\",\"className\":\"WeModel\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":59,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-09-13 21:30:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2025-09-13 21:47:54\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"模特名称\",\"columnId\":60,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-13 21:30:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2025-09-13 21:47:54\",\"usableColumn\":false},{\"capJavaField\":\"ModelUrl\",\"columnComment\":\"模特文件URL\",\"columnId\":61,\"columnName\":\"model_url\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-13 21:30:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"modelUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2025-09-13 21:47:54\",\"usableColumn\":false},{\"capJavaField\":\"ModelWeId\",\"columnComment\":\"模特ID\",\"columnId\":62,\"columnName\":\"model_we_id\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-13 21:30:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 09:52:11', 232);
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"we_model\"}', NULL, 0, NULL, '2025-09-14 09:52:18', 477);
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"model\",\"className\":\"WeModel\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":59,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-09-13 21:30:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2025-09-14 09:52:11\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"模特名称\",\"columnId\":60,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-13 21:30:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2025-09-14 09:52:11\",\"usableColumn\":false},{\"capJavaField\":\"ModelUrl\",\"columnComment\":\"模特文件URL\",\"columnId\":61,\"columnName\":\"model_url\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-13 21:30:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"modelUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2025-09-14 09:52:11\",\"usableColumn\":false},{\"capJavaField\":\"ModelWeId\",\"columnComment\":\"模特ID\",\"columnId\":62,\"columnName\":\"model_we_id\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-13 21:30:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 10:21:34', 94);
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"we_model\"}', NULL, 0, NULL, '2025-09-14 10:21:52', 149);
INSERT INTO `sys_oper_log` VALUES (121, '字典类型', 1, 'com.ruoyi.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"we数据状态\",\"dictType\":\"we_data_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 10:41:44', 66);
INSERT INTO `sys_oper_log` VALUES (122, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"待审核\",\"dictSort\":0,\"dictType\":\"we_data_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 10:42:30', 37);
INSERT INTO `sys_oper_log` VALUES (123, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"审核通过\",\"dictSort\":1,\"dictType\":\"we_data_status\",\"dictValue\":\"1\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 10:42:49', 33);
INSERT INTO `sys_oper_log` VALUES (124, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"审核未通过\",\"dictSort\":2,\"dictType\":\"we_data_status\",\"dictValue\":\"2\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 10:43:26', 38);
INSERT INTO `sys_oper_log` VALUES (125, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2025-09-14 10:42:30\",\"default\":false,\"dictCode\":102,\"dictLabel\":\"待审核\",\"dictSort\":0,\"dictType\":\"we_data_status\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 10:43:43', 29);
INSERT INTO `sys_oper_log` VALUES (126, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/5,1,2,3,4', '127.0.0.1', '', '[5,1,2,3,4]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 10:45:59', 46);
INSERT INTO `sys_oper_log` VALUES (127, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"we_model\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 10:46:14', 95);
INSERT INTO `sys_oper_log` VALUES (128, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"model\",\"className\":\"WeModel\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":71,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 10:46:14\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"模特名称\",\"columnId\":72,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 10:46:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ModelUrl\",\"columnComment\":\"模特文件URL\",\"columnId\":73,\"columnName\":\"model_url\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 10:46:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"modelUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ModelWeId\",\"columnComment\":\"模特ID\",\"columnId\":74,\"columnName\":\"model_we_id\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 10:46:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"modelWeId\",\"javaType\":\"String\",\"list\":true,\"params\":{', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 10:50:00', 66);
INSERT INTO `sys_oper_log` VALUES (129, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"we_model\"}', NULL, 0, NULL, '2025-09-14 10:50:31', 154);
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"model\",\"className\":\"WeModel\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":71,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 10:46:14\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2025-09-14 10:49:59\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"模特名称\",\"columnId\":72,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 10:46:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2025-09-14 10:49:59\",\"usableColumn\":false},{\"capJavaField\":\"ModelUrl\",\"columnComment\":\"模特文件URL\",\"columnId\":73,\"columnName\":\"model_url\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 10:46:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"modelUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2025-09-14 10:49:59\",\"usableColumn\":false},{\"capJavaField\":\"ModelWeId\",\"columnComment\":\"模特ID\",\"columnId\":74,\"columnName\":\"model_we_id\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 10:46:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 11:01:09', 68);
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"we_model\"}', NULL, 0, NULL, '2025-09-14 11:01:25', 210);
INSERT INTO `sys_oper_log` VALUES (132, '模特', 1, 'com.ruoyi.system.controller.WeModelController.add()', 'POST', 1, 'admin', NULL, '/model', '127.0.0.1', '', '{\"createTime\":\"2025-09-14 11:08:30\",\"id\":1,\"modelUrl\":\"https://ai-image.weshop.com/20250911_1_3c3602d7-777f-4655-98a1-78e4248a2e6d_1024x1280.png_crop512.jpeg\",\"modelWeId\":\"10000345929\",\"name\":\"bs2\",\"params\":{},\"type\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 11:08:31', 168);
INSERT INTO `sys_oper_log` VALUES (133, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"model\",\"className\":\"WeModel\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":71,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 10:46:14\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2025-09-14 11:01:09\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"模特名称\",\"columnId\":72,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 10:46:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2025-09-14 11:01:09\",\"usableColumn\":false},{\"capJavaField\":\"ModelUrl\",\"columnComment\":\"模特文件URL\",\"columnId\":73,\"columnName\":\"model_url\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 10:46:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"modelUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2025-09-14 11:01:09\",\"usableColumn\":false},{\"capJavaField\":\"ModelWeId\",\"columnComment\":\"模特ID\",\"columnId\":74,\"columnName\":\"model_we_id\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 10:46:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 11:13:53', 63);
INSERT INTO `sys_oper_log` VALUES (134, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"we_model\"}', NULL, 0, NULL, '2025-09-14 11:14:06', 133);
INSERT INTO `sys_oper_log` VALUES (135, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"model\",\"className\":\"WeModel\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":71,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 10:46:14\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2025-09-14 11:13:53\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"模特名称\",\"columnId\":72,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 10:46:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2025-09-14 11:13:53\",\"usableColumn\":false},{\"capJavaField\":\"ModelUrl\",\"columnComment\":\"模特文件URL\",\"columnId\":73,\"columnName\":\"model_url\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 10:46:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"modelUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2025-09-14 11:13:53\",\"usableColumn\":false},{\"capJavaField\":\"ModelWeId\",\"columnComment\":\"模特ID\",\"columnId\":74,\"columnName\":\"model_we_id\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 10:46:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 11:16:03', 89);
INSERT INTO `sys_oper_log` VALUES (136, '模特', 2, 'com.ruoyi.system.controller.WeModelController.edit()', 'PUT', 1, 'admin', NULL, '/model', '127.0.0.1', '', '{\"createBy\":\"\",\"createTime\":\"2025-09-14 11:08:30\",\"delFlag\":\"0\",\"id\":1,\"modelUrl\":\"https://ai-image.weshop.com/20250911_1_3c3602d7-777f-4655-98a1-78e4248a2e6d_1024x1280.png_crop512.jpeg\",\"modelWeId\":\"10000345929\",\"name\":\"bs2\",\"params\":{},\"type\":\"2\",\"updateBy\":\"\",\"updateTime\":\"2025-09-14 11:30:51\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 11:30:51', 20);
INSERT INTO `sys_oper_log` VALUES (137, '模特', 2, 'com.ruoyi.system.controller.WeModelController.edit()', 'PUT', 1, 'admin', NULL, '/model', '127.0.0.1', '', '{\"createBy\":\"\",\"createTime\":\"2025-09-14 11:08:30\",\"delFlag\":\"0\",\"id\":1,\"modelUrl\":\"https://ai-image.weshop.com/20250911_1_3c3602d7-777f-4655-98a1-78e4248a2e6d_1024x1280.png_crop512.jpeg\",\"modelWeId\":\"10000345929\",\"name\":\"bs2\",\"params\":{},\"type\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2025-09-14 11:31:01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 11:31:01', 22);
INSERT INTO `sys_oper_log` VALUES (138, '模特', 5, 'com.ruoyi.system.controller.WeModelController.export()', 'POST', 1, 'admin', NULL, '/model/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"type\":\"2\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-09-14 11:31:26', 6924);
INSERT INTO `sys_oper_log` VALUES (139, '模特', 5, 'com.ruoyi.system.controller.WeModelController.export()', 'POST', 1, 'admin', NULL, '/model/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-09-14 11:31:38', 147);
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"we_back,we_cloth\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 11:33:41', 96);
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"cloth\",\"className\":\"WeCloth\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":94,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 11:33:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"服装名称\",\"columnId\":95,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 11:33:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ClothUrl\",\"columnComment\":\"服装图片URL\",\"columnId\":96,\"columnName\":\"cloth_url\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 11:33:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"clothUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"服装类型\",\"columnId\":97,\"columnName\":\"type\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 11:33:41\",\"dictType\":\"brand_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"type\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 11:50:40', 53);
INSERT INTO `sys_oper_log` VALUES (142, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"we_cloth\"}', NULL, 0, NULL, '2025-09-14 11:51:41', 155);
INSERT INTO `sys_oper_log` VALUES (143, '服装', 1, 'com.ruoyi.system.controller.WeClothController.add()', 'POST', 1, 'admin', NULL, '/cloth', '127.0.0.1', '', '{\"clothUrl\":\"blob:https://tcn7ub31uhhl.feishu.cn/0bd4a603-5042-442b-b202-55cb48827e5f\",\"createTime\":\"2025-09-14 15:04:42\",\"id\":1,\"name\":\"bsd4\",\"params\":{},\"type\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 15:04:47', 373);
INSERT INTO `sys_oper_log` VALUES (144, '服装', 2, 'com.ruoyi.system.controller.WeClothController.edit()', 'PUT', 1, 'admin', NULL, '/cloth', '127.0.0.1', '', '{\"clothUrl\":\"https://tcn7ub31uhhl.feishu.cn/0bd4a603-5042-442b-b202-55cb48827e5f\",\"createBy\":\"\",\"createTime\":\"2025-09-14 15:04:43\",\"delFlag\":\"0\",\"id\":1,\"name\":\"bsd4\",\"params\":{},\"type\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2025-09-14 15:08:22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 15:08:22', 78);
INSERT INTO `sys_oper_log` VALUES (145, '服装', 2, 'com.ruoyi.system.controller.WeClothController.edit()', 'PUT', 1, 'admin', NULL, '/cloth', '127.0.0.1', '', '{\"clothUrl\":\"https://internal-api-drive-stream.feishu.cn/space/api/box/stream/download/preview/J9m2bzq0Vo6X82xhW57c0cd7nkb/?preview_type=16\",\"createBy\":\"\",\"createTime\":\"2025-09-14 15:04:43\",\"delFlag\":\"0\",\"id\":1,\"name\":\"bsd4\",\"params\":{},\"type\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2025-09-14 15:09:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 15:09:24', 69);
INSERT INTO `sys_oper_log` VALUES (146, '服装', 2, 'com.ruoyi.system.controller.WeClothController.edit()', 'PUT', 1, 'admin', NULL, '/cloth', '127.0.0.1', '', '{\"clothUrl\":\"C:\\\\1qianjue\\\\test\\\\bsd4.jpg\",\"createBy\":\"\",\"createTime\":\"2025-09-14 15:04:43\",\"delFlag\":\"0\",\"id\":1,\"name\":\"bsd4\",\"params\":{},\"type\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2025-09-14 15:18:23\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 15:18:23', 68);
INSERT INTO `sys_oper_log` VALUES (147, '服装', 2, 'com.ruoyi.system.controller.WeClothController.edit()', 'PUT', 1, 'admin', NULL, '/cloth', '127.0.0.1', '', '{\"clothUrl\":\"C:\\\\\\\\1qianjue\\\\\\\\test\\\\\\\\bsd4.jpg\",\"createBy\":\"\",\"createTime\":\"2025-09-14 15:04:43\",\"delFlag\":\"0\",\"id\":1,\"name\":\"bsd4\",\"params\":{},\"type\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2025-09-14 15:18:40\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 15:18:40', 24);
INSERT INTO `sys_oper_log` VALUES (148, '服装', 2, 'com.ruoyi.system.controller.WeClothController.edit()', 'PUT', 1, 'admin', NULL, '/cloth', '127.0.0.1', '', '{\"clothUrl\":\"https://www.weshop.com/_next/image?url=https%3A%2F%2Fai-image.weshop.com%2F20250914_1_0aa2229d-c481-4390-8c9d-b2b3b3ae79d5_800x800.jpg&w=828&q=75\",\"createBy\":\"\",\"createTime\":\"2025-09-14 15:04:43\",\"delFlag\":\"0\",\"id\":1,\"name\":\"bsd4\",\"params\":{},\"type\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2025-09-14 15:20:49\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 15:20:50', 98);
INSERT INTO `sys_oper_log` VALUES (149, '服装', 5, 'com.ruoyi.system.controller.WeClothController.export()', 'POST', 1, 'admin', NULL, '/cloth/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-09-14 15:21:35', 14868);
INSERT INTO `sys_oper_log` VALUES (150, '服装', 5, 'com.ruoyi.system.controller.WeClothController.export()', 'POST', 1, 'admin', NULL, '/cloth/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-09-14 15:21:51', 140);
INSERT INTO `sys_oper_log` VALUES (151, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"back\",\"className\":\"WeBack\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":82,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 11:33:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"背景名称\",\"columnId\":83,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 11:33:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BackUrl\",\"columnComment\":\"背景图片URL\",\"columnId\":84,\"columnName\":\"back_url\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 11:33:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"backUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BackWeId\",\"columnComment\":\"背景ID\",\"columnId\":85,\"columnName\":\"back_we_id\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 11:33:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"backWeId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":f', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 15:26:25', 154);
INSERT INTO `sys_oper_log` VALUES (152, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"we_back\"}', NULL, 0, NULL, '2025-09-14 15:26:54', 419);
INSERT INTO `sys_oper_log` VALUES (153, '背景', 1, 'com.ruoyi.system.controller.WeBackController.add()', 'POST', 1, 'admin', NULL, '/back', '127.0.0.1', '', '{\"backUrl\":\"https://ai-image.weshop.com/20250911_1_b52b9ed0-37f1-495e-b0bc-1b37f3e9d689_848x1280.png\",\"backWeId\":\"10000345954\",\"createTime\":\"2025-09-14 15:43:05\",\"id\":1,\"name\":\"bsd1\",\"params\":{},\"promot\":\"模特的姿态展现出一种动态而自信的行走姿态，身体微微前倾，重心略向前移，表现出在雪地中稳健前行的动感。她的右腿向前跨出，膝盖微屈，脚掌稳稳踩在积雪上，留下清晰的足迹；左腿则自然向后伸展，保持平衡。双臂自然摆动，右手略微前伸，左手向后摆动，增强了行走时的协调感与节奏感。整体姿态流畅自然，透露出一种从容不迫、适应寒冷环境的优雅与力量感。她的头部略微抬起，目光坚定地望向前方，体现出专注与探索的神情，仿佛正迈向未知的雪域深处。整个姿态不仅展现了运动中的美感，也传递出与自然和谐共处的从容气质。\",\"type\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 15:43:08', 528);
INSERT INTO `sys_oper_log` VALUES (154, '背景', 5, 'com.ruoyi.system.controller.WeBackController.export()', 'POST', 1, 'admin', NULL, '/back/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-09-14 15:49:38', 16606);
INSERT INTO `sys_oper_log` VALUES (155, '背景', 5, 'com.ruoyi.system.controller.WeBackController.export()', 'POST', 1, 'admin', NULL, '/back/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-09-14 15:49:38', 456);
INSERT INTO `sys_oper_log` VALUES (156, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"we_look,we_ai_picture\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 15:51:33', 340);
INSERT INTO `sys_oper_log` VALUES (157, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"look\",\"className\":\"WeLook\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":120,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 15:51:33\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"外观名称\",\"columnId\":121,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 15:51:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"LookUrl\",\"columnComment\":\"外观图片URL\",\"columnId\":122,\"columnName\":\"look_url\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 15:51:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"lookUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TaskId\",\"columnComment\":\"任务ID\",\"columnId\":123,\"columnName\":\"task_id\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 15:51:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"taskId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":f', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 15:54:26', 201);
INSERT INTO `sys_oper_log` VALUES (158, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"we_look\"}', NULL, 0, NULL, '2025-09-14 15:55:10', 448);
INSERT INTO `sys_oper_log` VALUES (159, '模特', 2, 'com.ruoyi.system.controller.WeModelController.edit()', 'PUT', 1, 'admin', NULL, '/model', '127.0.0.1', '', '{\"createBy\":\"\",\"createTime\":\"2025-09-14 11:08:30\",\"delFlag\":\"0\",\"id\":1,\"modelUrl\":\"https://ai-image.weshop.com/20250911_1_3c3602d7-777f-4655-98a1-78e4248a2e6d_1024x1280.png_crop512.jpeg\",\"modelWeId\":\"10000345929\",\"name\":\"model2\",\"params\":{},\"type\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2025-09-14 16:39:20\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 16:39:20', 126);
INSERT INTO `sys_oper_log` VALUES (160, '服装', 2, 'com.ruoyi.system.controller.WeClothController.edit()', 'PUT', 1, 'admin', NULL, '/cloth', '127.0.0.1', '', '{\"clothUrl\":\"https://www.weshop.com/_next/image?url=https%3A%2F%2Fai-image.weshop.com%2F20250914_1_0aa2229d-c481-4390-8c9d-b2b3b3ae79d5_800x800.jpg&w=828&q=75\",\"createBy\":\"\",\"createTime\":\"2025-09-14 15:04:43\",\"delFlag\":\"0\",\"id\":1,\"name\":\"cloth4\",\"params\":{},\"type\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2025-09-14 16:39:37\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 16:39:37', 78);
INSERT INTO `sys_oper_log` VALUES (161, '背景', 2, 'com.ruoyi.system.controller.WeBackController.edit()', 'PUT', 1, 'admin', NULL, '/back', '127.0.0.1', '', '{\"backUrl\":\"https://ai-image.weshop.com/20250911_1_b52b9ed0-37f1-495e-b0bc-1b37f3e9d689_848x1280.png\",\"backWeId\":\"10000345954\",\"createBy\":\"\",\"createTime\":\"2025-09-14 15:43:06\",\"delFlag\":\"0\",\"id\":1,\"name\":\"back1\",\"params\":{},\"promot\":\"模特的姿态展现出一种动态而自信的行走姿态，身体微微前倾，重心略向前移，表现出在雪地中稳健前行的动感。她的右腿向前跨出，膝盖微屈，脚掌稳稳踩在积雪上，留下清晰的足迹；左腿则自然向后伸展，保持平衡。双臂自然摆动，右手略微前伸，左手向后摆动，增强了行走时的协调感与节奏感。整体姿态流畅自然，透露出一种从容不迫、适应寒冷环境的优雅与力量感。她的头部略微抬起，目光坚定地望向前方，体现出专注与探索的神情，仿佛正迈向未知的雪域深处。整个姿态不仅展现了运动中的美感，也传递出与自然和谐共处的从容气质。\",\"type\":\"1\",\"updateBy\":\"\",\"updateTime\":\"2025-09-14 16:39:54\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 16:39:54', 81);
INSERT INTO `sys_oper_log` VALUES (162, '外观', 1, 'com.ruoyi.system.controller.WeLookController.generateData()', 'POST', 1, 'admin', NULL, '/look/generateData', '127.0.0.1', '', '', '{\"msg\":\"生成成功，共新增1条数据\",\"code\":200}', 0, NULL, '2025-09-14 16:48:10', 29268);
INSERT INTO `sys_oper_log` VALUES (163, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/10', '127.0.0.1', '', '[10]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 16:59:31', 83);
INSERT INTO `sys_oper_log` VALUES (164, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"we_look\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 16:59:39', 238);
INSERT INTO `sys_oper_log` VALUES (165, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"look\",\"className\":\"WeLook\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":138,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 16:59:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"外观名称\",\"columnId\":139,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 16:59:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"LookUrl\",\"columnComment\":\"外观图片URL\",\"columnId\":140,\"columnName\":\"look_url\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 16:59:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"lookUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TaskId\",\"columnComment\":\"任务ID\",\"columnId\":141,\"columnName\":\"task_id\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 16:59:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"taskId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":f', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 17:02:04', 191);
INSERT INTO `sys_oper_log` VALUES (166, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"we_look\"}', NULL, 0, NULL, '2025-09-14 17:02:45', 433);
INSERT INTO `sys_oper_log` VALUES (167, '外观', 1, 'com.ruoyi.system.controller.WeLookController.generateData()', 'POST', 1, 'admin', NULL, '/look/generateData', '127.0.0.1', '', '', '{\"msg\":\"生成成功，共新增1条数据\",\"code\":200}', 0, NULL, '2025-09-14 17:21:03', 197);
INSERT INTO `sys_oper_log` VALUES (168, '外观', 1, 'com.ruoyi.system.controller.WeLookController.generateData()', 'POST', 1, 'admin', NULL, '/look/generateData', '127.0.0.1', '', '', '{\"msg\":\"生成成功，共新增0条数据\",\"code\":200}', 0, NULL, '2025-09-14 17:24:57', 2631);
INSERT INTO `sys_oper_log` VALUES (169, '外观', 1, 'com.ruoyi.system.controller.WeLookController.generateData()', 'POST', 1, 'admin', NULL, '/look/generateData', '127.0.0.1', '', '', '{\"msg\":\"生成成功，共新增0条数据\",\"code\":200}', 0, NULL, '2025-09-14 17:24:57', 11065);
INSERT INTO `sys_oper_log` VALUES (170, '外观', 3, 'com.ruoyi.system.controller.WeLookController.remove()', 'DELETE', 1, 'admin', NULL, '/look/1', '127.0.0.1', '', '[1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 17:25:02', 63);
INSERT INTO `sys_oper_log` VALUES (171, '外观', 1, 'com.ruoyi.system.controller.WeLookController.generateData()', 'POST', 1, 'admin', NULL, '/look/generateData', '127.0.0.1', '', '', '{\"msg\":\"生成成功，共新增1条数据\",\"code\":200}', 0, NULL, '2025-09-14 17:25:11', 5047);
INSERT INTO `sys_oper_log` VALUES (172, '外观', 5, 'com.ruoyi.system.controller.WeLookController.export()', 'POST', 1, 'admin', NULL, '/look/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-09-14 17:26:41', 11677);
INSERT INTO `sys_oper_log` VALUES (173, '外观', 5, 'com.ruoyi.system.controller.WeLookController.export()', 'POST', 1, 'admin', NULL, '/look/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-09-14 17:26:41', 231);
INSERT INTO `sys_oper_log` VALUES (174, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"picture\",\"className\":\"WeAiPicture\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":104,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 15:51:33\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"图片名称\",\"columnId\":105,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 15:51:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AiUrl\",\"columnComment\":\"AI生成图片URL\",\"columnId\":106,\"columnName\":\"ai_url\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 15:51:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"aiUrl\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TaskId\",\"columnComment\":\"任务ID\",\"columnId\":107,\"columnName\":\"task_id\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-09-14 15:51:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"taskId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-14 17:37:28', 188);
INSERT INTO `sys_oper_log` VALUES (175, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"we_ai_picture\"}', NULL, 0, NULL, '2025-09-14 17:39:00', 169);
INSERT INTO `sys_oper_log` VALUES (176, '外观', 2, 'com.ruoyi.system.controller.WeLookController.generateLooks()', 'POST', 1, 'admin', NULL, '/look/generateLooks', '127.0.0.1', '', '[2]', '{\"msg\":\"任务已提交，正在后台处理\",\"code\":200}', 0, NULL, '2025-09-14 20:52:59', 29462);
INSERT INTO `sys_oper_log` VALUES (177, '外观', 2, 'com.ruoyi.system.controller.WeLookController.generateLooks()', 'POST', 1, 'admin', NULL, '/look/generateLooks', '127.0.0.1', '', '[2]', '{\"msg\":\"任务已提交，正在后台处理\",\"code\":200}', 0, NULL, '2025-09-14 20:53:41', 24695);
INSERT INTO `sys_oper_log` VALUES (178, '外观', 2, 'com.ruoyi.system.controller.WeLookController.generateLooks()', 'POST', 1, 'admin', NULL, '/look/generateLooks', '127.0.0.1', '', '[2]', '{\"msg\":\"任务已提交，正在后台处理\",\"code\":200}', 0, NULL, '2025-09-14 20:55:11', 75953);
INSERT INTO `sys_oper_log` VALUES (179, '外观', 2, 'com.ruoyi.system.controller.WeLookController.generateLooks()', 'POST', 1, 'admin', NULL, '/look/generateLooks', '127.0.0.1', '', '[2]', '{\"msg\":\"任务已提交，正在后台处理\",\"code\":200}', 0, NULL, '2025-09-14 21:02:13', 26376);
INSERT INTO `sys_oper_log` VALUES (180, '外观', 2, 'com.ruoyi.system.controller.WeLookController.generateLooks()', 'POST', 1, 'admin', NULL, '/look/generateLooks', '127.0.0.1', '', '[2]', '{\"msg\":\"任务已提交，正在后台处理\",\"code\":200}', 0, NULL, '2025-09-14 21:08:35', 365905);
INSERT INTO `sys_oper_log` VALUES (181, '外观', 2, 'com.ruoyi.system.controller.WeLookController.generateLooks()', 'POST', 1, 'admin', NULL, '/look/generateLooks', '127.0.0.1', '', '[2]', '{\"msg\":\"任务已提交，正在后台处理\",\"code\":200}', 0, NULL, '2025-09-15 10:36:40', 259);
INSERT INTO `sys_oper_log` VALUES (182, '外观', 2, 'com.ruoyi.system.controller.WeLookController.generateAiImage()', 'POST', 1, 'admin', NULL, '/look/generateAiImage', '127.0.0.1', '', '[2]', '{\"msg\":\"AI图片生成任务已提交，正在后台处理\",\"code\":200}', 0, NULL, '2025-09-15 11:45:52', 20277);
INSERT INTO `sys_oper_log` VALUES (183, '外观', 2, 'com.ruoyi.system.controller.WeLookController.generateAiImage()', 'POST', 1, 'admin', NULL, '/look/generateAiImage', '127.0.0.1', '', '[2]', '{\"msg\":\"AI图片生成任务已提交，正在后台处理\",\"code\":200}', 0, NULL, '2025-09-15 13:06:22', 18572);
INSERT INTO `sys_oper_log` VALUES (184, '外观', 2, 'com.ruoyi.system.controller.WeLookController.generateAiImage()', 'POST', 1, 'admin', NULL, '/look/generateAiImage', '127.0.0.1', '', '[2]', '{\"msg\":\"AI图片生成任务已提交，正在后台处理\",\"code\":200}', 0, NULL, '2025-09-15 13:07:10', 25299);
INSERT INTO `sys_oper_log` VALUES (185, 'AI图片', 1, 'com.ruoyi.system.controller.WeAiPictureController.add()', 'POST', 1, 'admin', NULL, '/picture', '127.0.0.1', '', '{\"createTime\":\"2025-09-15 15:33:29\",\"dataStatus\":\"0\",\"id\":1,\"lookId\":2,\"lookUrl\":\"https://ai-image.weshop.com/20250911_1_73896607-735a-4ddf-8802-db99b6ca902e_528x758.png\",\"name\":\"cloth4+model2+back1\",\"params\":{},\"type\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-15 15:33:30', 83);
INSERT INTO `sys_oper_log` VALUES (186, 'AI图片', 5, 'com.ruoyi.system.controller.WeAiPictureController.export()', 'POST', 1, 'admin', NULL, '/picture/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-09-15 15:38:54', 3719);
INSERT INTO `sys_oper_log` VALUES (187, '外观', 5, 'com.ruoyi.system.controller.WeLookController.export()', 'POST', 1, 'admin', NULL, '/look/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-09-15 19:37:55', 2907);
INSERT INTO `sys_oper_log` VALUES (188, 'AI图片', 5, 'com.ruoyi.system.controller.WeAiPictureController.export()', 'POST', 1, 'admin', NULL, '/picture/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-09-15 19:38:18', 4750);
INSERT INTO `sys_oper_log` VALUES (189, '外观', 1, 'com.ruoyi.system.controller.WeLookController.generateData()', 'POST', 1, 'admin', NULL, '/look/generateData', '127.0.0.1', '', '', '{\"msg\":\"生成成功，共新增1条数据\",\"code\":200}', 0, NULL, '2025-09-15 19:40:13', 63);
INSERT INTO `sys_oper_log` VALUES (190, '外观', 1, 'com.ruoyi.system.controller.WeLookController.generateData()', 'POST', 1, 'admin', NULL, '/look/generateData', '127.0.0.1', '', '', '{\"msg\":\"生成成功，共新增0条数据\",\"code\":200}', 0, NULL, '2025-09-15 19:43:17', 7743);
INSERT INTO `sys_oper_log` VALUES (191, '外观', 1, 'com.ruoyi.system.controller.WeLookController.generateData()', 'POST', 1, 'admin', NULL, '/look/generateData', '127.0.0.1', '', '', '{\"msg\":\"生成成功，共新增1条数据\",\"code\":200}', 0, NULL, '2025-09-15 19:44:03', 27418);
INSERT INTO `sys_oper_log` VALUES (192, '外观', 1, 'com.ruoyi.system.controller.WeLookController.generateData()', 'POST', 1, 'admin', NULL, '/look/generateData', '127.0.0.1', '', '', '{\"msg\":\"生成成功，共新增1条数据\",\"code\":200}', 0, NULL, '2025-09-15 19:52:46', 3265);
INSERT INTO `sys_oper_log` VALUES (193, '外观', 1, 'com.ruoyi.system.controller.WeLookController.generateData()', 'POST', 1, 'admin', NULL, '/look/generateData', '127.0.0.1', '', '', '{\"msg\":\"生成成功，共新增1条数据\",\"code\":200}', 0, NULL, '2025-09-16 08:48:52', 69);
INSERT INTO `sys_oper_log` VALUES (194, '外观', 2, 'com.ruoyi.system.controller.WeLookController.generateLooks()', 'POST', 1, 'admin', NULL, '/look/generateLooks', '127.0.0.1', '', '[6]', '{\"msg\":\"任务已提交，正在后台处理\",\"code\":200}', 0, NULL, '2025-09-16 08:53:32', 196814);
INSERT INTO `sys_oper_log` VALUES (195, '外观', 2, 'com.ruoyi.system.controller.WeLookController.generateLooks()', 'POST', 1, 'admin', NULL, '/look/generateLooks', '127.0.0.1', '', '[6]', '{\"msg\":\"任务已提交，正在后台处理\",\"code\":200}', 0, NULL, '2025-09-16 09:07:00', 39184);
INSERT INTO `sys_oper_log` VALUES (196, '字典类型', 1, 'com.ruoyi.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"品牌提示词\",\"dictType\":\"brand_promot\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-16 09:42:38', 16);
INSERT INTO `sys_oper_log` VALUES (197, '字典类型', 3, 'com.ruoyi.system.controller.SysDictTypeController.remove()', 'DELETE', 1, 'admin', NULL, '/dict/type/102', '127.0.0.1', '', '[102]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-16 09:45:17', 29);
INSERT INTO `sys_oper_log` VALUES (198, 'AI图片', 5, 'com.ruoyi.system.controller.WeAiPictureController.export()', 'POST', 1, 'admin', NULL, '/picture/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-09-16 10:17:19', 3061);
INSERT INTO `sys_oper_log` VALUES (199, 'AI图片', 5, 'com.ruoyi.system.controller.WeAiPictureController.export()', 'POST', 1, 'admin', NULL, '/picture/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-09-16 10:43:48', 3197);
INSERT INTO `sys_oper_log` VALUES (200, 'AI图片', 5, 'com.ruoyi.system.controller.WeAiPictureController.export()', 'POST', 1, 'admin', NULL, '/picture/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-09-16 10:51:42', 3302);
INSERT INTO `sys_oper_log` VALUES (201, 'AI图片', 2, 'com.ruoyi.system.controller.WeAiPictureController.updateAuditStatus()', 'POST', 1, 'admin', NULL, '/picture/updateAuditStatus', '127.0.0.1', '', '', '{\"msg\":\"操作完成，成功更新 4 条记录，失败 0 条记录\",\"code\":200}', 0, NULL, '2025-09-16 13:33:57', 21110);
INSERT INTO `sys_oper_log` VALUES (202, 'AI图片', 5, 'com.ruoyi.system.controller.WeAiPictureController.export()', 'POST', 1, 'admin', NULL, '/picture/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-09-16 13:35:13', 965);
INSERT INTO `sys_oper_log` VALUES (203, 'AI图片', 5, 'com.ruoyi.system.controller.WeAiPictureController.export()', 'POST', 1, 'admin', NULL, '/picture/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-09-16 13:37:20', 3160);
INSERT INTO `sys_oper_log` VALUES (204, 'AI图片', 2, 'com.ruoyi.system.controller.WeAiPictureController.updateAuditStatus()', 'POST', 1, 'admin', NULL, '/picture/updateAuditStatus', '127.0.0.1', '', '', '{\"msg\":\"操作完成，成功更新 4 条记录，失败 0 条记录\",\"code\":200}', 0, NULL, '2025-09-16 13:38:04', 26869);
INSERT INTO `sys_oper_log` VALUES (205, 'AI图片', 2, 'com.ruoyi.system.controller.WeAiPictureController.updateAuditStatus()', 'POST', 1, 'admin', NULL, '/picture/updateAuditStatus', '127.0.0.1', '', '', '{\"msg\":\"操作完成，成功更新 4 条记录，失败 0 条记录\",\"code\":200}', 0, NULL, '2025-09-16 14:08:16', 1621550);
INSERT INTO `sys_oper_log` VALUES (206, 'AI图片', 2, 'com.ruoyi.system.controller.WeAiPictureController.updateAuditStatus()', 'POST', 1, 'admin', NULL, '/picture/updateAuditStatus', '127.0.0.1', '', '', '{\"msg\":\"操作完成，成功更新 4 条记录，失败 0 条记录\",\"code\":200}', 0, NULL, '2025-09-16 14:11:53', 13171);
INSERT INTO `sys_oper_log` VALUES (207, 'AI图片', 2, 'com.ruoyi.system.controller.WeAiPictureController.updateAuditStatus()', 'POST', 1, 'admin', NULL, '/picture/updateAuditStatus', '127.0.0.1', '', '', '{\"msg\":\"操作完成，成功更新 4 条记录，失败 0 条记录\",\"code\":200}', 0, NULL, '2025-09-16 14:13:53', 5213);
INSERT INTO `sys_oper_log` VALUES (208, 'AI图片', 2, 'com.ruoyi.system.controller.WeAiPictureController.updateAuditStatus()', 'POST', 1, 'admin', NULL, '/picture/updateAuditStatus', '127.0.0.1', '', '', '{\"msg\":\"操作完成，成功更新 4 条记录，失败 0 条记录\",\"code\":200}', 0, NULL, '2025-09-16 14:17:02', 147057);
INSERT INTO `sys_oper_log` VALUES (209, 'AI图片', 2, 'com.ruoyi.system.controller.WeAiPictureController.updateAuditStatus()', 'POST', 1, 'admin', NULL, '/picture/updateAuditStatus', '127.0.0.1', '', '', '{\"msg\":\"操作完成，成功更新 4 条记录，失败 0 条记录\",\"code\":200}', 0, NULL, '2025-09-16 14:18:18', 8126);
INSERT INTO `sys_oper_log` VALUES (210, 'AI图片', 5, 'com.ruoyi.system.controller.WeAiPictureController.export()', 'POST', 1, 'admin', NULL, '/picture/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-09-16 14:19:10', 1332);
INSERT INTO `sys_oper_log` VALUES (211, 'AI图片', 5, 'com.ruoyi.system.controller.WeAiPictureController.export()', 'POST', 1, 'admin', NULL, '/picture/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-09-16 14:25:04', 1974);
INSERT INTO `sys_oper_log` VALUES (212, 'AI图片', 2, 'com.ruoyi.system.controller.WeAiPictureController.updateAuditStatus()', 'POST', 1, 'admin', NULL, '/picture/updateAuditStatus', '127.0.0.1', '', '', '{\"msg\":\"操作完成，成功更新 4 条记录，失败 0 条记录\",\"code\":200}', 0, NULL, '2025-09-16 14:30:16', 5087);
INSERT INTO `sys_oper_log` VALUES (213, 'AI图片', 2, 'com.ruoyi.system.controller.WeAiPictureController.updateAuditStatus()', 'POST', 1, 'admin', NULL, '/picture/updateAuditStatus', '127.0.0.1', '', '', '{\"msg\":\"操作完成，成功更新 4 条记录，失败 0 条记录\",\"code\":200}', 0, NULL, '2025-09-16 14:34:08', 46);
INSERT INTO `sys_oper_log` VALUES (214, 'AI图片', 2, 'com.ruoyi.system.controller.WeAiPictureController.updateAuditStatus()', 'POST', 1, 'admin', NULL, '/picture/updateAuditStatus', '127.0.0.1', '', '', '{\"msg\":\"操作完成，成功更新 4 条记录，失败 0 条记录\",\"code\":200}', 0, NULL, '2025-09-16 14:46:28', 62);
INSERT INTO `sys_oper_log` VALUES (215, 'AI图片', 2, 'com.ruoyi.system.controller.WeAiPictureController.updateAuditStatus()', 'POST', 1, 'admin', NULL, '/picture/updateAuditStatus', '127.0.0.1', '', '', '{\"msg\":\"操作完成，成功更新 4 条记录，失败 0 条记录\",\"code\":200}', 0, NULL, '2025-09-16 14:47:09', 62);
INSERT INTO `sys_oper_log` VALUES (216, 'AI图片', 5, 'com.ruoyi.system.controller.WeAiPictureController.export()', 'POST', 1, 'admin', NULL, '/picture/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-09-16 14:50:09', 3138);
INSERT INTO `sys_oper_log` VALUES (217, 'AI图片', 2, 'com.ruoyi.system.controller.WeAiPictureController.updateAuditStatus()', 'POST', 1, 'admin', NULL, '/picture/updateAuditStatus', '127.0.0.1', '', '', '{\"msg\":\"操作完成，成功更新 4 条记录，失败 0 条记录\",\"code\":200}', 0, NULL, '2025-09-16 14:51:02', 839);
INSERT INTO `sys_oper_log` VALUES (218, 'AI图片', 5, 'com.ruoyi.system.controller.WeAiPictureController.export()', 'POST', 1, 'admin', NULL, '/picture/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"type\":\"2\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-09-16 14:51:38', 59);
INSERT INTO `sys_oper_log` VALUES (219, '模特', 3, 'com.ruoyi.system.controller.WeModelController.remove()', 'DELETE', 1, 'admin', NULL, '/model/1', '127.0.0.1', '', '[1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-16 14:53:31', 17);
INSERT INTO `sys_oper_log` VALUES (220, '服装', 3, 'com.ruoyi.system.controller.WeClothController.remove()', 'DELETE', 1, 'admin', NULL, '/cloth/1', '127.0.0.1', '', '[1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-16 14:53:36', 6);
INSERT INTO `sys_oper_log` VALUES (221, '背景', 3, 'com.ruoyi.system.controller.WeBackController.remove()', 'DELETE', 1, 'admin', NULL, '/back/1', '127.0.0.1', '', '[1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-16 14:53:43', 7);
INSERT INTO `sys_oper_log` VALUES (222, '外观', 3, 'com.ruoyi.system.controller.WeLookController.remove()', 'DELETE', 1, 'admin', NULL, '/look/6', '127.0.0.1', '', '[6]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-16 14:54:09', 5);
INSERT INTO `sys_oper_log` VALUES (223, 'AI图片', 3, 'com.ruoyi.system.controller.WeAiPictureController.remove()', 'DELETE', 1, 'admin', NULL, '/picture/2,3,4,5', '127.0.0.1', '', '[2,3,4,5]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-16 14:54:26', 7);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2025-09-13 16:40:16', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2025-09-13 16:40:16', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-09-13 16:40:16', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2025-09-13 16:40:16', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-09-16 08:44:44', '2025-09-13 16:40:16', 'admin', '2025-09-13 16:40:16', '', '2025-09-14 11:04:51', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-09-13 16:40:16', '2025-09-13 16:40:16', 'admin', '2025-09-13 16:40:16', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for we_ai_picture
-- ----------------------------
DROP TABLE IF EXISTS `we_ai_picture`;
CREATE TABLE `we_ai_picture`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片名称',
  `ai_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'AI生成图片URL',
  `task_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务ID',
  `execute_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行ID',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片类型',
  `look_id` bigint NULL DEFAULT NULL COMMENT '关联we_look表的主键',
  `look_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外观图片URL',
  `pid` bigint NULL DEFAULT NULL COMMENT '父id',
  `data_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0,1,2）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'AI图片表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of we_ai_picture
-- ----------------------------

-- ----------------------------
-- Table structure for we_back
-- ----------------------------
DROP TABLE IF EXISTS `we_back`;
CREATE TABLE `we_back`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '背景名称',
  `back_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '背景图片URL',
  `back_we_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '背景ID',
  `promot` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '背景描述',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '背景类型',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '背景表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of we_back
-- ----------------------------
INSERT INTO `we_back` VALUES (1, 'tan22', 'https://ai-image.weshop.com/20250908_1_6242fdf7-19b2-405e-a986-06aae5fd9ecb_632x840.jpg_width256.webp', '10000341765', NULL, '2', '0', '', '2025-09-16 18:18:19', '', NULL, NULL);
INSERT INTO `we_back` VALUES (2, 'tan96', 'https://ai-image.weshop.com/20250909_1_b4e7a4fc-3d76-4593-9aca-c2ddb18e27b6_1024x1280.png_width256.webp', '10000344115', NULL, '2', '0', '', '2025-09-16 18:18:19', '', NULL, NULL);
INSERT INTO `we_back` VALUES (3, 'tan90', 'https://ai-image.weshop.com/20250909_1_2fa75298-c220-4c56-bb77-eee71e22586f_720x896.png_width256.webp', '10000344097', NULL, '2', '0', '', '2025-09-16 18:18:19', '', NULL, NULL);
INSERT INTO `we_back` VALUES (4, 'tan59', 'https://ai-image.weshop.com/20250909_1_d3f6c449-ee04-4d99-9647-9e22bb3f4421_1080x1080.png_width256.webp', '10000343910', NULL, '2', '0', '', '2025-09-16 18:18:19', '', NULL, NULL);
INSERT INTO `we_back` VALUES (5, 'tan54', 'https://ai-image.weshop.com/20250909_1_c8f3df8d-2be8-4993-9ec1-3e0e5f3b396d_736x1304.png_width256.webp', '10000343903', NULL, '2', '0', '', '2025-09-16 18:18:19', '', NULL, NULL);
INSERT INTO `we_back` VALUES (6, 'tan28', 'https://ai-image.weshop.com/20250909_1_23b24b1f-5e64-4b27-aacf-40704de7cfa2_736x976.png_width256.webp', '10000343270', NULL, '2', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (7, 'tan27', 'https://ai-image.weshop.com/20250909_1_f0567e85-aec5-40d2-ab54-d083e69aa6e2_1080x1512.png_width256.webp', '10000343269', NULL, '2', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (8, 'tan49', 'https://ai-image.weshop.com/20250909_1_55d7b7cc-e105-4740-8a85-dbdbcc86d811_736x976.png_width256.webp', '10000343898', NULL, '2', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (9, 'bsd49', 'https://ai-image.weshop.com/20250911_1_3a1da09c-7f5d-4b02-89df-5ea02190ffcc_744x1256.png_width256.webp', '10000346067', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (10, 'bsd50', 'https://ai-image.weshop.com/20250911_1_a107ad80-70ae-45f8-a25a-d64d3969b8f2_744x1080.png_width256.webp', '10000346066', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (11, 'bsd48', 'https://ai-image.weshop.com/20250911_1_39ec5c4b-746a-49c4-9a4d-8db455c313d1_744x1040.png_width256.webp', '10000346063', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (12, 'bsd47', 'https://ai-image.weshop.com/20250911_1_4c4ae953-bbb2-4a99-92e4-da58285b96cb_784x1000.png_width256.webp', '10000346062', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (13, 'bsd46', 'https://ai-image.weshop.com/20250911_1_07328ac2-e8ee-4419-9a8c-e33634322c86_704x960.png_width256.webp', '10000346060', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (14, 'bsd44', 'https://ai-image.weshop.com/20250911_1_52d79728-9a20-4301-9200-6c37422abbd0_848x1280.png_width256.webp', '10000346050', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (15, 'bsd42', 'https://ai-image.weshop.com/20250911_1_0f640235-a7be-49ba-a397-d846fa88cdb0_672x1200.png_width256.webp', '10000346048', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (16, 'bsd40', 'https://ai-image.weshop.com/20250911_1_4418010f-b529-4512-88fc-503fb949a451_848x1280.png_width256.webp', '10000346046', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (17, 'bsd39', 'https://ai-image.weshop.com/20250911_1_2eadc294-7d79-4b40-ad16-abbaea4e4737_736x976.png_width256.webp', '10000346045', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (18, 'bsd38', 'https://ai-image.weshop.com/20250911_1_919e5825-7b95-4b2c-93c0-48b19f8f134b_912x1280.png_width256.webp', '10000346043', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (19, 'bsd36', 'https://ai-image.weshop.com/20250911_1_8ca1bf47-8c4b-4019-a4e4-ad3f25c43236_728x944.png_width256.webp', '10000346041', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (20, 'bsd34', 'https://ai-image.weshop.com/20250911_1_04edf1af-f363-45fd-a707-286eede93b74_736x1056.png_width256.webp', '10000346039', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (21, 'bsd33', 'https://ai-image.weshop.com/20250911_1_e91744e7-25a0-4883-8363-674ce3a83394_736x976.png_width256.webp', '10000346038', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (22, 'bsd28', 'https://ai-image.weshop.com/20250911_1_5a5b83fe-7fbd-462f-b896-6111791dcd8b_736x920.png_width256.webp', '10000346032', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (23, 'bsd27', 'https://ai-image.weshop.com/20250911_1_f5b95b6f-c769-427b-9fc2-fb0b4e0cc128_960x1280.jpg_width256.webp', '10000346031', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (24, 'bsd26', 'https://ai-image.weshop.com/20250911_1_f9a3bf2e-41c7-4ea1-b8ef-cdb8bb11dd03_744x936.png_width256.webp', '10000346030', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (25, 'bsd25', 'https://ai-image.weshop.com/20250911_1_ad50ea7e-06ca-49fa-9e6a-1130cd96d3fb_648x904.png_width256.webp', '10000346029', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (26, 'bsd24', 'https://ai-image.weshop.com/20250911_1_9e3df97c-88d7-4211-8935-16077442d97a_560x704.png_width256.webp', '10000346028', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (27, 'bsd23', 'https://ai-image.weshop.com/20250911_1_642eac92-3a3a-4f43-a730-66ebc3640229_728x976.png_width256.webp', '10000346027', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (28, 'bsd22', 'https://ai-image.weshop.com/20250911_1_c67fae69-aa79-47cb-bc8e-950865ab1a28_720x960.png_width256.webp', '10000346026', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (29, 'bsd21', 'https://ai-image.weshop.com/20250911_1_5e6e1718-6d12-4ae9-b4a4-39910c582956_736x1104.png_width256.webp', '10000346025', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (30, 'bsd20', 'https://ai-image.weshop.com/20250911_1_e89f2e0a-0d58-42f7-9f69-c9d74bf7f2a2_736x920.png_width256.webp', '10000346024', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (31, 'bsd19', 'https://ai-image.weshop.com/20250911_1_9ff12b24-3ade-496b-afd9-bf26fa06e222_960x1200.png_width256.webp', '10000346023', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (32, 'bsd18', 'https://ai-image.weshop.com/20250911_1_6b2a74f8-1686-4982-9cf5-9a17fe17c9e1_792x1064.png_width256.webp', '10000346022', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (33, 'bsd17', 'https://ai-image.weshop.com/20250911_1_82fb3619-f06b-4101-a0fb-26891ae93a59_736x1104.png_width256.webp', '10000346021', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (34, 'bsd16', 'https://ai-image.weshop.com/20250911_1_98339ef4-e21c-49d1-b429-acac0d55cd11_1080x1440.png_width256.webp', '10000346019', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (35, 'bsd15', 'https://ai-image.weshop.com/20250911_1_af0add17-912e-4b9b-b6ea-028ba6a32874_736x1104.png_width256.webp', '10000346018', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (36, 'bsd14', 'https://ai-image.weshop.com/20250911_1_5c487bab-3b9d-4b28-8fab-8eb261ddcebd_824x536.png_width256.webp', '10000346017', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (37, 'bsd13', 'https://ai-image.weshop.com/20250911_1_ea6b5c44-ea9f-4d1d-8fd6-eb8f97104589_1080x1344.png_width256.webp', '10000346016', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (38, 'bsd12', 'https://ai-image.weshop.com/20250911_1_8c5b0ebd-2d76-4adc-ad78-690c53e825bd_1200x1800.png_width256.webp', '10000346014', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (39, 'bsd11', 'https://ai-image.weshop.com/20250911_1_bb77704c-cd10-47a2-8e03-f685ea96fb34_688x864.png_width256.webp', '10000346013', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (40, 'bsd10', 'https://ai-image.weshop.com/20250911_1_a4ce2d52-3402-4afc-9aa5-9d81486799be_824x976.png_width256.webp', '10000346012', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (41, 'bsd9', 'https://ai-image.weshop.com/20250911_1_e56cdb23-8729-4f48-af6c-3c4f2356acaa_736x976.png_width256.webp', '10000346010', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (42, 'bsd8', 'https://ai-image.weshop.com/20250911_1_5d9765f2-4a6b-4121-88c1-e041fd534ca2_960x1280.png_width256.webp', '10000346009', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (43, 'bsd7', 'https://ai-image.weshop.com/20250911_1_bca6ab36-22e2-40f6-8b22-9e32e5b2334a_848x1280.png_width256.webp', '10000346008', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (44, 'bsd6', 'https://ai-image.weshop.com/20250911_1_ca8c45bc-8a0c-4416-ae7d-eaae540ee761_736x1208.png_width256.webp', '10000346007', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (45, 'bsd5', 'https://ai-image.weshop.com/20250911_1_d9a92c70-20e2-40b5-9fc0-ff56e04cb504_736x1096.png_width256.webp', '10000346006', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (46, 'bsd4', 'https://ai-image.weshop.com/20250911_1_2bbb454e-e189-4983-a1f5-d974ce7a4679_960x1280.png_width256.webp', '10000346005', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (47, 'bsd3', 'https://ai-image.weshop.com/20250911_1_2bc4ee3f-a212-46a0-bcc7-27be02017da2_800x1200.png_width256.webp', '10000345963', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (48, 'bsd2', 'https://ai-image.weshop.com/20250911_1_aad04a58-9523-4bd9-a9e3-d282401e0d8e_1024x1280.png_width256.webp', '10000345961', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_back` VALUES (49, 'bsd1', 'https://ai-image.weshop.com/20250911_1_b52b9ed0-37f1-495e-b0bc-1b37f3e9d689_848x1280.png_width256.webp', '10000345954', NULL, '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);

-- ----------------------------
-- Table structure for we_cloth
-- ----------------------------
DROP TABLE IF EXISTS `we_cloth`;
CREATE TABLE `we_cloth`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服装名称',
  `cloth_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服装图片URL',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服装类型',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '服装表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of we_cloth
-- ----------------------------

-- ----------------------------
-- Table structure for we_look
-- ----------------------------
DROP TABLE IF EXISTS `we_look`;
CREATE TABLE `we_look`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外观名称',
  `look_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外观图片URL',
  `task_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务ID',
  `execute_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行ID',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外观类型',
  `model_id` bigint NULL DEFAULT NULL COMMENT '关联we_model表的主键',
  `model_we_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模特ID',
  `model_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模特文件URL',
  `back_id` bigint NULL DEFAULT NULL COMMENT '关联we_back表的主键',
  `back_we_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '背景ID',
  `back_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '背景图片URL',
  `cloth_id` bigint NULL DEFAULT NULL COMMENT '关联we_cloth表的主键',
  `cloth_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服装图片URL',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '外观表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of we_look
-- ----------------------------

-- ----------------------------
-- Table structure for we_model
-- ----------------------------
DROP TABLE IF EXISTS `we_model`;
CREATE TABLE `we_model`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模特名称',
  `model_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模特文件URL',
  `model_we_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模特ID',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模特类型',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '模特表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of we_model
-- ----------------------------
INSERT INTO `we_model` VALUES (1, 'tan1', 'https://ai-image.weshop.com/20250908_1_75b8cdc4-9ce8-4158-b0bb-5f08f7958af2_736x946.png_crop512.jpeg', '10000341607', '2', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_model` VALUES (2, 'bsd1', 'https://ai-image.weshop.com/20250911_1_805bf342-a8f1-4960-b233-7d5103fdcb9c_640x800.png_crop512.jpeg', '10000345931', '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);
INSERT INTO `we_model` VALUES (3, 'bsd2', 'https://ai-image.weshop.com/20250911_1_3c3602d7-777f-4655-98a1-78e4248a2e6d_1024x1280.png_crop512.jpeg', '10000345929', '1', '0', '', '2025-09-16 18:18:20', '', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
