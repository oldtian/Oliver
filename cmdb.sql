/*
Navicat MySQL Data Transfer

Source Server         : 192.168.56.100
Source Server Version : 50623
Source Host           : localhost:3307
Source Database       : cmdb

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2016-04-20 08:55:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add IP地址', '7', 'add_ipaddr');
INSERT INTO `auth_permission` VALUES ('20', 'Can change IP地址', '7', 'change_ipaddr');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete IP地址', '7', 'delete_ipaddr');
INSERT INTO `auth_permission` VALUES ('22', 'Can add 服务器', '8', 'add_server');
INSERT INTO `auth_permission` VALUES ('23', 'Can change 服务器', '8', 'change_server');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete 服务器', '8', 'delete_server');
INSERT INTO `auth_permission` VALUES ('25', 'Can add disk', '9', 'add_disk');
INSERT INTO `auth_permission` VALUES ('26', 'Can change disk', '9', 'change_disk');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete disk', '9', 'delete_disk');
INSERT INTO `auth_permission` VALUES ('28', 'Can add 机房', '10', 'add_idc');
INSERT INTO `auth_permission` VALUES ('29', 'Can change 机房', '10', 'change_idc');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete 机房', '10', 'delete_idc');
INSERT INTO `auth_permission` VALUES ('31', 'Can add 业务平台', '11', 'add_businessunit');
INSERT INTO `auth_permission` VALUES ('32', 'Can change 业务平台', '11', 'change_businessunit');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete 业务平台', '11', 'delete_businessunit');
INSERT INTO `auth_permission` VALUES ('34', 'Can add 项目应用', '12', 'add_app');
INSERT INTO `auth_permission` VALUES ('35', 'Can change 项目应用', '12', 'change_app');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete 项目应用', '12', 'delete_app');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 操作日志', '13', 'add_handlelog');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 操作日志', '13', 'change_handlelog');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 操作日志', '13', 'delete_handlelog');
INSERT INTO `auth_permission` VALUES ('40', 'Can add 网站嗅探', '14', 'add_websniff');
INSERT INTO `auth_permission` VALUES ('41', 'Can change 网站嗅探', '14', 'change_websniff');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete 网站嗅探', '14', 'delete_websniff');
INSERT INTO `auth_permission` VALUES ('43', 'Can add 主机组', '15', 'add_hostgroup');
INSERT INTO `auth_permission` VALUES ('44', 'Can change 主机组', '15', 'change_hostgroup');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete 主机组', '15', 'delete_hostgroup');
INSERT INTO `auth_permission` VALUES ('46', 'Can add 模块列表', '16', 'add_modulelist');
INSERT INTO `auth_permission` VALUES ('47', 'Can change 模块列表', '16', 'change_modulelist');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete 模块列表', '16', 'delete_modulelist');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 审计日志', '17', 'add_serverhistory');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 审计日志', '17', 'change_serverhistory');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 审计日志', '17', 'delete_serverhistory');
INSERT INTO `auth_permission` VALUES ('52', 'Can add User', '18', 'add_user');
INSERT INTO `auth_permission` VALUES ('53', 'Can change User', '18', 'change_user');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete User', '18', 'delete_user');
INSERT INTO `auth_permission` VALUES ('55', 'Can add 项目负责人', '19', 'add_leader');
INSERT INTO `auth_permission` VALUES ('56', 'Can change 项目负责人', '19', 'change_leader');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete 项目负责人', '19', 'delete_leader');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$20000$amgBwZO1SGrU$Wc6EUJWbrdKzDDc7NTH+ubkt1CCsMHvSptBjYhBDfLQ=', '2016-03-18 01:19:58', '1', 'admin', '', '', 'admin@152.com', '1', '1', '2016-03-15 11:08:18');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_30a071c9_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_5151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_1c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2016-03-15 11:09:00', '1', 'server1,SN00010,,Linux23,公司机房,营销平台', '2', 'Changed sn and service_time.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2016-03-15 11:19:15', '1', 'server1,HT00011,SDRR,Linux23,公司机房,营销平台', '2', 'Changed sn.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2016-03-15 11:21:10', '1', 'server1,HT00012,,Linux23,公司机房,营销平台', '2', 'Changed sn.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2016-03-15 11:55:36', '2', '1,300,SAS,1', '3', '', '9', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2016-03-15 11:55:36', '1', '2,300,SAS,5', '3', '', '9', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2016-03-16 03:07:52', '13', '2,600,SAS,1', '1', '', '9', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2016-03-16 03:08:26', '14', '3,1000,SATA,5', '1', '', '9', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2016-03-16 03:08:46', '15', '2,300,SAS,1', '1', '', '9', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2016-03-16 03:09:02', '16', '2,300,SAS,1', '1', '', '9', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2016-03-16 03:09:16', '17', '2,300,SAS,1', '1', '', '9', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2016-03-16 03:09:29', '18', '2,300,SAS,1', '1', '', '9', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2016-03-16 03:09:49', '19', '2,300,SAS,1', '1', '', '9', '1');
INSERT INTO `django_admin_log` VALUES ('13', '2016-03-17 11:08:36', '6', '应用33，应用34,', '3', '', '12', '1');
INSERT INTO `django_admin_log` VALUES ('14', '2016-03-18 01:22:03', '1', 'Linux Nginx', '1', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('15', '2016-03-18 01:22:14', '2', 'Linux MySQL', '1', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('16', '2016-03-18 01:22:28', '3', 'Linux Test', '1', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('17', '2016-03-18 01:52:25', '30', 'server59,SN000059,R720,linux59,科韵路机房,DR平台', '2', 'Changed hostgroup.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('18', '2016-03-18 01:52:30', '29', 'server73,SN000078,R720,linux73,科韵路机房,西普平台', '2', 'Changed hostgroup.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('19', '2016-03-18 01:52:36', '27', 'server77,SN000231,R234,linux77,公司机房,营销平台', '2', 'Changed hostgroup.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('20', '2016-03-18 01:52:41', '26', 'server98,sn00003344,hp230,linux98,公司机房,管理平台', '2', 'Changed hostgroup.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('21', '2016-03-18 01:52:46', '25', 'server26,HT00025,r256,linux26,公司机房,管理平台', '2', 'Changed hostgroup.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('22', '2016-03-18 01:52:52', '23', 'server5,sn00005,R420,linux5,公司机房,西普平台', '2', 'Changed hostgroup.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('23', '2016-03-18 05:16:17', '25', 'server26,HT00025,r256,linux26,公司机房,管理平台', '2', 'Changed hostgroup.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('24', '2016-03-18 06:33:26', '26', 'server98,sn00003344,hp230,linux98,公司机房,管理平台', '2', 'Changed hostgroup.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('25', '2016-03-18 06:33:33', '23', 'server5,sn00005,R420,linux5,公司机房,西普平台', '2', 'Changed hostgroup.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('26', '2016-03-18 06:33:39', '30', 'server59,SN000059,R720,linux59,科韵路机房,DR平台', '2', 'Changed hostgroup.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('27', '2016-03-18 06:33:44', '29', 'server73,SN000078,R720,linux73,科韵路机房,西普平台', '2', 'Changed hostgroup.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('28', '2016-03-18 06:33:49', '27', 'server77,SN000231,R234,linux77,公司机房,营销平台', '2', 'Changed hostgroup.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('29', '2016-03-18 07:34:32', '4', 'Linux LVS', '2', 'Changed member.', '15', '1');
INSERT INTO `django_admin_log` VALUES ('30', '2016-03-18 09:38:07', '26', 'server98,sn00003344,hp230,linux98,公司机房,管理平台', '2', 'Changed hostgroup.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('31', '2016-03-18 09:38:13', '23', 'server5,sn00005,R420,linux5,公司机房,西普平台', '2', 'Changed hostgroup.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('32', '2016-03-18 09:38:19', '22', 'server14,SN000231,R710,linux14,公司机房,管理平台', '2', 'Changed hostgroup.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('33', '2016-03-18 09:38:25', '1', 'server1,SN000231,Intel,Linux23,公司机房,营销平台', '2', 'Changed hostgroup.', '8', '1');
INSERT INTO `django_admin_log` VALUES ('34', '2016-03-18 11:16:16', '9', 'Linux Hdp', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('35', '2016-03-18 11:23:33', '8', 'test12', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('36', '2016-03-18 11:23:33', '7', 'test11', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('37', '2016-03-18 11:23:33', '3', 'Linux Test', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('38', '2016-03-19 10:19:50', '1001', '1001_查看系统日志模块', '1', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('39', '2016-03-19 10:25:07', '1001', '1001_看系统日志', '2', 'Changed module_name, module_caption and module_extend.', '16', '1');
INSERT INTO `django_admin_log` VALUES ('40', '2016-03-19 10:25:32', '1002', '1002_查看最新登录', '1', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('41', '2016-03-19 10:26:00', '1003', '1003_查看系统版本', '1', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('42', '2016-03-21 08:49:13', '2', 'Linux MySQL', '2', 'Changed member.', '15', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('18', 'users', 'user');
INSERT INTO `django_content_type` VALUES ('12', 'ywmodels', 'app');
INSERT INTO `django_content_type` VALUES ('11', 'ywmodels', 'businessunit');
INSERT INTO `django_content_type` VALUES ('9', 'ywmodels', 'disk');
INSERT INTO `django_content_type` VALUES ('13', 'ywmodels', 'handlelog');
INSERT INTO `django_content_type` VALUES ('15', 'ywmodels', 'hostgroup');
INSERT INTO `django_content_type` VALUES ('10', 'ywmodels', 'idc');
INSERT INTO `django_content_type` VALUES ('7', 'ywmodels', 'ipaddr');
INSERT INTO `django_content_type` VALUES ('19', 'ywmodels', 'leader');
INSERT INTO `django_content_type` VALUES ('16', 'ywmodels', 'modulelist');
INSERT INTO `django_content_type` VALUES ('8', 'ywmodels', 'server');
INSERT INTO `django_content_type` VALUES ('17', 'ywmodels', 'serverhistory');
INSERT INTO `django_content_type` VALUES ('14', 'ywmodels', 'websniff');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2016-03-15 09:48:20');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2016-03-15 09:48:20');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2016-03-15 09:48:20');
INSERT INTO `django_migrations` VALUES ('4', 'contenttypes', '0002_remove_content_type_name', '2016-03-15 09:48:20');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0002_alter_permission_name_max_length', '2016-03-15 09:48:20');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0003_alter_user_email_max_length', '2016-03-15 09:48:20');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0004_alter_user_username_opts', '2016-03-15 09:48:20');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0005_alter_user_last_login_null', '2016-03-15 09:48:20');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0006_require_contenttypes_0002', '2016-03-15 09:48:20');
INSERT INTO `django_migrations` VALUES ('10', 'sessions', '0001_initial', '2016-03-15 09:48:21');
INSERT INTO `django_migrations` VALUES ('11', 'ywmodels', '0001_initial', '2016-03-15 09:48:21');
INSERT INTO `django_migrations` VALUES ('12', 'ywmodels', '0002_auto_20160315_1751', '2016-03-15 09:51:40');
INSERT INTO `django_migrations` VALUES ('13', 'ywmodels', '0003_auto_20160315_1752', '2016-03-15 09:52:57');
INSERT INTO `django_migrations` VALUES ('14', 'ywmodels', '0004_auto_20160315_1754', '2016-03-15 09:55:05');
INSERT INTO `django_migrations` VALUES ('15', 'ywmodels', '0005_auto_20160315_1759', '2016-03-15 10:00:00');
INSERT INTO `django_migrations` VALUES ('16', 'ywmodels', '0006_auto_20160315_1900', '2016-03-15 11:00:31');
INSERT INTO `django_migrations` VALUES ('17', 'ywmodels', '0007_auto_20160316_1027', '2016-03-16 02:27:10');
INSERT INTO `django_migrations` VALUES ('18', 'ywmodels', '0008_auto_20160318_0909', '2016-03-18 01:09:18');
INSERT INTO `django_migrations` VALUES ('19', 'ywmodels', '0009_modulelist', '2016-03-19 08:49:24');
INSERT INTO `django_migrations` VALUES ('20', 'ywmodels', '0010_auto_20160319_1824', '2016-03-19 10:24:10');
INSERT INTO `django_migrations` VALUES ('21', 'ywmodels', '0011_auto_20160319_1842', '2016-03-19 10:42:28');
INSERT INTO `django_migrations` VALUES ('22', 'ywmodels', '0012_serverhistory', '2016-03-24 03:53:33');
INSERT INTO `django_migrations` VALUES ('23', 'ywmodels', '0013_auto_20160324_1502', '2016-03-24 07:02:38');
INSERT INTO `django_migrations` VALUES ('24', 'ywmodels', '0014_auto_20160324_1529', '2016-03-24 07:29:33');
INSERT INTO `django_migrations` VALUES ('25', 'ywmodels', '0015_server_host_type', '2016-03-28 09:32:42');
INSERT INTO `django_migrations` VALUES ('26', 'ywmodels', '0016_remove_server_host_type', '2016-03-28 09:39:28');
INSERT INTO `django_migrations` VALUES ('27', 'ywmodels', '0017_auto_20160328_1003', '2016-03-28 10:03:27');
INSERT INTO `django_migrations` VALUES ('28', 'ywmodels', '0018_auto_20160328_1026', '2016-03-28 10:26:17');
INSERT INTO `django_migrations` VALUES ('29', 'users', '0001_initial', '2016-03-28 15:12:46');
INSERT INTO `django_migrations` VALUES ('30', 'users', '0002_alter_user_last_login_null', '2016-03-28 15:12:46');
INSERT INTO `django_migrations` VALUES ('31', 'ywmodels', '0019_server_tag', '2016-03-29 09:12:00');
INSERT INTO `django_migrations` VALUES ('32', 'ywmodels', '0020_auto_20160330_1047', '2016-03-30 10:47:21');
INSERT INTO `django_migrations` VALUES ('33', 'ywmodels', '0021_auto_20160330_1401', '2016-03-30 14:01:31');
INSERT INTO `django_migrations` VALUES ('34', 'ywmodels', '0022_auto_20160330_1427', '2016-03-30 14:27:55');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('cm1p4xkxonq7a1fnc5wt4q53nxbva36j', 'OTczYTkwMTc0YmU4MjM4NmZiOTYxODNlYjRhY2E3ODEzMjYwYjM3Yzp7Il9hdXRoX3VzZXJfaGFzaCI6ImJmNDI0YjZmNjMyODQ1ZmM0NGNiNDdiZGFjYjI0NDVlOTZmNDQ3MGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2016-05-03 16:57:54');
INSERT INTO `django_session` VALUES ('pww6oqbdzjh22qrbhhm62g5bcfsf3j63', 'MDdlM2YwZGMzYmJmMjc0Mjg0YjM5ZmJiMzFlOTIyYjJjNzAwMDNlODp7Il9hdXRoX3VzZXJfaGFzaCI6IjE3ZDU3MWY5YjhhZTQzMzg5Zjk3ODAzYjJlMzMxY2FhN2I4OTIzYTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-04-01 01:19:58');
INSERT INTO `django_session` VALUES ('r38kgre480mjfmp8fwu416kcyyiwqs6h', 'OTczYTkwMTc0YmU4MjM4NmZiOTYxODNlYjRhY2E3ODEzMjYwYjM3Yzp7Il9hdXRoX3VzZXJfaGFzaCI6ImJmNDI0YjZmNjMyODQ1ZmM0NGNiNDdiZGFjYjI0NDVlOTZmNDQ3MGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2016-04-22 12:56:58');

-- ----------------------------
-- Table structure for users_user
-- ----------------------------
DROP TABLE IF EXISTS `users_user`;
CREATE TABLE `users_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `user_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `users_user_user_type_id_2a3dd1f9_fk_django_content_type_id` (`user_type_id`),
  CONSTRAINT `users_user_user_type_id_2a3dd1f9_fk_django_content_type_id` FOREIGN KEY (`user_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_user
-- ----------------------------


-- ----------------------------
-- Table structure for users_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_user_groups`;
CREATE TABLE `users_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `users_user_groups_group_id_4a1739d2_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_user_groups_group_id_4a1739d2_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `users_user_groups_user_id_6549f6f5_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for users_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_user_user_permissions`;
CREATE TABLE `users_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `users_user_user_per_permission_id_3ff79df3_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `users_user_user_per_permission_id_3ff79df3_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_user_user_permissions_user_id_23f6d8b9_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for ywmodels_app
-- ----------------------------
DROP TABLE IF EXISTS `ywmodels_app`;
CREATE TABLE `ywmodels_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `server_info_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ywmodels_app_54108280` (`server_info_id`),
  CONSTRAINT `ywmodels_app_server_info_id_1ffa067_fk_ywmodels_server_id` FOREIGN KEY (`server_info_id`) REFERENCES `ywmodels_server` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ywmodels_app
-- ----------------------------

-- ----------------------------
-- Table structure for ywmodels_businessunit
-- ----------------------------
DROP TABLE IF EXISTS `ywmodels_businessunit`;
CREATE TABLE `ywmodels_businessunit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `memo` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ywmodels_businessunit
-- ----------------------------
INSERT INTO `ywmodels_businessunit` VALUES ('24', '管理平台', '');
INSERT INTO `ywmodels_businessunit` VALUES ('25', '营销平台', '');
INSERT INTO `ywmodels_businessunit` VALUES ('26', 'DR数据平台', '');
INSERT INTO `ywmodels_businessunit` VALUES ('27', '药店人平台', '');
INSERT INTO `ywmodels_businessunit` VALUES ('28', '西普平台', '');
INSERT INTO `ywmodels_businessunit` VALUES ('29', '', '');
INSERT INTO `ywmodels_businessunit` VALUES ('30', '医患药平台', '');
INSERT INTO `ywmodels_businessunit` VALUES ('31', '其它', '');

-- ----------------------------
-- Table structure for ywmodels_disk
-- ----------------------------
DROP TABLE IF EXISTS `ywmodels_disk`;
CREATE TABLE `ywmodels_disk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pd_type` varchar(64) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `raid` int(11) DEFAULT NULL,
  `memo` longtext,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `server_info_id` int(11) DEFAULT NULL,
  `dgroup` int(11),
  PRIMARY KEY (`id`),
  KEY `ywmodels_disk_54108280` (`server_info_id`),
  CONSTRAINT `ywmodels_disk_server_info_id_ae90702_fk_ywmodels_server_id` FOREIGN KEY (`server_info_id`) REFERENCES `ywmodels_server` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ywmodels_disk
-- ----------------------------

-- ----------------------------
-- Table structure for ywmodels_handlelog
-- ----------------------------
DROP TABLE IF EXISTS `ywmodels_handlelog`;
CREATE TABLE `ywmodels_handlelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `create_at` datetime NOT NULL,
  `creator_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ywmodels_handlelog_creator_id_304e6610_fk_auth_user_id` (`creator_id`),
  CONSTRAINT `ywmodels_handlelog_creator_id_304e6610_fk_auth_user_id` FOREIGN KEY (`creator_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ywmodels_handlelog
-- ----------------------------

-- ----------------------------
-- Table structure for ywmodels_hostgroup
-- ----------------------------
DROP TABLE IF EXISTS `ywmodels_hostgroup`;
CREATE TABLE `ywmodels_hostgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `member` varchar(1000) DEFAULT NULL,
  `memo` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ywmodels_hostgroup
-- ----------------------------
INSERT INTO `ywmodels_hostgroup` VALUES ('12', 'Linux Nginx', '192.168.1.22,192.168.1.23', '');
INSERT INTO `ywmodels_hostgroup` VALUES ('13', 'Linux MySQL', '', '');
INSERT INTO `ywmodels_hostgroup` VALUES ('16', 'Linux Test', '192.168.1.6,192.168.1.7,192.168.1.14', '');

-- ----------------------------
-- Table structure for ywmodels_idc
-- ----------------------------
DROP TABLE IF EXISTS `ywmodels_idc`;
CREATE TABLE `ywmodels_idc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region` varchar(64) NOT NULL,
  `name` varchar(32) NOT NULL,
  `floor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ywmodels_idc
-- ----------------------------
INSERT INTO `ywmodels_idc` VALUES ('6', '', '公司机房', null);
INSERT INTO `ywmodels_idc` VALUES ('7', '', '科韵路机房', null);

-- ----------------------------
-- Table structure for ywmodels_ipaddr
-- ----------------------------
DROP TABLE IF EXISTS `ywmodels_ipaddr`;
CREATE TABLE `ywmodels_ipaddr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_type` varchar(50) NOT NULL,
  `address` char(39) DEFAULT NULL,
  `server_info_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ywmodels_ipaddr_54108280` (`server_info_id`),
  CONSTRAINT `ywmodels_ipaddr_server_info_id_6c787c9b_fk_ywmodels_server_id` FOREIGN KEY (`server_info_id`) REFERENCES `ywmodels_server` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ywmodels_ipaddr
-- ----------------------------
INSERT INTO `ywmodels_ipaddr` VALUES ('86', '管理IP', '192.168.1.6', '72');
INSERT INTO `ywmodels_ipaddr` VALUES ('87', '管理IP', '192.168.1.7', '73');
INSERT INTO `ywmodels_ipaddr` VALUES ('90', '管理IP', '192.168.1.14', '76');
INSERT INTO `ywmodels_ipaddr` VALUES ('91', '管理IP', '192.168.1.21', '77');
INSERT INTO `ywmodels_ipaddr` VALUES ('92', '管理IP', '192.168.1.21', '78');
INSERT INTO `ywmodels_ipaddr` VALUES ('93', '管理IP', '192.168.1.22', '79');
INSERT INTO `ywmodels_ipaddr` VALUES ('94', '管理IP', '192.168.1.23', '80');
INSERT INTO `ywmodels_ipaddr` VALUES ('95', '管理IP', '192.168.56.12', '81');
INSERT INTO `ywmodels_ipaddr` VALUES ('96', '管理IP', '192.168.56.13', '82');
INSERT INTO `ywmodels_ipaddr` VALUES ('97', '管理IP', '192.168.56.15', '83');
INSERT INTO `ywmodels_ipaddr` VALUES ('98', '管理IP', '192.168.56.17', '84');
INSERT INTO `ywmodels_ipaddr` VALUES ('99', '管理IP', '192.168.56.198', '85');
INSERT INTO `ywmodels_ipaddr` VALUES ('100', '管理IP', '192.168.57.13', '86');
INSERT INTO `ywmodels_ipaddr` VALUES ('101', '管理IP', '192.168.0.254', '87');
INSERT INTO `ywmodels_ipaddr` VALUES ('102', '管理IP', '192.168.87.1', '88');

-- ----------------------------
-- Table structure for ywmodels_leader
-- ----------------------------
DROP TABLE IF EXISTS `ywmodels_leader`;
CREATE TABLE `ywmodels_leader` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `position` varchar(50) NOT NULL,
  `memo` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ywmodels_leader
-- ----------------------------
INSERT INTO `ywmodels_leader` VALUES ('6', '陈开敏', '', '');
INSERT INTO `ywmodels_leader` VALUES ('7', '小马哥', '', '');
INSERT INTO `ywmodels_leader` VALUES ('8', '', '', '');
INSERT INTO `ywmodels_leader` VALUES ('9', '田文丰', '', '');

-- ----------------------------
-- Table structure for ywmodels_modulelist
-- ----------------------------
DROP TABLE IF EXISTS `ywmodels_modulelist`;
CREATE TABLE `ywmodels_modulelist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '模块ID号',
  `module_name` char(20) NOT NULL COMMENT '模块名称',
  `module_caption` char(255) NOT NULL COMMENT '模块功能描述',
  `module_extend` varchar(2000) NOT NULL COMMENT '模块前端扩展',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1011 DEFAULT CHARSET=utf8 COMMENT='模块列表';

-- ----------------------------
-- Records of ywmodels_modulelist
-- ----------------------------
INSERT INTO `ywmodels_modulelist` VALUES ('1001', '查看系统日志', '查看所选服务器的操作系统日志信息', '返回信息行数：<input name=\"sys_param_1\" id=\"sys_param_1\" type=\"text\" size=\"5\" maxlength=\"3\" value=\"50\">');
INSERT INTO `ywmodels_modulelist` VALUES ('1002', '查看最新登录', '查看所选服务器的最近的用户登录信息', '返回信息行数：<input name=\"sys_param_1\" id=\"sys_param_1\" type=\"text\" size=\"5\" maxlength=\"3\" value=\"50\">');
INSERT INTO `ywmodels_modulelist` VALUES ('1003', '查看系统版本', '查看所选服务器操作系统的版本信息', '');
INSERT INTO `ywmodels_modulelist` VALUES ('1004', '查看内核模块', '查看所选服务器操作系统的内核模块信息', '');
INSERT INTO `ywmodels_modulelist` VALUES ('1005', '同步应用文件', '同步选择的应用文件(可动态添加)到所选的目标服务器', '选择同步文件：<select name=\"sys_param_1\" id=\"sys_param_1\"> <option value=\"nginx\" selected>nginx启动脚本</option> <option value=\"nginx_config\">nginx配置文件 </option> <option value=\"haproxy\" selected>Haproxy配置文件</option> <option value=\"syslog\" selected>syslog配置文件</option> \n<option value=\"sysctl\" selected>sysctl配置文件</option> <option value=\"resin\" selected>resin配置文件</option> <option value=\"resinhttpd\" selected>resin_httpd</option> <option value=\"resinja\nr\" selected>resin.jar</option> </select>');
INSERT INTO `ywmodels_modulelist` VALUES ('1006', '查看应用配置', '查看指定的服务的配置信息', '进程服务名称：<select name=\"sys_param_1\" id=\"sys_param_1\">  <option value=\"resin\" selected>resin</option>  <option \nvalue=\"nginx\">nginx</option>  <option value=\"haproxy\">haproxy</option>  <option value=\"apache\">apache</option>  <option value=\"mysql\">mysql</option>  <option value=\"lighttpd\">lighttpd</opti\non> <option value=\"firewall\" selected>iptables</option></select>');
INSERT INTO `ywmodels_modulelist` VALUES ('1007', '重启进程服务', '重启目标服务器的指定的进程或服务', '进程服务名称： <select name=\"sys_param_1\" id=\"sys_param_1\">   <option value=\"resin\" selected>resin</option>\n   <option value=\"nginx\">nginx</option>   <option value=\"haproxy\">haproxy</option>   <option value=\"apache\">apache</option>   <option value=\"mysql\">mysql</option>   <option value=\"lighttpd\"\n>lighttpd</option>  <option value=\"iptables\"\n>iptables</option> <option value=\"clamd\"\n>clamd</option></select>');
INSERT INTO `ywmodels_modulelist` VALUES ('1008', '查看硬件资源', '查看系统CPU负载，内存使用情况，磁盘使用情况，网络使用情况', '选择资源选项：\r\n<select name=\"sys_param_1\" id=\"sys_param_1\"> \r\n	<option value=\"cpu\" selected>负载</option>\r\n	<option value=\"memory\">内存 </option> \r\n	<option value=\"disk\" selected>磁盘</option>\r\n	<option value=\"nic\" selected>网络</option>\r\n</select>');
INSERT INTO `ywmodels_modulelist` VALUES ('1009', '集中端口扫描', '对所选服务器进行集中端口扫描，指定扫描端口范围如：1-1000', '扫描端口范围：\r\n<input name=\"sys_param_1\" id=\"sys_param_1\" type=\"text\" size=\"5\" maxlength=\"7\" value=\"22\">');
INSERT INTO `ywmodels_modulelist` VALUES ('1010', '集中病毒扫描', '对所选服务器指定目录进行病毒扫描', '指定扫描目录：<input name=\"sys_param_1\" id=\"sys_param_1\" type=\"text\" size=\"30\" maxlength=\"50\" value=\"/tmp\">');

-- ----------------------------
-- Table structure for ywmodels_server
-- ----------------------------
DROP TABLE IF EXISTS `ywmodels_server`;
CREATE TABLE `ywmodels_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(128) NOT NULL,
  `sn` varchar(64) NOT NULL,
  `service_time` date DEFAULT NULL,
  `device_type` varchar(50) NOT NULL,
  `cabinet_num` varchar(50) NOT NULL,
  `manufactory` varchar(128) NOT NULL,
  `model` varchar(128) NOT NULL,
  `os_platform` varchar(64) NOT NULL,
  `cpu_count` int(11) DEFAULT NULL,
  `cpu_physical_count` int(11) DEFAULT NULL,
  `cpu_model` varchar(128) NOT NULL,
  `mem_capacity` int(11) DEFAULT NULL,
  `status` varchar(30) NOT NULL,
  `band` varchar(100) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `business_id` int(11) DEFAULT NULL,
  `idc_id` int(11) DEFAULT NULL,
  `hostgroup_id` int(11),
  `tag` varchar(100) NOT NULL,
  `leader_id` int(11),
  PRIMARY KEY (`id`),
  KEY `ywmodels_server_idc_id_561324c_fk_ywmodels_idc_id` (`idc_id`),
  KEY `ywmodels_server_business_id_175ce695_fk_ywmodels_businessunit_id` (`business_id`),
  KEY `ywmodels_server_d4ed0a4a` (`hostgroup_id`),
  KEY `ywmodels_server_f15f5b40` (`leader_id`),
  CONSTRAINT `ywmodels_server_business_id_175ce695_fk_ywmodels_businessunit_id` FOREIGN KEY (`business_id`) REFERENCES `ywmodels_businessunit` (`id`),
  CONSTRAINT `ywmodels_server_hostgroup_id_4cca6035_fk_ywmodels_hostgroup_id` FOREIGN KEY (`hostgroup_id`) REFERENCES `ywmodels_hostgroup` (`id`),
  CONSTRAINT `ywmodels_server_idc_id_561324c_fk_ywmodels_idc_id` FOREIGN KEY (`idc_id`) REFERENCES `ywmodels_idc` (`id`),
  CONSTRAINT `ywmodels_server_leader_id_1ea4a1d0_fk_ywmodels_leader_id` FOREIGN KEY (`leader_id`) REFERENCES `ywmodels_leader` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ywmodels_server
-- ----------------------------
INSERT INTO `ywmodels_server` VALUES ('72', 'server6', 'sn00001', '2017-07-13', '物理服务器', '', 'DELL', '', 'linux59', '4', '1', '', '4', 'online', '', '2016-04-07 14:24:57', '2016-04-19 17:04:21', '30', '6', '16', '', '8');
INSERT INTO `ywmodels_server` VALUES ('73', 'server7', '', '2010-01-01', 'ESXi服务器', '', 'HP', '', 'linux5', '4', '1', '', '4', 'online', '', '2016-04-07 14:25:17', '2016-04-19 17:04:21', '27', '6', '16', '', '8');
INSERT INTO `ywmodels_server` VALUES ('76', 'server14', 'sn00123', '2010-01-01', 'ESXi服务器', '', 'DELL', '', '', '4', '1', '', '4', 'online', '', '2016-04-07 17:43:51', '2016-04-19 17:04:21', '24', '6', '16', '', '8');
INSERT INTO `ywmodels_server` VALUES ('77', 'server15', 'sn00005', '2013-06-11', '物理服务器', 'E2304', 'DELL', '', 'linux5', '4', '1', '', '4', 'online', '', '2016-04-07 17:44:31', '2016-04-19 17:01:06', '27', '6', null, '测试服务器02', '7');
INSERT INTO `ywmodels_server` VALUES ('78', 'server21', 'SN00025', '2015-02-06', '物理服务器', '', 'DELL', '', '', '4', '1', '', '4', 'online', '', '2016-04-08 13:10:59', '2016-04-13 15:07:29', '24', '6', null, '', '8');
INSERT INTO `ywmodels_server` VALUES ('79', 'servev22', '', '2012-02-08', '虚拟服务器', '', 'DELL', '', '', '4', '1', '', '4', 'online', '', '2016-04-08 13:11:12', '2016-04-19 17:04:45', '28', '6', '12', '', '8');
INSERT INTO `ywmodels_server` VALUES ('80', 'server23', '', '2010-01-01', '虚拟服务器', '', 'DELL', '', '', '4', '1', '', '4', 'offline', '', '2016-04-08 13:11:30', '2016-04-19 17:04:45', '24', '6', '12', '', '8');
INSERT INTO `ywmodels_server` VALUES ('81', 'server12', '', '2010-01-01', '物理服务器', '', 'DELL', '', '', '4', '1', '', '4', 'offline', '', '2016-04-12 09:27:13', '2016-04-19 17:02:12', '31', '6', null, '', '8');
INSERT INTO `ywmodels_server` VALUES ('82', 'server13', '', '2010-01-01', '物理服务器', '', 'DELL', '', '', '4', '1', '', '4', 'online', '', '2016-04-12 09:27:23', '2016-04-13 14:10:16', '24', '6', null, '', '8');
INSERT INTO `ywmodels_server` VALUES ('83', 'server98', '', '2010-01-01', '物理服务器', '', 'DELL', '', '', '4', '1', '', '4', 'offline', '', '2016-04-12 09:27:53', '2016-04-19 16:59:08', '27', '6', null, '', '8');
INSERT INTO `ywmodels_server` VALUES ('84', 'server67', '', '2010-01-01', '物理服务器', '', 'DELL', '', '', '4', '1', '', '4', 'online', '', '2016-04-12 09:28:14', '2016-04-12 09:28:14', '29', '6', null, '', '8');
INSERT INTO `ywmodels_server` VALUES ('85', 'server198', '', '2017-06-07', '物理服务器', '', 'DELL', '', '', '4', '1', '', '4', 'online', '', '2016-04-12 09:28:32', '2016-04-19 17:00:29', '28', '6', null, '', '8');
INSERT INTO `ywmodels_server` VALUES ('86', 'server253', '', '2010-01-01', '物理服务器', '', 'DELL', '', '', '4', '1', '', '4', 'online', '', '2016-04-12 09:43:06', '2016-04-19 17:01:48', '25', '6', null, '', '8');
INSERT INTO `ywmodels_server` VALUES ('87', 'switch1', '', '2010-01-01', '网络设备', '', 'DELL', '', '', '4', '1', '', '4', 'online', '', '2016-04-12 13:13:06', '2016-04-12 13:13:06', '25', '6', null, '', '8');
INSERT INTO `ywmodels_server` VALUES ('88', 'server88', '', '2010-01-01', '虚拟服务器', '', 'DELL', '', 'linux1', '4', '1', '', '4', 'online', '', '2016-04-14 14:11:54', '2016-04-19 17:01:36', '26', '7', null, '', '8');

-- ----------------------------
-- Table structure for ywmodels_serverhistory
-- ----------------------------
DROP TABLE IF EXISTS `ywmodels_serverhistory`;
CREATE TABLE `ywmodels_serverhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NOT NULL,
  `history_ip` varchar(45) NOT NULL,
  `history_user` varchar(45) NOT NULL,
  `history_datetime` datetime NOT NULL,
  `db_datetime` datetime NOT NULL,
  `history_command` varchar(765) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=631 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ywmodels_serverhistory
-- ----------------------------
INSERT INTO `ywmodels_serverhistory` VALUES ('538', '477', '192.168.56.100', 'root', '2016-03-30 16:02:59', '2016-03-30 16:03:45', 'tail -f omsys.log');
INSERT INTO `ywmodels_serverhistory` VALUES ('539', '478', '192.168.56.100', 'root', '2016-03-30 16:03:47', '2016-03-30 16:03:47', 'pwd');
INSERT INTO `ywmodels_serverhistory` VALUES ('540', '479', '192.168.56.100', 'root', '2016-03-30 16:03:48', '2016-03-30 16:03:48', 'ls');
INSERT INTO `ywmodels_serverhistory` VALUES ('541', '480', '192.168.56.100', 'root', '2016-03-30 15:48:44', '2016-03-30 16:04:01', 'python');
INSERT INTO `ywmodels_serverhistory` VALUES ('542', '480', '192.168.56.100', 'root', '2016-03-30 15:48:44', '2016-03-30 16:04:01', 'python');
INSERT INTO `ywmodels_serverhistory` VALUES ('543', '481', '192.168.56.100', 'root', '2016-03-30 16:04:02', '2016-03-30 16:04:02', 'pwd');
INSERT INTO `ywmodels_serverhistory` VALUES ('544', '482', '192.168.56.100', 'root', '2016-03-30 16:04:03', '2016-03-30 16:04:03', 'ls');
INSERT INTO `ywmodels_serverhistory` VALUES ('545', '482', '192.168.56.100', 'root', '2016-03-30 16:04:03', '2016-03-30 16:04:36', 'ls');
INSERT INTO `ywmodels_serverhistory` VALUES ('546', '482', '192.168.56.100', 'root', '2016-03-30 16:04:03', '2016-03-30 16:04:36', 'ls');
INSERT INTO `ywmodels_serverhistory` VALUES ('547', '483', '192.168.56.100', 'root', '2016-03-30 16:04:37', '2016-03-30 16:04:37', 'clear');
INSERT INTO `ywmodels_serverhistory` VALUES ('548', '484', '192.168.56.100', 'root', '2016-03-30 16:04:42', '2016-03-30 16:04:43', 'whoami');
INSERT INTO `ywmodels_serverhistory` VALUES ('549', '485', '192.168.56.100', 'root', '2016-03-30 16:04:46', '2016-03-30 16:04:47', 'ps -ef|grep nginx');
INSERT INTO `ywmodels_serverhistory` VALUES ('550', '485', '192.168.56.100', 'root', '2016-03-30 16:04:46', '2016-03-30 16:11:46', 'ps -ef|grep nginx');
INSERT INTO `ywmodels_serverhistory` VALUES ('551', '485', '192.168.56.100', 'root', '2016-03-30 16:04:46', '2016-03-30 16:11:47', 'ps -ef|grep nginx');
INSERT INTO `ywmodels_serverhistory` VALUES ('552', '486', '192.168.56.100', 'root', '2016-03-30 16:11:47', '2016-03-30 16:11:48', 'clear');
INSERT INTO `ywmodels_serverhistory` VALUES ('553', '486', '192.168.56.100', 'root', '2016-03-30 16:11:47', '2016-03-30 16:11:48', 'clear');
INSERT INTO `ywmodels_serverhistory` VALUES ('554', '486', '192.168.56.100', 'root', '2016-03-30 16:11:47', '2016-03-31 08:56:41', 'clear');
INSERT INTO `ywmodels_serverhistory` VALUES ('555', '487', '192.168.56.100', 'root', '2016-03-31 08:56:47', '2016-03-31 08:56:47', 'pwd');
INSERT INTO `ywmodels_serverhistory` VALUES ('556', '488', '192.168.56.100', 'root', '2016-03-31 08:56:47', '2016-03-31 08:56:47', 'ls');
INSERT INTO `ywmodels_serverhistory` VALUES ('557', '488', '192.168.56.100', 'root', '2016-03-31 08:56:47', '2016-03-31 08:57:51', 'ls');
INSERT INTO `ywmodels_serverhistory` VALUES ('558', '489', '192.168.56.100', 'root', '2016-03-31 08:57:51', '2016-03-31 08:57:52', 'pwd');
INSERT INTO `ywmodels_serverhistory` VALUES ('559', '490', '192.168.56.100', 'root', '2016-03-31 08:57:56', '2016-03-31 08:57:57', 'ps -ef');
INSERT INTO `ywmodels_serverhistory` VALUES ('560', '491', '192.168.56.100', 'root', '2016-03-31 08:58:00', '2016-03-31 08:58:02', 'top');
INSERT INTO `ywmodels_serverhistory` VALUES ('561', '492', '192.168.56.100', 'root', '2016-03-30 16:03:56', '2016-03-31 10:01:13', 'tail -f omsys.log');
INSERT INTO `ywmodels_serverhistory` VALUES ('562', '492', '192.168.56.100', 'root', '2016-03-30 16:03:56', '2016-03-31 10:01:13', 'tail -f omsys.log');
INSERT INTO `ywmodels_serverhistory` VALUES ('563', '493', '192.168.56.100', 'root', '2016-03-31 10:01:14', '2016-03-31 10:01:14', 'clear');
INSERT INTO `ywmodels_serverhistory` VALUES ('564', '493', '192.168.56.100', 'root', '2016-03-31 10:01:14', '2016-03-31 10:01:14', 'clear');
INSERT INTO `ywmodels_serverhistory` VALUES ('565', '493', '192.168.56.100', 'root', '2016-03-31 10:01:14', '2016-03-31 13:35:10', 'clear');
INSERT INTO `ywmodels_serverhistory` VALUES ('566', '493', '192.168.56.100', 'root', '2016-03-31 10:01:14', '2016-03-31 14:47:36', 'clear');
INSERT INTO `ywmodels_serverhistory` VALUES ('567', '494', '192.168.56.100', 'root', '2016-03-31 14:47:50', '2016-03-31 14:47:54', 'pip list |grep uwsgi');
INSERT INTO `ywmodels_serverhistory` VALUES ('568', '495', '192.168.56.100', 'root', '2016-03-31 14:47:58', '2016-03-31 14:47:59', 'pip list |grep -i uwsgi');
INSERT INTO `ywmodels_serverhistory` VALUES ('569', '495', '192.168.56.100', 'root', '2016-03-31 14:47:58', '2016-03-31 14:47:59', 'pip list |grep -i uwsgi');
INSERT INTO `ywmodels_serverhistory` VALUES ('570', '495', '192.168.56.100', 'root', '2016-03-31 14:47:58', '2016-03-31 14:48:00', 'pip list |grep -i uwsgi');
INSERT INTO `ywmodels_serverhistory` VALUES ('571', '496', '192.168.56.100', 'root', '2016-03-31 14:48:00', '2016-03-31 14:48:01', 'clear');
INSERT INTO `ywmodels_serverhistory` VALUES ('572', '496', '192.168.56.100', 'root', '2016-03-31 14:48:00', '2016-03-31 14:48:01', 'clear');
INSERT INTO `ywmodels_serverhistory` VALUES ('573', '497', '192.168.56.100', 'root', '2016-03-31 14:48:07', '2016-03-31 14:48:08', 'pip list |grep -i ansible');
INSERT INTO `ywmodels_serverhistory` VALUES ('574', '498', '192.168.56.100', 'root', '2016-03-31 14:48:13', '2016-03-31 14:48:18', 'rpm -aq |grep ansible');
INSERT INTO `ywmodels_serverhistory` VALUES ('575', '498', '192.168.56.100', 'root', '2016-03-31 14:48:13', '2016-03-31 14:48:19', 'rpm -aq |grep ansible');
INSERT INTO `ywmodels_serverhistory` VALUES ('576', '498', '192.168.56.100', 'root', '2016-03-31 14:48:13', '2016-03-31 14:48:19', 'rpm -aq |grep ansible');
INSERT INTO `ywmodels_serverhistory` VALUES ('577', '498', '192.168.56.100', 'root', '2016-03-31 14:48:13', '2016-03-31 14:48:19', 'rpm -aq |grep ansible');
INSERT INTO `ywmodels_serverhistory` VALUES ('578', '499', '192.168.56.100', 'root', '2016-03-31 14:48:26', '2016-03-31 14:48:38', 'python');
INSERT INTO `ywmodels_serverhistory` VALUES ('579', '499', '192.168.56.100', 'root', '2016-03-31 14:48:26', '2016-03-31 14:48:39', 'python');
INSERT INTO `ywmodels_serverhistory` VALUES ('580', '499', '192.168.56.100', 'root', '2016-03-31 14:48:26', '2016-03-31 14:48:39', 'python');
INSERT INTO `ywmodels_serverhistory` VALUES ('581', '499', '192.168.56.100', 'root', '2016-03-31 14:48:26', '2016-03-31 14:48:39', 'python');
INSERT INTO `ywmodels_serverhistory` VALUES ('582', '499', '192.168.56.100', 'root', '2016-03-31 14:48:26', '2016-03-31 15:01:18', 'python');
INSERT INTO `ywmodels_serverhistory` VALUES ('583', '499', '192.168.56.100', 'root', '2016-03-31 14:48:26', '2016-03-31 15:01:18', 'python');
INSERT INTO `ywmodels_serverhistory` VALUES ('584', '499', '192.168.56.100', 'root', '2016-03-31 14:48:26', '2016-03-31 15:01:18', 'python');
INSERT INTO `ywmodels_serverhistory` VALUES ('585', '500', '192.168.56.100', 'root', '2016-03-31 15:03:01', '2016-03-31 15:03:01', 'pip list');
INSERT INTO `ywmodels_serverhistory` VALUES ('586', '501', '192.168.56.100', 'root', '2016-03-31 15:03:05', '2016-03-31 15:03:06', 'pip -V');
INSERT INTO `ywmodels_serverhistory` VALUES ('587', '501', '192.168.56.100', 'root', '2016-03-31 15:03:05', '2016-03-31 15:03:07', 'pip -V');
INSERT INTO `ywmodels_serverhistory` VALUES ('588', '501', '192.168.56.100', 'root', '2016-03-31 15:03:05', '2016-03-31 15:03:07', 'pip -V');
INSERT INTO `ywmodels_serverhistory` VALUES ('589', '501', '192.168.56.100', 'root', '2016-03-31 15:03:05', '2016-03-31 15:07:18', 'pip -V');
INSERT INTO `ywmodels_serverhistory` VALUES ('590', '501', '192.168.56.100', 'root', '2016-03-31 15:03:05', '2016-03-31 15:07:18', 'pip -V');
INSERT INTO `ywmodels_serverhistory` VALUES ('591', '502', '192.168.56.100', 'root', '2016-03-31 15:07:19', '2016-03-31 15:07:19', 'clear');
INSERT INTO `ywmodels_serverhistory` VALUES ('592', '502', '192.168.56.100', 'root', '2016-03-31 15:07:19', '2016-03-31 15:07:19', 'clear');
INSERT INTO `ywmodels_serverhistory` VALUES ('593', '503', '192.168.56.100', 'root', '2016-03-31 15:07:25', '2016-03-31 15:07:26', 'rpm -aq |grep python');
INSERT INTO `ywmodels_serverhistory` VALUES ('594', '503', '192.168.56.100', 'root', '2016-03-31 15:07:25', '2016-03-31 15:07:27', 'rpm -aq |grep python');
INSERT INTO `ywmodels_serverhistory` VALUES ('595', '503', '192.168.56.100', 'root', '2016-03-31 15:07:25', '2016-03-31 15:07:27', 'rpm -aq |grep python');
INSERT INTO `ywmodels_serverhistory` VALUES ('596', '503', '192.168.56.100', 'root', '2016-03-31 15:07:25', '2016-03-31 15:07:27', 'rpm -aq |grep python');
INSERT INTO `ywmodels_serverhistory` VALUES ('597', '503', '192.168.56.100', 'root', '2016-03-31 15:07:25', '2016-03-31 15:28:19', 'rpm -aq |grep python');
INSERT INTO `ywmodels_serverhistory` VALUES ('598', '503', '192.168.56.100', 'root', '2016-03-31 15:07:25', '2016-03-31 15:28:20', 'rpm -aq |grep python');
INSERT INTO `ywmodels_serverhistory` VALUES ('599', '504', '192.168.56.100', 'root', '2016-03-31 15:28:23', '2016-03-31 15:28:23', 'clear');
INSERT INTO `ywmodels_serverhistory` VALUES ('600', '504', '192.168.56.100', 'root', '2016-03-31 15:28:23', '2016-03-31 15:28:23', 'clear');
INSERT INTO `ywmodels_serverhistory` VALUES ('601', '505', '192.168.56.100', 'root', '2016-03-31 15:28:26', '2016-03-31 15:28:26', 'cd /usr/local/lib/python2.7/site-packages');
INSERT INTO `ywmodels_serverhistory` VALUES ('602', '506', '192.168.56.100', 'root', '2016-03-31 15:28:27', '2016-03-31 15:28:28', 'll');
INSERT INTO `ywmodels_serverhistory` VALUES ('603', '507', '192.168.56.100', 'root', '2016-03-31 15:28:34', '2016-03-31 15:28:34', 'more tab.py');
INSERT INTO `ywmodels_serverhistory` VALUES ('604', '507', '192.168.56.100', 'root', '2016-03-31 15:28:34', '2016-03-31 15:28:35', 'more tab.py');
INSERT INTO `ywmodels_serverhistory` VALUES ('605', '508', '192.168.56.100', 'root', '2016-03-31 16:23:14', '2016-03-31 16:23:15', 'pip list');
INSERT INTO `ywmodels_serverhistory` VALUES ('606', '508', '192.168.56.100', 'root', '2016-03-31 16:23:14', '2016-03-31 16:36:32', 'pip list');
INSERT INTO `ywmodels_serverhistory` VALUES ('607', '508', '192.168.56.100', 'root', '2016-03-31 16:23:14', '2016-03-31 16:36:33', 'pip list');
INSERT INTO `ywmodels_serverhistory` VALUES ('608', '509', '192.168.56.100', 'root', '2016-03-31 16:36:41', '2016-03-31 16:36:41', 'ps -ef|grep python');
INSERT INTO `ywmodels_serverhistory` VALUES ('609', '510', '192.168.56.100', 'root', '2016-03-31 16:36:54', '2016-03-31 16:36:55', 'tail /etc/supervisord.conf');
INSERT INTO `ywmodels_serverhistory` VALUES ('610', '510', '192.168.56.100', 'root', '2016-03-31 16:36:54', '2016-03-31 16:36:56', 'tail /etc/supervisord.conf');
INSERT INTO `ywmodels_serverhistory` VALUES ('611', '510', '192.168.56.100', 'root', '2016-03-31 16:36:54', '2016-03-31 16:36:57', 'tail /etc/supervisord.conf');
INSERT INTO `ywmodels_serverhistory` VALUES ('612', '510', '192.168.56.100', 'root', '2016-03-31 16:36:54', '2016-03-31 16:36:57', 'tail /etc/supervisord.conf');
INSERT INTO `ywmodels_serverhistory` VALUES ('613', '510', '192.168.56.100', 'root', '2016-03-31 16:36:54', '2016-03-31 16:37:33', 'tail /etc/supervisord.conf');
INSERT INTO `ywmodels_serverhistory` VALUES ('614', '510', '192.168.56.100', 'root', '2016-03-31 16:36:54', '2016-03-31 16:37:33', 'tail /etc/supervisord.conf');
INSERT INTO `ywmodels_serverhistory` VALUES ('615', '511', '192.168.56.100', 'root', '2016-03-31 16:37:42', '2016-03-31 16:37:42', 'tail -20 /etc/supervisord.conf');
INSERT INTO `ywmodels_serverhistory` VALUES ('616', '511', '192.168.56.100', 'root', '2016-03-31 16:37:42', '2016-03-31 16:37:43', 'tail -20 /etc/supervisord.conf');
INSERT INTO `ywmodels_serverhistory` VALUES ('617', '511', '192.168.56.100', 'root', '2016-03-31 16:37:42', '2016-03-31 16:37:43', 'tail -20 /etc/supervisord.conf');
INSERT INTO `ywmodels_serverhistory` VALUES ('618', '512', '192.168.56.100', 'root', '2016-03-31 16:45:31', '2016-03-31 16:45:32', 'cd /opt/www/project/');
INSERT INTO `ywmodels_serverhistory` VALUES ('619', '513', '192.168.56.100', 'root', '2016-03-31 16:45:32', '2016-03-31 16:45:32', 'll');
INSERT INTO `ywmodels_serverhistory` VALUES ('620', '514', '192.168.56.100', 'root', '2016-03-31 16:45:42', '2016-03-31 16:45:42', 'more uwsgi.ini');
INSERT INTO `ywmodels_serverhistory` VALUES ('621', '514', '192.168.56.100', 'root', '2016-03-31 16:45:42', '2016-03-31 16:45:43', 'more uwsgi.ini');
INSERT INTO `ywmodels_serverhistory` VALUES ('622', '514', '192.168.56.100', 'root', '2016-03-31 16:45:42', '2016-03-31 16:45:43', 'more uwsgi.ini');
INSERT INTO `ywmodels_serverhistory` VALUES ('623', '1536', '192.168.2.131', 'root', '2016-04-06 13:56:43', '2016-04-06 13:54:49', 'source /etc/profile');
INSERT INTO `ywmodels_serverhistory` VALUES ('624', '1604', '192.168.2.131', 'root', '2016-04-06 13:56:43', '2016-04-06 13:54:53', 'source /etc/profile');
INSERT INTO `ywmodels_serverhistory` VALUES ('625', '1672', '192.168.2.131', 'root', '2016-04-06 13:56:43', '2016-04-06 13:54:53', 'source /etc/profile');
INSERT INTO `ywmodels_serverhistory` VALUES ('626', '1740', '192.168.2.131', 'root', '2016-04-06 13:56:43', '2016-04-06 13:54:54', 'source /etc/profile');
INSERT INTO `ywmodels_serverhistory` VALUES ('627', '1808', '192.168.2.131', 'root', '2016-04-06 13:56:43', '2016-04-06 13:54:54', 'source /etc/profile');
INSERT INTO `ywmodels_serverhistory` VALUES ('628', '1878', '192.168.2.131', 'root', '2016-04-06 13:56:58', '2016-04-06 13:55:04', 'll');
INSERT INTO `ywmodels_serverhistory` VALUES ('629', '1949', '192.168.2.131', 'root', '2016-04-06 13:57:03', '2016-04-06 13:55:12', 'cd OMAudit');
INSERT INTO `ywmodels_serverhistory` VALUES ('630', '2021', '192.168.2.131', 'root', '2016-04-06 13:57:06', '2016-04-06 13:55:12', 'ls');

-- ----------------------------
-- Table structure for ywmodels_websniff
-- ----------------------------
DROP TABLE IF EXISTS `ywmodels_websniff`;
CREATE TABLE `ywmodels_websniff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `code` varchar(20) NOT NULL,
  `status` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ywmodels_websniff
-- ----------------------------
INSERT INTO `ywmodels_websniff` VALUES ('37', '百度', 'www.baidu.com', '200', 'status_info: 200, OK');
INSERT INTO `ywmodels_websniff` VALUES ('38', '新浪', 'www.sinohealth.cn', '200', 'status_info: 200, OK');
INSERT INTO `ywmodels_websniff` VALUES ('39', 'bing', 'www.bing.com', '301', 'status_info: 301, Moved Permanently');
INSERT INTO `ywmodels_websniff` VALUES ('40', '谷歌', 'www.g.cn', '301', 'status_info: 301, Moved Permanently');
INSERT INTO `ywmodels_websniff` VALUES ('41', 'QQ', 'www.qq.com', '200', 'status_info: 200, OK');
INSERT INTO `ywmodels_websniff` VALUES ('42', 'github', 'www.github.com', '301', 'status_info: 301, Moved Permanently');
