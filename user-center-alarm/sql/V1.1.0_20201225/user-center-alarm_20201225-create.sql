#日报模块建表sql

DROP TABLE IF EXISTS `snc_daily_config_trigger`;
CREATE TABLE `snc_daily_config_trigger`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规则ID',
  `config_id` int(11) NOT NULL COMMENT '日报配置ID',
  `condition_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则键',
  `condition_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则值',
  `condition` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则判断条件 >、>=、== 、<、<=、包含',
  `update_user` int(11) NULL DEFAULT NULL COMMENT '更新用户',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日报触发条件规则表' ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `snc_daily_rule`;
CREATE TABLE `snc_daily_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规则条件ID',
  `condition_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则键',
  `condition_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则值',
  `condition` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则判断条件 >、>=、== 、<、<=、包含',
  `mapping_flag` int(2) NOT NULL DEFAULT 0 COMMENT '是否启动映射 0 否 1 是',
  `group_id` int(11) NULL DEFAULT NULL COMMENT '当为模板规则时，为空；项目组规则时填写项目组ID',
  `template_id` int(11) NULL DEFAULT NULL COMMENT '当为项目组规则时，为空；模板规则时填写模板ID',
  `enable_status` int(2) NULL DEFAULT NULL COMMENT '启用状态 0表示不启用;1 表示启用',
  `memo_show_status` int(2) NULL DEFAULT NULL COMMENT '说明展示状态 0表示不展示;1 表示展示',
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指标说明',
  `update_user` int(11) NULL DEFAULT NULL COMMENT '更新用户',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日报指标规则表' ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `snc_daily_rule_mapping`;
CREATE TABLE `snc_daily_rule_mapping`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '映射规则ID',
  `rule_id` int(11) NULL DEFAULT NULL COMMENT '日报指标规则ID',
  `before_value` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '映射前值',
  `after_value` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '映射后值',
  `update_user` int(11) NULL DEFAULT NULL COMMENT '更新用户',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日报指标映射规则表' ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `snc_daily_template`;
CREATE TABLE `snc_daily_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '模板主键',
  `template_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名称',
  `temple_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板类型',
  `enable_status` int(2) NOT NULL DEFAULT 1 COMMENT '启用状态 0表示不启用;1 表示启用',
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_delete` int(2) NOT NULL DEFAULT 0 COMMENT '是否删除 0 在用 1 删除',
  `update_user` int(11) NULL DEFAULT NULL COMMENT '更新用户',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日报模板信息表' ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `snc_dailys`;
CREATE TABLE `snc_dailys`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NULL DEFAULT NULL COMMENT '项目组ID，通过邮件接收规则判断',
  `check_time` datetime(0) NULL DEFAULT NULL COMMENT '检查时间，从邮件标题中获取',
  `module_type` int(2) NULL DEFAULT NULL COMMENT '模板类型，从邮件标题中获取数据库类型',
  `daily_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '日报内容，邮件标题为[gzzwy][DailyReport][数据库类型]巡检名称_YYYYMMDDHH24MISS',
  `message_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '邮件ID',
  `collect_time` datetime(0) NULL DEFAULT NULL COMMENT '采集时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_snc_dailys_groupid`(`group_id`) USING BTREE,
  INDEX `IDX_MODULE_TYPE`(`module_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '日报信息表' ROW_FORMAT = Dynamic;

