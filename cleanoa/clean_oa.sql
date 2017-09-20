CREATE DATABASE `oa`;

USE `oa`;

DROP TABLE IF EXISTS `oa_user`;

CREATE TABLE `oa_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '用户密码',
  `gender` int(1) DEFAULT NULL COMMENT '性别：1-男，0-女',
  `sort_num` int(11) NOT NULL COMMENT '排序号',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `realname` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `creator` varchar(255) NOT NULL COMMENT '创建人',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`user_id`)
) COMMENT='用户表';

DROP TABLE IF EXISTS `oa_role`;

CREATE TABLE `oa_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(255) NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`role_id`)
) COMMENT='角色表';

DROP TABLE IF EXISTS `oa_permission`;

CREATE TABLE `oa_permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `permission_name` varchar(255) NOT NULL COMMENT '权限名称',
  PRIMARY KEY (`permission_id`)
) COMMENT='权限表';

DROP TABLE IF EXISTS `oa_user_role`;

CREATE TABLE `oa_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`)
) COMMENT='用户角色关联表';

DROP TABLE IF EXISTS `oa_role_permission`;

CREATE TABLE `oa_role_permission` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `permission_id` int(11) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`role_id`, `permission_id`)
) COMMENT='角色权限关联表';

CREATE TABLE `oa_menu` (
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  `menu_name` int(11) NOT NULL COMMENT '菜单名称',
  `menu_url` varchar(255) NOT NULL COMMENT '菜单url',
  `parent_id` int(11) NOT NULL COMMENT '父菜单ID',
  PRIMARY KEY (`menu_id`)
) COMMENT='菜单表';

CREATE TABLE `oa_menu_permission` (
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  `permission_id` int(11) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`menu_id`, `permission_id`)
) COMMENT='菜单权限关联表';

CREATE TABLE `oa_operate` (
  `operate_id` int(11) NOT NULL COMMENT '操作ID',
  `operate_name` varchar(255) NOT NULL COMMENT '操作名称',
  `parent_id` int(11) NOT NULL COMMENT '父操作ID',
  `operate_method` varchar(255) NOT NULL COMMENT '操作方法',
  `operate_url` varchar(255) NOT NULL COMMENT '操作url',
  PRIMARY KEY (`operate_id`)
) COMMENT='操作表';

CREATE TABLE `oa_operate_permission` (
  `operate_id` int(11) NOT NULL COMMENT '操作ID',
  `permission_id` int(11) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`operate_id`, `permission_id`)
) COMMENT='操作权限关联表';
