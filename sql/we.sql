-- 服装表
drop table if exists we_cloth;
CREATE TABLE `we_cloth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '服装名称',
  `cloth_url` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '服装图片URL',
  `type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '服装类型',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='服装表';

-- 模特表
drop table if exists we_model;
CREATE TABLE `we_model` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '模特名称',
  `model_url` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '模特文件URL',
  `model_we_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '模特ID',
  `type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '模特类型',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='模特表';

-- 背景表
drop table if exists we_back;
CREATE TABLE `we_back` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '背景名称',
  `back_url` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '背景图片URL',
  `back_we_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '背景ID',
  `promot` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '背景描述',
  `type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '背景类型',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='背景表';

-- 外观表
drop table if exists we_look;
CREATE TABLE `we_look` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '外观名称',
  `look_url` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '外观图片URL',
  `task_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '任务ID',
  `execute_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '执行ID',
  `type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '外观类型',
  `model_id` bigint(20) DEFAULT NULL COMMENT '关联we_model表的主键',
  `model_we_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '模特ID',
  `model_url` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '模特文件URL',
  `back_id` bigint(20) DEFAULT NULL COMMENT '关联we_back表的主键',
  `back_we_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '背景ID',
  `back_url` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '背景图片URL',
  `cloth_id` bigint(20) DEFAULT NULL COMMENT '关联we_cloth表的主键',
  `cloth_url` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '服装图片URL',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='外观表';

-- AI图片表
drop table if exists we_ai_picture;
CREATE TABLE `we_ai_picture` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图片名称',
  `ai_url` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'AI生成图片URL',
  `task_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '任务ID',
  `execute_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '执行ID',
  `type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图片类型',
  `look_id` bigint(20) DEFAULT NULL COMMENT '关联we_look表的主键',
  `look_url` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '外观图片URL',
  `pid` bigint(20) DEFAULT NULL COMMENT '父id',
  `data_status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0,1,2）',
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='AI图片表';