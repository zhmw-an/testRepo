
DROP TABLE IF EXISTS `snc_task_action`;
CREATE TABLE `snc_task_action`  (
  `action_id` bigint(32) NOT NULL AUTO_INCREMENT,
  `task_id` bigint(32) NULL DEFAULT NULL,
  `status` int(2) NULL DEFAULT NULL COMMENT '0-指派 1-创建 2-更新 3-撤回 4-驳回 5-归档',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批意见',
  `deal_user` bigint(32) NULL DEFAULT NULL COMMENT '当前处理人',
  `next_user` bigint(32) NULL DEFAULT NULL COMMENT '下一个处理人',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`action_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `snc_task_label_relation`;
CREATE TABLE `snc_task_label_relation`  (
  `relation_id` bigint(32) NOT NULL AUTO_INCREMENT,
  `task_id` bigint(32) NULL DEFAULT NULL,
  `label_id` bigint(32) NULL DEFAULT NULL,
  PRIMARY KEY (`relation_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `snc_task_file`;
CREATE TABLE `snc_task_file`  (
  `file_id` bigint(32) NOT NULL AUTO_INCREMENT,
  `task_id` bigint(32) NULL DEFAULT NULL,
  `file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_type` int(1) NULL DEFAULT NULL COMMENT '1-实施方案，2-实施结果',
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;


DROP TABLE IF EXISTS `snc_task_label`;
CREATE TABLE `snc_task_label`  (
  `label_id` bigint(32) NOT NULL AUTO_INCREMENT,
  `label_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`label_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `snc_tasks`;
CREATE TABLE `snc_tasks`  (
  `task_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `sys_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统名称',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `group_id` bigint(32) NULL DEFAULT NULL COMMENT '项目id',
  `task_type` int(1) NULL DEFAULT NULL COMMENT '1-变更，2-巡检，3-保障，4-其他',
  `demand_describe` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '需求描述',
  `result_describe` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '结果描述',
  `status` int(1) NULL DEFAULT NULL COMMENT '1-待处理 2-归档 3-草稿',
  `task_status` int(1) NULL DEFAULT NULL COMMENT '1-完成 2-取消 3-失败',
  `deal_user` bigint(32) NULL DEFAULT NULL COMMENT '当前处理人',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `fault_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联故障id',
  `is_stop` int(1) NULL DEFAULT NULL COMMENT '0-需要停止 1-不需要',
  `level` int(1) NULL DEFAULT NULL COMMENT '1-高 2-中 3-低',
  `have_scheme` int(1) NULL DEFAULT NULL COMMENT '0-需要方案 1-不需要',
  `real_start_time` datetime(0) NULL DEFAULT NULL COMMENT '实际开始时间',
  `real_end_time` datetime(0) NULL DEFAULT NULL COMMENT '实际结束时间',
  `engineer` bigint(32) NULL DEFAULT NULL COMMENT '实施工程师',
  `parent_id` bigint(32) NULL DEFAULT NULL COMMENT '当status为3的时候，存工单id',
  `last_user` bigint(32) NULL DEFAULT NULL COMMENT '上一个操作人id',
  `send_key` int(1) NOT NULL DEFAULT 0 COMMENT '超过3天未处理则要提醒，0-已提醒，1-未提醒',
  `create_user` bigint(32) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `is_del` int(1) NULL DEFAULT 0 COMMENT '0:正常 1:删除',
  PRIMARY KEY (`task_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;