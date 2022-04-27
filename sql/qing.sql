/*
Navicat MySQL Data Transfer

Source Server         : 22
Source Server Version : 80015
Source Host           : localhost:3306
Source Database       : qing

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2022-04-21 23:17:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发布人',
  `time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '青哥哥的文章标题', '# 我是青哥哥\n## 我是青哥哥2号\n\n::: hljs-center\n\n***++~~==我是那个哥哥==~~++***\n\n:::\n\n> 我是青哥哥的引用\n\n我是B站：程序员青戈\n\n[百度](https://www.baidu.com)\n\n```java\nclass Hello {\n  public static void main(String[] args) {\n    System.out.pringln(\"Hello 青哥哥\");\n  }\n}\n\n```\n\n![搜狗截图20220129174103.png](http://localhost:9090/file/8567a00d2bf740e0a63794baf600cec3.png)\n\n\n', '程序员青戈', '2022-03-22 19:22:58');
INSERT INTO `article` VALUES ('2', '青哥哥文章2号', '青哥哥文章2号\n\n青哥哥文章2号\n\n青哥哥文章2号\n\n![QQ图片20220307194920.png](http://localhost:9090/file/5e40a867acd74d1f90b0ac9a765823e5.png)', '程序员青戈', '2022-03-22 19:22:58');

-- ----------------------------
-- Table structure for commodity
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of commodity
-- ----------------------------
INSERT INTO `commodity` VALUES ('1', '雪碧', '4', '1000');
INSERT INTO `commodity` VALUES ('2', '牛奶', '202', '1000');
INSERT INTO `commodity` VALUES ('5', '可乐', '5', '200');
INSERT INTO `commodity` VALUES ('6', '康师傅泡面', '2', '2002');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '课程名称',
  `score` int(11) DEFAULT NULL COMMENT '学分',
  `times` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '上课时间',
  `state` tinyint(1) DEFAULT NULL COMMENT '是否开课',
  `teacher_id` int(11) DEFAULT NULL COMMENT '授课老师id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '大学物理', '10', '40', '0', '17');
INSERT INTO `course` VALUES ('2', '高等数学', '10', '45', null, '16');
INSERT INTO `course` VALUES ('3', '大学英语', '10', '30', null, '16');

-- ----------------------------
-- Table structure for gift
-- ----------------------------
DROP TABLE IF EXISTS `gift`;
CREATE TABLE `gift` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spend` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of gift
-- ----------------------------
INSERT INTO `gift` VALUES ('1', '手机扣链', '277', '100');

-- ----------------------------
-- Table structure for student_course
-- ----------------------------
DROP TABLE IF EXISTS `student_course`;
CREATE TABLE `student_course` (
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`student_id`,`course_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of student_course
-- ----------------------------
INSERT INTO `student_course` VALUES ('1', '3');
INSERT INTO `student_course` VALUES ('28', '1');
INSERT INTO `student_course` VALUES ('28', '2');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('user', 'el-icon-user', 'icon');
INSERT INTO `sys_dict` VALUES ('house', 'el-icon-house', 'icon');
INSERT INTO `sys_dict` VALUES ('menu', 'el-icon-menu', 'icon');
INSERT INTO `sys_dict` VALUES ('s-custom', 'el-icon-s-custom', 'icon');
INSERT INTO `sys_dict` VALUES ('s-grid', 'el-icon-s-grid', 'icon');
INSERT INTO `sys_dict` VALUES ('document', 'el-icon-document', 'icon');
INSERT INTO `sys_dict` VALUES ('coffee', 'el-icon-coffee\r\n', 'icon');
INSERT INTO `sys_dict` VALUES ('s-marketing', 'el-icon-s-marketing', 'icon');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件类型',
  `size` bigint(20) DEFAULT NULL COMMENT '文件大小(kb)',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '下载链接',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件md5',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `enable` tinyint(1) DEFAULT '1' COMMENT '是否禁用链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES ('17', '649002da71c8473db39892b4a758f875.png', 'png', '634', 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'e1a9407cd0e937c4b411a93b7aca7c87', '1', '0');
INSERT INTO `sys_file` VALUES ('18', '1641024983532cf.png', 'png', '634', 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'e1a9407cd0e937c4b411a93b7aca7c87', '1', '0');
INSERT INTO `sys_file` VALUES ('19', 'Java3年经验开发个人简历模板.doc', 'doc', '47', 'http://localhost:9090/file/0e020e1337474a93ba3b43a75b2890ee.doc', '9ace4fac24420f85c753aa663009edb4', '1', '1');
INSERT INTO `sys_file` VALUES ('20', '1626102561055-2.jpg', 'jpg', '24', 'http://localhost:9090/file/cd379f381364482aaad0d6ffb7209d3d.jpg', 'adb0481b283645af3809e3d8a1bdb294', '1', '1');
INSERT INTO `sys_file` VALUES ('21', '1622011842830-5.jpg', 'jpg', '14', 'http://localhost:9090/file/7737484487db47ab89e58504ddf86ac1.jpg', '2dcd5d60c696c47fdfe0b482c18de0ea', '0', '1');
INSERT INTO `sys_file` VALUES ('22', '1622536738094-7.jpg', 'jpg', '12', 'http://localhost:9090/file/ad5946fe27c14508ac796115f6465826.jpg', '35977e7dc2159a734f3c81de460e4b8d', '0', '1');
INSERT INTO `sys_file` VALUES ('23', '用户信息 (1).xlsx', 'xlsx', '3', 'http://localhost:9090/file/02f70e07e69045c38b4748283ffeeabb.xlsx', '687f150737c967e74cfd6fa9ec981589', '0', '1');
INSERT INTO `sys_file` VALUES ('24', '1641024983532cf.png', 'png', '634', 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'e1a9407cd0e937c4b411a93b7aca7c87', '0', '1');
INSERT INTO `sys_file` VALUES ('25', '1641024983532cf.png', 'png', '634', 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'e1a9407cd0e937c4b411a93b7aca7c87', '0', '1');
INSERT INTO `sys_file` VALUES ('26', '6.jpg', 'jpg', '30', 'http://localhost:9090/file/9b21a2b133b140e0bcd9bf66dc5cad1d.jpg', 'a2cf10bcbed5e9d98cbaf5467acae28d', '0', '1');
INSERT INTO `sys_file` VALUES ('27', '9b21a2b133b140e0bcd9bf66dc5cad1d.jpg', 'jpg', '30', 'http://localhost:9090/file/9b21a2b133b140e0bcd9bf66dc5cad1d.jpg', 'a2cf10bcbed5e9d98cbaf5467acae28d', '0', '1');
INSERT INTO `sys_file` VALUES ('28', '1622011842830-5.jpg', 'jpg', '14', 'http://localhost:9090/file/7737484487db47ab89e58504ddf86ac1.jpg', '2dcd5d60c696c47fdfe0b482c18de0ea', '1', '1');
INSERT INTO `sys_file` VALUES ('29', '1641024983532cf (1).png', 'png', '634', 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'e1a9407cd0e937c4b411a93b7aca7c87', '0', '1');
INSERT INTO `sys_file` VALUES ('30', '1622011842830-5.jpg', 'jpg', '14', 'http://localhost:9090/file/7737484487db47ab89e58504ddf86ac1.jpg', '2dcd5d60c696c47fdfe0b482c18de0ea', '0', '1');
INSERT INTO `sys_file` VALUES ('31', 'QQ截图20211214232106.jpg', 'jpg', '30', 'http://localhost:9090/file/7de0e50f915547539db12023cf997276.jpg', 'ba5dd263551a31d9bb0582b07cb480e1', '0', '1');
INSERT INTO `sys_file` VALUES ('32', 'boot.jpg', 'jpg', '11', 'http://localhost:9090/file/657d7054d7864bd7a0aaba9e44f7924e.jpg', '2ab82ad78ff081665ee90f8cb38b45db', '0', '1');
INSERT INTO `sys_file` VALUES ('33', 'QQ图片20210828212629.gif', 'gif', '188', 'http://localhost:9090/file/e5512c68a5614135a12064afa66c67e5.gif', 'ce524058758a83c046b97c66ddcb8a83', '0', '1');
INSERT INTO `sys_file` VALUES ('34', 'vite.jpg', 'jpg', '27', 'http://localhost:9090/file/782f20b37b8b4a158c5e13a07fe826d5.jpg', 'c67bab9c32968cd0cda3e1608286b0d9', '0', '1');
INSERT INTO `sys_file` VALUES ('35', 'mp.jpg', 'jpg', '32', 'http://localhost:9090/file/650e8330e78b4fed8fb0c1d866684b5d.jpg', 'cb887a9d64563352edce80cf50296cc5', '0', '1');
INSERT INTO `sys_file` VALUES ('36', 'qq音乐.png', 'png', '445', 'http://localhost:9090/file/461504596ec040729776b674ddec88d3.png', '793fd534fa705475eb3358f68c87ec68', '0', '1');
INSERT INTO `sys_file` VALUES ('37', 'QQ截图20211214232106.jpg', 'jpg', '30', 'http://localhost:9090/file/7de0e50f915547539db12023cf997276.jpg', 'ba5dd263551a31d9bb0582b07cb480e1', '0', '1');
INSERT INTO `sys_file` VALUES ('38', 'boot.jpg', 'jpg', '11', 'http://localhost:9090/file/657d7054d7864bd7a0aaba9e44f7924e.jpg', '2ab82ad78ff081665ee90f8cb38b45db', '0', '1');
INSERT INTO `sys_file` VALUES ('39', 'QQ截图20211214232106.jpg', 'jpg', '30', 'http://localhost:9090/file/7de0e50f915547539db12023cf997276.jpg', 'ba5dd263551a31d9bb0582b07cb480e1', '1', '0');
INSERT INTO `sys_file` VALUES ('40', 'v1.mp4', 'mp4', '47484', 'http://localhost:9090/file/a22c9d62ef0648db86b9766bb14d742a.mp4', '3dda54bc1a07bd9112bfb381c20b4867', '0', '1');
INSERT INTO `sys_file` VALUES ('41', '搜狗截图20220129174103.png', 'png', '56', 'http://localhost:9090/file/8567a00d2bf740e0a63794baf600cec3.png', '050df6119399582fda666834870608d7', '0', '1');
INSERT INTO `sys_file` VALUES ('42', 'QQ图片20220307194920.png', 'png', '100', 'http://localhost:9090/file/5e40a867acd74d1f90b0ac9a765823e5.png', '0f1337b5c0ebf68f67718fcf42d1322f', '0', '1');
INSERT INTO `sys_file` VALUES ('43', 'QQ图片20220307194920.png', 'png', '100', 'http://localhost:9090/file/5e40a867acd74d1f90b0ac9a765823e5.png', '0f1337b5c0ebf68f67718fcf42d1322f', '0', '1');
INSERT INTO `sys_file` VALUES ('44', '世界地图.png', 'png', '4823', 'http://localhost:9090/file/2424e6033ad84af5b657ea045124f114.png', '17a9642fee42bfa701a244fbd3128cd4', '0', '1');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '路径',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `pid` int(11) DEFAULT NULL COMMENT '父级id',
  `page_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '页面路径',
  `sort_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('2', '数据报表', '/dashbord', 'el-icon-s-marketing', '11', null, 'Dashbord', '100');
INSERT INTO `sys_menu` VALUES ('4', '系统管理', null, 'el-icon-s-grid', null, null, null, '300');
INSERT INTO `sys_menu` VALUES ('5', '用户管理', '/user', 'el-icon-user', null, '4', 'User', '301');
INSERT INTO `sys_menu` VALUES ('6', '角色管理', '/role', 'el-icon-s-custom', null, '4', 'Role', '302');
INSERT INTO `sys_menu` VALUES ('7', '菜单管理', '/menu', 'el-icon-menu', null, '4', 'Menu', '303');
INSERT INTO `sys_menu` VALUES ('8', '文件管理', '/file', 'el-icon-document', null, '4', 'File', '304');
INSERT INTO `sys_menu` VALUES ('9', '请作者喝杯咖啡', '/donate', 'el-icon-coffee\r\n', null, null, 'Donate', '200');
INSERT INTO `sys_menu` VALUES ('10', '主页', '/home', 'el-icon-house', null, null, 'Home', '0');
INSERT INTO `sys_menu` VALUES ('39', '课程管理', '/course', 'el-icon-menu', null, null, 'Course', '201');
INSERT INTO `sys_menu` VALUES ('40', '高德地图', '/map', 'el-icon-house', null, null, 'Map', '999');
INSERT INTO `sys_menu` VALUES ('41', '文章管理', '/article', 'el-icon-menu', null, null, 'Article', '999');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `flag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', '管理员', 'ROLE_ADMIN');
INSERT INTO `sys_role` VALUES ('2', '用户', '用户', 'ROLE_USER');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `menu_id` int(11) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='角色菜单关系表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '5');
INSERT INTO `sys_role_menu` VALUES ('1', '6');
INSERT INTO `sys_role_menu` VALUES ('1', '7');
INSERT INTO `sys_role_menu` VALUES ('1', '8');
INSERT INTO `sys_role_menu` VALUES ('1', '9');
INSERT INTO `sys_role_menu` VALUES ('1', '10');
INSERT INTO `sys_role_menu` VALUES ('1', '39');
INSERT INTO `sys_role_menu` VALUES ('1', '40');
INSERT INTO `sys_role_menu` VALUES ('1', '41');
INSERT INTO `sys_role_menu` VALUES ('3', '2');
INSERT INTO `sys_role_menu` VALUES ('3', '10');
INSERT INTO `sys_role_menu` VALUES ('3', '39');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'admin', '程序员青戈', 'admin@qq.com', '13988997788', '安徽合肥1', '2022-01-22 21:10:27', 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'ROLE_ADMIN');
INSERT INTO `sys_user` VALUES ('18', 'nzz', '123', '哪吒', '2', '2', '2', '2022-03-29 16:59:44', '', 'ROLE_USER');
INSERT INTO `sys_user` VALUES ('19', 'yss', '123', '亚瑟', '3', '3', '3', '2022-04-29 16:59:44', '', 'ROLE_USER');
INSERT INTO `sys_user` VALUES ('20', 'lxx', '123', '李信', '2', '2', '2', '2022-05-29 17:12:04', '2', 'ROLE_USER');
INSERT INTO `sys_user` VALUES ('25', 'sir', '123', '安琪拉', null, null, null, '2022-06-08 17:00:47', null, 'ROLE_USER');
INSERT INTO `sys_user` VALUES ('26', 'err', null, '妲己', '11', '1', '1', '2022-07-08 17:20:01', null, 'ROLE_USER');
INSERT INTO `sys_user` VALUES ('28', 'ddd', '123', 'ddd', '', '', '', '2022-11-09 10:41:07', 'http://localhost:9090/file/7de0e50f915547539db12023cf997276.jpg', 'ROLE_USER');
INSERT INTO `sys_user` VALUES ('29', 'ffff', '123', null, null, null, null, '2022-12-10 11:53:31', null, 'ROLE_USER');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `user_id` int(11) DEFAULT NULL COMMENT '评论人id',
  `time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论时间',
  `pid` int(11) DEFAULT NULL COMMENT '父id',
  `origin_id` int(11) DEFAULT NULL COMMENT '最上级评论id',
  `article_id` int(11) DEFAULT NULL COMMENT '关联文章的id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('1', '测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试', '1', '2022-03-22 20:00:00', null, null, '1');
INSERT INTO `t_comment` VALUES ('2', '123', null, null, null, null, null);
INSERT INTO `t_comment` VALUES ('5', '回复内容', '1', '2022-03-22 21:01:00', null, null, '1');
INSERT INTO `t_comment` VALUES ('6', '4444', '1', '2022-03-22 21:03:15', '4', '4', '1');
INSERT INTO `t_comment` VALUES ('7', '5555', '1', '2022-03-22 21:04:11', '4', '4', '1');
INSERT INTO `t_comment` VALUES ('8', '444444', '1', '2022-03-22 21:29:55', '7', '7', '1');
INSERT INTO `t_comment` VALUES ('9', '5555', '1', '2022-03-22 21:30:04', '7', '7', '1');
INSERT INTO `t_comment` VALUES ('10', '666', '1', '2022-03-22 21:34:05', '7', '4', '1');
INSERT INTO `t_comment` VALUES ('11', '甄姬真的好大好大！！', '16', '2022-03-22 21:38:26', '10', '4', '1');
INSERT INTO `t_comment` VALUES ('13', '哈哈哈哈，我是ddd', '28', '2022-03-22 21:46:01', '12', '12', '1');
INSERT INTO `t_comment` VALUES ('14', '我是李信，我很萌', '20', '2022-03-22 21:46:48', '13', '12', '1');
INSERT INTO `t_comment` VALUES ('15', '我在回复ddd', '20', '2022-03-22 21:47:03', '13', '12', '1');
INSERT INTO `t_comment` VALUES ('16', '我是李信', '20', '2022-03-22 21:48:19', '4', '4', '1');
INSERT INTO `t_comment` VALUES ('17', '33333', '20', '2022-03-22 21:48:42', '5', '5', '1');
INSERT INTO `t_comment` VALUES ('19', '我是李信嗯嗯嗯', '20', '2022-03-22 21:49:21', '1', '1', '1');
INSERT INTO `t_comment` VALUES ('21', '哈哈哈 我是ddd', '28', '2022-03-22 21:50:04', '20', '1', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '性别',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `integral` int(255) DEFAULT '0' COMMENT '会员积分',
  `money` int(11) DEFAULT '0' COMMENT '消费金额',
  `level` int(11) DEFAULT '1' COMMENT '会员等级',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `balance` float(255,0) DEFAULT '0' COMMENT '积分余额',
  `role` int(11) DEFAULT NULL COMMENT '''角色，1管理员，2用户''',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '''用户名''',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员表\r\n';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '李白', '18', '男', '河南省郑州市', '200', '200', '1', '2022-04-21 20:39:35', '200', '2', null, '');
INSERT INTO `user` VALUES ('2', '曾志同', '22', '男', '湖南省', '3000', '3000', '1', '2022-04-21 20:39:36', '3000', '2', null, '');
INSERT INTO `user` VALUES ('3', '李玲玲', '22', '女', '北京市', '2121', '1000', '1', '2022-04-21 22:43:04', '1121', '2', null, '');
INSERT INTO `user` VALUES ('4', '呜呜呜', '22', '女', '22', '0', '1', '1', '2022-04-21 20:40:06', '0', '2', null, '');
INSERT INTO `user` VALUES ('5', 'da', '19', '男', 'dada', '0', '1', '1', '2022-04-21 20:40:08', '0', '2', null, '');
INSERT INTO `user` VALUES ('6', '吾问无为谓为', '22', '未知', '2', '0', '1', '1', '2022-04-21 20:40:10', '0', '2', null, '');
INSERT INTO `user` VALUES ('7', '五子棋', '11', '女', '问我', '0', '0', '1', '2022-04-21 20:40:11', '0', '2', null, '');
INSERT INTO `user` VALUES ('8', '问我', '22', '男', '2', '0', '0', '1', '2022-04-21 20:40:31', '0', '1', 'wxs', '1234');
INSERT INTO `user` VALUES ('9', 'bbj', '20', '男', 'nnnnnn', '0', '0', '1', '2022-04-21 22:13:06', '0', '2', 'test', '1234');