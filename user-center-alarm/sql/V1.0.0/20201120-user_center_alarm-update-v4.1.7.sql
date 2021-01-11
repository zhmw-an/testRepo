SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `user_center_alarm`.`authorization_info` ADD COLUMN `authorization_tags` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限码标签' AFTER `create_time`;

CREATE TABLE `user_center_alarm`.`authorization_post`  (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位主键',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `is_built` int(2) NULL DEFAULT 0 COMMENT '是否内置，0否，1是',
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位描述',
  `organization_id` int(10) NULL DEFAULT NULL COMMENT '组织关系ID',
  `organization_parent_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父ID',
  `organization_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织机构名',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `user_center_alarm`.`authorization_post_group_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `post_id` int(11) NOT NULL COMMENT '岗位主键ID',
  `group_id` int(11) NOT NULL COMMENT '用户组主键ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `user_center_alarm`.`authorization_post_role_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `post_id` int(11) NOT NULL COMMENT '岗位主键',
  `role_id` int(11) NOT NULL COMMENT '角色主键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `user_center_alarm`.`authorization_user_post_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `user_center_alarm`.`menu_authorization_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menu_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单编码',
  `authorization_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限码',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `user_center_alarm`.`menu_authorization_relation_copy`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menu_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单编码',
  `authorization_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限码',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `user_center_alarm`.`menu_info`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单',
  `menu_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `menu_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单码',
  `parent_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '父ID，0为顶级',
  `menu_icon` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `menu_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `menu_type` smallint(1) NOT NULL DEFAULT 1 COMMENT '菜单类型1菜单，2按钮',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `micro_app` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属应用',
  `sort_num` int(4) NOT NULL DEFAULT 0 COMMENT '排序数字',
  `menu_status` smallint(1) NOT NULL DEFAULT 1 COMMENT '菜单状态,1启用，0禁用',
  `menu_path_type` int(11) NULL DEFAULT 1 COMMENT '菜单路径类型  （1：内部链接  2：外链） 默认1',
  `menu_path_open_type` int(11) NULL DEFAULT 1 COMMENT '菜单外链类型 （1：新窗口打开 2：当前窗口打开 3：无刷新切换）',
  `link_adress` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单外链地址 ',
  `custom_props` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `user_center_alarm`.`menu_info_copy`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单',
  `menu_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `menu_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单码',
  `parent_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '父ID，0为顶级',
  `menu_icon` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `menu_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `menu_type` smallint(1) NOT NULL DEFAULT 1 COMMENT '菜单类型1菜单，2按钮',
  `create_user_id` bigint(20) NOT NULL COMMENT '创建人',
  `micro_app` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属应用',
  `sort_num` int(4) NOT NULL DEFAULT 0 COMMENT '排序数字',
  `menu_status` smallint(1) NOT NULL DEFAULT 1 COMMENT '菜单状态,1启用，0禁用',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `user_center_alarm`.`script_audit_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `script_id` bigint(20) NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `user_group_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作审核人表' ROW_FORMAT = Dynamic;

ALTER TABLE `user_center_alarm`.`user_group` ADD COLUMN `is_watch` smallint(1) NOT NULL DEFAULT 0 COMMENT '是否参加值班 1参加，0不参加' AFTER `code`;

ALTER TABLE `user_center_alarm`.`user_group` ADD COLUMN `handover_mode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交班模式,A,A-B,A-B-C' AFTER `is_watch`;

ALTER TABLE `user_center_alarm`.`user_group` ADD COLUMN `handover_time` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交班时间' AFTER `handover_mode`;

ALTER TABLE `user_center_alarm`.`user_group` ADD COLUMN `group_colour` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组颜色' AFTER `handover_time`;

ALTER TABLE `user_center_alarm`.`user_group` ADD COLUMN `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述' AFTER `group_colour`;

CREATE TABLE `user_center_alarm`.`user_group_post_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_id` bigint(20) NOT NULL COMMENT '用户组ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

ALTER TABLE `user_center_alarm`.`user_info` ADD COLUMN `fixed_phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '座机' AFTER `qywx_user_id`;

CREATE TABLE `user_center_alarm`.`user_info_image`  (
  `user_image_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `pic_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `pic_type` tinyint(4) NULL DEFAULT NULL COMMENT '图片类型 1-头像',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `pic_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片名称',
  PRIMARY KEY (`user_image_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户图片表' ROW_FORMAT = Dynamic;

CREATE TABLE `user_center_alarm`.`user_post`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位ID',
  `type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '类型',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE `user_center_alarm`.`user_post_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS=1;