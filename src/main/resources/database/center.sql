/*
Navicat MySQL Data Transfer

Source Server         : 115.29.222.27_3306
Source Server Version : 50173
Source Host           : 115.29.222.27:3306
Source Database       : center_newbf_by_oupan_20170928

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-12-20 10:41:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for banner_info
-- ----------------------------
DROP TABLE IF EXISTS `banner_info`;
CREATE TABLE `banner_info` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `state` int(2) DEFAULT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banner_info
-- ----------------------------
INSERT INTO `banner_info` VALUES ('33', '1', '职业教育课程资源库总览', 'banner/32EB4112128930F2455D3D374D140BBA1496733933275.png', '1');
INSERT INTO `banner_info` VALUES ('34', '1', '职业素养培养课程资源库', 'banner/8D370ACF19EEEFEE7B1224F336E5E1311496733946701.png', '1');
INSERT INTO `banner_info` VALUES ('35', '1', '中职德育教育资源库', 'banner/D23048F7EC02498C3713760D710EF3511505356084019.png', '1');

-- ----------------------------
-- Table structure for base_controller_info
-- ----------------------------
DROP TABLE IF EXISTS `base_controller_info`;
CREATE TABLE `base_controller_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) DEFAULT NULL,
  `is_default` int(2) DEFAULT NULL COMMENT '1',
  `con_type_id` int(2) DEFAULT NULL,
  `module_name` varchar(50) DEFAULT NULL,
  `con_name` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `ico` varchar(255) DEFAULT NULL COMMENT '图标',
  `level` int(2) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_controller_info
-- ----------------------------
INSERT INTO `base_controller_info` VALUES ('1', '1', '1', '1', 'sys_couse_set', '课程建设', '/admin/nav/course.html', '/images/icon04.png', '1', '0');
INSERT INTO `base_controller_info` VALUES ('2', '1', '1', '1', 'sys_resurce_set', '教学资源', '/admin/nav/resource.html', '/images/icon03.png', '1', '0');
INSERT INTO `base_controller_info` VALUES ('3', '1', '1', '1', 'sys_teacher_set', '教学管理', '/admin/nav/teacher.html', '/images/icon02.png', '1', '0');
INSERT INTO `base_controller_info` VALUES ('4', '1', '1', '1', 'sys_set', '系统设置', '/admin/nav/set.html', '/images/icon06.png', '1', '0');
INSERT INTO `base_controller_info` VALUES ('5', '1', '1', '2', null, '平台设置', '/admin/school/platUpdate.html', null, '1', '63');
INSERT INTO `base_controller_info` VALUES ('6', '1', '1', '2', null, '学校列表', '/admin/school/list.html', null, '1', '63');
INSERT INTO `base_controller_info` VALUES ('7', '1', '1', '2', null, '权限设置', 'default.html', null, '1', '63');
INSERT INTO `base_controller_info` VALUES ('8', '1', '1', '2', null, '个人设置', '/admin/teacher/update.html', null, '1', '63');
INSERT INTO `base_controller_info` VALUES ('9', '1', '1', '2', null, '系统日志', '/admin/syslog/list.html', null, '1', '63');
INSERT INTO `base_controller_info` VALUES ('10', '1', '1', '2', null, '新建教师', '/admin/teacher/add.html', null, '1', '64');
INSERT INTO `base_controller_info` VALUES ('11', '1', '1', '2', null, '教师信息', '/admin/teacher/list.html', null, '1', '64');
INSERT INTO `base_controller_info` VALUES ('12', '1', '1', '2', null, '导入教师', '/admin/teacher/import.html', null, '1', '64');
INSERT INTO `base_controller_info` VALUES ('13', '1', '1', '2', null, '学生信息', '/admin/student/list.html', null, '1', '64');
INSERT INTO `base_controller_info` VALUES ('14', '1', '1', '2', null, '导入学生', '/admin/student/import.html', null, '1', '64');
INSERT INTO `base_controller_info` VALUES ('15', '1', '1', '2', null, '班级信息', '/admin/class/list.html', null, '1', '64');
INSERT INTO `base_controller_info` VALUES ('16', '1', '1', '2', null, '学习统计', '', null, '1', '3');
INSERT INTO `base_controller_info` VALUES ('17', '1', '1', '2', null, '课程学习统计', '/admin/statistics/courseStatistics.html', null, '2', '16');
INSERT INTO `base_controller_info` VALUES ('18', '1', '1', '2', null, '视频观看统计', '/admin/statistics/videoStatistics.html', null, '2', '16');
INSERT INTO `base_controller_info` VALUES ('19', '1', '1', '2', null, '作业统计', '/admin/statistics/homeworkStatistics.html', null, '2', '16');
INSERT INTO `base_controller_info` VALUES ('20', '1', '1', '2', null, '讨论统计', '/admin/statistics/discussStatistics.html', null, '2', '16');
INSERT INTO `base_controller_info` VALUES ('21', '1', '1', '2', null, '考试统计', '/admin/statistics/testStatistics.html', null, '2', '16');
INSERT INTO `base_controller_info` VALUES ('22', '1', '1', '2', null, '公告管理', null, null, '1', '3');
INSERT INTO `base_controller_info` VALUES ('23', '1', '1', '2', null, '公告列表', '/admin/notice/list.html', null, '2', '22');
INSERT INTO `base_controller_info` VALUES ('24', null, '1', '2', null, '发布公告', '/admin/notice/toAdd.html', null, '2', '22');
INSERT INTO `base_controller_info` VALUES ('25', null, '1', '2', null, '通知管理', null, null, '1', '3');
INSERT INTO `base_controller_info` VALUES ('26', null, '1', '2', null, '通知列表', '/admin/message/list.html', null, '2', '25');
INSERT INTO `base_controller_info` VALUES ('27', null, '1', '2', null, '发布通知', '/admin/message/toAdd.html', null, '2', '25');
INSERT INTO `base_controller_info` VALUES ('28', null, '1', '2', null, '作业与考试管理', null, null, '1', '3');
INSERT INTO `base_controller_info` VALUES ('29', null, '1', '2', null, '新建试题', '/test/toAdd.html', null, '2', '53');
INSERT INTO `base_controller_info` VALUES ('30', null, '1', '2', null, '导入试题', '/test/toInsertTest.html', null, '2', '53');
INSERT INTO `base_controller_info` VALUES ('31', null, '1', '2', null, '新建考试', '/paper/toNewTest.html', null, '2', '28');
INSERT INTO `base_controller_info` VALUES ('32', null, '1', '2', null, '新建作业', '/homework/toNewHomework.html', null, '2', '28');
INSERT INTO `base_controller_info` VALUES ('33', null, '1', '2', null, '资源列表', null, null, '1', '2');
INSERT INTO `base_controller_info` VALUES ('34', null, '1', '2', null, '公共资源列表', '/resource/publicList.html', null, '2', '33');
INSERT INTO `base_controller_info` VALUES ('35', null, '1', '2', null, '课程资源列表', '/resource/courseResList.html', null, '2', '33');
INSERT INTO `base_controller_info` VALUES ('36', null, '1', '2', null, '类别管理', null, null, '1', '2');
INSERT INTO `base_controller_info` VALUES ('37', null, '1', '2', null, '资源类别列表', '/resource/typeList.html', null, '2', '36');
INSERT INTO `base_controller_info` VALUES ('38', null, '1', '2', null, '新建资源类别', '/resource/toAddresType.html', null, '2', '36');
INSERT INTO `base_controller_info` VALUES ('39', null, '1', '2', null, '我的资源', null, null, '1', '2');
INSERT INTO `base_controller_info` VALUES ('40', null, '1', '2', null, '公共资源列表', '/resource/myPublicList.html', null, '2', '39');
INSERT INTO `base_controller_info` VALUES ('41', null, '1', '2', null, '课程资源列表', '/resource/myCourseResList.html', null, '2', '39');
INSERT INTO `base_controller_info` VALUES ('42', null, '1', '2', null, '上传资源', '/resource/toUploadRes.html', null, '2', '39');
INSERT INTO `base_controller_info` VALUES ('43', null, '1', '2', null, '课程建设', null, null, '1', '1');
INSERT INTO `base_controller_info` VALUES ('44', null, '1', '2', null, '新建类别', '/admin/course/type/add.html', null, '2', '43');
INSERT INTO `base_controller_info` VALUES ('45', null, '1', '2', null, '类别列表', '/admin/course/type/list.html', null, '2', '43');
INSERT INTO `base_controller_info` VALUES ('46', null, '1', '2', null, '新建课程', '/admin/course/add.html', null, '2', '43');
INSERT INTO `base_controller_info` VALUES ('47', null, '1', '2', null, '课程列表', '/admin/course/list.html', null, '2', '43');
INSERT INTO `base_controller_info` VALUES ('48', null, '1', '2', null, '开课管理', null, null, '1', '1');
INSERT INTO `base_controller_info` VALUES ('49', null, '1', '2', null, '开课', '/course/open/toAdd.html', null, '2', '48');
INSERT INTO `base_controller_info` VALUES ('50', null, '1', '2', null, '开课信息', '/course/open/list.html', null, '2', '48');
INSERT INTO `base_controller_info` VALUES ('51', null, '1', '2', null, '添加选课学生', '/course/open/addStu.html', null, '2', '48');
INSERT INTO `base_controller_info` VALUES ('52', null, '1', '2', null, '结课', '/course/open/toOverCourse.html', null, '2', '48');
INSERT INTO `base_controller_info` VALUES ('53', null, '1', '2', null, '试卷建设', null, null, '1', '1');
INSERT INTO `base_controller_info` VALUES ('54', null, '1', '2', null, '试题列表', '/test/list.html', null, '2', '53');
INSERT INTO `base_controller_info` VALUES ('55', null, '1', '2', null, '新建试卷', '/paper/topaper.html', null, '2', '53');
INSERT INTO `base_controller_info` VALUES ('56', null, '1', '2', null, '试卷信息', '/paper/list.html', null, '2', '53');
INSERT INTO `base_controller_info` VALUES ('63', null, '1', '1', null, '系统设置', null, null, '1', '4');
INSERT INTO `base_controller_info` VALUES ('64', null, '1', '1', null, '师生管理', null, null, '1', '3');
INSERT INTO `base_controller_info` VALUES ('65', null, '1', '2', null, '考试信息', '/test/toTestInfo.html', null, '2', '28');
INSERT INTO `base_controller_info` VALUES ('66', null, '1', '2', null, '作业信息', '/homework/toHomeworkInfo.html', null, '2', '28');
INSERT INTO `base_controller_info` VALUES ('68', null, '1', '1', null, '权限设置', null, null, '1', '4');
INSERT INTO `base_controller_info` VALUES ('69', null, '1', '2', null, '角色信息', '/admin/role/list.html', null, '2', '68');
INSERT INTO `base_controller_info` VALUES ('70', null, '1', '2', null, '角色设置', '/admin/role/teacher/list.html', null, '2', '68');
INSERT INTO `base_controller_info` VALUES ('71', null, '1', '2', null, '权限设置', '/admin/role/set.html', null, '2', '68');
INSERT INTO `base_controller_info` VALUES ('73', '1', '1', '2', null, '轮播图设置', '/banner/list.html', null, '1', '63');
INSERT INTO `base_controller_info` VALUES ('74', null, '1', '3', null, '审核', null, null, '3', '35');
INSERT INTO `base_controller_info` VALUES ('75', null, '1', '2', null, '新建讨论主题', '/admin/discuss/toAdd.html', null, '2', '48');
INSERT INTO `base_controller_info` VALUES ('76', null, '1', '2', null, '讨论主题列表', '/admin/discuss/listDiscussTheme.html', null, '2', '48');
INSERT INTO `base_controller_info` VALUES ('77', '1', '1', '2', null, '新建专家', '/admin/lecturer/add.html', null, '1', '64');
INSERT INTO `base_controller_info` VALUES ('78', '1', '1', '1', null, '专家列表', '/admin/lecturer/list.html', null, '1', '64');

-- ----------------------------
-- Table structure for base_role_controller
-- ----------------------------
DROP TABLE IF EXISTS `base_role_controller`;
CREATE TABLE `base_role_controller` (
  `roleId` varchar(100) DEFAULT NULL,
  `controllerId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_role_controller
-- ----------------------------
INSERT INTO `base_role_controller` VALUES ('admin', '1');
INSERT INTO `base_role_controller` VALUES ('admin', '2');
INSERT INTO `base_role_controller` VALUES ('admin', '3');
INSERT INTO `base_role_controller` VALUES ('admin', '4');
INSERT INTO `base_role_controller` VALUES ('admin', '5');
INSERT INTO `base_role_controller` VALUES ('admin', '8');
INSERT INTO `base_role_controller` VALUES ('admin', '9');
INSERT INTO `base_role_controller` VALUES ('admin', '10');
INSERT INTO `base_role_controller` VALUES ('admin', '11');
INSERT INTO `base_role_controller` VALUES ('admin', '12');
INSERT INTO `base_role_controller` VALUES ('admin', '13');
INSERT INTO `base_role_controller` VALUES ('admin', '14');
INSERT INTO `base_role_controller` VALUES ('admin', '15');
INSERT INTO `base_role_controller` VALUES ('admin', '16');
INSERT INTO `base_role_controller` VALUES ('admin', '17');
INSERT INTO `base_role_controller` VALUES ('admin', '18');
INSERT INTO `base_role_controller` VALUES ('admin', '19');
INSERT INTO `base_role_controller` VALUES ('admin', '20');
INSERT INTO `base_role_controller` VALUES ('admin', '21');
INSERT INTO `base_role_controller` VALUES ('admin', '22');
INSERT INTO `base_role_controller` VALUES ('admin', '23');
INSERT INTO `base_role_controller` VALUES ('admin', '24');
INSERT INTO `base_role_controller` VALUES ('admin', '25');
INSERT INTO `base_role_controller` VALUES ('admin', '26');
INSERT INTO `base_role_controller` VALUES ('admin', '27');
INSERT INTO `base_role_controller` VALUES ('admin', '28');
INSERT INTO `base_role_controller` VALUES ('admin', '29');
INSERT INTO `base_role_controller` VALUES ('admin', '30');
INSERT INTO `base_role_controller` VALUES ('admin', '31');
INSERT INTO `base_role_controller` VALUES ('admin', '32');
INSERT INTO `base_role_controller` VALUES ('admin', '34');
INSERT INTO `base_role_controller` VALUES ('admin', '35');
INSERT INTO `base_role_controller` VALUES ('admin', '36');
INSERT INTO `base_role_controller` VALUES ('admin', '37');
INSERT INTO `base_role_controller` VALUES ('admin', '38');
INSERT INTO `base_role_controller` VALUES ('admin', '39');
INSERT INTO `base_role_controller` VALUES ('admin', '40');
INSERT INTO `base_role_controller` VALUES ('admin', '41');
INSERT INTO `base_role_controller` VALUES ('admin', '42');
INSERT INTO `base_role_controller` VALUES ('admin', '43');
INSERT INTO `base_role_controller` VALUES ('admin', '44');
INSERT INTO `base_role_controller` VALUES ('admin', '45');
INSERT INTO `base_role_controller` VALUES ('admin', '46');
INSERT INTO `base_role_controller` VALUES ('admin', '47');
INSERT INTO `base_role_controller` VALUES ('admin', '48');
INSERT INTO `base_role_controller` VALUES ('admin', '49');
INSERT INTO `base_role_controller` VALUES ('admin', '50');
INSERT INTO `base_role_controller` VALUES ('admin', '51');
INSERT INTO `base_role_controller` VALUES ('admin', '52');
INSERT INTO `base_role_controller` VALUES ('admin', '53');
INSERT INTO `base_role_controller` VALUES ('admin', '54');
INSERT INTO `base_role_controller` VALUES ('admin', '55');
INSERT INTO `base_role_controller` VALUES ('admin', '56');
INSERT INTO `base_role_controller` VALUES ('admin', '65');
INSERT INTO `base_role_controller` VALUES ('admin', '66');
INSERT INTO `base_role_controller` VALUES ('admin', '67');
INSERT INTO `base_role_controller` VALUES ('admin', '68');
INSERT INTO `base_role_controller` VALUES ('admin', '69');
INSERT INTO `base_role_controller` VALUES ('admin', '70');
INSERT INTO `base_role_controller` VALUES ('admin', '73');
INSERT INTO `base_role_controller` VALUES ('admin', '75');
INSERT INTO `base_role_controller` VALUES ('teacher', '1');
INSERT INTO `base_role_controller` VALUES ('teacher', '43');
INSERT INTO `base_role_controller` VALUES ('teacher', '44');
INSERT INTO `base_role_controller` VALUES ('teacher', '45');
INSERT INTO `base_role_controller` VALUES ('teacher', '46');
INSERT INTO `base_role_controller` VALUES ('teacher', '47');
INSERT INTO `base_role_controller` VALUES ('teacher', '48');
INSERT INTO `base_role_controller` VALUES ('teacher', '49');
INSERT INTO `base_role_controller` VALUES ('teacher', '50');
INSERT INTO `base_role_controller` VALUES ('teacher', '51');
INSERT INTO `base_role_controller` VALUES ('teacher', '52');
INSERT INTO `base_role_controller` VALUES ('teacher', '53');
INSERT INTO `base_role_controller` VALUES ('teacher', '54');
INSERT INTO `base_role_controller` VALUES ('teacher', '55');
INSERT INTO `base_role_controller` VALUES ('teacher', '56');
INSERT INTO `base_role_controller` VALUES ('teacher', '2');
INSERT INTO `base_role_controller` VALUES ('teacher', '33');
INSERT INTO `base_role_controller` VALUES ('teacher', '34');
INSERT INTO `base_role_controller` VALUES ('teacher', '35');
INSERT INTO `base_role_controller` VALUES ('teacher', '74');
INSERT INTO `base_role_controller` VALUES ('teacher', '36');
INSERT INTO `base_role_controller` VALUES ('teacher', '37');
INSERT INTO `base_role_controller` VALUES ('teacher', '38');
INSERT INTO `base_role_controller` VALUES ('teacher', '39');
INSERT INTO `base_role_controller` VALUES ('teacher', '40');
INSERT INTO `base_role_controller` VALUES ('teacher', '41');
INSERT INTO `base_role_controller` VALUES ('teacher', '3');
INSERT INTO `base_role_controller` VALUES ('teacher', '16');
INSERT INTO `base_role_controller` VALUES ('teacher', '17');
INSERT INTO `base_role_controller` VALUES ('teacher', '18');
INSERT INTO `base_role_controller` VALUES ('teacher', '19');
INSERT INTO `base_role_controller` VALUES ('teacher', '20');
INSERT INTO `base_role_controller` VALUES ('teacher', '21');
INSERT INTO `base_role_controller` VALUES ('teacher', '22');
INSERT INTO `base_role_controller` VALUES ('teacher', '23');
INSERT INTO `base_role_controller` VALUES ('teacher', '24');
INSERT INTO `base_role_controller` VALUES ('teacher', '25');
INSERT INTO `base_role_controller` VALUES ('teacher', '26');
INSERT INTO `base_role_controller` VALUES ('teacher', '27');
INSERT INTO `base_role_controller` VALUES ('teacher', '28');
INSERT INTO `base_role_controller` VALUES ('teacher', '29');
INSERT INTO `base_role_controller` VALUES ('teacher', '30');
INSERT INTO `base_role_controller` VALUES ('teacher', '31');
INSERT INTO `base_role_controller` VALUES ('teacher', '32');
INSERT INTO `base_role_controller` VALUES ('teacher', '65');
INSERT INTO `base_role_controller` VALUES ('teacher', '66');
INSERT INTO `base_role_controller` VALUES ('teacher', '4');
INSERT INTO `base_role_controller` VALUES ('teacher', '63');
INSERT INTO `base_role_controller` VALUES ('teacher', '5');
INSERT INTO `base_role_controller` VALUES ('teacher', '8');
INSERT INTO `base_role_controller` VALUES ('teacher ', '75');
INSERT INTO `base_role_controller` VALUES ('teacher', '76');
INSERT INTO `base_role_controller` VALUES ('admin', '75');
INSERT INTO `base_role_controller` VALUES ('admin', '76');
INSERT INTO `base_role_controller` VALUES ('admin', '77');
INSERT INTO `base_role_controller` VALUES ('admin', '78');

-- ----------------------------
-- Table structure for chapter_file
-- ----------------------------
DROP TABLE IF EXISTS `chapter_file`;
CREATE TABLE `chapter_file` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程文件ID',
  `chapter_id` int(11) DEFAULT NULL COMMENT '章节ID',
  `schoolId` int(11) DEFAULT '1',
  `file_type_id` int(11) DEFAULT NULL COMMENT '文件路径',
  `resource_type_id` int(11) DEFAULT NULL COMMENT '资源类型',
  `file_suffix` varchar(10) DEFAULT NULL COMMENT '文件后缀',
  `file_name` varchar(200) DEFAULT NULL COMMENT '文件名称',
  `file_size` bigint(20) DEFAULT NULL COMMENT '文件大小',
  `url` varchar(200) DEFAULT NULL COMMENT '文件安路径',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `stateDate` datetime DEFAULT NULL COMMENT '修改状态时间',
  `state` int(2) DEFAULT '1' COMMENT '状态:0：删除,1：正常，2：分享，3：审核',
  `ispublic` int(2) DEFAULT '1' COMMENT '0：不公开，1：公开',
  `allow_down` int(1) DEFAULT '1' COMMENT '0：不允许下载，1：允许下载',
  `stu_allow_down` int(1) DEFAULT '0' COMMENT '0：不允许学生下载，1：运行学生下载',
  `isShare` int(1) DEFAULT '1' COMMENT '0：未分享，1：已分享',
  `course_id` int(11) DEFAULT NULL COMMENT '课程id',
  `create_user_id` int(11) DEFAULT NULL COMMENT '创建人',
  `down_num` int(11) DEFAULT '0' COMMENT '下载次数',
  `info` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1496 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chapter_file
-- ----------------------------
INSERT INTO `chapter_file` VALUES ('982', '729', '1', '1', null, 'zip', '人在职场-你能教教我吗.zip', null, 'resource/96/files/3375E75C613D93B0A28D1C4B3B08CB021496630829458.zip', '2017-06-05 10:47:18', null, '1', '1', '1', '0', '1', '96', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('983', '739', '1', '1', null, 'zip', '人在职场-这件事交给我.zip', null, 'resource/96/files/659C801F8A40B2032C75CFFA979AF5DF1496631375198.zip', '2017-06-05 10:56:25', null, '1', '1', '1', '0', '1', '96', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('984', '740', '1', '1', null, 'zip', '人在职场-细节决定成败.zip', null, 'resource/96/files/F9A0C1FB14F7CF2060964641232F0B2D1496631478149.zip', '2017-06-05 10:58:17', null, '1', '1', '1', '0', '1', '96', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('985', '741', '1', '1', null, 'zip', '人在职场-和拖延说拜拜.zip', null, 'resource/96/files/4266BB1693B44CF0FE74D07C917A1BFC1496631720433.zip', '2017-06-05 11:02:06', null, '1', '1', '1', '0', '1', '96', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('986', '742', '1', '1', null, 'zip', '人在职场-我成年啦.zip', null, 'resource/96/files/C9EA64FA54F938FAC54B632EA1FC145B1496631757004.zip', '2017-06-05 11:05:13', null, '1', '1', '1', '0', '1', '96', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('987', '743', '1', '1', null, 'zip', '人在职场-和而不同.zip', null, 'resource/96/files/8A3A19B5CF1D26F3D9702309DB1FD4B41496631974466.zip', '2017-06-05 11:06:24', null, '1', '1', '1', '0', '1', '96', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('988', '745', '1', '1', null, 'zip', '人在职场-非礼勿视 非礼勿听.zip', null, 'resource/96/files/2E5B5260D15BBC3DA19D470312D2DE201496632058019.zip', '2017-06-05 11:08:27', null, '1', '1', '1', '0', '1', '96', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('989', '746', '1', '1', null, 'zip', '人在职场-你的意见真不错.zip', null, 'resource/96/files/F94EFF74AAE75BA203CB26EF63ABA8061496632189693.zip', '2017-06-05 11:09:57', null, '1', '1', '1', '0', '1', '96', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('990', '747', '1', '1', null, 'zip', '人在职场-从每天上班不迟到做起.zip', null, 'resource/96/files/C8CAC614033D139762CBA0E80E842D881496632213549.zip', '2017-06-05 11:11:04', null, '1', '1', '1', '0', '1', '96', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('991', '748', '1', '1', null, 'zip', '人在职场-我要当老板.zip', null, 'resource/96/files/402F57219AEA87BBC862E5A855A8B6F51496632680582.zip', '2017-06-05 11:18:08', null, '1', '1', '1', '0', '1', '96', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('992', '607', '1', '1', null, 'zip', '健康心理 阳光心态-认识你真好.zip', null, 'resource/91/files/B57A40E9396C7B45BFFC021D1A6D67DB1496632701396.zip', '2017-06-05 11:18:31', null, '1', '1', '1', '0', '1', '91', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('993', '608', '1', '1', null, 'zip', '健康心理 阳光心态-我是谁？.zip', null, 'resource/91/files/5B71D51DC9BE1842111440FBA5C7C1BB1496632805055.zip', '2017-06-05 11:20:15', null, '1', '1', '1', '0', '1', '91', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('994', '609', '1', '1', null, 'zip', '健康心理 阳光心态-情感超市.zip', null, 'resource/91/files/BED5AD3D4A572FBDACAE98F32837B5DE1496632918865.zip', '2017-06-05 11:22:02', null, '1', '1', '1', '0', '1', '91', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('995', '663', '1', '1', null, 'zip', '学习与生活-快乐学习.zip', null, 'resource/93/files/3B05D66244434F043ED8F9A5875EE61F1496632897098.zip', '2017-06-05 11:22:15', null, '1', '1', '1', '0', '1', '93', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('996', '610', '1', '1', null, 'zip', '健康心理 阳光心态-富有的生命历程.zip', null, 'resource/91/files/75605BADB21AFA666D18ECE788BD0231496633087862.zip', '2017-06-05 11:24:56', null, '1', '1', '1', '0', '1', '91', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('997', '681', '1', '1', null, 'zip', '学习与生活-学校是我的第二个家.zip', null, 'resource/93/files/141C25C8320EB6C6EDA8AF010DD649FA1496632965335.zip', '2017-06-05 11:25:27', null, '1', '1', '1', '0', '1', '93', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('998', '611', '1', '1', null, 'zip', '健康心理 阳光心态-好好地爱自己.zip', null, 'resource/91/files/429041DE91BBA96D24F55DA8EEABE5EA1496633204453.zip', '2017-06-05 11:26:53', null, '1', '1', '1', '0', '1', '91', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('999', '682', '1', '1', null, 'zip', '学习与生活-没有规矩不成方圆.zip', null, 'resource/93/files/10B5E5E0E75B8EC61D16224D986D4DD61496633239310.zip', '2017-06-05 11:27:23', null, '1', '1', '1', '0', '1', '93', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1000', '683', '1', '1', null, 'zip', '学习与生活-新起点，新梦想.zip', null, 'resource/93/files/F7FEFD26B21618E75610CE86FDA1501F1496633258608.zip', '2017-06-05 11:29:43', null, '1', '1', '1', '0', '1', '93', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1001', '684', '1', '1', null, 'zip', '学习与生活-我的未来不是梦.zip', null, 'resource/93/files/A735E4D4639ABE56ACCAD517C7F9E16D1496633488775.zip', '2017-06-05 11:31:34', null, '1', '1', '1', '0', '1', '93', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1002', '613', '1', '1', null, 'zip', '健康心理 阳光心态-自我情绪管理.zip', null, 'resource/91/files/26D32713B8B8B3C11FCBF75B8B69746C1496633562380.zip', '2017-06-05 11:32:56', null, '1', '1', '1', '0', '1', '91', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1003', '685', '1', '1', null, 'zip', '学习与生活-成功是一种习惯.zip', null, 'resource/93/files/A3A7BF17F2AF40505A03393C261F5BFA1496633580029.zip', '2017-06-05 11:34:19', null, '1', '1', '1', '0', '1', '93', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1004', '614', '1', '1', null, 'zip', '健康心理 阳光心态-战胜自卑.zip', null, 'resource/91/files/E00C5AF1CE87B9FCC41F26B67C3407F41496633675292.zip', '2017-06-05 11:34:42', null, '1', '1', '1', '0', '1', '91', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1005', '686', '1', '1', null, 'zip', '学习与生活-创新，迈向成功的原动力.zip', null, 'resource/93/files/350B0039AD207D003DFA41BBFFF167AD1496633731707.zip', '2017-06-05 11:36:18', null, '1', '1', '1', '0', '1', '93', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1006', '615', '1', '1', null, 'zip', '健康心理 阳光心态-嫉妒的危害.zip', null, 'resource/91/files/4EDEC7E804CC0EAF25326E83C7A5A8131496633916316.zip', '2017-06-05 11:38:49', null, '1', '1', '1', '0', '1', '91', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1007', '687', '1', '1', null, 'zip', '学习与生活-光荣与传统.zip', null, 'resource/93/files/FAA25F7F49203A29D4D7126D898C1CD81496633840933.zip', '2017-06-05 11:38:54', null, '1', '1', '1', '0', '1', '93', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1008', '616', '1', '1', null, 'zip', '健康心理 阳光心态-爱情这东西.zip', null, 'resource/91/files/C0ECA28CBFB6589EEF75C412DD78AC691496634034373.zip', '2017-06-05 11:40:48', null, '1', '1', '1', '0', '1', '91', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1009', '617', '1', '1', null, 'zip', '健康心理 阳光心态-愤怒蒙蔽了我们的双眼.zip', null, 'resource/91/files/EE6D424693E09E60CBCCDED35A409131496634140957.zip', '2017-06-05 11:42:24', null, '1', '1', '1', '0', '1', '91', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1010', '689', '1', '1', null, 'zip', '学习与生活-一个字——“干”！.zip', null, 'resource/93/files/FC2CA37087A847D9A2FFC5423B4BB5941496634138941.zip', '2017-06-05 11:43:13', null, '1', '1', '1', '0', '1', '93', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1011', '690', '1', '1', null, 'zip', '学习与生活-授人玫瑰，手留余香.zip', null, 'resource/93/files/FF13C3299B8B4E465F10FBB562336C871496634261037.zip', '2017-06-05 11:44:26', null, '1', '1', '1', '0', '1', '93', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1012', '618', '1', '1', null, 'zip', '健康心理 阳光心态-风雨人生路.zip', null, 'resource/91/files/A93E841823ADA867426ABF337590EEB91496634271698.zip', '2017-06-05 11:45:10', null, '1', '1', '1', '0', '1', '91', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1013', '691', '1', '1', null, 'zip', '学习与生活-奔跑吧，我的兄弟姐妹.zip', null, 'resource/93/files/2C57AC987917C89AA5412D82575EDC501496634281469.zip', '2017-06-05 11:45:29', null, '1', '1', '1', '0', '1', '93', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1014', '619', '1', '1', null, 'zip', '健康心理 阳光心态-交谈的艺术.zip', null, 'resource/91/files/E9651A31E4A36CDAE5D59BB57FC90DA71496634417755.zip', '2017-06-05 11:47:04', null, '1', '1', '1', '0', '1', '91', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1015', '692', '1', '1', null, 'zip', '学习与生活-对不良诱惑说“不”.zip', null, 'resource/93/files/8242A70D28F3FC2CEB61C3B64B2EAC091496634432150.zip', '2017-06-05 11:47:30', null, '1', '1', '1', '0', '1', '93', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1016', '621', '1', '1', null, 'zip', '健康心理 阳光心态-生命在我手中.zip', null, 'resource/91/files/752B78E59C151E68F7BCE92BEF9F6BCF1496634452322.zip', '2017-06-05 11:49:00', null, '1', '1', '1', '0', '1', '91', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1017', '693', '1', '1', null, 'zip', '学习与生活-自由与自律.zip', null, 'resource/93/files/69D0FBA7D9AED1A07C95B94DC47DFC261496634535832.zip', '2017-06-05 11:50:07', null, '1', '1', '1', '0', '1', '93', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1018', '622', '1', '1', null, 'zip', '健康心理 阳光心态-意愿百分百，方法无穷多.zip', null, 'resource/91/files/A1B93FB871547D8AB025DCE28DF6FD361496634592111.zip', '2017-06-05 11:50:56', null, '1', '1', '1', '0', '1', '91', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1019', '694', '1', '1', null, 'zip', '学习与生活-责任与压力.zip', null, 'resource/93/files/7BDB19EC9325E836EB8699287583719F1496634669205.zip', '2017-06-05 11:51:15', null, '1', '1', '1', '0', '1', '93', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1020', '623', '1', '1', null, 'zip', '健康心理 阳光心态-让生命之根更深更远.zip', null, 'resource/91/files/132948B773675AFD8D107D48264688421496634755642.zip', '2017-06-05 11:52:41', null, '1', '1', '1', '0', '1', '91', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1021', '624', '1', '1', null, 'zip', '健康心理 阳光心态-减压训练.zip', null, 'resource/91/files/39AB700F406932AAFCC6729793A0DEF51496634927884.zip', '2017-06-05 11:55:32', null, '1', '1', '1', '0', '1', '91', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1022', '718', '1', '1', null, 'zip', '职业素养-职位永远“在线”.zip', null, 'resource/95/files/ECD32D50307F9F69FF7B95C789C58DF91496634983617.zip', '2017-06-05 11:56:33', null, '1', '1', '1', '0', '1', '95', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1023', '720', '1', '1', null, 'zip', '职业素养-规则，you know！.zip', null, 'resource/95/files/D3EF0866FAD50E678E7593AD6C1FBC491496635013644.zip', '2017-06-05 11:58:12', null, '1', '1', '1', '0', '1', '95', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1024', '625', '1', '1', null, 'zip', '健康心理 阳光心态-戒除网瘾.zip', null, 'resource/91/files/F5C099D7701FF23521BD3B4E0543FE911496634990316.zip', '2017-06-05 11:58:17', null, '1', '1', '1', '0', '1', '91', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1025', '719', '1', '1', null, 'zip', '职业素养-做一个靠谱的人.zip', null, 'resource/95/files/D219FB4828D25393363BE0F25D0D1CEE1496635150112.zip', '2017-06-05 11:59:13', null, '1', '1', '1', '0', '1', '95', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1026', '721', '1', '1', null, 'zip', '职业素养-说话之道大有学问.zip', null, 'resource/95/files/A05D1B52EA2A4823D54A422B200DDE241496635180062.zip', '2017-06-05 12:00:35', null, '1', '1', '1', '0', '1', '95', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1027', '626', '1', '1', null, 'zip', '健康心理 阳光心态-积极心理品质的培养.zip', null, 'resource/91/files/7188CAF3282B8D927B2F91E7A3796CA1496635128370.zip', '2017-06-05 12:00:57', null, '1', '1', '1', '0', '1', '91', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1028', '722', '1', '1', null, 'zip', '职业素养-组好团队事半功倍.zip', null, 'resource/95/files/82494410884B8212E8FF5588BC994FF61496635323023.zip', '2017-06-05 12:02:15', null, '1', '1', '1', '0', '1', '95', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1029', '627', '1', '1', null, 'zip', '健康心理 阳光心态-决不放弃.zip', null, 'resource/91/files/9E42716AFFF5E911276B44406EEFE6BC1496635315080.zip', '2017-06-05 12:02:52', null, '1', '1', '1', '0', '1', '91', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1031', '724', '1', '1', null, 'zip', '职业素养-海阔天空成就人生.zip', null, 'resource/95/files/FCCF4CE7F633BE3532261BD1CA6B943B1496635387607.zip', '2017-06-05 12:04:06', null, '1', '1', '1', '0', '1', '95', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1033', '723', '1', '1', null, 'zip', '职业素养-不能事事慢动作.zip', null, 'resource/95/files/D6017530A5019ADB73C33D0F8E6F57201496641050982.zip', '2017-06-05 13:37:35', null, '1', '1', '1', '0', '1', '95', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1034', '726', '1', '1', null, 'zip', '职业素养-信息时代，你low了吗？.zip', null, 'resource/95/files/86440BCC15FAFF37AC5E2D608B4587041496641217291.zip', '2017-06-05 13:40:26', null, '1', '1', '1', '0', '1', '95', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1035', '725', '1', '1', null, 'zip', '职业素养-有一种快乐叫分享.zip', null, 'resource/95/files/960671C4D0CF20203734537DD21F13141496641261126.zip', '2017-06-05 13:41:51', null, '1', '1', '1', '0', '1', '95', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1036', '727', '1', '1', null, 'zip', '职业素养-30秒，让人喜欢你.zip', null, 'resource/95/files/5E0CBB5AC060D15AA5648C31A2C0BD961496641376293.zip', '2017-06-05 13:43:03', null, '1', '1', '1', '0', '1', '95', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1037', '629', '1', '1', null, 'zip', '安全意识与文明行为--校园安全伴我行.zip', null, 'resource/92/files/95682118BEA9A63D4669FA8BE1D88C321496644118952.zip', '2017-06-05 14:30:02', null, '1', '1', '1', '0', '1', '92', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1038', '648', '1', '1', null, 'zip', '安全意识与文明行为--相处有道，接触有度.zip', null, 'resource/92/files/7C2AF5D815D7DB23E18D28A1AE5B191D1496644235922.zip', '2017-06-05 14:32:32', null, '1', '1', '1', '0', '1', '92', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1039', '649', '1', '1', null, 'zip', '安全意识与文明行为--和咸猪手说拜拜.zip', null, 'resource/92/files/9E1C08F5D330C88EF593C54E8FE6AC171496644386058.zip', '2017-06-05 14:33:50', null, '1', '1', '1', '0', '1', '92', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1041', '650', '1', '1', null, 'zip', '安全意识与文明行为-- 一时放纵带来百年孤独，半点星火毁掉万卷图书.zip', null, 'resource/92/files/387321E7C9ECA2AF1994F5CA394804E41496644532606.zip', '2017-06-05 14:38:45', null, '1', '1', '1', '0', '1', '92', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1042', '651', '1', '1', null, 'zip', '安全意识与文明行为--减灾防灾进课堂，安全意识传万家.zip', null, 'resource/92/files/8AF4C381F80FC7A89D84CB699A6E9C821496644931446.zip', '2017-06-05 14:42:17', null, '1', '1', '1', '0', '1', '92', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1043', '790', '1', '1', null, 'rar', '说说法律那点儿事.rar', null, 'resource/98/files/8ACD1B311F1B52ACBC632E30C74538AD1496645016191.rar', '2017-06-05 14:43:42', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1044', '652', '1', '1', null, 'zip', '安全意识与文明行为--急救我最行，安全伴你行.zip', null, 'resource/92/files/716A4BFFF09B5E02DB6B5255E13C91241496645003141.zip', '2017-06-05 14:44:28', null, '1', '1', '1', '0', '1', '92', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1045', '653', '1', '1', null, 'zip', '安全意识与文明行为--防人之心不可无，害人之心不可有.zip', null, 'resource/92/files/D945588122620229CCD76F36772F13C21496645112036.zip', '2017-06-05 14:46:18', null, '1', '1', '1', '0', '1', '92', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1046', '654', '1', '1', null, 'zip', '安全意识与文明行为--请你帮帮我.zip', null, 'resource/92/files/DA2D933C03CF04975239EB40AE9AF15F1496645210612.zip', '2017-06-05 14:47:41', null, '1', '1', '1', '0', '1', '92', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1047', '656', '1', '1', null, 'zip', '安全意识与文明行为--有勇有谋.zip', null, 'resource/92/files/67F0E11AA79BFE3ACCD64FFE6DC362201496645290002.zip', '2017-06-05 14:48:49', null, '1', '1', '1', '0', '1', '92', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1048', '657', '1', '1', null, 'zip', '安全意识与文明行为--生命最可贵，交规放心间.zip', null, 'resource/92/files/4E00C24AF46B402587424EE4428A40F91496645364153.zip', '2017-06-05 14:50:55', null, '1', '1', '1', '0', '1', '92', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1049', '658', '1', '1', null, 'zip', '安全意识与文明行为-- 绿色上网，健康成长，共建“文明网络家园”.zip', null, 'resource/92/files/B6404F0CFD9060A1571A81346375F4211496645487820.zip', '2017-06-05 14:51:35', null, '1', '1', '1', '0', '1', '92', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1051', '791', '1', '1', null, 'rar', '宪法：法律之母.rar', null, 'resource/98/files/A1157E1225354A8FA591F4D5C1A9F2E41496645566202.rar', '2017-06-05 14:52:51', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1055', '792', '1', '1', null, 'rar', '法治理念：揭开法律的面纱.rar', null, 'resource/98/files/A5C11C1C3AFCA0CCE6A3A30BE1F998B41496645651554.rar', '2017-06-05 14:54:45', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1056', '659', '1', '1', null, 'zip', '安全意识与文明行为--尊老爱幼是美德.zip', null, 'resource/92/files/5F0EFD5F686992D6C26CDD949AF8D49E1496645585187.zip', '2017-06-05 14:55:40', null, '1', '1', '1', '0', '1', '92', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1057', '660', '1', '1', null, 'zip', '安全意识与文明行为--带走垃圾，留下回忆.zip', null, 'resource/92/files/D948A34C3930D30F18897A48AC76991C1496645841391.zip', '2017-06-05 14:57:25', null, '1', '1', '1', '0', '1', '92', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1058', '634', '1', '1', null, 'zip', '安全意识与文明行为-- 我爱照镜子.zip', null, 'resource/92/files/D4ACDBEB7FEEB9485EC2CC1229800A551496645877715.zip', '2017-06-05 14:58:12', null, '1', '1', '1', '0', '1', '92', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1059', '793', '1', '1', null, 'rar', '公民：你不仅仅是父母的孩子.rar', null, 'resource/98/files/E16772368CB7A71E7E18A4A7648D18A41496645968329.rar', '2017-06-05 14:59:33', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1060', '661', '1', '1', null, 'zip', '安全意识与文明行为-- 我爱照镜子.zip', null, 'resource/92/files/D4ACDBEB7FEEB9485EC2CC1229800A551496645971657.zip', '2017-06-05 14:59:36', null, '1', '1', '1', '0', '1', '92', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1061', '794', '1', '1', null, 'rar', '亲子关系：我与我的监护人.rar', null, 'resource/98/files/89474F2B209B9CE3BCB42CCA65A9CCC31496645997175.rar', '2017-06-05 15:00:29', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1066', '862', '1', '1', null, 'zip', '安全意识与文明行为--团结友爱创美誉.zip', null, 'resource/92/files/528308F7784F2AE4A384DC150BE447BB1496646942156.zip', '2017-06-05 15:15:49', null, '1', '1', '1', '0', '1', '92', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1067', '577', '1', '1', null, 'zip', '《弟子规》-第一章 《弟子规》与我.zip', null, 'resource/90/files/FCFC3EB7D50FD02AB596207F1002E6FE1496648455364.zip', '2017-06-05 15:41:01', null, '1', '1', '1', '0', '1', '90', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1068', '579', '1', '1', null, 'zip', '《弟子规》-第二章 中华第一规.zip', null, 'resource/90/files/298B52E5B7F866330CE64714A0D4FC611496648566331.zip', '2017-06-05 15:42:59', null, '1', '1', '1', '0', '1', '90', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1069', '581', '1', '1', null, 'zip', '《弟子规》-第三章 第一节 接纳他们.zip', null, 'resource/90/files/794DE78523B64009B9BFAD77CAA32AF41496648662305.zip', '2017-06-05 15:44:47', null, '1', '1', '1', '0', '1', '90', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1071', '582', '1', '1', null, 'zip', '《弟子规》-第三章 第二节 尊重他们.zip', null, 'resource/90/files/438EDEDFC64BEF96DFDED426B13DAB9E1496648766083.zip', '2017-06-05 15:46:19', null, '1', '1', '1', '0', '1', '90', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1073', '801', '1', '1', null, 'rar', '家庭暴力：对爸妈的拳脚说NO.rar', null, 'resource/98/files/D2CF3F5462186607BCC7F8F4418B701496648855465.rar', '2017-06-05 15:47:38', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1074', '583', '1', '1', null, 'zip', '《弟子规》-第三章 第三节 体谅他们.zip', null, 'resource/90/files/6DAE1A6669831AB1AEC8871D0C7110551496648853589.zip', '2017-06-05 15:48:22', null, '1', '1', '1', '0', '1', '90', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1075', '803', '1', '1', null, 'rar', '性侵：别把黑手伸向我.rar', null, 'resource/98/files/A305CA0242A6540AC9F6CE963FB7EDDE1496648908128.rar', '2017-06-05 15:49:06', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1076', '584', '1', '1', null, 'zip', '《弟子规》-第三章 第四节 关心他们.zip', null, 'resource/90/files/B62093251BA98C28669C428CC04936941496649036988.zip', '2017-06-05 15:51:02', null, '1', '1', '1', '0', '1', '90', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1077', '585', '1', '1', null, 'zip', '《弟子规》-第三章 第五节 包容他们.zip', null, 'resource/90/files/B691A66D401EAFBD2A22C1BC74645DF61496649093438.zip', '2017-06-05 15:52:25', null, '1', '1', '1', '0', '1', '90', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1078', '805', '1', '1', null, 'rar', '继承权：我家的传家宝，有我的份吗？.rar', null, 'resource/98/files/EE8A187AF719A87C7FA10BCFF209111496649220050.rar', '2017-06-05 15:53:43', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1079', '811', '1', '1', null, 'rar', '侵权：你闯祸，谁买单？.rar', null, 'resource/98/files/1C6C10D715833A1287F88A00B93618B31496649258762.rar', '2017-06-05 15:54:46', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1080', '587', '1', '1', null, 'zip', '《弟子规》-第四章 第一节 管住嘴巴.zip', null, 'resource/90/files/354BF575D71234E700FDC92C7DF30FA91496649382758.zip', '2017-06-05 15:56:58', null, '1', '1', '1', '0', '1', '90', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1081', '808', '1', '1', null, 'rar', '婚姻法：爸爸妈妈，你们离婚了，我怎么办？.rar', null, 'resource/98/files/DB89FD1B4955BAB91F61EE91BCFC3EFF1496649521338.rar', '2017-06-05 15:58:44', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1082', '588', '1', '1', null, 'zip', '《弟子规》-第四章 第二节 管住举止.zip', null, 'resource/90/files/6C93F6131DB1E52A85D12EAA0FFC6FDD1496649455466.zip', '2017-06-05 15:59:05', null, '1', '1', '1', '0', '1', '90', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1083', '818', '1', '1', null, 'rar', '教育权：我上学，谁做主？.rar', null, 'resource/98/files/DC994459C79210522321163E26EB6D1B1496649554116.rar', '2017-06-05 15:59:46', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1085', '820', '1', '1', null, 'rar', '人格权：我也需要被尊重.rar', null, 'resource/98/files/1FFB5ABAF7240C73E2ADB855AE812DDC1496649817744.rar', '2017-06-05 16:03:41', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1086', '589', '1', '1', null, 'zip', '《弟子规》-第四章 第三节 管住时间.zip', null, 'resource/90/files/FE2888E39C11EEEED6B16038139B4F621496649828499.zip', '2017-06-05 16:03:57', null, '1', '1', '1', '0', '1', '90', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1088', '822', '1', '1', null, 'rar', '生命健康权：校园意外的救赎.rar', null, 'resource/98/files/B7C948C5167D87BCB015FA1A202E6F1496649898879.rar', '2017-06-05 16:05:24', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1089', '590', '1', '1', null, 'zip', '《弟子规》-第四章 第四节 管理环境.zip', null, 'resource/90/files/2D0296B5828D1F8A02989FC492C2A3AA1496649958990.zip', '2017-06-05 16:08:17', null, '1', '1', '1', '0', '1', '90', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1090', '824', '1', '1', null, 'rar', '健康饮食权：一个馒头引发的血案.rar', null, 'resource/98/files/4AD15B429AC5F8FC24601712E3012131496650165001.rar', '2017-06-05 16:09:29', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1093', '826', '1', '1', null, 'rar', '财产权：我的money，你别拿！.rar', null, 'resource/98/files/87E1A18D27A0DF67485A5E9C6A303B181496650201376.rar', '2017-06-05 16:10:25', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1094', '591', '1', '1', null, 'zip', '《弟子规》-第四章 第五节 管理欲望.zip', null, 'resource/90/files/C2092207C14A014163E1C420D84023521496650315798.zip', '2017-06-05 16:13:36', null, '1', '1', '1', '0', '1', '90', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1095', '828', '1', '1', null, 'rar', '校园欺凌：小霸王，你别嚣张！.rar', null, 'resource/98/files/847BE251E4F8827F83226E7DEC32AA521496650459731.rar', '2017-06-05 16:14:22', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1096', '592', '1', '1', null, 'zip', '《弟子规》-第四章 第六节 管住手机.zip', null, 'resource/90/files/F97841DB59DF708919C16FCE30401F411496650438978.zip', '2017-06-05 16:15:24', null, '1', '1', '1', '0', '1', '90', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1097', '829', '1', '1', null, 'rar', '人身权：当意外发生的时候.rar', null, 'resource/98/files/91EE1C4F43165F2206C84DB13F03DD821496650616313.rar', '2017-06-05 16:17:01', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1098', '831', '1', '1', null, 'rar', '隐私权：我的日记，你能看吗？.rar', null, 'resource/98/files/95586E58DF9C6FF8128D20800CC532441496650652541.rar', '2017-06-05 16:17:51', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1099', '593', '1', '1', null, 'zip', '《弟子规》-第四章 第七节 管住斗殴.zip', null, 'resource/90/files/9340CFBC9E83425007B57009784E7DF01496650575477.zip', '2017-06-05 16:19:22', null, '1', '1', '1', '0', '1', '90', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1100', '595', '1', '1', null, 'zip', '《弟子规》-第五章 第一节 你是老师.zip', null, 'resource/90/files/9CA52F34C4C5A53D80A29A825BAC62901496650811119.zip', '2017-06-05 16:21:40', null, '1', '1', '1', '0', '1', '90', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1101', '833', '1', '1', null, 'rar', '知识产权：我的发明我做主.rar', null, 'resource/98/files/CD9C54DFA5D62FE5E555F10E5B1787C61496650908143.rar', '2017-06-05 16:21:51', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1102', '835', '1', '1', null, 'rar', '劳动权：我和打工，不得不说的故事.rar', null, 'resource/98/files/F2A6AE72FDEAC6DD28CC19BFA0BD9D871496650945715.rar', '2017-06-05 16:23:11', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1103', '596', '1', '1', null, 'zip', '《弟子规》-第五章 第二节 你是同学.zip', null, 'resource/90/files/E63B50F71CA4A77F8A813D4AFA123B781496650946791.zip', '2017-06-05 16:23:31', null, '1', '1', '1', '0', '1', '90', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1104', '598', '1', '1', null, 'zip', '《弟子规》-第六章 第一节 他是福星.zip', null, 'resource/90/files/E8C6328DA4B49E948A100ABC9042A7581496651074021.zip', '2017-06-05 16:26:30', null, '1', '1', '1', '0', '1', '90', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1105', '837', '1', '1', null, 'rar', '保险法：保驾护航伴我行.rar', null, 'resource/98/files/61940C3777FC3126894FA61C9030D9FC1496651269540.rar', '2017-06-05 16:27:56', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1106', '839', '1', '1', null, 'rar', '网络法律准则：法“网”恢恢，切勿网游人生.rar', null, 'resource/98/files/F07FD3099ED95FF8F0B0159DF90DA1471496651308209.rar', '2017-06-05 16:29:34', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1107', '599', '1', '1', null, 'zip', '《弟子规》-第六章 第二节 他是灾星.zip', null, 'resource/90/files/EE2DD7CE2CC570BB84091773D0E6DAB71496651269932.zip', '2017-06-05 16:30:01', null, '1', '1', '1', '0', '1', '90', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1108', '602', '1', '1', null, 'zip', '《弟子规》-第七章 第一节 为什么要学.zip', null, 'resource/90/files/84CE08BC8A0B7AD86A0143A4EA6422251496651475141.zip', '2017-06-05 16:31:30', null, '1', '1', '1', '0', '1', '90', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1109', '604', '1', '1', null, 'zip', '《弟子规》-第七章 第二节 学习没那么难.zip', null, 'resource/90/files/6C3A3455B033B6CCC9D4D23BA7DE907F1496651573119.zip', '2017-06-05 16:33:03', null, '1', '1', '1', '0', '1', '90', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1110', '841', '1', '1', null, 'rar', '司法程序的特殊保护：程序正义，与我息息相关.rar', null, 'resource/98/files/13F60BA10AAEFFF683988D93BB9C09931496651655627.rar', '2017-06-05 16:34:18', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1111', '847', '1', '1', null, 'rar', '人身权利犯罪：命丧黄泉路，事起小争端.rar', null, 'resource/98/files/589B498033AF32A38C3B893CC889D8EA1496651688359.rar', '2017-06-05 16:35:28', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1112', '849', '1', '1', null, 'rar', '财产犯罪：君子爱财，取之有道.rar', null, 'resource/98/files/2F9368203755D4005AD701463702ECBD1496651982876.rar', '2017-06-05 16:39:47', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1113', '851', '1', '1', null, 'rar', '毒品犯罪：不要把灵魂出卖给毒魔.rar', null, 'resource/98/files/4D120BEC4FE59EA272DECD729C05C281496652004181.rar', '2017-06-05 16:40:32', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1114', '855', '1', '1', null, 'rar', '犯罪预防：冲动是魔鬼.rar', null, 'resource/98/files/300CE459CF955CA818707B0BD0A3058D1496652286440.rar', '2017-06-05 16:45:14', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1115', '857', '1', '1', null, 'rar', '正当防卫与紧急避险：两害相较取其轻，两利相较取其重.rar', null, 'resource/98/files/30773F91E307F7F823DD15BC619C25401496652519019.rar', '2017-06-05 16:48:47', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1116', '844', '1', '1', null, 'rar', '契约精神：诚信守法从不作弊开始.rar', null, 'resource/98/files/12424D4970FAC20E169DE1A249363B9E1496652564317.rar', '2017-06-05 16:50:00', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1117', '846', '1', '1', null, 'rar', '依法维权：自助者，法助.rar', null, 'resource/98/files/9DE9C18CCCF27855A590FD1627503AD41496653028260.rar', '2017-06-05 16:57:34', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1118', '864', '1', '1', null, 'rar', '中国梦：复兴之路，法律点灯.rar', null, 'resource/98/files/A2BFC3DE9C15558229F8CEA8E22CF2361496653087529.rar', '2017-06-05 16:58:33', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1119', '865', '1', '1', null, 'zip', '健康心理 阳光心态-适应新环境.zip', null, 'resource/91/files/E08C68A9EEC0EAA588FBEE9F5AB18CAC1496719239749.zip', '2017-06-06 11:22:13', null, '1', '1', '1', '0', '1', '91', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1120', '866', '1', '1', null, 'zip', '学习与生活-绿色校园，低碳生活.zip', null, 'resource/93/files/FCE2B4A6F96A6322697166D044F50471496720132899.zip', '2017-06-06 11:36:32', null, '1', '1', '1', '0', '1', '93', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1121', '853', '1', '1', null, 'rar', '共同犯罪：“桃园结义”须讲法.rar', null, 'resource/98/files/5B9216911B572BFAA8427EA50625DDD51496721112506.rar', '2017-06-06 11:51:57', null, '1', '1', '1', '0', '1', '98', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1122', '889', '1', '1', null, 'rar', '乡情篇—颂乡之情—资源包.rar', null, 'resource/100/files/1E5E4E47660DEAD8576DA62EECD2B84E1504583891351.rar', '2017-09-05 11:58:13', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1123', '891', '1', '1', null, 'rar', '乡情篇—别乡之情—资源包.rar', null, 'resource/100/files/69004268E7E4A183B5114BBC9202FDB71504584086579.rar', '2017-09-05 12:01:29', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1124', '893', '1', '1', null, 'zip', '国学经典.zip', null, 'resource/100/files/76CDB2BAD9582D23C1F6F4D868218D6C1504584800771.zip', '2017-09-05 12:13:23', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1125', '895', '1', '1', null, 'rar', '国学经典.rar', null, 'resource/100/files/76CDB2BAD9582D23C1F6F4D868218D6C1504585028739.rar', '2017-09-05 12:17:11', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1126', '897', '1', '1', null, 'rar', '国学经典.rar', null, 'resource/100/files/76CDB2BAD9582D23C1F6F4D868218D6C1504585254882.rar', '2017-09-05 12:20:58', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1127', '899', '1', '1', null, 'rar', '国学经典.rar', null, 'resource/100/files/76CDB2BAD9582D23C1F6F4D868218D6C1504585416514.rar', '2017-09-05 12:23:39', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1128', '901', '1', '1', null, 'rar', '生命篇—生命可贵—资源包.rar', null, 'resource/100/files/ABC0CC8995EBB00E58E113A927C293A01504585534806.rar', '2017-09-05 12:25:38', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1129', '903', '1', '1', null, 'rar', '命篇—惜时勤学—资源包.rar', null, 'resource/100/files/ECCB261DA354F68EBD052332A4759E8D1504585644869.rar', '2017-09-05 12:27:29', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1130', '905', '1', '1', null, 'rar', '生命篇—生命绽放—资源包.rar', null, 'resource/100/files/57C69BD64B4D892DC2A9DEBE21B0D2B81504585752388.rar', '2017-09-05 12:29:16', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1131', '907', '1', '1', null, 'rar', '感恩篇—以孝事亲—资源包.rar', null, 'resource/100/files/929ACC893A7A1C40219241D95087CD4B1504585843606.rar', '2017-09-05 12:30:46', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1132', '909', '1', '1', null, 'rar', '国学经典.rar', null, 'resource/100/files/76CDB2BAD9582D23C1F6F4D868218D6C1504585931569.rar', '2017-09-05 12:32:13', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1133', '911', '1', '1', null, 'rar', '国学经典.rar', null, 'resource/100/files/76CDB2BAD9582D23C1F6F4D868218D6C1504586268219.rar', '2017-09-05 12:37:50', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1134', '913', '1', '1', null, 'rar', '修德篇—个人品德—资源包.rar', null, 'resource/100/files/829D2A7CAAB66C2ABA9C675E1DEC90DC1504586410895.rar', '2017-09-05 12:40:13', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1135', '915', '1', '1', null, 'rar', '修德篇—家庭美德—资源包.rar', null, 'resource/100/files/D4DDEA325F4043E874C839F342A1B7481504586514510.rar', '2017-09-05 12:41:57', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1136', '917', '1', '1', null, 'rar', '国学经典.rar', null, 'resource/100/files/76CDB2BAD9582D23C1F6F4D868218D6C1504586591789.rar', '2017-09-05 12:43:13', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1137', '919', '1', '1', null, 'rar', '国学经典.rar', null, 'resource/100/files/76CDB2BAD9582D23C1F6F4D868218D6C1504586696604.rar', '2017-09-05 12:44:58', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1138', '921', '1', '1', null, 'rar', '立场篇—立业之志—资源包.rar', null, 'resource/100/files/A610D787DE93033F6EA37ABAEA15AFEF1504586806286.rar', '2017-09-05 12:46:50', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1139', '923', '1', '1', null, 'rar', '国学经典.rar', null, 'resource/100/files/76CDB2BAD9582D23C1F6F4D868218D6C1504586899104.rar', '2017-09-05 12:48:21', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1140', '925', '1', '1', null, 'rar', '礼仪篇—政治之礼—资源包.rar', null, 'resource/100/files/9B70585D8A057D1D36926BA861D1A7DE1504625759123.rar', '2017-09-05 23:36:09', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1141', '927', '1', '1', null, 'rar', '国学经典.rar', null, 'resource/100/files/76CDB2BAD9582D23C1F6F4D868218D6C1504625871903.rar', '2017-09-05 23:37:53', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1142', '929', '1', '1', null, 'rar', '国学经典.rar', null, 'resource/100/files/76CDB2BAD9582D23C1F6F4D868218D6C1504625985712.rar', '2017-09-05 23:39:47', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1143', '931', '1', '1', null, 'rar', '国学经典.rar', null, 'resource/100/files/76CDB2BAD9582D23C1F6F4D868218D6C1504626099403.rar', '2017-09-05 23:41:41', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1144', '933', '1', '1', null, 'rar', '国学经典.rar', null, 'resource/100/files/76CDB2BAD9582D23C1F6F4D868218D6C1504626297150.rar', '2017-09-05 23:44:59', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1145', '935', '1', '1', null, 'rar', '国学经典.rar', null, 'resource/100/files/76CDB2BAD9582D23C1F6F4D868218D6C1504626718956.rar', '2017-09-05 23:52:01', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1146', '937', '1', '1', null, 'rar', '仁爱篇—众人之爱—资源包.rar', null, 'resource/100/files/71E8989AF646BC18A144FDE53EB3F3EF1504626847576.rar', '2017-09-05 23:54:17', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1147', '939', '1', '1', null, 'rar', '仁爱篇—万物之爱—资源包.rar', null, 'resource/100/files/794ACCE8E628BC155FF4EC30054FA7401504626927811.rar', '2017-09-05 23:55:38', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1148', '941', '1', '1', null, 'rar', '国学经典.rar', null, 'resource/100/files/76CDB2BAD9582D23C1F6F4D868218D6C1504627073535.rar', '2017-09-05 23:57:55', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1149', '943', '1', '1', null, 'rar', '技艺篇—巧夺天工—资源包.rar', null, 'resource/100/files/5C58505566A06FB4DA8A229C43748BB71504627214625.rar', '2017-09-06 00:00:19', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1150', '945', '1', '1', null, 'rar', '国学经典.rar', null, 'resource/100/files/76CDB2BAD9582D23C1F6F4D868218D6C1504627423611.rar', '2017-09-06 00:03:45', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1151', '947', '1', '1', null, 'rar', '诚信篇—诚信之重—资源包.rar', null, 'resource/100/files/341AE8586956870E1B5A9E2014F750CC1504627528173.rar', '2017-09-06 00:05:39', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1152', '949', '1', '1', null, 'rar', '诚信篇—诚信立人—资源包.rar', null, 'resource/100/files/E9FF7F8557B553C754B2A9F2C3B4D4CD1504627729884.rar', '2017-09-06 00:08:58', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1153', '951', '1', '1', null, 'rar', '诚信篇—诚信立业—资源包.rar', null, 'resource/100/files/F81356498FCF98205C2DC6B931B4BC501504627824017.rar', '2017-09-06 00:10:27', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1154', '988', '1', '1', null, 'rar', '国学经典.rar', null, 'resource/100/files/76CDB2BAD9582D23C1F6F4D868218D6C1504628640831.rar', '2017-09-06 00:24:02', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1155', '990', '1', '1', null, 'rar', '34.规则篇—职场之规—资源包.rar', null, 'resource/100/files/3BA84AF56664BFBD6A3ECC3FECD9A4C11504628866828.rar', '2017-09-06 00:27:56', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1156', '992', '1', '1', null, 'rar', '35.规则篇—社会之规—资源包.rar', null, 'resource/100/files/EBA8746FBA1B86B6A0E3D4BCF4B1D9151504628957788.rar', '2017-09-06 00:29:20', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1157', '953', '1', '1', null, 'rar', '责任篇—责任之心—资源包.rar', null, 'resource/100/files/B8EC2BCEC003B653771394408D2677A11504629074309.rar', '2017-09-06 00:31:17', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1158', '955', '1', '1', null, 'rar', '责任篇—善于负责—资源包.rar', null, 'resource/100/files/8B359C0B1DEFE99B61F9CF3FDF985121504629164306.rar', '2017-09-06 00:32:46', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1159', '957', '1', '1', null, 'rar', '国学经典.rar', null, 'resource/100/files/76CDB2BAD9582D23C1F6F4D868218D6C1504629250933.rar', '2017-09-06 00:34:12', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1160', '959', '1', '1', null, 'rar', '敬业篇—敬业爱岗—资源包.rar', null, 'resource/100/files/412A3E9FAEBB102D0BD8F187FD7B91B71504629464944.rar', '2017-09-06 00:37:48', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1161', '961', '1', '1', null, 'rar', '国学经典.rar', null, 'resource/100/files/76CDB2BAD9582D23C1F6F4D868218D6C1504629565397.rar', '2017-09-06 00:39:28', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1162', '963', '1', '1', null, 'rar', '敬业篇—敬业奉献—资源包.rar', null, 'resource/100/files/68CDB9B6585BA5B794396F60A40D0CF81504629694867.rar', '2017-09-06 00:41:41', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1163', '965', '1', '1', null, 'rar', '意志篇—知行合一—资源包.rar', null, 'resource/100/files/6E779FAFC325356308193227BF9BD6B51504629787813.rar', '2017-09-06 00:43:11', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1164', '967', '1', '1', null, 'rar', '意志篇—自强不息—资源包.rar', null, 'resource/100/files/B93F76EE23E5194FF825DBD9CF4E367C1504629869718.rar', '2017-09-06 00:44:32', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1165', '969', '1', '1', null, 'rar', '意志篇—持之以恒—资源包.rar', null, 'resource/100/files/5E359A79B1FC4AABF7F1F348913FE4871504629949018.rar', '2017-09-06 00:45:56', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1166', '971', '1', '1', null, 'rar', '廉洁篇—一心为民—资源包.rar', null, 'resource/100/files/CCEA66D2DF9D34F4C8485AD603E6DC071504630034300.rar', '2017-09-06 00:47:18', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1167', '973', '1', '1', null, 'rar', '国学经典.rar', null, 'resource/100/files/76CDB2BAD9582D23C1F6F4D868218D6C1504630135257.rar', '2017-09-06 00:48:57', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1168', '975', '1', '1', null, 'rar', '廉洁篇—公正刚直—资源包.rar', null, 'resource/100/files/AEA99A5A56C314FCE5096087D1A6E7D71504630237787.rar', '2017-09-06 00:50:42', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1169', '977', '1', '1', null, 'rar', '环保篇—道法自然—资源包.rar', null, 'resource/100/files/535F01A41797D82DCF2E4CDC04FEE18B1504630308197.rar', '2017-09-06 00:51:50', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1170', '979', '1', '1', null, 'rar', '环保篇—环保轶、古事—资源包.rar', null, 'resource/100/files/8304CAF7C1F891E584C3CAC425DD57861504630411094.rar', '2017-09-06 00:53:34', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1171', '981', '1', '1', null, 'rar', '环保篇—低碳节俭—资源包.rar', null, 'resource/100/files/B1A92CEC3CE2BE2F4C258C4BBBC069AA1504630498817.rar', '2017-09-06 00:55:37', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1172', '983', '1', '1', null, 'rar', '安全篇—未雨绸缪—资源包.rar', null, 'resource/100/files/A0EE01813A645AB1B1DC8E7F904317C31504630662145.rar', '2017-09-06 00:57:45', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1173', '985', '1', '1', null, 'rar', '安全篇—亡羊补牢—资源包.rar', null, 'resource/100/files/851FD950727FF5E3C609F4C16CD8DC541504630752249.rar', '2017-09-06 00:59:15', null, '1', '1', '1', '0', '1', '100', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1175', '1018', '1', '1', null, 'zip', '开篇：《我们的公约》.zip', null, 'resource/102/files/33AAE21F81A91CD4DF540E3AC2334F851504634657408.zip', '2017-09-06 02:04:19', null, '1', '1', '1', '0', '1', '102', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1176', '1019', '1', '1', null, 'zip', '第一条 爱祖国 有梦想.zip', null, 'resource/102/files/C0320B77FF13097482F17BCAA6E84A451504634676601.zip', '2017-09-06 02:04:39', null, '1', '1', '1', '0', '1', '102', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1177', '1020', '1', '1', null, 'zip', '第二条 爱学习 有专长.zip', null, 'resource/102/files/255C6C57F29AE4EC06B61F798F97E65D1504634687673.zip', '2017-09-06 02:04:49', null, '1', '1', '1', '0', '1', '102', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1178', '1021', '1', '1', null, 'zip', '第三条 爱劳动 图自强.zip', null, 'resource/102/files/E5AEFAE5CC5AC55F3C825390D5385FDD1504634697572.zip', '2017-09-06 02:04:59', null, '1', '1', '1', '0', '1', '102', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1179', '1022', '1', '1', null, 'zip', '第四条 讲文明 重修养.zip', null, 'resource/102/files/9B362571AC0B5887FD5D5FCADAD831831504634707837.zip', '2017-09-06 02:05:09', null, '1', '1', '1', '0', '1', '102', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1180', '1023', '1', '1', null, 'zip', '第五条 遵法纪 守规章.zip', null, 'resource/102/files/B71D8D0D1951978F42B19AA23F611A801504634719665.zip', '2017-09-06 02:05:22', null, '1', '1', '1', '0', '1', '102', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1181', '1024', '1', '1', null, 'zip', '第六条 辨美丑 立形象.zip', null, 'resource/102/files/23F84CF58761CEDE52478268F2DD40C71504634731051.zip', '2017-09-06 02:05:33', null, '1', '1', '1', '0', '1', '102', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1182', '1025', '1', '1', null, 'zip', '第七条 强体魄 保健康.zip', null, 'resource/102/files/E8ED90EE2525AAEC2D1728EF9CE7F4811504634742761.zip', '2017-09-06 02:05:44', null, '1', '1', '1', '0', '1', '102', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1183', '1026', '1', '1', null, 'zip', '第八条 树自信 勇担当.zip', null, 'resource/102/files/9ED87441B6903F87F5BE517BDD0FEB771504634754849.zip', '2017-09-06 02:05:56', null, '1', '1', '1', '0', '1', '102', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1184', '1027', '1', '1', null, 'zip', '结尾：《成长在路上》.zip', null, 'resource/102/files/9757037B209BE2095259B939C8244D1C1504634765736.zip', '2017-09-06 02:06:08', null, '1', '1', '1', '0', '1', '102', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1185', '202', '1', '1', null, 'rar', '职业与职业的种类.rar', null, 'resource/85/files/9E4BD5075F91380E87E74D925E8077B1504720083496.rar', '2017-09-07 01:48:07', null, '1', '1', '1', '0', '1', '85', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1186', '203', '1', '1', null, 'rar', '2. 职业与我（职业理想及其作用）.rar', null, 'resource/85/files/9E4BD5075F91380E87E74D925E8077B1504720177899.rar', '2017-09-07 01:49:40', null, '1', '1', '1', '0', '1', '85', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1187', '206', '1', '1', null, 'rar', '1. 企业对从业者的基本要求.rar', null, 'resource/85/files/9E4BD5075F91380E87E74D925E8077B1504720263538.rar', '2017-09-07 01:51:06', null, '1', '1', '1', '0', '1', '85', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1188', '208', '1', '1', null, 'rar', '2. 规则意识.rar', null, 'resource/85/files/9E4BD5075F91380E87E74D925E8077B1504720591358.rar', '2017-09-07 01:56:35', null, '1', '1', '1', '0', '1', '85', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1189', '210', '1', '1', null, 'rar', '3. 责任与服务意识.rar', null, 'resource/85/files/9E4BD5075F91380E87E74D925E8077B1504720768453.rar', '2017-09-07 02:00:08', null, '1', '1', '1', '0', '1', '85', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1190', '212', '1', '1', null, 'rar', '4. 沟通与合作意识.rar', null, 'resource/85/files/9E4BD5075F91380E87E74D925E8077B1504720894762.rar', '2017-09-07 02:01:39', null, '1', '1', '1', '0', '1', '85', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1191', '212', '1', '1', null, 'rar', '4. 沟通与合作意识.rar', null, 'resource/85/files/9E4BD5075F91380E87E74D925E8077B1504720894762.rar', '2017-09-07 02:02:59', null, '1', '1', '1', '0', '1', '85', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1193', '217', '1', '1', null, 'rar', '1. 职业生涯规划的基本概念.rar', null, 'resource/85/files/9E4BD5075F91380E87E74D925E8077B1504721366142.rar', '2017-09-07 02:10:05', null, '1', '1', '1', '0', '1', '85', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1194', '219', '1', '1', null, 'rar', '2. 中职生职业生涯规划的特点和意义.rar', null, 'resource/85/files/9E4BD5075F91380E87E74D925E8077B1504721473174.rar', '2017-09-07 02:11:56', null, '1', '1', '1', '0', '1', '85', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1195', '226', '1', '1', null, 'rar', '1. 职业兴趣及其培养.rar', null, 'resource/85/files/9E4BD5075F91380E87E74D925E8077B1504721654652.rar', '2017-09-07 02:14:17', null, '1', '1', '1', '0', '1', '85', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1196', '228', '1', '1', null, 'rar', '2. 自我评估.rar', null, 'resource/85/files/9E4BD5075F91380E87E74D925E8077B1504721837538.rar', '2017-09-07 02:17:27', null, '1', '1', '1', '0', '1', '85', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1198', '231', '1', '1', null, 'rar', '1. 从学校人到职业人的转变.rar', null, 'resource/85/files/9E4BD5075F91380E87E74D925E8077B1504721955554.rar', '2017-09-07 02:19:47', null, '1', '1', '1', '0', '1', '85', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1199', '233', '1', '1', null, 'rar', '2. 了解就业形势.rar', null, 'resource/85/files/9E4BD5075F91380E87E74D925E8077B1504722085743.rar', '2017-09-07 02:22:00', null, '1', '1', '1', '0', '1', '85', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1200', '241', '1', '1', null, 'rar', '第一课 求职途径.rar', null, 'resource/85/files/9E4BD5075F91380E87E74D925E8077B1504722332044.rar', '2017-09-07 02:26:15', null, '1', '1', '1', '0', '1', '85', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1201', '244', '1', '1', null, 'rar', '1. 填写大中专毕业生就业推荐表（说课）.rar', null, 'resource/85/files/9E4BD5075F91380E87E74D925E8077B1504731890009.rar', '2017-09-07 05:04:53', null, '1', '1', '1', '0', '1', '85', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1202', '246', '1', '1', null, 'rar', '2. 制作简历.rar', null, 'resource/85/files/9E4BD5075F91380E87E74D925E8077B1504731987463.rar', '2017-09-07 05:06:31', null, '1', '1', '1', '0', '1', '85', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1203', '248', '1', '1', null, 'rar', '3. 撰写求职自荐信.rar', null, 'resource/85/files/9E4BD5075F91380E87E74D925E8077B1504732106477.rar', '2017-09-07 05:08:29', null, '1', '1', '1', '0', '1', '85', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1204', '251', '1', '1', null, 'rar', '1. 求职基本礼仪.rar', null, 'resource/85/files/9E4BD5075F91380E87E74D925E8077B1504732226444.rar', '2017-09-07 05:10:30', null, '1', '1', '1', '0', '1', '85', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1205', '253', '1', '1', null, 'rar', '2. 塑造良好个人形象.rar', null, 'resource/85/files/9E4BD5075F91380E87E74D925E8077B1504732300363.rar', '2017-09-07 05:11:45', null, '1', '1', '1', '0', '1', '85', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1206', '256', '1', '1', null, 'rar', '1. 模拟面试.rar', null, 'resource/85/files/9E4BD5075F91380E87E74D925E8077B1504732390046.rar', '2017-09-07 05:13:13', null, '1', '1', '1', '0', '1', '85', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1207', '258', '1', '1', null, 'rar', '2. 面试技巧.rar', null, 'resource/85/files/9E4BD5075F91380E87E74D925E8077B1504732481351.rar', '2017-09-07 05:14:44', null, '1', '1', '1', '0', '1', '85', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1208', '261', '1', '1', null, 'rar', '1. 劳动合同的订立及其形式.rar', null, 'resource/85/files/9E4BD5075F91380E87E74D925E8077B1504732554698.rar', '2017-09-07 05:15:58', null, '1', '1', '1', '0', '1', '85', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1209', '263', '1', '1', null, 'rar', '2. 签订劳动合同的注意事项.rar', null, 'resource/85/files/9E4BD5075F91380E87E74D925E8077B1504732621953.rar', '2017-09-07 05:17:05', null, '1', '1', '1', '0', '1', '85', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1210', '266', '1', '1', null, 'rar', '第一课 创业的意义.rar', null, 'resource/85/files/9E4BD5075F91380E87E74D925E8077B1504732688768.rar', '2017-09-07 05:18:11', null, '1', '1', '1', '0', '1', '85', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1211', '268', '1', '1', null, 'rar', '第二课 对创业者素质和能力的要求.rar', null, 'resource/85/files/9E4BD5075F91380E87E74D925E8077B1504732755767.rar', '2017-09-07 05:19:18', null, '1', '1', '1', '0', '1', '85', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1212', '270', '1', '1', null, 'rar', '第三课 创业构想.rar', null, 'resource/85/files/9E4BD5075F91380E87E74D925E8077B1504732829545.rar', '2017-09-07 05:20:32', null, '1', '1', '1', '0', '1', '85', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1213', '272', '1', '1', null, 'rar', '第四课 创业行动指南.rar', null, 'resource/85/files/9E4BD5075F91380E87E74D925E8077B1504732895946.rar', '2017-09-07 05:21:39', null, '1', '1', '1', '0', '1', '85', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1214', '434', '1', '1', null, 'rar', '1. 商品和货币.rar', null, 'resource/89/files/9E4BD5075F91380E87E74D925E8077B1504733257578.rar', '2017-09-07 05:27:41', null, '1', '1', '1', '0', '1', '89', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1215', '436', '1', '1', null, 'rar', '2. 价格和价值规律.rar', null, 'resource/89/files/9E4BD5075F91380E87E74D925E8077B1504733321791.rar', '2017-09-07 05:28:45', null, '1', '1', '1', '0', '1', '89', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1216', '439', '1', '1', null, 'rar', '1. 提高企业的经济效益.rar', null, 'resource/89/files/9E4BD5075F91380E87E74D925E8077B1504733387097.rar', '2017-09-07 05:29:50', null, '1', '1', '1', '0', '1', '89', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1217', '441', '1', '1', null, 'rar', '2. 企业中的劳动者.rar', null, 'resource/89/files/9E4BD5075F91380E87E74D925E8077B1504733450758.rar', '2017-09-07 05:30:53', null, '1', '1', '1', '0', '1', '89', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1218', '444', '1', '1', null, 'rar', '1. 个人收入与分配.rar', null, 'resource/89/files/9E4BD5075F91380E87E74D925E8077B1504733536670.rar', '2017-09-07 05:32:19', null, '1', '1', '1', '0', '1', '89', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1219', '446', '1', '1', null, 'rar', '2. 依法纳税和投资理财.rar', null, 'resource/89/files/9E4BD5075F91380E87E74D925E8077B1504733613853.rar', '2017-09-07 05:33:38', null, '1', '1', '1', '0', '1', '89', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1220', '450', '1', '1', null, 'rar', '1. 维护社会主义基本经济制度.rar', null, 'resource/89/files/9E4BD5075F91380E87E74D925E8077B1504733703449.rar', '2017-09-07 05:35:11', null, '1', '1', '1', '0', '1', '89', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1221', '452', '1', '1', null, 'rar', '2. 把握社会注意市场经济的特征.rar', null, 'resource/89/files/9E4BD5075F91380E87E74D925E8077B1504733775418.rar', '2017-09-07 05:36:18', null, '1', '1', '1', '0', '1', '89', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1222', '455', '1', '1', null, 'rar', '1. 全面建设小康社会.rar', null, 'resource/89/files/9E4BD5075F91380E87E74D925E8077B1504733855567.rar', '2017-09-07 05:37:40', null, '1', '1', '1', '0', '1', '89', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1223', '457', '1', '1', null, 'rar', '2. 坚持科学发展观，促进经济社会生态协调发展.rar', null, 'resource/89/files/9E4BD5075F91380E87E74D925E8077B1504733924298.rar', '2017-09-07 05:38:48', null, '1', '1', '1', '0', '1', '89', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1224', '466', '1', '1', null, 'rar', '1. 人民代表大会制度及政党制度.rar', null, 'resource/89/files/9E4BD5075F91380E87E74D925E8077B1504733994616.rar', '2017-09-07 05:39:56', null, '1', '1', '1', '0', '1', '89', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1225', '468', '1', '1', null, 'rar', '2. 民族区域与基层群众自治制度.rar', null, 'resource/89/files/9E4BD5075F91380E87E74D925E8077B1504734068151.rar', '2017-09-07 05:41:11', null, '1', '1', '1', '0', '1', '89', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1226', '471', '1', '1', null, 'rar', '1. 人民民主是社会主义的生命.rar', null, 'resource/89/files/9E4BD5075F91380E87E74D925E8077B1504734139376.rar', '2017-09-07 05:42:22', null, '1', '1', '1', '0', '1', '89', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1227', '473', '1', '1', null, 'rar', '2. 发展社会主义民主政治.rar', null, 'resource/89/files/9E4BD5075F91380E87E74D925E8077B1504734208302.rar', '2017-09-07 05:43:32', null, '1', '1', '1', '0', '1', '89', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1228', '477', '1', '1', null, 'rar', '1. 公民享有民主权利.rar', null, 'resource/89/files/9E4BD5075F91380E87E74D925E8077B1504734310573.rar', '2017-09-07 05:45:13', null, '1', '1', '1', '0', '1', '89', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1229', '479', '1', '1', null, 'rar', '2. 人民政府服务人民.rar', null, 'resource/89/files/9E4BD5075F91380E87E74D925E8077B1504734383229.rar', '2017-09-07 05:46:26', null, '1', '1', '1', '0', '1', '89', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1230', '482', '1', '1', null, 'rar', '1. 公民的政治性任务.rar', null, 'resource/89/files/9E4BD5075F91380E87E74D925E8077B1504734448949.rar', '2017-09-07 05:47:32', null, '1', '1', '1', '0', '1', '89', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1231', '484', '1', '1', null, 'rar', '2. 自觉参与政治生活.rar', null, 'resource/89/files/9E4BD5075F91380E87E74D925E8077B1504734515171.rar', '2017-09-07 05:48:37', null, '1', '1', '1', '0', '1', '89', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1232', '487', '1', '1', null, 'rar', '1. 中国在国际社会中的作用（说课）.rar', null, 'resource/89/files/9E4BD5075F91380E87E74D925E8077B1504734578961.rar', '2017-09-07 05:49:41', null, '1', '1', '1', '0', '1', '89', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1233', '489', '1', '1', null, 'rar', '2. 我国奉行的外交政策.rar', null, 'resource/89/files/9E4BD5075F91380E87E74D925E8077B1504734647326.rar', '2017-09-07 05:50:49', null, '1', '1', '1', '0', '1', '89', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1234', '493', '1', '1', null, 'rar', '1. 优先发展教育：学有所教.rar', null, 'resource/89/files/9E4BD5075F91380E87E74D925E8077B1504734720974.rar', '2017-09-07 05:52:03', null, '1', '1', '1', '0', '1', '89', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1235', '495', '1', '1', null, 'rar', '2. 医疗和社会保障：普惠百姓.rar', null, 'resource/89/files/9E4BD5075F91380E87E74D925E8077B1504734798064.rar', '2017-09-07 05:53:21', null, '1', '1', '1', '0', '1', '89', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1237', '498', '1', '1', null, 'rar', '1. 推动社会主义文化大发展大繁荣.rar', null, 'resource/89/files/9E4BD5075F91380E87E74D925E8077B1504735746198.rar', '2017-09-07 06:09:08', null, '1', '1', '1', '0', '1', '89', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1238', '500', '1', '1', null, 'rar', '2. 社会主义核心价值体系.rar', null, 'resource/89/files/9E4BD5075F91380E87E74D925E8077B1504736127347.rar', '2017-09-07 06:19:18', null, '1', '1', '1', '0', '1', '89', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1239', '503', '1', '1', null, 'rar', '1. 高举旗帜 科学发展.rar', null, 'resource/89/files/9E4BD5075F91380E87E74D925E8077B1504736480634.rar', '2017-09-07 06:21:23', null, '1', '1', '1', '0', '1', '89', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1240', '505', '1', '1', null, 'rar', '2. 和谐社会 共建共享.rar', null, 'resource/89/files/9E4BD5075F91380E87E74D925E8077B1504736559981.rar', '2017-09-07 06:22:43', null, '1', '1', '1', '0', '1', '89', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1241', '316', '1', '1', null, 'rar', '1. 一般违法行为.rar', null, 'resource/86/files/9E4BD5075F91380E87E74D925E8077B1504739457194.rar', '2017-09-07 07:11:00', null, '1', '1', '1', '0', '1', '86', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1242', '334', '1', '1', null, 'rar', '2. 依法维护人身权利（说课）.rar', null, 'resource/86/files/9E4BD5075F91380E87E74D925E8077B1504740065311.rar', '2017-09-07 07:21:08', null, '1', '1', '1', '0', '1', '86', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1243', '340', '1', '1', null, 'rar', '5. 依法维护在家庭中的权利和义务.rar', null, 'resource/86/files/9E4BD5075F91380E87E74D925E8077B1504740314451.rar', '2017-09-07 07:25:17', null, '1', '1', '1', '0', '1', '86', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1244', '1065', '1', '1', null, 'rar', '第一课　生殖系统与健康.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504749241250.rar', '2017-09-07 09:54:04', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1246', '1066', '1', '1', null, 'rar', '第二课   新生命的孕育.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504749612361.rar', '2017-09-07 10:00:15', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1247', '1067', '1', '1', null, 'rar', '第三课　身体发育与困惑.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504749716824.rar', '2017-09-07 10:01:59', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1248', '1068', '1', '1', null, 'rar', '第四课　月经与遗精.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504749806146.rar', '2017-09-07 10:03:32', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1249', '1069', '1', '1', null, 'rar', '第五课　性的觉醒.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504749912081.rar', '2017-09-07 10:05:14', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1250', '1070', '1', '1', null, 'rar', '第一课　性心理现象.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504750184960.rar', '2017-09-07 10:09:48', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1251', '1071', '1', '1', null, 'rar', '第二课　体像烦恼.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504750252655.rar', '2017-09-07 10:10:58', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1252', '1072', '1', '1', null, 'rar', '第三课　性别认同.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504750324954.rar', '2017-09-07 10:12:07', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1253', '1073', '1', '1', null, 'rar', '第四课　亲子关系.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504750397647.rar', '2017-09-07 10:13:21', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1254', '1074', '1', '1', null, 'rar', '第五课　偶像崇拜.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504750477911.rar', '2017-09-07 10:14:40', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1255', '1075', '1', '1', null, 'rar', '第一课　朋友.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504750691844.rar', '2017-09-07 10:18:14', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1256', '1076', '1', '1', null, 'rar', '第二课　同伴压力.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504750752169.rar', '2017-09-07 10:19:15', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1257', '1077', '1', '1', null, 'rar', '第三课　异性交往.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504750805357.rar', '2017-09-07 10:20:09', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1258', '1078', '1', '1', null, 'rar', '第四课    情感的烦恼.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504750861033.rar', '2017-09-07 10:21:04', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1259', '1079', '1', '1', null, 'rar', '第五课    真爱.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504750923714.rar', '2017-09-07 10:22:07', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1260', '1080', '1', '1', null, 'rar', '第六课　分手与失恋.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504750979789.rar', '2017-09-07 10:23:03', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1261', '1081', '1', '1', null, 'rar', '第七课　学会拒绝.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504751033649.rar', '2017-09-07 10:23:56', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1262', '1082', '1', '1', null, 'rar', '第一课    性行为的选择.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504751134236.rar', '2017-09-07 10:25:37', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1263', '1083', '1', '1', null, 'rar', '第二课    避孕知识.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504751197403.rar', '2017-09-07 10:26:40', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1264', '1084', '1', '1', null, 'rar', '第三课    意外怀孕以后.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504751247577.rar', '2017-09-07 10:27:30', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1265', '1057', '1', '1', null, 'rar', '第四课    预防性侵害.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504751301227.rar', '2017-09-07 10:28:24', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1266', '1085', '1', '1', null, 'rar', '第五课    拒绝约会暴力.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504751354753.rar', '2017-09-07 10:29:17', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1267', '1086', '1', '1', null, 'rar', '第六课    酒精与毒品.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504751402787.rar', '2017-09-07 10:30:05', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1268', '1087', '1', '1', null, 'rar', '第七课    远离性病.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504751455267.rar', '2017-09-07 10:30:58', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1269', '1088', '1', '1', null, 'rar', '第一课   性与文化.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504751508554.rar', '2017-09-07 10:31:51', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1270', '1089', '1', '1', null, 'rar', '第二课   性别平等.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504751557271.rar', '2017-09-07 10:32:41', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1271', '1090', '1', '1', null, 'rar', '第三课　性权利.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504751609114.rar', '2017-09-07 10:33:31', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1272', '1091', '1', '1', null, 'rar', '第四课　多元的性.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504751661699.rar', '2017-09-07 10:34:24', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1273', '1092', '1', '1', null, 'rar', '第五课　性道德.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504751709044.rar', '2017-09-07 10:35:12', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1274', '1093', '1', '1', null, 'rar', '第六课　性法律.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504751765799.rar', '2017-09-07 10:36:08', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1275', '1094', '1', '1', null, 'rar', '第七课　婚姻与家庭.rar', null, 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504751817377.rar', '2017-09-07 10:37:00', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1276', '236', '1', '1', null, 'rar', '职业生涯发展的目标与措施.rar', null, 'resource/85/files/F57A5C1439ACAF839F0A624B21D2AC891504751835756.rar', '2017-09-07 10:37:18', null, '1', '1', '1', '0', '1', '85', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1277', '238', '1', '1', null, 'rar', '制定职业生涯规划意向书.rar', null, 'resource/85/files/F57A5C1439ACAF839F0A624B21D2AC891504751992917.rar', '2017-09-07 10:40:00', null, '1', '1', '1', '0', '1', '85', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1278', '1096', '1', '1', null, 'rar', '契约精神：诚信守法从不作弊开始.rar', null, 'resource/96/files/F57A5C1439ACAF839F0A624B21D2AC891504752146174.rar', '2017-09-07 10:42:29', null, '1', '1', '1', '0', '1', '96', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1279', '275', '1', '1', null, 'rar', '职业道德与法律.rar', null, 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752168221.rar', '2017-09-07 10:42:51', null, '1', '1', '1', '0', '1', '86', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1280', '278', '1', '1', null, 'rar', '第一课 塑造自己的良好形象—学生日常礼仪（.rar', null, 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752205496.rar', '2017-09-07 10:43:29', null, '1', '1', '1', '0', '1', '86', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1281', '1098', '1', '1', null, 'rar', '中国梦复兴之路，法律点灯.rar', null, 'resource/96/files/F57A5C1439ACAF839F0A624B21D2AC891504752214153.rar', '2017-09-07 10:43:36', null, '1', '1', '1', '0', '1', '96', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1282', '280', '1', '1', null, 'rar', '第二课 展示自己的职业风采—常见的职业礼仪.rar', null, 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752239988.rar', '2017-09-07 10:44:04', null, '1', '1', '1', '0', '1', '86', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1283', '1101', '1', '1', null, 'rar', '第一课 沟通，从心开始.rar', null, 'resource/96/files/F57A5C1439ACAF839F0A624B21D2AC891504752407247.rar', '2017-09-07 10:46:50', null, '1', '1', '1', '0', '1', '96', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1284', '1103', '1', '1', null, 'rar', '第二课 表达与倾听.rar', null, 'resource/96/files/F57A5C1439ACAF839F0A624B21D2AC891504752459520.rar', '2017-09-07 10:47:42', null, '1', '1', '1', '0', '1', '96', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1285', '283', '1', '1', null, 'rar', '第一课 我国公民的基本道德规范.rar', null, 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752566730.rar', '2017-09-07 10:49:30', null, '1', '1', '1', '0', '1', '86', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1286', '285', '1', '1', null, 'rar', '第二课 幸福生活的家庭美德.rar', null, 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752589047.rar', '2017-09-07 10:49:52', null, '1', '1', '1', '0', '1', '86', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1288', '289', '1', '1', null, 'rar', '第三课 和谐社会里的社会公德.rar', null, 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752636841.rar', '2017-09-07 10:50:40', null, '1', '1', '1', '0', '1', '86', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1289', '1105', '1', '1', null, 'rar', '第三课 拒绝与冲突管理.rar', null, 'resource/96/files/F57A5C1439ACAF839F0A624B21D2AC891504752640921.rar', '2017-09-07 10:50:47', null, '1', '1', '1', '0', '1', '96', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1290', '292', '1', '1', null, 'rar', '爱岗敬业，立足岗位成才.rar', null, 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752665539.rar', '2017-09-07 10:51:08', null, '1', '1', '1', '0', '1', '86', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1291', '294', '1', '1', null, 'rar', '诚实守信.rar', null, 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752690465.rar', '2017-09-07 10:51:33', null, '1', '1', '1', '0', '1', '86', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1292', '296', '1', '1', null, 'rar', '办事公道.rar', null, 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752715772.rar', '2017-09-07 10:51:57', null, '1', '1', '1', '0', '1', '86', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1293', '298', '1', '1', null, 'rar', '服务群众，奉献社会.rar', null, 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752737085.rar', '2017-09-07 10:52:20', null, '1', '1', '1', '0', '1', '86', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1294', '300', '1', '1', null, 'rar', '养成良好的职业行为习惯.rar', null, 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752760582.rar', '2017-09-07 10:52:43', null, '1', '1', '1', '0', '1', '86', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1295', '303', '1', '1', null, 'rar', '第一课 弘扬法治精神，建设法治国家.rar', null, 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752784361.rar', '2017-09-07 10:53:08', null, '1', '1', '1', '0', '1', '86', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1296', '305', '1', '1', null, 'rar', '第二课 维护宪法权威，当好国家公民.rar', null, 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752807336.rar', '2017-09-07 10:53:42', null, '1', '1', '1', '0', '1', '86', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1297', '1109', '1', '1', null, 'rar', '第一课 山一样的责任.rar', null, 'resource/95/files/F57A5C1439ACAF839F0A624B21D2AC891504752820955.rar', '2017-09-07 10:53:44', null, '1', '1', '1', '0', '1', '95', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1298', '308', '1', '1', null, 'rar', '崇尚程序正义—行政处罚.rar', null, 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752841866.rar', '2017-09-07 10:54:06', null, '1', '1', '1', '0', '1', '86', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1299', '310', '1', '1', null, 'rar', '增强维权意识—合法权益是否被侵犯.rar', null, 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752869837.rar', '2017-09-07 10:54:35', null, '1', '1', '1', '0', '1', '86', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1300', '1111', '1', '1', null, 'rar', '第二课 对自己尽责.rar', null, 'resource/95/files/F57A5C1439ACAF839F0A624B21D2AC891504752884550.rar', '2017-09-07 10:54:47', null, '1', '1', '1', '0', '1', '95', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1301', '312', '1', '1', null, 'rar', '3. 依法维护自己的合法权益—维权途径.rar', null, 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752899210.rar', '2017-09-07 10:55:01', null, '1', '1', '1', '0', '1', '86', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1303', '318', '1', '1', null, 'rar', '杜绝不良行为.rar', null, 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752972694.rar', '2017-09-07 10:56:15', null, '1', '1', '1', '0', '1', '86', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1304', '321', '1', '1', null, 'rar', '3. 依法处理违法行为.rar', null, 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752991831.rar', '2017-09-07 10:56:34', null, '1', '1', '1', '0', '1', '86', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1305', '324', '1', '1', null, 'rar', '犯罪.rar', null, 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504753018939.rar', '2017-09-07 10:57:02', null, '1', '1', '1', '0', '1', '86', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1306', '326', '1', '1', null, 'rar', '运用刑法武器依法制裁犯罪行为.rar', null, 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504753042910.rar', '2017-09-07 10:57:25', null, '1', '1', '1', '0', '1', '86', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1307', '328', '1', '1', null, 'rar', '同犯罪行为作斗争.rar', null, 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504753066397.rar', '2017-09-07 10:57:48', null, '1', '1', '1', '0', '1', '86', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1308', '1113', '1', '1', null, 'rar', '第三课 履行公民责任.rar', null, 'resource/95/files/F57A5C1439ACAF839F0A624B21D2AC891504753085085.rar', '2017-09-07 10:58:12', null, '1', '1', '1', '0', '1', '95', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1309', '332', '1', '1', null, 'rar', '依法参与民事活动.rar', null, 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504753094205.rar', '2017-09-07 10:58:17', null, '1', '1', '1', '0', '1', '86', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1310', '1116', '1', '1', null, 'rar', '劳动权：我和打工，不得不说的故事.rar', null, 'resource/95/files/F57A5C1439ACAF839F0A624B21D2AC891504753128998.rar', '2017-09-07 10:58:51', null, '1', '1', '1', '0', '1', '95', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1311', '336', '1', '1', null, 'rar', '依法保护财产权.rar', null, 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504753129972.rar', '2017-09-07 10:58:52', null, '1', '1', '1', '0', '1', '86', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1313', '1115', '1', '1', null, 'rar', '依法维权.rar', null, 'resource/95/files/F57A5C1439ACAF839F0A624B21D2AC891504753163688.rar', '2017-09-07 10:59:25', null, '1', '1', '1', '0', '1', '95', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1314', '338', '1', '1', null, 'rar', '正确利用合同参与民事活动.rar', null, 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504753157348.rar', '2017-09-07 11:09:31', null, '1', '1', '1', '0', '1', '86', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1315', '342', '1', '1', null, 'rar', '6. 依法维护在学校中的权利和义务.rar', null, 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504753822980.rar', '2017-09-07 11:10:34', null, '1', '1', '1', '0', '1', '86', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1316', '345', '1', '1', null, 'rar', '依法维护劳动者的合法权益.rar', null, 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504753892074.rar', '2017-09-07 11:11:36', null, '1', '1', '1', '0', '1', '86', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1317', '347', '1', '1', null, 'rar', '依法保护人类共有的家园.rar', null, 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504753917038.rar', '2017-09-07 11:12:01', null, '1', '1', '1', '0', '1', '86', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1318', '460', '1', '1', null, 'rar', '1. 对外开放是强国之路.rar', null, 'resource/89/files/F57A5C1439ACAF839F0A624B21D2AC891504754041459.rar', '2017-09-07 11:14:04', null, '1', '1', '1', '0', '1', '89', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1319', '462', '1', '1', null, 'rar', '2. 面对全球化 增强开放意识.rar', null, 'resource/89/files/F57A5C1439ACAF839F0A624B21D2AC891504754134615.rar', '2017-09-07 11:15:38', null, '1', '1', '1', '0', '1', '89', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1320', '351', '1', '1', null, 'rar', '1. 客观实际是人生选择的前提和基础.rar', null, 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504754136624.rar', '2017-09-07 11:15:41', null, '1', '1', '1', '0', '1', '87', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1321', '353', '1', '1', null, 'rar', '物质世界的多样性与人生选择.rar', null, 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504754201612.rar', '2017-09-07 11:16:44', null, '1', '1', '1', '0', '1', '87', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1323', '356', '1', '1', null, 'rar', '运动是物质的存在方式.rar', null, 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504754290527.rar', '2017-09-07 11:18:19', null, '1', '1', '1', '0', '1', '87', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1324', '358', '1', '1', null, 'rar', '把握客观规律善于行动.rar', null, 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504754356335.rar', '2017-09-07 11:19:20', null, '1', '1', '1', '0', '1', '87', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1325', '361', '1', '1', null, 'rar', '正确发挥自觉能动性.rar', null, 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504754450371.rar', '2017-09-07 11:20:53', null, '1', '1', '1', '0', '1', '87', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1326', '363', '1', '1', null, 'rar', '自强不息与成功人生.rar', null, 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504754507978.rar', '2017-09-07 11:21:50', null, '1', '1', '1', '0', '1', '87', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1327', '509', '1', '1', null, 'rar', '第二课 解读心理问题.rar', null, 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504754506658.rar', '2017-09-07 11:21:53', null, '1', '1', '1', '0', '1', '88', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1328', '511', '1', '1', null, 'rar', '第三课 认识心理咨询.rar', null, 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504754559980.rar', '2017-09-07 11:22:48', null, '1', '1', '1', '0', '1', '88', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1329', '367', '1', '1', null, 'rar', '用普遍联系的观点看待人际关系.rar', null, 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504754601867.rar', '2017-09-07 11:23:24', null, '1', '1', '1', '0', '1', '87', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1330', '515', '1', '1', null, 'rar', '第一课 认识自我.rar', null, 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504754625068.rar', '2017-09-07 11:23:48', null, '1', '1', '1', '0', '1', '88', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1331', '369', '1', '1', null, 'rar', '2. 在复杂多样的联系中营造和谐的人际关系.rar', null, 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504754670758.rar', '2017-09-07 11:24:34', null, '1', '1', '1', '0', '1', '87', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1332', '517', '1', '1', null, 'rar', '第二课 悦纳自我.rar', null, 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504754676772.rar', '2017-09-07 11:24:38', null, '1', '1', '1', '0', '1', '88', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1333', '519', '1', '1', null, 'rar', '第三课 不一样的我.rar', null, 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504754724330.rar', '2017-09-07 11:25:27', null, '1', '1', '1', '0', '1', '88', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1334', '372', '1', '1', null, 'rar', '事物发展的永恒性及其本质.rar', null, 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504754735699.rar', '2017-09-07 11:25:40', null, '1', '1', '1', '0', '1', '87', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1335', '521', '1', '1', null, 'rar', '第四课 完善自我.rar', null, 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504754776200.rar', '2017-09-07 11:26:18', null, '1', '1', '1', '0', '1', '88', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1336', '374', '1', '1', null, 'rar', '用发展的观点看待顺境与逆境.rar', null, 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504754807332.rar', '2017-09-07 11:26:49', null, '1', '1', '1', '0', '1', '87', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1337', '545', '1', '1', null, 'rar', '第一课 学习适应.rar', null, 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504754829537.rar', '2017-09-07 11:27:12', null, '1', '1', '1', '0', '1', '88', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1338', '377', '1', '1', null, 'rar', '矛盾是事物发展的动力.rar', null, 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504754874704.rar', '2017-09-07 11:27:58', null, '1', '1', '1', '0', '1', '87', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1339', '547', '1', '1', null, 'rar', '第二课 学习方法.rar', null, 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504754881615.rar', '2017-09-07 11:28:04', null, '1', '1', '1', '0', '1', '88', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1340', '549', '1', '1', null, 'rar', '第三课 时间管理.rar', null, 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504754929470.rar', '2017-09-07 11:28:52', null, '1', '1', '1', '0', '1', '88', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1341', '379', '1', '1', null, 'rar', '矛盾是事物发展的动力（说课）.rar', null, 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504754942103.rar', '2017-09-07 11:29:20', null, '1', '1', '1', '0', '1', '87', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1342', '551', '1', '1', null, 'rar', '第四课 快乐学习.rar', null, 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504754976706.rar', '2017-09-07 11:29:39', null, '1', '1', '1', '0', '1', '88', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1343', '383', '1', '1', null, 'rar', '在实践中寻求真知.rar', null, 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755018990.rar', '2017-09-07 11:30:21', null, '1', '1', '1', '0', '1', '87', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1344', '573', '1', '1', null, 'rar', '第一课 积极心理.rar', null, 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755024444.rar', '2017-09-07 11:30:26', null, '1', '1', '1', '0', '1', '88', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1345', '385', '1', '1', null, 'rar', '在实践中快乐成长.rar', null, 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755074182.rar', '2017-09-07 11:31:16', null, '1', '1', '1', '0', '1', '87', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1346', '575', '1', '1', null, 'rar', '第二课 幸福心理.rar', null, 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755074537.rar', '2017-09-07 11:31:17', null, '1', '1', '1', '0', '1', '88', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1347', '388', '1', '1', null, 'rar', '把握事物的本质.rar', null, 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755127183.rar', '2017-09-07 11:32:09', null, '1', '1', '1', '0', '1', '87', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1348', '531', '1', '1', null, 'rar', '第一课 人际交往.rar', null, 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755132170.rar', '2017-09-07 11:32:15', null, '1', '1', '1', '0', '1', '88', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1349', '390', '1', '1', null, 'rar', '提高辨识能力.rar', null, 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755176628.rar', '2017-09-07 11:32:59', null, '1', '1', '1', '0', '1', '87', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1350', '533', '1', '1', null, 'rar', '第二课 人际冲突.rar', null, 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755182564.rar', '2017-09-07 11:33:04', null, '1', '1', '1', '0', '1', '88', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1351', '535', '1', '1', null, 'rar', '第三课 人际沟通—语言沟通.rar', null, 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755231189.rar', '2017-09-07 11:33:54', null, '1', '1', '1', '0', '1', '88', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1352', '393', '1', '1', null, 'rar', '培养科学的思维方法.rar', null, 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755234578.rar', '2017-09-07 11:33:57', null, '1', '1', '1', '0', '1', '87', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1353', '537', '1', '1', null, 'rar', '第四课 人际沟通—非语言沟通.rar', null, 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755284467.rar', '2017-09-07 11:34:46', null, '1', '1', '1', '0', '1', '88', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1354', '395', '1', '1', null, 'rar', '提高创新能力.rar', null, 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755284624.rar', '2017-09-07 11:34:47', null, '1', '1', '1', '0', '1', '87', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1355', '399', '1', '1', null, 'rar', '历史规律的特点.rar', null, 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755341326.rar', '2017-09-07 11:35:44', null, '1', '1', '1', '0', '1', '87', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1356', '401', '1', '1', null, 'rar', '2. 实现人生目标必须符合历史规律.rar', null, 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755390298.rar', '2017-09-07 11:36:32', null, '1', '1', '1', '0', '1', '87', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1357', '1118', '1', '1', null, 'rar', '第一课 认识情绪.rar', null, 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755399489.rar', '2017-09-07 11:36:42', null, '1', '1', '1', '0', '1', '88', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1358', '404', '1', '1', null, 'rar', '个人理想与社会理想.rar', null, 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755455342.rar', '2017-09-07 11:37:38', null, '1', '1', '1', '0', '1', '87', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1359', '526', '1', '1', null, 'rar', '第二课 调控情绪.rar', null, 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755456828.rar', '2017-09-07 11:37:39', null, '1', '1', '1', '0', '1', '88', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1360', '528', '1', '1', null, 'rar', '第三课 情绪ABC.rar', null, 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755502160.rar', '2017-09-07 11:38:24', null, '1', '1', '1', '0', '1', '88', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1361', '406', '1', '1', null, 'rar', '2. 理想与现实.rar', null, 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755537544.rar', '2017-09-07 11:39:00', null, '1', '1', '1', '0', '1', '87', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1362', '561', '1', '1', null, 'rar', '第一课 挫折.rar', null, 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755558644.rar', '2017-09-07 11:39:21', null, '1', '1', '1', '0', '1', '88', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1363', '409', '1', '1', null, 'rar', '实现理想需要坚强的意志.rar', null, 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755593521.rar', '2017-09-07 11:39:56', null, '1', '1', '1', '0', '1', '87', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1364', '563', '1', '1', null, 'rar', '第二课 压力应对.rar', null, 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755608152.rar', '2017-09-07 11:40:10', null, '1', '1', '1', '0', '1', '88', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1365', '565', '1', '1', null, 'rar', '第三课 危机干预.rar', null, 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755654929.rar', '2017-09-07 11:40:57', null, '1', '1', '1', '0', '1', '88', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1366', '411', '1', '1', null, 'rar', '实现理想要敢于担当.rar', null, 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755655171.rar', '2017-09-07 11:40:59', null, '1', '1', '1', '0', '1', '87', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1367', '568', '1', '1', null, 'rar', '第一课 生命教育.rar', null, 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755705539.rar', '2017-09-07 11:41:48', null, '1', '1', '1', '0', '1', '88', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1368', '415', '1', '1', null, 'rar', '人是社会存在物.rar', null, 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755716233.rar', '2017-09-07 11:41:59', null, '1', '1', '1', '0', '1', '87', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1369', '570', '1', '1', null, 'rar', '第二课 生命价值观.rar', null, 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755752635.rar', '2017-09-07 11:42:34', null, '1', '1', '1', '0', '1', '88', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1370', '417', '1', '1', null, 'rar', '个人与集体的关系.rar', null, 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755765307.rar', '2017-09-07 11:42:48', null, '1', '1', '1', '0', '1', '87', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1371', '540', '1', '1', null, 'rar', '第一课 如何谈恋爱.rar', null, 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755803779.rar', '2017-09-07 11:43:26', null, '1', '1', '1', '0', '1', '88', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1372', '421', '1', '1', null, 'rar', '自我价值.rar', null, 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755818669.rar', '2017-09-07 11:43:41', null, '1', '1', '1', '0', '1', '87', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1373', '542', '1', '1', null, 'rar', '第二课 爱情底线在哪里.rar', null, 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755863143.rar', '2017-09-07 11:44:25', null, '1', '1', '1', '0', '1', '88', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1374', '423', '1', '1', null, 'rar', '劳动奉献与人的价值.rar', null, 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755876118.rar', '2017-09-07 11:44:39', null, '1', '1', '1', '0', '1', '87', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1375', '554', '1', '1', null, 'rar', '第一课 网络与心理健康.rar', null, 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755912935.rar', '2017-09-07 11:45:16', null, '1', '1', '1', '0', '1', '88', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1376', '426', '1', '1', null, 'rar', '努力实现人的全面发展.rar', null, 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755917464.rar', '2017-09-07 11:45:38', null, '1', '1', '1', '0', '1', '87', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1377', '556', '1', '1', null, 'rar', '第二课 网络依赖.rar', null, 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755963119.rar', '2017-09-07 11:46:06', null, '1', '1', '1', '0', '1', '88', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1378', '428', '1', '1', null, 'rar', '社会发展中实现人的个性自由.rar', null, 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755986450.rar', '2017-09-07 11:46:28', null, '1', '1', '1', '0', '1', '87', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1379', '558', '1', '1', null, 'rar', '第三课 游戏成瘾.rar', null, 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504756010147.rar', '2017-09-07 11:46:52', null, '1', '1', '1', '0', '1', '88', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1380', '507', '1', '1', null, 'rar', '第一课 关注心理健康.rar', null, 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504756074490.rar', '2017-09-07 11:47:56', null, '1', '1', '1', '0', '1', '88', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1381', '1122', '1', '1', null, 'rar', '预防艾滋病.rar', null, 'resource/103/files/F4142DF978CD920522E156E01335900F1505118374700.rar', '2017-09-11 16:26:20', null, '1', '1', '1', '0', '1', '103', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1382', '1125', '1', '1', null, 'rar', '1-1 巴蜀之音——《盼红军》  .rar', null, 'resource/104/files/27A6167B036451A0959AA573C7AF47341505373208954.rar', '2017-09-14 15:13:33', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1383', '1148', '1', '1', null, 'rar', '第一课  蝴蝶的爱情——梁祝.rar', null, 'resource/104/files/EB8633EBF3882ACCA5DCB3096FF0A2861505373451295.rar', '2017-09-14 15:17:33', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1384', '1149', '1', '1', null, 'rar', '第二课    屈人生——命运交响曲.rar', null, 'resource/104/files/EB8633EBF3882ACCA5DCB3096FF0A2861505373481209.rar', '2017-09-14 15:18:02', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1385', '1150', '1', '1', null, 'rar', '第三课    民族之魂——我的祖国交响诗套曲之《伏尔塔瓦河》.rar', null, 'resource/104/files/EB8633EBF3882ACCA5DCB3096FF0A2861505373539917.rar', '2017-09-14 15:19:02', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1386', '1126', '1', '1', null, 'rar', '1-2 江南小调——《茉莉花》.rar', null, 'resource/104/files/27A6167B036451A0959AA573C7AF47341505373539633.rar', '2017-09-14 15:19:03', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1387', '1151', '1', '1', null, 'rar', '第四课    硝烟弥漫——1812序曲.rar', null, 'resource/104/files/EB8633EBF3882ACCA5DCB3096FF0A2861505373575697.rar', '2017-09-14 15:19:37', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1388', '1152', '1', '1', null, 'rar', '第五课    交响素描——大海.rar', null, 'resource/104/files/EB8633EBF3882ACCA5DCB3096FF0A2861505373611751.rar', '2017-09-14 15:20:14', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1389', '1153', '1', '1', null, 'rar', '第一课  春的韵律——春舞.rar', null, 'resource/104/files/EB8633EBF3882ACCA5DCB3096FF0A2861505373635468.rar', '2017-09-14 15:20:37', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1390', '1155', '1', '1', null, 'rar', '第三课     浪漫音诗——爱之梦.rar', null, 'resource/104/files/EB8633EBF3882ACCA5DCB3096FF0A2861505373680563.rar', '2017-09-14 15:21:22', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1391', '1156', '1', '1', null, 'rar', '第二课     节日欢歌——春节序曲.rar', null, 'resource/104/files/EB8633EBF3882ACCA5DCB3096FF0A2861505373703047.rar', '2017-09-14 15:21:45', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1393', '1162', '1', '1', null, 'rar', '第四课     诗人情怀——升c小调幻想即兴曲.rar', null, 'resource/104/files/EB8633EBF3882ACCA5DCB3096FF0A2861505373882202.rar', '2017-09-14 15:24:44', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1394', '1157', '1', '1', null, 'rar', '第五课     动物的聚会——动物狂欢节.rar', null, 'resource/104/files/EB8633EBF3882ACCA5DCB3096FF0A2861505373927373.rar', '2017-09-14 15:25:29', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1395', '1128', '1', '1', null, 'rar', '1-4 歌声飞扬——《乘着歌声的翅膀》.rar', null, 'resource/104/files/27A6167B036451A0959AA573C7AF47341505373933057.rar', '2017-09-14 15:25:35', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1396', '1129', '1', '1', null, 'rar', '1-5 拿波里民谣——《我的太阳》.rar', null, 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374014957.rar', '2017-09-14 15:26:57', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1397', '1131', '1', '1', null, 'rar', '1-6 拉美之声——《美丽小天使》.rar', null, 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374064818.rar', '2017-09-14 15:27:48', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1398', '1158', '1', '1', null, 'rar', '第六课   蓝色梦幻——蓝色多瑙河.rar', null, 'resource/104/files/EB8633EBF3882ACCA5DCB3096FF0A2861505374092393.rar', '2017-09-14 15:28:14', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1399', '1159', '1', '1', null, 'rar', '第七课  灵动之美——天鹅湖.rar', null, 'resource/104/files/EB8633EBF3882ACCA5DCB3096FF0A2861505374132620.rar', '2017-09-14 15:28:54', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1400', '1160', '1', '1', null, 'rar', '第八课  音画印象——水中倒影.rar', null, 'resource/104/files/EB8633EBF3882ACCA5DCB3096FF0A2861505374178968.rar', '2017-09-14 15:29:43', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1401', '1161', '1', '1', null, 'rar', '第九课  律动之美——波莱罗舞曲.rar', null, 'resource/104/files/EB8633EBF3882ACCA5DCB3096FF0A2861505374216054.rar', '2017-09-14 15:30:18', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1402', '1133', '1', '1', null, 'rar', '第八课    音乐剧《猫》——memory.rar', null, 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374319541.rar', '2017-09-14 15:32:01', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1403', '1134', '1', '1', null, 'rar', '第九课    歌剧《卡门》——哈巴涅拉舞曲.rar', null, 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374359809.rar', '2017-09-14 15:32:41', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1404', '1139', '1', '1', null, 'rar', '第一课  古韵悠长——高山流水.rar', null, 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374401188.rar', '2017-09-14 15:33:24', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1405', '1140', '1', '1', null, 'rar', '第二课    战鼓声声——十面埋伏.rar', null, 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374436247.rar', '2017-09-14 15:33:58', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1406', '1141', '1', '1', null, 'rar', '第三课    落日余晖——渔舟唱晚.rar', null, 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374627520.rar', '2017-09-14 15:37:09', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1407', '1143', '1', '1', null, 'rar', '第五课    凄美旋律——二泉映月.rar', null, 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374695995.rar', '2017-09-14 15:38:20', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1408', '1144', '1', '1', null, 'rar', '第六课    喜庆唢呐——百鸟朝凤.rar', null, 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374754612.rar', '2017-09-14 15:39:16', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1409', '1145', '1', '1', null, 'rar', '第七课    锵锵京调——夜深沉.rar', null, 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374784333.rar', '2017-09-14 15:39:46', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1410', '1146', '1', '1', null, 'rar', '第八课   童真童趣——滚核桃.rar', null, 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374811755.rar', '2017-09-14 15:40:13', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1411', '1127', '1', '1', null, 'rar', '第三课  黄河大合唱——《保卫黄河》.rar', null, 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374906899.rar', '2017-09-14 15:41:51', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1412', '1132', '1', '1', null, 'rar', '第七课  爵士乐——《不知为何》.rar', null, 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374931044.rar', '2017-09-14 15:42:14', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1413', '1142', '1', '1', null, 'rar', '第四课    洒脱不羁——酒狂.rar', null, 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374965945.rar', '2017-09-14 15:42:49', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1414', '1147', '1', '1', null, 'rar', '第九课    诗情画意——春江花月夜.rar', null, 'resource/104/files/27A6167B036451A0959AA573C7AF47341505375016996.rar', '2017-09-14 15:43:40', null, '1', '1', '1', '0', '1', '104', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1415', '1165', '1', '1', null, 'rar', '第一课 做真实的自己.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506504270408.rar', '2017-09-27 17:24:32', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1416', '1166', '1', '1', null, 'rar', '第二课 实诚于己.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506504294703.rar', '2017-09-27 17:24:56', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1417', '1167', '1', '1', null, 'rar', '第三课 坦诚待人.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506504330445.rar', '2017-09-27 17:25:32', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1418', '1169', '1', '1', null, 'rar', '第一课 自信，源自内心的力量.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506504354162.rar', '2017-09-27 17:25:56', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1419', '1170', '1', '1', null, 'rar', '第二课 找到属于你自己的那把钥匙.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506504383563.rar', '2017-09-27 17:26:25', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1420', '1171', '1', '1', null, 'rar', '第三课 青春，我们自信前行.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506504404799.rar', '2017-09-27 17:26:50', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1421', '1173', '1', '1', null, 'rar', '第一课 乐观是一种力量.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506504583329.rar', '2017-09-27 17:29:47', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1422', '1174', '1', '1', null, 'rar', '第二课 活出乐观的自己.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506504615695.rar', '2017-09-27 17:30:19', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1423', '1175', '1', '1', null, 'rar', '第三课 做一个乐观的人.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506504644195.rar', '2017-09-27 17:30:46', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1425', '1177', '1', '1', null, 'rar', '第一课 知恩于心.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506504674539.rar', '2017-09-27 17:31:16', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1426', '1178', '1', '1', null, 'rar', '第二课 感恩于情.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506504695240.rar', '2017-09-27 17:31:39', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1427', '1179', '1', '1', null, 'rar', '第三课 懂报恩，能施恩.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506504719353.rar', '2017-09-27 17:32:22', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1428', '1181', '1', '1', null, 'rar', '第一课 做一个自尊自爱的人.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506504819793.rar', '2017-09-27 17:33:41', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1429', '1182', '1', '1', null, 'rar', '第二课 构建长幼有序的人际关系.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506504842076.rar', '2017-09-27 17:36:15', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1430', '1183', '1', '1', null, 'rar', '第三课 实现万物共生的社会生态格局.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506504999142.rar', '2017-09-27 17:36:41', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1433', '1189', '1', '1', null, 'rar', '第一课 我眼中的宽容.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506505580898.rar', '2017-09-27 17:46:23', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1434', '1190', '1', '1', null, 'rar', '第二课 宽容的限度.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506505620264.rar', '2017-09-27 17:47:02', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1435', '1191', '1', '1', null, 'rar', '第三课 力行宽容.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506505651821.rar', '2017-09-27 17:47:36', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1436', '1193', '1', '1', null, 'rar', '第一课 沟通，从心开始.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506505689207.rar', '2017-09-27 17:48:12', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1437', '1194', '1', '1', null, 'rar', '第二课 表达与倾听.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506505710225.rar', '2017-09-27 17:48:32', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1438', '1195', '1', '1', null, 'rar', '第三课 拒绝与冲突.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506505739104.rar', '2017-09-27 17:49:01', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1439', '1229', '1', '1', null, 'rar', '第三课 做一个懂服从的人.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506565417095.rar', '2017-09-28 10:23:39', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1440', '1228', '1', '1', null, 'rar', '第二课 学会服从.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506565616879.rar', '2017-09-28 10:26:59', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1441', '1227', '1', '1', null, 'rar', '第一课 我们需要服从的品格.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506565756206.rar', '2017-09-28 10:29:18', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1442', '1232', '1', '1', null, 'rar', '第三课 友善伴我行.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506565816421.rar', '2017-09-28 10:30:18', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1443', '1231', '1', '1', null, 'rar', '第二课 友善的力量.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506565863560.rar', '2017-09-28 10:31:05', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1444', '1230', '1', '1', null, 'rar', '第一课 友善之花.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506565914842.rar', '2017-09-28 10:31:56', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1445', '1235', '1', '1', null, 'rar', '第三课 做一个节俭的人.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506565966368.rar', '2017-09-28 10:32:49', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1446', '1234', '1', '1', null, 'rar', '第二课 我们需要节俭.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506566036131.rar', '2017-09-28 10:34:32', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1447', '1233', '1', '1', null, 'rar', '第一课 节俭是一种美德.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506566133383.rar', '2017-09-28 10:35:35', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1448', '1238', '1', '1', null, 'rar', '第三课 勇于选择，规划未来.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506566207238.rar', '2017-09-28 10:36:51', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1449', '1237', '1', '1', null, 'rar', '第二课 勇敢挑战心理舒适区.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506566284724.rar', '2017-09-28 10:38:06', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1450', '1236', '1', '1', null, 'rar', '第一课 勇于作为，敢为人先.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506566357989.rar', '2017-09-28 10:39:19', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1451', '1242', '1', '1', null, 'rar', '第三课 拒绝与冲突.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506566440532.rar', '2017-09-28 10:40:43', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1452', '1241', '1', '1', null, 'rar', '第二课 表达与倾听.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506566470449.rar', '2017-09-28 10:41:12', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1453', '1240', '1', '1', null, 'rar', '第一课 沟通，从心开始.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506566498463.rar', '2017-09-28 10:41:40', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1454', '1245', '1', '1', null, 'rar', '第三课 力行宽容.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506566530979.rar', '2017-09-28 10:42:27', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1455', '1244', '1', '1', null, 'rar', '第二课 宽容的限度.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506566572538.rar', '2017-09-28 10:42:54', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1456', '1243', '1', '1', null, 'rar', '第一课 我眼中的宽容.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506566597640.rar', '2017-09-28 10:43:19', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1457', '1248', '1', '1', null, 'rar', '第三课 社会责任需要担当.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506566632165.rar', '2017-09-28 10:43:54', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1458', '1247', '1', '1', null, 'rar', '第二课 对自己尽责（说课）.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506566657847.rar', '2017-09-28 10:44:20', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1459', '1246', '1', '1', null, 'rar', '第一课 山一样的责任.rar', null, 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506566707108.rar', '2017-09-28 10:45:08', null, '1', '1', '1', '0', '1', '105', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1460', '1292', '1', '1', null, 'rar', '1-1 艺术的起源——史前艺术.rar', null, 'resource/108/files/EBB02C9481D167D86EFCBCCE286D7A31510304238997.rar', '2017-11-10 16:57:23', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1462', '1293', '1', '1', null, 'rar', '1-2 卑微的狰狞——商周青铜文化.rar', null, 'resource/108/files/65D7D82487F58F4E7E27A9C031597ED1510304678979.rar', '2017-11-10 17:04:42', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1463', '1294', '1', '1', null, 'rar', '1-3 彪悍的现实主义——秦汉墓葬艺术.rar', null, 'resource/108/files/66352FC039C2B591B0F83AF650738F611510304875812.rar', '2017-11-10 17:08:01', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1464', '1295', '1', '1', null, 'rar', '1-4 世界中心的艺术——唐代艺术.rar', null, 'resource/108/files/524275EB5F09258783A87A81FA8ACBE41510304938091.rar', '2017-11-10 17:09:01', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1465', '1296', '1', '1', null, 'rar', '1-5 格物致知——宋代花鸟画.rar', null, 'resource/108/files/26F6101630C0765B2904F2A9FE9D57F21510304985702.rar', '2017-11-10 17:09:49', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1466', '1297', '1', '1', null, 'rar', '1-6 溪山高远——宋代山水画.rar', null, 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510305378121.rar', '2017-11-10 17:16:20', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1467', '1298', '1', '1', null, 'rar', '1-7 文人自觉与艺术交融——元代艺术.rar', null, 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510305404722.rar', '2017-11-10 17:16:47', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1468', '1299', '1', '1', null, 'rar', '1-8 江南风韵——明代艺术.rar', null, 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510305439928.rar', '2017-11-10 17:17:25', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1469', '1300', '1', '1', null, 'rar', '1-9 皇家典藏与江南艺术——清代艺术.rar', null, 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510305485763.rar', '2017-11-10 17:18:09', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1470', '1301', '1', '1', null, 'mp4', '1-10 爱国运动中的艺术——近代艺术.mp4', null, 'resource/108/files/C430C8A7597FEA7595AA70239506716E1510305513134.mp4', '2017-11-10 17:18:35', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1471', '1302', '1', '1', null, 'rar', '1-11 沟通到表现——书法.rar', null, 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510305535236.rar', '2017-11-10 17:18:58', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1472', '1303', '1', '1', null, 'rar', '1-12 火与泥的涅槃——陶瓷（上）.rar', null, 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510305608428.rar', '2017-11-10 17:20:11', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1473', '1304', '1', '1', null, 'rar', '3 china的化身——陶瓷（下）.rar', null, 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510305821494.rar', '2017-11-10 17:23:43', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1474', '1305', '1', '1', null, 'rar', '1-14 织物上的艺术——帛画、纺织品艺术.rar', null, 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510305843978.rar', '2017-11-10 17:24:05', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1475', '1306', '1', '1', null, 'rar', '1-15 把玩的艺术——牙、角、匏艺术品.rar', null, 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510305880842.rar', '2017-11-10 17:24:43', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1476', '1307', '1', '1', null, 'rar', '1-16 千年不朽——漆器艺术.rar', null, 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510305906898.rar', '2017-11-10 17:25:08', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1477', '1308', '1', '1', null, 'rar', '1-17 装扮之美——饰品.rar', null, 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510305930701.rar', '2017-11-10 17:25:32', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1478', '1309', '1', '1', null, 'rar', '1-18 书房里的宝贝——文房用品.rar', null, 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510305952576.rar', '2017-11-10 17:25:56', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1479', '1310', '1', '1', null, 'rar', '1-19 信仰之光——宗教艺术.rar', null, 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510305976098.rar', '2017-11-10 17:26:17', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1480', '1311', '1', '1', null, 'rar', '1-20 凝固的音乐——建筑中的艺术美.rar', null, 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510305996978.rar', '2017-11-10 17:26:38', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1481', '1312', '1', '1', null, 'rar', '1-21 民族瑰宝——民族艺术.rar', null, 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510306021451.rar', '2017-11-10 17:27:04', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1482', '1313', '1', '1', null, 'rar', '1-22 生活中的艺术——民间艺术.rar', null, 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510306044056.rar', '2017-11-10 17:27:25', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1483', '1315', '1', '1', null, 'rar', '2-1 逝去的文明——埃及、两河文明.rar', null, 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510535932053.rar', '2017-11-13 09:18:55', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1484', '1316', '1', '1', null, 'rar', '欧陆曙光——古希腊罗马艺术.rar', null, 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510535958735.rar', '2017-11-13 09:19:22', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1485', '1317', '1', '1', null, 'rar', '冷峻严肃——中世纪欧洲艺术.rar', null, 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510535984865.rar', '2017-11-13 09:19:48', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1486', '1318', '1', '1', null, 'rar', '群星璀璨——欧洲文艺复兴时期艺术.rar', null, 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510536014631.rar', '2017-11-13 09:20:16', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1487', '1319', '1', '1', null, 'rar', '2-5 重归理性——从巴洛克到新古典主义.rar', null, 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510536042303.rar', '2017-11-13 09:20:44', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1488', '1320', '1', '1', null, 'rar', '2-6 走向表现——印象派及以后.rar', null, 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510536066267.rar', '2017-11-13 09:21:08', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1489', '1321', '1', '1', null, 'rar', '2-7 一切皆有可能——现代艺术.rar', null, 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510536090895.rar', '2017-11-13 09:21:33', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1490', '1321', '1', '1', null, 'rar', '2-7 一切皆有可能——现代艺术.rar', null, 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510536090895.rar', '2017-11-13 09:21:37', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1491', '1323', '1', '1', null, 'rar', '3-1 品味的变迁——设计风格的变化.rar', null, 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510536119687.rar', '2017-11-13 09:22:01', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1492', '1324', '1', '1', null, 'rar', '3-2 艺术与科学——艺术中体现的科学问题.rar', null, 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510536146868.rar', '2017-11-13 09:22:29', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1493', '1325', '1', '1', null, 'rar', '3-3 艺术基础ABC——一些常用的基本概念.rar', null, 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510536173750.rar', '2017-11-13 09:22:57', null, '1', '1', '1', '0', '1', '108', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1494', '1332', '1', '1', null, 'rar', '2-4 伟大的牛顿革命（一）：哥白尼的“第一枪”.rar', null, 'resource/109/files/2d3e0fde3ebc458cae9db4cbc169a0271513068122398.rar', '2017-12-12 16:42:05', null, '1', '1', '1', '0', '1', '109', '226', '0', '');
INSERT INTO `chapter_file` VALUES ('1495', '1329', '1', '1', null, 'rar', '1-6 古代中国的辉煌成就（一）.rar', null, 'resource/109/files/e8ac8ff00a9c4418944f78392b6d5d111513070128843.rar', '2017-12-12 17:15:30', null, '1', '1', '1', '0', '1', '109', '226', '0', '');

-- ----------------------------
-- Table structure for class_info
-- ----------------------------
DROP TABLE IF EXISTS `class_info`;
CREATE TABLE `class_info` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `grade_id` int(11) DEFAULT NULL,
  `schoolId` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `major` varchar(100) DEFAULT NULL,
  `createUserId` int(11) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `stateDate` datetime DEFAULT NULL,
  `state` int(2) NOT NULL DEFAULT '1',
  `info` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class_info
-- ----------------------------
INSERT INTO `class_info` VALUES ('37', '5', '1', '亚卓教育德育实验班', null, '226', '2017-12-18 15:43:17', '2017-12-18 15:43:17', '1', '亚卓教育德育实验班');

-- ----------------------------
-- Table structure for controller_type
-- ----------------------------
DROP TABLE IF EXISTS `controller_type`;
CREATE TABLE `controller_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `con_name` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of controller_type
-- ----------------------------
INSERT INTO `controller_type` VALUES ('1', '导航', 'navigation ');
INSERT INTO `controller_type` VALUES ('2', '菜单', 'menu');
INSERT INTO `controller_type` VALUES ('3', '按钮', 'button');

-- ----------------------------
-- Table structure for course_attention_info
-- ----------------------------
DROP TABLE IF EXISTS `course_attention_info`;
CREATE TABLE `course_attention_info` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `open_id` int(11) DEFAULT NULL,
  `create_dt` datetime DEFAULT NULL,
  `state_dt` datetime DEFAULT NULL,
  `state` int(2) DEFAULT '1',
  PRIMARY KEY (`course_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_attention_info
-- ----------------------------

-- ----------------------------
-- Table structure for course_chapter
-- ----------------------------
DROP TABLE IF EXISTS `course_chapter`;
CREATE TABLE `course_chapter` (
  `chapter_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `chapter_name` varchar(200) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `level` int(5) DEFAULT NULL,
  `create_dt` datetime DEFAULT NULL,
  `state_dt` datetime DEFAULT NULL,
  `state` int(1) DEFAULT '1',
  PRIMARY KEY (`chapter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1333 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_chapter
-- ----------------------------
INSERT INTO `course_chapter` VALUES ('198', '85', '0', '第一单元 树立职业意识', '1', '1', null, '2017-06-01 10:38:02', '1');
INSERT INTO `course_chapter` VALUES ('199', '85', '198', '第一课 职业与人生', '2', '2', '2017-06-01 10:23:33', '2017-06-01 10:23:44', '1');
INSERT INTO `course_chapter` VALUES ('200', '85', '199', '1. 职业与职业的种类', '1', '3', '2017-06-01 10:23:46', '2017-09-07 01:47:26', '1');
INSERT INTO `course_chapter` VALUES ('201', '85', '199', '2. 职业与我（职业理想及其作用）', '3', '3', '2017-06-01 10:24:03', '2017-09-07 01:48:51', '1');
INSERT INTO `course_chapter` VALUES ('202', '85', '199', '1. 职业与职业的种类（说课）', '2', '3', '2017-06-01 10:25:41', '2017-09-07 01:48:07', '1');
INSERT INTO `course_chapter` VALUES ('203', '85', '199', '2. 职业与我（职业理想及其作用）（说课）', '4', '3', '2017-06-01 10:26:30', '2017-09-07 01:49:40', '1');
INSERT INTO `course_chapter` VALUES ('204', '85', '198', '第二课 职业意识', '3', '2', '2017-06-01 10:27:27', '2017-06-01 10:27:35', '1');
INSERT INTO `course_chapter` VALUES ('205', '85', '204', '1. 企业对从业者的基本要求', '1', '3', '2017-06-01 10:27:37', '2017-09-07 01:50:14', '1');
INSERT INTO `course_chapter` VALUES ('206', '85', '204', '1. 企业对从业者的基本要求（说课）', '2', '3', '2017-06-01 10:27:58', '2017-09-07 01:51:06', '1');
INSERT INTO `course_chapter` VALUES ('207', '85', '204', '2. 规则意识', '3', '3', '2017-06-01 10:28:11', '2017-09-07 01:55:46', '1');
INSERT INTO `course_chapter` VALUES ('208', '85', '204', '2. 规则意识（说课）', '4', '3', '2017-06-01 10:28:28', '2017-09-07 01:56:34', '1');
INSERT INTO `course_chapter` VALUES ('209', '85', '204', '3. 责任与服务意识', '5', '3', '2017-06-01 10:28:36', '2017-09-07 01:58:24', '1');
INSERT INTO `course_chapter` VALUES ('210', '85', '204', '3. 责任与服务意识（说课）', '6', '3', '2017-06-01 10:28:53', '2017-09-07 02:00:08', '1');
INSERT INTO `course_chapter` VALUES ('211', '85', '204', '4. 沟通与合作意识', '7', '3', '2017-06-01 10:29:02', '2017-09-07 02:00:51', '1');
INSERT INTO `course_chapter` VALUES ('212', '85', '204', '4. 沟通与合作意识（说课）', '8', '3', '2017-06-01 10:29:22', '2017-09-07 02:02:59', '1');
INSERT INTO `course_chapter` VALUES ('214', '85', '0', '第二单元 职业生涯规划', '3', '1', '2017-06-01 10:32:33', '2017-06-01 10:48:11', '1');
INSERT INTO `course_chapter` VALUES ('215', '85', '214', '第一课 面向未来的职业生涯规划', '1', '2', '2017-06-01 10:33:16', '2017-06-01 10:35:34', '1');
INSERT INTO `course_chapter` VALUES ('216', '85', '215', '1. 职业生涯规划的基本概念', '1', '3', '2017-06-01 10:34:10', '2017-09-07 02:03:58', '1');
INSERT INTO `course_chapter` VALUES ('217', '85', '215', '1. 职业生涯规划的基本概念（说课）', '2', '3', '2017-06-01 10:34:28', '2017-09-07 02:10:05', '1');
INSERT INTO `course_chapter` VALUES ('218', '85', '215', '2. 中职生职业生涯规划的特点和意义', '3', '3', '2017-06-01 10:34:36', '2017-09-07 02:10:32', '1');
INSERT INTO `course_chapter` VALUES ('219', '85', '215', '2. 中职生职业生涯规划的特点和意义（说课）', '4', '3', '2017-06-01 10:35:00', '2017-09-07 02:11:55', '1');
INSERT INTO `course_chapter` VALUES ('224', '85', '214', '第二课 向内看——认识自我', '2', '2', '2017-06-01 10:40:04', '2017-06-01 10:40:31', '1');
INSERT INTO `course_chapter` VALUES ('225', '85', '224', '1. 职业兴趣及其培养', '1', '3', '2017-06-01 10:40:32', '2017-09-07 02:12:50', '1');
INSERT INTO `course_chapter` VALUES ('226', '85', '224', '1. 职业兴趣及其培养（说课）', '2', '3', '2017-06-01 10:40:52', '2017-09-07 02:14:16', '1');
INSERT INTO `course_chapter` VALUES ('227', '85', '224', '2. 自我评估', '3', '3', '2017-06-01 10:40:58', '2017-09-07 02:16:03', '1');
INSERT INTO `course_chapter` VALUES ('228', '85', '224', '2. 自我评估（说课）', '4', '3', '2017-06-01 10:41:10', '2017-09-07 02:17:27', '1');
INSERT INTO `course_chapter` VALUES ('229', '85', '214', '第三课 向外看——就业形势', '3', '2', '2017-06-01 10:41:29', '2017-06-01 10:41:44', '1');
INSERT INTO `course_chapter` VALUES ('230', '85', '229', '1. 从学校人到职业人的转变', '1', '3', '2017-06-01 10:41:44', '2017-09-07 02:18:09', '1');
INSERT INTO `course_chapter` VALUES ('231', '85', '229', '1. 从学校人到职业人的转变（说课）', '2', '3', '2017-06-01 10:42:07', '2017-09-07 02:19:47', '1');
INSERT INTO `course_chapter` VALUES ('232', '85', '229', '2. 了解就业形势', '3', '3', '2017-06-01 10:42:14', '2017-09-07 02:20:16', '1');
INSERT INTO `course_chapter` VALUES ('233', '85', '229', '2. 了解就业形势（说课）', '4', '3', '2017-06-01 10:42:31', '2017-09-07 02:21:59', '1');
INSERT INTO `course_chapter` VALUES ('234', '85', '214', '第四课 职业规划意向书', '4', '2', '2017-06-01 10:42:44', '2017-06-01 10:46:45', '1');
INSERT INTO `course_chapter` VALUES ('235', '85', '234', '1. 职业生涯发展的目标与措施', '1', '3', '2017-06-01 10:43:03', '2017-09-07 10:38:15', '1');
INSERT INTO `course_chapter` VALUES ('236', '85', '234', '1. 职业生涯发展的目标与措施（说课）', '2', '3', '2017-06-01 10:46:46', '2017-09-07 10:37:18', '1');
INSERT INTO `course_chapter` VALUES ('237', '85', '234', '2. 制定职业生涯规划意向书', '3', '3', '2017-06-01 10:47:08', '2017-09-07 10:38:48', '1');
INSERT INTO `course_chapter` VALUES ('238', '85', '234', '2. 制定职业生涯规划意向书（说课）', '4', '3', '2017-06-01 10:47:30', '2017-09-07 10:40:00', '1');
INSERT INTO `course_chapter` VALUES ('239', '85', '0', '第三单元 求职就业技巧', '5', '1', '2017-06-01 10:47:47', '2017-06-01 10:56:00', '1');
INSERT INTO `course_chapter` VALUES ('240', '85', '239', '第一课 求职途径', '1', '2', '2017-06-01 10:48:34', '2017-09-07 02:24:02', '1');
INSERT INTO `course_chapter` VALUES ('241', '85', '239', '第一课 求职途径（说课）', '2', '2', '2017-06-01 10:49:54', '2017-09-07 02:26:14', '1');
INSERT INTO `course_chapter` VALUES ('242', '85', '239', '第二课 求职材料准备', '3', '2', '2017-06-01 10:50:04', '2017-06-01 10:50:15', '1');
INSERT INTO `course_chapter` VALUES ('243', '85', '242', '1. 填写大中专毕业生就业推荐表', '1', '3', '2017-06-01 10:50:17', '2017-09-07 02:28:55', '1');
INSERT INTO `course_chapter` VALUES ('244', '85', '242', '1. 填写大中专毕业生就业推荐表（说课）', '2', '3', '2017-06-01 10:50:53', '2017-09-07 05:04:53', '1');
INSERT INTO `course_chapter` VALUES ('245', '85', '242', '2. 制作简历', '3', '3', '2017-06-01 10:50:59', '2017-09-07 05:05:18', '1');
INSERT INTO `course_chapter` VALUES ('246', '85', '242', '2. 制作简历（说课）', '4', '3', '2017-06-01 10:51:17', '2017-09-07 05:06:31', '1');
INSERT INTO `course_chapter` VALUES ('247', '85', '242', '3. 撰写求职自荐信', '5', '3', '2017-06-01 10:51:24', '2017-09-07 05:07:42', '1');
INSERT INTO `course_chapter` VALUES ('248', '85', '242', '3. 撰写求职自荐信（说课）', '6', '3', '2017-06-01 10:52:04', '2017-09-07 05:08:29', '1');
INSERT INTO `course_chapter` VALUES ('249', '85', '239', '第三课 求职礼仪与个人形象', '4', '2', '2017-06-01 10:52:17', '2017-06-01 10:53:28', '1');
INSERT INTO `course_chapter` VALUES ('250', '85', '249', '1. 求职基本礼仪', '1', '3', '2017-06-01 10:52:36', '2017-09-07 05:09:43', '1');
INSERT INTO `course_chapter` VALUES ('251', '85', '249', '1. 求职基本礼仪（说课）', '2', '3', '2017-06-01 10:52:51', '2017-09-07 05:10:29', '1');
INSERT INTO `course_chapter` VALUES ('252', '85', '249', '2. 塑造良好个人形象', '3', '3', '2017-06-01 10:52:58', '2017-09-07 05:10:54', '1');
INSERT INTO `course_chapter` VALUES ('253', '85', '249', '2. 塑造良好个人形象（说课）', '4', '3', '2017-06-01 10:53:28', '2017-09-07 05:11:44', '1');
INSERT INTO `course_chapter` VALUES ('254', '85', '239', '第四课 面试技巧', '5', '2', '2017-06-01 10:53:42', '2017-06-01 10:53:54', '1');
INSERT INTO `course_chapter` VALUES ('255', '85', '254', '1. 模拟面试', '1', '3', '2017-06-01 10:53:54', '2017-09-07 05:12:16', '1');
INSERT INTO `course_chapter` VALUES ('256', '85', '254', '1. 模拟面试（说课）', '2', '3', '2017-06-01 10:54:07', '2017-09-07 05:13:13', '1');
INSERT INTO `course_chapter` VALUES ('257', '85', '254', '2. 面试技巧', '3', '3', '2017-06-01 10:54:15', '2017-09-07 05:13:56', '1');
INSERT INTO `course_chapter` VALUES ('258', '85', '254', '2. 面试技巧（说课）', '4', '3', '2017-06-01 10:54:25', '2017-09-07 05:14:44', '1');
INSERT INTO `course_chapter` VALUES ('259', '85', '239', '第五课 劳动合同签订', '6', '2', '2017-06-01 10:54:36', '2017-06-01 10:54:52', '1');
INSERT INTO `course_chapter` VALUES ('260', '85', '259', '1. 劳动合同的订立及其形式', '1', '3', '2017-06-01 10:54:53', '2017-09-07 05:15:15', '1');
INSERT INTO `course_chapter` VALUES ('261', '85', '259', '1. 劳动合同的订立及其形式（说课）', '2', '3', '2017-06-01 10:55:19', '2017-09-07 05:15:58', '1');
INSERT INTO `course_chapter` VALUES ('262', '85', '259', '2. 签订劳动合同的注意事项', '3', '3', '2017-06-01 10:55:24', '2017-09-07 05:16:23', '1');
INSERT INTO `course_chapter` VALUES ('263', '85', '259', '2. 签订劳动合同的注意事项（说课）', '4', '3', '2017-06-01 10:55:40', '2017-09-07 05:17:05', '1');
INSERT INTO `course_chapter` VALUES ('264', '85', '0', '第四单元 自主创业', '7', '1', '2017-06-01 10:55:49', '2017-06-01 10:57:43', '1');
INSERT INTO `course_chapter` VALUES ('265', '85', '264', '第一课 创业的意义', '1', '2', '2017-06-01 10:56:28', '2017-09-07 10:41:17', '1');
INSERT INTO `course_chapter` VALUES ('266', '85', '264', '第一课 创业的意义（说课）', '2', '2', '2017-06-01 10:56:51', '2017-09-07 05:18:11', '1');
INSERT INTO `course_chapter` VALUES ('267', '85', '264', '第二课 对创业者素质和能力的要求', '3', '2', '2017-06-01 10:56:56', '2017-09-07 05:18:37', '1');
INSERT INTO `course_chapter` VALUES ('268', '85', '264', '第二课 对创业者素质和能力的要求（说课）', '4', '2', '2017-06-01 10:57:21', '2017-09-07 05:19:18', '1');
INSERT INTO `course_chapter` VALUES ('269', '85', '264', '第三课 创业构想', '5', '2', '2017-06-01 10:57:27', '2017-09-07 05:19:48', '1');
INSERT INTO `course_chapter` VALUES ('270', '85', '264', '第三课 创业构想（说课）', '6', '2', '2017-06-01 10:57:44', '2017-09-07 05:20:32', '1');
INSERT INTO `course_chapter` VALUES ('271', '85', '264', '第四课 创业行动指南', '7', '2', '2017-06-01 10:57:50', '2017-09-07 05:20:54', '1');
INSERT INTO `course_chapter` VALUES ('272', '85', '264', '第四课 创业行动指南（说课）', '8', '2', '2017-06-01 10:58:04', '2017-09-07 10:42:06', '1');
INSERT INTO `course_chapter` VALUES ('273', '86', '0', '导言', null, '1', null, '2017-06-01 11:27:05', '1');
INSERT INTO `course_chapter` VALUES ('274', '86', '273', '职业道德与法律', '2', '2', '2017-06-01 11:09:12', '2017-09-07 06:23:42', '1');
INSERT INTO `course_chapter` VALUES ('275', '86', '273', '职业道德与法律（说课）', '3', '2', '2017-06-01 11:09:22', '2017-09-07 10:42:51', '1');
INSERT INTO `course_chapter` VALUES ('276', '86', '0', '第一单元 习礼仪，讲文明', '1', '1', '2017-06-01 11:09:27', '2017-06-01 11:10:38', '1');
INSERT INTO `course_chapter` VALUES ('277', '86', '276', '第一课 塑造自己的良好形象—学生日常礼仪', '1', '2', '2017-06-01 11:10:39', '2017-09-07 06:25:06', '1');
INSERT INTO `course_chapter` VALUES ('278', '86', '276', '第一课 塑造自己的良好形象—学生日常礼仪（说课）', '2', '2', '2017-06-01 11:11:41', '2017-09-07 10:43:29', '1');
INSERT INTO `course_chapter` VALUES ('279', '86', '276', '第二课 展示自己的职业风采—常见的职业礼仪', '3', '2', '2017-06-01 11:11:47', '2017-09-07 06:26:36', '1');
INSERT INTO `course_chapter` VALUES ('280', '86', '276', '第二课 展示自己的职业风采—常见的职业礼仪（说课）', '4', '2', '2017-06-01 11:12:12', '2017-09-07 10:44:03', '1');
INSERT INTO `course_chapter` VALUES ('281', '86', '0', '第二单元 知荣辱，有道德', '2', '1', '2017-06-01 11:12:23', '2017-06-01 11:18:27', '1');
INSERT INTO `course_chapter` VALUES ('282', '86', '281', '第一课 我国公民的基本道德规范', '2', '2', '2017-06-01 11:12:33', '2017-09-07 06:27:39', '1');
INSERT INTO `course_chapter` VALUES ('283', '86', '281', '第一课 我国公民的基本道德规范（说课）', '3', '2', '2017-06-01 11:13:18', '2017-09-07 10:49:30', '1');
INSERT INTO `course_chapter` VALUES ('284', '86', '281', '第二课 幸福生活的家庭美德', '4', '2', '2017-06-01 11:13:26', '2017-09-07 06:29:21', '1');
INSERT INTO `course_chapter` VALUES ('285', '86', '281', '第二课 幸福生活的家庭美德（说课）', '5', '2', '2017-06-01 11:13:48', '2017-09-07 10:50:18', '1');
INSERT INTO `course_chapter` VALUES ('286', '86', '281', '第三课 和谐社会里的社会公德', '6', '2', '2017-06-01 11:14:02', '2017-09-07 06:30:31', '1');
INSERT INTO `course_chapter` VALUES ('288', '86', '286', '第三课 和谐社会里的社会公德', '1', '3', '2017-06-01 11:14:57', '2017-06-01 11:15:00', '0');
INSERT INTO `course_chapter` VALUES ('289', '86', '281', '第三课 和谐社会里的社会公德（说课）', '7', '2', '2017-06-01 11:15:01', '2017-09-07 10:50:40', '1');
INSERT INTO `course_chapter` VALUES ('290', '86', '281', '第四课 职业道德是职业成功的必要', '8', '2', '2017-06-01 11:15:09', '2017-06-01 11:15:37', '1');
INSERT INTO `course_chapter` VALUES ('291', '86', '290', '1. 爱岗敬业，立足岗位成才', '1', '3', '2017-06-01 11:15:38', '2017-09-07 06:31:43', '1');
INSERT INTO `course_chapter` VALUES ('292', '86', '290', '1. 爱岗敬业，立足岗位成才（说课）', '2', '3', '2017-06-01 11:16:00', '2017-09-07 10:51:08', '1');
INSERT INTO `course_chapter` VALUES ('293', '86', '290', '2. 诚实守信', '3', '3', '2017-06-01 11:16:06', '2017-09-07 06:41:02', '1');
INSERT INTO `course_chapter` VALUES ('294', '86', '290', '2. 诚实守信（说课）', '4', '3', '2017-06-01 11:16:23', '2017-09-07 10:51:33', '1');
INSERT INTO `course_chapter` VALUES ('295', '86', '290', '3. 办事公道', '5', '3', '2017-06-01 11:16:29', '2017-09-07 06:42:27', '1');
INSERT INTO `course_chapter` VALUES ('296', '86', '290', '3. 办事公道（说课）', '6', '3', '2017-06-01 11:16:42', '2017-09-07 10:51:57', '1');
INSERT INTO `course_chapter` VALUES ('297', '86', '290', '4. 服务群众，奉献社会', '7', '3', '2017-06-01 11:16:48', '2017-09-07 06:43:43', '1');
INSERT INTO `course_chapter` VALUES ('298', '86', '290', '4. 服务群众，奉献社会（说课）', '8', '3', '2017-06-01 11:17:04', '2017-09-07 10:52:20', '1');
INSERT INTO `course_chapter` VALUES ('299', '86', '290', '5. 养成良好的职业行为习惯', '9', '3', '2017-06-01 11:17:09', '2017-09-07 07:00:34', '1');
INSERT INTO `course_chapter` VALUES ('300', '86', '290', '5. 养成良好的职业行为习惯（说课）', '10', '3', '2017-06-01 11:17:38', '2017-09-07 10:52:42', '1');
INSERT INTO `course_chapter` VALUES ('301', '86', '0', '第三单元 弘扬法治精神，当好国家公民', '3', '1', '2017-06-01 11:17:48', '2017-06-01 11:20:02', '1');
INSERT INTO `course_chapter` VALUES ('302', '86', '301', '第一课 弘扬法治精神，建设法治国家', '1', '2', '2017-06-01 11:20:03', '2017-09-07 07:03:04', '1');
INSERT INTO `course_chapter` VALUES ('303', '86', '301', '第一课 弘扬法治精神，建设法治国家（说课）', '2', '2', '2017-06-01 11:20:54', '2017-09-07 10:53:07', '1');
INSERT INTO `course_chapter` VALUES ('304', '86', '301', '第二课 维护宪法权威，当好国家公民', '3', '2', '2017-06-01 11:21:01', '2017-09-07 07:04:55', '1');
INSERT INTO `course_chapter` VALUES ('305', '86', '301', '第二课 维护宪法权威，当好国家公民（说课）', '4', '2', '2017-06-01 11:21:32', '2017-09-07 10:53:41', '1');
INSERT INTO `course_chapter` VALUES ('306', '86', '301', '第三课 崇尚程序正义，依法维护权益', '5', '2', '2017-06-01 11:22:10', '2017-06-01 11:22:33', '1');
INSERT INTO `course_chapter` VALUES ('307', '86', '306', '1. 崇尚程序正义—行政处罚', '1', '3', '2017-06-01 11:22:34', '2017-09-07 07:06:06', '1');
INSERT INTO `course_chapter` VALUES ('308', '86', '306', '1. 崇尚程序正义—行政处罚（说课）', '2', '3', '2017-06-01 11:22:53', '2017-09-07 10:54:05', '1');
INSERT INTO `course_chapter` VALUES ('309', '86', '306', '2. 增强维权意识—合法权益是否被侵犯', '3', '3', '2017-06-01 11:23:01', '2017-09-07 07:07:56', '1');
INSERT INTO `course_chapter` VALUES ('310', '86', '306', '2. 增强维权意识—合法权益是否被侵犯（说课）', '4', '3', '2017-06-01 11:23:58', '2017-09-07 10:54:35', '1');
INSERT INTO `course_chapter` VALUES ('311', '86', '306', '3. 依法维护自己的合法权益—维权途径', '5', '3', '2017-06-01 11:24:04', '2017-09-07 07:09:01', '1');
INSERT INTO `course_chapter` VALUES ('312', '86', '306', '3. 依法维护自己的合法权益—维权途径（说课）', '6', '3', '2017-06-01 11:25:11', '2017-09-07 10:55:43', '1');
INSERT INTO `course_chapter` VALUES ('313', '86', '0', '第四单元 自觉依法律己，避免违法犯罪', '4', '1', '2017-06-01 11:26:54', '2017-06-01 11:32:54', '1');
INSERT INTO `course_chapter` VALUES ('314', '86', '313', '第一课 预防一般违法行为', '1', '2', '2017-06-01 11:28:55', '2017-06-01 11:29:14', '1');
INSERT INTO `course_chapter` VALUES ('315', '86', '314', '1. 一般违法行为', '1', '3', '2017-06-01 11:29:14', '2017-09-07 07:10:19', '1');
INSERT INTO `course_chapter` VALUES ('316', '86', '314', '1. 一般违法行为（说课）', '2', '3', '2017-06-01 11:29:22', '2017-09-07 07:10:59', '1');
INSERT INTO `course_chapter` VALUES ('317', '86', '314', '2. 杜绝不良行为', '3', '3', '2017-06-01 11:29:28', '2017-09-07 07:11:30', '1');
INSERT INTO `course_chapter` VALUES ('318', '86', '314', '2. 杜绝不良行为（说课）', '4', '3', '2017-06-01 11:29:39', '2017-09-07 10:56:15', '1');
INSERT INTO `course_chapter` VALUES ('319', '86', '314', '3. 依法处理违法行为', '5', '3', '2017-06-01 11:29:45', '2017-09-07 07:13:14', '1');
INSERT INTO `course_chapter` VALUES ('320', '86', '319', 'New node', '1', '4', '2017-06-01 11:29:58', '2017-06-01 11:30:00', '0');
INSERT INTO `course_chapter` VALUES ('321', '86', '314', '3. 依法处理违法行为（说课）', '6', '3', '2017-06-01 11:30:09', '2017-09-07 10:56:34', '1');
INSERT INTO `course_chapter` VALUES ('322', '86', '313', '第二课 避免误入犯罪歧途', '2', '2', '2017-06-01 11:30:50', '2017-06-01 11:31:06', '1');
INSERT INTO `course_chapter` VALUES ('323', '86', '322', '1. 犯罪', '1', '3', '2017-06-01 11:31:07', '2017-09-07 07:14:38', '1');
INSERT INTO `course_chapter` VALUES ('324', '86', '322', '1. 犯罪（说课）', '2', '3', '2017-06-01 11:31:15', '2017-09-07 10:57:02', '1');
INSERT INTO `course_chapter` VALUES ('325', '86', '322', '2. 运用刑法武器依法制裁犯罪行为', '3', '3', '2017-06-01 11:31:34', '2017-09-07 07:16:21', '1');
INSERT INTO `course_chapter` VALUES ('326', '86', '322', '2. 运用刑法武器依法制裁犯罪行为（说课）', '4', '3', '2017-06-01 11:31:59', '2017-09-07 10:57:25', '1');
INSERT INTO `course_chapter` VALUES ('327', '86', '322', '3. 同犯罪行为作斗争', '5', '3', '2017-06-01 11:32:05', '2017-09-07 07:17:36', '1');
INSERT INTO `course_chapter` VALUES ('328', '86', '322', '3. 同犯罪行为作斗争（说课）', '6', '3', '2017-06-01 11:32:23', '2017-09-07 10:57:48', '1');
INSERT INTO `course_chapter` VALUES ('329', '86', '0', '第五单元 依法从事民事经济活动，维护公平正义', '5', '1', '2017-06-01 11:32:35', '2017-06-01 11:34:29', '1');
INSERT INTO `course_chapter` VALUES ('330', '86', '329', '第一课 依法公正处理民事关系', '1', '2', '2017-06-01 11:34:31', '2017-06-01 11:34:49', '1');
INSERT INTO `course_chapter` VALUES ('331', '86', '330', '1. 依法参与民事活动', '1', '3', '2017-06-01 11:34:50', '2017-09-07 07:18:53', '1');
INSERT INTO `course_chapter` VALUES ('332', '86', '330', '1. 依法参与民事活动（说课）', '2', '3', '2017-06-01 11:35:04', '2017-09-07 10:58:16', '1');
INSERT INTO `course_chapter` VALUES ('333', '86', '330', '2. 依法维护人身权利', '3', '3', '2017-06-01 11:35:13', '2017-09-07 07:20:20', '1');
INSERT INTO `course_chapter` VALUES ('334', '86', '330', '2. 依法维护人身权利（说课）', '4', '3', '2017-06-01 11:35:28', '2017-09-07 07:21:07', '1');
INSERT INTO `course_chapter` VALUES ('335', '86', '330', '3. 依法保护财产权', '5', '3', '2017-06-01 11:35:34', '2017-09-07 07:21:36', '1');
INSERT INTO `course_chapter` VALUES ('336', '86', '330', '3. 依法保护财产权（说课）', '6', '3', '2017-06-01 11:35:45', '2017-09-07 10:58:52', '1');
INSERT INTO `course_chapter` VALUES ('337', '86', '330', '4. 正确利用合同参与民事活动', '7', '3', '2017-06-01 11:35:51', '2017-09-07 07:23:07', '1');
INSERT INTO `course_chapter` VALUES ('338', '86', '330', '4. 正确利用合同参与民事活动（说课）', '8', '3', '2017-06-01 11:36:18', '2017-09-07 11:09:31', '1');
INSERT INTO `course_chapter` VALUES ('339', '86', '330', '5. 依法维护在家庭中的权利和义务', '9', '3', '2017-06-01 11:36:25', '2017-09-07 07:24:29', '1');
INSERT INTO `course_chapter` VALUES ('340', '86', '330', '5. 依法维护在家庭中的权利和义务（说课）', '10', '3', '2017-06-01 11:36:45', '2017-09-07 07:25:16', '1');
INSERT INTO `course_chapter` VALUES ('341', '86', '330', '6. 依法维护在学校中的权利和义务', '11', '3', '2017-06-01 11:36:51', '2017-09-07 07:25:44', '1');
INSERT INTO `course_chapter` VALUES ('342', '86', '330', '6. 依法维护在学校中的权利和义务（说课）', '12', '3', '2017-06-01 11:37:45', '2017-09-07 11:10:34', '1');
INSERT INTO `course_chapter` VALUES ('343', '86', '329', '第二课 依法生产经营，保护环境', '2', '2', '2017-06-01 11:37:57', '2017-06-01 11:38:19', '1');
INSERT INTO `course_chapter` VALUES ('344', '86', '343', '1. 依法维护劳动者的合法权益', '1', '3', '2017-06-01 11:38:21', '2017-09-07 07:26:56', '1');
INSERT INTO `course_chapter` VALUES ('345', '86', '343', '1. 依法维护劳动者的合法权益（说课）', '2', '3', '2017-06-01 11:38:36', '2017-09-07 11:11:36', '1');
INSERT INTO `course_chapter` VALUES ('346', '86', '343', '2. 依法保护人类共有的家园', '3', '3', '2017-06-01 11:38:43', '2017-09-07 07:28:49', '1');
INSERT INTO `course_chapter` VALUES ('347', '86', '343', '2. 依法保护人类共有的家园（说课）', '4', '3', '2017-06-01 11:38:56', '2017-09-07 11:12:29', '1');
INSERT INTO `course_chapter` VALUES ('348', '87', '0', '第一单元 坚持从客观实际出发 脚踏实地走好人生路', null, '1', null, '2017-06-01 13:52:16', '1');
INSERT INTO `course_chapter` VALUES ('349', '87', '348', '第一课 客观实际与人生选择', '2', '2', '2017-06-01 11:45:20', '2017-06-01 13:52:36', '1');
INSERT INTO `course_chapter` VALUES ('350', '87', '349', '1. 客观实际是人生选择的前提和基础', '1', '3', '2017-06-01 11:45:34', '2017-09-07 11:14:51', '1');
INSERT INTO `course_chapter` VALUES ('351', '87', '349', '1. 客观实际是人生选择的前提和基础（说课）', '2', '3', '2017-06-01 11:45:43', '2017-09-07 11:15:40', '1');
INSERT INTO `course_chapter` VALUES ('352', '87', '349', '2. 物质世界的多样性与人生选择', '3', '3', '2017-06-01 11:45:49', '2017-09-07 11:16:07', '1');
INSERT INTO `course_chapter` VALUES ('353', '87', '349', '2. 物质世界的多样性与人生选择（说课）', '4', '3', '2017-06-01 11:46:12', '2017-09-07 11:16:44', '1');
INSERT INTO `course_chapter` VALUES ('354', '87', '348', '第二课 物质运动与人生行动', '3', '2', '2017-06-01 11:46:21', '2017-06-01 13:54:22', '1');
INSERT INTO `course_chapter` VALUES ('355', '87', '354', '1. 运动是物质的存在方式', '1', '3', '2017-06-01 11:46:40', '2017-09-07 11:17:29', '1');
INSERT INTO `course_chapter` VALUES ('356', '87', '354', '1. 运动是物质的存在方式（说课）', '2', '3', '2017-06-01 11:46:55', '2017-09-07 11:18:19', '1');
INSERT INTO `course_chapter` VALUES ('357', '87', '354', '2. 把握客观规律善于行动', '3', '3', '2017-06-01 11:47:01', '2017-09-07 11:18:42', '1');
INSERT INTO `course_chapter` VALUES ('358', '87', '354', '2. 把握客观规律善于行动（说课）', '4', '3', '2017-06-01 11:47:13', '2017-09-07 11:19:19', '1');
INSERT INTO `course_chapter` VALUES ('359', '87', '348', '第三课 自觉能动与自强不息', '4', '2', '2017-06-01 11:47:21', '2017-06-01 13:55:41', '1');
INSERT INTO `course_chapter` VALUES ('360', '87', '359', '1. 正确发挥自觉能动性', '1', '3', '2017-06-01 11:47:46', '2017-09-11 10:34:10', '1');
INSERT INTO `course_chapter` VALUES ('361', '87', '359', '1. 正确发挥自觉能动性（说课）', '2', '3', '2017-06-01 11:47:59', '2017-09-07 11:20:53', '1');
INSERT INTO `course_chapter` VALUES ('362', '87', '359', '2. 自强不息与成功人生', '3', '3', '2017-06-01 11:48:05', '2017-09-07 11:21:16', '1');
INSERT INTO `course_chapter` VALUES ('363', '87', '359', '2. 自强不息与成功人生（说课）', '4', '3', '2017-06-01 11:48:25', '2017-09-07 11:21:50', '1');
INSERT INTO `course_chapter` VALUES ('364', '87', '0', '第二单元 用辩证的观点看问题  树立积极的人生态度', '1', '1', '2017-06-01 11:48:34', '2017-06-01 13:37:21', '1');
INSERT INTO `course_chapter` VALUES ('365', '87', '366', '1. 用普遍联系的观点看待人际关系', '1', '3', '2017-06-01 11:51:02', '2017-09-07 11:22:47', '1');
INSERT INTO `course_chapter` VALUES ('366', '87', '364', '第一课 普遍联系与人际和谐', '2', '2', '2017-06-01 11:51:41', '2017-09-07 11:22:12', '1');
INSERT INTO `course_chapter` VALUES ('367', '87', '366', '1. 用普遍联系的观点看待人际关系（说课）', '2', '3', '2017-06-01 11:52:28', '2017-09-07 11:23:23', '1');
INSERT INTO `course_chapter` VALUES ('368', '87', '366', '2. 在复杂多样的联系中营造和谐的人际关系', '3', '3', '2017-06-01 11:52:33', '2017-09-07 11:23:54', '1');
INSERT INTO `course_chapter` VALUES ('369', '87', '366', '2. 在复杂多样的联系中营造和谐的人际关系（说课）', '4', '3', '2017-06-01 11:53:45', '2017-09-07 11:24:34', '1');
INSERT INTO `course_chapter` VALUES ('370', '87', '364', '第二课 发展变化与顺境逆境', '2', '2', '2017-06-01 11:54:00', '2017-06-01 11:54:25', '1');
INSERT INTO `course_chapter` VALUES ('371', '87', '370', '1. 事物发展的永恒性及其本质', '1', '3', '2017-06-01 11:54:26', '2017-09-07 11:25:02', '1');
INSERT INTO `course_chapter` VALUES ('372', '87', '370', '1. 事物发展的永恒性及其本质（说课）', '2', '3', '2017-06-01 11:54:46', '2017-09-07 11:25:39', '1');
INSERT INTO `course_chapter` VALUES ('373', '87', '370', '2. 用发展的观点看待顺境与逆境', '3', '3', '2017-06-01 11:54:51', '2017-09-07 11:26:02', '1');
INSERT INTO `course_chapter` VALUES ('374', '87', '370', '2. 用发展的观点看待顺境与逆境（说课）', '4', '3', '2017-06-01 11:55:18', '2017-09-07 11:26:49', '1');
INSERT INTO `course_chapter` VALUES ('375', '87', '364', '第三课 矛盾观点与人生动力', '3', '2', '2017-06-01 11:55:39', '2017-06-01 11:56:22', '1');
INSERT INTO `course_chapter` VALUES ('376', '87', '375', '1. 矛盾是事物发展的动力', '1', '3', '2017-06-01 11:56:23', '2017-09-07 11:27:16', '1');
INSERT INTO `course_chapter` VALUES ('377', '87', '375', '1. 矛盾是事物发展的动力（说课）', '2', '3', '2017-06-01 11:56:37', '2017-09-07 11:27:58', '1');
INSERT INTO `course_chapter` VALUES ('378', '87', '375', '2. 矛盾是人生发展的动力', '3', '3', '2017-06-01 11:56:43', '2017-09-07 11:28:18', '1');
INSERT INTO `course_chapter` VALUES ('379', '87', '375', '2. 矛盾是人生发展的动力（说课）', '4', '3', '2017-06-01 11:56:56', '2017-09-07 11:29:20', '1');
INSERT INTO `course_chapter` VALUES ('380', '87', '0', '第三单元 坚持实践与认识的统一  提高人生发展的能力', '4', '1', '2017-06-01 11:57:07', '2017-06-01 11:57:48', '1');
INSERT INTO `course_chapter` VALUES ('381', '87', '380', '第一课 知行统一与体验成功', '1', '2', '2017-06-01 11:57:59', '2017-06-01 11:58:27', '1');
INSERT INTO `course_chapter` VALUES ('382', '87', '381', '1. 在实践中寻求真知', '1', '3', '2017-06-01 11:58:28', '2017-09-07 11:29:50', '1');
INSERT INTO `course_chapter` VALUES ('383', '87', '381', '1. 在实践中寻求真知（说课）', '2', '3', '2017-06-01 11:58:49', '2017-09-07 11:30:21', '1');
INSERT INTO `course_chapter` VALUES ('384', '87', '381', '2. 在实践中快乐成长', '3', '3', '2017-06-01 11:58:56', '2017-09-07 11:30:40', '1');
INSERT INTO `course_chapter` VALUES ('385', '87', '381', '2. 在实践中快乐成长（说课）', '4', '3', '2017-06-01 11:59:14', '2017-09-07 11:31:16', '1');
INSERT INTO `course_chapter` VALUES ('386', '87', '380', '第二课 现象本质与明辨是非', '2', '2', '2017-06-01 11:59:22', '2017-06-01 11:59:40', '1');
INSERT INTO `course_chapter` VALUES ('387', '87', '386', '1. 把握事物的本质', '1', '3', '2017-06-01 11:59:41', '2017-09-07 11:31:41', '1');
INSERT INTO `course_chapter` VALUES ('388', '87', '386', '1. 把握事物的本质（说课）', '2', '3', '2017-06-01 11:59:59', '2017-09-07 11:32:09', '1');
INSERT INTO `course_chapter` VALUES ('389', '87', '386', '2. 提高辨识能力', '3', '3', '2017-06-01 12:00:06', '2017-09-07 11:32:28', '1');
INSERT INTO `course_chapter` VALUES ('390', '87', '386', '2. 提高辨识能力（说课）', '4', '3', '2017-06-01 12:00:38', '2017-09-07 11:32:59', '1');
INSERT INTO `course_chapter` VALUES ('391', '87', '380', '第三课 科学思维与创新能力', '3', '2', '2017-06-01 12:00:48', '2017-06-01 12:01:03', '1');
INSERT INTO `course_chapter` VALUES ('392', '87', '391', '1. 培养科学的思维方法', '1', '3', '2017-06-01 12:01:04', '2017-09-07 11:33:23', '1');
INSERT INTO `course_chapter` VALUES ('393', '87', '391', '1. 培养科学的思维方法（说课）', '2', '3', '2017-06-01 12:01:16', '2017-09-07 11:33:56', '1');
INSERT INTO `course_chapter` VALUES ('394', '87', '391', '2. 提高创新能力', '3', '3', '2017-06-01 12:01:24', '2017-09-07 11:34:22', '1');
INSERT INTO `course_chapter` VALUES ('395', '87', '391', '2. 提高创新能力（说课）', '4', '3', '2017-06-01 12:01:39', '2017-09-07 11:34:47', '1');
INSERT INTO `course_chapter` VALUES ('396', '87', '0', '第四单元 顺应历史潮流 树立崇高的人生理想', '4', '1', '2017-06-01 13:36:47', '2017-06-01 14:02:30', '1');
INSERT INTO `course_chapter` VALUES ('397', '87', '396', '第一课 历史规律与人生目标', '1', '2', '2017-06-01 13:37:54', '2017-06-01 13:38:14', '1');
INSERT INTO `course_chapter` VALUES ('398', '87', '397', '1. 历史规律的特点', '1', '3', '2017-06-01 13:38:16', '2017-09-07 11:35:18', '1');
INSERT INTO `course_chapter` VALUES ('399', '87', '397', '1. 历史规律的特点（说课）', '2', '3', '2017-06-01 13:38:30', '2017-09-07 11:35:44', '1');
INSERT INTO `course_chapter` VALUES ('400', '87', '397', '2. 实现人生目标必须符合历史规律', '3', '3', '2017-06-01 13:38:37', '2017-09-07 11:36:04', '1');
INSERT INTO `course_chapter` VALUES ('401', '87', '397', '2. 实现人生目标必须符合历史规律（说课）', '4', '3', '2017-06-01 13:38:56', '2017-09-07 11:36:32', '1');
INSERT INTO `course_chapter` VALUES ('402', '87', '396', '第二课 社会理想与个人理想', '2', '2', '2017-06-01 13:39:10', '2017-06-01 13:39:40', '1');
INSERT INTO `course_chapter` VALUES ('403', '87', '402', '1. 个人理想与社会理想', '1', '3', '2017-06-01 13:39:40', '2017-09-07 11:37:01', '1');
INSERT INTO `course_chapter` VALUES ('404', '87', '402', '1. 个人理想与社会理想（说课）', '2', '3', '2017-06-01 13:39:55', '2017-09-07 11:37:37', '1');
INSERT INTO `course_chapter` VALUES ('405', '87', '402', '2. 理想与现实', '3', '3', '2017-06-01 13:40:01', '2017-09-07 11:37:58', '1');
INSERT INTO `course_chapter` VALUES ('406', '87', '402', '2. 理想与现实（说课）', '4', '3', '2017-06-01 13:40:18', '2017-09-07 11:39:00', '1');
INSERT INTO `course_chapter` VALUES ('407', '87', '396', '第三课 理想信念与意志责任', '3', '2', '2017-06-01 13:40:26', '2017-06-01 13:42:02', '1');
INSERT INTO `course_chapter` VALUES ('408', '87', '407', '1. 实现理想需要坚强的意志', '1', '3', '2017-06-01 13:41:06', '2017-09-07 11:39:27', '1');
INSERT INTO `course_chapter` VALUES ('409', '87', '407', '1. 实现理想需要坚强的意志（说课）', '2', '3', '2017-06-01 13:41:25', '2017-09-07 11:39:56', '1');
INSERT INTO `course_chapter` VALUES ('410', '87', '407', '2. 实现理想要敢于担当', '3', '3', '2017-06-01 13:41:30', '2017-09-07 11:40:18', '1');
INSERT INTO `course_chapter` VALUES ('411', '87', '407', '2. 实现理想要敢于担当（说课）', '4', '3', '2017-06-01 13:41:46', '2017-09-07 11:40:58', '1');
INSERT INTO `course_chapter` VALUES ('412', '87', '0', '第五单元 在社会中发展自我 创造人生价值', '4', '1', '2017-06-01 13:41:58', '2017-06-01 13:42:28', '1');
INSERT INTO `course_chapter` VALUES ('413', '87', '412', '第一课 人的本质与利己利他', '1', '2', '2017-06-01 13:42:29', '2017-06-01 13:42:48', '1');
INSERT INTO `course_chapter` VALUES ('414', '87', '413', '1. 人是社会存在物', '1', '3', '2017-06-01 13:42:49', '2017-09-07 11:41:21', '1');
INSERT INTO `course_chapter` VALUES ('415', '87', '413', '1. 人是社会存在物（说课）', '2', '3', '2017-06-01 13:43:08', '2017-09-07 11:41:59', '1');
INSERT INTO `course_chapter` VALUES ('416', '87', '413', '2. 个人与集体的关系', '3', '3', '2017-06-01 13:43:14', '2017-09-07 11:42:19', '1');
INSERT INTO `course_chapter` VALUES ('417', '87', '413', '2. 个人与集体的关系（说课）', '4', '3', '2017-06-01 13:43:25', '2017-09-07 11:42:48', '1');
INSERT INTO `course_chapter` VALUES ('418', '87', '412', '第二课 人生价值与劳动奉献', '2', '2', '2017-06-01 13:43:36', '2017-06-01 13:43:51', '1');
INSERT INTO `course_chapter` VALUES ('419', '87', '418', '1. 自我价值', '1', '3', '2017-06-01 13:43:52', '2017-09-07 11:43:15', '1');
INSERT INTO `course_chapter` VALUES ('420', '87', '419', '1. 自我价值', '1', '4', '2017-06-01 13:43:59', '2017-06-01 13:44:01', '0');
INSERT INTO `course_chapter` VALUES ('421', '87', '418', '1. 自我价值（说课）', '2', '3', '2017-06-01 13:44:03', '2017-09-07 11:43:41', '1');
INSERT INTO `course_chapter` VALUES ('422', '87', '418', '2. 劳动奉献与人的价值', '3', '3', '2017-06-01 13:44:08', '2017-09-07 11:44:09', '1');
INSERT INTO `course_chapter` VALUES ('423', '87', '418', '2. 劳动奉献与人的价值（说课）', '4', '3', '2017-06-01 13:44:22', '2017-09-07 11:44:38', '1');
INSERT INTO `course_chapter` VALUES ('424', '87', '412', '第三课 认得全面发展与个性自由', '3', '2', '2017-06-01 13:44:28', '2017-06-01 13:44:44', '1');
INSERT INTO `course_chapter` VALUES ('425', '87', '424', '1. 努力实现人的全面发展', '1', '3', '2017-06-01 13:44:47', '2017-09-07 11:45:04', '1');
INSERT INTO `course_chapter` VALUES ('426', '87', '424', '1. 努力实现人的全面发展（说课）', '2', '3', '2017-06-01 13:45:01', '2017-09-07 11:45:38', '1');
INSERT INTO `course_chapter` VALUES ('427', '87', '424', '2. 在社会发展中实现人的个性自由', '3', '3', '2017-06-01 13:45:07', '2017-09-07 11:45:59', '1');
INSERT INTO `course_chapter` VALUES ('428', '87', '424', '2. 在社会发展中实现人的个性自由（说课）', '4', '3', '2017-06-01 13:45:22', '2017-09-07 11:46:28', '1');
INSERT INTO `course_chapter` VALUES ('429', '88', '0', '第一单元 心理健康', null, '1', null, '2017-06-01 15:27:39', '1');
INSERT INTO `course_chapter` VALUES ('431', '89', '0', '第一单元 透视经济现象', null, '1', null, '2017-06-01 14:03:48', '1');
INSERT INTO `course_chapter` VALUES ('432', '89', '431', '第一课 商品的交换和消费', '1', '2', '2017-06-01 14:03:49', '2017-06-01 14:04:01', '1');
INSERT INTO `course_chapter` VALUES ('433', '89', '432', '1. 商品和货币', '1', '3', '2017-06-01 14:04:02', '2017-09-07 05:26:58', '1');
INSERT INTO `course_chapter` VALUES ('434', '89', '432', '1. 商品和货币（说课）', '2', '3', '2017-06-01 14:04:12', '2017-09-07 05:27:40', '1');
INSERT INTO `course_chapter` VALUES ('435', '89', '432', '2. 价格和价值规律', '3', '3', '2017-06-01 14:05:13', '2017-09-07 05:28:05', '1');
INSERT INTO `course_chapter` VALUES ('436', '89', '432', '2. 价格和价值规律（说课）', '4', '3', '2017-06-01 14:05:27', '2017-09-07 05:28:44', '1');
INSERT INTO `course_chapter` VALUES ('437', '89', '431', '第二课 企业的生产和经营', '2', '2', '2017-06-01 14:05:34', '2017-06-01 14:05:54', '1');
INSERT INTO `course_chapter` VALUES ('438', '89', '437', '1. 提高企业的经济效益', '1', '3', '2017-06-01 14:05:55', '2017-09-07 05:29:12', '1');
INSERT INTO `course_chapter` VALUES ('439', '89', '437', '1. 提高企业的经济效益（说课）', '2', '3', '2017-06-01 14:06:07', '2017-09-07 05:29:50', '1');
INSERT INTO `course_chapter` VALUES ('440', '89', '437', '2. 企业中的劳动者', '3', '3', '2017-06-01 14:06:13', '2017-09-07 05:30:16', '1');
INSERT INTO `course_chapter` VALUES ('441', '89', '437', '2. 企业中的劳动者（说课）', '4', '3', '2017-06-01 14:06:26', '2017-09-07 05:30:53', '1');
INSERT INTO `course_chapter` VALUES ('442', '89', '431', '第三课 自觉能动与自强不息', '3', '2', '2017-06-01 14:06:33', '2017-06-01 14:08:38', '1');
INSERT INTO `course_chapter` VALUES ('443', '89', '442', '1. 个人收入与分配', '1', '3', '2017-06-01 14:07:03', '2017-09-07 05:31:37', '1');
INSERT INTO `course_chapter` VALUES ('444', '89', '442', '1. 个人收入与分配（说课）', '2', '3', '2017-06-01 14:07:13', '2017-09-07 05:32:19', '1');
INSERT INTO `course_chapter` VALUES ('445', '89', '442', '2. 依法纳税和投资理财', '3', '3', '2017-06-01 14:07:20', '2017-09-07 05:32:56', '1');
INSERT INTO `course_chapter` VALUES ('446', '89', '442', '2. 依法纳税和投资理财（说课）', '4', '3', '2017-06-01 14:07:34', '2017-09-07 05:33:37', '1');
INSERT INTO `course_chapter` VALUES ('447', '89', '0', '第二单元 投身经济建设', '1', '1', '2017-06-01 14:07:53', '2017-06-01 14:13:53', '1');
INSERT INTO `course_chapter` VALUES ('448', '89', '447', '第一课 社会主义基本经济制度与社会主义市场经济', '1', '2', '2017-06-01 14:09:02', '2017-06-01 14:09:31', '1');
INSERT INTO `course_chapter` VALUES ('449', '89', '448', '1. 维护社会主义基本经济制度', '1', '3', '2017-06-01 14:09:34', '2017-09-07 05:34:25', '1');
INSERT INTO `course_chapter` VALUES ('450', '89', '448', '1. 维护社会主义基本经济制度（说课）', '2', '3', '2017-06-01 14:09:51', '2017-09-07 05:35:11', '1');
INSERT INTO `course_chapter` VALUES ('451', '89', '448', '2. 把握社会注意市场经济的特征', '3', '3', '2017-06-01 14:09:57', '2017-09-07 05:35:37', '1');
INSERT INTO `course_chapter` VALUES ('452', '89', '448', '2. 把握社会注意市场经济的特征（说课）', '4', '3', '2017-06-01 14:10:47', '2017-09-07 05:36:18', '1');
INSERT INTO `course_chapter` VALUES ('453', '89', '447', '第二课 坚持科学发展观 全面建设小康社会', '2', '2', '2017-06-01 14:10:57', '2017-06-01 14:11:35', '1');
INSERT INTO `course_chapter` VALUES ('454', '89', '453', '1. 全面建设小康社会', '1', '3', '2017-06-01 14:11:22', '2017-09-07 05:36:48', '1');
INSERT INTO `course_chapter` VALUES ('455', '89', '453', '1. 全面建设小康社会（说课）', '2', '3', '2017-06-01 14:11:36', '2017-09-07 05:37:39', '1');
INSERT INTO `course_chapter` VALUES ('456', '89', '453', '2. 坚持科学发展观，促进经济社会生态协调发展', '3', '3', '2017-06-01 14:11:45', '2017-09-07 05:38:08', '1');
INSERT INTO `course_chapter` VALUES ('457', '89', '453', '2. 坚持科学发展观，促进经济社会生态协调发展（说课）', '4', '3', '2017-06-01 14:12:17', '2017-09-07 05:38:47', '1');
INSERT INTO `course_chapter` VALUES ('458', '89', '447', '第三课 对外开放的基本国策', '3', '2', '2017-06-01 14:12:28', '2017-06-01 14:12:42', '1');
INSERT INTO `course_chapter` VALUES ('459', '89', '458', '1. 对外开放是强国之路', '1', '3', '2017-06-01 14:12:44', '2017-09-07 11:13:36', '1');
INSERT INTO `course_chapter` VALUES ('460', '89', '458', '1. 对外开放是强国之路（说课）', '2', '3', '2017-06-01 14:12:58', '2017-09-07 11:14:03', '1');
INSERT INTO `course_chapter` VALUES ('461', '89', '458', '2. 面对全球化 增强开放意识', '3', '3', '2017-06-01 14:13:06', '2017-09-07 11:15:04', '1');
INSERT INTO `course_chapter` VALUES ('462', '89', '458', '2. 面对全球化 增强开放意识（说课）', '4', '3', '2017-06-01 14:13:38', '2017-09-07 11:15:38', '1');
INSERT INTO `course_chapter` VALUES ('463', '89', '0', '第三单元 拥护社会主义政治制度', '2', '1', '2017-06-01 14:13:47', '2017-06-01 14:14:12', '1');
INSERT INTO `course_chapter` VALUES ('464', '89', '463', '第一课 我国社会主义政治制度', '1', '2', '2017-06-01 14:14:38', '2017-06-01 14:14:53', '1');
INSERT INTO `course_chapter` VALUES ('465', '89', '464', '1. 人民代表大会制度及政党制度', '1', '3', '2017-06-01 14:14:54', '2017-09-07 05:39:19', '1');
INSERT INTO `course_chapter` VALUES ('466', '89', '464', '1. 人民代表大会制度及政党制度（说课）', '2', '3', '2017-06-01 14:15:18', '2017-09-07 05:39:56', '1');
INSERT INTO `course_chapter` VALUES ('467', '89', '464', '2. 民族区域与基层群众自治制度', '3', '3', '2017-06-01 14:15:24', '2017-09-07 05:40:31', '1');
INSERT INTO `course_chapter` VALUES ('468', '89', '464', '2. 民族区域与基层群众自治制度（说课）', '4', '3', '2017-06-01 14:16:02', '2017-09-07 05:41:11', '1');
INSERT INTO `course_chapter` VALUES ('469', '89', '463', '第二课 我国民主政治的发展道路', '2', '2', '2017-06-01 14:16:13', '2017-06-01 14:16:38', '1');
INSERT INTO `course_chapter` VALUES ('470', '89', '469', '1. 人民民主是社会主义的生命', '1', '3', '2017-06-01 14:16:39', '2017-09-07 05:41:40', '1');
INSERT INTO `course_chapter` VALUES ('471', '89', '469', '1. 人民民主是社会主义的生命（说课）', '2', '3', '2017-06-01 14:16:54', '2017-09-07 05:42:22', '1');
INSERT INTO `course_chapter` VALUES ('472', '89', '469', '2. 发展社会主义民主政治', '3', '3', '2017-06-01 14:16:59', '2017-09-07 05:42:49', '1');
INSERT INTO `course_chapter` VALUES ('473', '89', '469', '2. 发展社会主义民主政治（说课）', '4', '3', '2017-06-01 14:17:17', '2017-09-07 05:43:32', '1');
INSERT INTO `course_chapter` VALUES ('474', '89', '0', '第四单元 参与政治生活', '3', '1', '2017-06-01 14:17:23', '2017-06-01 14:21:43', '1');
INSERT INTO `course_chapter` VALUES ('475', '89', '474', '第一课 依法行使民主权利', '1', '2', '2017-06-01 14:18:31', '2017-06-01 14:18:53', '1');
INSERT INTO `course_chapter` VALUES ('476', '89', '475', '1. 公民享有民主权利', '1', '3', '2017-06-01 14:18:53', '2017-09-07 05:44:30', '1');
INSERT INTO `course_chapter` VALUES ('477', '89', '475', '1. 公民享有民主权利（说课）', '2', '3', '2017-06-01 14:19:07', '2017-09-07 05:45:13', '1');
INSERT INTO `course_chapter` VALUES ('478', '89', '475', '2. 人民政府服务人民', '3', '3', '2017-06-01 14:19:12', '2017-09-07 05:45:44', '1');
INSERT INTO `course_chapter` VALUES ('479', '89', '475', '2. 人民政府服务人民（说课）', '4', '3', '2017-06-01 14:19:28', '2017-09-07 05:46:26', '1');
INSERT INTO `course_chapter` VALUES ('480', '89', '474', '第二课 履行义务 承担责任', '2', '2', '2017-06-01 14:19:35', '2017-06-01 14:19:53', '1');
INSERT INTO `course_chapter` VALUES ('481', '89', '480', '1. 公民的政治性任务', '1', '3', '2017-06-01 14:19:54', '2017-09-07 05:46:54', '1');
INSERT INTO `course_chapter` VALUES ('482', '89', '480', '1. 公民的政治性任务（说课）', '2', '3', '2017-06-01 14:20:06', '2017-09-07 05:47:32', '1');
INSERT INTO `course_chapter` VALUES ('483', '89', '480', '2. 自觉参与政治生活', '3', '3', '2017-06-01 14:20:10', '2017-09-07 05:47:57', '1');
INSERT INTO `course_chapter` VALUES ('484', '89', '480', '2. 自觉参与政治生活（说课）', '4', '3', '2017-06-01 14:20:25', '2017-09-07 05:48:37', '1');
INSERT INTO `course_chapter` VALUES ('485', '89', '474', '第三课 关注国际社会 维护国家利益', '3', '2', '2017-06-01 14:20:32', '2017-06-01 14:20:49', '1');
INSERT INTO `course_chapter` VALUES ('486', '89', '485', '1. 中国在国际社会中的作用', '1', '3', '2017-06-01 14:20:50', '2017-09-07 05:49:04', '1');
INSERT INTO `course_chapter` VALUES ('487', '89', '485', '1. 中国在国际社会中的作用（说课）', '2', '3', '2017-06-01 14:21:04', '2017-09-07 05:49:41', '1');
INSERT INTO `course_chapter` VALUES ('488', '89', '485', '2. 我国奉行的外交政策', '3', '3', '2017-06-01 14:21:09', '2017-09-07 05:50:07', '1');
INSERT INTO `course_chapter` VALUES ('489', '89', '485', '2. 我国奉行的外交政策（说课）', '4', '3', '2017-06-01 14:21:27', '2017-09-07 05:50:49', '1');
INSERT INTO `course_chapter` VALUES ('490', '89', '0', '第五单元 共建社会主义和谐社会', '4', '1', '2017-06-01 14:21:34', '2017-06-01 14:23:00', '1');
INSERT INTO `course_chapter` VALUES ('491', '89', '490', '第一课 关注改善民生', '1', '2', '2017-06-01 14:23:01', '2017-06-01 14:23:14', '1');
INSERT INTO `course_chapter` VALUES ('492', '89', '491', '1. 优先发展教育：学有所教', '1', '3', '2017-06-01 14:23:15', '2017-09-07 05:51:23', '1');
INSERT INTO `course_chapter` VALUES ('493', '89', '491', '1. 优先发展教育：学有所教（说课）', '2', '3', '2017-06-01 14:23:31', '2017-09-07 05:52:03', '1');
INSERT INTO `course_chapter` VALUES ('494', '89', '491', '2. 医疗和社会保障：普惠百姓', '3', '3', '2017-06-01 14:23:36', '2017-09-07 05:52:39', '1');
INSERT INTO `course_chapter` VALUES ('495', '89', '491', '2. 医疗和社会保障：普惠百姓（说课）', '4', '3', '2017-06-01 14:23:58', '2017-09-07 07:39:56', '1');
INSERT INTO `course_chapter` VALUES ('496', '89', '490', '第二课 建设和谐文化', '2', '2', '2017-06-01 14:24:04', '2017-06-01 14:24:14', '1');
INSERT INTO `course_chapter` VALUES ('497', '89', '496', '1. 推动社会主义文化大发展大繁荣', '1', '3', '2017-06-01 14:24:14', '2017-09-07 06:08:08', '1');
INSERT INTO `course_chapter` VALUES ('498', '89', '496', '1. 推动社会主义文化大发展大繁荣（说课）', '2', '3', '2017-06-01 14:24:32', '2017-09-07 06:09:08', '1');
INSERT INTO `course_chapter` VALUES ('499', '89', '496', '2. 社会主义核心价值体系', '3', '3', '2017-06-01 14:24:37', '2017-09-07 06:20:12', '1');
INSERT INTO `course_chapter` VALUES ('500', '89', '496', '2. 社会主义核心价值体系（说课）', '4', '3', '2017-06-01 14:24:57', '2017-09-07 06:19:18', '1');
INSERT INTO `course_chapter` VALUES ('501', '89', '490', '第三课 构建和谐社会', '3', '2', '2017-06-01 14:25:04', '2017-06-01 14:25:14', '1');
INSERT INTO `course_chapter` VALUES ('502', '89', '501', '1. 高举旗帜 科学发展', '1', '3', '2017-06-01 14:25:15', '2017-09-07 06:20:42', '1');
INSERT INTO `course_chapter` VALUES ('503', '89', '501', '1. 高举旗帜 科学发展（说课）', '2', '3', '2017-06-01 14:25:28', '2017-09-07 06:21:23', '1');
INSERT INTO `course_chapter` VALUES ('504', '89', '501', '2. 和谐社会 共建共享', '3', '3', '2017-06-01 14:25:33', '2017-09-07 06:21:51', '1');
INSERT INTO `course_chapter` VALUES ('505', '89', '501', '2. 和谐社会 共建共享（说课）', '4', '3', '2017-06-01 14:25:43', '2017-09-07 06:22:43', '1');
INSERT INTO `course_chapter` VALUES ('506', '88', '429', '第一课 关注心理健康', '1', '2', '2017-06-01 15:27:41', '2017-09-07 11:47:36', '1');
INSERT INTO `course_chapter` VALUES ('507', '88', '429', '第一课 关注心理健康（说课）', '2', '2', '2017-06-01 15:27:55', '2017-09-07 11:47:56', '1');
INSERT INTO `course_chapter` VALUES ('508', '88', '429', '第二课 解读心理问题', '3', '2', '2017-06-01 15:28:01', '2017-09-07 11:21:22', '1');
INSERT INTO `course_chapter` VALUES ('509', '88', '429', '第二课 解读心理问题（说课）', '4', '2', '2017-06-01 15:28:13', '2017-09-07 11:21:53', '1');
INSERT INTO `course_chapter` VALUES ('510', '88', '429', '第三课 认识心理咨询', '5', '2', '2017-06-01 15:28:20', '2017-09-07 11:22:17', '1');
INSERT INTO `course_chapter` VALUES ('511', '88', '429', '第三课 认识心理咨询（说课）', '6', '2', '2017-06-01 15:30:12', '2017-09-07 11:22:45', '1');
INSERT INTO `course_chapter` VALUES ('512', '88', '0', '第二单元 自我认识', '1', '1', '2017-06-01 15:30:20', '2017-06-01 15:30:40', '1');
INSERT INTO `course_chapter` VALUES ('513', '88', '512', '第一课 认识自我', '1', '2', '2017-06-01 15:30:41', '2017-09-07 11:23:14', '1');
INSERT INTO `course_chapter` VALUES ('515', '88', '512', '第一课 认识自我（说课）', '2', '2', '2017-06-01 15:31:12', '2017-09-07 11:23:48', '1');
INSERT INTO `course_chapter` VALUES ('516', '88', '512', '第二课 悦纳自我', '3', '2', '2017-06-01 15:31:21', '2017-09-07 11:24:14', '1');
INSERT INTO `course_chapter` VALUES ('517', '88', '512', '第二课 悦纳自我（说课）', '4', '2', '2017-06-01 15:31:32', '2017-09-07 11:24:38', '1');
INSERT INTO `course_chapter` VALUES ('518', '88', '512', '第三课 不一样的我', '5', '2', '2017-06-01 15:31:37', '2017-09-07 11:25:02', '1');
INSERT INTO `course_chapter` VALUES ('519', '88', '512', '第三课 不一样的我（说课）', '6', '2', '2017-06-01 15:36:26', '2017-09-07 11:25:26', '1');
INSERT INTO `course_chapter` VALUES ('520', '88', '512', '第四课 完善自我', '7', '2', '2017-06-01 15:36:32', '2017-09-07 11:25:50', '1');
INSERT INTO `course_chapter` VALUES ('521', '88', '512', '第四课 完善自我（说课）', '8', '2', '2017-06-01 15:36:43', '2017-09-07 11:26:18', '1');
INSERT INTO `course_chapter` VALUES ('522', '88', '0', '第三单元 情绪管理', '2', '1', '2017-06-01 15:36:49', '2017-06-01 15:37:16', '1');
INSERT INTO `course_chapter` VALUES ('523', '88', '522', '第一课 认识情绪', '1', '2', '2017-06-01 15:37:17', '2017-09-07 11:35:11', '1');
INSERT INTO `course_chapter` VALUES ('524', '88', '522', '第一课 认识情绪（说课）', '2', '2', '2017-06-01 15:37:28', '2017-09-07 11:35:17', '0');
INSERT INTO `course_chapter` VALUES ('525', '88', '522', '第二课 调控情绪', '3', '2', '2017-06-01 15:37:33', '2017-09-07 11:37:11', '1');
INSERT INTO `course_chapter` VALUES ('526', '88', '522', '第二课 调控情绪（说课）', '4', '2', '2017-06-01 15:37:42', '2017-09-07 11:37:38', '1');
INSERT INTO `course_chapter` VALUES ('527', '88', '522', '第三课 情绪ABC', '5', '2', '2017-06-01 15:37:49', '2017-09-07 11:38:00', '1');
INSERT INTO `course_chapter` VALUES ('528', '88', '522', '第三课 情绪ABC（说课）', '6', '2', '2017-06-01 15:38:00', '2017-09-07 11:38:24', '1');
INSERT INTO `course_chapter` VALUES ('529', '88', '0', '第四单元 人际关系', '3', '1', '2017-06-01 15:38:08', '2017-06-01 15:38:21', '1');
INSERT INTO `course_chapter` VALUES ('530', '88', '529', '第一课 人际交往', '2', '2', '2017-06-01 15:38:22', '2017-09-07 11:31:47', '1');
INSERT INTO `course_chapter` VALUES ('531', '88', '529', '第一课 人际交往（说课）', '3', '2', '2017-06-01 15:39:27', '2017-09-07 11:32:15', '1');
INSERT INTO `course_chapter` VALUES ('532', '88', '529', '第二课 人际冲突', '4', '2', '2017-06-01 15:39:40', '2017-09-07 11:32:39', '1');
INSERT INTO `course_chapter` VALUES ('533', '88', '529', '第二课 人际冲突（说课）', '5', '2', '2017-06-01 15:39:50', '2017-09-07 11:33:04', '1');
INSERT INTO `course_chapter` VALUES ('534', '88', '529', '第三课 人际沟通—语言沟通', '6', '2', '2017-06-01 15:40:02', '2017-09-07 11:33:27', '1');
INSERT INTO `course_chapter` VALUES ('535', '88', '529', '第三课 人际沟通—语言沟通（说课）', '7', '2', '2017-06-01 15:40:21', '2017-09-07 11:33:54', '1');
INSERT INTO `course_chapter` VALUES ('536', '88', '529', '第四课 人际沟通—非语言沟通', '8', '2', '2017-06-01 15:41:37', '2017-09-07 11:34:21', '1');
INSERT INTO `course_chapter` VALUES ('537', '88', '529', '第四课 人际沟通—非语言沟通（说课）', '9', '2', '2017-06-01 15:41:50', '2017-09-07 11:34:46', '1');
INSERT INTO `course_chapter` VALUES ('538', '88', '0', '第五单元 恋爱与性', '4', '1', '2017-06-01 15:41:58', '2017-06-01 15:45:09', '1');
INSERT INTO `course_chapter` VALUES ('539', '88', '538', '第一课 如何谈恋爱', '1', '2', '2017-06-01 15:45:09', '2017-09-07 11:43:00', '1');
INSERT INTO `course_chapter` VALUES ('540', '88', '538', '第一课 如何谈恋爱（说课）', '2', '2', '2017-06-01 15:45:24', '2017-09-07 11:43:25', '1');
INSERT INTO `course_chapter` VALUES ('541', '88', '538', '第二课 爱情底线在哪里', '3', '2', '2017-06-01 15:45:30', '2017-09-07 11:43:52', '1');
INSERT INTO `course_chapter` VALUES ('542', '88', '538', '第二课 爱情底线在哪里（说课）', '4', '2', '2017-06-01 15:45:41', '2017-09-07 11:44:25', '1');
INSERT INTO `course_chapter` VALUES ('543', '88', '0', '第六单元 学习心理', '5', '1', '2017-06-01 15:45:47', '2017-06-01 15:46:21', '1');
INSERT INTO `course_chapter` VALUES ('544', '88', '543', '第一课 学习适应', '1', '2', '2017-06-01 15:46:09', '2017-09-07 11:26:45', '1');
INSERT INTO `course_chapter` VALUES ('545', '88', '543', '第一课 学习适应（说课）', '2', '2', '2017-06-01 15:46:30', '2017-09-07 11:27:11', '1');
INSERT INTO `course_chapter` VALUES ('546', '88', '543', '第二课 学习方法', '3', '2', '2017-06-01 15:46:35', '2017-09-07 11:27:39', '1');
INSERT INTO `course_chapter` VALUES ('547', '88', '543', '第二课 学习方法（说课）', '4', '2', '2017-06-01 15:46:45', '2017-09-07 11:28:04', '1');
INSERT INTO `course_chapter` VALUES ('548', '88', '543', '第三课 时间管理', '5', '2', '2017-06-01 15:46:51', '2017-09-07 11:28:27', '1');
INSERT INTO `course_chapter` VALUES ('549', '88', '543', '第三课 时间管理（说课）', '6', '2', '2017-06-01 15:47:01', '2017-09-07 11:28:51', '1');
INSERT INTO `course_chapter` VALUES ('550', '88', '543', '第四课 快乐学习', '7', '2', '2017-06-01 15:47:09', '2017-09-07 11:29:14', '1');
INSERT INTO `course_chapter` VALUES ('551', '88', '543', '第四课 快乐学习（说课）', '8', '2', '2017-06-01 15:47:20', '2017-09-07 11:29:39', '1');
INSERT INTO `course_chapter` VALUES ('552', '88', '0', '第七单元 网络成瘾', '6', '1', '2017-06-01 15:47:26', '2017-06-01 15:47:53', '1');
INSERT INTO `course_chapter` VALUES ('553', '88', '552', '第一课 网络与心理健康', '1', '2', '2017-06-01 15:47:54', '2017-09-07 11:44:50', '1');
INSERT INTO `course_chapter` VALUES ('554', '88', '552', '第一课 网络与心理健康（说课）', '2', '2', '2017-06-01 15:48:07', '2017-09-07 11:45:16', '1');
INSERT INTO `course_chapter` VALUES ('555', '88', '552', '第二课 网络依赖', '3', '2', '2017-06-01 15:48:12', '2017-09-07 11:45:41', '1');
INSERT INTO `course_chapter` VALUES ('556', '88', '552', '第二课 网络依赖（说课）', '4', '2', '2017-06-01 15:48:22', '2017-09-07 11:46:05', '1');
INSERT INTO `course_chapter` VALUES ('557', '88', '552', '第三课 游戏成瘾', '5', '2', '2017-06-01 15:48:27', '2017-09-07 11:46:28', '1');
INSERT INTO `course_chapter` VALUES ('558', '88', '552', '第三课 游戏成瘾（说课）', '6', '2', '2017-06-01 15:48:40', '2017-09-07 11:46:52', '1');
INSERT INTO `course_chapter` VALUES ('559', '88', '0', '第八单元 挫折与压力应对', '7', '1', '2017-06-01 15:48:46', '2017-06-01 15:49:10', '1');
INSERT INTO `course_chapter` VALUES ('560', '88', '559', '第一课 挫折', '1', '2', '2017-06-01 15:49:11', '2017-09-07 11:38:55', '1');
INSERT INTO `course_chapter` VALUES ('561', '88', '559', '第一课 挫折（说课）', '2', '2', '2017-06-01 15:49:40', '2017-09-07 11:39:21', '1');
INSERT INTO `course_chapter` VALUES ('562', '88', '559', '第二课 压力应对', '3', '2', '2017-06-01 15:49:44', '2017-09-07 11:39:43', '1');
INSERT INTO `course_chapter` VALUES ('563', '88', '559', '第二课 压力应对（说课）', '4', '2', '2017-06-01 15:49:54', '2017-09-07 11:40:10', '1');
INSERT INTO `course_chapter` VALUES ('564', '88', '559', '第三课 危机干预', '5', '2', '2017-06-01 15:49:59', '2017-09-07 11:40:32', '1');
INSERT INTO `course_chapter` VALUES ('565', '88', '559', '第三课 危机干预（说课）', '6', '2', '2017-06-01 15:50:10', '2017-09-07 11:40:57', '1');
INSERT INTO `course_chapter` VALUES ('566', '88', '0', '第九单元 生命与安全', '8', '1', '2017-06-01 15:50:17', '2017-06-01 15:50:34', '1');
INSERT INTO `course_chapter` VALUES ('567', '88', '566', '第一课 生命教育', '1', '2', '2017-06-01 15:50:35', '2017-09-07 11:41:23', '1');
INSERT INTO `course_chapter` VALUES ('568', '88', '566', '第一课 生命教育（说课）', '2', '2', '2017-06-01 15:50:45', '2017-09-07 11:41:47', '1');
INSERT INTO `course_chapter` VALUES ('569', '88', '566', '第二课 生命价值观', '3', '2', '2017-06-01 15:50:50', '2017-09-07 11:42:10', '1');
INSERT INTO `course_chapter` VALUES ('570', '88', '566', '第二课 生命价值观（说课）', '4', '2', '2017-06-01 15:51:00', '2017-09-07 11:42:34', '1');
INSERT INTO `course_chapter` VALUES ('571', '88', '0', '第十单元 拥抱幸福', '9', '1', '2017-06-01 15:51:05', '2017-06-01 15:51:21', '1');
INSERT INTO `course_chapter` VALUES ('572', '88', '571', '第一课 积极心理', '1', '2', '2017-06-01 15:51:09', '2017-09-07 11:30:02', '1');
INSERT INTO `course_chapter` VALUES ('573', '88', '571', '第一课 积极心理（说课）', '2', '2', '2017-06-01 15:51:30', '2017-09-07 11:30:26', '1');
INSERT INTO `course_chapter` VALUES ('574', '88', '571', '第二课 幸福心理', '3', '2', '2017-06-01 15:51:35', '2017-09-07 11:30:51', '1');
INSERT INTO `course_chapter` VALUES ('575', '88', '571', '第二课 幸福心理（说课）', '4', '2', '2017-06-01 15:51:45', '2017-09-07 11:31:16', '1');
INSERT INTO `course_chapter` VALUES ('576', '90', '0', '第一章 《弟子规》与我', null, '1', null, '2017-06-01 16:22:09', '1');
INSERT INTO `course_chapter` VALUES ('577', '90', '576', '第一章 《弟子规》与我', '1', '2', '2017-06-01 16:10:26', '2017-06-05 15:41:01', '1');
INSERT INTO `course_chapter` VALUES ('578', '90', '0', '第二章 中华第一规', '1', '1', '2017-06-01 16:10:29', '2017-06-01 16:10:55', '1');
INSERT INTO `course_chapter` VALUES ('579', '90', '578', '第二章 中华第一规', '1', '2', '2017-06-01 16:10:34', '2017-06-05 15:42:59', '1');
INSERT INTO `course_chapter` VALUES ('580', '90', '0', '第三章 感恩爹娘', '2', '1', '2017-06-01 16:10:58', '2017-06-01 16:11:26', '1');
INSERT INTO `course_chapter` VALUES ('581', '90', '580', '第一节 接纳他们', '1', '2', '2017-06-01 16:11:04', '2017-06-06 09:15:40', '1');
INSERT INTO `course_chapter` VALUES ('582', '90', '580', '第二节 尊重他们', '2', '2', '2017-06-01 16:11:35', '2017-06-06 09:16:01', '1');
INSERT INTO `course_chapter` VALUES ('583', '90', '580', '第三节 体谅他们', '3', '2', '2017-06-01 16:11:48', '2017-06-05 15:48:21', '1');
INSERT INTO `course_chapter` VALUES ('584', '90', '580', '第四节 关心他们', '4', '2', '2017-06-01 16:11:56', '2017-06-05 15:51:02', '1');
INSERT INTO `course_chapter` VALUES ('585', '90', '580', '第五节 包容他们', '5', '2', '2017-06-01 16:12:03', '2017-06-05 15:52:24', '1');
INSERT INTO `course_chapter` VALUES ('586', '90', '0', '第四章 重塑自己', '3', '1', '2017-06-01 16:12:16', '2017-06-01 16:12:59', '1');
INSERT INTO `course_chapter` VALUES ('587', '90', '586', '第一节 管住嘴巴', '1', '2', '2017-06-01 16:13:00', '2017-06-05 15:56:58', '1');
INSERT INTO `course_chapter` VALUES ('588', '90', '586', '第二节 管住举止', '2', '2', '2017-06-01 16:13:10', '2017-06-06 09:17:10', '1');
INSERT INTO `course_chapter` VALUES ('589', '90', '586', '第三节 管住时间', '3', '2', '2017-06-01 16:13:21', '2017-06-06 09:17:28', '1');
INSERT INTO `course_chapter` VALUES ('590', '90', '586', '第四节 管住环境', '4', '2', '2017-06-01 16:13:28', '2017-06-05 16:09:58', '1');
INSERT INTO `course_chapter` VALUES ('591', '90', '586', '第五节 管住欲望', '5', '2', '2017-06-01 16:13:38', '2017-06-05 16:13:36', '1');
INSERT INTO `course_chapter` VALUES ('592', '90', '586', '第六节 管住手机', '6', '2', '2017-06-01 16:14:36', '2017-06-05 16:15:24', '1');
INSERT INTO `course_chapter` VALUES ('593', '90', '586', '第七节 管住斗殴', '7', '2', '2017-06-01 16:14:54', '2017-06-05 16:19:22', '1');
INSERT INTO `course_chapter` VALUES ('594', '90', '0', '第五章 懂得真爱', '4', '1', '2017-06-01 16:15:15', '2017-06-01 16:18:58', '1');
INSERT INTO `course_chapter` VALUES ('595', '90', '594', '第一节 你是老师', '1', '2', '2017-06-01 16:18:59', '2017-06-05 16:21:40', '1');
INSERT INTO `course_chapter` VALUES ('596', '90', '594', '第二节 你是同学', '2', '2', '2017-06-01 16:19:07', '2017-06-05 16:23:31', '1');
INSERT INTO `course_chapter` VALUES ('597', '90', '0', '第六章 学会选择', '5', '1', '2017-06-01 16:19:15', '2017-06-01 16:23:14', '1');
INSERT INTO `course_chapter` VALUES ('598', '90', '597', '第一节 他是福星', '1', '2', '2017-06-01 16:19:19', '2017-06-05 16:26:30', '1');
INSERT INTO `course_chapter` VALUES ('599', '90', '597', '第二节 他是灾星', '2', '2', '2017-06-01 16:20:04', '2017-06-05 16:30:00', '1');
INSERT INTO `course_chapter` VALUES ('600', '90', '0', '第七章 拥有技能', '6', '1', '2017-06-01 16:20:39', '2017-06-01 16:21:02', '1');
INSERT INTO `course_chapter` VALUES ('602', '90', '600', '第一节 为什么要学', '2', '2', '2017-06-01 16:20:50', '2017-06-06 09:18:31', '1');
INSERT INTO `course_chapter` VALUES ('604', '90', '600', '第二节 学习没那么难', '2', '2', '2017-06-01 16:21:12', '2017-06-06 09:18:36', '1');
INSERT INTO `course_chapter` VALUES ('605', '91', '0', '第一章 预见未知的自己', null, '1', null, '2017-06-01 16:25:38', '1');
INSERT INTO `course_chapter` VALUES ('607', '91', '605', '认识你真好', '2', '2', '2017-06-01 16:26:13', '2017-06-05 11:18:31', '1');
INSERT INTO `course_chapter` VALUES ('608', '91', '605', '我是谁？', '3', '2', '2017-06-01 16:26:18', '2017-06-05 11:20:14', '1');
INSERT INTO `course_chapter` VALUES ('609', '91', '605', '情感超市', '4', '2', '2017-06-01 16:26:24', '2017-06-05 11:22:02', '1');
INSERT INTO `course_chapter` VALUES ('610', '91', '605', '富有的生命历程', '5', '2', '2017-06-01 16:26:31', '2017-06-05 11:24:55', '1');
INSERT INTO `course_chapter` VALUES ('611', '91', '605', '好好地爱自己', '6', '2', '2017-06-01 16:26:40', '2017-06-05 11:26:53', '1');
INSERT INTO `course_chapter` VALUES ('612', '91', '0', '第二章 发现真是的自己', '7', '1', '2017-06-01 16:26:51', '2017-06-01 16:29:57', '1');
INSERT INTO `course_chapter` VALUES ('613', '91', '612', '自我情绪管理', '1', '2', '2017-06-01 16:26:57', '2017-06-05 11:32:56', '1');
INSERT INTO `course_chapter` VALUES ('614', '91', '612', '战胜自卑', '2', '2', '2017-06-01 16:27:17', '2017-06-05 11:34:42', '1');
INSERT INTO `course_chapter` VALUES ('615', '91', '612', '妒忌的危害', '3', '2', '2017-06-01 16:27:23', '2017-06-05 11:38:49', '1');
INSERT INTO `course_chapter` VALUES ('616', '91', '612', '爱情这东西', '4', '2', '2017-06-01 16:27:30', '2017-06-05 11:40:48', '1');
INSERT INTO `course_chapter` VALUES ('617', '91', '612', '愤怒蒙蔽了我们的双眼', '5', '2', '2017-06-01 16:27:36', '2017-06-05 11:42:24', '1');
INSERT INTO `course_chapter` VALUES ('618', '91', '612', '风雨人生路', '6', '2', '2017-06-01 16:27:49', '2017-06-05 11:45:09', '1');
INSERT INTO `course_chapter` VALUES ('619', '91', '612', '交谈的艺术', '7', '2', '2017-06-01 16:27:55', '2017-06-05 11:47:04', '1');
INSERT INTO `course_chapter` VALUES ('620', '91', '0', '第三章 塑造最美的自己', '8', '1', '2017-06-01 16:28:01', '2017-06-01 16:28:27', '1');
INSERT INTO `course_chapter` VALUES ('621', '91', '620', '生命在我手中', '1', '2', '2017-06-01 16:28:28', '2017-06-05 11:49:00', '1');
INSERT INTO `course_chapter` VALUES ('622', '91', '620', '意愿百分百，方法无穷多', '2', '2', '2017-06-01 16:28:43', '2017-06-05 11:50:56', '1');
INSERT INTO `course_chapter` VALUES ('623', '91', '620', '让生命之根更深更远', '3', '2', '2017-06-01 16:28:52', '2017-06-05 11:52:41', '1');
INSERT INTO `course_chapter` VALUES ('624', '91', '620', '减压训练', '4', '2', '2017-06-01 16:29:18', '2017-06-05 11:55:31', '1');
INSERT INTO `course_chapter` VALUES ('625', '91', '620', '戒除网瘾', '5', '2', '2017-06-01 16:29:29', '2017-06-05 11:58:17', '1');
INSERT INTO `course_chapter` VALUES ('626', '91', '620', '积极心理品质的培养', '6', '2', '2017-06-01 16:29:36', '2017-06-05 12:00:56', '1');
INSERT INTO `course_chapter` VALUES ('627', '91', '620', '决不放弃', '7', '2', '2017-06-01 16:29:52', '2017-06-06 09:42:46', '1');
INSERT INTO `course_chapter` VALUES ('628', '92', '0', '校园安全伴我行（人身安全）', null, '1', null, '2017-06-01 16:32:14', '1');
INSERT INTO `course_chapter` VALUES ('629', '92', '628', '校园安全伴我行（人身安全）', '1', '2', '2017-06-01 16:32:16', '2017-06-05 15:13:48', '1');
INSERT INTO `course_chapter` VALUES ('631', '92', '0', '一时放纵带来百年孤独  半点星火毁掉万卷图书（消防安全）', '3', '1', '2017-06-01 16:32:27', '2017-06-01 16:41:58', '1');
INSERT INTO `course_chapter` VALUES ('632', '92', '0', '带走垃圾，留下回忆（文明出行，文明旅游）', '13', '1', '2017-06-01 16:32:28', '2017-06-01 16:52:28', '1');
INSERT INTO `course_chapter` VALUES ('634', '92', '0', '我爱照镜子（个人为生与礼仪）', '14', '1', '2017-06-01 16:32:29', '2017-06-05 14:58:12', '1');
INSERT INTO `course_chapter` VALUES ('635', '92', '0', '减灾防灾进课堂  安全意识传万家（自然灾害和公共安全）', '4', '1', '2017-06-01 16:32:30', '2017-06-01 16:42:57', '1');
INSERT INTO `course_chapter` VALUES ('636', '92', '0', '急救我最行，安全伴你行（急救安全）', '5', '1', '2017-06-01 16:32:31', '2017-06-01 16:43:47', '1');
INSERT INTO `course_chapter` VALUES ('637', '92', '0', '防人之心不可无，害人之心不可有（防盗与防骗—财产安全）', '6', '1', '2017-06-01 16:32:32', '2017-06-01 16:44:29', '1');
INSERT INTO `course_chapter` VALUES ('638', '92', '0', '请你帮帮我（遇险求助）', '7', '1', '2017-06-01 16:32:33', '2017-06-01 16:45:16', '1');
INSERT INTO `course_chapter` VALUES ('639', '92', '0', '有勇有谋（见义智为）', '8', '1', '2017-06-01 16:32:33', '2017-06-01 16:49:11', '1');
INSERT INTO `course_chapter` VALUES ('640', '92', '0', '生命最可贵，交规放心间（交通安全）', '9', '1', '2017-06-01 16:32:34', '2017-06-01 16:50:54', '1');
INSERT INTO `course_chapter` VALUES ('642', '92', '0', '尊老爱幼是美德（文明礼仪）', '11', '1', '2017-06-01 16:32:36', '2017-06-01 16:51:58', '1');
INSERT INTO `course_chapter` VALUES ('643', '92', '0', '和咸猪手说拜拜（女同学安全教育）', '2', '1', '2017-06-01 16:32:37', '2017-06-01 16:34:37', '1');
INSERT INTO `course_chapter` VALUES ('647', '92', '0', '相处有道，接触有度（恋爱安全与性健康教育）', '1', '1', '2017-06-01 16:32:43', '2017-06-01 16:34:11', '1');
INSERT INTO `course_chapter` VALUES ('648', '92', '647', '相处有道，接触有度（恋爱安全与性健康教育）', '1', '2', '2017-06-01 16:34:12', '2017-06-05 14:32:32', '1');
INSERT INTO `course_chapter` VALUES ('649', '92', '643', '和咸猪手说拜拜（女同学安全教育）', '1', '2', '2017-06-01 16:34:39', '2017-06-05 15:02:51', '1');
INSERT INTO `course_chapter` VALUES ('650', '92', '631', '一时放纵带来百年孤独  半点星火毁掉万卷图书（消防安全）', '1', '2', '2017-06-01 16:42:00', '2017-06-05 14:38:45', '1');
INSERT INTO `course_chapter` VALUES ('651', '92', '635', '减灾防灾进课堂  安全意识传万家（自然灾害和公共安全）', '1', '2', '2017-06-01 16:42:59', '2017-06-05 14:42:17', '1');
INSERT INTO `course_chapter` VALUES ('652', '92', '636', '急救我最行，安全伴你行（急救安全）', '1', '2', '2017-06-01 16:43:43', '2017-06-05 14:44:28', '1');
INSERT INTO `course_chapter` VALUES ('653', '92', '637', '防人之心不可无，害人之心不可有（防盗与防骗—财产安全）', '1', '2', '2017-06-01 16:44:31', '2017-06-05 14:46:18', '1');
INSERT INTO `course_chapter` VALUES ('654', '92', '638', '请你帮帮我（遇险求助）', '1', '2', '2017-06-01 16:45:17', '2017-06-05 14:47:41', '1');
INSERT INTO `course_chapter` VALUES ('655', '92', '0', '绿色上网，健康成长，共建“文明网络家园”（上网安全）', '10', '1', '2017-06-01 16:48:05', '2017-06-01 16:51:34', '1');
INSERT INTO `course_chapter` VALUES ('656', '92', '639', '有勇有谋（见义智为）', '1', '2', '2017-06-01 16:49:12', '2017-06-05 14:48:49', '1');
INSERT INTO `course_chapter` VALUES ('657', '92', '640', '生命最可贵，交规放心间（交通安全）', '1', '2', '2017-06-01 16:49:16', '2017-06-05 14:50:55', '1');
INSERT INTO `course_chapter` VALUES ('658', '92', '655', '绿色上网，健康成长，共建“文明网络家园”（上网安全）', '1', '2', '2017-06-01 16:51:36', '2017-06-06 09:49:36', '1');
INSERT INTO `course_chapter` VALUES ('659', '92', '642', '尊老爱幼是美德（文明礼仪）', '1', '2', '2017-06-01 16:52:00', '2017-06-05 14:55:40', '1');
INSERT INTO `course_chapter` VALUES ('660', '92', '632', '带走垃圾，留下回忆（文明出行，文明旅游）', '1', '2', '2017-06-01 16:52:30', '2017-06-05 14:57:25', '1');
INSERT INTO `course_chapter` VALUES ('661', '92', '634', '我爱照镜子（个人为生与礼仪）', '1', '2', '2017-06-01 16:52:55', '2017-06-05 14:59:36', '1');
INSERT INTO `course_chapter` VALUES ('662', '93', '0', '快乐学习（学习是为了明天美好的生活）', null, '1', null, '2017-06-01 16:55:51', '1');
INSERT INTO `course_chapter` VALUES ('663', '93', '662', '快乐学习（学习是为了明天美好的生活）', '12', '2', '2017-06-01 16:54:54', '2017-06-05 11:22:15', '1');
INSERT INTO `course_chapter` VALUES ('664', '93', '0', '奔跑吧，我的兄弟姐妹（目标）', '11', '1', '2017-06-01 16:55:02', '2017-06-01 16:59:42', '1');
INSERT INTO `course_chapter` VALUES ('665', '93', '0', '没有规矩不成方圆（纪律）', '2', '1', '2017-06-01 16:55:04', '2017-06-01 16:56:38', '1');
INSERT INTO `course_chapter` VALUES ('666', '93', '0', '我的未来不是梦（理想）', '4', '1', '2017-06-01 16:55:08', '2017-06-01 16:57:14', '1');
INSERT INTO `course_chapter` VALUES ('667', '93', '0', '光荣与传统（爱国主义教育）', '7', '1', '2017-06-01 16:55:09', '2017-06-01 16:58:21', '1');
INSERT INTO `course_chapter` VALUES ('668', '93', '0', '学校是我的第二个家（校园生活）', '1', '1', '2017-06-01 16:55:10', '2017-06-01 16:56:15', '1');
INSERT INTO `course_chapter` VALUES ('669', '93', '0', '授人玫瑰，手留余香（助人）', '10', '1', '2017-06-01 16:55:13', '2017-06-01 16:59:20', '1');
INSERT INTO `course_chapter` VALUES ('670', '93', '0', '对不良诱惑说“不”（远离黄赌毒）', '12', '1', '2017-06-01 16:55:14', '2017-06-01 17:00:03', '1');
INSERT INTO `course_chapter` VALUES ('671', '93', '0', '自由与自律（公民教育）', '13', '1', '2017-06-01 16:55:15', '2017-06-01 17:00:48', '1');
INSERT INTO `course_chapter` VALUES ('672', '93', '0', '责任与压力（公民教育）', '14', '1', '2017-06-01 16:55:16', '2017-06-01 17:00:41', '1');
INSERT INTO `course_chapter` VALUES ('675', '93', '0', '绿色校园，低碳生活（和谐校园）', '8', '1', '2017-06-01 16:55:18', '2017-06-01 16:58:40', '1');
INSERT INTO `course_chapter` VALUES ('677', '93', '0', '新起点，新梦想（理想）', '3', '1', '2017-06-01 16:55:39', '2017-06-01 16:56:55', '1');
INSERT INTO `course_chapter` VALUES ('678', '93', '0', '成功是一种习惯（学习）', '5', '1', '2017-06-01 16:55:40', '2017-06-01 16:57:29', '1');
INSERT INTO `course_chapter` VALUES ('679', '93', '0', '创新，迈向成功的原动力（创新创业意识）', '6', '1', '2017-06-01 16:55:41', '2017-06-01 16:57:54', '1');
INSERT INTO `course_chapter` VALUES ('680', '93', '0', '一个字—“干”（勤奋）', '9', '1', '2017-06-01 16:55:41', '2017-06-01 16:58:59', '1');
INSERT INTO `course_chapter` VALUES ('681', '93', '668', '学校是我的第二个家（校园生活）', '1', '2', '2017-06-01 16:56:16', '2017-06-05 11:25:27', '1');
INSERT INTO `course_chapter` VALUES ('682', '93', '665', '没有规矩不成方圆（纪律）', '1', '2', '2017-06-01 16:56:39', '2017-06-05 11:27:23', '1');
INSERT INTO `course_chapter` VALUES ('683', '93', '677', '新起点，新梦想（理想）', '1', '2', '2017-06-01 16:56:56', '2017-06-05 11:29:43', '1');
INSERT INTO `course_chapter` VALUES ('684', '93', '666', '我的未来不是梦（理想）', '1', '2', '2017-06-01 16:57:15', '2017-06-05 11:31:34', '1');
INSERT INTO `course_chapter` VALUES ('685', '93', '678', '成功是一种习惯（学习）', '1', '2', '2017-06-01 16:57:30', '2017-06-05 11:34:19', '1');
INSERT INTO `course_chapter` VALUES ('686', '93', '679', '创新，迈向成功的原动力（创新创业意识）', '1', '2', '2017-06-01 16:57:55', '2017-06-05 11:36:17', '1');
INSERT INTO `course_chapter` VALUES ('687', '93', '667', '光荣与传统（爱国主义教育）', '1', '2', '2017-06-01 16:58:18', '2017-06-05 11:38:54', '1');
INSERT INTO `course_chapter` VALUES ('688', '93', '675', '绿色校园，低碳生活（和谐校园）', '1', '2', '2017-06-01 16:58:41', '2017-06-06 11:32:11', '0');
INSERT INTO `course_chapter` VALUES ('689', '93', '680', '一个字—“干”（勤奋）', '1', '2', '2017-06-01 16:58:59', '2017-06-05 11:43:13', '1');
INSERT INTO `course_chapter` VALUES ('690', '93', '669', '授人玫瑰，手留余香（助人）', '1', '2', '2017-06-01 16:59:22', '2017-06-05 11:44:25', '1');
INSERT INTO `course_chapter` VALUES ('691', '93', '664', '奔跑吧，我的兄弟姐妹（目标）', '1', '2', '2017-06-01 16:59:43', '2017-06-05 11:45:29', '1');
INSERT INTO `course_chapter` VALUES ('692', '93', '670', '对不良诱惑说“不”（远离黄赌毒）', '1', '2', '2017-06-01 17:00:04', '2017-06-05 11:47:30', '1');
INSERT INTO `course_chapter` VALUES ('693', '93', '671', '自由与自律（公民教育）', '1', '2', '2017-06-01 17:00:23', '2017-06-05 11:50:07', '1');
INSERT INTO `course_chapter` VALUES ('694', '93', '672', '责任与压力（公民教育）', '1', '2', '2017-06-01 17:00:42', '2017-06-05 11:51:15', '1');
INSERT INTO `course_chapter` VALUES ('697', '95', '695', '职位永远“在线”（爱岗敬业意识的培养）', '9', null, '2017-06-01 17:03:13', '2017-06-01 17:03:15', '1');
INSERT INTO `course_chapter` VALUES ('699', '95', '0', '规则，You know！（规则意识的培养与学习）', '3', '1', '2017-06-01 17:03:18', '2017-06-01 17:10:44', '1');
INSERT INTO `course_chapter` VALUES ('700', '95', '0', '说话之道大有学问（人际沟通及技巧）', '4', '1', '2017-06-01 17:03:20', '2017-06-01 17:11:24', '1');
INSERT INTO `course_chapter` VALUES ('701', '95', '0', '海阔天空成就人生（适应与耐挫）', '7', '1', '2017-06-01 17:03:21', '2017-06-05 12:04:15', '1');
INSERT INTO `course_chapter` VALUES ('702', '95', '0', '职位永远“在线”（爱岗敬业意识的培养）', '1', '1', '2017-06-01 17:03:22', '2017-06-01 17:09:29', '1');
INSERT INTO `course_chapter` VALUES ('705', '95', '0', '有一种快乐叫分享（分享）', '8', '1', '2017-06-01 17:03:24', '2017-06-01 17:13:24', '1');
INSERT INTO `course_chapter` VALUES ('708', '95', '0', '做一个靠谱的人（做事做人，诚信严谨）', '2', '1', '2017-06-01 17:03:58', '2017-06-01 17:09:59', '1');
INSERT INTO `course_chapter` VALUES ('709', '95', '0', '组好团队事半功倍（团队协作与集体观念）', '5', '1', '2017-06-01 17:03:58', '2017-06-01 17:11:59', '1');
INSERT INTO `course_chapter` VALUES ('710', '95', '0', '不能事事慢动作（执行力的培养）', '6', '1', '2017-06-01 17:03:59', '2017-06-01 17:12:37', '1');
INSERT INTO `course_chapter` VALUES ('711', '95', '0', '信息时代，你low了吗？（学会信息获取与处理）', '9', '1', '2017-06-01 17:04:00', '2017-06-01 17:14:01', '1');
INSERT INTO `course_chapter` VALUES ('712', '95', '0', '30秒，让人喜欢你（礼仪修养）', '10', '1', '2017-06-01 17:04:01', '2017-06-01 17:14:41', '1');
INSERT INTO `course_chapter` VALUES ('718', '95', '702', '职位永远“在线”（爱岗敬业意识的培养）', '1', '2', '2017-06-01 17:08:41', '2017-09-07 10:52:09', '1');
INSERT INTO `course_chapter` VALUES ('719', '95', '708', '做一个靠谱的人（做事做人，诚信严谨）', '1', '2', '2017-06-01 17:10:01', '2017-06-05 11:59:13', '1');
INSERT INTO `course_chapter` VALUES ('720', '95', '699', '规则，You know！（规则意识的培养与学习）', '1', '2', '2017-06-01 17:10:46', '2017-06-05 11:58:12', '1');
INSERT INTO `course_chapter` VALUES ('721', '95', '700', '说话之道大有学问（人际沟通及技巧）', '1', '2', '2017-06-01 17:11:25', '2017-06-05 12:00:35', '1');
INSERT INTO `course_chapter` VALUES ('722', '95', '709', '组好团队事半功倍（团队协作与集体观念）', '1', '2', '2017-06-01 17:12:01', '2017-06-05 12:02:15', '1');
INSERT INTO `course_chapter` VALUES ('723', '95', '710', '不能事事慢动作（执行力的培养）', '1', '2', '2017-06-01 17:12:38', '2017-06-05 13:37:35', '1');
INSERT INTO `course_chapter` VALUES ('724', '95', '701', '海阔天空成就人生（适应与耐挫）', '1', '2', '2017-06-01 17:13:07', '2017-06-05 12:04:16', '1');
INSERT INTO `course_chapter` VALUES ('725', '95', '705', '有一种快乐叫分享（分享）', '1', '2', '2017-06-01 17:13:25', '2017-06-05 13:41:51', '1');
INSERT INTO `course_chapter` VALUES ('726', '95', '711', '信息时代，你low了吗？（学会信息获取与处理）', '1', '2', '2017-06-01 17:14:04', '2017-06-05 13:40:26', '1');
INSERT INTO `course_chapter` VALUES ('727', '95', '712', '30秒，让人喜欢你（礼仪修养）', '1', '2', '2017-06-01 17:14:29', '2017-06-05 13:43:03', '1');
INSERT INTO `course_chapter` VALUES ('728', '96', '0', '你能教教我吗？（谦逊、虚心地学习）', null, '1', null, '2017-06-01 17:16:58', '1');
INSERT INTO `course_chapter` VALUES ('729', '96', '728', '你能教教我吗？（谦逊、虚心地学习）', '5', '2', '2017-06-01 17:16:59', '2017-06-05 10:47:18', '1');
INSERT INTO `course_chapter` VALUES ('730', '96', '0', '从每天上班不迟到做起（遵守企业制度）', '8', '1', '2017-06-01 17:17:03', '2017-06-01 17:21:51', '1');
INSERT INTO `course_chapter` VALUES ('731', '96', '0', '这件事交给我！（责任感，为抉择和行为负责）', '1', '1', '2017-06-01 17:17:25', '2017-06-01 17:18:29', '1');
INSERT INTO `course_chapter` VALUES ('732', '96', '0', '和拖延说拜拜（自由散漫、拖延问题）', '3', '1', '2017-06-01 17:17:26', '2017-06-01 17:19:14', '1');
INSERT INTO `course_chapter` VALUES ('733', '96', '0', '细节决定成败（工作细节的培养）', '2', '1', '2017-06-01 17:17:27', '2017-06-01 17:18:50', '1');
INSERT INTO `course_chapter` VALUES ('734', '96', '0', '非礼勿视，非礼勿听（尊重他人隐私）', '6', '1', '2017-06-01 17:17:28', '2017-06-01 17:20:47', '1');
INSERT INTO `course_chapter` VALUES ('735', '96', '0', '和而不同（尊重他人生活方式）', '5', '1', '2017-06-01 17:17:29', '2017-06-01 17:20:20', '1');
INSERT INTO `course_chapter` VALUES ('736', '96', '0', '我成年啦！（不过于依赖他人、培养有主见的人）', '4', '1', '2017-06-01 17:17:31', '2017-06-01 17:20:03', '1');
INSERT INTO `course_chapter` VALUES ('737', '96', '0', '我要当老板（自主创业）', '9', '1', '2017-06-01 17:17:31', '2017-06-01 17:22:17', '1');
INSERT INTO `course_chapter` VALUES ('738', '96', '0', '你的意见真不错！（学会尊重他人意见、学会赞美他人行为）', '7', '1', '2017-06-01 17:17:32', '2017-06-01 17:21:22', '1');
INSERT INTO `course_chapter` VALUES ('739', '96', '731', '这件事交给我！（责任感，为抉择和行为负责）', '1', '2', '2017-06-01 17:18:30', '2017-06-05 10:56:25', '1');
INSERT INTO `course_chapter` VALUES ('740', '96', '733', '细节决定成败（工作细节的培养）', '1', '2', '2017-06-01 17:18:51', '2017-06-05 10:58:17', '1');
INSERT INTO `course_chapter` VALUES ('741', '96', '732', '和拖延说拜拜（自由散漫、拖延问题）', '1', '2', '2017-06-01 17:19:17', '2017-06-05 11:02:06', '1');
INSERT INTO `course_chapter` VALUES ('742', '96', '736', '我成年啦！（不过于依赖他人、培养有主见的人）', '1', '2', '2017-06-01 17:20:04', '2017-06-05 11:05:13', '1');
INSERT INTO `course_chapter` VALUES ('743', '96', '735', '和而不同（尊重他人生活方式）', '1', '2', '2017-06-01 17:20:22', '2017-06-05 11:06:24', '1');
INSERT INTO `course_chapter` VALUES ('745', '96', '734', '非礼勿视，非礼勿听（尊重他人隐私）', '2', '2', '2017-06-01 17:20:49', '2017-06-05 11:08:27', '1');
INSERT INTO `course_chapter` VALUES ('746', '96', '738', '你的意见真不错！（学会尊重他人意见、学会赞美他人行为）', '1', '2', '2017-06-01 17:21:24', '2017-06-05 11:09:57', '1');
INSERT INTO `course_chapter` VALUES ('747', '96', '730', '从每天上班不迟到做起（遵守企业制度）', '1', '2', '2017-06-01 17:21:53', '2017-06-05 11:11:04', '1');
INSERT INTO `course_chapter` VALUES ('748', '96', '737', '我要当老板（自主创业）', '1', '2', '2017-06-01 17:22:10', '2017-11-27 10:03:17', '1');
INSERT INTO `course_chapter` VALUES ('749', '97', '0', '默认根目录', null, null, null, '2017-06-01 17:32:48', '1');
INSERT INTO `course_chapter` VALUES ('750', '98', '0', '第一单元 我与法律的邂逅', null, '1', null, '2017-06-02 11:29:43', '1');
INSERT INTO `course_chapter` VALUES ('751', '98', '750', '第一课 说说法律那点儿事', '1', '2', '2017-06-02 11:29:44', '2017-09-14 10:55:36', '1');
INSERT INTO `course_chapter` VALUES ('752', '98', '750', '第二课 宪法：法律的大哥大', '3', '2', '2017-06-02 11:30:38', '2017-06-05 14:51:57', '1');
INSERT INTO `course_chapter` VALUES ('753', '98', '750', '第三课 法治的理念：揭开法律的面纱', '5', '2', '2017-06-02 11:30:50', '2017-06-05 14:55:38', '1');
INSERT INTO `course_chapter` VALUES ('754', '98', '750', '第四课 公民：你不仅仅是父母的孩子', '7', '2', '2017-06-02 11:33:23', '2017-06-05 14:58:53', '1');
INSERT INTO `course_chapter` VALUES ('755', '98', '0', '第二单元 我们一家与法律的约定', '1', '1', '2017-06-02 11:34:10', '2017-06-02 11:37:53', '1');
INSERT INTO `course_chapter` VALUES ('756', '98', '755', '第一课 亲子关系：我与我的监护人', '1', '2', '2017-06-02 11:34:32', '2017-06-05 15:01:53', '1');
INSERT INTO `course_chapter` VALUES ('757', '98', '799', '第二课 婚姻法：爸爸妈妈，你们离婚了，我怎么办？', '7', '4', '2017-06-02 11:34:55', '2017-06-05 14:15:24', '0');
INSERT INTO `course_chapter` VALUES ('758', '98', '799', '第三课 继承权：我家的传家宝，有我的份吗？', '8', '4', '2017-06-02 11:35:20', '2017-06-05 14:06:27', '1');
INSERT INTO `course_chapter` VALUES ('759', '98', '799', '第四课 性侵：别把黑手伸向我', '10', '4', '2017-06-02 11:36:36', '2017-06-05 14:08:16', '1');
INSERT INTO `course_chapter` VALUES ('760', '98', '799', '第五课 家庭暴力：对爸妈的拳脚说：NO', '9', '4', '2017-06-02 11:36:58', '2017-06-05 14:10:29', '1');
INSERT INTO `course_chapter` VALUES ('761', '98', '799', '第六课 侵权：你闯祸，谁买单？', '6', '4', '2017-06-02 11:37:27', '2017-06-05 14:04:53', '1');
INSERT INTO `course_chapter` VALUES ('762', '98', '0', '第三单元 校园中的法律', '2', '1', '2017-06-02 11:37:47', '2017-06-05 14:17:49', '1');
INSERT INTO `course_chapter` VALUES ('763', '98', '762', '第一课 教育权：我上学，谁做主', '1', '2', '2017-06-02 11:39:22', '2017-06-05 16:01:10', '1');
INSERT INTO `course_chapter` VALUES ('764', '98', '762', '第二课 校园欺凌：小霸王，你别嚣张', '2', '2', '2017-06-02 11:39:42', '2017-06-05 14:31:28', '0');
INSERT INTO `course_chapter` VALUES ('765', '98', '762', '第三课 人格权：我也需要被尊重', '3', '2', '2017-06-02 11:40:06', '2017-06-05 14:30:49', '0');
INSERT INTO `course_chapter` VALUES ('766', '98', '762', '第四课 生命健康权：校园意外的救赎', '4', '2', '2017-06-02 11:40:52', '2017-06-05 14:30:47', '0');
INSERT INTO `course_chapter` VALUES ('767', '98', '762', '第五课 健康饮食权：一个馒头引发的血案', '5', '2', '2017-06-02 11:41:16', '2017-06-05 14:30:45', '0');
INSERT INTO `course_chapter` VALUES ('768', '98', '762', '第六课 财产权：我的money，你别拿', '6', '2', '2017-06-02 11:41:56', '2017-06-05 14:30:44', '0');
INSERT INTO `course_chapter` VALUES ('769', '98', '0', '第四单元 法律与社会中的我', '3', '1', '2017-06-02 11:42:16', '2017-06-02 11:44:14', '1');
INSERT INTO `course_chapter` VALUES ('770', '98', '769', '第一课 人身权：当意外发生的时候', '1', '2', '2017-06-02 11:44:15', '2017-06-05 16:16:21', '1');
INSERT INTO `course_chapter` VALUES ('771', '98', '769', '第二课 劳动权：我和打工，不得不说的故事', '2', '2', '2017-06-02 11:44:39', '2017-06-05 14:35:08', '0');
INSERT INTO `course_chapter` VALUES ('772', '98', '769', '第三课 人身权：当意外发生的时候', '3', '2', '2017-06-02 11:44:57', '2017-06-05 14:35:06', '0');
INSERT INTO `course_chapter` VALUES ('773', '98', '769', '第四课 保险法：保驾护航伴我行', '4', '2', '2017-06-02 11:45:14', '2017-06-05 14:34:42', '0');
INSERT INTO `course_chapter` VALUES ('774', '98', '769', '第五课 知识产权：我的发明我做主', '5', '2', '2017-06-02 11:45:35', '2017-06-05 14:34:40', '0');
INSERT INTO `course_chapter` VALUES ('775', '98', '769', '第六课 网络法律规则：法“网”恢恢，切勿网游人生', '6', '2', '2017-06-02 11:45:53', '2017-06-05 14:34:39', '0');
INSERT INTO `course_chapter` VALUES ('776', '98', '769', '第七课 司法程序的特殊保护：程序正义，与我息息相关', '7', '2', '2017-06-02 11:46:36', '2017-06-05 14:34:37', '0');
INSERT INTO `course_chapter` VALUES ('777', '98', '769', '第八课 依法维权：自助者，法助', '8', '2', '2017-06-02 11:47:10', '2017-06-05 14:34:36', '0');
INSERT INTO `course_chapter` VALUES ('778', '98', '0', '第五单元 珍爱自己 远离犯罪', '4', '1', '2017-06-02 11:47:37', '2017-06-02 11:49:12', '1');
INSERT INTO `course_chapter` VALUES ('779', '98', '778', '第一课 人身权利犯罪：命丧黄泉路，事起小争端', '1', '2', '2017-06-02 11:48:58', '2017-06-05 16:37:01', '1');
INSERT INTO `course_chapter` VALUES ('780', '98', '778', '第二课 财产权：君子爱财，取之有道', '2', '2', '2017-06-02 11:49:54', '2017-06-05 14:37:52', '0');
INSERT INTO `course_chapter` VALUES ('781', '98', '778', '第三课 毒品犯罪：不要把灵魂出卖给毒魔', '3', '2', '2017-06-02 11:50:12', '2017-06-05 14:37:51', '0');
INSERT INTO `course_chapter` VALUES ('782', '98', '778', '第四课 共同犯罪：“桃园结义”须讲法', '4', '2', '2017-06-02 11:50:34', '2017-06-05 14:37:49', '0');
INSERT INTO `course_chapter` VALUES ('783', '98', '778', '第五课 犯罪预防：冲动是魔鬼', '5', '2', '2017-06-02 11:50:57', '2017-06-05 14:37:47', '0');
INSERT INTO `course_chapter` VALUES ('784', '98', '778', '第六课 正当防卫与紧急避险：两害相较取其轻，两利相较取其重', '6', '2', '2017-06-02 11:51:16', '2017-06-05 14:37:45', '0');
INSERT INTO `course_chapter` VALUES ('785', '98', '0', '第六单元 法治中国：我与法律约定一生', '5', '1', '2017-06-02 11:52:11', '2017-06-02 11:53:24', '1');
INSERT INTO `course_chapter` VALUES ('786', '98', '785', '第一课 契约精神：诚信守法从不作弊开始', '1', '2', '2017-06-02 11:52:18', '2017-06-05 16:51:55', '1');
INSERT INTO `course_chapter` VALUES ('787', '98', '785', '第二课 中国梦：复兴之路，法律点灯', '2', '2', '2017-06-02 11:53:49', '2017-06-05 14:35:44', '0');
INSERT INTO `course_chapter` VALUES ('790', '98', '750', '第一课 说说法律那点儿事（说课）', '2', '2', '2017-06-05 13:58:41', '2017-09-14 10:57:41', '1');
INSERT INTO `course_chapter` VALUES ('791', '98', '750', '第二课 宪法：法律的大哥大（说课）', '4', '2', '2017-06-05 13:59:13', '2017-06-05 14:53:42', '1');
INSERT INTO `course_chapter` VALUES ('792', '98', '750', '第三课 法治的理念：揭开法律的面纱（说课）', '6', '2', '2017-06-05 13:59:31', '2017-06-05 14:54:45', '1');
INSERT INTO `course_chapter` VALUES ('793', '98', '750', '第四课 公民：你不仅仅是父母的孩子（说课）', '8', '2', '2017-06-05 13:59:55', '2017-06-05 14:59:33', '1');
INSERT INTO `course_chapter` VALUES ('794', '98', '755', '第一课 亲子关系：我与我的监护人（说课）', '2', '2', '2017-06-05 14:01:27', '2017-06-05 15:00:29', '1');
INSERT INTO `course_chapter` VALUES ('795', '98', '799', '第二课 婚姻法：爸爸妈妈，你们离婚了，我怎么办？（说课）', '4', '4', '2017-06-05 14:01:38', '2017-06-05 14:15:22', '0');
INSERT INTO `course_chapter` VALUES ('796', '98', '799', '第三课 继承权：我家的传家宝，有我的份吗？（说课）', '2', '4', '2017-06-05 14:01:48', '2017-06-05 14:01:58', '1');
INSERT INTO `course_chapter` VALUES ('797', '98', '799', '第四课 性侵：别把黑手伸向我（说课）', '11', '4', '2017-06-05 14:02:02', '2017-06-05 14:02:09', '1');
INSERT INTO `course_chapter` VALUES ('798', '98', '799', '第五课 家庭暴力：对爸妈的拳脚说：NO（说课）', '5', '4', '2017-06-05 14:02:13', '2017-06-05 14:02:22', '1');
INSERT INTO `course_chapter` VALUES ('799', '98', '815', '第六课 侵权：你闯祸，谁买单？（说课）', '12', '3', '2017-06-05 14:02:26', '2017-06-05 14:02:33', '1');
INSERT INTO `course_chapter` VALUES ('800', '98', '755', '第二课 家庭暴力：对爸妈的拳脚说NO！', '3', '2', '2017-06-05 14:13:37', '2017-06-05 15:46:44', '1');
INSERT INTO `course_chapter` VALUES ('801', '98', '755', '第二课 家庭暴力：对爸妈的拳脚说NO！（说课）', '4', '2', '2017-06-05 14:13:39', '2017-06-05 15:47:38', '1');
INSERT INTO `course_chapter` VALUES ('802', '98', '755', '第三课 性侵：别把黑手伸向我', '5', '2', '2017-06-05 14:13:40', '2017-06-06 11:47:56', '1');
INSERT INTO `course_chapter` VALUES ('803', '98', '755', '第三课 性侵：别把黑手伸向我（说课）', '6', '2', '2017-06-05 14:13:40', '2017-06-05 15:49:05', '1');
INSERT INTO `course_chapter` VALUES ('804', '98', '755', '第四课 继承权：我家的传家宝，有我的份吗？', '7', '2', '2017-06-05 14:13:41', '2017-06-05 15:52:55', '1');
INSERT INTO `course_chapter` VALUES ('805', '98', '755', '第四课 继承权：我家的传家宝，有我的份吗？（说课）', '8', '2', '2017-06-05 14:13:42', '2017-06-05 15:53:43', '1');
INSERT INTO `course_chapter` VALUES ('806', '98', '755', '第五课 侵权：你闯祸，谁买单？', '9', '2', '2017-06-05 14:13:43', '2017-06-05 15:56:18', '1');
INSERT INTO `course_chapter` VALUES ('808', '98', '755', '第六课 婚姻法：爸爸妈妈，你们离了，我怎么办？（说课）', '16', '2', '2017-06-05 14:13:45', '2017-06-05 15:58:44', '1');
INSERT INTO `course_chapter` VALUES ('811', '98', '755', '第五课 侵权：你闯祸，谁买单？（说课）', '10', '2', '2017-06-05 14:14:11', '2017-06-05 15:54:45', '1');
INSERT INTO `course_chapter` VALUES ('812', '98', '755', '第六课 婚姻法：爸爸妈妈，你们离了，我怎么办？', '15', '2', '2017-06-05 14:14:12', '2017-06-05 15:58:06', '1');
INSERT INTO `course_chapter` VALUES ('818', '98', '762', '第一课 教育权：我上学，谁做主（说课）', '7', '2', '2017-06-05 14:28:06', '2017-06-05 15:59:46', '1');
INSERT INTO `course_chapter` VALUES ('819', '98', '762', '第二课 人格权：我也需要被尊重', '8', '2', '2017-06-05 14:28:07', '2017-06-05 16:02:51', '1');
INSERT INTO `course_chapter` VALUES ('820', '98', '762', '第二课 人格权：我也需要被尊重（说课）', '9', '2', '2017-06-05 14:28:08', '2017-06-05 16:03:41', '1');
INSERT INTO `course_chapter` VALUES ('821', '98', '762', '第三课 生命健康权：校园意外的救赎', '10', '2', '2017-06-05 14:28:09', '2017-06-05 16:06:44', '1');
INSERT INTO `course_chapter` VALUES ('822', '98', '762', '第三课 生命健康权：校园意外的救赎（说课）', '11', '2', '2017-06-05 14:28:10', '2017-06-05 16:05:24', '1');
INSERT INTO `course_chapter` VALUES ('823', '98', '762', '第四课 健康饮食权：一个馒头引发的血案', '12', '2', '2017-06-05 14:28:11', '2017-06-05 16:08:31', '1');
INSERT INTO `course_chapter` VALUES ('824', '98', '762', '第四课 健康饮食权：一个馒头引发的血案（说课）', '13', '2', '2017-06-05 14:28:12', '2017-06-05 16:09:29', '1');
INSERT INTO `course_chapter` VALUES ('825', '98', '762', '第五课 财产权：我的money,你别拿！', '14', '2', '2017-06-05 14:28:12', '2017-06-05 16:11:45', '1');
INSERT INTO `course_chapter` VALUES ('826', '98', '762', '第五课 财产权：我的money,你别拿！（说课）', '15', '2', '2017-06-05 14:28:13', '2017-06-05 16:10:25', '1');
INSERT INTO `course_chapter` VALUES ('827', '98', '762', '第六课 校园欺凌：小霸王，你别嚣张', '16', '2', '2017-06-05 14:28:15', '2017-06-05 16:13:23', '1');
INSERT INTO `course_chapter` VALUES ('828', '98', '762', '第六课 校园欺凌：小霸王，你别嚣张（说课）', '17', '2', '2017-06-05 14:28:18', '2017-06-05 16:14:22', '1');
INSERT INTO `course_chapter` VALUES ('829', '98', '769', '第一课 人身权：当意外发生的时候（说课）', '9', '2', '2017-06-05 14:32:22', '2017-06-05 16:17:01', '1');
INSERT INTO `course_chapter` VALUES ('830', '98', '769', '第二课 隐私权：我的日记，你能看吗？', '10', '2', '2017-06-05 14:32:23', '2017-06-05 16:19:11', '1');
INSERT INTO `course_chapter` VALUES ('831', '98', '769', '第二课 隐私权：我的日记，你能看吗？（说课）', '11', '2', '2017-06-05 14:32:23', '2017-06-05 16:17:51', '1');
INSERT INTO `course_chapter` VALUES ('832', '98', '769', '第三课 知识产权：我的发明我做主', '12', '2', '2017-06-05 14:32:24', '2017-06-05 16:20:45', '1');
INSERT INTO `course_chapter` VALUES ('833', '98', '769', '第三课 知识产权：我的发明我做主（说课）', '13', '2', '2017-06-05 14:32:25', '2017-06-05 16:21:51', '1');
INSERT INTO `course_chapter` VALUES ('834', '98', '769', '第四课 劳动权：我和打工，不得不说的故事', '14', '2', '2017-06-05 14:32:26', '2017-06-05 16:25:07', '1');
INSERT INTO `course_chapter` VALUES ('835', '98', '769', '第四课 劳动权：我和打工，不得不说的故事（说课）', '15', '2', '2017-06-05 14:32:27', '2017-06-05 16:23:11', '1');
INSERT INTO `course_chapter` VALUES ('836', '98', '769', '第五课 保险法：保驾护航伴我行', '16', '2', '2017-06-05 14:32:28', '2017-06-05 16:27:05', '1');
INSERT INTO `course_chapter` VALUES ('837', '98', '769', '第五课 保险法：保驾护航伴我行（说课）', '17', '2', '2017-06-05 14:32:29', '2017-06-05 16:27:56', '1');
INSERT INTO `course_chapter` VALUES ('838', '98', '769', '第六课 网络法律准则：法“网”恢恢，切勿网游人生', '18', '2', '2017-06-05 14:32:30', '2017-06-05 16:30:41', '1');
INSERT INTO `course_chapter` VALUES ('839', '98', '769', '第六课 网络法律规则：法“网”恢恢，切勿网游人生（说课）', '19', '2', '2017-06-05 14:32:33', '2017-06-05 16:29:34', '1');
INSERT INTO `course_chapter` VALUES ('840', '98', '769', '第七课 司法程序的特殊保护：程序正义，与我息息相关', '20', '2', '2017-06-05 14:32:35', '2017-06-05 16:33:30', '1');
INSERT INTO `course_chapter` VALUES ('841', '98', '769', '第七课 司法程序的特殊保护：程序正义，与我息息相关（说课）', '21', '2', '2017-06-05 14:32:37', '2017-06-05 16:34:18', '1');
INSERT INTO `course_chapter` VALUES ('842', '98', '769', '第八课 依法维权：自助者，法助', '22', '2', '2017-06-05 14:32:39', '2017-06-05 16:33:42', '0');
INSERT INTO `course_chapter` VALUES ('843', '98', '769', '第八课 依法维权：自助者，法助（说课）', '23', '2', '2017-06-05 14:32:42', '2017-06-05 16:33:40', '0');
INSERT INTO `course_chapter` VALUES ('844', '98', '785', '第一课 契约精神：诚信守法从不作弊开始（说课）', '2', '2', '2017-06-05 14:35:25', '2017-06-05 16:50:00', '1');
INSERT INTO `course_chapter` VALUES ('845', '98', '785', '第二课 规则意识：自助者，法助', '3', '2', '2017-06-05 14:35:26', '2017-06-05 16:56:09', '1');
INSERT INTO `course_chapter` VALUES ('846', '98', '785', '第二课 规则意识：自助者，法助（说课）', '4', '2', '2017-06-05 14:35:27', '2017-06-05 16:57:34', '1');
INSERT INTO `course_chapter` VALUES ('847', '98', '778', '第一课 人身权利犯罪：命丧黄泉路，事起小争端（说课）', '7', '2', '2017-06-05 14:36:19', '2017-06-05 16:35:28', '1');
INSERT INTO `course_chapter` VALUES ('848', '98', '778', '第二课 财产犯罪：君子爱财，取之有道', '8', '2', '2017-06-05 14:36:20', '2017-06-05 16:38:59', '1');
INSERT INTO `course_chapter` VALUES ('849', '98', '778', '第二课 财产犯罪：君子爱财，取之有道（说课）', '9', '2', '2017-06-05 14:36:21', '2017-06-05 16:39:47', '1');
INSERT INTO `course_chapter` VALUES ('850', '98', '778', '第三课 毒品犯罪：不要把灵魂出卖给毒魔', '10', '2', '2017-06-05 14:36:22', '2017-06-05 16:42:22', '1');
INSERT INTO `course_chapter` VALUES ('851', '98', '778', '第三课 毒品犯罪：不要把灵魂出卖给毒魔（说课）', '11', '2', '2017-06-05 14:36:23', '2017-06-05 16:40:32', '1');
INSERT INTO `course_chapter` VALUES ('852', '98', '778', '第四课 共同犯罪：“桃园结义”须讲法', '12', '2', '2017-06-05 14:36:24', '2017-06-05 16:43:29', '1');
INSERT INTO `course_chapter` VALUES ('853', '98', '778', '第四课 共同犯罪：“桃园结义”须讲法（说课）', '13', '2', '2017-06-05 14:36:25', '2017-06-06 11:51:57', '1');
INSERT INTO `course_chapter` VALUES ('854', '98', '778', '第五课 犯罪预防：冲动是魔鬼', '14', '2', '2017-06-05 14:36:26', '2017-06-05 16:46:32', '1');
INSERT INTO `course_chapter` VALUES ('855', '98', '778', '第五课 犯罪预防：冲动是魔鬼（说课）', '15', '2', '2017-06-05 14:36:27', '2017-06-05 16:45:14', '1');
INSERT INTO `course_chapter` VALUES ('856', '98', '778', '第六课 正当防卫与紧急避险：两害相较取其轻，两利相较取其重', '16', '2', '2017-06-05 14:36:29', '2017-06-05 16:48:02', '1');
INSERT INTO `course_chapter` VALUES ('857', '98', '778', '第六课 正当防卫与紧急避险：两害相较取其轻，两利相较取其重（说课）', '17', '2', '2017-06-05 14:36:32', '2017-06-05 16:48:47', '1');
INSERT INTO `course_chapter` VALUES ('858', '92', '642', '团结友爱', '2', '2', '2017-06-05 15:03:10', '2017-06-05 15:03:46', '0');
INSERT INTO `course_chapter` VALUES ('859', '92', '0', '团结友爱创美誉（文明礼仪）', '3', '1', '2017-06-05 15:04:53', '2017-06-05 15:13:30', '0');
INSERT INTO `course_chapter` VALUES ('860', '92', '859', '团结友爱创美誉（文明礼仪）', '1', '2', '2017-06-05 15:05:19', '2017-06-05 15:10:55', '1');
INSERT INTO `course_chapter` VALUES ('861', '92', '0', '团结友爱创美誉(文明礼仪)', '12', '1', '2017-06-05 15:13:57', '2017-06-05 15:14:20', '1');
INSERT INTO `course_chapter` VALUES ('862', '92', '861', '团结友爱创美誉(文明礼仪)', '1', '2', '2017-06-05 15:14:39', '2017-06-05 15:15:49', '1');
INSERT INTO `course_chapter` VALUES ('863', '98', '785', '第三课 中国梦:复兴之路，法律点灯', '5', '2', '2017-06-05 16:57:40', '2017-06-05 17:00:06', '1');
INSERT INTO `course_chapter` VALUES ('864', '98', '785', '第三课 中国梦:复兴之路，法律点灯（说课）', '6', '2', '2017-06-05 16:57:52', '2017-06-05 16:58:33', '1');
INSERT INTO `course_chapter` VALUES ('865', '91', '605', '适应新环境', '1', '2', '2017-06-06 11:18:36', '2017-06-06 11:22:13', '1');
INSERT INTO `course_chapter` VALUES ('866', '93', '675', '绿色校园，低碳生活（和谐校园）', '2', '2', '2017-06-06 11:32:02', '2017-06-06 11:36:32', '1');
INSERT INTO `course_chapter` VALUES ('867', '100', '0', '默认根目录', null, null, null, '2017-09-05 10:56:14', '0');
INSERT INTO `course_chapter` VALUES ('869', '100', '0', '第一章 乡情篇', '1', '1', '2017-09-05 10:55:50', '2017-09-05 11:01:33', '1');
INSERT INTO `course_chapter` VALUES ('870', '100', '0', '第二章 爱国篇', '2', '1', '2017-09-05 10:55:51', '2017-09-05 11:02:59', '1');
INSERT INTO `course_chapter` VALUES ('871', '100', '0', '第三章 生命篇', '3', '1', '2017-09-05 10:55:51', '2017-09-05 11:04:29', '1');
INSERT INTO `course_chapter` VALUES ('872', '100', '0', '第四章 感恩篇', '4', '1', '2017-09-05 10:55:52', '2017-09-05 11:36:01', '1');
INSERT INTO `course_chapter` VALUES ('873', '100', '0', '第五章 修德篇', '5', '1', '2017-09-05 10:55:58', '2017-09-05 11:37:15', '1');
INSERT INTO `course_chapter` VALUES ('874', '100', '0', '第六章 立志篇', '6', '1', '2017-09-05 10:55:58', '2017-09-05 11:38:51', '1');
INSERT INTO `course_chapter` VALUES ('875', '100', '0', '第十四章 意志篇', '13', '1', '2017-09-05 10:55:59', '2017-09-05 11:48:07', '1');
INSERT INTO `course_chapter` VALUES ('876', '100', '0', '第十五章 廉洁篇', '14', '1', '2017-09-05 10:56:00', '2017-09-05 11:49:12', '1');
INSERT INTO `course_chapter` VALUES ('877', '100', '0', '第十六章 环保篇', '15', '1', '2017-09-05 10:56:01', '2017-09-05 11:50:30', '1');
INSERT INTO `course_chapter` VALUES ('878', '100', '0', '第十七章 安全篇', '16', '1', '2017-09-05 10:56:01', '2017-09-06 00:14:04', '1');
INSERT INTO `course_chapter` VALUES ('879', '100', '0', '第九章 技艺篇', '9', '1', '2017-09-05 10:56:30', '2017-09-05 11:43:22', '1');
INSERT INTO `course_chapter` VALUES ('880', '100', '0', '第八章 仁爱篇', '8', '1', '2017-09-05 10:56:31', '2017-09-05 11:41:40', '1');
INSERT INTO `course_chapter` VALUES ('881', '100', '0', '第七章 礼仪篇', '8', '1', '2017-09-05 10:56:32', '2017-09-05 11:40:33', '1');
INSERT INTO `course_chapter` VALUES ('882', '100', '0', '第十三章 敬业篇', '12', '1', '2017-09-05 10:56:33', '2017-09-05 11:46:38', '1');
INSERT INTO `course_chapter` VALUES ('883', '100', '0', '第十章 诚信篇', '10', '1', '2017-09-05 10:56:34', '2017-09-05 11:44:27', '1');
INSERT INTO `course_chapter` VALUES ('884', '100', '0', '第十二章 责任篇', '11', '1', '2017-09-05 10:56:40', '2017-09-05 11:45:32', '1');
INSERT INTO `course_chapter` VALUES ('885', '100', '868', 'é¢ä¹¡ä¹æ', '1', '2', '2017-09-05 10:57:12', '2017-09-05 10:59:32', '1');
INSERT INTO `course_chapter` VALUES ('886', '100', '868', '爱的', '2', null, '2017-09-05 10:57:14', '2017-09-05 11:01:22', '1');
INSERT INTO `course_chapter` VALUES ('888', '100', '869', '颂乡之情', '1', '2', '2017-09-05 11:01:36', '2017-09-05 11:15:42', '1');
INSERT INTO `course_chapter` VALUES ('889', '100', '869', '颂乡之情（说课）', '2', '2', '2017-09-05 11:01:52', '2017-09-05 11:58:13', '1');
INSERT INTO `course_chapter` VALUES ('890', '100', '869', '别乡之情', '3', '2', '2017-09-05 11:02:10', '2017-09-05 11:59:44', '1');
INSERT INTO `course_chapter` VALUES ('891', '100', '869', '别乡之情（说课）', '4', '2', '2017-09-05 11:02:11', '2017-09-05 12:01:29', '1');
INSERT INTO `course_chapter` VALUES ('892', '100', '869', '思乡之情', '5', '2', '2017-09-05 11:02:12', '2017-09-05 12:02:47', '1');
INSERT INTO `course_chapter` VALUES ('893', '100', '869', '思乡之情（说课）', '6', '2', '2017-09-05 11:02:12', '2017-09-05 12:13:23', '1');
INSERT INTO `course_chapter` VALUES ('894', '100', '870', '疆土之爱', '1', '2', '2017-09-05 11:03:03', '2017-09-14 11:00:21', '1');
INSERT INTO `course_chapter` VALUES ('895', '100', '870', '疆土之爱（说课）', '2', '2', '2017-09-05 11:03:04', '2017-09-14 11:02:04', '1');
INSERT INTO `course_chapter` VALUES ('896', '100', '870', '人民之爱', '3', '2', '2017-09-05 11:03:05', '2017-09-05 12:18:31', '1');
INSERT INTO `course_chapter` VALUES ('897', '100', '870', '人民之爱（说课）', '4', '2', '2017-09-05 11:03:06', '2017-09-05 12:20:58', '1');
INSERT INTO `course_chapter` VALUES ('898', '100', '870', '匹夫之爱', '5', '2', '2017-09-05 11:03:07', '2017-09-05 12:22:23', '1');
INSERT INTO `course_chapter` VALUES ('899', '100', '870', '匹夫之爱（说课）', '6', '2', '2017-09-05 11:03:08', '2017-09-05 12:23:39', '1');
INSERT INTO `course_chapter` VALUES ('900', '100', '871', '生命可贵', '1', '2', '2017-09-05 11:04:00', '2017-09-05 12:24:39', '1');
INSERT INTO `course_chapter` VALUES ('901', '100', '871', '生命可贵（说课）', '2', '2', '2017-09-05 11:04:01', '2017-09-05 12:25:37', '1');
INSERT INTO `course_chapter` VALUES ('902', '100', '871', '惜时勤学', '3', '2', '2017-09-05 11:04:02', '2017-09-05 12:26:05', '1');
INSERT INTO `course_chapter` VALUES ('903', '100', '871', '惜时勤学（说课）', '4', '2', '2017-09-05 11:04:03', '2017-09-05 12:27:29', '1');
INSERT INTO `course_chapter` VALUES ('904', '100', '871', '生命绽放', '5', '2', '2017-09-05 11:04:03', '2017-09-05 12:28:07', '1');
INSERT INTO `course_chapter` VALUES ('905', '100', '871', '生命绽放（说课）', '6', '2', '2017-09-05 11:04:05', '2017-09-05 12:29:16', '1');
INSERT INTO `course_chapter` VALUES ('906', '100', '872', '以孝事亲', '1', '2', '2017-09-05 11:36:04', '2017-09-05 12:29:45', '1');
INSERT INTO `course_chapter` VALUES ('907', '100', '872', '以孝事亲（说课）', '2', '2', '2017-09-05 11:36:05', '2017-09-05 12:30:46', '1');
INSERT INTO `course_chapter` VALUES ('908', '100', '872', '亲师信道', '3', '2', '2017-09-05 11:36:05', '2017-09-05 12:31:15', '1');
INSERT INTO `course_chapter` VALUES ('909', '100', '872', '亲师信道（说课）', '4', '2', '2017-09-05 11:36:06', '2017-09-05 12:32:13', '1');
INSERT INTO `course_chapter` VALUES ('910', '100', '872', '兄友弟恭', '5', '2', '2017-09-05 11:36:07', '2017-09-05 12:36:15', '1');
INSERT INTO `course_chapter` VALUES ('911', '100', '872', '兄友弟恭（说课）', '6', '2', '2017-09-05 11:36:08', '2017-09-05 12:37:50', '1');
INSERT INTO `course_chapter` VALUES ('912', '100', '873', '个人品德', '1', '2', '2017-09-05 11:37:21', '2017-09-05 12:39:15', '1');
INSERT INTO `course_chapter` VALUES ('913', '100', '873', '个人品德（说课）', '2', '2', '2017-09-05 11:37:22', '2017-09-05 12:40:13', '1');
INSERT INTO `course_chapter` VALUES ('914', '100', '873', '家庭美德', '3', '2', '2017-09-05 11:37:25', '2017-09-05 12:41:00', '1');
INSERT INTO `course_chapter` VALUES ('915', '100', '873', '家庭美德（说课）', '4', '2', '2017-09-05 11:37:26', '2017-09-05 12:41:57', '1');
INSERT INTO `course_chapter` VALUES ('916', '100', '873', '交往之德', '5', '2', '2017-09-05 11:37:26', '2017-09-05 12:42:16', '1');
INSERT INTO `course_chapter` VALUES ('917', '100', '873', '交往之德（说课）', '6', '2', '2017-09-05 11:37:27', '2017-09-05 12:43:13', '1');
INSERT INTO `course_chapter` VALUES ('918', '100', '874', '读书之志', '1', '2', '2017-09-05 11:38:58', '2017-09-05 12:43:57', '1');
INSERT INTO `course_chapter` VALUES ('919', '100', '874', '读书之志（说课）', '2', '2', '2017-09-05 11:38:59', '2017-09-05 12:44:58', '1');
INSERT INTO `course_chapter` VALUES ('920', '100', '874', '立业之志', '3', '2', '2017-09-05 11:38:59', '2017-09-05 12:45:54', '1');
INSERT INTO `course_chapter` VALUES ('921', '100', '874', '立业之志（说课）', '4', '2', '2017-09-05 11:39:00', '2017-09-05 12:46:50', '1');
INSERT INTO `course_chapter` VALUES ('922', '100', '874', '报国之志', '5', '2', '2017-09-05 11:39:01', '2017-09-05 12:47:19', '1');
INSERT INTO `course_chapter` VALUES ('923', '100', '874', '报国之志（说课）', '6', '2', '2017-09-05 11:39:02', '2017-09-05 12:48:21', '1');
INSERT INTO `course_chapter` VALUES ('924', '100', '881', '政治之礼', '1', '2', '2017-09-05 11:40:35', '2017-09-05 23:34:52', '1');
INSERT INTO `course_chapter` VALUES ('925', '100', '881', '政治之礼（说课）', '2', '2', '2017-09-05 11:40:36', '2017-09-05 23:36:09', '1');
INSERT INTO `course_chapter` VALUES ('926', '100', '881', '生活之礼', '3', '2', '2017-09-05 11:40:37', '2017-09-05 23:36:30', '1');
INSERT INTO `course_chapter` VALUES ('927', '100', '881', '生活之礼（说课）', '4', '2', '2017-09-05 11:40:38', '2017-09-05 23:37:53', '1');
INSERT INTO `course_chapter` VALUES ('928', '100', '881', '个人之礼', '5', '2', '2017-09-05 11:40:39', '2017-09-05 23:38:39', '1');
INSERT INTO `course_chapter` VALUES ('929', '100', '881', '个人之礼（说课）', '6', '2', '2017-09-05 11:40:40', '2017-09-05 23:39:47', '1');
INSERT INTO `course_chapter` VALUES ('930', '100', '880', '仁爱之心', '1', '2', '2017-09-05 11:41:43', '2017-09-05 23:40:38', '1');
INSERT INTO `course_chapter` VALUES ('931', '100', '880', '仁爱之心（说课）', '2', '2', '2017-09-05 11:41:44', '2017-09-05 23:41:41', '1');
INSERT INTO `course_chapter` VALUES ('932', '100', '880', '自我之爱', '3', '2', '2017-09-05 11:41:45', '2017-09-05 23:42:51', '1');
INSERT INTO `course_chapter` VALUES ('933', '100', '880', '自我之爱（说课）', '4', '2', '2017-09-05 11:41:45', '2017-09-05 23:44:59', '1');
INSERT INTO `course_chapter` VALUES ('934', '100', '880', '亲人之爱', '5', '2', '2017-09-05 11:41:46', '2017-09-05 23:51:07', '1');
INSERT INTO `course_chapter` VALUES ('935', '100', '880', '亲人之爱（说课）', '6', '2', '2017-09-05 11:41:47', '2017-09-05 23:52:01', '1');
INSERT INTO `course_chapter` VALUES ('936', '100', '880', '众人之爱', '7', '2', '2017-09-05 11:41:48', '2017-09-05 23:53:20', '1');
INSERT INTO `course_chapter` VALUES ('937', '100', '880', '众人之爱（说课）', '8', '2', '2017-09-05 11:41:49', '2017-09-05 23:54:17', '1');
INSERT INTO `course_chapter` VALUES ('938', '100', '880', '万物之爱', '9', '2', '2017-09-05 11:41:50', '2017-09-05 23:54:39', '1');
INSERT INTO `course_chapter` VALUES ('939', '100', '880', '万物之爱（说课）', '10', '2', '2017-09-05 11:41:50', '2017-09-05 23:55:38', '1');
INSERT INTO `course_chapter` VALUES ('940', '100', '879', '利在千秋', '1', '2', '2017-09-05 11:43:26', '2017-09-05 23:56:32', '1');
INSERT INTO `course_chapter` VALUES ('941', '100', '879', '利在千秋（说课）', '2', '2', '2017-09-05 11:43:27', '2017-09-05 23:57:55', '1');
INSERT INTO `course_chapter` VALUES ('942', '100', '879', '名垂青史', '3', '2', '2017-09-05 11:43:28', '2017-09-05 23:59:12', '1');
INSERT INTO `course_chapter` VALUES ('943', '100', '879', '名垂青史（说课）', '4', '2', '2017-09-05 11:43:29', '2017-09-06 00:00:19', '1');
INSERT INTO `course_chapter` VALUES ('944', '100', '879', '业精于勤', '5', '2', '2017-09-05 11:43:30', '2017-09-06 00:02:07', '1');
INSERT INTO `course_chapter` VALUES ('945', '100', '879', '业精于勤（说课）', '6', '2', '2017-09-05 11:43:30', '2017-09-06 00:03:45', '1');
INSERT INTO `course_chapter` VALUES ('946', '100', '883', '诚信之重', '1', '2', '2017-09-05 11:44:32', '2017-09-06 00:04:38', '1');
INSERT INTO `course_chapter` VALUES ('947', '100', '883', '诚信之重（说课）', '2', '2', '2017-09-05 11:44:32', '2017-09-06 00:05:39', '1');
INSERT INTO `course_chapter` VALUES ('948', '100', '883', '诚信立人', '3', '2', '2017-09-05 11:44:33', '2017-09-06 00:06:22', '1');
INSERT INTO `course_chapter` VALUES ('949', '100', '883', '诚信立人（说课）', '4', '2', '2017-09-05 11:44:34', '2017-09-06 00:08:58', '1');
INSERT INTO `course_chapter` VALUES ('950', '100', '883', '诚信立业', '5', '2', '2017-09-05 11:44:35', '2017-09-06 00:09:16', '1');
INSERT INTO `course_chapter` VALUES ('951', '100', '883', '诚信立业（说课）', '6', '2', '2017-09-05 11:44:35', '2017-09-06 00:10:27', '1');
INSERT INTO `course_chapter` VALUES ('952', '100', '884', '责任之心', '1', '2', '2017-09-05 11:45:37', '2017-09-06 00:29:44', '1');
INSERT INTO `course_chapter` VALUES ('953', '100', '884', '责任之心（说课）', '2', '2', '2017-09-05 11:45:39', '2017-09-06 00:31:17', '1');
INSERT INTO `course_chapter` VALUES ('954', '100', '884', '善于负责', '3', '2', '2017-09-05 11:45:40', '2017-09-06 00:31:48', '1');
INSERT INTO `course_chapter` VALUES ('955', '100', '884', '善于负责（说课）', '4', '2', '2017-09-05 11:45:41', '2017-09-06 00:32:46', '1');
INSERT INTO `course_chapter` VALUES ('956', '100', '884', '勇于担责', '5', '2', '2017-09-05 11:45:42', '2017-09-06 00:33:26', '1');
INSERT INTO `course_chapter` VALUES ('957', '100', '884', '勇于担责（说课）', '6', '2', '2017-09-05 11:45:43', '2017-09-06 00:34:12', '1');
INSERT INTO `course_chapter` VALUES ('958', '100', '882', '敬业爱岗', '1', '2', '2017-09-05 11:46:45', '2017-09-06 00:37:26', '1');
INSERT INTO `course_chapter` VALUES ('959', '100', '882', '敬业爱岗（说课）', '2', '2', '2017-09-05 11:46:47', '2017-09-06 00:37:48', '1');
INSERT INTO `course_chapter` VALUES ('960', '100', '882', '敬业乐群', '3', '2', '2017-09-05 11:46:49', '2017-09-06 00:38:09', '1');
INSERT INTO `course_chapter` VALUES ('961', '100', '882', '敬业乐群（说课）', '4', '2', '2017-09-05 11:46:52', '2017-09-06 00:39:28', '1');
INSERT INTO `course_chapter` VALUES ('962', '100', '882', '敬业奉献', '5', '2', '2017-09-05 11:46:53', '2017-09-06 00:40:20', '1');
INSERT INTO `course_chapter` VALUES ('963', '100', '882', '敬业奉献（说课）', '6', '2', '2017-09-05 11:46:54', '2017-09-06 00:41:41', '1');
INSERT INTO `course_chapter` VALUES ('964', '100', '875', '知行合一', '1', '2', '2017-09-05 11:48:10', '2017-09-06 00:42:08', '1');
INSERT INTO `course_chapter` VALUES ('965', '100', '875', '知行合一（说课）', '2', '2', '2017-09-05 11:48:11', '2017-09-06 00:43:11', '1');
INSERT INTO `course_chapter` VALUES ('966', '100', '875', '自强不息', '3', '2', '2017-09-05 11:48:11', '2017-09-06 00:43:28', '1');
INSERT INTO `course_chapter` VALUES ('967', '100', '875', '自强不息（说课）', '4', '2', '2017-09-05 11:48:12', '2017-09-06 00:44:32', '1');
INSERT INTO `course_chapter` VALUES ('968', '100', '875', '持之以恒', '5', '2', '2017-09-05 11:48:13', '2017-09-06 00:44:54', '1');
INSERT INTO `course_chapter` VALUES ('969', '100', '875', '持之以恒（说课）', '6', '2', '2017-09-05 11:48:14', '2017-09-06 00:45:56', '1');
INSERT INTO `course_chapter` VALUES ('970', '100', '876', '一心为民', '1', '2', '2017-09-05 11:49:16', '2017-09-06 00:46:25', '1');
INSERT INTO `course_chapter` VALUES ('971', '100', '876', '一心为民（说课）', '2', '2', '2017-09-05 11:49:17', '2017-09-06 00:47:18', '1');
INSERT INTO `course_chapter` VALUES ('972', '100', '876', '大公无私', '3', '2', '2017-09-05 11:49:18', '2017-09-06 00:47:39', '1');
INSERT INTO `course_chapter` VALUES ('973', '100', '876', '大公无私（说课）', '4', '2', '2017-09-05 11:49:19', '2017-09-06 00:48:57', '1');
INSERT INTO `course_chapter` VALUES ('974', '100', '876', '公正刚直', '5', '2', '2017-09-05 11:49:20', '2017-09-06 00:49:43', '1');
INSERT INTO `course_chapter` VALUES ('975', '100', '876', '公正刚直（说课）', '6', '2', '2017-09-05 11:49:21', '2017-09-06 00:50:42', '1');
INSERT INTO `course_chapter` VALUES ('976', '100', '877', '道法自然', '1', '2', '2017-09-05 11:50:37', '2017-09-06 00:51:03', '1');
INSERT INTO `course_chapter` VALUES ('977', '100', '877', '道法自然（说课）', '2', '2', '2017-09-05 11:50:39', '2017-09-06 00:51:50', '1');
INSERT INTO `course_chapter` VALUES ('978', '100', '877', '环保轶事', '3', '2', '2017-09-05 11:50:40', '2017-09-06 00:52:25', '1');
INSERT INTO `course_chapter` VALUES ('979', '100', '877', '环保轶事（说课）', '4', '2', '2017-09-05 11:50:41', '2017-09-06 00:53:34', '1');
INSERT INTO `course_chapter` VALUES ('980', '100', '877', '低碳节俭', '5', '2', '2017-09-05 11:50:42', '2017-09-06 00:53:53', '1');
INSERT INTO `course_chapter` VALUES ('981', '100', '877', '低碳节俭（说课）', '6', '2', '2017-09-05 11:50:44', '2017-09-06 00:55:37', '1');
INSERT INTO `course_chapter` VALUES ('982', '100', '878', '居安思危', '1', '2', '2017-09-05 11:51:55', '2017-09-06 00:57:02', '1');
INSERT INTO `course_chapter` VALUES ('983', '100', '878', '居安思危（说课）', '2', '2', '2017-09-05 11:51:56', '2017-09-06 00:57:45', '1');
INSERT INTO `course_chapter` VALUES ('984', '100', '878', '亡羊补牢', '3', '2', '2017-09-05 11:51:57', '2017-09-06 00:58:03', '1');
INSERT INTO `course_chapter` VALUES ('985', '100', '878', '亡羊补牢（说课）', '4', '2', '2017-09-05 11:52:00', '2017-09-06 00:59:15', '1');
INSERT INTO `course_chapter` VALUES ('986', '100', '0', '第十一章 规则篇', '10', '1', '2017-09-06 00:13:35', '2017-09-06 00:13:40', '1');
INSERT INTO `course_chapter` VALUES ('987', '100', '986', '弟子之规', '1', '2', '2017-09-06 00:20:20', '2017-09-06 00:22:54', '1');
INSERT INTO `course_chapter` VALUES ('988', '100', '986', '弟子之规（说课）', '2', '2', '2017-09-06 00:20:21', '2017-09-06 00:24:02', '1');
INSERT INTO `course_chapter` VALUES ('989', '100', '986', '职场之规', '3', '2', '2017-09-06 00:20:22', '2017-09-06 00:26:56', '1');
INSERT INTO `course_chapter` VALUES ('990', '100', '986', '职场之规（说课）', '4', '2', '2017-09-06 00:20:22', '2017-09-06 00:27:56', '1');
INSERT INTO `course_chapter` VALUES ('991', '100', '986', '社会之规', '5', '2', '2017-09-06 00:20:26', '2017-09-06 00:28:20', '1');
INSERT INTO `course_chapter` VALUES ('992', '100', '986', '社会之规（说课）', '6', '2', '2017-09-06 00:20:27', '2017-09-06 00:29:20', '1');
INSERT INTO `course_chapter` VALUES ('993', '101', '0', '默认根目录', null, null, null, null, '1');
INSERT INTO `course_chapter` VALUES ('995', '102', '0', '开篇--我们的公约', '1', '1', '2017-09-06 01:45:49', '2017-09-06 01:48:52', '1');
INSERT INTO `course_chapter` VALUES ('996', '102', '0', '第三条 爱劳动 图自强', '4', '1', '2017-09-06 01:45:51', '2017-09-06 01:49:50', '1');
INSERT INTO `course_chapter` VALUES ('997', '102', '0', '第五条 遵法纪，守规章', '6', '1', '2017-09-06 01:45:51', '2017-09-06 01:50:35', '1');
INSERT INTO `course_chapter` VALUES ('998', '102', '0', '第六条：辨美丑，立形象', '7', '1', '2017-09-06 01:45:52', '2017-09-06 01:50:54', '1');
INSERT INTO `course_chapter` VALUES ('999', '102', '0', '第七条 强体魄，保健康', '8', '1', '2017-09-06 01:45:53', '2017-09-06 01:51:13', '1');
INSERT INTO `course_chapter` VALUES ('1000', '102', '0', '第四条 讲文明，重修养', '5', '1', '2017-09-06 01:45:54', '2017-09-06 01:50:10', '1');
INSERT INTO `course_chapter` VALUES ('1001', '102', '0', '第一条 爱祖国，有梦想', '2', '1', '2017-09-06 01:45:54', '2017-09-06 01:49:09', '1');
INSERT INTO `course_chapter` VALUES ('1002', '102', '0', '第八条 树自信，勇担当', '9', '1', '2017-09-06 01:45:55', '2017-09-06 01:51:35', '1');
INSERT INTO `course_chapter` VALUES ('1003', '102', '0', '结尾--成长在路上', '10', '1', '2017-09-06 01:45:56', '2017-09-06 01:51:56', '1');
INSERT INTO `course_chapter` VALUES ('1005', '102', '0', '第二条 爱学习 有专长', '3', '1', '2017-09-06 01:46:12', '2017-09-06 01:49:31', '1');
INSERT INTO `course_chapter` VALUES ('1018', '102', '995', '开篇--我们的公约', '1', '2', '2017-09-06 01:48:50', '2017-09-06 02:04:19', '1');
INSERT INTO `course_chapter` VALUES ('1019', '102', '1001', '第一条 爱祖国，有梦想', '1', '2', '2017-09-06 01:49:12', '2017-09-06 02:04:39', '1');
INSERT INTO `course_chapter` VALUES ('1020', '102', '1005', '第二条 爱学习 有专长', '1', '2', '2017-09-06 01:49:28', '2017-09-06 02:04:49', '1');
INSERT INTO `course_chapter` VALUES ('1021', '102', '996', '第三条 爱劳动 图自强', '1', '2', '2017-09-06 01:49:52', '2017-09-06 02:04:59', '1');
INSERT INTO `course_chapter` VALUES ('1022', '102', '1000', '第四条 讲文明，重修养', '1', '2', '2017-09-06 01:50:15', '2017-09-06 02:05:09', '1');
INSERT INTO `course_chapter` VALUES ('1023', '102', '997', '第五条 遵法纪，守规章', '1', '2', '2017-09-06 01:50:38', '2017-09-06 02:05:22', '1');
INSERT INTO `course_chapter` VALUES ('1024', '102', '998', '第六条：辨美丑，立形象', '1', '2', '2017-09-06 01:50:58', '2017-09-06 02:05:33', '1');
INSERT INTO `course_chapter` VALUES ('1025', '102', '999', '第七条 强体魄，保健康', '1', '2', '2017-09-06 01:51:15', '2017-09-06 02:05:44', '1');
INSERT INTO `course_chapter` VALUES ('1026', '102', '1002', '第八条 树自信，勇担当', '1', '2', '2017-09-06 01:51:37', '2017-09-06 02:05:56', '1');
INSERT INTO `course_chapter` VALUES ('1027', '102', '1003', '结尾--成长在路上', '1', '2', '2017-09-06 01:52:00', '2017-09-06 02:06:08', '1');
INSERT INTO `course_chapter` VALUES ('1028', '103', '0', '主题一：青春健康与生理发育', null, '1', null, '2017-09-07 01:01:05', '1');
INSERT INTO `course_chapter` VALUES ('1029', '103', '1028', '第一课　生殖系统与健康（讲课）', '1', '2', '2017-09-06 23:14:07', '2017-09-07 09:53:17', '1');
INSERT INTO `course_chapter` VALUES ('1030', '103', '1028', '第二课   新生命的孕育（讲课）', '3', '2', '2017-09-06 23:14:22', '2017-09-07 09:58:13', '1');
INSERT INTO `course_chapter` VALUES ('1031', '103', '1028', '第三课　身体发育与困惑（讲课）', '5', '2', '2017-09-06 23:14:41', '2017-09-07 10:01:16', '1');
INSERT INTO `course_chapter` VALUES ('1032', '103', '1028', '第四课　月经与遗精（讲课）', '7', '2', '2017-09-06 23:15:13', '2017-09-07 10:02:41', '1');
INSERT INTO `course_chapter` VALUES ('1033', '103', '1028', '第五课　性的觉醒（讲课）', '9', '2', '2017-09-06 23:15:28', '2017-09-07 10:04:45', '1');
INSERT INTO `course_chapter` VALUES ('1034', '103', '0', '主题二：青春心理', '1', '1', '2017-09-06 23:16:25', '2017-09-07 00:43:01', '1');
INSERT INTO `course_chapter` VALUES ('1035', '103', '0', '主题三：两性交往', '2', '1', '2017-09-06 23:16:27', '2017-09-06 23:22:00', '1');
INSERT INTO `course_chapter` VALUES ('1036', '103', '1034', '第一课　性心理现象', '1', '2', '2017-09-06 23:17:00', '2017-09-07 10:09:15', '1');
INSERT INTO `course_chapter` VALUES ('1037', '103', '1034', '第二课　体像烦恼', '3', '2', '2017-09-06 23:19:48', '2017-09-07 10:10:17', '1');
INSERT INTO `course_chapter` VALUES ('1038', '103', '1034', '第三课　性别认同', '5', '2', '2017-09-06 23:20:03', '2017-09-07 10:11:37', '1');
INSERT INTO `course_chapter` VALUES ('1039', '103', '1034', '第四课　亲子关系', '7', '2', '2017-09-06 23:20:15', '2017-09-07 10:12:48', '1');
INSERT INTO `course_chapter` VALUES ('1040', '103', '1034', '第五课　偶像崇拜', '9', '2', '2017-09-06 23:20:28', '2017-09-07 10:13:57', '1');
INSERT INTO `course_chapter` VALUES ('1041', '103', '1035', '第一课　朋友', '1', '2', '2017-09-06 23:21:04', '2017-09-07 10:17:44', '1');
INSERT INTO `course_chapter` VALUES ('1042', '103', '1035', '第二课　同伴压力', '3', '2', '2017-09-06 23:21:15', '2017-09-07 10:18:48', '1');
INSERT INTO `course_chapter` VALUES ('1043', '103', '1035', '第三课　异性交往', '5', '2', '2017-09-06 23:21:25', '2017-09-07 10:19:41', '1');
INSERT INTO `course_chapter` VALUES ('1044', '103', '1035', '第四课    情感的烦恼', '7', '2', '2017-09-06 23:21:36', '2017-09-07 10:20:36', '1');
INSERT INTO `course_chapter` VALUES ('1045', '103', '1035', '第五课    真爱', '9', '2', '2017-09-06 23:21:47', '2017-09-07 10:21:35', '1');
INSERT INTO `course_chapter` VALUES ('1046', '103', '1035', '第六课　分手与失恋', '11', '2', '2017-09-06 23:22:02', '2017-09-07 10:22:33', '1');
INSERT INTO `course_chapter` VALUES ('1047', '103', '1035', '第七课　学会拒绝', '13', '2', '2017-09-06 23:22:15', '2017-09-07 10:23:29', '1');
INSERT INTO `course_chapter` VALUES ('1048', '103', '0', '主题四：性安全与自我保护', '3', '1', '2017-09-07 00:11:32', '2017-09-07 00:11:32', '1');
INSERT INTO `course_chapter` VALUES ('1049', '103', '0', '主题五：性与社会', '4', '1', '2017-09-07 00:11:50', '2017-09-07 00:11:50', '1');
INSERT INTO `course_chapter` VALUES ('1050', '103', '1048', '第一课    性行为的选择', '1', '2', '2017-09-07 00:12:06', '2017-09-07 10:25:03', '1');
INSERT INTO `course_chapter` VALUES ('1051', '103', '1048', '第二课    避孕知识', '3', '2', '2017-09-07 00:12:17', '2017-09-07 10:26:13', '1');
INSERT INTO `course_chapter` VALUES ('1052', '103', '1048', '第三课    意外怀孕以后', '5', '2', '2017-09-07 00:12:30', '2017-09-07 10:27:03', '1');
INSERT INTO `course_chapter` VALUES ('1053', '103', '1048', '第四课    预防性侵害', '7', '2', '2017-09-07 00:12:46', '2017-09-07 10:27:53', '1');
INSERT INTO `course_chapter` VALUES ('1054', '103', '1048', '第五课    拒绝约会暴力', '9', '2', '2017-09-07 00:13:03', '2017-09-07 10:28:51', '1');
INSERT INTO `course_chapter` VALUES ('1055', '103', '1048', '第六课    酒精与毒品', '11', '2', '2017-09-07 00:13:15', '2017-09-07 10:29:39', '1');
INSERT INTO `course_chapter` VALUES ('1056', '103', '1048', '第七课    远离性病', '13', '2', '2017-09-07 00:13:29', '2017-09-07 10:30:31', '1');
INSERT INTO `course_chapter` VALUES ('1057', '103', '1048', '第四课    预防性侵害(说课)', '8', '2', '2017-09-07 00:13:43', '2017-09-07 10:28:24', '1');
INSERT INTO `course_chapter` VALUES ('1058', '103', '1049', '第一课   性与文化', '1', '2', '2017-09-07 00:14:23', '2017-09-07 10:31:25', '1');
INSERT INTO `course_chapter` VALUES ('1059', '103', '1049', '第二课   性别平等', '3', '2', '2017-09-07 00:14:45', '2017-09-07 10:32:14', '1');
INSERT INTO `course_chapter` VALUES ('1060', '103', '1049', '第三课　性权利', '5', '2', '2017-09-07 00:14:58', '2017-09-07 10:33:05', '1');
INSERT INTO `course_chapter` VALUES ('1061', '103', '1049', '第四课　多元的性', '7', '2', '2017-09-07 00:15:14', '2017-09-07 10:33:58', '1');
INSERT INTO `course_chapter` VALUES ('1062', '103', '1049', '第五课　性道德', '9', '2', '2017-09-07 00:15:28', '2017-09-07 10:34:46', '1');
INSERT INTO `course_chapter` VALUES ('1063', '103', '1049', '第六课　性法律', '11', '2', '2017-09-07 00:15:54', '2017-09-07 10:35:43', '1');
INSERT INTO `course_chapter` VALUES ('1064', '103', '1049', '第七课　婚姻与家庭', '13', '2', '2017-09-07 00:16:06', '2017-09-07 10:36:34', '1');
INSERT INTO `course_chapter` VALUES ('1065', '103', '1028', '第一课　生殖系统与健康（说课）', '2', '2', '2017-09-07 00:34:01', '2017-09-07 09:54:04', '1');
INSERT INTO `course_chapter` VALUES ('1066', '103', '1028', '第二课   新生命的孕育（说课）', '4', '2', '2017-09-07 00:34:33', '2017-09-07 10:00:15', '1');
INSERT INTO `course_chapter` VALUES ('1067', '103', '1028', '第三课　身体发育与困惑（说课）', '6', '2', '2017-09-07 00:35:18', '2017-09-07 10:01:59', '1');
INSERT INTO `course_chapter` VALUES ('1068', '103', '1028', '第四课　月经与遗精（说课）', '8', '2', '2017-09-07 00:35:49', '2017-09-07 10:03:32', '1');
INSERT INTO `course_chapter` VALUES ('1069', '103', '1028', '第五课　性的觉醒（说课）', '10', '2', '2017-09-07 00:36:42', '2017-09-07 10:05:14', '1');
INSERT INTO `course_chapter` VALUES ('1070', '103', '1034', '第一课　性心理现象（说课）', '2', '2', '2017-09-07 00:43:03', '2017-09-07 10:09:48', '1');
INSERT INTO `course_chapter` VALUES ('1071', '103', '1034', '第二课　体像烦恼（说课）', '4', '2', '2017-09-07 00:43:33', '2017-09-07 10:10:58', '1');
INSERT INTO `course_chapter` VALUES ('1072', '103', '1034', '第三课　性别认同（说课）', '6', '2', '2017-09-07 00:43:47', '2017-09-07 10:12:07', '1');
INSERT INTO `course_chapter` VALUES ('1073', '103', '1034', '第四课　亲子关系（说课）', '8', '2', '2017-09-07 00:44:03', '2017-09-07 10:13:20', '1');
INSERT INTO `course_chapter` VALUES ('1074', '103', '1034', '第五课　偶像崇拜（说课）', '10', '2', '2017-09-07 00:44:20', '2017-09-07 10:14:40', '1');
INSERT INTO `course_chapter` VALUES ('1075', '103', '1035', '第一课　朋友（说课）', '2', '2', '2017-09-07 00:46:13', '2017-09-07 10:18:14', '1');
INSERT INTO `course_chapter` VALUES ('1076', '103', '1035', '第二课　同伴压力（说课）', '4', '2', '2017-09-07 00:46:40', '2017-09-07 10:19:15', '1');
INSERT INTO `course_chapter` VALUES ('1077', '103', '1035', '第三课　异性交往（说课）', '6', '2', '2017-09-07 00:47:02', '2017-09-07 10:20:07', '1');
INSERT INTO `course_chapter` VALUES ('1078', '103', '1035', '第四课    情感的烦恼（说课）', '8', '2', '2017-09-07 00:47:14', '2017-09-07 10:21:03', '1');
INSERT INTO `course_chapter` VALUES ('1079', '103', '1035', '第五课   真爱（说课）', '10', '2', '2017-09-07 00:47:27', '2017-09-07 10:22:06', '1');
INSERT INTO `course_chapter` VALUES ('1080', '103', '1035', '第六课　分手与失恋（说课）', '12', '2', '2017-09-07 00:49:09', '2017-09-07 10:23:02', '1');
INSERT INTO `course_chapter` VALUES ('1081', '103', '1035', '第七课　学会拒绝（说课）', '14', '2', '2017-09-07 00:49:27', '2017-09-07 10:23:55', '1');
INSERT INTO `course_chapter` VALUES ('1082', '103', '1048', '第一课    性行为的选择（说课）', '2', '2', '2017-09-07 00:52:07', '2017-09-07 10:25:36', '1');
INSERT INTO `course_chapter` VALUES ('1083', '103', '1048', '第二课    避孕知识（说课）', '4', '2', '2017-09-07 00:53:01', '2017-09-07 10:26:39', '1');
INSERT INTO `course_chapter` VALUES ('1084', '103', '1048', '第三课    意外怀孕以后（说课）', '6', '2', '2017-09-07 00:53:12', '2017-09-07 10:27:30', '1');
INSERT INTO `course_chapter` VALUES ('1085', '103', '1048', '第五课    拒绝约会暴力（说课）', '10', '2', '2017-09-07 00:55:07', '2017-09-07 10:29:17', '1');
INSERT INTO `course_chapter` VALUES ('1086', '103', '1048', '第六课    酒精与毒品（说课）', '12', '2', '2017-09-07 00:55:22', '2017-09-07 10:30:05', '1');
INSERT INTO `course_chapter` VALUES ('1087', '103', '1048', '第七课    远离性病（说课）', '14', '2', '2017-09-07 00:55:35', '2017-09-07 10:30:57', '1');
INSERT INTO `course_chapter` VALUES ('1088', '103', '1049', '第一课   性与文化（说课）', '2', '2', '2017-09-07 00:57:23', '2017-09-07 10:31:51', '1');
INSERT INTO `course_chapter` VALUES ('1089', '103', '1049', '第二课   性别平等（说课）', '4', '2', '2017-09-07 00:57:38', '2017-09-07 10:32:40', '1');
INSERT INTO `course_chapter` VALUES ('1090', '103', '1049', '第三课　性权利（说课）', '6', '2', '2017-09-07 00:57:49', '2017-09-07 10:33:31', '1');
INSERT INTO `course_chapter` VALUES ('1091', '103', '1049', '第四课　多元的性（说课）', '8', '2', '2017-09-07 00:58:02', '2017-09-07 10:34:23', '1');
INSERT INTO `course_chapter` VALUES ('1092', '103', '1049', '第五课　性道德（说课）', '10', '2', '2017-09-07 00:58:13', '2017-09-07 10:35:11', '1');
INSERT INTO `course_chapter` VALUES ('1093', '103', '1049', '第六课　性法律（说课）', '12', '2', '2017-09-07 00:58:26', '2017-09-07 10:36:07', '1');
INSERT INTO `course_chapter` VALUES ('1094', '103', '1049', '第七课　婚姻与家庭（说课）', '14', '2', '2017-09-07 00:58:38', '2017-09-07 10:37:00', '1');
INSERT INTO `course_chapter` VALUES ('1118', '88', '522', '第一课 认识情绪（说课）', '2', '2', '2017-09-07 11:35:42', '2017-09-07 11:36:41', '1');
INSERT INTO `course_chapter` VALUES ('1121', '103', '1048', '第八课 预防艾滋病', '15', '2', '2017-09-11 16:22:28', '2017-09-11 16:24:19', '1');
INSERT INTO `course_chapter` VALUES ('1122', '103', '1048', '第八课 预防艾滋病（说课）', '16', '2', '2017-09-11 16:22:29', '2017-09-11 16:26:20', '1');
INSERT INTO `course_chapter` VALUES ('1124', '104', '0', '第一部分', '1', '1', '2017-09-14 13:54:18', '2017-09-14 13:57:46', '1');
INSERT INTO `course_chapter` VALUES ('1125', '104', '1124', '第一课  巴蜀之音——盼红军	', '1', '2', '2017-09-14 13:54:27', '2017-09-14 15:41:21', '1');
INSERT INTO `course_chapter` VALUES ('1126', '104', '1124', '第二课 江南小调——茉莉花', '2', '2', '2017-09-14 13:54:55', '2017-09-14 15:19:03', '1');
INSERT INTO `course_chapter` VALUES ('1127', '104', '1124', '第三课  黄河大合唱——《保卫黄河》', '3', '2', '2017-09-14 13:55:15', '2017-09-14 15:41:51', '1');
INSERT INTO `course_chapter` VALUES ('1128', '104', '1124', '第四课  歌声飞扬——乘着歌声的翅膀', '4', '2', '2017-09-14 13:55:30', '2017-09-14 15:25:35', '1');
INSERT INTO `course_chapter` VALUES ('1129', '104', '1124', '第五课  拿波里民谣——我的太阳', '5', '2', '2017-09-14 13:55:40', '2017-09-14 15:26:57', '1');
INSERT INTO `course_chapter` VALUES ('1131', '104', '1124', '第六课  拉美之声——《美丽的小天使》', '6', '2', '2017-09-14 13:56:11', '2017-09-14 15:27:48', '1');
INSERT INTO `course_chapter` VALUES ('1132', '104', '1124', '第七课  爵士乐——《不知为何》', '7', '2', '2017-09-14 13:56:26', '2017-09-14 15:42:14', '1');
INSERT INTO `course_chapter` VALUES ('1133', '104', '1124', '第八课    音乐剧《猫》——memory	', '8', '2', '2017-09-14 13:56:45', '2017-09-14 15:32:01', '1');
INSERT INTO `course_chapter` VALUES ('1134', '104', '1124', '第九课    歌剧《卡门》——哈巴涅拉舞曲', '9', '2', '2017-09-14 13:56:58', '2017-09-14 15:32:41', '1');
INSERT INTO `course_chapter` VALUES ('1136', '104', '0', '第二部分  民乐璀璨', '2', '1', '2017-09-14 13:58:23', '2017-09-14 14:19:02', '1');
INSERT INTO `course_chapter` VALUES ('1137', '104', '0', '第三部分  交响生辉', '3', '1', '2017-09-14 13:58:42', '2017-09-14 13:58:42', '1');
INSERT INTO `course_chapter` VALUES ('1138', '104', '0', '第四部分   音韵诗情', '4', '1', '2017-09-14 14:03:06', '2017-09-14 14:03:06', '1');
INSERT INTO `course_chapter` VALUES ('1139', '104', '1136', '第一课  古韵悠长——高山流水', '1', '2', '2017-09-14 14:03:58', '2017-09-14 15:33:24', '1');
INSERT INTO `course_chapter` VALUES ('1140', '104', '1136', '第二课    战鼓声声——十面埋伏', '2', '2', '2017-09-14 14:04:10', '2017-09-14 15:33:58', '1');
INSERT INTO `course_chapter` VALUES ('1141', '104', '1136', '第三课    落日余晖——渔舟唱晚', '3', '2', '2017-09-14 14:04:32', '2017-09-14 15:37:09', '1');
INSERT INTO `course_chapter` VALUES ('1142', '104', '1136', '第四课    洒脱不羁——酒狂', '4', '2', '2017-09-14 14:04:49', '2017-09-14 15:42:49', '1');
INSERT INTO `course_chapter` VALUES ('1143', '104', '1136', '第五课    凄美旋律——二泉映月', '5', '2', '2017-09-14 14:05:06', '2017-09-14 15:38:20', '1');
INSERT INTO `course_chapter` VALUES ('1144', '104', '1136', '第六课    喜庆唢呐——百鸟朝凤', '6', '2', '2017-09-14 14:05:29', '2017-09-14 15:39:16', '1');
INSERT INTO `course_chapter` VALUES ('1145', '104', '1136', '第七课    锵锵京调——夜深沉', '7', '2', '2017-09-14 14:05:43', '2017-09-14 15:39:46', '1');
INSERT INTO `course_chapter` VALUES ('1146', '104', '1136', '第八课   童真童趣——滚核桃', '8', '2', '2017-09-14 14:06:11', '2017-09-14 15:40:13', '1');
INSERT INTO `course_chapter` VALUES ('1147', '104', '1136', '第九课    诗情画意——春江花月夜	', '9', '2', '2017-09-14 14:06:24', '2017-09-14 15:43:39', '1');
INSERT INTO `course_chapter` VALUES ('1148', '104', '1137', '第一课  蝴蝶的爱情——梁祝	', '1', '2', '2017-09-14 14:06:52', '2017-09-14 15:17:33', '1');
INSERT INTO `course_chapter` VALUES ('1149', '104', '1137', '第二课    屈人生——命运交响曲', '2', '2', '2017-09-14 14:07:44', '2017-09-14 15:18:02', '1');
INSERT INTO `course_chapter` VALUES ('1150', '104', '1137', '第三课    民族之魂——我的祖国交响诗套曲之《伏尔塔瓦河》', '3', '2', '2017-09-14 14:07:59', '2017-09-14 15:19:02', '1');
INSERT INTO `course_chapter` VALUES ('1151', '104', '1137', '第四课    硝烟弥漫——1812序曲	', '4', '2', '2017-09-14 14:08:20', '2017-09-14 15:19:37', '1');
INSERT INTO `course_chapter` VALUES ('1152', '104', '1137', '第五课    交响素描——大海', '5', '2', '2017-09-14 14:08:32', '2017-09-14 15:20:14', '1');
INSERT INTO `course_chapter` VALUES ('1153', '104', '1138', '第一课  春的韵律——春舞', '1', '2', '2017-09-14 14:09:02', '2017-09-14 15:20:37', '1');
INSERT INTO `course_chapter` VALUES ('1154', '104', '1138', '第二课     节日欢歌——春节序曲', '2', '2', '2017-09-14 14:09:18', '2017-09-14 15:22:10', '0');
INSERT INTO `course_chapter` VALUES ('1155', '104', '1138', '第三课     浪漫音诗——爱之梦', '3', '2', '2017-09-14 14:09:30', '2017-09-14 15:21:22', '1');
INSERT INTO `course_chapter` VALUES ('1156', '104', '1138', '第二课     节日欢歌——春节序曲', '2', '2', '2017-09-14 14:13:11', '2017-09-14 15:21:45', '1');
INSERT INTO `course_chapter` VALUES ('1157', '104', '1138', '第五课     动物的聚会——动物狂欢节	', '5', '2', '2017-09-14 14:13:28', '2017-09-14 15:25:29', '1');
INSERT INTO `course_chapter` VALUES ('1158', '104', '1138', '第六课   蓝色梦幻——蓝色多瑙河 ', '6', '2', '2017-09-14 14:13:45', '2017-09-14 15:28:14', '1');
INSERT INTO `course_chapter` VALUES ('1159', '104', '1138', '第七课  灵动之美——天鹅湖	', '7', '2', '2017-09-14 14:14:00', '2017-09-14 15:28:54', '1');
INSERT INTO `course_chapter` VALUES ('1160', '104', '1138', '第八课  音画印象——水中倒影', '8', '2', '2017-09-14 14:14:10', '2017-09-14 15:29:43', '1');
INSERT INTO `course_chapter` VALUES ('1161', '104', '1138', '第九课  律动之美——波莱罗舞曲', '9', '2', '2017-09-14 14:14:24', '2017-09-14 15:40:46', '1');
INSERT INTO `course_chapter` VALUES ('1162', '104', '1138', '第四课     诗人情怀——升c小调幻想即兴曲', '4', '2', '2017-09-14 15:22:41', '2017-09-14 15:24:44', '1');
INSERT INTO `course_chapter` VALUES ('1164', '105', '0', '第一单元 诚实', '1', '1', '2017-09-25 16:37:34', '2017-09-25 16:37:34', '1');
INSERT INTO `course_chapter` VALUES ('1165', '105', '1164', '第一课 做真实的自己（说课）', '2', '2', '2017-09-25 16:37:40', '2017-09-27 17:54:10', '1');
INSERT INTO `course_chapter` VALUES ('1166', '105', '1164', '第二课 实诚于己（说课）', '4', '2', '2017-09-25 16:42:47', '2017-09-27 17:56:48', '1');
INSERT INTO `course_chapter` VALUES ('1167', '105', '1164', '第三课 坦诚待人（说课）', '6', '2', '2017-09-25 16:43:01', '2017-09-27 17:57:31', '1');
INSERT INTO `course_chapter` VALUES ('1168', '105', '0', '第二单元 自信', '2', '1', '2017-09-25 16:43:41', '2017-09-25 16:44:15', '1');
INSERT INTO `course_chapter` VALUES ('1169', '105', '1168', '第一课 自信，源自内心的力量(说课)', '2', '2', '2017-09-25 16:44:05', '2017-09-28 09:11:44', '1');
INSERT INTO `course_chapter` VALUES ('1170', '105', '1168', '第二课 找到属于你自己的那把钥匙（说课）', '4', '2', '2017-09-25 16:44:22', '2017-09-28 09:13:38', '1');
INSERT INTO `course_chapter` VALUES ('1171', '105', '1168', '第三课 青春，我们自信前行（说课）', '6', '2', '2017-09-25 16:44:34', '2017-09-28 09:14:58', '1');
INSERT INTO `course_chapter` VALUES ('1172', '105', '0', '第三单元 乐观', '3', '1', '2017-09-25 16:44:48', '2017-09-25 16:45:04', '1');
INSERT INTO `course_chapter` VALUES ('1173', '105', '1172', '第一课 乐观是一种力量(说课)', '2', '2', '2017-09-25 16:45:06', '2017-09-28 09:20:40', '1');
INSERT INTO `course_chapter` VALUES ('1174', '105', '1172', '第二课 活出乐观的自己（说课）', '4', '2', '2017-09-25 16:45:21', '2017-09-28 09:24:43', '1');
INSERT INTO `course_chapter` VALUES ('1175', '105', '1172', '第三课 做一个乐观的人（说课）', '6', '2', '2017-09-25 16:45:35', '2017-09-28 09:26:15', '1');
INSERT INTO `course_chapter` VALUES ('1176', '105', '0', '第四单元 感恩', '4', '1', '2017-09-25 16:45:48', '2017-09-25 16:46:05', '1');
INSERT INTO `course_chapter` VALUES ('1177', '105', '1176', '第一课 知恩于心(说课)', '3', '2', '2017-09-25 16:46:09', '2017-09-28 12:04:43', '1');
INSERT INTO `course_chapter` VALUES ('1178', '105', '1176', '第二课 感恩于情（说课）', '4', '2', '2017-09-25 16:46:52', '2017-09-28 10:07:31', '1');
INSERT INTO `course_chapter` VALUES ('1179', '105', '1176', '第三课 懂报恩，能施恩（说课）', '6', '2', '2017-09-25 16:47:07', '2017-09-28 10:00:05', '1');
INSERT INTO `course_chapter` VALUES ('1180', '105', '0', '第五单元 尊重', '5', '1', '2017-09-25 16:47:17', '2017-09-25 16:47:30', '1');
INSERT INTO `course_chapter` VALUES ('1181', '105', '1180', '第一课 做一个自尊自爱的人（说课）', '2', '2', '2017-09-25 16:47:33', '2017-09-28 10:06:39', '1');
INSERT INTO `course_chapter` VALUES ('1182', '105', '1180', '第二课 构建长幼有序的人际关系（说课）', '4', '2', '2017-09-25 16:47:45', '2017-09-28 10:46:05', '1');
INSERT INTO `course_chapter` VALUES ('1183', '105', '1180', '第三课 实现万物共生的社会生态格局(说课)', '6', '2', '2017-09-25 16:47:57', '2017-09-28 10:11:38', '1');
INSERT INTO `course_chapter` VALUES ('1184', '105', '0', '第六单元 尽责', '6', '1', '2017-09-25 16:48:09', '2017-09-25 16:48:55', '1');
INSERT INTO `course_chapter` VALUES ('1185', '105', '1184', '第一课 山一样的责任', '1', '2', '2017-09-25 16:48:58', '2017-09-28 10:45:25', '1');
INSERT INTO `course_chapter` VALUES ('1186', '105', '1184', '第二课 对自己尽责', '3', '2', '2017-09-25 16:49:10', '2017-09-28 10:44:33', '1');
INSERT INTO `course_chapter` VALUES ('1187', '105', '1184', '第三课 社会责任需要担当', '5', '2', '2017-09-25 16:49:20', '2017-09-28 10:45:39', '1');
INSERT INTO `course_chapter` VALUES ('1188', '105', '0', '第七单元 宽容', '7', '1', '2017-09-25 16:49:32', '2017-09-25 16:50:34', '1');
INSERT INTO `course_chapter` VALUES ('1189', '105', '1188', '第一课 我眼中的宽容', '1', '2', '2017-09-25 16:50:37', '2017-09-27 17:46:23', '1');
INSERT INTO `course_chapter` VALUES ('1190', '105', '1188', '第二课 宽容的限度', '3', '2', '2017-09-25 16:50:51', '2017-09-27 17:47:02', '1');
INSERT INTO `course_chapter` VALUES ('1191', '105', '1188', '第三课 力行宽容', '5', '2', '2017-09-25 16:51:01', '2017-09-27 17:47:36', '1');
INSERT INTO `course_chapter` VALUES ('1192', '105', '0', '第八单元 沟通', '8', '1', '2017-09-25 16:51:10', '2017-09-25 16:51:47', '1');
INSERT INTO `course_chapter` VALUES ('1193', '105', '1192', '第一课 沟通，从心开始', '1', '2', '2017-09-25 16:51:49', '2017-09-27 17:48:12', '1');
INSERT INTO `course_chapter` VALUES ('1194', '105', '1192', '第二课 表达与倾听', '3', '2', '2017-09-25 16:52:02', '2017-09-27 17:48:32', '1');
INSERT INTO `course_chapter` VALUES ('1195', '105', '1192', '第三课 拒绝与冲突', '5', '2', '2017-09-25 16:52:12', '2017-09-27 17:49:01', '1');
INSERT INTO `course_chapter` VALUES ('1196', '105', '0', '第九单元 勇敢', '9', '1', '2017-09-25 16:55:18', '2017-09-25 16:55:35', '1');
INSERT INTO `course_chapter` VALUES ('1197', '105', '1196', '第一课 勇于作为，敢为人先', '2', '2', '2017-09-25 16:55:38', '2017-09-28 10:39:59', '1');
INSERT INTO `course_chapter` VALUES ('1198', '105', '1196', '第二课 勇敢挑战心理舒适区', '3', '2', '2017-09-25 16:55:51', '2017-09-28 10:38:26', '1');
INSERT INTO `course_chapter` VALUES ('1199', '105', '1196', '第三课 勇于选择，规划未来', '5', '2', '2017-09-25 16:56:02', '2017-09-28 10:37:15', '1');
INSERT INTO `course_chapter` VALUES ('1200', '105', '0', '第十单元 节俭', '10', '1', '2017-09-25 16:56:13', '2017-09-25 16:56:34', '1');
INSERT INTO `course_chapter` VALUES ('1201', '105', '1200', '第一课 节俭是一种美德', '1', '2', '2017-09-25 16:57:48', '2017-09-28 10:35:51', '1');
INSERT INTO `course_chapter` VALUES ('1202', '105', '1200', '第二课 我们需要节俭', '3', '2', '2017-09-25 16:58:00', '2017-09-28 10:34:53', '1');
INSERT INTO `course_chapter` VALUES ('1203', '105', '1200', '第三课 做一个节俭的人', '5', '2', '2017-09-25 16:58:10', '2017-09-28 10:33:09', '1');
INSERT INTO `course_chapter` VALUES ('1204', '105', '0', '第十一单元 友善', '11', '1', '2017-09-25 16:58:21', '2017-09-25 16:58:34', '1');
INSERT INTO `course_chapter` VALUES ('1205', '105', '1204', '第一课 友善之花', '1', '2', '2017-09-25 16:58:39', '2017-09-28 10:32:11', '1');
INSERT INTO `course_chapter` VALUES ('1206', '105', '1204', '第二课 友善的力量', '3', '2', '2017-09-25 16:58:54', '2017-09-28 10:31:20', '1');
INSERT INTO `course_chapter` VALUES ('1207', '105', '1204', '第三课 友善伴我行', '5', '2', '2017-09-25 16:59:00', '2017-09-28 10:30:34', '1');
INSERT INTO `course_chapter` VALUES ('1208', '105', '0', '第十二单元 服从', '12', '1', '2017-09-25 16:59:11', '2017-09-25 16:59:22', '1');
INSERT INTO `course_chapter` VALUES ('1209', '105', '1208', '第一课 我们需要服从的品格', '1', '2', '2017-09-25 16:59:25', '2017-09-28 10:29:42', '1');
INSERT INTO `course_chapter` VALUES ('1210', '105', '1208', '第二课 学会服从', '3', '2', '2017-09-25 16:59:37', '2017-09-28 10:27:15', '1');
INSERT INTO `course_chapter` VALUES ('1211', '105', '1208', '第三课 做一个懂服从的人', '5', '2', '2017-09-25 16:59:52', '2017-09-28 10:24:11', '1');
INSERT INTO `course_chapter` VALUES ('1212', '105', '1164', '第一课 做真实的自己（讲课）', '1', '2', '2017-09-27 17:52:34', '2017-09-27 17:54:35', '1');
INSERT INTO `course_chapter` VALUES ('1213', '105', '1164', '第二课 实诚于己（讲课）', '3', '2', '2017-09-27 17:56:51', '2017-09-27 17:57:12', '1');
INSERT INTO `course_chapter` VALUES ('1214', '105', '1164', '第三课 坦诚待人（讲课）', '5', '2', '2017-09-27 17:57:35', '2017-09-27 17:58:22', '1');
INSERT INTO `course_chapter` VALUES ('1215', '105', '1168', '第一课 自信，源自内心的力量(讲课)', '1', '2', '2017-09-28 09:11:47', '2017-09-28 09:12:13', '1');
INSERT INTO `course_chapter` VALUES ('1216', '105', '1168', '第二课 属于你自己的那把钥匙（讲课）', '3', '2', '2017-09-28 09:13:41', '2017-09-28 09:14:39', '1');
INSERT INTO `course_chapter` VALUES ('1217', '105', '1168', '第三课 青春，我们自信前行（讲课）', '5', '2', '2017-09-28 09:15:01', '2017-09-28 09:15:29', '1');
INSERT INTO `course_chapter` VALUES ('1218', '105', '1172', '第一课 乐观是一种力量(讲课)', '1', '2', '2017-09-28 09:20:44', '2017-09-28 09:22:22', '1');
INSERT INTO `course_chapter` VALUES ('1219', '105', '1172', '第二课 活出乐观的自己（讲课）', '3', '2', '2017-09-28 09:24:48', '2017-09-28 09:25:59', '1');
INSERT INTO `course_chapter` VALUES ('1220', '105', '1172', '第三课 做一个乐观的人（讲课）', '5', '2', '2017-09-28 09:26:22', '2017-09-28 09:53:59', '1');
INSERT INTO `course_chapter` VALUES ('1221', '105', '1176', '第一课 知恩于心(讲课)', '2', '2', '2017-09-28 09:54:38', '2017-09-28 09:55:24', '1');
INSERT INTO `course_chapter` VALUES ('1222', '105', '1176', '第二课 感恩于情（讲课）', '3', '2', '2017-09-28 09:57:15', '2017-09-28 09:58:26', '1');
INSERT INTO `course_chapter` VALUES ('1223', '105', '1176', '第三课 懂报恩，能施恩（讲课）', '5', '2', '2017-09-28 10:04:35', '2017-09-28 10:06:19', '1');
INSERT INTO `course_chapter` VALUES ('1224', '105', '1180', '第一课 做一个自尊自爱的人（讲课）', '1', '2', '2017-09-28 10:06:48', '2017-09-28 10:07:19', '1');
INSERT INTO `course_chapter` VALUES ('1225', '105', '1180', '第二课 构建长幼有序的人际关系（讲课）', '3', '2', '2017-09-28 10:07:55', '2017-09-28 10:09:55', '1');
INSERT INTO `course_chapter` VALUES ('1226', '105', '1180', '第三课 实现万物共生的社会生态格局', '5', '2', '2017-09-28 10:11:41', '2017-09-28 10:12:29', '1');
INSERT INTO `course_chapter` VALUES ('1227', '105', '1208', '第一课 我们需要服从的品格（说课）', '2', '2', '2017-09-28 10:11:55', '2017-09-28 10:29:18', '1');
INSERT INTO `course_chapter` VALUES ('1228', '105', '1208', '第二课 学会服从（说课）', '4', '2', '2017-09-28 10:11:56', '2017-09-28 10:26:58', '1');
INSERT INTO `course_chapter` VALUES ('1229', '105', '1208', '第三课 做一个懂服从的人（说课）', '6', '2', '2017-09-28 10:11:57', '2017-09-28 10:23:38', '1');
INSERT INTO `course_chapter` VALUES ('1230', '105', '1204', '第一课 友善之花（说课）', '2', '2', '2017-09-28 10:16:22', '2017-09-28 10:31:56', '1');
INSERT INTO `course_chapter` VALUES ('1231', '105', '1204', '第二课 友善的力量（说课）', '4', '2', '2017-09-28 10:16:23', '2017-09-28 10:31:05', '1');
INSERT INTO `course_chapter` VALUES ('1232', '105', '1204', '第三课 友善伴我行（说课）', '6', '2', '2017-09-28 10:16:24', '2017-09-28 10:30:18', '1');
INSERT INTO `course_chapter` VALUES ('1233', '105', '1200', '第一课 节俭是一种美德（说课）', '2', '2', '2017-09-28 10:17:34', '2017-09-28 10:35:35', '1');
INSERT INTO `course_chapter` VALUES ('1234', '105', '1200', '第二课 我们需要节俭（说课）', '4', '2', '2017-09-28 10:17:35', '2017-09-28 10:34:31', '1');
INSERT INTO `course_chapter` VALUES ('1235', '105', '1200', '第三课 做一个节俭的人（说课）', '6', '2', '2017-09-28 10:17:36', '2017-09-28 10:32:49', '1');
INSERT INTO `course_chapter` VALUES ('1236', '105', '1196', '第一课 勇于作为，敢为人先（说课）', '2', '2', '2017-09-28 10:18:27', '2017-09-28 10:39:19', '1');
INSERT INTO `course_chapter` VALUES ('1237', '105', '1196', '第二课 勇敢挑战心理舒适区（说课）', '4', '2', '2017-09-28 10:18:28', '2017-09-28 10:38:06', '1');
INSERT INTO `course_chapter` VALUES ('1238', '105', '1196', '第三课 勇于选择，规划未来（说课）', '6', '2', '2017-09-28 10:18:29', '2017-09-28 10:36:50', '1');
INSERT INTO `course_chapter` VALUES ('1239', '105', '1196', 'New node', '7', null, '2017-09-28 10:18:29', '2017-09-28 10:18:32', '0');
INSERT INTO `course_chapter` VALUES ('1240', '105', '1192', '第一课 沟通，从心开始（说课）', '2', '2', '2017-09-28 10:19:21', '2017-09-28 13:05:00', '1');
INSERT INTO `course_chapter` VALUES ('1241', '105', '1192', '第二课 表达与倾听（说课）', '4', '2', '2017-09-28 10:19:22', '2017-09-28 10:41:12', '1');
INSERT INTO `course_chapter` VALUES ('1242', '105', '1192', '第三课 拒绝与冲突（说课）', '6', '2', '2017-09-28 10:19:23', '2017-09-28 10:40:43', '1');
INSERT INTO `course_chapter` VALUES ('1243', '105', '1188', '第一课 我眼中的宽容（说课）', '2', '2', '2017-09-28 10:20:40', '2017-09-28 10:43:19', '1');
INSERT INTO `course_chapter` VALUES ('1244', '105', '1188', '第二课 宽容的限度（说课）', '4', '2', '2017-09-28 10:20:41', '2017-09-28 10:42:54', '1');
INSERT INTO `course_chapter` VALUES ('1245', '105', '1188', '第三课 力行宽容（说课）', '6', '2', '2017-09-28 10:20:42', '2017-09-28 10:42:27', '1');
INSERT INTO `course_chapter` VALUES ('1246', '105', '1184', '第一课 山一样的责任（说课）', '2', '2', '2017-09-28 10:21:23', '2017-09-28 10:45:08', '1');
INSERT INTO `course_chapter` VALUES ('1247', '105', '1184', '第二课 对自己尽责（说课）', '4', '2', '2017-09-28 10:21:24', '2017-09-28 10:44:20', '1');
INSERT INTO `course_chapter` VALUES ('1248', '105', '1184', '第三课 社会责任需要担当（说课）', '6', '2', '2017-09-28 10:21:25', '2017-09-28 10:43:53', '1');
INSERT INTO `course_chapter` VALUES ('1249', '106', '0', '第一单元 从社会主义核心价值体系到社会主义核心价值观', null, '1', null, '2017-09-28 16:06:39', '1');
INSERT INTO `course_chapter` VALUES ('1250', '106', '1249', '第一单元 从社会主义核心价值体系到社会主义核心价值观（一）', '1', '2', '2017-09-28 16:05:05', '2017-09-28 16:11:02', '1');
INSERT INTO `course_chapter` VALUES ('1251', '106', '0', '第二单元 培育和弘扬社会主义核心价值观的重要性和紧迫性', '1', '1', '2017-09-28 16:05:47', '2017-09-28 16:13:15', '1');
INSERT INTO `course_chapter` VALUES ('1252', '106', '1249', '第一单元 从社会主义核心价值体系到社会主义核心价值观（二）', '2', '2', '2017-09-28 16:12:37', '2017-09-28 16:31:34', '1');
INSERT INTO `course_chapter` VALUES ('1253', '106', '1251', '第二单元 培育和弘扬社会主义核心价值观的重要性和紧迫性', '2', '2', '2017-09-28 16:13:20', '2017-09-28 16:35:45', '1');
INSERT INTO `course_chapter` VALUES ('1254', '106', '0', '第三单元 培育和弘扬社会主义核心价值观的主要途径', '1', '1', '2017-09-28 16:13:47', '2017-09-28 16:14:06', '1');
INSERT INTO `course_chapter` VALUES ('1255', '106', '1254', '第三单元 培育和弘扬社会主义核心价值观的主要途径（一）', '1', '2', '2017-09-28 16:14:09', '2017-09-28 16:36:24', '1');
INSERT INTO `course_chapter` VALUES ('1256', '106', '1254', '第三单元 培育和弘扬社会主义核心价值观的主要途径（二）', '2', '2', '2017-09-28 16:14:23', '2017-09-28 16:37:00', '1');
INSERT INTO `course_chapter` VALUES ('1257', '106', '1254', '第三单元 培育和弘扬社会主义核心价值观的主要途径（三）', '3', '2', '2017-09-28 16:14:36', '2017-09-28 16:37:36', '1');
INSERT INTO `course_chapter` VALUES ('1258', '106', '0', '第四单元  应以什么样的方式来思考核心价值观的培育这个文化核心问题', '4', '1', '2017-09-28 16:14:49', '2017-09-28 16:15:52', '1');
INSERT INTO `course_chapter` VALUES ('1259', '106', '1258', '第一课： 应以什么样的方式来思考核心价值观的培育这个文化核心问题', '1', '2', '2017-09-28 16:15:19', '2017-09-28 16:38:44', '1');
INSERT INTO `course_chapter` VALUES ('1260', '106', '1258', '第二课： 应以什么样的方式来思考核心价值观的培育这个文化核心问题', '2', '2', '2017-09-28 16:16:07', '2017-09-28 16:39:13', '1');
INSERT INTO `course_chapter` VALUES ('1261', '106', '1258', '第三课： 应以什么样的方式来思考核心价值观的培育这个文化核心问题', '3', '2', '2017-09-28 16:16:23', '2017-09-28 16:39:45', '1');
INSERT INTO `course_chapter` VALUES ('1262', '106', '1258', '第四课： 应以什么样的方式来思考核心价值观的培育这个文化核心问题.', '4', '2', '2017-09-28 16:16:42', '2017-09-28 16:41:02', '1');
INSERT INTO `course_chapter` VALUES ('1263', '106', '0', '第五单元 为什么说核心价值观是兴国之魂合成', '5', '1', '2017-09-28 16:17:17', '2017-09-28 16:17:43', '1');
INSERT INTO `course_chapter` VALUES ('1264', '106', '1263', '第五单元 为什么说核心价值观是兴国之魂合成', '1', '2', '2017-09-28 16:17:46', '2017-09-28 16:41:36', '1');
INSERT INTO `course_chapter` VALUES ('1265', '106', '0', '第六单元 建设社会主义核心价值体系必须回答的问题', '2', '1', '2017-09-28 16:18:01', '2017-09-28 16:18:35', '0');
INSERT INTO `course_chapter` VALUES ('1266', '106', '0', 'New node', '2', '1', '2017-09-28 16:18:39', '2017-09-28 16:19:08', '0');
INSERT INTO `course_chapter` VALUES ('1267', '106', '0', '第六单元 建设社会主义核心价值体系必须回答的问题', '1', '1', '2017-09-28 16:19:37', '2017-09-28 16:19:48', '1');
INSERT INTO `course_chapter` VALUES ('1268', '106', '1267', '第六单元 建设社会主义核心价值体系必须回答的问题', '1', '2', '2017-09-28 16:19:52', '2017-09-28 16:38:09', '1');
INSERT INTO `course_chapter` VALUES ('1269', '107', '0', '第一单元  “中国梦”——百年追梦与民族自强', null, '1', null, '2017-09-28 16:48:01', '1');
INSERT INTO `course_chapter` VALUES ('1270', '107', '1269', '第一单元  “中国梦”——百年追梦与民族自强（一）', '1', '2', '2017-09-28 16:48:04', '2017-09-28 16:49:42', '1');
INSERT INTO `course_chapter` VALUES ('1271', '107', '1269', '第一单元  “中国梦”——百年追梦与民族自强（二）', '2', '2', '2017-09-28 16:52:57', '2017-09-28 16:54:43', '1');
INSERT INTO `course_chapter` VALUES ('1272', '107', '1269', '第一单元  “中国梦”——百年追梦与民族自强（三）', '3', '2', '2017-09-28 16:54:51', '2017-09-28 16:55:10', '1');
INSERT INTO `course_chapter` VALUES ('1273', '107', '0', '第二单元 “中国道路”——中华民族伟大复兴的路径选择', '4', '1', '2017-09-28 16:55:12', '2017-09-28 16:55:39', '1');
INSERT INTO `course_chapter` VALUES ('1274', '107', '1273', '第二单元 “中国道路”——中华民族伟大复兴的路径选择（一）', '1', '2', '2017-09-28 16:55:45', '2017-09-28 16:56:05', '1');
INSERT INTO `course_chapter` VALUES ('1275', '107', '1273', '第二单元 “中国道路”——中华民族伟大复兴的路径选择（二）', '2', '2', '2017-09-28 16:56:15', '2017-09-28 16:56:31', '1');
INSERT INTO `course_chapter` VALUES ('1276', '107', '1273', '第二单元 “中国道路”——中华民族伟大复兴的路径选择（三）', '3', '2', '2017-09-28 16:56:33', '2017-09-28 16:56:59', '1');
INSERT INTO `course_chapter` VALUES ('1277', '107', '0', '第三单元 伟大复兴——”中国梦“的深刻内涵', '4', '1', '2017-09-28 16:57:03', '2017-09-28 16:57:21', '1');
INSERT INTO `course_chapter` VALUES ('1278', '107', '1277', '第三单元 伟大复兴——”中国梦“的深刻内涵（一）', '1', '2', '2017-09-28 16:57:24', '2017-09-28 16:58:15', '1');
INSERT INTO `course_chapter` VALUES ('1279', '107', '1277', '第三单元 伟大复兴——”中国梦“的深刻内涵（二）', '2', '2', '2017-09-28 16:58:18', '2017-09-28 16:59:51', '1');
INSERT INTO `course_chapter` VALUES ('1280', '107', '0', '第四单元 实干兴邦——”中国梦“的根本保障', '3', '1', '2017-09-28 16:59:57', '2017-09-28 17:03:49', '1');
INSERT INTO `course_chapter` VALUES ('1281', '107', '1280', '第四单元 实干兴邦——”中国梦“的根本保障（一）', '1', '2', '2017-09-28 17:04:14', '2017-09-28 17:04:39', '1');
INSERT INTO `course_chapter` VALUES ('1282', '107', '1280', '第四单元 实干兴邦——”中国梦“的根本保障（二）', '2', '2', '2017-09-28 17:04:41', '2017-09-28 17:05:08', '1');
INSERT INTO `course_chapter` VALUES ('1283', '107', '1280', '第四单元 实干兴邦——”中国梦“的根本保障（三）', '3', '2', '2017-09-28 17:05:11', '2017-09-28 17:05:39', '1');
INSERT INTO `course_chapter` VALUES ('1284', '107', '0', '第五单元 凝心聚力——“中国精神”的民族特征', '3', '1', '2017-09-28 17:05:42', '2017-09-28 17:06:02', '1');
INSERT INTO `course_chapter` VALUES ('1285', '107', '1284', '第五单元 凝心聚力——“中国精神”的民族特征（一）', '1', '2', '2017-09-28 17:06:05', '2017-09-28 17:06:25', '1');
INSERT INTO `course_chapter` VALUES ('1286', '107', '1284', '第五单元 凝心聚力——“中国精神”的民族特征（二）', '2', '2', '2017-09-28 17:06:28', '2017-09-28 17:06:48', '1');
INSERT INTO `course_chapter` VALUES ('1287', '107', '1284', '第五单元 凝心聚力——“中国精神”的民族特征（三）', '3', '2', '2017-09-28 17:06:50', '2017-09-28 17:07:17', '1');
INSERT INTO `course_chapter` VALUES ('1288', '107', '0', '第六单元 共筑中国梦——“中国精神”的时代要求', '3', '1', '2017-09-28 17:07:13', '2017-09-28 17:07:36', '1');
INSERT INTO `course_chapter` VALUES ('1289', '107', '1288', '第六单元 共筑中国梦——“中国精神”的时代要求（一）', '1', '2', '2017-09-28 17:07:38', '2017-09-28 17:08:00', '1');
INSERT INTO `course_chapter` VALUES ('1290', '107', '1288', '第六单元 共筑中国梦——“中国精神”的时代要求（二）', '2', '2', '2017-09-28 17:07:56', '2017-09-28 17:08:55', '1');
INSERT INTO `course_chapter` VALUES ('1291', '108', '0', '第一单元 中国美术鉴赏', null, '1', null, '2017-11-10 16:43:03', '1');
INSERT INTO `course_chapter` VALUES ('1292', '108', '1291', '1-1 艺术的起源——史前艺术', '1', '2', '2017-11-10 16:43:05', '2017-11-13 09:29:32', '1');
INSERT INTO `course_chapter` VALUES ('1293', '108', '1291', '1-2 卑微的狰狞——商周青铜文化', '2', '2', '2017-11-10 16:43:20', '2017-11-10 17:04:42', '1');
INSERT INTO `course_chapter` VALUES ('1294', '108', '1291', '1-3 彪悍的现实主义——秦汉墓葬艺术', '3', '2', '2017-11-10 16:43:38', '2017-11-10 17:08:01', '1');
INSERT INTO `course_chapter` VALUES ('1295', '108', '1291', '1-4 世界中心的艺术——唐代艺术', '4', '2', '2017-11-10 16:43:52', '2017-11-10 17:09:00', '1');
INSERT INTO `course_chapter` VALUES ('1296', '108', '1291', '1-5 格物致知——宋代花鸟画', '5', '2', '2017-11-10 16:44:03', '2017-11-10 17:09:49', '1');
INSERT INTO `course_chapter` VALUES ('1297', '108', '1291', '1-6 溪山高远——宋代山水画', '6', '2', '2017-11-10 16:44:17', '2017-11-10 17:16:20', '1');
INSERT INTO `course_chapter` VALUES ('1298', '108', '1291', '1-7 文人自觉与艺术交融——元代艺术', '7', '2', '2017-11-10 16:44:28', '2017-11-10 17:16:47', '1');
INSERT INTO `course_chapter` VALUES ('1299', '108', '1291', '1-8 江南风韵——明代艺术', '8', '2', '2017-11-10 16:44:40', '2017-11-10 17:17:25', '1');
INSERT INTO `course_chapter` VALUES ('1300', '108', '1291', '1-9 皇家典藏与江南艺术——清代艺术', '9', '2', '2017-11-10 16:44:52', '2017-11-10 17:18:09', '1');
INSERT INTO `course_chapter` VALUES ('1301', '108', '1291', '1-10 爱国运动中的艺术——近代艺术', '10', '2', '2017-11-10 16:45:04', '2017-11-10 17:18:35', '1');
INSERT INTO `course_chapter` VALUES ('1302', '108', '1291', '1-11 沟通到表现——书法', '11', '2', '2017-11-10 16:45:17', '2017-11-10 17:18:58', '1');
INSERT INTO `course_chapter` VALUES ('1303', '108', '1291', '1-12 火与泥的涅槃——陶瓷（上）', '12', '2', '2017-11-10 16:45:28', '2017-11-10 17:20:11', '1');
INSERT INTO `course_chapter` VALUES ('1304', '108', '1291', '1-13 china的化身——陶瓷（下）', '13', '2', '2017-11-10 16:45:39', '2017-11-10 17:23:43', '1');
INSERT INTO `course_chapter` VALUES ('1305', '108', '1291', '1-14 织物上的艺术——帛画、纺织品艺术', '14', '2', '2017-11-10 16:45:50', '2017-11-10 17:24:05', '1');
INSERT INTO `course_chapter` VALUES ('1306', '108', '1291', '1-15 把玩的艺术——牙、角、匏艺术品', '15', '2', '2017-11-10 16:46:04', '2017-11-10 17:24:43', '1');
INSERT INTO `course_chapter` VALUES ('1307', '108', '1291', '1-16 千年不朽——漆器艺术', '16', '2', '2017-11-10 16:46:15', '2017-11-10 17:25:08', '1');
INSERT INTO `course_chapter` VALUES ('1308', '108', '1291', '1-17 装扮之美——饰品', '17', '2', '2017-11-10 16:46:27', '2017-11-10 17:25:32', '1');
INSERT INTO `course_chapter` VALUES ('1309', '108', '1291', '1-18 书房里的宝贝——文房用品', '18', '2', '2017-11-10 16:46:38', '2017-11-10 17:25:56', '1');
INSERT INTO `course_chapter` VALUES ('1310', '108', '1291', '1-19 信仰之光——宗教艺术', '19', '2', '2017-11-10 16:46:51', '2017-11-10 17:26:17', '1');
INSERT INTO `course_chapter` VALUES ('1311', '108', '1291', '1-20 凝固的音乐——建筑中的艺术美', '20', '2', '2017-11-10 16:47:02', '2017-11-10 17:26:38', '1');
INSERT INTO `course_chapter` VALUES ('1312', '108', '1291', '1-21 民族瑰宝——民族艺术', '21', '2', '2017-11-10 16:47:35', '2017-11-10 17:27:04', '1');
INSERT INTO `course_chapter` VALUES ('1313', '108', '1291', '1-22 生活中的艺术——民间艺术', '22', '2', '2017-11-10 16:47:49', '2017-11-10 17:27:25', '1');
INSERT INTO `course_chapter` VALUES ('1314', '108', '0', '第二单元 外国美术鉴赏', '1', '1', '2017-11-10 16:48:01', '2017-11-10 16:48:47', '1');
INSERT INTO `course_chapter` VALUES ('1315', '108', '1314', '2-1 逝去的文明——埃及、两河文明', '1', '2', '2017-11-10 16:51:56', '2017-11-13 09:18:54', '1');
INSERT INTO `course_chapter` VALUES ('1316', '108', '1314', '2-2 欧陆曙光——古希腊罗马艺术', '2', '2', '2017-11-10 16:52:10', '2017-11-13 09:19:22', '1');
INSERT INTO `course_chapter` VALUES ('1317', '108', '1314', '2-3 冷峻严肃——中世纪欧洲艺术', '3', '2', '2017-11-10 16:52:22', '2017-11-13 09:19:48', '1');
INSERT INTO `course_chapter` VALUES ('1318', '108', '1314', '2-4 群星璀璨——欧洲文艺复兴时期艺术', '4', '2', '2017-11-10 16:52:33', '2017-11-13 09:20:16', '1');
INSERT INTO `course_chapter` VALUES ('1319', '108', '1314', '2-5 重归理性——从巴洛克到新古典主义', '5', '2', '2017-11-10 16:53:02', '2017-11-13 09:20:44', '1');
INSERT INTO `course_chapter` VALUES ('1320', '108', '1314', '2-6 走向表现——印象派及以后', '6', '2', '2017-11-10 16:53:27', '2017-11-13 09:21:08', '1');
INSERT INTO `course_chapter` VALUES ('1321', '108', '1314', '2-7 一切皆有可能——现代艺术', '7', '2', '2017-11-10 16:53:39', '2017-11-13 09:21:37', '1');
INSERT INTO `course_chapter` VALUES ('1322', '108', '0', '第三单元  美术通识', '8', '1', '2017-11-10 16:53:51', '2017-11-10 16:54:50', '1');
INSERT INTO `course_chapter` VALUES ('1323', '108', '1322', '3-1 品味的变迁——设计风格的变化', '1', '2', '2017-11-10 16:54:53', '2017-11-13 09:22:01', '1');
INSERT INTO `course_chapter` VALUES ('1324', '108', '1322', '3-2 艺术与科学——艺术中体现的科学问题', '2', '2', '2017-11-10 16:55:03', '2017-11-13 09:22:28', '1');
INSERT INTO `course_chapter` VALUES ('1325', '108', '1322', '3-3 艺术基础ABC——一些常用的基本概念', '3', '2', '2017-11-10 16:55:31', '2017-11-13 09:22:57', '1');
INSERT INTO `course_chapter` VALUES ('1326', '109', '0', '第一单元  古代科学技术', null, '1', null, '2017-12-12 16:37:14', '1');
INSERT INTO `course_chapter` VALUES ('1327', '109', '1326', '1-6 古代中国的辉煌成就（二）', '1', '2', '2017-12-12 16:37:17', '2017-12-12 16:37:55', '1');
INSERT INTO `course_chapter` VALUES ('1328', '109', '1327', '1-6 古代中国的辉煌成就（二）', '1', '3', '2017-12-12 16:37:34', '2017-12-12 17:15:03', '1');
INSERT INTO `course_chapter` VALUES ('1329', '109', '1327', '1-6 古代中国的辉煌成就（二）(说课)', '2', '3', '2017-12-12 16:37:44', '2017-12-12 17:15:30', '1');
INSERT INTO `course_chapter` VALUES ('1330', '109', '0', '第二单元  近代科学技术', '2', '1', '2017-12-12 16:37:59', '2017-12-12 16:38:15', '1');
INSERT INTO `course_chapter` VALUES ('1331', '109', '1330', '2-4 伟大的牛顿革命（一）：哥白尼的“第一枪”', '1', '2', '2017-12-12 16:38:18', '2017-12-12 16:41:37', '1');
INSERT INTO `course_chapter` VALUES ('1332', '109', '1330', '2-4 伟大的牛顿革命（一）：哥白尼的“第一枪”（说课）', '2', '2', '2017-12-12 16:38:36', '2017-12-12 16:42:05', '1');

-- ----------------------------
-- Table structure for course_comment_info
-- ----------------------------
DROP TABLE IF EXISTS `course_comment_info`;
CREATE TABLE `course_comment_info` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `open_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `create_dt` datetime DEFAULT NULL,
  `state_dt` datetime DEFAULT NULL,
  `state` int(2) DEFAULT '1',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_comment_info
-- ----------------------------
INSERT INTO `course_comment_info` VALUES ('1', '1', '228', '等等', '2017-04-05 16:28:54', '2017-04-05 16:28:54', '1');
INSERT INTO `course_comment_info` VALUES ('2', '13', '226', 'dsd', '2017-05-11 17:07:02', '2017-05-11 17:07:02', '1');
INSERT INTO `course_comment_info` VALUES ('3', '31', '228', '你好', '2017-05-12 14:31:13', '2017-05-12 14:31:13', '1');
INSERT INTO `course_comment_info` VALUES ('4', '31', '228', '讲得好', '2017-05-12 14:31:47', '2017-05-12 14:31:47', '1');
INSERT INTO `course_comment_info` VALUES ('5', '1', '228', '什么鬼？', '2017-05-12 15:52:56', '2017-05-12 15:52:56', '1');
INSERT INTO `course_comment_info` VALUES ('6', '32', '228', '主角666', '2017-05-15 15:56:04', '2017-05-15 15:56:04', '1');
INSERT INTO `course_comment_info` VALUES ('7', '32', '228', '棒棒哒', '2017-05-15 15:56:21', '2017-05-15 15:56:21', '1');
INSERT INTO `course_comment_info` VALUES ('8', '32', '228', '对对对', '2017-05-15 17:58:30', '2017-05-15 17:58:30', '1');
INSERT INTO `course_comment_info` VALUES ('9', '32', '228', '大声道', '2017-05-16 17:43:52', '2017-05-16 17:43:52', '1');
INSERT INTO `course_comment_info` VALUES ('10', '23', '228', '老师讲的很好！', '2017-05-22 17:58:56', '2017-05-22 17:58:56', '1');
INSERT INTO `course_comment_info` VALUES ('11', '23', '228', '老师讲的很好！', '2017-05-22 17:59:07', '2017-05-22 17:59:07', '1');
INSERT INTO `course_comment_info` VALUES ('12', '23', '228', '老师讲的很好！', '2017-05-22 17:59:10', '2017-05-22 17:59:10', '1');
INSERT INTO `course_comment_info` VALUES ('13', '23', '228', '老师讲的很好！', '2017-05-22 17:59:17', '2017-05-22 17:59:17', '1');
INSERT INTO `course_comment_info` VALUES ('14', '23', '228', '老师讲的很好！', '2017-05-22 17:59:20', '2017-05-22 17:59:20', '1');
INSERT INTO `course_comment_info` VALUES ('15', '23', '228', '老师讲的很好！', '2017-05-22 17:59:23', '2017-05-22 17:59:23', '1');
INSERT INTO `course_comment_info` VALUES ('16', '23', '228', '老师讲的很好！', '2017-05-22 17:59:26', '2017-05-22 17:59:26', '1');
INSERT INTO `course_comment_info` VALUES ('17', '23', '228', '老师讲的很好！', '2017-05-22 17:59:29', '2017-05-22 17:59:29', '1');
INSERT INTO `course_comment_info` VALUES ('18', '23', '228', '老师讲的很好！', '2017-05-22 17:59:32', '2017-05-22 17:59:32', '1');
INSERT INTO `course_comment_info` VALUES ('19', '23', '228', '老师讲的很好！', '2017-05-22 17:59:35', '2017-05-22 17:59:35', '1');
INSERT INTO `course_comment_info` VALUES ('20', '23', '228', '老师讲的很好！', '2017-05-22 17:59:38', '2017-05-22 17:59:38', '1');
INSERT INTO `course_comment_info` VALUES ('21', '23', '228', '老师讲的很好！', '2017-05-22 17:59:41', '2017-05-22 17:59:41', '1');
INSERT INTO `course_comment_info` VALUES ('22', '23', '228', '老师讲的很好！', '2017-05-22 17:59:45', '2017-05-22 17:59:45', '1');
INSERT INTO `course_comment_info` VALUES ('23', '23', '228', '老师讲的很好！', '2017-05-22 17:59:48', '2017-05-22 17:59:48', '1');
INSERT INTO `course_comment_info` VALUES ('24', '23', '228', '老师讲的很好！', '2017-05-22 17:59:51', '2017-05-22 17:59:51', '1');
INSERT INTO `course_comment_info` VALUES ('25', '23', '228', '老师讲的很好！', '2017-05-22 17:59:54', '2017-05-22 17:59:54', '1');
INSERT INTO `course_comment_info` VALUES ('26', '19', '228', '嗯嗯，好看好看\n', '2017-05-23 10:09:37', '2017-05-23 10:09:37', '1');
INSERT INTO `course_comment_info` VALUES ('27', '33', '228', '小蒙真好看', '2017-05-23 10:31:08', '2017-05-23 10:31:08', '1');
INSERT INTO `course_comment_info` VALUES ('28', '33', '228', 'just see', '2017-05-23 14:13:51', '2017-05-23 14:13:51', '1');

-- ----------------------------
-- Table structure for course_info
-- ----------------------------
DROP TABLE IF EXISTS `course_info`;
CREATE TABLE `course_info` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程ID',
  `course_type_id` int(11) DEFAULT NULL COMMENT '课程类别ID',
  `create_user_id` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `course_info` varchar(600) DEFAULT NULL COMMENT '课程介绍',
  `course_name` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `cover_id` int(11) DEFAULT NULL COMMENT '封面id',
  `template_id` int(11) DEFAULT NULL,
  `classhour` double DEFAULT '0' COMMENT '课时',
  `school_id` int(11) DEFAULT NULL COMMENT '学校ID',
  `click_num` int(11) DEFAULT '0' COMMENT '点击量',
  `startDate` datetime DEFAULT NULL COMMENT '开始时间',
  `endDate` datetime DEFAULT NULL COMMENT '结束时间',
  `ispublic` int(2) DEFAULT '1' COMMENT '是否公开，1：公开，0：不公开',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateDate` datetime DEFAULT NULL COMMENT '状态时间',
  `state` int(2) DEFAULT '1' COMMENT '状态，1：可用，0：不可用',
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_info
-- ----------------------------
INSERT INTO `course_info` VALUES ('85', '44', '226', '本课程对学生进行职业生涯教育和职业理想教育，使学生掌握职业生涯规划的基础知识和常用方法，树立正确的职业理想和职业观、择业观以及成才观，形成职业生涯规划的能力，做好适应社会、融入社会和就业、创业的准备。', '职业生涯规划', '53', null, '28', '1', '0', null, null, '1', '2017-06-01 10:22:54', '2017-09-14 11:33:32', '1');
INSERT INTO `course_info` VALUES ('86', '44', '226', '本课程对学生进行道德教育和法制教育，帮助学生了解文明礼仪的基本要求、职业道德的作用和基本规范，陶冶道德情操，增强职业道德意识，养成职业道德行为习惯；指导学生掌握与日常生活和职业活动密切相关的法律常识，树立法治观念，增强法律意识，成为懂法、守法、用法的公民。', '职业道德与法律', '54', null, '30', '1', '0', null, null, '1', '2017-06-01 11:07:17', '2017-09-14 11:33:50', '1');
INSERT INTO `course_info` VALUES ('87', '44', '226', '本课程对学生进行马克思主义哲学基本观点和方法及如何做人的教育，使学生了解马克思主义哲学与人生发展关系密切的基础知识，提高学生用马克思主义哲学的基本观点、方法分析和解决人生发展重要问题的能力，引导学生进行正确的价值判断和行为选择，形成积极向上的人生态度，为人生的健康发展奠定思想基础。', '哲学与人生', '55', null, '30', '1', '0', null, null, '1', '2017-06-01 11:44:45', '2017-09-14 11:33:23', '1');
INSERT INTO `course_info` VALUES ('88', '44', '226', '本课程对学生进行心理健康的基本知识、方法和意识的教育，帮助学生了解心理健康的基本知识，树立心理健康意识，掌握心理调适的方法。指导学生正确处理各种人际关系，学会合作与竞争，培养职业兴趣，提高应对挫折、求职就业、适应社会的能力。培养责任感、义务感和创新精神，养成自信、自律、敬业、乐群的心理品质，提高全体学生的心理健康水平和职业心理素质。', '心理健康', '56', null, '30', '1', '0', null, null, '1', '2017-06-01 13:50:45', '2017-09-14 11:33:11', '1');
INSERT INTO `course_info` VALUES ('89', '44', '226', '本课程对学生进行马克思主义相关基本观点教育和我国社会主义经济、政治、文化与社会建设常识教育，引导学生掌握马克思主义的相关基本观点和我国社会主义经济建设、政治建设、文化建设、社会建设的有关只是；提高思想政治素质，坚定走中国特色社会主义道路的信念；提高辨析社会现象，主动参与社会生活能力。', '经济政治与社会', '57', null, '28', '1', '0', null, null, '1', '2017-06-01 14:03:27', '2017-09-14 11:32:56', '1');
INSERT INTO `course_info` VALUES ('90', '47', '226', '《弟子规》采纳《论语 学而》篇中“弟子，入则孝，出则悌，谨而信，泛爱众，而亲仁，行有余力，则以学文”的文意，加以引申扩展，以三字一句，两句一韵的形式进行论述，阐释了“弟子”在家、在外、待人接物、为人处世、求学等方面具备的礼仪与规范，是中国文化的典范。', '《弟子规》与我', '58', null, '20', '1', '0', null, null, '1', '2017-06-01 16:09:02', '2017-09-14 11:35:11', '1');
INSERT INTO `course_info` VALUES ('91', '47', '226', ' 健康的心里和阳光的心态是中学生身心成长和发展的重要组成部分。本课程通过自我探索、自我发现和自我塑造三个方面，培养同学们健全的心态和健康的心里。帮助同学们提高对生活的幸福感。', '健康心理•阳光心态', '59', null, '20', '1', '0', null, null, '1', '2017-06-01 16:25:01', '2017-09-07 11:10:09', '1');
INSERT INTO `course_info` VALUES ('92', '47', '226', '安全是一切行为的前提保障，文明体现个人的行为修养。通过对具体安全常识和文明行为的梳理，培养同学们的安全防范意识和文明行为意识，促进校园和社会环境的稳定和优美。', '安全意识与文明行为', '60', null, '15', '1', '0', null, null, '1', '2017-06-01 16:31:10', '2017-09-14 11:35:31', '1');
INSERT INTO `course_info` VALUES ('93', '47', '226', '校园生活丰富多彩，同学们在成长过程中也将遇到各种问题。通过对学习生活中热点话题的讨论，帮助同学树立崇高理想，提高学习动力，处理人际关系，建立良好品格，养成良好习惯。', '快乐学习与幸福生活', '61', null, '15', '1', '0', null, null, '1', '2017-06-01 16:54:26', '2017-09-14 11:35:21', '1');
INSERT INTO `course_info` VALUES ('95', '47', '226', '`职业素养是人类在社会活动中需要遵守的行为规范。个体行为的总合构成了自身的职业素养，职业素养是内涵，个体行为是外在表象。职业素养对一个人一生的职业活动有着深远的影响，对同学们进行职业素养的培养，能更好指导同学们认识职业，了解职业，融入职业，最终干好一份职业。', '提升职业素养', '63', null, '10', '1', '0', null, null, '1', '2017-06-01 17:02:16', '2017-09-14 11:35:02', '1');
INSERT INTO `course_info` VALUES ('96', '47', '226', '在同学们实习和实践的过程中，经常会遇到各种问题，需要获得特别的关心和指导。通过对真实职场环境中的常见问题进行讨论，让同学们进一步提高对职场的适宜性，帮助同学平稳地从校园向社会过渡。', '人在职场', '64', null, '10', '1', '0', null, null, '1', '2017-06-01 17:15:51', '2017-11-27 10:03:20', '1');
INSERT INTO `course_info` VALUES ('98', '52', '226', '本课程对中职学生进行法制教育，帮助中职学生了解法治的基本观念，使中职学生懂得其在家庭、学校和社会中的法律权利和义务，让中职学生掌握依法自我保护和维权的方法，认识违法犯罪的危害和责任，养成遵纪守法的习惯，做法治中国的合格公民。', '中职学生法治教育在线课程资源', '65', null, '32', '1', '0', null, null, '1', '2017-06-02 11:29:25', '2017-09-14 11:39:27', '1');
INSERT INTO `course_info` VALUES ('100', '49', '226', '本课程立足做人立德、做事立业，旨在为学生全面发展和终身发展奠基。通过传统文化精神的传达，尤其是儒家文化中的“孝、义、忠、怒、礼、智、恭、宽、信、敏、惠”等内容，让学生对传统文化的精华在现实中，尤其是将来职场生活中的应用有感性知识。但愿我们的学生能在诵读诗文之后获得精神的洗礼和人性的升华。 ', '中职学生国学经典诵读在线课程资源', '66', null, '52', '1', '0', null, null, '1', '2017-09-05 10:55:42', '2017-09-14 11:38:08', '1');
INSERT INTO `course_info` VALUES ('102', '57', '226', '  本课程采用“微课”的设计理念，创新性地通过真人与动画交互的方式，让真实的教师与卡通人物共同体验、探讨、成长。同时，每个课时配备的丰富资源包，不仅包含教学设计、课件、活动、案例、延展阅读等板块，还原创了RAP说唱、手语、闯关游戏拼图等配套资源，为学校举行丰富多彩的校园活动提供了生动有趣的素材。\r\n  通过《中等职业学校学生公约在线课程资源》在学校的有效运用，将有利于规范中职生思想道德行为，促进广大中职生人生出彩；提升中职学校教育管理水平，不断提高教育管理的实效；完善中职学校德育制度，促进中职德育工作的规范发展。', '中等职业学校学生公约在线课程资源', '68', null, '10', '1', '0', null, null, '1', '2017-09-06 01:45:41', '2017-09-14 11:36:05', '1');
INSERT INTO `course_info` VALUES ('103', '48', '226', '    青春期是一个人身心发育的关键时期。但受中国传统的影响，中职学生所接受的教育与他们的好气往往不成正比，容易导致学生不能正确的对待，甚至因无知而造成对自己和他人的伤害。本课程精准定位中职学生年龄阶段，从生理发育到性与社会，系统地讲解，并注重引导学生形成正确的青春健康观，帮助学生健康成长。', '中职学生青春健康教育在线课程资源', '69', null, '32', '1', '0', null, null, '1', '2017-09-06 23:03:44', '2017-09-14 11:36:34', '1');
INSERT INTO `course_info` VALUES ('104', '61', '226', '中职学生音乐在线课程资源是运用视觉与听觉相结合的方式，来激发学生对音乐的学习兴趣，涉入音乐作品的类型也非常广泛，让学生在聆听音乐过程中感受不同风格、流派、体裁的音乐作品，提高学生的音乐修养。', '中职学生音乐欣赏在线课程资源', '70', null, '32', '1', '0', null, null, '1', '2017-09-14 13:53:47', '2017-09-14 15:43:40', '1');
INSERT INTO `course_info` VALUES ('105', '62', '226', '本课程围绕社会核心价值观的内容和要求，以“品格铸就幸福人生”为主旨，根据中职学生的认知规律和心理特点，与学生的学习、生活、社会实践等融合，通过品格教育，帮助学生提高对品格的理解和认同感，改善学生的认知态度和行为，培养学生的理想信念、广阔的眼界胸怀，更好地适应未来职业和社会发展的能力，达到“树理想、强意志、勇实践、讲奉献”的目标。使品格看得见摸得着，为学生的幸福人生奠定基础。', '中职学生品格教育在线课程资源', '71', null, '36', '1', '0', null, null, '1', '2017-09-25 16:37:21', '2017-09-28 13:05:00', '1');
INSERT INTO `course_info` VALUES ('106', '50', '226', '培育和践行社会主义核心价值观，是我们党立足推进中国特色社会主义伟大事业，实现中华民族伟大复兴中国梦的全局作出的重大决策，是凝魂聚气、强基固本的基础工程、战略工程，具有重大的实现意义和深远的历史意义。 ', '培育和践行社会主义核心价值观', '72', null, '12', '1', '0', null, null, '1', '2017-09-28 10:28:43', '2017-09-28 16:41:41', '1');
INSERT INTO `course_info` VALUES ('107', '50', '226', '“中国梦”这一时代解读既饱含着对近代以来中国历史的深刻洞悉，又彰显了全国各族人民的共同愿望和宏伟愿景，为党带领人民开创未来指明了前进方向。', '共筑中国梦、实现中华民族的伟大复兴', '73', null, '16', '1', '0', null, null, '1', '2017-09-28 16:47:38', '2017-09-28 17:09:04', '1');
INSERT INTO `course_info` VALUES ('108', '63', '226', '美术鉴赏系列课程包括：绘画、建筑、雕塑、壁画、工艺美术、公共艺术及其他多种艺术形式，旨在开阔中职学生现代的艺术鉴赏视野。用经典艺术作品鉴赏和配音解读的方式，普及艺术史常识，培养中职学校生良性审美意识，奠定美育基础；以历史中美术作品为索引，加强中职学生对国家的认同，对中华民族的热爱，增添民族自豪感，激发学习的主动性和使命感；通过课程中作品的阐述，引出历史背景，从而帮助中职学生对照历史课程，构建自己的人文知识架构体系。同时该课程资源与现行美术教材互补，用多种视觉观看方式，增加中职学生视觉经验；通过每课的开放式作业（议题），让学生创造性的创作、总结，达到多学科融合运用。\r\n', '中职学生美术鉴赏在线课程资源', '74', null, '30', '1', '0', null, null, '1', '2017-11-10 16:37:56', '2017-11-13 09:29:34', '1');
INSERT INTO `course_info` VALUES ('109', '64', '226', '《中职学生中外科技史必读在线课程资源》以时间为序，循序渐进地介绍了古代科学技术、近代科学技术、现代科学技术、未来科学技术的发展历程。以时间为序的介绍方式便于学生理解、掌握所讲的知识点。', '中职学生中外科技史必读在线课程资源', '75', null, '30', '1', '0', null, null, '1', '2017-12-12 16:35:57', '2017-12-12 17:15:34', '1');

-- ----------------------------
-- Table structure for course_lecturer_rls
-- ----------------------------
DROP TABLE IF EXISTS `course_lecturer_rls`;
CREATE TABLE `course_lecturer_rls` (
  `course_id` int(11) DEFAULT NULL,
  `lecturer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_lecturer_rls
-- ----------------------------
INSERT INTO `course_lecturer_rls` VALUES ('89', '20');
INSERT INTO `course_lecturer_rls` VALUES ('88', '20');
INSERT INTO `course_lecturer_rls` VALUES ('87', '20');
INSERT INTO `course_lecturer_rls` VALUES ('85', '20');
INSERT INTO `course_lecturer_rls` VALUES ('86', '20');
INSERT INTO `course_lecturer_rls` VALUES ('95', '4');
INSERT INTO `course_lecturer_rls` VALUES ('90', '4');
INSERT INTO `course_lecturer_rls` VALUES ('93', '4');
INSERT INTO `course_lecturer_rls` VALUES ('92', '4');
INSERT INTO `course_lecturer_rls` VALUES ('102', '20');
INSERT INTO `course_lecturer_rls` VALUES ('103', '19');
INSERT INTO `course_lecturer_rls` VALUES ('100', '21');
INSERT INTO `course_lecturer_rls` VALUES ('98', '22');
INSERT INTO `course_lecturer_rls` VALUES ('105', '7');
INSERT INTO `course_lecturer_rls` VALUES ('96', '4');
INSERT INTO `course_lecturer_rls` VALUES ('109', '24');

-- ----------------------------
-- Table structure for course_praise_info
-- ----------------------------
DROP TABLE IF EXISTS `course_praise_info`;
CREATE TABLE `course_praise_info` (
  `praise_id` int(11) NOT NULL,
  `open_id` int(11) DEFAULT NULL,
  `create_dt` datetime DEFAULT NULL,
  `state_dt` datetime DEFAULT NULL,
  `state` int(2) DEFAULT '1',
  PRIMARY KEY (`praise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_praise_info
-- ----------------------------

-- ----------------------------
-- Table structure for course_type
-- ----------------------------
DROP TABLE IF EXISTS `course_type`;
CREATE TABLE `course_type` (
  `course_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `type_name` varchar(200) DEFAULT NULL,
  `type_info` varchar(200) DEFAULT NULL,
  `courseCount` int(11) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `classhour` float DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `stateDate` datetime DEFAULT NULL,
  `state` int(2) DEFAULT '1',
  PRIMARY KEY (`course_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_type
-- ----------------------------
INSERT INTO `course_type` VALUES ('42', '0', '226', '1', '中等职业学校德育在线课程资源库', '中等职业学校德育在线课程资源库', null, null, '0', '2017-05-31 17:24:12', '2017-05-31 17:24:12', '1');
INSERT INTO `course_type` VALUES ('44', '42', '226', '1', '中职学校德育部颁五门课程在线课程资源', '中职学校德育部颁五门课程在线课程资源', null, 'course/type/201706/20170606/bubanwumen.png', '146', '2017-05-31 17:27:34', '2017-05-31 17:27:34', '1');
INSERT INTO `course_type` VALUES ('47', '42', '226', '1', '中职学校班主任每周一课在线课程资源', '中职学校班主任每周一课在线课程资源', null, 'course/type/201706/20170606/meizhouyike.png', '90', '2017-06-01 09:13:43', '2017-09-06 01:12:45', '1');
INSERT INTO `course_type` VALUES ('48', '42', '226', '1', '中职学生青春健康教育在线课程资源', '中职学生青春健康教育在线课程资源', null, 'course/type/201706/20170606/qingchun.png', '32', '2017-06-01 09:14:52', '2017-09-07 01:04:21', '1');
INSERT INTO `course_type` VALUES ('49', '42', '226', '1', '中职学生国学经典诵读在线课程资源', '中职学生国学经典诵读在线课程资源', null, 'course/type/201709/20170914/guoxue.png', '32', '2017-06-01 09:25:17', '2017-09-06 01:13:15', '1');
INSERT INTO `course_type` VALUES ('50', '42', '226', '1', '中职学生理想信念与中国精神教育在线课程', '中职学生理想信念与中国精神教育在线课程资源', null, 'course/type/201709/20170914/lixiangxingnian.png', '28', '2017-06-01 09:38:24', '2017-06-01 09:38:24', '1');
INSERT INTO `course_type` VALUES ('52', '42', '226', '1', '中职学生法治教育在线课程资源', '中职学生法治教育在线课程资源', null, 'course/type/201709/20170914/fazhikecheng.png', '32', '2017-06-01 09:40:17', '2017-06-01 09:40:17', '1');
INSERT INTO `course_type` VALUES ('57', '42', '226', '1', '中等职业学校学生公约在线课程资源', '中等职业学校学生公约在线课程资源', null, 'course/type/201706/20170606/gongyue.png', '10', '2017-09-06 01:44:18', '2017-09-07 01:04:24', '1');
INSERT INTO `course_type` VALUES ('60', '0', '226', '1', '中职学生职业素养在线课程资源库', '中职学生职业素养培养在线课程资源库', null, null, '0', '2017-09-14 13:51:56', '2017-09-14 13:51:56', '1');
INSERT INTO `course_type` VALUES ('61', '60', '226', '1', '中职学生音乐欣赏在线课程资源', '中职学生音乐欣赏在线课程资源', null, 'course/type/201709/20170914/music.png', '32', '2017-09-14 14:17:51', '2017-09-14 14:17:51', '1');
INSERT INTO `course_type` VALUES ('62', '42', '226', '1', '中职学生品格教育在线课程资源', '中职学生品格教育在线课程资源', null, 'course/type/201709/20170914/pingge.png', '36', '2017-09-25 16:33:59', '2017-09-25 16:33:59', '1');
INSERT INTO `course_type` VALUES ('63', '60', '226', '1', '中职学生美术鉴赏在线课程资源', '中职学生美术鉴赏在线课程资源', null, 'course/type/201709/20170914/meishu.png', '32', '2017-11-10 16:37:33', '2017-11-10 16:37:33', '1');
INSERT INTO `course_type` VALUES ('64', '60', '226', '1', '中职学生中外科技史必读在线课程资源', '中职学生中外科技史必读在线课程资源', null, 'course/type/201709/20170914/zwkxs.png', '32', '2017-12-12 16:39:29', '2017-12-12 16:39:29', '1');

-- ----------------------------
-- Table structure for course_type_copy
-- ----------------------------
DROP TABLE IF EXISTS `course_type_copy`;
CREATE TABLE `course_type_copy` (
  `course_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `type_name` varchar(200) DEFAULT NULL,
  `type_info` varchar(200) DEFAULT NULL,
  `courseCount` int(11) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `classhour` float DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `stateDate` datetime DEFAULT NULL,
  `state` int(2) DEFAULT '1',
  PRIMARY KEY (`course_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_type_copy
-- ----------------------------
INSERT INTO `course_type_copy` VALUES ('89', '0', '2', '1', '中职德育课程教学（部颁5门课程）', '中职德育课程教学（部颁5门课程）', null, 'course/type/201703/20170322/C62C436DA25A24A74417F7DA82088A6D_middle_.png', '0', '2017-03-22 16:15:02', '2017-03-22 16:15:02', '1');
INSERT INTO `course_type_copy` VALUES ('90', '0', '2', '1', '中职学校班主任每周一课', '中职学校班主任每周一课', null, 'course/type/201703/20170322/89E8C02DDFFF1B156054954491A37C0E_middle_.png', '0', '2017-03-22 16:16:01', '2017-03-22 16:16:01', '1');

-- ----------------------------
-- Table structure for cover_info
-- ----------------------------
DROP TABLE IF EXISTS `cover_info`;
CREATE TABLE `cover_info` (
  `cover_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `maxUrl` varchar(200) DEFAULT NULL,
  `middleUrl` varchar(200) DEFAULT NULL,
  `minUrl` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `schoolId` int(11) DEFAULT NULL,
  `state` int(1) DEFAULT '1',
  PRIMARY KEY (`cover_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cover_info
-- ----------------------------
INSERT INTO `cover_info` VALUES ('53', '职业生涯规划.png', '/cover/201706/20170601/46ED80BEC7244D5E6139DCEECCDFF3181496283760296.png', null, null, '2017-06-01 10:22:40', '1', '1');
INSERT INTO `cover_info` VALUES ('54', '8d12d0beea074a089528ecc53baf83fa.jpg', '/cover/201706/20170601/C1ED8BD6217D9FE824C3C7F0A100F6071496286431880.jpg', null, null, '2017-06-01 11:07:11', '1', '1');
INSERT INTO `cover_info` VALUES ('55', '48d9a3889b9b41f9ac2c5622bd87f6bf.jpg', '/cover/201706/20170601/2F9381D92BE66BBD9454F0C94CAA5D5C1496296935025.jpg', null, null, '2017-06-01 11:44:29', '1', '1');
INSERT INTO `cover_info` VALUES ('56', '2bdac8dd0b314f49b1f5ccdf8b54400f.jpg', '/cover/201706/20170601/25023A3AFA8C6AAE0CBE976BC0BB9B1F1496296238014.jpg', null, null, '2017-06-01 13:50:38', '1', '1');
INSERT INTO `cover_info` VALUES ('57', '880c9c142a224741aefc332ee40bd399.jpg', '/cover/201706/20170601/73E51A41139C9E8D1285269D4C01D3B51496297002040.jpg', null, null, '2017-06-01 14:03:22', '1', '1');
INSERT INTO `cover_info` VALUES ('58', '5b510abad1f543e4bb7e40a1e1da14da.jpg', '/cover/C060EE723550375F285260F4FDA12AF41496734293246.jpg', null, null, '2017-06-01 16:09:00', '1', '1');
INSERT INTO `cover_info` VALUES ('59', '9c9d2fb272f4412787e5ccdeceff808b.png', '/cover/C64F56AE8093D0108019166DCF7D98971496734275776.png', null, null, '2017-06-01 16:24:57', '1', '1');
INSERT INTO `cover_info` VALUES ('60', '814c08142e9d4d17bef0971f8d3a6c42.png', '/cover/DD23DE8DF51E83358D5FC6158483BA4C1496734254301.png', null, null, '2017-06-01 16:31:04', '1', '1');
INSERT INTO `cover_info` VALUES ('61', '7a358eb1ada54234a9bb574dcd65d2f3.png', '/cover/3C1B207DADF06591612B5C17C860A5531496734230779.png', null, null, '2017-06-01 16:54:21', '1', '1');
INSERT INTO `cover_info` VALUES ('62', '0ac62901a2d347159cf4d81cecb98a88.png', '/cover/201706/20170601/FA8CBB830AC9C64CC2FCF64CCD059DA01496307727305.png', null, null, '2017-06-01 17:02:07', '1', '1');
INSERT INTO `cover_info` VALUES ('63', '0ac62901a2d347159cf4d81cecb98a88.png', '/cover/FA8CBB830AC9C64CC2FCF64CCD059DA01496734211900.png', null, null, '2017-06-01 17:02:07', '1', '1');
INSERT INTO `cover_info` VALUES ('64', 'c76718ee283b4904bdf1d2810207e68d.png', '/cover/7CB524EAFD003D4E75A5A847E759967A1496734172645.png', null, null, '2017-06-01 17:15:47', '1', '1');
INSERT INTO `cover_info` VALUES ('65', '法治教育.png', '/cover/A2CEA3733574BD55CBB5547F434511B51496734911983.png', null, null, '2017-06-02 11:28:25', '1', '1');
INSERT INTO `cover_info` VALUES ('66', 'f35bcc0ed5f14ba69320e262f16be435.png', '/cover/201709/20170905/FF2FF64074149190E83F62BC619336941504580136807.png', null, null, '2017-09-05 10:55:36', '1', '1');
INSERT INTO `cover_info` VALUES ('67', '3552FCB89AEFF0518D967C38898B3CDB1498791808733.png', '/cover/201709/20170906/3552FCB89AEFF0518D967C38898B3CDB1504633513674.png', null, null, '2017-09-06 01:45:13', '1', '1');
INSERT INTO `cover_info` VALUES ('68', '3552FCB89AEFF0518D967C38898B3CDB1498791808733.png', '/cover/201709/20170906/3552FCB89AEFF0518D967C38898B3CDB1504633513674.png', null, null, '2017-09-06 01:45:13', '1', '1');
INSERT INTO `cover_info` VALUES ('69', 'qingchunjiankang.png', '/cover/201709/20170906/B4D4681EF7CDDAEA71C7B8DC446197311504710214161.png', null, null, '2017-09-06 23:03:34', '1', '1');
INSERT INTO `cover_info` VALUES ('70', '1-1F3010955520-L.png', '/cover/D2CEBF1015D7A4A67879DC4FC289064B1505372357770.png', null, null, '2017-09-14 14:59:17', '1', '1');
INSERT INTO `cover_info` VALUES ('71', '49FE3B599CA01DD904A5959EA50638E91498724540353.png', '/cover/49FE3B599CA01DD904A5959EA50638E91506328584897.png', null, null, '2017-09-25 16:36:24', '1', '1');
INSERT INTO `cover_info` VALUES ('72', '66DCB72787BC5610F236E4E26036076C1498724558125.png', '/cover/66DCB72787BC5610F236E4E26036076C1506565436444.png', null, null, '2017-09-28 10:23:56', '1', '1');
INSERT INTO `cover_info` VALUES ('73', '360截图20170928164134666.jpg', '/cover/BF119D02D2278E175C8A33CEBEBDAA6C1506588455914.jpg', null, null, '2017-09-28 16:47:35', '1', '1');
INSERT INTO `cover_info` VALUES ('74', '360截图20171110165933268.jpg', '/cover/7D70E4C3E7E06E42868984C6DFCE3D9F1510304554468.jpg', null, null, '2017-11-10 17:02:34', '1', '1');
INSERT INTO `cover_info` VALUES ('75', 'QQ截图20171212163442.jpg', '/cover/50F8C252D3529BFD17A71AB408FA9D511513067733628.jpg', null, null, '2017-12-12 16:35:33', '1', '1');

-- ----------------------------
-- Table structure for discuss_info
-- ----------------------------
DROP TABLE IF EXISTS `discuss_info`;
CREATE TABLE `discuss_info` (
  `user_id` int(11) DEFAULT NULL,
  `discuss_id` int(11) NOT NULL AUTO_INCREMENT,
  `theme_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `content` text,
  `verify` int(2) DEFAULT NULL,
  PRIMARY KEY (`discuss_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of discuss_info
-- ----------------------------
INSERT INTO `discuss_info` VALUES ('287', '1', '1', null, '2017-12-18 16:32:47', '我觉得这个说法是正确的', null);
INSERT INTO `discuss_info` VALUES ('287', '2', '1', null, '2017-12-18 16:36:43', '正确', null);

-- ----------------------------
-- Table structure for discuss_theme_info
-- ----------------------------
DROP TABLE IF EXISTS `discuss_theme_info`;
CREATE TABLE `discuss_theme_info` (
  `theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `open_id` int(11) DEFAULT NULL,
  `title` text,
  `verify` int(2) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `isTop` int(1) DEFAULT '0',
  `isEnable` int(1) DEFAULT '1',
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of discuss_theme_info
-- ----------------------------
INSERT INTO `discuss_theme_info` VALUES ('1', '226', '61', '同学们怎么看待\"心理咨询的对象是在日常生活中遇到困难或挫折而产生心理困扰的正常人群\"这一说法？', null, '2017-12-18 16:31:19', null, '0', '1');

-- ----------------------------
-- Table structure for examine_task_paper_info
-- ----------------------------
DROP TABLE IF EXISTS `examine_task_paper_info`;
CREATE TABLE `examine_task_paper_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `useType` int(1) DEFAULT NULL,
  `openCourseId` int(11) DEFAULT NULL,
  `schoolId` int(11) DEFAULT NULL,
  `paperIds` varchar(200) DEFAULT NULL,
  `videoId` int(11) DEFAULT NULL,
  `createUserId` int(11) DEFAULT NULL,
  `paperNum` int(11) DEFAULT NULL,
  `isTimeLimit` int(1) DEFAULT '0',
  `limitTime` int(11) DEFAULT '0',
  `showTime` int(11) DEFAULT '0',
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of examine_task_paper_info
-- ----------------------------
INSERT INTO `examine_task_paper_info` VALUES ('1', '关注心理健康', '1', '61', '1', '1,2', '580', '226', '2', '0', '0', '20', '2017-12-18 16:57:20');

-- ----------------------------
-- Table structure for feedback_info
-- ----------------------------
DROP TABLE IF EXISTS `feedback_info`;
CREATE TABLE `feedback_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `content` text,
  `phone` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `handleDate` datetime DEFAULT NULL,
  `isSolve` int(2) DEFAULT '0',
  `state` int(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of feedback_info
-- ----------------------------

-- ----------------------------
-- Table structure for feedback_type
-- ----------------------------
DROP TABLE IF EXISTS `feedback_type`;
CREATE TABLE `feedback_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of feedback_type
-- ----------------------------
INSERT INTO `feedback_type` VALUES ('1', '登录问题');
INSERT INTO `feedback_type` VALUES ('2', '课程学习');
INSERT INTO `feedback_type` VALUES ('3', '资源下载');
INSERT INTO `feedback_type` VALUES ('4', '其他问题');

-- ----------------------------
-- Table structure for file_info
-- ----------------------------
DROP TABLE IF EXISTS `file_info`;
CREATE TABLE `file_info` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源标示',
  `resource_type_id` int(11) DEFAULT NULL COMMENT '资源类型',
  `file_type_id` int(11) DEFAULT NULL COMMENT '文件类型',
  `file_name` varchar(100) DEFAULT NULL COMMENT '文件名',
  `file_suffix` varchar(20) DEFAULT NULL COMMENT '文件后缀',
  `file_size` bigint(20) DEFAULT NULL COMMENT '文件大小',
  `url` varchar(255) DEFAULT NULL COMMENT '路径',
  `down_num` int(11) DEFAULT '0' COMMENT '下载次数',
  `schoolId` int(11) DEFAULT NULL COMMENT '学校ID',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `state` int(2) DEFAULT '1' COMMENT '状态:0：删除,1：正常，2：分享，3：审核',
  `allow_down` int(1) DEFAULT '1' COMMENT '0：不允许下载，1：允许下载',
  `stu_allow_down` int(1) DEFAULT '0' COMMENT '0：不允许学生,1：允许学生下载',
  `create_user_id` int(11) DEFAULT NULL COMMENT '创建者',
  `info` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file_info
-- ----------------------------

-- ----------------------------
-- Table structure for file_info_tmp
-- ----------------------------
DROP TABLE IF EXISTS `file_info_tmp`;
CREATE TABLE `file_info_tmp` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源标示',
  `resource_type_id` int(11) DEFAULT NULL COMMENT '资源类型',
  `file_type_id` int(11) DEFAULT NULL COMMENT '文件类型',
  `file_name` varchar(100) DEFAULT NULL COMMENT '文件名',
  `file_suffix` varchar(20) DEFAULT NULL COMMENT '文件后缀',
  `file_size` bigint(20) DEFAULT NULL COMMENT '文件大小',
  `url` varchar(255) DEFAULT NULL COMMENT '路径',
  `down_num` int(11) DEFAULT '0' COMMENT '下载次数',
  `schoolId` int(11) DEFAULT NULL COMMENT '学校ID',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `state` int(2) DEFAULT '1' COMMENT '状态:0：删除,1：正常，2：分享，3：审核',
  `allow_down` int(1) DEFAULT '1' COMMENT '0：不允许下载，1：允许下载',
  `stu_allow_down` int(1) DEFAULT '0' COMMENT '0：不允许学生,1：允许学生下载',
  `info` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_user_id` int(11) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1733 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file_info_tmp
-- ----------------------------
INSERT INTO `file_info_tmp` VALUES ('1077', null, '1', '4. 正确利用合同参与民事活动.rar', 'rar', '11074', 'resource/86/201709/20170907/9E4BD5075F91380E87E74D925E8077B1504741288775.rar', '0', '1', '2017-09-07 07:41:28', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1078', null, '1', '第一课　生殖系统与健康（讲课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504749193234.mp4', '0', '1', '2017-09-07 09:53:13', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1079', null, '1', '第一课　生殖系统与健康（说课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504749231481.mp4', '0', '1', '2017-09-07 09:53:51', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1080', null, '1', '第一课　生殖系统与健康.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504749241250.rar', '0', '1', '2017-09-07 09:54:01', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1081', null, '1', '第二课   新生命的孕育（讲课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504749482073.mp4', '0', '1', '2017-09-07 09:58:02', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1082', null, '1', '第二课   新生命的孕育（说课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504749552492.mp4', '0', '1', '2017-09-07 09:59:12', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1083', null, '1', '第二课   新生命的孕育（讲课）.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504749572141.rar', '0', '1', '2017-09-07 09:59:32', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1084', null, '1', '第二课   新生命的孕育.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504749612361.rar', '0', '1', '2017-09-07 10:00:12', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1085', null, '1', '第三课　身体发育与困惑（讲课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504749671610.mp4', '0', '1', '2017-09-07 10:01:11', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1086', null, '1', '第三课　身体发育与困惑（说课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504749706205.mp4', '0', '1', '2017-09-07 10:01:46', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1087', null, '1', '第三课　身体发育与困惑.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504749716824.rar', '0', '1', '2017-09-07 10:01:56', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1088', null, '1', '第四课　月经与遗精（讲课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504749755256.mp4', '0', '1', '2017-09-07 10:02:35', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1089', null, '1', '第四课　月经与遗精（说课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504749799081.mp4', '0', '1', '2017-09-07 10:03:19', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1090', null, '1', '第四课　月经与遗精.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504749806146.rar', '0', '1', '2017-09-07 10:03:26', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1091', null, '1', '第五课　性的觉醒（讲课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504749882345.mp4', '0', '1', '2017-09-07 10:04:42', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1092', null, '1', '第五课　性的觉醒（说课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504749904482.mp4', '0', '1', '2017-09-07 10:05:04', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1093', null, '1', '第五课　性的觉醒.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504749912081.rar', '0', '1', '2017-09-07 10:05:12', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1094', null, '1', '第一课　性心理现象.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750148055.mp4', '0', '1', '2017-09-07 10:09:08', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1095', null, '1', '第一课　性心理现象（说课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750174918.mp4', '0', '1', '2017-09-07 10:09:34', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1096', null, '1', '第一课　性心理现象.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504750184960.rar', '0', '1', '2017-09-07 10:09:44', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1097', null, '1', '第二课　体像烦恼.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750212939.mp4', '0', '1', '2017-09-07 10:10:12', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1098', null, '1', '第二课　体像烦恼（说课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750238096.mp4', '0', '1', '2017-09-07 10:10:38', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1099', null, '1', '第二课　体像烦恼.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504750252655.rar', '0', '1', '2017-09-07 10:10:52', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1100', null, '1', '第三课　性别认同.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750292623.mp4', '0', '1', '2017-09-07 10:11:32', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1101', null, '1', '第三课　性别认同（说课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750318276.mp4', '0', '1', '2017-09-07 10:11:58', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1102', null, '1', '第三课　性别认同.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504750324954.rar', '0', '1', '2017-09-07 10:12:04', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1103', null, '1', '第四课　亲子关系.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750364082.mp4', '0', '1', '2017-09-07 10:12:44', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1104', null, '1', '第四课　亲子关系（说课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750391282.mp4', '0', '1', '2017-09-07 10:13:11', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1105', null, '1', '第四课　亲子关系.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504750397647.rar', '0', '1', '2017-09-07 10:13:17', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1106', null, '1', '第五课　偶像崇拜.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750424710.mp4', '0', '1', '2017-09-07 10:13:44', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1107', null, '1', '第五课　偶像崇拜（说课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750470797.mp4', '0', '1', '2017-09-07 10:14:30', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1108', null, '1', '第五课　偶像崇拜.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504750477911.rar', '0', '1', '2017-09-07 10:14:37', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1109', null, '1', '第一课　朋友.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750660307.mp4', '0', '1', '2017-09-07 10:17:40', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1110', null, '1', '第一课　朋友（说课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750686026.mp4', '0', '1', '2017-09-07 10:18:06', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1111', null, '1', '第一课　朋友.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504750691844.rar', '0', '1', '2017-09-07 10:18:11', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1112', null, '1', '第二课　同伴压力.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750724487.mp4', '0', '1', '2017-09-07 10:18:44', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1113', null, '1', '第二课　同伴压力（说课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750746480.mp4', '0', '1', '2017-09-07 10:19:06', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1114', null, '1', '第二课　同伴压力.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504750752169.rar', '0', '1', '2017-09-07 10:19:12', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1115', null, '1', '第三课　异性交往.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750776445.mp4', '0', '1', '2017-09-07 10:19:36', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1116', null, '1', '第三课　异性交往（说课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750798561.mp4', '0', '1', '2017-09-07 10:19:58', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1117', null, '1', '第三课　异性交往.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504750805357.rar', '0', '1', '2017-09-07 10:20:05', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1118', null, '1', '第四课    情感的烦恼.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750832745.mp4', '0', '1', '2017-09-07 10:20:32', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1119', null, '1', '第四课    情感的烦恼（说课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750854725.mp4', '0', '1', '2017-09-07 10:20:54', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1120', null, '1', '第四课    情感的烦恼.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504750861033.rar', '0', '1', '2017-09-07 10:21:01', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1121', null, '1', '第五课    真爱.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750887342.mp4', '0', '1', '2017-09-07 10:21:27', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1122', null, '1', '第五课   真爱（说课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750914871.mp4', '0', '1', '2017-09-07 10:21:54', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1123', null, '1', '第五课    真爱.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504750923714.rar', '0', '1', '2017-09-07 10:22:03', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1124', null, '1', '第六课　分手与失恋.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750948299.mp4', '0', '1', '2017-09-07 10:22:28', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1125', null, '1', '第六课　分手与失恋（说课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750971637.mp4', '0', '1', '2017-09-07 10:22:51', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1126', null, '1', '第六课　分手与失恋.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504750979789.rar', '0', '1', '2017-09-07 10:22:59', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1127', null, '1', '第七课　学会拒绝.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751006031.mp4', '0', '1', '2017-09-07 10:23:26', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1128', null, '1', '第七课　学会拒绝（说课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751026742.mp4', '0', '1', '2017-09-07 10:23:46', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1129', null, '1', '第七课　学会拒绝.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504751033649.rar', '0', '1', '2017-09-07 10:23:53', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1130', null, '1', '第一课    性行为的选择.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751100282.mp4', '0', '1', '2017-09-07 10:25:00', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1131', null, '1', '第一课    性行为的选择（说课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751122796.mp4', '0', '1', '2017-09-07 10:25:22', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1132', null, '1', '第一课    性行为的选择.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504751134236.rar', '0', '1', '2017-09-07 10:25:34', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1133', null, '1', '第二课    避孕知识.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751168964.mp4', '0', '1', '2017-09-07 10:26:09', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1134', null, '1', '第二课    避孕知识（说课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751191165.mp4', '0', '1', '2017-09-07 10:26:31', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1135', null, '1', '第二课    避孕知识.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504751197403.rar', '0', '1', '2017-09-07 10:26:37', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1136', null, '1', '第三课    意外怀孕以后.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751219801.mp4', '0', '1', '2017-09-07 10:26:59', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1137', null, '1', '第三课    意外怀孕以后（说课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751241807.mp4', '0', '1', '2017-09-07 10:27:21', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1138', null, '1', '第三课    意外怀孕以后.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504751247577.rar', '0', '1', '2017-09-07 10:27:27', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1139', null, '1', '第四课    预防性侵害.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751269441.mp4', '0', '1', '2017-09-07 10:27:49', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1140', null, '1', '第四课    预防性侵害(说课).mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751293725.mp4', '0', '1', '2017-09-07 10:28:13', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1141', null, '1', '第四课    预防性侵害.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504751301227.rar', '0', '1', '2017-09-07 10:28:21', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1142', null, '1', '第五课    拒绝约会暴力.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751326813.mp4', '0', '1', '2017-09-07 10:28:46', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1143', null, '1', '第五课    拒绝约会暴力（说课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751348297.mp4', '0', '1', '2017-09-07 10:29:08', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1144', null, '1', '第五课    拒绝约会暴力.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504751354753.rar', '0', '1', '2017-09-07 10:29:14', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1145', null, '1', '第六课    酒精与毒品.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751375320.mp4', '0', '1', '2017-09-07 10:29:35', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1146', null, '1', '第六课    酒精与毒品（说课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751396322.mp4', '0', '1', '2017-09-07 10:29:56', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1147', null, '1', '第六课    酒精与毒品.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504751402787.rar', '0', '1', '2017-09-07 10:30:02', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1148', null, '1', '第七课    远离性病.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751427876.mp4', '0', '1', '2017-09-07 10:30:27', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1149', null, '1', '第七课    远离性病（说课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751448933.mp4', '0', '1', '2017-09-07 10:30:48', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1150', null, '1', '第七课    远离性病.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504751455267.rar', '0', '1', '2017-09-07 10:30:55', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1151', null, '1', '第一课   性与文化.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751481894.mp4', '0', '1', '2017-09-07 10:31:21', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1152', null, '1', '第一课   性与文化（说课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751503282.mp4', '0', '1', '2017-09-07 10:31:43', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1153', null, '1', '第一课   性与文化.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504751508554.rar', '0', '1', '2017-09-07 10:31:48', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1154', null, '1', '第二课   性别平等.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751531025.mp4', '0', '1', '2017-09-07 10:32:11', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1155', null, '1', '第二课   性别平等（说课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751551531.mp4', '0', '1', '2017-09-07 10:32:31', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1156', null, '1', '第二课   性别平等.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504751557271.rar', '0', '1', '2017-09-07 10:32:37', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1157', null, '1', '第三课　性权利.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751581741.mp4', '0', '1', '2017-09-07 10:33:01', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1158', null, '1', '第三课　性权利（说课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751603798.mp4', '0', '1', '2017-09-07 10:33:23', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1159', null, '1', '第三课　性权利.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504751609114.rar', '0', '1', '2017-09-07 10:33:29', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1160', null, '1', '第四课　多元的性.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751635071.mp4', '0', '1', '2017-09-07 10:33:55', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1161', null, '1', '第四课　多元的性（说课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751655998.mp4', '0', '1', '2017-09-07 10:34:16', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1162', null, '1', '第四课　多元的性.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504751661699.rar', '0', '1', '2017-09-07 10:34:21', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1163', null, '1', '第五课　性道德.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751682749.mp4', '0', '1', '2017-09-07 10:34:42', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1164', null, '1', '第五课　性道德（说课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751703923.mp4', '0', '1', '2017-09-07 10:35:03', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1165', null, '1', '第五课　性道德.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504751709044.rar', '0', '1', '2017-09-07 10:35:09', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1166', null, '1', '第六课　性法律.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751740145.mp4', '0', '1', '2017-09-07 10:35:40', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1167', null, '1', '第六课　性法律（说课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751760450.mp4', '0', '1', '2017-09-07 10:36:00', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1168', null, '1', '第六课　性法律.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504751765799.rar', '0', '1', '2017-09-07 10:36:05', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1169', null, '1', '第七课　婚姻与家庭.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751787848.mp4', '0', '1', '2017-09-07 10:36:27', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1170', null, '1', '职业生涯发展的目标与措施.mp4', 'mp4', '15797610', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504751794487.mp4', '0', '1', '2017-09-07 10:36:34', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1171', null, '1', '第七课　婚姻与家庭（说课）.mp4', 'mp4', '15797610', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751812184.mp4', '0', '1', '2017-09-07 10:36:52', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1172', null, '1', '第七课　婚姻与家庭.rar', 'rar', '1178', 'resource/103/files/F57A5C1439ACAF839F0A624B21D2AC891504751817377.rar', '0', '1', '2017-09-07 10:36:57', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1173', null, '1', '职业生涯发展的目标与措施（说课）.mp4', 'mp4', '15797610', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504751818337.mp4', '0', '1', '2017-09-07 10:36:58', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1174', null, '1', '职业生涯发展的目标与措施.rar', 'rar', '1178', 'resource/85/files/F57A5C1439ACAF839F0A624B21D2AC891504751835756.rar', '0', '1', '2017-09-07 10:37:15', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1175', null, '1', '制定职业生涯规划意向书.mp4', 'mp4', '15797610', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504751859323.mp4', '0', '1', '2017-09-07 10:37:39', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1176', null, '1', '职业生涯发展的目标与措施.mp4', 'mp4', '15797610', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504751891384.mp4', '0', '1', '2017-09-07 10:38:11', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1177', null, '1', '制定职业生涯规划意向书.mp4', 'mp4', '15797610', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504751917820.mp4', '0', '1', '2017-09-07 10:38:37', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1178', null, '1', '制定职业生涯规划意向书（说课）.mp4', 'mp4', '15797610', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504751946628.mp4', '0', '1', '2017-09-07 10:39:06', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1179', null, '1', '制定职业生涯规划意向书.rar', 'rar', '1178', 'resource/85/files/F57A5C1439ACAF839F0A624B21D2AC891504751992917.rar', '0', '1', '2017-09-07 10:39:52', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1180', null, '1', '第一课 创业的意义.mp4', 'mp4', '15797610', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504752073813.mp4', '0', '1', '2017-09-07 10:41:13', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1181', null, '1', '契约精神：诚信守法从不作弊开始.mp4', 'mp4', '15797610', 'resource/96/video/C430C8A7597FEA7595AA70239506716E1504752132579.mp4', '0', '1', '2017-09-07 10:42:12', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1182', null, '1', '契约精神：诚信守法从不作弊开始.rar', 'rar', '1178', 'resource/96/files/F57A5C1439ACAF839F0A624B21D2AC891504752146174.rar', '0', '1', '2017-09-07 10:42:26', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1183', null, '1', '职业道德与法律.rar', 'rar', '1178', 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752168221.rar', '0', '1', '2017-09-07 10:42:48', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1184', null, '1', '第一课 塑造自己的良好形象—学生日常礼仪（.rar', 'rar', '1178', 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752205496.rar', '0', '1', '2017-09-07 10:43:25', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1185', null, '1', '中国梦复兴之路，法律点灯.mp4', 'mp4', '15797610', 'resource/96/video/C430C8A7597FEA7595AA70239506716E1504752206547.mp4', '0', '1', '2017-09-07 10:43:26', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1186', null, '1', '中国梦复兴之路，法律点灯.rar', 'rar', '1178', 'resource/96/files/F57A5C1439ACAF839F0A624B21D2AC891504752214153.rar', '0', '1', '2017-09-07 10:43:34', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1187', null, '1', '第二课 展示自己的职业风采—常见的职业礼仪.rar', 'rar', '1178', 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752239988.rar', '0', '1', '2017-09-07 10:44:00', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1188', null, '1', '第一课 沟通，从心开始.mp4', 'mp4', '15797610', 'resource/96/video/C430C8A7597FEA7595AA70239506716E1504752334979.mp4', '0', '1', '2017-09-07 10:45:35', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1189', null, '1', '第一课 沟通，从心开始.rar', 'rar', '1178', 'resource/96/files/F57A5C1439ACAF839F0A624B21D2AC891504752343173.rar', '0', '1', '2017-09-07 10:45:43', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1190', null, '1', '第一课 沟通，从心开始.mp4', 'mp4', '15797610', 'resource/96/video/C430C8A7597FEA7595AA70239506716E1504752368348.mp4', '0', '1', '2017-09-07 10:46:08', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1191', null, '1', '第一课 沟通，从心开始(说课).mp4', 'mp4', '15797610', 'resource/96/video/C430C8A7597FEA7595AA70239506716E1504752401897.mp4', '0', '1', '2017-09-07 10:46:41', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1192', null, '1', '第一课 沟通，从心开始.rar', 'rar', '1178', 'resource/96/files/F57A5C1439ACAF839F0A624B21D2AC891504752407247.rar', '0', '1', '2017-09-07 10:46:47', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1193', null, '1', '第二课 表达与倾听.mp4', 'mp4', '15797610', 'resource/96/video/C430C8A7597FEA7595AA70239506716E1504752431764.mp4', '0', '1', '2017-09-07 10:47:11', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1194', null, '1', '第二课 表达与倾听(说课).mp4', 'mp4', '15797610', 'resource/96/video/C430C8A7597FEA7595AA70239506716E1504752454186.mp4', '0', '1', '2017-09-07 10:47:34', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1195', null, '1', '第二课 表达与倾听.rar', 'rar', '1178', 'resource/96/files/F57A5C1439ACAF839F0A624B21D2AC891504752459520.rar', '0', '1', '2017-09-07 10:47:39', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1196', null, '1', '第一课 我国公民的基本道德规范.rar', 'rar', '1178', 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752566730.rar', '0', '1', '2017-09-07 10:49:26', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1197', null, '1', '第三课 拒绝与冲突管理.mp4', 'mp4', '15797610', 'resource/96/video/C430C8A7597FEA7595AA70239506716E1504752587703.mp4', '0', '1', '2017-09-07 10:49:47', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1198', null, '1', '第二课 幸福生活的家庭美德.rar', 'rar', '1178', 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752589047.rar', '0', '1', '2017-09-07 10:49:49', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1199', null, '1', '第三课 拒绝与冲突管理(说课).mp4', 'mp4', '15797610', 'resource/96/video/C430C8A7597FEA7595AA70239506716E1504752635341.mp4', '0', '1', '2017-09-07 10:50:35', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1200', null, '1', '第三课 和谐社会里的社会公德.rar', 'rar', '1178', 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752636841.rar', '0', '1', '2017-09-07 10:50:36', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1201', null, '1', '第三课 拒绝与冲突管理.rar', 'rar', '1178', 'resource/96/files/F57A5C1439ACAF839F0A624B21D2AC891504752640921.rar', '0', '1', '2017-09-07 10:50:40', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1202', null, '1', '爱岗敬业，立足岗位成才.rar', 'rar', '1178', 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752665539.rar', '0', '1', '2017-09-07 10:51:05', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1203', null, '1', '诚实守信.rar', 'rar', '1178', 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752690465.rar', '0', '1', '2017-09-07 10:51:30', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1204', null, '1', '办事公道.rar', 'rar', '1178', 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752715772.rar', '0', '1', '2017-09-07 10:51:55', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1205', null, '1', '服务群众，奉献社会.rar', 'rar', '1178', 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752737085.rar', '0', '1', '2017-09-07 10:52:17', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1206', null, '1', '养成良好的职业行为习惯.rar', 'rar', '1178', 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752760582.rar', '0', '1', '2017-09-07 10:52:40', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1207', null, '1', '第一课 弘扬法治精神，建设法治国家.rar', 'rar', '1178', 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752784361.rar', '0', '1', '2017-09-07 10:53:04', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1208', null, '1', '第一课 山一样的责任.mp4', 'mp4', '15797610', 'resource/95/video/C430C8A7597FEA7595AA70239506716E1504752791758.mp4', '0', '1', '2017-09-07 10:53:11', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1209', null, '1', '第二课 维护宪法权威，当好国家公民.rar', 'rar', '1178', 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752807336.rar', '0', '1', '2017-09-07 10:53:27', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1210', null, '1', '第一课 山一样的责任(说课).mp4', 'mp4', '15797610', 'resource/95/video/C430C8A7597FEA7595AA70239506716E1504752815249.mp4', '0', '1', '2017-09-07 10:53:35', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1211', null, '1', '第一课 山一样的责任.rar', 'rar', '1178', 'resource/95/files/F57A5C1439ACAF839F0A624B21D2AC891504752820955.rar', '0', '1', '2017-09-07 10:53:40', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1212', null, '1', '崇尚程序正义—行政处罚.rar', 'rar', '1178', 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752841866.rar', '0', '1', '2017-09-07 10:54:01', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1213', null, '1', '第二课 对自己尽责.mp4', 'mp4', '15797610', 'resource/95/video/C430C8A7597FEA7595AA70239506716E1504752845182.mp4', '0', '1', '2017-09-07 10:54:05', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1214', null, '1', '增强维权意识—合法权益是否被侵犯.rar', 'rar', '1178', 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752869837.rar', '0', '1', '2017-09-07 10:54:29', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1215', null, '1', '第二课 对自己尽责(说课).mp4', 'mp4', '15797610', 'resource/95/video/C430C8A7597FEA7595AA70239506716E1504752868280.mp4', '0', '1', '2017-09-07 10:54:28', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1216', null, '1', '第二课 对自己尽责.rar', 'rar', '1178', 'resource/95/files/F57A5C1439ACAF839F0A624B21D2AC891504752884550.rar', '0', '1', '2017-09-07 10:54:44', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1217', null, '1', '3. 依法维护自己的合法权益—维权途径.rar', 'rar', '1178', 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752899210.rar', '0', '1', '2017-09-07 10:54:59', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1218', null, '1', '杜绝不良行为.rar', 'rar', '1178', 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752972694.rar', '0', '1', '2017-09-07 10:56:12', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1219', null, '1', '3. 依法处理违法行为.rar', 'rar', '1178', 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504752991831.rar', '0', '1', '2017-09-07 10:56:31', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1220', null, '1', '犯罪.rar', 'rar', '1178', 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504753018939.rar', '0', '1', '2017-09-07 10:56:58', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1221', null, '1', '运用刑法武器依法制裁犯罪行为.rar', 'rar', '1178', 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504753042910.rar', '0', '1', '2017-09-07 10:57:22', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1222', null, '1', '第三课 履行公民责任.mp4', 'mp4', '15797610', 'resource/95/video/C430C8A7597FEA7595AA70239506716E1504753053627.mp4', '0', '1', '2017-09-07 10:57:33', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1223', null, '1', '同犯罪行为作斗争.rar', 'rar', '1178', 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504753066397.rar', '0', '1', '2017-09-07 10:57:46', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1224', null, '1', '第三课 履行公民责任(说课).mp4', 'mp4', '15797610', 'resource/95/video/C430C8A7597FEA7595AA70239506716E1504753074314.mp4', '0', '1', '2017-09-07 10:57:54', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1225', null, '1', '第三课 履行公民责任.rar', 'rar', '1178', 'resource/95/files/F57A5C1439ACAF839F0A624B21D2AC891504753085085.rar', '0', '1', '2017-09-07 10:58:05', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1226', null, '1', '依法参与民事活动.rar', 'rar', '1178', 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504753094205.rar', '0', '1', '2017-09-07 10:58:14', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1227', null, '1', '劳动权：我和打工，不得不说的故事.mp4', 'mp4', '15797610', 'resource/95/video/C430C8A7597FEA7595AA70239506716E1504753122577.mp4', '0', '1', '2017-09-07 10:58:42', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1228', null, '1', '劳动权：我和打工，不得不说的故事.rar', 'rar', '1178', 'resource/95/files/F57A5C1439ACAF839F0A624B21D2AC891504753128998.rar', '0', '1', '2017-09-07 10:58:49', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1229', null, '1', '依法保护财产权.rar', 'rar', '1178', 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504753129972.rar', '0', '1', '2017-09-07 10:58:49', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1230', null, '1', '正确利用合同参与民事活动.rar', 'rar', '1178', 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504753157348.rar', '0', '1', '2017-09-07 10:59:17', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1231', null, '1', '依法维权.mp4', 'mp4', '15797610', 'resource/95/video/C430C8A7597FEA7595AA70239506716E1504753160054.mp4', '0', '1', '2017-09-07 10:59:20', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1232', null, '1', '依法维权.rar', 'rar', '1178', 'resource/95/files/F57A5C1439ACAF839F0A624B21D2AC891504753163688.rar', '0', '1', '2017-09-07 10:59:23', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1233', null, '1', '6. 依法维护在学校中的权利和义务.rar', 'rar', '1178', 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504753822980.rar', '0', '1', '2017-09-07 11:10:22', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1234', null, '1', '依法维护劳动者的合法权益.rar', 'rar', '1178', 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504753892074.rar', '0', '1', '2017-09-07 11:11:32', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1235', null, '1', '依法保护人类共有的家园.rar', 'rar', '1178', 'resource/86/files/F57A5C1439ACAF839F0A624B21D2AC891504753917038.rar', '0', '1', '2017-09-07 11:11:57', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1236', null, '1', '1. 对外开放是强国之路.mp4', 'mp4', '15797610', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504754012784.mp4', '0', '1', '2017-09-07 11:13:32', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1237', null, '1', '1. 对外开放是强国之路（说课）.mp4', 'mp4', '15797610', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504754035319.mp4', '0', '1', '2017-09-07 11:13:55', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1238', null, '1', '1. 对外开放是强国之路.rar', 'rar', '1178', 'resource/89/files/F57A5C1439ACAF839F0A624B21D2AC891504754041459.rar', '0', '1', '2017-09-07 11:14:01', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1239', null, '1', '客观实际是人生选择的前提和基础.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754087491.mp4', '0', '1', '2017-09-07 11:14:47', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1240', null, '1', '2. 面对全球化 增强开放意识.mp4', 'mp4', '15797610', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504754100836.mp4', '0', '1', '2017-09-07 11:15:00', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1241', null, '1', '2. 面对全球化 增强开放意识（说课）.mp4', 'mp4', '15797610', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504754123925.mp4', '0', '1', '2017-09-07 11:15:23', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1242', null, '1', '1. 客观实际是人生选择的前提和基础（说课）.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754127961.mp4', '0', '1', '2017-09-07 11:15:28', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1243', null, '1', '2. 面对全球化 增强开放意识.rar', 'rar', '1178', 'resource/89/files/F57A5C1439ACAF839F0A624B21D2AC891504754134615.rar', '0', '1', '2017-09-07 11:15:34', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1244', null, '1', '1. 客观实际是人生选择的前提和基础.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504754136624.rar', '0', '1', '2017-09-07 11:15:36', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1245', null, '1', '物质世界的多样性与人生选择.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754162274.mp4', '0', '1', '2017-09-07 11:16:02', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1246', null, '1', '物质世界的多样性与人生选择（说课）.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754192893.mp4', '0', '1', '2017-09-07 11:16:32', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1247', null, '1', '物质世界的多样性与人生选择.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504754201612.rar', '0', '1', '2017-09-07 11:16:41', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1248', null, '1', '运动是物质的存在方式.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754224099.mp4', '0', '1', '2017-09-07 11:17:04', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1249', null, '1', '运动是物质的存在方式.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504754236174.rar', '0', '1', '2017-09-07 11:17:16', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1250', null, '1', '运动是物质的存在方式（说课）.rar', 'rar', '1178', 'resource/87/video/F57A5C1439ACAF839F0A624B21D2AC891504754271029.rar', '0', '1', '2017-09-07 11:17:51', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1251', null, '1', '运动是物质的存在方式.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504754290527.rar', '0', '1', '2017-09-07 11:18:10', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1252', null, '1', '把握客观规律善于行动.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754318787.mp4', '0', '1', '2017-09-07 11:18:38', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1253', null, '1', '把握客观规律善于行动（说课）.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754345707.mp4', '0', '1', '2017-09-07 11:19:05', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1254', null, '1', '把握客观规律善于行动.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504754356335.rar', '0', '1', '2017-09-07 11:19:16', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1255', null, '1', '正确发挥自觉能动性.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754379175.mp4', '0', '1', '2017-09-07 11:19:39', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1256', null, '1', '正确发挥自觉能动性（说课）.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754437550.mp4', '0', '1', '2017-09-07 11:20:37', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1257', null, '1', '正确发挥自觉能动性.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504754450371.rar', '0', '1', '2017-09-07 11:20:50', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1258', null, '1', '自强不息与成功人生.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754472393.mp4', '0', '1', '2017-09-07 11:21:12', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1259', null, '1', '第二课 解读心理问题.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754476727.mp4', '0', '1', '2017-09-07 11:21:16', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1260', null, '1', '自强不息与成功人生（说课）.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754498609.mp4', '0', '1', '2017-09-07 11:21:38', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1261', null, '1', '第二课 解读心理问题（说课）.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754500285.mp4', '0', '1', '2017-09-07 11:21:40', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1262', null, '1', '第二课 解读心理问题.rar', 'rar', '1178', 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504754506658.rar', '0', '1', '2017-09-07 11:21:46', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1263', null, '1', '自强不息与成功人生.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504754507978.rar', '0', '1', '2017-09-07 11:21:47', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1264', null, '1', '第一课 普遍联系与人际和谐.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754528870.mp4', '0', '1', '2017-09-07 11:22:08', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1265', null, '1', '第三课 认识心理咨询.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754533646.mp4', '0', '1', '2017-09-07 11:22:13', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1266', null, '1', '第三课 认识心理咨询（说课）.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754553296.mp4', '0', '1', '2017-09-07 11:22:33', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1267', null, '1', '第三课 认识心理咨询.rar', 'rar', '1178', 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504754559980.rar', '0', '1', '2017-09-07 11:22:39', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1268', null, '1', '用普遍联系的观点看待人际关系.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754561380.mp4', '0', '1', '2017-09-07 11:22:41', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1269', null, '1', '第一课 认识自我.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754590585.mp4', '0', '1', '2017-09-07 11:23:10', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1270', null, '1', '用普遍联系的观点看待人际关系（说课）.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754592462.mp4', '0', '1', '2017-09-07 11:23:12', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1271', null, '1', '用普遍联系的观点看待人际关系.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504754601867.rar', '0', '1', '2017-09-07 11:23:21', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1272', null, '1', '第一课 认识自我（说课）.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754619383.mp4', '0', '1', '2017-09-07 11:23:39', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1273', null, '1', '第一课 认识自我.rar', 'rar', '1178', 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504754625068.rar', '0', '1', '2017-09-07 11:23:45', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1274', null, '1', '2. 在复杂多样的联系中营造和谐的人际关系.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754630637.mp4', '0', '1', '2017-09-07 11:23:50', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1275', null, '1', '第二课 悦纳自我.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754649234.mp4', '0', '1', '2017-09-07 11:24:09', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1276', null, '1', '2. 在复杂多样的联系中营造和谐的人际关系（说课）.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754657381.mp4', '0', '1', '2017-09-07 11:24:17', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1277', null, '1', '2. 在复杂多样的联系中营造和谐的人际关系.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504754670758.rar', '0', '1', '2017-09-07 11:24:30', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1278', null, '1', '第二课 悦纳自我（说课）.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754671327.mp4', '0', '1', '2017-09-07 11:24:31', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1279', null, '1', '第二课 悦纳自我.rar', 'rar', '1178', 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504754676772.rar', '0', '1', '2017-09-07 11:24:36', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1280', null, '1', '事物发展的永恒性及其本质.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754692472.mp4', '0', '1', '2017-09-07 11:24:52', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1281', null, '1', '第三课 不一样的我.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754697196.mp4', '0', '1', '2017-09-07 11:24:57', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1282', null, '1', '第三课 不一样的我（说课）.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754719109.mp4', '0', '1', '2017-09-07 11:25:19', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1283', null, '1', '第三课 不一样的我.rar', 'rar', '1178', 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504754724330.rar', '0', '1', '2017-09-07 11:25:24', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1284', null, '1', '事物发展的永恒性及其本质（说课）.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754725585.mp4', '0', '1', '2017-09-07 11:25:25', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1285', null, '1', '事物发展的永恒性及其本质.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504754735699.rar', '0', '1', '2017-09-07 11:25:35', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1286', null, '1', '第四课 完善自我.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754747231.mp4', '0', '1', '2017-09-07 11:25:47', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1287', null, '1', '用发展的观点看待顺境与逆境.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754758078.mp4', '0', '1', '2017-09-07 11:25:58', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1288', null, '1', '第四课 完善自我（说课）.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754769594.mp4', '0', '1', '2017-09-07 11:26:09', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1289', null, '1', '第四课 完善自我.rar', 'rar', '1178', 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504754776200.rar', '0', '1', '2017-09-07 11:26:16', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1290', null, '1', '用发展的观点看待顺境与逆境（说课）.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754795791.mp4', '0', '1', '2017-09-07 11:26:35', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1291', null, '1', '第一课 学习适应.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754801937.mp4', '0', '1', '2017-09-07 11:26:41', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1292', null, '1', '用发展的观点看待顺境与逆境.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504754807332.rar', '0', '1', '2017-09-07 11:26:47', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1293', null, '1', '第一课 学习适应（说课）.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754823839.mp4', '0', '1', '2017-09-07 11:27:03', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1294', null, '1', '第一课 学习适应.rar', 'rar', '1178', 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504754829537.rar', '0', '1', '2017-09-07 11:27:09', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1295', null, '1', '矛盾是事物发展的动力.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754833369.mp4', '0', '1', '2017-09-07 11:27:13', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1296', null, '1', '第二课 学习方法.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754856414.mp4', '0', '1', '2017-09-07 11:27:36', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1297', null, '1', '矛盾是事物发展的动力（说课）.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754864815.mp4', '0', '1', '2017-09-07 11:27:44', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1298', null, '1', '矛盾是事物发展的动力.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504754874704.rar', '0', '1', '2017-09-07 11:27:54', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1299', null, '1', '第二课 学习方法（说课）.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754875660.mp4', '0', '1', '2017-09-07 11:27:55', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1300', null, '1', '第二课 学习方法.rar', 'rar', '1178', 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504754881615.rar', '0', '1', '2017-09-07 11:28:01', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1301', null, '1', '矛盾是人生发展的动力.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754894894.mp4', '0', '1', '2017-09-07 11:28:14', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1302', null, '1', '第三课 时间管理.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754903556.mp4', '0', '1', '2017-09-07 11:28:23', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1303', null, '1', '第三课 时间管理（说课）.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754924136.mp4', '0', '1', '2017-09-07 11:28:44', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1304', null, '1', '第三课 时间管理.rar', 'rar', '1178', 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504754929470.rar', '0', '1', '2017-09-07 11:28:49', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1305', null, '1', '矛盾是事物发展的动力（说课）.rar', 'rar', '1178', 'resource/87/video/F57A5C1439ACAF839F0A624B21D2AC891504754929748.rar', '0', '1', '2017-09-07 11:28:49', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1306', null, '1', '矛盾是事物发展的动力（说课）.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504754942103.rar', '0', '1', '2017-09-07 11:29:02', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1307', null, '1', '第四课 快乐学习.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754951570.mp4', '0', '1', '2017-09-07 11:29:11', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1308', null, '1', '矛盾是人生发展的动力（说课）.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754956489.mp4', '0', '1', '2017-09-07 11:29:16', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1309', null, '1', '第四课 快乐学习（说课）.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754971689.mp4', '0', '1', '2017-09-07 11:29:31', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1310', null, '1', '第四课 快乐学习.rar', 'rar', '1178', 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504754976706.rar', '0', '1', '2017-09-07 11:29:36', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1311', null, '1', '在实践中寻求真知.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754986872.mp4', '0', '1', '2017-09-07 11:29:46', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1312', null, '1', '第一课 积极心理.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754999656.mp4', '0', '1', '2017-09-07 11:29:59', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1313', null, '1', '在实践中寻求真知（说课）.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755006070.mp4', '0', '1', '2017-09-07 11:30:06', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1314', null, '1', '在实践中寻求真知.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755018990.rar', '0', '1', '2017-09-07 11:30:18', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1315', null, '1', '第一课 积极心理（说课）.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755018557.mp4', '0', '1', '2017-09-07 11:30:18', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1316', null, '1', '第一课 积极心理.rar', 'rar', '1178', 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755024444.rar', '0', '1', '2017-09-07 11:30:24', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1317', null, '1', '在实践中快乐成长.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755037494.mp4', '0', '1', '2017-09-07 11:30:37', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1318', null, '1', '第二课 幸福心理.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755048265.mp4', '0', '1', '2017-09-07 11:30:48', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1319', null, '1', '在实践中快乐成长（说课）.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755061092.mp4', '0', '1', '2017-09-07 11:31:01', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1320', null, '1', '第二课 幸福心理（说课）.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755068460.mp4', '0', '1', '2017-09-07 11:31:08', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1321', null, '1', '在实践中快乐成长.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755074182.rar', '0', '1', '2017-09-07 11:31:14', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1322', null, '1', '第二课 幸福心理.rar', 'rar', '1178', 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755074537.rar', '0', '1', '2017-09-07 11:31:14', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1323', null, '1', '把握事物的本质.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755098470.mp4', '0', '1', '2017-09-07 11:31:38', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1324', null, '1', '第一课 人际交往.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755104283.mp4', '0', '1', '2017-09-07 11:31:44', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1325', null, '1', '把握事物的本质（说课）.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755117328.mp4', '0', '1', '2017-09-07 11:31:57', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1326', null, '1', '第一课 人际交往（说课）.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755125986.mp4', '0', '1', '2017-09-07 11:32:06', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1327', null, '1', '把握事物的本质.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755127183.rar', '0', '1', '2017-09-07 11:32:07', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1328', null, '1', '第一课 人际交往.rar', 'rar', '1178', 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755132170.rar', '0', '1', '2017-09-07 11:32:12', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1329', null, '1', '. 提高辨识能力.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755144737.mp4', '0', '1', '2017-09-07 11:32:24', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1330', null, '1', '第二课 人际冲突.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755155946.mp4', '0', '1', '2017-09-07 11:32:36', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1331', null, '1', '提高辨识能力（说课）.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755163917.mp4', '0', '1', '2017-09-07 11:32:43', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1332', null, '1', '提高辨识能力.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755176628.rar', '0', '1', '2017-09-07 11:32:56', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1333', null, '1', '第二课 人际冲突（说课）.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755176716.mp4', '0', '1', '2017-09-07 11:32:56', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1334', null, '1', '第二课 人际冲突.rar', 'rar', '1178', 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755182564.rar', '0', '1', '2017-09-07 11:33:02', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1335', null, '1', '培养科学的思维方法.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755199452.mp4', '0', '1', '2017-09-07 11:33:19', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1336', null, '1', '第三课 人际沟通—语言沟通.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755203780.mp4', '0', '1', '2017-09-07 11:33:23', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1337', null, '1', '培养科学的思维方法（说课）.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755224732.mp4', '0', '1', '2017-09-07 11:33:44', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1338', null, '1', '第三课 人际沟通—语言沟通（说课）.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755225206.mp4', '0', '1', '2017-09-07 11:33:45', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1339', null, '1', '第三课 人际沟通—语言沟通.rar', 'rar', '1178', 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755231189.rar', '0', '1', '2017-09-07 11:33:51', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1340', null, '1', '培养科学的思维方法.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755234578.rar', '0', '1', '2017-09-07 11:33:54', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1341', null, '1', '提高创新能力.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755257019.mp4', '0', '1', '2017-09-07 11:34:17', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1342', null, '1', '第四课 人际沟通—非语言沟通.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755257957.mp4', '0', '1', '2017-09-07 11:34:18', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1343', null, '1', '提高创新能力（说课）.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755277936.mp4', '0', '1', '2017-09-07 11:34:37', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1344', null, '1', '第四课 人际沟通—非语言沟通（说课）.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755278154.mp4', '0', '1', '2017-09-07 11:34:38', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1345', null, '1', '第四课 人际沟通—非语言沟通.rar', 'rar', '1178', 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755284467.rar', '0', '1', '2017-09-07 11:34:44', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1346', null, '1', '提高创新能力.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755284624.rar', '0', '1', '2017-09-07 11:34:44', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1347', null, '1', '第一课 认识情绪.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755306860.mp4', '0', '1', '2017-09-07 11:35:06', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1348', null, '1', '历史规律的特点.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755314394.mp4', '0', '1', '2017-09-07 11:35:14', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1349', null, '1', '历史规律的特点（说课）.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755334860.mp4', '0', '1', '2017-09-07 11:35:34', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1350', null, '1', '历史规律的特点.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755341326.rar', '0', '1', '2017-09-07 11:35:41', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1351', null, '1', '实现人生目标必须符合历史规律.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755359640.mp4', '0', '1', '2017-09-07 11:35:59', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1352', null, '1', '2. 实现人生目标必须符合历史规律（说课）.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755380846.mp4', '0', '1', '2017-09-07 11:36:20', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1353', null, '1', '2. 实现人生目标必须符合历史规律.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755390298.rar', '0', '1', '2017-09-07 11:36:30', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1354', null, '1', '第一课 认识情绪（说课）.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755394539.mp4', '0', '1', '2017-09-07 11:36:34', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1355', null, '1', '第一课 认识情绪.rar', 'rar', '1178', 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755399489.rar', '0', '1', '2017-09-07 11:36:39', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1356', null, '1', '个人理想与社会理想.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755416413.mp4', '0', '1', '2017-09-07 11:36:56', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1357', null, '1', '第二课 调控情绪.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755426940.mp4', '0', '1', '2017-09-07 11:37:06', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1358', null, '1', '个人理想与社会理想（说课）.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755440928.mp4', '0', '1', '2017-09-07 11:37:20', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1359', null, '1', '第二课 调控情绪（说课）.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755451890.mp4', '0', '1', '2017-09-07 11:37:31', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1360', null, '1', '个人理想与社会理想.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755455342.rar', '0', '1', '2017-09-07 11:37:35', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1361', null, '1', '第二课 调控情绪.rar', 'rar', '1178', 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755456828.rar', '0', '1', '2017-09-07 11:37:36', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1362', null, '1', '理想与现实.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755474051.mp4', '0', '1', '2017-09-07 11:37:54', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1363', null, '1', '第三课 情绪ABC.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755476754.mp4', '0', '1', '2017-09-07 11:37:56', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1364', null, '1', '第三课 情绪ABC（说课）.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755496138.mp4', '0', '1', '2017-09-07 11:38:16', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1365', null, '1', '理想与现实（说课）.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755498542.mp4', '0', '1', '2017-09-07 11:38:18', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1366', null, '1', '第三课 情绪ABC.rar', 'rar', '1178', 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755502160.rar', '0', '1', '2017-09-07 11:38:22', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1367', null, '1', '理想与现实（说课）.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755523842.mp4', '0', '1', '2017-09-07 11:38:43', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1368', null, '1', '第一课 挫折.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755529938.mp4', '0', '1', '2017-09-07 11:38:49', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1369', null, '1', '2. 理想与现实.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755537544.rar', '0', '1', '2017-09-07 11:38:57', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1370', null, '1', '第一课 挫折（说课）.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755553484.mp4', '0', '1', '2017-09-07 11:39:13', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1371', null, '1', '第一课 挫折.rar', 'rar', '1178', 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755558644.rar', '0', '1', '2017-09-07 11:39:18', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1372', null, '1', '实现理想需要坚强的意志.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755561725.mp4', '0', '1', '2017-09-07 11:39:21', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1373', null, '1', '第二课 压力应对.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755579691.mp4', '0', '1', '2017-09-07 11:39:39', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1374', null, '1', '实现理想需要坚强的意志（说课）.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755585658.mp4', '0', '1', '2017-09-07 11:39:45', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1375', null, '1', '实现理想需要坚强的意志.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755593521.rar', '0', '1', '2017-09-07 11:39:53', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1376', null, '1', '第二课 压力应对（说课）.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755603332.mp4', '0', '1', '2017-09-07 11:40:03', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1377', null, '1', '第二课 压力应对.rar', 'rar', '1178', 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755608152.rar', '0', '1', '2017-09-07 11:40:08', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1378', null, '1', '实现理想要敢于担当.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755612803.mp4', '0', '1', '2017-09-07 11:40:12', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1379', null, '1', '第三课 危机干预.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755628822.mp4', '0', '1', '2017-09-07 11:40:28', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1380', null, '1', '实现理想要敢于担当（说课）.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755634332.mp4', '0', '1', '2017-09-07 11:40:34', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1381', null, '1', '第三课 危机干预（说课）.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755649801.mp4', '0', '1', '2017-09-07 11:40:49', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1382', null, '1', '第三课 危机干预.rar', 'rar', '1178', 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755654929.rar', '0', '1', '2017-09-07 11:40:54', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1383', null, '1', '实现理想要敢于担当.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755655171.rar', '0', '1', '2017-09-07 11:40:55', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1384', null, '1', '人是社会存在物.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755677333.mp4', '0', '1', '2017-09-07 11:41:17', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1385', null, '1', '第一课 生命教育.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755679952.mp4', '0', '1', '2017-09-07 11:41:20', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1386', null, '1', '第一课 生命教育（说课）.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755700039.mp4', '0', '1', '2017-09-07 11:41:40', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1387', null, '1', '第一课 生命教育.rar', 'rar', '1178', 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755705539.rar', '0', '1', '2017-09-07 11:41:45', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1388', null, '1', '人是社会存在物（说课）.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755704642.mp4', '0', '1', '2017-09-07 11:41:44', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1389', null, '1', '人是社会存在物.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755716233.rar', '0', '1', '2017-09-07 11:41:56', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1390', null, '1', '第二课 生命价值观.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755726707.mp4', '0', '1', '2017-09-07 11:42:06', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1391', null, '1', '个人与集体的关系.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755735793.mp4', '0', '1', '2017-09-07 11:42:15', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1392', null, '1', '第二课 生命价值观（说课）.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755747653.mp4', '0', '1', '2017-09-07 11:42:27', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1393', null, '1', '第二课 生命价值观.rar', 'rar', '1178', 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755752635.rar', '0', '1', '2017-09-07 11:42:32', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1394', null, '1', '个人与集体的关系（说课）.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755757173.mp4', '0', '1', '2017-09-07 11:42:37', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1395', null, '1', '个人与集体的关系.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755765307.rar', '0', '1', '2017-09-07 11:42:45', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1396', null, '1', '第一课 如何谈恋爱.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755777237.mp4', '0', '1', '2017-09-07 11:42:57', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1397', null, '1', '自我价值.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755788171.mp4', '0', '1', '2017-09-07 11:43:08', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1398', null, '1', '第一课 如何谈恋爱（说课）.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755798471.mp4', '0', '1', '2017-09-07 11:43:18', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1399', null, '1', '第一课 如何谈恋爱.rar', 'rar', '1178', 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755803779.rar', '0', '1', '2017-09-07 11:43:23', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1400', null, '1', '自我价值（说课）.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755811731.mp4', '0', '1', '2017-09-07 11:43:31', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1401', null, '1', '自我价值.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755818669.rar', '0', '1', '2017-09-07 11:43:38', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1402', null, '1', '第二课 爱情底线在哪里.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755828049.mp4', '0', '1', '2017-09-07 11:43:48', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1403', null, '1', '劳动奉献与人的价值.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755845846.mp4', '0', '1', '2017-09-07 11:44:05', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1404', null, '1', '第二课 爱情底线在哪里（说课）.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755857580.mp4', '0', '1', '2017-09-07 11:44:17', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1405', null, '1', '第二课 爱情底线在哪里.rar', 'rar', '1178', 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755863143.rar', '0', '1', '2017-09-07 11:44:23', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1406', null, '1', '劳动奉献与人的价值（说课）.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755867151.mp4', '0', '1', '2017-09-07 11:44:27', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1407', null, '1', '劳动奉献与人的价值.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755876118.rar', '0', '1', '2017-09-07 11:44:36', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1408', null, '1', '第一课 网络与心理健康.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755886758.mp4', '0', '1', '2017-09-07 11:44:46', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1409', null, '1', '努力实现人的全面发展.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755900745.mp4', '0', '1', '2017-09-07 11:45:00', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1410', null, '1', '第一课 网络与心理健康（说课）.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755906064.mp4', '0', '1', '2017-09-07 11:45:06', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1411', null, '1', '第一课 网络与心理健康.rar', 'rar', '1178', 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755912935.rar', '0', '1', '2017-09-07 11:45:12', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1412', null, '1', '努力实现人的全面发展.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755917464.rar', '0', '1', '2017-09-07 11:45:17', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1413', null, '1', '1. 努力实现人的全面发展（说课）.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755931831.mp4', '0', '1', '2017-09-07 11:45:31', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1414', null, '1', '第二课 网络依赖.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755937656.mp4', '0', '1', '2017-09-07 11:45:37', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1415', null, '1', '在社会发展中实现人的个性自由.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755955587.mp4', '0', '1', '2017-09-07 11:45:55', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1416', null, '1', '第二课 网络依赖（说课）.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755957372.mp4', '0', '1', '2017-09-07 11:45:57', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1417', null, '1', '第二课 网络依赖.rar', 'rar', '1178', 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504755963119.rar', '0', '1', '2017-09-07 11:46:03', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1418', null, '1', '社会发展中实现人的个性自由（说课）.mp4', 'mp4', '15797610', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755976598.mp4', '0', '1', '2017-09-07 11:46:16', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1419', null, '1', '第三课 游戏成瘾.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755984915.mp4', '0', '1', '2017-09-07 11:46:24', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1420', null, '1', '社会发展中实现人的个性自由.rar', 'rar', '1178', 'resource/87/files/F57A5C1439ACAF839F0A624B21D2AC891504755986450.rar', '0', '1', '2017-09-07 11:46:26', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1421', null, '1', '第三课 游戏成瘾（说课）.mp4', 'mp4', '15797610', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504756005052.mp4', '0', '1', '2017-09-07 11:46:45', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1422', null, '1', '第三课 游戏成瘾.rar', 'rar', '1178', 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504756010147.rar', '0', '1', '2017-09-07 11:46:50', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1423', null, '1', '第一课 关注心理健康.rar', 'rar', '1178', 'resource/88/files/F57A5C1439ACAF839F0A624B21D2AC891504756074490.rar', '0', '1', '2017-09-07 11:47:54', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1424', null, '1', '交谈的艺术-课件.ppt', 'ppt', '3096576', 'resource/91/video/D3A68A3207D93E9D13F9A6160FC370751504771804046.ppt', '0', '1', '2017-09-07 16:10:04', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1425', null, '1', '一、中国在国际社会中的作用（说课）.mp4', 'mp4', '10776176', 'resource/87/video/6B9594A4C767EF7498E28C2009F972521505097242218.mp4', '0', '1', '2017-09-11 10:34:02', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1426', null, '1', '4.8 第八课 预防艾滋病 说课.mp4', 'mp4', '61841905', 'resource/103/video/DDEA9C75001B744F97E754FEE33292DD1505118254052.mp4', '0', '1', '2017-09-11 16:24:14', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1427', null, '1', '4.8 第八课 预防艾滋病 说课.mp4', 'mp4', '61841905', 'resource/103/video/DDEA9C75001B744F97E754FEE33292DD1505118330181.mp4', '0', '1', '2017-09-11 16:25:30', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1428', null, '1', '预防艾滋病.rar', 'rar', '61914524', 'resource/103/files/F4142DF978CD920522E156E01335900F1505118374700.rar', '0', '1', '2017-09-11 16:26:14', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1429', null, '1', '1-1F3010955520-L.png', 'png', '294697', '/cover/D2CEBF1015D7A4A67879DC4FC289064B1505372357770.png', '0', '1', '2017-09-14 14:59:17', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1430', null, '1', '第三课 游戏成瘾（说课）.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505372777411.mp4', '0', '1', '2017-09-14 15:06:17', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1431', null, '1', '第三课 游戏成瘾（说课）.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505372947231.mp4', '0', '1', '2017-09-14 15:09:07', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1432', null, '1', '第三课 游戏成瘾（说课）.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505372997136.mp4', '0', '1', '2017-09-14 15:09:57', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1433', null, '1', '班主任0828.rar', 'rar', '16952654', 'resource/104/files/6CCFDF835B0F801C1CB7EDA2893763611505373023420.rar', '0', '1', '2017-09-14 15:10:23', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1434', null, '1', '1-1 巴蜀之音——《盼红军》  .rar', 'rar', '98', 'resource/104/files/27A6167B036451A0959AA573C7AF47341505373208954.rar', '0', '1', '2017-09-14 15:13:28', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1435', null, '1', '01 巴蜀之音——《盼红军》.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505373386832.mp4', '0', '1', '2017-09-14 15:16:26', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1436', null, '1', '第一课  蝴蝶的爱情——梁祝.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505373406839.mp4', '0', '1', '2017-09-14 15:16:46', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1437', null, '1', '02 江南小调——《茉莉花》.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505373439788.mp4', '0', '1', '2017-09-14 15:17:19', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1438', null, '1', '第一课  蝴蝶的爱情——梁祝.rar', 'rar', '28450', 'resource/104/files/EB8633EBF3882ACCA5DCB3096FF0A2861505373451295.rar', '0', '1', '2017-09-14 15:17:31', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1439', null, '1', '第二课    屈人生——命运交响曲.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505373470008.mp4', '0', '1', '2017-09-14 15:17:50', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1440', null, '1', '第二课    屈人生——命运交响曲.rar', 'rar', '28450', 'resource/104/files/EB8633EBF3882ACCA5DCB3096FF0A2861505373481209.rar', '0', '1', '2017-09-14 15:18:01', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1441', null, '1', '第三课    民族之魂——我的祖国交响诗套曲之《伏尔塔瓦河》.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505373528307.mp4', '0', '1', '2017-09-14 15:18:48', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1442', null, '1', '1-2 江南小调——《茉莉花》.rar', 'rar', '98', 'resource/104/files/27A6167B036451A0959AA573C7AF47341505373539633.rar', '0', '1', '2017-09-14 15:18:59', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1443', null, '1', '第三课    民族之魂——我的祖国交响诗套曲之《伏尔塔瓦河》.rar', 'rar', '28450', 'resource/104/files/EB8633EBF3882ACCA5DCB3096FF0A2861505373539917.rar', '0', '1', '2017-09-14 15:18:59', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1444', null, '1', '第四课    硝烟弥漫——1812序曲.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505373566557.mp4', '0', '1', '2017-09-14 15:19:26', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1445', null, '1', '第四课    硝烟弥漫——1812序曲.rar', 'rar', '28450', 'resource/104/files/EB8633EBF3882ACCA5DCB3096FF0A2861505373575697.rar', '0', '1', '2017-09-14 15:19:35', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1446', null, '1', '第五课    交响素描——大海.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505373592527.mp4', '0', '1', '2017-09-14 15:19:52', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1447', null, '1', '第五课    交响素描——大海.rar', 'rar', '28450', 'resource/104/files/EB8633EBF3882ACCA5DCB3096FF0A2861505373611751.rar', '0', '1', '2017-09-14 15:20:11', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1448', null, '1', '第一课  春的韵律——春舞.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505373628695.mp4', '0', '1', '2017-09-14 15:20:28', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1449', null, '1', '第一课  春的韵律——春舞.rar', 'rar', '28450', 'resource/104/files/EB8633EBF3882ACCA5DCB3096FF0A2861505373635468.rar', '0', '1', '2017-09-14 15:20:35', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1450', null, '1', '第二课     节日欢歌——春节序曲.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505373650117.mp4', '0', '1', '2017-09-14 15:20:50', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1451', null, '1', '第二课     节日欢歌——春节序曲.rar', 'rar', '28450', 'resource/104/files/EB8633EBF3882ACCA5DCB3096FF0A2861505373657158.rar', '0', '1', '2017-09-14 15:20:57', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1452', null, '1', '第三课     浪漫音诗——爱之梦.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505373669537.mp4', '0', '1', '2017-09-14 15:21:10', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1453', null, '1', '1-3 黄河大合唱——《保卫黄河》.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505373672462.mp4', '0', '1', '2017-09-14 15:21:12', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1454', null, '1', '第三课     浪漫音诗——爱之梦.rar', 'rar', '28450', 'resource/104/files/EB8633EBF3882ACCA5DCB3096FF0A2861505373680563.rar', '0', '1', '2017-09-14 15:21:20', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1455', null, '1', '第二课     节日欢歌——春节序曲.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505373696577.mp4', '0', '1', '2017-09-14 15:21:36', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1456', null, '1', '第二课     节日欢歌——春节序曲.rar', 'rar', '28450', 'resource/104/files/EB8633EBF3882ACCA5DCB3096FF0A2861505373703047.rar', '0', '1', '2017-09-14 15:21:43', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1457', null, '1', '1-4 歌声飞扬——《乘着歌声的翅膀》.mp4', 'mp4', '15797610', 'resource/104/files/C430C8A7597FEA7595AA70239506716E1505373738250.mp4', '0', '1', '2017-09-14 15:22:18', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1458', null, '1', '1-3 黄河大合唱——《保卫黄河》.mp4', 'mp4', '15797610', 'resource/104/files/C430C8A7597FEA7595AA70239506716E1505373848262.mp4', '0', '1', '2017-09-14 15:24:08', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1459', null, '1', '第四课     诗人情怀——升c小调幻想即兴曲.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505373870262.mp4', '0', '1', '2017-09-14 15:24:30', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1460', null, '1', '1-4 歌声飞扬——《乘着歌声的翅膀》.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505373880835.mp4', '0', '1', '2017-09-14 15:24:40', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1461', null, '1', '第四课     诗人情怀——升c小调幻想即兴曲.rar', 'rar', '28450', 'resource/104/files/EB8633EBF3882ACCA5DCB3096FF0A2861505373882202.rar', '0', '1', '2017-09-14 15:24:42', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1462', null, '1', '第五课     动物的聚会——动物狂欢.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505373911280.mp4', '0', '1', '2017-09-14 15:25:11', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1463', null, '1', '第五课     动物的聚会——动物狂欢节.rar', 'rar', '28450', 'resource/104/files/EB8633EBF3882ACCA5DCB3096FF0A2861505373927373.rar', '0', '1', '2017-09-14 15:25:27', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1464', null, '1', '1-4 歌声飞扬——《乘着歌声的翅膀》.rar', 'rar', '98', 'resource/104/files/27A6167B036451A0959AA573C7AF47341505373933057.rar', '0', '1', '2017-09-14 15:25:33', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1465', null, '1', '1-5 拿波里民谣——《我的太阳》.rar', 'rar', '98', 'resource/104/video/27A6167B036451A0959AA573C7AF47341505373989254.rar', '0', '1', '2017-09-14 15:26:29', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1466', null, '1', '1-5 拿波里民谣——《我的太阳》.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505373991303.mp4', '0', '1', '2017-09-14 15:26:31', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1467', null, '1', '1-5 拿波里民谣——《我的太阳》.rar', 'rar', '98', 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374014957.rar', '0', '1', '2017-09-14 15:26:54', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1468', null, '1', '第六课   蓝色梦幻——蓝色多瑙河.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374049099.mp4', '0', '1', '2017-09-14 15:27:29', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1469', null, '1', '1-6 拉美之声——《美丽小天使》.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374049729.mp4', '0', '1', '2017-09-14 15:27:29', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1470', null, '1', '1-6 拉美之声——《美丽小天使》.rar', 'rar', '98', 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374064818.rar', '0', '1', '2017-09-14 15:27:44', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1471', null, '1', '第六课   蓝色梦幻——蓝色多瑙河.rar', 'rar', '28450', 'resource/104/files/EB8633EBF3882ACCA5DCB3096FF0A2861505374092393.rar', '0', '1', '2017-09-14 15:28:12', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1472', null, '1', '1-7 爵士乐——《不知为何》.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374096378.mp4', '0', '1', '2017-09-14 15:28:16', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1473', null, '1', '第七课  灵动之美——天鹅湖.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374112541.mp4', '0', '1', '2017-09-14 15:28:32', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1474', null, '1', '1-7 爵士乐——《不知为何》.rar', 'rar', '98', 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374113449.rar', '0', '1', '2017-09-14 15:28:33', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1475', null, '1', '第七课  灵动之美——天鹅湖.rar', 'rar', '28450', 'resource/104/files/EB8633EBF3882ACCA5DCB3096FF0A2861505374132620.rar', '0', '1', '2017-09-14 15:28:52', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1476', null, '1', '第七课  灵动之美——天鹅湖.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374148243.mp4', '0', '1', '2017-09-14 15:29:08', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1477', null, '1', '第八课  音画印象——水中倒影.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374170328.mp4', '0', '1', '2017-09-14 15:29:30', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1478', null, '1', '第八课  音画印象——水中倒影.rar', 'rar', '28450', 'resource/104/files/EB8633EBF3882ACCA5DCB3096FF0A2861505374178968.rar', '0', '1', '2017-09-14 15:29:38', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1479', null, '1', '第九课  律动之美——波莱罗舞曲.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374202013.mp4', '0', '1', '2017-09-14 15:30:02', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1480', null, '1', '第九课  律动之美——波莱罗舞曲.rar', 'rar', '28450', 'resource/104/files/EB8633EBF3882ACCA5DCB3096FF0A2861505374216054.rar', '0', '1', '2017-09-14 15:30:16', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1481', null, '1', '第七课  爵士乐——《不知为何》.rar', 'rar', '98', 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374265187.rar', '0', '1', '2017-09-14 15:31:05', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1482', null, '1', '第八课    音乐剧《猫》——memory.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374300223.mp4', '0', '1', '2017-09-14 15:31:40', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1483', null, '1', '第八课    音乐剧《猫》——memory.rar', 'rar', '98', 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374319541.rar', '0', '1', '2017-09-14 15:31:59', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1484', null, '1', '第九课    歌剧《卡门》——哈巴涅拉舞曲.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374352408.mp4', '0', '1', '2017-09-14 15:32:32', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1485', null, '1', '第九课    歌剧《卡门》——哈巴涅拉舞曲.rar', 'rar', '98', 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374359809.rar', '0', '1', '2017-09-14 15:32:39', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1486', null, '1', '第一课  古韵悠长——高山流水.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374396060.mp4', '0', '1', '2017-09-14 15:33:16', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1487', null, '1', '第一课  古韵悠长——高山流水.rar', 'rar', '98', 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374401188.rar', '0', '1', '2017-09-14 15:33:21', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1488', null, '1', '第二课    战鼓声声——十面埋伏.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374428365.mp4', '0', '1', '2017-09-14 15:33:48', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1489', null, '1', '第二课    战鼓声声——十面埋伏.rar', 'rar', '98', 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374436247.rar', '0', '1', '2017-09-14 15:33:56', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1490', null, '1', '第三课    落日余晖——渔舟唱晚.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374502855.mp4', '0', '1', '2017-09-14 15:35:02', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1491', null, '1', '第三课    落日余晖——渔舟唱晚.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374620694.mp4', '0', '1', '2017-09-14 15:37:00', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1492', null, '1', '第三课    落日余晖——渔舟唱晚.rar', 'rar', '98', 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374627520.rar', '0', '1', '2017-09-14 15:37:07', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1493', null, '1', '第四课    洒脱不羁——酒狂.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374650821.mp4', '0', '1', '2017-09-14 15:37:30', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1494', null, '1', '第四课    洒脱不羁——酒狂.rar', 'rar', '98', 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374665864.rar', '0', '1', '2017-09-14 15:37:45', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1495', null, '1', '第五课    凄美旋律——二泉映月.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374691263.mp4', '0', '1', '2017-09-14 15:38:11', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1496', null, '1', '第五课    凄美旋律——二泉映月.rar', 'rar', '98', 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374695995.rar', '0', '1', '2017-09-14 15:38:16', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1497', null, '1', '第六课    喜庆唢呐——百鸟朝凤.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374751447.mp4', '0', '1', '2017-09-14 15:39:12', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1498', null, '1', '第六课    喜庆唢呐——百鸟朝凤.rar', 'rar', '98', 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374754612.rar', '0', '1', '2017-09-14 15:39:14', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1499', null, '1', '第七课    锵锵京调——夜深沉.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374780946.mp4', '0', '1', '2017-09-14 15:39:41', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1500', null, '1', '第七课    锵锵京调——夜深沉.rar', 'rar', '98', 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374784333.rar', '0', '1', '2017-09-14 15:39:44', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1501', null, '1', '第八课   童真童趣——滚核桃.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374806343.mp4', '0', '1', '2017-09-14 15:40:06', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1502', null, '1', '第八课   童真童趣——滚核桃.rar', 'rar', '98', 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374811755.rar', '0', '1', '2017-09-14 15:40:11', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1503', null, '1', '第九课  律动之美——波莱罗舞曲.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374842411.mp4', '0', '1', '2017-09-14 15:40:42', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1504', null, '1', '第一课  巴蜀之音——盼红军.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374876191.mp4', '0', '1', '2017-09-14 15:41:16', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1505', null, '1', '第三课  黄河大合唱——《保卫黄河》.rar', 'rar', '98', 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374906899.rar', '0', '1', '2017-09-14 15:41:46', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1506', null, '1', '第七课  爵士乐——《不知为何》.rar', 'rar', '98', 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374931044.rar', '0', '1', '2017-09-14 15:42:11', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1507', null, '1', '第四课    洒脱不羁——酒狂.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374959190.mp4', '0', '1', '2017-09-14 15:42:39', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1508', null, '1', '第四课    洒脱不羁——酒狂.rar', 'rar', '98', 'resource/104/files/27A6167B036451A0959AA573C7AF47341505374965945.rar', '0', '1', '2017-09-14 15:42:46', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1509', null, '1', '第九课    诗情画意——春江花月夜.mp4', 'mp4', '15797610', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505375011937.mp4', '0', '1', '2017-09-14 15:43:32', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1510', null, '1', '第九课    诗情画意——春江花月夜.rar', 'rar', '98', 'resource/104/files/27A6167B036451A0959AA573C7AF47341505375016996.rar', '0', '1', '2017-09-14 15:43:37', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1511', null, '1', '49FE3B599CA01DD904A5959EA50638E91498724540353.png', 'png', '130952', '/cover/49FE3B599CA01DD904A5959EA50638E91506328584897.png', '0', '1', '2017-09-25 16:36:24', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1512', null, '1', '第一课 做真实的自己.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506504259168.mp4', '0', '1', '2017-09-27 17:24:19', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1513', null, '1', '第一课 做真实的自己.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506504270408.rar', '0', '1', '2017-09-27 17:24:30', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1514', null, '1', '第二课 实诚于己.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506504287403.mp4', '0', '1', '2017-09-27 17:24:47', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1515', null, '1', '第二课 实诚于己.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506504294703.rar', '0', '1', '2017-09-27 17:24:54', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1516', null, '1', '第三课 坦诚待人.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506504324484.mp4', '0', '1', '2017-09-27 17:25:24', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1517', null, '1', '第三课 坦诚待人.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506504330445.rar', '0', '1', '2017-09-27 17:25:30', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1518', null, '1', '第一课 自信，源自内心的力量.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506504347641.mp4', '0', '1', '2017-09-27 17:25:47', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1519', null, '1', '第一课 自信，源自内心的力量.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506504354162.rar', '0', '1', '2017-09-27 17:25:54', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1520', null, '1', '第二课 找到属于你自己的那把钥匙.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506504375642.mp4', '0', '1', '2017-09-27 17:26:15', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1521', null, '1', '第二课 找到属于你自己的那把钥匙.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506504383563.rar', '0', '1', '2017-09-27 17:26:23', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1522', null, '1', '第三课 青春，我们自信前行.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506504398617.mp4', '0', '1', '2017-09-27 17:26:38', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1523', null, '1', '第三课 青春，我们自信前行.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506504404799.rar', '0', '1', '2017-09-27 17:26:44', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1524', null, '1', '第一课 乐观是一种力量.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506504561895.mp4', '0', '1', '2017-09-27 17:29:21', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1525', null, '1', '第一课 乐观是一种力量.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506504583329.rar', '0', '1', '2017-09-27 17:29:43', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1526', null, '1', '第二课 活出乐观的自己.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506504602488.mp4', '0', '1', '2017-09-27 17:30:02', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1527', null, '1', '第二课 活出乐观的自己.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506504615695.rar', '0', '1', '2017-09-27 17:30:15', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1528', null, '1', '第三课 做一个乐观的人.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506504635761.mp4', '0', '1', '2017-09-27 17:30:35', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1529', null, '1', '第三课 做一个乐观的人.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506504644195.rar', '0', '1', '2017-09-27 17:30:44', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1530', null, '1', '第一课 知恩于心.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506504669048.mp4', '0', '1', '2017-09-27 17:31:09', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1531', null, '1', '第一课 知恩于心.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506504674539.rar', '0', '1', '2017-09-27 17:31:14', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1532', null, '1', '第二课 感恩于情.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506504688955.mp4', '0', '1', '2017-09-27 17:31:29', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1533', null, '1', '第二课 感恩于情.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506504695240.rar', '0', '1', '2017-09-27 17:31:35', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1534', null, '1', '第三课 懂报恩，能施恩.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506504712550.mp4', '0', '1', '2017-09-27 17:31:52', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1535', null, '1', '第三课 懂报恩，能施恩.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506504719353.rar', '0', '1', '2017-09-27 17:31:59', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1536', null, '1', '第一课 做一个自尊自爱的人.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506504808700.mp4', '0', '1', '2017-09-27 17:33:28', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1537', null, '1', '第一课 做一个自尊自爱的人.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506504819793.rar', '0', '1', '2017-09-27 17:33:39', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1538', null, '1', '第二课 构建长幼有序的人际关系.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506504835703.mp4', '0', '1', '2017-09-27 17:33:55', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1539', null, '1', '第二课 构建长幼有序的人际关系.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506504842076.rar', '0', '1', '2017-09-27 17:34:02', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1540', null, '1', '第三课 实现万物共生的社会生态格局.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506504992206.mp4', '0', '1', '2017-09-27 17:36:32', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1541', null, '1', '第三课 实现万物共生的社会生态格局.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506504999142.rar', '0', '1', '2017-09-27 17:36:39', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1542', null, '1', '第一课 山一样的责任.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506505023551.mp4', '0', '1', '2017-09-27 17:37:03', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1543', null, '1', '第一课 山一样的责任.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506505031645.rar', '0', '1', '2017-09-27 17:37:11', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1544', null, '1', '第二课 对自己尽责.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506505046537.mp4', '0', '1', '2017-09-27 17:37:26', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1545', null, '1', '第二课 对自己尽责.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506505057642.rar', '0', '1', '2017-09-27 17:37:37', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1546', null, '1', '第三课 社会责任需要担当.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506505080364.mp4', '0', '1', '2017-09-27 17:38:00', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1547', null, '1', '第三课 社会责任需要担当.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506505086341.rar', '0', '1', '2017-09-27 17:38:06', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1548', null, '1', '第一课 我眼中的宽容.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506505570771.mp4', '0', '1', '2017-09-27 17:46:10', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1549', null, '1', '第一课 我眼中的宽容.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506505580898.rar', '0', '1', '2017-09-27 17:46:20', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1550', null, '1', '第二课 宽容的限度.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506505613226.mp4', '0', '1', '2017-09-27 17:46:53', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1551', null, '1', '第二课 宽容的限度.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506505620264.rar', '0', '1', '2017-09-27 17:47:00', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1552', null, '1', '第三课 力行宽容.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506505638650.mp4', '0', '1', '2017-09-27 17:47:18', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1553', null, '1', '第三课 力行宽容.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506505651821.rar', '0', '1', '2017-09-27 17:47:31', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1554', null, '1', '第一课 沟通，从心开始.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506505681572.mp4', '0', '1', '2017-09-27 17:48:01', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1555', null, '1', '第一课 沟通，从心开始.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506505689207.rar', '0', '1', '2017-09-27 17:48:09', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1556', null, '1', '第二课 表达与倾听.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506505705009.mp4', '0', '1', '2017-09-27 17:48:25', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1557', null, '1', '第二课 表达与倾听.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506505710225.rar', '0', '1', '2017-09-27 17:48:30', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1558', null, '1', '第三课 拒绝与冲突.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506505730268.mp4', '0', '1', '2017-09-27 17:48:50', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1559', null, '1', '第三课 拒绝与冲突.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506505739104.rar', '0', '1', '2017-09-27 17:48:59', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1560', null, '1', '第一课 做真实的自己（讲课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506506067165.mp4', '0', '1', '2017-09-27 17:54:27', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1561', null, '1', '第二课 实诚于己（讲课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506506230506.mp4', '0', '1', '2017-09-27 17:57:10', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1562', null, '1', '第三课 坦诚待人（讲课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506506277587.mp4', '0', '1', '2017-09-27 17:57:57', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1563', null, '1', '第一课 自信，源自内心的力量(讲课).mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506561127575.mp4', '0', '1', '2017-09-28 09:12:07', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1564', null, '1', '属于你自己的那把钥匙（讲课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506561243030.mp4', '0', '1', '2017-09-28 09:14:03', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1565', null, '1', '第三课 青春，我们自信前行（讲课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506561320363.mp4', '0', '1', '2017-09-28 09:15:20', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1566', null, '1', '第一课 乐观是一种力量(讲课).mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506561679421.mp4', '0', '1', '2017-09-28 09:21:19', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1567', null, '1', '第二课 活出乐观的自己（讲课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506561915961.mp4', '0', '1', '2017-09-28 09:25:16', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1568', null, '1', '第三课 做一个乐观的人（讲课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506562023154.mp4', '0', '1', '2017-09-28 09:27:03', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1569', null, '1', '第一课 知恩于心(讲课).mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506563706687.mp4', '0', '1', '2017-09-28 09:55:06', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1570', null, '1', '第二课 感恩于情（讲课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506563885065.mp4', '0', '1', '2017-09-28 09:58:05', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1571', null, '1', '第三课 懂报恩，能施恩（讲课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506564369814.mp4', '0', '1', '2017-09-28 10:06:09', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1572', null, '1', '第一课 做一个自尊自爱的人（讲课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506564437287.mp4', '0', '1', '2017-09-28 10:07:17', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1573', null, '1', '第二课 构建长幼有序的人际关系（讲课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506564495645.mp4', '0', '1', '2017-09-28 10:08:15', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1574', null, '1', '第三课 实现万物共生的社会生态格局.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506564738085.mp4', '0', '1', '2017-09-28 10:12:18', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1575', null, '1', '第三课 做一个懂服从的人（说课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506565389099.mp4', '0', '1', '2017-09-28 10:23:09', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1576', null, '1', '第三课 做一个懂服从的人.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506565417095.rar', '0', '1', '2017-09-28 10:23:37', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1577', null, '1', '66DCB72787BC5610F236E4E26036076C1498724558125.png', 'png', '148805', '/cover/66DCB72787BC5610F236E4E26036076C1506565436444.png', '0', '1', '2017-09-28 10:23:56', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1578', null, '1', '第三课 做一个懂服从的人.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506565446988.mp4', '0', '1', '2017-09-28 10:24:07', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1579', null, '1', '第二课 学会服从（说课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506565470106.mp4', '0', '1', '2017-09-28 10:24:30', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1580', null, '1', '第二课 学会服从.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506565616879.rar', '0', '1', '2017-09-28 10:26:56', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1581', null, '1', '第二课 学会服从.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506565633196.mp4', '0', '1', '2017-09-28 10:27:13', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1582', null, '1', '第一课 我们需要服从的品格（说课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506565652416.mp4', '0', '1', '2017-09-28 10:27:32', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1583', null, '1', '第一课 我们需要服从的品格.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506565756206.rar', '0', '1', '2017-09-28 10:29:16', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1584', null, '1', '第一课 我们需要服从的品格.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506565770988.mp4', '0', '1', '2017-09-28 10:29:31', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1585', null, '1', '第三课 友善伴我行（说课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506565803605.mp4', '0', '1', '2017-09-28 10:30:03', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1586', null, '1', '第三课 友善伴我行.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506565816421.rar', '0', '1', '2017-09-28 10:30:16', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1587', null, '1', '第三课 友善伴我行.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506565831658.mp4', '0', '1', '2017-09-28 10:30:31', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1588', null, '1', '第二课 友善的力量（说课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506565849270.mp4', '0', '1', '2017-09-28 10:30:49', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1589', null, '1', '第二课 友善的力量.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506565863560.rar', '0', '1', '2017-09-28 10:31:03', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1590', null, '1', '第二课 友善的力量.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506565878704.mp4', '0', '1', '2017-09-28 10:31:18', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1591', null, '1', '第一课 友善之花（说课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506565899103.mp4', '0', '1', '2017-09-28 10:31:39', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1592', null, '1', '第一课 友善之花.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506565914842.rar', '0', '1', '2017-09-28 10:31:54', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1593', null, '1', '第一课 友善之花.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506565929540.mp4', '0', '1', '2017-09-28 10:32:09', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1594', null, '1', '第三课 做一个节俭的人（说课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506565953131.mp4', '0', '1', '2017-09-28 10:32:33', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1595', null, '1', '第三课 做一个节俭的人.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506565966368.rar', '0', '1', '2017-09-28 10:32:46', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1596', null, '1', '第三课 做一个节俭的人.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506565986513.mp4', '0', '1', '2017-09-28 10:33:06', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1597', null, '1', '第二课 我们需要节俭（说课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566024261.mp4', '0', '1', '2017-09-28 10:33:44', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1598', null, '1', '第二课 我们需要节俭.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506566036131.rar', '0', '1', '2017-09-28 10:33:56', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1599', null, '1', '第二课 我们需要节俭.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566091498.mp4', '0', '1', '2017-09-28 10:34:51', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1600', null, '1', '第一课 节俭是一种美德（说课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566120645.mp4', '0', '1', '2017-09-28 10:35:20', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1601', null, '1', '第一课 节俭是一种美德.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506566133383.rar', '0', '1', '2017-09-28 10:35:33', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1602', null, '1', '第一课 节俭是一种美德.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566149542.mp4', '0', '1', '2017-09-28 10:35:49', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1603', null, '1', '第三课 勇于选择，规划未来（说课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566188986.mp4', '0', '1', '2017-09-28 10:36:29', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1604', null, '1', '第三课 勇于选择，规划未来.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506566207238.rar', '0', '1', '2017-09-28 10:36:47', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1605', null, '1', '第三课 勇于选择，规划未来.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566232644.mp4', '0', '1', '2017-09-28 10:37:13', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1606', null, '1', '第二课 勇敢挑战心理舒适区（说课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566266727.mp4', '0', '1', '2017-09-28 10:37:46', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1607', null, '1', '第二课 勇敢挑战心理舒适区.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506566284724.rar', '0', '1', '2017-09-28 10:38:04', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1608', null, '1', '第二课 勇敢挑战心理舒适区.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566299794.mp4', '0', '1', '2017-09-28 10:38:19', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1609', null, '1', '第一课 勇于作为，敢为人先（说课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566343675.mp4', '0', '1', '2017-09-28 10:39:03', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1610', null, '1', '第一课 勇于作为，敢为人先.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506566357989.rar', '0', '1', '2017-09-28 10:39:18', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1611', null, '1', '第一课 勇于作为，敢为人先.mp4', 'mp4', '15797610', 'resource/105/files/C430C8A7597FEA7595AA70239506716E1506566387805.mp4', '0', '1', '2017-09-28 10:39:47', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1612', null, '1', '第一课 勇于作为，敢为人先.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566396768.mp4', '0', '1', '2017-09-28 10:39:56', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1613', null, '1', '第三课 拒绝与冲突（说课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566427119.mp4', '0', '1', '2017-09-28 10:40:27', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1614', null, '1', '第三课 拒绝与冲突.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506566440532.rar', '0', '1', '2017-09-28 10:40:40', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1615', null, '1', '第二课 表达与倾听（说课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566459690.mp4', '0', '1', '2017-09-28 10:40:59', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1616', null, '1', '第二课 表达与倾听.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506566470449.rar', '0', '1', '2017-09-28 10:41:10', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1617', null, '1', '第一课 沟通，从心开始（说课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566488453.mp4', '0', '1', '2017-09-28 10:41:28', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1618', null, '1', '第一课 沟通，从心开始.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506566498463.rar', '0', '1', '2017-09-28 10:41:38', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1619', null, '1', '第三课 力行宽容（说课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566520701.mp4', '0', '1', '2017-09-28 10:42:00', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1620', null, '1', '第三课 力行宽容.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506566530979.rar', '0', '1', '2017-09-28 10:42:10', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1621', null, '1', '第二课 宽容的限度（说课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566564480.mp4', '0', '1', '2017-09-28 10:42:44', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1622', null, '1', '第二课 宽容的限度.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506566572538.rar', '0', '1', '2017-09-28 10:42:52', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1623', null, '1', '第一课 我眼中的宽容（说课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566589197.mp4', '0', '1', '2017-09-28 10:43:09', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1624', null, '1', '第一课 我眼中的宽容.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506566597640.rar', '0', '1', '2017-09-28 10:43:17', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1625', null, '1', '第三课 社会责任需要担当（说课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566624221.mp4', '0', '1', '2017-09-28 10:43:44', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1626', null, '1', '第三课 社会责任需要担当.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506566632165.rar', '0', '1', '2017-09-28 10:43:52', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1627', null, '1', '第二课 对自己尽责（说课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566651794.mp4', '0', '1', '2017-09-28 10:44:11', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1628', null, '1', '第二课 对自己尽责（说课）.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506566657847.rar', '0', '1', '2017-09-28 10:44:17', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1629', null, '1', '第一课 山一样的责任（说课）.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566692640.mp4', '0', '1', '2017-09-28 10:44:53', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1630', null, '1', '第一课 山一样的责任.rar', 'rar', '28450', 'resource/105/files/EB8633EBF3882ACCA5DCB3096FF0A2861506566707108.rar', '0', '1', '2017-09-28 10:45:07', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1631', null, '1', '第一课 山一样的责任.mp4', 'mp4', '15797610', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566723290.mp4', '0', '1', '2017-09-28 10:45:23', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1632', null, '1', '第一单元 从社会主义核心价值体系到社会主义核心价值观（一）.mp4', 'mp4', '15797610', 'resource/106/video/C430C8A7597FEA7595AA70239506716E1506586258698.mp4', '0', '1', '2017-09-28 16:10:58', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1633', null, '1', '第一单元 从社会主义核心价值体系到社会主义核心价值观（二）.mp4', 'mp4', '15797610', 'resource/106/video/C430C8A7597FEA7595AA70239506716E1506586973344.mp4', '0', '1', '2017-09-28 16:22:53', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1634', null, '1', '第二单元 培育和弘扬社会主义核心价值观的重要性和紧迫性.mp4', 'mp4', '15797610', 'resource/106/video/C430C8A7597FEA7595AA70239506716E1506587735760.mp4', '0', '1', '2017-09-28 16:35:35', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1635', null, '1', '第三单元 培育和弘扬社会主义核心价值观的主要途径（一）.mp4', 'mp4', '15797610', 'resource/106/video/C430C8A7597FEA7595AA70239506716E1506587777224.mp4', '0', '1', '2017-09-28 16:36:17', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1636', null, '1', '第三单元 培育和弘扬社会主义核心价值观的主要途径（二）.mp4', 'mp4', '15797610', 'resource/106/video/C430C8A7597FEA7595AA70239506716E1506587813696.mp4', '0', '1', '2017-09-28 16:36:53', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1637', null, '1', '第三单元 培育和弘扬社会主义核心价值观的主要途径（三）.mp4', 'mp4', '15797610', 'resource/106/video/C430C8A7597FEA7595AA70239506716E1506587851788.mp4', '0', '1', '2017-09-28 16:37:31', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1638', null, '1', '第六单元 建设社会主义核心价值体系必须回答的问题.mp4', 'mp4', '15797610', 'resource/106/video/C430C8A7597FEA7595AA70239506716E1506587886701.mp4', '0', '1', '2017-09-28 16:38:06', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1639', null, '1', '第一课： 应以什么样的方式来思考核心价值观的培育这个文化核心问题.mp4', 'mp4', '15797610', 'resource/106/video/C430C8A7597FEA7595AA70239506716E1506587920194.mp4', '0', '1', '2017-09-28 16:38:40', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1640', null, '1', '第二课： 应以什么样的方式来思考核心价值观的培育这个文化核心问题.mp4', 'mp4', '15797610', 'resource/106/video/C430C8A7597FEA7595AA70239506716E1506587948867.mp4', '0', '1', '2017-09-28 16:39:08', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1641', null, '1', '第三课： 应以什么样的方式来思考核心价值观的培育这个文化核心问题.mp4', 'mp4', '15797610', 'resource/106/video/C430C8A7597FEA7595AA70239506716E1506587983547.mp4', '0', '1', '2017-09-28 16:39:43', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1642', null, '1', '第四课： 应以什么样的方式来思考核心价值观的培育这个文化核心问题..mp4', 'mp4', '15797610', 'resource/106/video/C430C8A7597FEA7595AA70239506716E1506588018517.mp4', '0', '1', '2017-09-28 16:40:18', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1643', null, '1', '说核心价值观是兴国之魂合成.mp4', 'mp4', '15797610', 'resource/106/video/C430C8A7597FEA7595AA70239506716E1506588093266.mp4', '0', '1', '2017-09-28 16:41:33', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1644', null, '1', '360截图20170928164134666.jpg', 'jpg', '50164', '/cover/BF119D02D2278E175C8A33CEBEBDAA6C1506588455914.jpg', '0', '1', '2017-09-28 16:47:35', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1645', null, '1', '第一单元  “中国梦”——百年追梦与民族自强（一）.mp4', 'mp4', '15797610', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506588548531.mp4', '0', '1', '2017-09-28 16:49:08', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1646', null, '1', '第一单元  “中国梦”——百年追梦与民族自强（二）.mp4', 'mp4', '15797610', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506588814171.mp4', '0', '1', '2017-09-28 16:53:34', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1647', null, '1', '第一单元  “中国梦”——百年追梦与民族自强（三）.mp4', 'mp4', '15797610', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506588907663.mp4', '0', '1', '2017-09-28 16:55:07', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1648', null, '1', '第二单元 “中国道路”——中华民族伟大复兴的路径选择（一）.mp4', 'mp4', '15797610', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506588962674.mp4', '0', '1', '2017-09-28 16:56:03', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1649', null, '1', '第二单元 “中国道路”——中华民族伟大复兴的路径选择（二）.mp4', 'mp4', '15797610', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506588988460.mp4', '0', '1', '2017-09-28 16:56:28', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1650', null, '1', '第二单元 “中国道路”——中华民族伟大复兴的路径选择（三）.mp4', 'mp4', '15797610', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506589010420.mp4', '0', '1', '2017-09-28 16:56:50', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1651', null, '1', '第三单元 伟大复兴——”中国梦“的深刻内涵（一）.mp4', 'mp4', '15797610', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506589092276.mp4', '0', '1', '2017-09-28 16:58:12', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1652', null, '1', '第三单元 伟大复兴——”中国梦“的深刻内涵（二）.mp4', 'mp4', '15797610', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506589116425.mp4', '0', '1', '2017-09-28 16:58:36', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1653', null, '1', '第四单元 实干兴邦——”中国梦“的根本保障（一）.mp4', 'mp4', '15797610', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506589475267.mp4', '0', '1', '2017-09-28 17:04:35', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1654', null, '1', '第四单元 实干兴邦——”中国梦“的根本保障（二）.mp4', 'mp4', '15797610', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506589503321.mp4', '0', '1', '2017-09-28 17:05:03', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1655', null, '1', '第四单元 实干兴邦——”中国梦“的根本保障（三）.mp4', 'mp4', '15797610', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506589535555.mp4', '0', '1', '2017-09-28 17:05:35', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1656', null, '1', '第五单元 凝心聚力——“中国精神”的民族特征（一）.mp4', 'mp4', '15797610', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506589581054.mp4', '0', '1', '2017-09-28 17:06:21', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1657', null, '1', '第五单元 凝心聚力——“中国精神”的民族特征（二）.mp4', 'mp4', '15797610', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506589604627.mp4', '0', '1', '2017-09-28 17:06:45', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1658', null, '1', '第五单元 凝心聚力——“中国精神”的民族特征（三）.mp4', 'mp4', '15797610', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506589626326.mp4', '0', '1', '2017-09-28 17:07:06', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1659', null, '1', '第六单元 共筑中国梦——“中国精神”的时代要求（一）.mp4', 'mp4', '15797610', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506589675161.mp4', '0', '1', '2017-09-28 17:07:55', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1660', null, '1', '第六单元 共筑中国梦——“中国精神”的时代要求（二）.mp4', 'mp4', '15797610', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506589703359.mp4', '0', '1', '2017-09-28 17:08:23', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1661', null, '1', '1-1 艺术的起源——史前艺术.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510304176359.mp4', '0', '1', '2017-11-10 16:56:16', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1662', null, '1', '1-1 艺术的起源——史前艺术.rar', 'rar', '34813035', 'resource/108/files/EBB02C9481D167D86EFCBCCE286D7A31510304238997.rar', '0', '1', '2017-11-10 16:57:19', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1663', null, '1', '360截图20171110165933268.jpg', 'jpg', '84387', '/cover/7D70E4C3E7E06E42868984C6DFCE3D9F1510304554468.jpg', '0', '1', '2017-11-10 17:02:34', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1664', null, '1', 'C430C8A7597FEA7595AA70239506716E1510304176359.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510304672953.mp4', '0', '1', '2017-11-10 17:04:33', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1665', null, '1', '1-2 卑微的狰狞——商周青铜文化.rar', 'rar', '37531592', 'resource/108/files/65D7D82487F58F4E7E27A9C031597ED1510304678979.rar', '0', '1', '2017-11-10 17:04:39', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1666', null, '1', '1-3 彪悍的现实主义——秦汉墓葬艺术.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510304849208.mp4', '0', '1', '2017-11-10 17:07:29', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1667', null, '1', '1-3 彪悍的现实主义——秦汉墓葬艺术.rar', 'rar', '27248943', 'resource/108/files/66352FC039C2B591B0F83AF650738F611510304875812.rar', '0', '1', '2017-11-10 17:07:55', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1668', null, '1', '1-4 世界中心的艺术——唐代艺术.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510304901802.mp4', '0', '1', '2017-11-10 17:08:21', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1669', null, '1', '1-4 世界中心的艺术——唐代艺术.rar', 'rar', '32747629', 'resource/108/files/524275EB5F09258783A87A81FA8ACBE41510304938091.rar', '0', '1', '2017-11-10 17:08:58', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1670', null, '1', '1-5 格物致知——宋代花鸟画.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510304961580.mp4', '0', '1', '2017-11-10 17:09:21', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1671', null, '1', '1-5 格物致知——宋代花鸟画.rar', 'rar', '23070452', 'resource/108/files/26F6101630C0765B2904F2A9FE9D57F21510304985702.rar', '0', '1', '2017-11-10 17:09:45', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1672', null, '1', '1-6 溪山高远——宋代山水画.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510305029194.mp4', '0', '1', '2017-11-10 17:10:29', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1673', null, '1', '1-6 溪山高远——宋代山水画.rar', 'rar', '28450', 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510305378121.rar', '0', '1', '2017-11-10 17:16:18', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1674', null, '1', '1-7 文人自觉与艺术交融——元代艺术.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510305395196.mp4', '0', '1', '2017-11-10 17:16:35', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1675', null, '1', '1-7 文人自觉与艺术交融——元代艺术.rar', 'rar', '28450', 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510305404722.rar', '0', '1', '2017-11-10 17:16:44', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1676', null, '1', '1-8 江南风韵——明代艺术.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510305421484.mp4', '0', '1', '2017-11-10 17:17:01', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1677', null, '1', '1-8 江南风韵——明代艺术.rar', 'rar', '28450', 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510305439928.rar', '0', '1', '2017-11-10 17:17:19', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1678', null, '1', '1-9 皇家典藏与江南艺术——清代艺术.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510305479575.mp4', '0', '1', '2017-11-10 17:17:59', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1679', null, '1', '1-9 皇家典藏与江南艺术——清代艺术.rar', 'rar', '28450', 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510305485763.rar', '0', '1', '2017-11-10 17:18:05', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1680', null, '1', '1-10 爱国运动中的艺术——近代艺术.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510305509455.mp4', '0', '1', '2017-11-10 17:18:29', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1681', null, '1', '1-10 爱国运动中的艺术——近代艺术.mp4', 'mp4', '15797610', 'resource/108/files/C430C8A7597FEA7595AA70239506716E1510305513134.mp4', '0', '1', '2017-11-10 17:18:33', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1682', null, '1', '1-11 沟通到表现——书法.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510305529569.mp4', '0', '1', '2017-11-10 17:18:49', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1683', null, '1', '1-11 沟通到表现——书法.rar', 'rar', '28450', 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510305535236.rar', '0', '1', '2017-11-10 17:18:55', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1684', null, '1', '1-12 火与泥的涅槃——陶瓷（上）.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510305553053.mp4', '0', '1', '2017-11-10 17:19:13', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1685', null, '1', '1-12 火与泥的涅槃——陶瓷（上）.rar', 'rar', '28450', 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510305608428.rar', '0', '1', '2017-11-10 17:20:08', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1686', null, '1', '3 china的化身——陶瓷（下）.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510305814355.mp4', '0', '1', '2017-11-10 17:23:35', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1687', null, '1', '3 china的化身——陶瓷（下）.rar', 'rar', '28450', 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510305821494.rar', '0', '1', '2017-11-10 17:23:41', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1688', null, '1', '1-14 织物上的艺术——帛画、纺织品艺术.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510305837357.mp4', '0', '1', '2017-11-10 17:23:57', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1689', null, '1', '1-14 织物上的艺术——帛画、纺织品艺术.rar', 'rar', '28450', 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510305843978.rar', '0', '1', '2017-11-10 17:24:03', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1690', null, '1', '1-15 把玩的艺术——牙、角、匏艺术品.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510305861190.mp4', '0', '1', '2017-11-10 17:24:21', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1691', null, '1', '1-15 把玩的艺术——牙、角、匏艺术品.rar', 'rar', '28450', 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510305880842.rar', '0', '1', '2017-11-10 17:24:40', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1692', null, '1', '1-16 千年不朽——漆器艺术.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510305896914.mp4', '0', '1', '2017-11-10 17:24:56', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1693', null, '1', '1-16 千年不朽——漆器艺术.rar', 'rar', '28450', 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510305906898.rar', '0', '1', '2017-11-10 17:25:06', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1694', null, '1', '1-17 装扮之美——饰品.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510305922945.mp4', '0', '1', '2017-11-10 17:25:23', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1695', null, '1', '1-17 装扮之美——饰品.rar', 'rar', '28450', 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510305930701.rar', '0', '1', '2017-11-10 17:25:30', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1696', null, '1', '1-18 书房里的宝贝——文房用品.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510305945339.mp4', '0', '1', '2017-11-10 17:25:45', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1697', null, '1', '1-18 书房里的宝贝——文房用品.rar', 'rar', '28450', 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510305952576.rar', '0', '1', '2017-11-10 17:25:52', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1698', null, '1', '1-19 信仰之光——宗教艺术.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510305969480.mp4', '0', '1', '2017-11-10 17:26:09', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1699', null, '1', '1-19 信仰之光——宗教艺术.rar', 'rar', '28450', 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510305976098.rar', '0', '1', '2017-11-10 17:26:16', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1700', null, '1', '1-20 凝固的音乐——建筑中的艺术美.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510305991996.mp4', '0', '1', '2017-11-10 17:26:32', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1701', null, '1', '1-20 凝固的音乐——建筑中的艺术美.rar', 'rar', '28450', 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510305996978.rar', '0', '1', '2017-11-10 17:26:36', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1702', null, '1', '1-21 民族瑰宝——民族艺术.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510306013205.mp4', '0', '1', '2017-11-10 17:26:53', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1703', null, '1', '1-21 民族瑰宝——民族艺术.rar', 'rar', '28450', 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510306021451.rar', '0', '1', '2017-11-10 17:27:01', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1704', null, '1', '1-22 生活中的艺术——民间艺术.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510306037310.mp4', '0', '1', '2017-11-10 17:27:17', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1705', null, '1', '1-22 生活中的艺术——民间艺术.rar', 'rar', '28450', 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510306044056.rar', '0', '1', '2017-11-10 17:27:24', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1706', null, '1', '2-1 逝去的文明——埃及、两河文明.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510535923627.mp4', '0', '1', '2017-11-13 09:18:43', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1707', null, '1', '2-1 逝去的文明——埃及、两河文明.rar', 'rar', '28450', 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510535932053.rar', '0', '1', '2017-11-13 09:18:52', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1708', null, '1', '欧陆曙光——古希腊罗马艺术.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510535947826.mp4', '0', '1', '2017-11-13 09:19:07', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1709', null, '1', '欧陆曙光——古希腊罗马艺术.rar', 'rar', '28450', 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510535958735.rar', '0', '1', '2017-11-13 09:19:18', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1710', null, '1', '冷峻严肃——中世纪欧洲艺术.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510535975593.mp4', '0', '1', '2017-11-13 09:19:35', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1711', null, '1', '冷峻严肃——中世纪欧洲艺术.rar', 'rar', '28450', 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510535984865.rar', '0', '1', '2017-11-13 09:19:44', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1712', null, '1', '群星璀璨——欧洲文艺复兴时期艺术.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510536002244.mp4', '0', '1', '2017-11-13 09:20:02', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1713', null, '1', '群星璀璨——欧洲文艺复兴时期艺术.rar', 'rar', '28450', 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510536014631.rar', '0', '1', '2017-11-13 09:20:14', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1714', null, '1', '2-5 重归理性——从巴洛克到新古典主义.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510536033536.mp4', '0', '1', '2017-11-13 09:20:33', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1715', null, '1', '2-5 重归理性——从巴洛克到新古典主义.rar', 'rar', '28450', 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510536042303.rar', '0', '1', '2017-11-13 09:20:42', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1716', null, '1', '2-6 走向表现——印象派及以后.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510536057316.mp4', '0', '1', '2017-11-13 09:20:57', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1717', null, '1', '2-6 走向表现——印象派及以后.rar', 'rar', '28450', 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510536066267.rar', '0', '1', '2017-11-13 09:21:06', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1718', null, '1', '2-7 一切皆有可能——现代艺术.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510536081523.mp4', '0', '1', '2017-11-13 09:21:21', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1719', null, '1', '2-7 一切皆有可能——现代艺术.rar', 'rar', '28450', 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510536090895.rar', '0', '1', '2017-11-13 09:21:30', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1720', null, '1', '3-1 品味的变迁——设计风格的变化.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510536111204.mp4', '0', '1', '2017-11-13 09:21:51', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1721', null, '1', '3-1 品味的变迁——设计风格的变化.rar', 'rar', '28450', 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510536119687.rar', '0', '1', '2017-11-13 09:21:59', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1722', null, '1', '3-2 艺术与科学——艺术中体现的科学问题.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510536135165.mp4', '0', '1', '2017-11-13 09:22:15', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1723', null, '1', '3-2 艺术与科学——艺术中体现的科学问题.rar', 'rar', '28450', 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510536146868.rar', '0', '1', '2017-11-13 09:22:26', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1724', null, '1', '3-3 艺术基础ABC——一些常用的基本概念.mp4', 'mp4', '15797610', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510536166492.mp4', '0', '1', '2017-11-13 09:22:46', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1725', null, '1', '3-3 艺术基础ABC——一些常用的基本概念.rar', 'rar', '28450', 'resource/108/files/EB8633EBF3882ACCA5DCB3096FF0A2861510536173750.rar', '0', '1', '2017-11-13 09:22:53', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1726', null, '1', 'QQ截图20171212163442.jpg', 'jpg', '100167', '/cover/50F8C252D3529BFD17A71AB408FA9D511513067733628.jpg', '0', '1', '2017-12-12 16:35:33', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1727', null, '1', '2-4 伟大的牛顿革命（一）：哥白尼的“第一枪” 讲课.mp4', 'mp4', '404806924', 'resource/109/video/fcc2d375eaac451ebe050ec4acc3a34f1513068061951.mp4', '0', '1', '2017-12-12 16:41:03', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1728', null, '1', '2-4 伟大的牛顿革命（一）：哥白尼的“第一枪” 说课.mp4', 'mp4', '41370312', 'resource/109/video/07a5dbfce5534786ae64fffe7b6a62331513068114007.mp4', '0', '1', '2017-12-12 16:41:54', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1729', null, '1', '2-4 伟大的牛顿革命（一）：哥白尼的“第一枪”.rar', 'rar', '9213239', 'resource/109/files/2d3e0fde3ebc458cae9db4cbc169a0271513068122398.rar', '0', '1', '2017-12-12 16:42:02', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1730', null, '1', '1-6 古代中国的辉煌成就（一） 讲课.mp4', 'mp4', '357622506', 'resource/109/video/4085da874846405ca32b77998c8aad741513070091697.mp4', '0', '1', '2017-12-12 17:14:52', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1731', null, '1', '1-6 古代中国的辉煌成就（一） 说课.mp4', 'mp4', '44196599', 'resource/109/video/46fef0de72a3493b9866f732a417d5541513070116501.mp4', '0', '1', '2017-12-12 17:15:16', '1', '1', '0', null, null);
INSERT INTO `file_info_tmp` VALUES ('1732', null, '1', '1-6 古代中国的辉煌成就（一）.rar', 'rar', '4796700', 'resource/109/files/e8ac8ff00a9c4418944f78392b6d5d111513070128843.rar', '0', '1', '2017-12-12 17:15:28', '1', '1', '0', null, null);

-- ----------------------------
-- Table structure for file_type
-- ----------------------------
DROP TABLE IF EXISTS `file_type`;
CREATE TABLE `file_type` (
  `file_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`file_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file_type
-- ----------------------------
INSERT INTO `file_type` VALUES ('1', '压缩资源', 'zip');

-- ----------------------------
-- Table structure for function_info
-- ----------------------------
DROP TABLE IF EXISTS `function_info`;
CREATE TABLE `function_info` (
  `function_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`function_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of function_info
-- ----------------------------
INSERT INTO `function_info` VALUES ('1', '用于作业');
INSERT INTO `function_info` VALUES ('2', '用于考试');
INSERT INTO `function_info` VALUES ('3', '作业、考试均可');

-- ----------------------------
-- Table structure for grade_info
-- ----------------------------
DROP TABLE IF EXISTS `grade_info`;
CREATE TABLE `grade_info` (
  `grade_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `schoolId` int(11) DEFAULT NULL,
  `createUser` int(11) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `stateDate` datetime DEFAULT NULL,
  `state` int(2) DEFAULT '1',
  PRIMARY KEY (`grade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade_info
-- ----------------------------
INSERT INTO `grade_info` VALUES ('1', '2013级', null, '1', null, '2016-11-11 15:05:43', '2016-11-11 15:05:43', '1');
INSERT INTO `grade_info` VALUES ('2', '2014级', null, '1', null, '2016-11-11 15:16:04', '2016-11-11 15:16:06', '1');
INSERT INTO `grade_info` VALUES ('3', '2015级', null, '1', null, '2016-11-11 15:16:29', '2016-11-11 15:16:32', '1');
INSERT INTO `grade_info` VALUES ('4', '2016级', null, '1', null, '2016-11-11 15:17:37', '2016-11-11 15:17:39', '1');
INSERT INTO `grade_info` VALUES ('5', '2017级', null, '1', null, '2017-11-03 09:51:25', '2017-11-03 09:51:28', '1');
INSERT INTO `grade_info` VALUES ('6', '2018级', null, '1', null, '2017-11-03 09:51:44', '2017-11-03 09:51:47', '1');
INSERT INTO `grade_info` VALUES ('7', '2019级', null, '1', null, '2017-11-03 09:52:03', '2017-11-03 09:52:06', '1');
INSERT INTO `grade_info` VALUES ('8', '2020级', null, '1', null, '2017-11-03 09:52:19', '2017-11-03 09:52:21', '1');

-- ----------------------------
-- Table structure for lecturer_info
-- ----------------------------
DROP TABLE IF EXISTS `lecturer_info`;
CREATE TABLE `lecturer_info` (
  `lecturer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '讲师ID',
  `school_id` int(11) DEFAULT NULL COMMENT '学校ID',
  `name` varchar(50) DEFAULT NULL COMMENT '讲师名称',
  `info` text COMMENT '讲师信息',
  `avatar` varchar(200) DEFAULT NULL COMMENT '头像',
  `position` varchar(100) DEFAULT NULL COMMENT '职称',
  `gender` int(1) DEFAULT NULL COMMENT '性别,0：女生，1：男生',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `phone` varchar(11) DEFAULT NULL,
  `birthday` date DEFAULT '0000-00-00' COMMENT '生日',
  `stateDate` datetime DEFAULT NULL COMMENT '状态修改时间',
  `state` int(1) DEFAULT '0' COMMENT '状态，0：不可用，1：可用',
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`lecturer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lecturer_info
-- ----------------------------
INSERT INTO `lecturer_info` VALUES ('4', '1', '俞国良', '教育部全国教育科学规划学科评审组成员\r\n全国中小学心理健康指导委员会副秘书长\r\n中国人民大学心理研究所所长、中国科学院、北京师范大学兼职教授\r\n中国职教学会德育工作委员会副主任、“亚卓教育”学术委员会主任', 'avatar/7D38106EA4D3AAFA2705A860E8FE61B1496733858060.png', '教授', '1', '2017-05-12 12:01:43', '', null, null, '1', '');
INSERT INTO `lecturer_info` VALUES ('6', '1', '李超', '教授、博士研究生、硕士生导师\r\n教育部《中国教育信息化》、《基础教育参考》、《基础教育课程》杂志编委\r\n中国职业技术教学会德育工作委员会理事', 'avatar/CC7C6755F488A8B73A9458D56D04877A1496733765505.png', '教授', '1', '2017-05-12 12:07:10', '', null, null, '1', '');
INSERT INTO `lecturer_info` VALUES ('7', '1', '毕诚', '中国教育科学研究院教授、博导\r\n中国教育科学研究院全国校长发展学校常务副校长\r\n北京大学、武汉大学教授、博导（兼）', 'avatar/20E272322DE0F8D49D2763633769581C1496733777472.png', '教授', '1', '2017-05-12 12:07:59', '', null, null, '1', '');
INSERT INTO `lecturer_info` VALUES ('8', '1', '徐国庆', '华东师范大学教授、博士、博士生导师\r\n中国职教学会学术委员会副秘书长、课程研究会副主任\r\n华东师范大学职业技术教育研究中心主任', 'avatar/C3E4AF416D35B87086660C75488EF6681496733877722.png', '教授', '1', '2017-05-12 12:08:41', '', null, null, '1', '');
INSERT INTO `lecturer_info` VALUES ('9', '1', '苏彦捷', '教育部全国教育科学规划学科评审组成员\r\n教育部中小学心理健康教育专家指导委员会委员\r\n北京大学教授、博导，北京大学元培学院副院长', 'avatar/658C33564FCD29D5F5B41C61B5EF3B821496733805714.png', '教授', '1', '2017-05-12 12:23:21', '13439087665', '2015-06-08', null, '1', '');
INSERT INTO `lecturer_info` VALUES ('10', '1', ' 檀传宝', '教育部全国教育科学规划学科评审组成员\r\n北京师范大学教授、博士生导师\r\n北京师范大学公民与道德教育研究中心主任', 'avatar/FD2F274CEE4D4960FC44334B5F0FAC571496733830011.png', '教授', '1', '2017-05-12 12:24:05', '13437876884', '2017-05-09', null, '1', '');
INSERT INTO `lecturer_info` VALUES ('11', '1', '孙 伟', '\r\n孙 伟\r\n孙 伟教授\r\n\r\n北京航空航天大学教授、 博士生导师\r\n北京航空航天大学软件学院创始院长\r\n北京市软件协会执行会长', 'avatar/201705/20170512/2761C60CB1FA57D43D0D30B5315671671494563087044.png', '教授', '1', '2017-05-12 12:24:47', '13436867455', null, null, '0', '');
INSERT INTO `lecturer_info` VALUES ('12', '1', '伍忠杰', '电子科技大学 教授、硕士生导师\r\n国内顶级网络课程开发专家', 'avatar/201705/20170512/FA15048B8BDB62AA1B9E7751DB5A07C61494563135004.png', '教授', '1', '2017-05-12 12:25:35', '', null, null, '0', '');
INSERT INTO `lecturer_info` VALUES ('14', '1', 'ff', '', 'avatar/201705/20170523/F79C27826042EA339FA5A6A0F5B323BB1495521060324.jpg', '', '2', '2017-05-23 14:31:02', '', null, null, '0', '');
INSERT INTO `lecturer_info` VALUES ('19', '1', '雷 雳', '中国人民大学 教授、博士、博士生导师\r\n国内网络心理学研究第一人', 'avatar/70B1EDDF0258F748F592D4D5FFD677151498723012136.png', '教授', '1', '2017-06-29 15:56:44', '', null, '0000-00-00 00:00:00', '1', '');
INSERT INTO `lecturer_info` VALUES ('20', '1', '汪永智', ' 中国职教学会德育工作委员会副主任 中国职教学会班主任与师德建设研究中心主任  ', 'avatar/6890CB5754F61FF86F3C649076E0B0381505359953783.png', '教授', '1', '2017-09-14 11:32:33', '', null, null, '1', '');
INSERT INTO `lecturer_info` VALUES ('21', '1', '文春帆', ' 教育部知名课程开发专家、特级教师 成都市教育科学研究院职成所所长 ', 'avatar/B7CB5CEAAA48403A4690DA1443113E2D1505360269968.png', '教授', '2', '2017-09-14 11:37:50', '', null, null, '1', '');
INSERT INTO `lecturer_info` VALUES ('22', '1', '杜文忠', '湖南大学博士生导师、法学博士后、教授 国内知名法律文化学者', 'avatar/A7934F3807F8C0F64CE4D8943A6DB7AB1505360354254.png', '教授', '1', '2017-09-14 11:39:14', '', null, null, '1', '');
INSERT INTO `lecturer_info` VALUES ('23', '1', '刘广宇', ' 西南交通大学 教授、博士、博士生导师 国内网络课程制作知名专家 ', 'avatar/266DF0F8DD06A700955AA36B096290DC1505372483038.png', '教授', '1', '2017-09-14 15:01:23', '', null, null, '1', '');
INSERT INTO `lecturer_info` VALUES ('24', '1', '张雪永', ' 西南交通大学教授、博士、硕士生导师 国内“中国近代史”研究专家 ', 'avatar/B4B5A14AE0BCE3650CDBE2928169ECC71513068418819.png', '教授', '1', '2017-12-12 16:46:58', '', null, null, '1', '');

-- ----------------------------
-- Table structure for login_info
-- ----------------------------
DROP TABLE IF EXISTS `login_info`;
CREATE TABLE `login_info` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `schoolId` int(11) DEFAULT NULL,
  `loginName` varchar(100) DEFAULT NULL,
  `loginPwd` varchar(20) DEFAULT NULL,
  `roleCode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=363 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login_info
-- ----------------------------
INSERT INTO `login_info` VALUES ('301', '1', 'admin', '123456', 'admin');
INSERT INTO `login_info` VALUES ('302', '1', 'teacher01', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('303', '1', 'teacher02', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('304', '1', 'teacher03', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('305', '1', 'teacher04', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('306', '1', 'teacher05', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('307', '1', 'teacher06', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('308', '1', 'teacher07', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('309', '1', 'teacher08', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('310', '1', 'teacher09', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('311', '1', 'teacher10', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('312', '1', 'teacher11', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('313', '1', 'teacher12', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('314', '1', 'teacher13', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('315', '1', 'teacher14', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('316', '1', 'teacher15', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('317', '1', 'teacher16', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('318', '1', 'teacher17', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('319', '1', 'teacher18', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('320', '1', 'teacher19', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('321', '1', 'teacher20', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('322', '1', 'teacher21', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('323', '1', 'teacher22', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('324', '1', 'teacher23', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('325', '1', 'teacher24', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('326', '1', 'teacher25', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('327', '1', 'teacher26', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('328', '1', 'teacher27', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('329', '1', 'teacher28', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('330', '1', 'teacher29', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('331', '1', 'teacher30', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('332', '1', 'teacher31', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('333', '1', 'teacher32', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('334', '1', 'teacher33', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('335', '1', 'teacher34', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('336', '1', 'teacher35', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('337', '1', 'teacher36', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('338', '1', 'teacher37', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('339', '1', 'teacher38', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('340', '1', 'teacher39', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('341', '1', 'teacher40', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('342', '1', 'teacher41', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('343', '1', 'teacher42', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('344', '1', 'teacher43', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('345', '1', 'teacher44', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('346', '1', 'teacher45', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('347', '1', 'teacher46', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('348', '1', 'teacher47', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('349', '1', 'teacher48', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('350', '1', 'teacher49', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('351', '1', 'teacher50', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('352', '1', 'teacher51', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('353', '1', 'teacher52', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('354', '1', 'teacher53', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('355', '1', 'teacher54', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('356', '1', 'teacher55', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('357', '1', 'teacher56', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('358', '1', 'teacher57', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('359', '1', 'teacher58', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('360', '1', 'teacher59', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('361', '1', 'teacher60', '123456', 'teacher');
INSERT INTO `login_info` VALUES ('362', '1', '1709', '123456', 'student');

-- ----------------------------
-- Table structure for message_info
-- ----------------------------
DROP TABLE IF EXISTS `message_info`;
CREATE TABLE `message_info` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `content` text,
  `fromUserId` int(11) DEFAULT NULL,
  `toUserId` int(11) DEFAULT NULL,
  `fromDate` datetime DEFAULT NULL,
  `toDate` datetime DEFAULT NULL,
  `isDelete` int(1) DEFAULT '0',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message_info
-- ----------------------------
INSERT INTO `message_info` VALUES ('1', '2017-2018下学年德育课程将于2017年9月15日开始网上选课！', '2017-2018下学年德育课程将于2017年9月15日开始网上选课！<p>本次开放网上选课的课程分别是:</p><p>中职学校德育部颁五门课程、中职学校班主任每周一课、中职学生法治教育在线课程。</p>', '226', '287', '2017-12-18 15:54:45', null, '0');

-- ----------------------------
-- Table structure for notice_info
-- ----------------------------
DROP TABLE IF EXISTS `notice_info`;
CREATE TABLE `notice_info` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `content` text,
  `clickNum` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `isDelete` int(1) DEFAULT '0',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice_info
-- ----------------------------
INSERT INTO `notice_info` VALUES ('1', '亚卓教育中等职业教育智慧校园数字教学中心平台上线了！', '亚卓教育中等职业教育智慧校园数字教学中心平台上线了！<p>在使用过程中如果遇到问题请联系亚卓教育技术部。</p><p>电话：028-68730625转806（黄建琼）<br/></p><p>QQ：3492167574</p>', '503', '226', '2017-05-20 09:00:00', null, '0');

-- ----------------------------
-- Table structure for open_course_info
-- ----------------------------
DROP TABLE IF EXISTS `open_course_info`;
CREATE TABLE `open_course_info` (
  `open_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `courseName` varchar(100) DEFAULT NULL,
  `schoolId` int(11) DEFAULT NULL,
  `courseCode` int(3) DEFAULT NULL,
  `studyScore` float(5,2) DEFAULT NULL,
  `passScore` int(3) DEFAULT NULL,
  `videoSeePercent` int(3) DEFAULT NULL COMMENT '视频考核比率',
  `containVideo` int(2) DEFAULT '0',
  `containTask` int(2) DEFAULT '0',
  `containExamine` int(2) DEFAULT '0',
  `containDiscuss` int(2) DEFAULT '0',
  `videoPercent` int(3) DEFAULT '0',
  `taskPercent` int(3) DEFAULT '0',
  `examinPercent` int(3) DEFAULT '0',
  `discussPercent` int(3) DEFAULT '0',
  `discussCount` int(11) DEFAULT '0',
  `taskCount` int(11) DEFAULT '0',
  `videoCount` int(11) DEFAULT '0',
  `examineCount` int(11) DEFAULT '0',
  `selectStartDate` datetime DEFAULT NULL,
  `selectEndDate` datetime DEFAULT NULL,
  `studyStartDate` datetime DEFAULT NULL,
  `studyEndDate` datetime DEFAULT NULL,
  `examineStartDate` datetime DEFAULT NULL,
  `examineEndDate` datetime DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `finishDate` datetime DEFAULT NULL,
  `isAllowSelect` int(2) DEFAULT '1',
  `clickNum` int(11) DEFAULT '0',
  `sort` int(11) DEFAULT NULL,
  `state` int(2) DEFAULT '1' COMMENT '0,删除1，未结课2，结课',
  PRIMARY KEY (`open_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of open_course_info
-- ----------------------------
INSERT INTO `open_course_info` VALUES ('48', '90', '226', '《弟子规》与我', '1', null, '2.00', '60', '100', '1', null, null, null, '100', null, null, null, null, '0', '20', '0', '2017-06-01 00:00:00', '2017-12-29 16:28:20', '2017-06-03 00:00:00', '2024-06-02 00:00:00', '2018-06-02 00:00:00', '2024-06-01 00:00:00', '2017-06-02 17:02:31', '2024-06-03 00:00:00', null, '0', '7', '1');
INSERT INTO `open_course_info` VALUES ('49', '91', '226', '健康心理•阳光心态', '1', null, '2.00', '60', '100', '1', null, null, null, '100', null, null, null, null, '0', '20', '0', '2017-06-01 00:00:00', '2017-12-29 16:26:22', '2017-06-03 00:00:00', '2024-06-02 00:00:00', '2018-06-02 00:00:00', '2024-06-01 00:00:00', '2017-06-02 17:02:31', '2024-06-03 00:00:00', null, '4', '8', '1');
INSERT INTO `open_course_info` VALUES ('50', '92', '226', '安全意识与文明行为', '1', null, '2.00', '60', '100', '1', null, null, null, '100', null, null, null, null, '0', '16', '0', '2017-06-01 00:00:00', '2017-06-02 00:00:00', '2017-06-03 00:00:00', '2024-06-02 00:00:00', '2018-06-02 00:00:00', '2024-06-01 00:00:00', '2017-06-02 17:02:31', '2024-06-03 00:00:00', '0', '0', '9', '1');
INSERT INTO `open_course_info` VALUES ('51', '93', '226', '快乐学习与幸福生活', '1', null, '2.00', '60', '100', '1', null, null, null, '100', null, null, null, null, '0', '15', '0', '2017-06-01 00:00:00', '2018-01-06 16:29:59', '2017-06-03 00:00:00', '2024-06-02 00:00:00', '2018-06-02 00:00:00', '2024-06-01 00:00:00', '2017-06-02 17:02:31', '2024-06-03 00:00:00', null, '0', '10', '1');
INSERT INTO `open_course_info` VALUES ('52', '95', '226', '提升职业素养', '1', null, '2.00', '60', '100', '1', null, null, null, '100', null, null, null, null, '0', '18', '0', '2017-06-01 00:00:00', '2017-06-02 00:00:00', '2017-06-03 00:00:00', '2024-06-02 00:00:00', '2018-06-02 00:00:00', '2024-06-01 00:00:00', '2017-06-02 17:02:31', '2024-06-03 00:00:00', '0', '0', '11', '1');
INSERT INTO `open_course_info` VALUES ('53', '96', '226', '人在职场', '1', null, '2.00', '60', '100', '1', null, null, null, '100', null, null, null, null, '0', '10', '0', '2017-06-01 00:00:00', '2017-12-29 16:28:48', '2017-06-03 00:00:00', '2024-06-02 00:00:00', '2018-06-02 00:00:00', '2024-06-01 00:00:00', '2017-06-02 17:02:31', '2024-06-03 00:00:00', null, '4', '12', '1');
INSERT INTO `open_course_info` VALUES ('54', '98', '226', '中职学生法治教育在线课程资源', '0', null, '2.00', '60', '100', '1', null, null, null, '100', null, null, null, null, '0', '64', '0', '2017-06-01 00:00:00', '2017-06-02 00:00:00', '2017-06-03 00:00:00', '2024-06-02 00:00:00', '2018-06-02 00:00:00', '2024-06-01 00:00:00', '2017-06-02 17:02:31', '2024-06-03 00:00:00', '0', '0', '13', '1');
INSERT INTO `open_course_info` VALUES ('55', '100', '226', '中职学生国学经典诵读在线课程资源', '1', null, '2.00', '60', '100', '1', null, null, null, '100', null, null, null, null, '0', '104', '0', '2017-09-05 00:00:00', '2017-09-06 00:00:00', '2017-09-07 00:00:00', '2017-09-27 00:00:00', '2017-09-08 00:00:00', '2017-09-26 00:00:00', '2017-09-05 11:14:38', '2017-09-29 00:00:00', '1', '0', '7', '1');
INSERT INTO `open_course_info` VALUES ('56', '102', '226', '中等职业学校学生公约在线课程资源', '1', null, '2.00', '60', '100', '1', null, null, null, '100', null, null, null, null, '0', '0', '0', '2017-09-06 00:00:00', '2017-09-07 00:00:00', '2017-09-08 00:00:00', '2017-09-29 00:00:00', '2017-09-09 00:00:00', '2017-09-28 00:00:00', '2017-09-06 02:06:55', '2017-09-30 00:00:00', '1', '0', '8', '1');
INSERT INTO `open_course_info` VALUES ('57', '103', '226', '中职学生青春健康教育在线课程资源', '1', null, '2.00', '60', '100', '1', null, null, null, '100', null, null, null, null, '0', '64', '0', '2017-09-07 00:00:00', '2017-10-07 00:00:00', '2017-10-07 00:00:00', '2018-10-07 00:00:00', '2017-10-07 00:00:00', '2018-10-07 00:00:00', '2017-09-07 01:06:19', '2018-11-07 00:00:00', '1', '0', '9', '1');
INSERT INTO `open_course_info` VALUES ('58', '85', '226', '职业生涯规划', '1', null, '4.00', '60', '100', '1', null, null, null, '100', null, null, null, null, '0', '0', '0', '2017-09-04 00:00:00', '2017-09-06 00:00:00', '2017-09-07 00:00:00', '2021-09-15 00:00:00', '2018-09-19 00:00:00', '2019-09-12 00:00:00', '2017-09-07 11:49:57', '2022-09-07 00:00:00', '1', '0', '10', '1');
INSERT INTO `open_course_info` VALUES ('59', '86', '226', '职业道德与法律', '1', null, '4.00', '60', '100', '1', null, null, null, '100', null, null, null, null, '0', '0', '0', '2017-09-04 00:00:00', '2017-09-06 00:00:00', '2017-09-07 00:00:00', '2021-09-15 00:00:00', '2018-09-19 00:00:00', '2019-09-12 00:00:00', '2017-09-07 11:49:57', '2022-09-07 00:00:00', '1', '0', '11', '1');
INSERT INTO `open_course_info` VALUES ('60', '87', '226', '哲学与人生', '1', null, '4.00', '60', '100', '1', null, null, null, '100', null, null, null, null, '0', '61', '0', '2017-09-04 00:00:00', '2017-09-06 00:00:00', '2017-09-07 00:00:00', '2021-09-15 00:00:00', '2018-09-19 00:00:00', '2019-09-12 00:00:00', '2017-09-07 11:49:57', '2022-09-07 00:00:00', '1', '0', '12', '1');
INSERT INTO `open_course_info` VALUES ('61', '88', '226', '心理健康', '1', null, '4.00', '60', '100', '1', null, null, null, '100', null, null, null, null, '1', '60', '0', '2017-12-18 15:23:23', '2018-01-05 16:23:36', '2017-09-07 00:00:00', '2021-09-15 00:00:00', '2018-09-19 00:00:00', '2019-09-12 00:00:00', '2017-09-07 11:49:57', '2022-09-07 00:00:00', null, '11', '13', '1');
INSERT INTO `open_course_info` VALUES ('62', '89', '226', '经济政治与社会', '1', null, '4.00', '60', '100', '1', null, null, null, '100', null, null, null, null, '0', '0', '0', '2017-09-04 00:00:00', '2017-09-06 00:00:00', '2017-09-07 00:00:00', '2021-09-15 00:00:00', '2018-09-19 00:00:00', '2019-09-12 00:00:00', '2017-09-07 11:49:57', '2022-09-07 00:00:00', '1', '0', '14', '1');
INSERT INTO `open_course_info` VALUES ('63', '98', '226', '中职学生法治教育在线课程资源', '1', null, '5.00', '60', '100', '1', null, null, null, '100', null, null, null, null, '0', '0', '0', '2017-08-28 00:00:00', '2017-09-06 00:00:00', '2017-09-07 00:00:00', '2021-09-07 00:00:00', '2018-09-17 00:00:00', '2019-09-10 00:00:00', '2017-09-14 10:58:28', '2023-09-14 00:00:00', '1', '0', '15', '1');
INSERT INTO `open_course_info` VALUES ('65', '104', '226', '中职学生音乐欣赏在线课程资源', '1', null, '6.00', '60', '100', '1', null, null, null, '100', null, null, null, null, '0', '32', '0', '2017-08-27 00:00:00', '2017-08-31 00:00:00', '2017-09-06 00:00:00', '2022-09-08 00:00:00', '2017-09-15 00:00:00', '2017-10-07 00:00:00', '2017-09-14 14:37:22', '2023-09-14 00:00:00', '1', '0', '17', '1');
INSERT INTO `open_course_info` VALUES ('66', '105', '226', '中职学生品格教育在线课程资源', '1', null, '5.00', '60', '100', '1', null, null, null, '100', null, null, null, null, '0', '72', '0', '2017-08-28 00:00:00', '2017-08-30 00:00:00', '2017-08-31 00:00:00', '2021-09-22 00:00:00', '2019-09-18 00:00:00', '2020-09-24 00:00:00', '2017-09-25 16:38:43', '2022-09-25 00:00:00', '1', '0', '18', '1');
INSERT INTO `open_course_info` VALUES ('68', '106', '226', '培育和践行社会主义核心价值观', '1', null, '3.00', '60', '100', '1', null, null, null, '100', null, null, null, null, '0', '12', '0', '2017-08-28 00:00:00', '2017-09-06 00:00:00', '2017-09-20 00:00:00', '2020-10-01 00:00:00', '2017-09-22 00:00:00', '2018-09-06 00:00:00', '2017-09-28 16:32:59', '2022-10-08 00:00:00', '1', '0', '19', '1');
INSERT INTO `open_course_info` VALUES ('69', '107', '226', '共筑中国梦、实现中华民族的伟大复兴', '1', null, '3.00', null, '100', '1', null, null, null, '100', null, null, null, null, '0', '0', '0', '2017-08-29 00:00:00', '2017-09-14 00:00:00', '2017-09-21 00:00:00', '2021-09-29 00:00:00', '2019-09-18 00:00:00', '2020-09-28 00:00:00', '2017-09-28 17:09:49', '2023-09-28 00:00:00', '1', '0', '20', '1');
INSERT INTO `open_course_info` VALUES ('70', '108', '226', '中职学生美术鉴赏在线课程资源', '1', null, '2.00', '60', '100', '1', null, null, null, '100', null, null, null, null, '0', '32', '0', '2017-10-30 00:00:00', '2017-11-01 00:00:00', '2017-11-02 00:00:00', '2021-11-10 00:00:00', '2018-11-14 00:00:00', '2019-11-12 00:00:00', '2017-11-10 16:59:06', '2022-11-10 00:00:00', '1', '0', '20', '1');
INSERT INTO `open_course_info` VALUES ('71', '109', '226', '中职学生中外科技史必读在线课程资源', '1', null, '5.00', '60', '100', '1', null, null, null, '100', null, null, null, null, '0', '4', '0', '2017-12-04 00:00:00', '2017-12-11 00:00:00', '2017-12-12 00:00:00', '2022-12-20 00:00:00', '2019-12-18 00:00:00', '2020-12-15 00:00:00', '2017-12-12 16:43:02', '2023-12-12 00:00:00', '1', '0', '21', '1');

-- ----------------------------
-- Table structure for paper_answer
-- ----------------------------
DROP TABLE IF EXISTS `paper_answer`;
CREATE TABLE `paper_answer` (
  `user_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `score` float(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paper_answer
-- ----------------------------

-- ----------------------------
-- Table structure for paper_info
-- ----------------------------
DROP TABLE IF EXISTS `paper_info`;
CREATE TABLE `paper_info` (
  `paper_id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) DEFAULT NULL,
  `schoolId` int(11) DEFAULT NULL,
  `open_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `function_id` int(11) DEFAULT NULL,
  `subjectNum` int(3) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `anySubjectScore` text,
  `totalScore` float(5,2) DEFAULT NULL,
  `subjectIds` text,
  `createDate` datetime DEFAULT NULL,
  `stateDate` datetime DEFAULT NULL,
  `state` int(2) DEFAULT '1',
  `showSecond` int(11) DEFAULT NULL,
  PRIMARY KEY (`paper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paper_info
-- ----------------------------
INSERT INTO `paper_info` VALUES ('1', '580', '1', '61', '76', '3', '5', '心理健康第一课 关注心理健康.mp41', '1', '0,60,40', '100.00', '5,1,2,4,3', '2017-12-18 16:56:26', '2017-12-18 16:56:26', '1', null);
INSERT INTO `paper_info` VALUES ('2', '580', '1', '61', '76', '3', '5', '心理健康第一课 关注心理健康.mp42', '1', '0,60,40', '100.00', '2,5,1,4,3', '2017-12-18 16:56:26', '2017-12-18 16:56:26', '1', null);

-- ----------------------------
-- Table structure for paper_subject_rule
-- ----------------------------
DROP TABLE IF EXISTS `paper_subject_rule`;
CREATE TABLE `paper_subject_rule` (
  `rule_id` int(11) DEFAULT NULL,
  `paper_id` int(11) DEFAULT NULL,
  `subject_type_id` int(11) DEFAULT NULL,
  `subjectNum` int(11) DEFAULT NULL,
  `totalScore` float(5,2) DEFAULT NULL,
  `anySubjectScore` text,
  `subjectIds` text,
  `answer` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paper_subject_rule
-- ----------------------------

-- ----------------------------
-- Table structure for play_record
-- ----------------------------
DROP TABLE IF EXISTS `play_record`;
CREATE TABLE `play_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) DEFAULT NULL,
  `select_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `second` int(11) DEFAULT NULL,
  `isover` int(2) DEFAULT '0',
  `startDate` datetime DEFAULT NULL,
  `lastDate` datetime DEFAULT NULL,
  `state` int(2) DEFAULT '1',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of play_record
-- ----------------------------
INSERT INTO `play_record` VALUES ('1', '157', '49', '20', '8', '0', '2017-12-18 16:27:03', '2017-12-18 17:01:52', '1');
INSERT INTO `play_record` VALUES ('3', '581', '61', '20', '0', '0', '2017-12-18 17:20:05', '2017-12-18 17:20:05', '1');
INSERT INTO `play_record` VALUES ('4', '146', '53', '20', '23', '0', '2017-12-18 17:04:55', '2017-12-18 17:07:02', '1');

-- ----------------------------
-- Table structure for resource_type
-- ----------------------------
DROP TABLE IF EXISTS `resource_type`;
CREATE TABLE `resource_type` (
  `resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `state` int(11) DEFAULT '1' COMMENT '状态',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `info` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource_type
-- ----------------------------
INSERT INTO `resource_type` VALUES ('1', '公共资源', null, '1', '2016-11-21 17:14:48', '1233');
INSERT INTO `resource_type` VALUES ('2', '课程资源', null, '1', '2016-11-21 17:14:47', '345的的');
INSERT INTO `resource_type` VALUES ('3', '其他资源', 'OTHER', '0', '2016-11-21 17:14:44', '5645');

-- ----------------------------
-- Table structure for role_info
-- ----------------------------
DROP TABLE IF EXISTS `role_info`;
CREATE TABLE `role_info` (
  `role_id` varchar(100) NOT NULL,
  `role_name` varchar(50) DEFAULT NULL,
  `roleCode` varchar(100) DEFAULT NULL,
  `isDefault` int(1) DEFAULT '0',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_info
-- ----------------------------
INSERT INTO `role_info` VALUES ('admin', '管理员', 'admin', '0');
INSERT INTO `role_info` VALUES ('student', '学生', 'student', '0');
INSERT INTO `role_info` VALUES ('super', '超级管理员', 'super', '1');
INSERT INTO `role_info` VALUES ('teacher', '教师', 'teacher', '0');
INSERT INTO `role_info` VALUES ('testteacher', '试用老师', 'testTeacher', '0');

-- ----------------------------
-- Table structure for school_info
-- ----------------------------
DROP TABLE IF EXISTS `school_info`;
CREATE TABLE `school_info` (
  `school_id` int(11) NOT NULL AUTO_INCREMENT,
  `school_name` varchar(100) DEFAULT NULL COMMENT '学校名',
  `city_id` int(11) DEFAULT NULL,
  `info` varchar(200) DEFAULT NULL COMMENT '简介',
  `logo` varchar(200) DEFAULT NULL COMMENT '学校logo',
  `contacts` varchar(50) DEFAULT NULL COMMENT '联系人',
  `tel` varchar(12) DEFAULT NULL COMMENT '电话',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `startDate` datetime DEFAULT NULL COMMENT '开始时间',
  `finishDate` datetime DEFAULT NULL COMMENT '结束时间',
  `state` int(2) DEFAULT '1' COMMENT '1：可用，0：不可用',
  `isUsed` int(2) DEFAULT '0' COMMENT '1：启动，0：停用',
  `website` varchar(200) DEFAULT NULL COMMENT '官网地址',
  `url` varchar(100) DEFAULT NULL COMMENT '平台访问地址',
  `extranet` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of school_info
-- ----------------------------
INSERT INTO `school_info` VALUES ('1', '亚卓教育', null, '亚卓公司亚卓公司', 'logo/FE0B4BF4FCF705BE046119B6BB7A58501496732149118.png', '亚卓科技', '13548777898', '2016-12-19 17:52:52', '2017-01-29 00:00:00', '2050-02-01 00:00:00', '1', '1', 'www.yazhuojy.com', '192.168.0.254', '192.168.0.254');

-- ----------------------------
-- Table structure for student_class_rls
-- ----------------------------
DROP TABLE IF EXISTS `student_class_rls`;
CREATE TABLE `student_class_rls` (
  `student_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_class_rls
-- ----------------------------
INSERT INTO `student_class_rls` VALUES ('4', '31');
INSERT INTO `student_class_rls` VALUES ('5', '31');
INSERT INTO `student_class_rls` VALUES ('1', '31');
INSERT INTO `student_class_rls` VALUES ('6', '32');
INSERT INTO `student_class_rls` VALUES ('7', '32');
INSERT INTO `student_class_rls` VALUES ('8', '34');
INSERT INTO `student_class_rls` VALUES ('9', '32');
INSERT INTO `student_class_rls` VALUES ('10', '32');
INSERT INTO `student_class_rls` VALUES ('11', '32');
INSERT INTO `student_class_rls` VALUES ('12', '32');
INSERT INTO `student_class_rls` VALUES ('13', '33');
INSERT INTO `student_class_rls` VALUES ('14', '33');
INSERT INTO `student_class_rls` VALUES ('15', '31');
INSERT INTO `student_class_rls` VALUES ('16', '31');
INSERT INTO `student_class_rls` VALUES ('17', '31');
INSERT INTO `student_class_rls` VALUES ('18', '31');
INSERT INTO `student_class_rls` VALUES ('19', '31');
INSERT INTO `student_class_rls` VALUES ('20', '37');

-- ----------------------------
-- Table structure for student_course_rls
-- ----------------------------
DROP TABLE IF EXISTS `student_course_rls`;
CREATE TABLE `student_course_rls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `open_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `studyStatus` int(2) DEFAULT '0',
  `score` float(5,2) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `state` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_course_rls
-- ----------------------------
INSERT INTO `student_course_rls` VALUES ('6', '49', '20', '40', null, '2017-12-18 16:26:51', '1');
INSERT INTO `student_course_rls` VALUES ('7', '61', '20', '0', null, '2017-12-18 16:29:24', '1');
INSERT INTO `student_course_rls` VALUES ('8', '53', '20', '0', null, '2017-12-18 17:04:39', '1');

-- ----------------------------
-- Table structure for student_info
-- ----------------------------
DROP TABLE IF EXISTS `student_info`;
CREATE TABLE `student_info` (
  `student_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `major_id` int(11) DEFAULT NULL,
  `login_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(100) DEFAULT NULL,
  `roleCode` varchar(100) DEFAULT NULL,
  `classId` int(11) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_info
-- ----------------------------
INSERT INTO `student_info` VALUES ('20', '287', null, '362', '亚卓教育', '1709', 'student', '37');

-- ----------------------------
-- Table structure for student_paper_info
-- ----------------------------
DROP TABLE IF EXISTS `student_paper_info`;
CREATE TABLE `student_paper_info` (
  `student_paper_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `paperId` int(11) DEFAULT NULL,
  `schoolId` int(11) DEFAULT NULL,
  `openCourseId` int(11) DEFAULT NULL,
  `videoId` int(11) DEFAULT NULL,
  `isExam` int(1) DEFAULT '0',
  `isSubmit` int(1) DEFAULT '0',
  `isMarking` int(1) DEFAULT '0',
  `markingType` int(1) DEFAULT '1',
  `score` float(5,2) DEFAULT '0.00',
  `createDate` datetime DEFAULT NULL,
  `submitDate` datetime DEFAULT NULL,
  PRIMARY KEY (`student_paper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_paper_info
-- ----------------------------
INSERT INTO `student_paper_info` VALUES ('1', '1', '20', '1', '1', '61', '580', '0', '1', '0', '1', '100.00', '2017-12-18 17:19:54', '2017-12-18 17:20:40');

-- ----------------------------
-- Table structure for student_subject_info
-- ----------------------------
DROP TABLE IF EXISTS `student_subject_info`;
CREATE TABLE `student_subject_info` (
  `student_subject_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subject_type_id` int(11) DEFAULT NULL,
  `student_paper_id` int(11) DEFAULT NULL,
  `subjectNum` int(11) DEFAULT NULL,
  `totalScore` float(5,2) DEFAULT NULL,
  `anySubjectScore` text,
  `subjectIds` text,
  `trueAnswers` text,
  `stuAnswers` text,
  `stuScore` float(5,2) DEFAULT NULL,
  PRIMARY KEY (`student_subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_subject_info
-- ----------------------------
INSERT INTO `student_subject_info` VALUES ('1', '2', '1', '3', '60.00', '20.0,20.0,20.0', '1,2,5', 'B,B,B', 'B,B,B', '60.00');
INSERT INTO `student_subject_info` VALUES ('2', '3', '1', '2', '40.00', '20.0,20.0', '3,4', 'ABCD,ABCD', 'ABCD,ABCD', '40.00');

-- ----------------------------
-- Table structure for study_course_info
-- ----------------------------
DROP TABLE IF EXISTS `study_course_info`;
CREATE TABLE `study_course_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生选课的id',
  `studentCourseId` int(11) DEFAULT NULL,
  `videoCount` int(11) DEFAULT '0',
  `videoGrade` float(5,2) DEFAULT '0.00',
  `taskCount` int(11) DEFAULT '0',
  `taskGrade` float(5,2) DEFAULT '0.00',
  `examineCount` int(11) DEFAULT '0',
  `examineGrade` float(5,2) DEFAULT '0.00',
  `discussCount` int(11) DEFAULT '0',
  `discussGrade` float(5,2) DEFAULT '0.00',
  `finalGrade` float(5,2) DEFAULT '0.00',
  `createDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `state` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of study_course_info
-- ----------------------------
INSERT INTO `study_course_info` VALUES ('1', '6', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0.00', '2017-12-18 16:26:52', null, '1');
INSERT INTO `study_course_info` VALUES ('2', '7', '1', '1.67', '1', '0.00', '0', '0.00', '2', '0.00', '0.00', '2017-12-18 16:29:25', null, '1');
INSERT INTO `study_course_info` VALUES ('3', '8', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0.00', '2017-12-18 17:04:40', null, '1');

-- ----------------------------
-- Table structure for subject_info
-- ----------------------------
DROP TABLE IF EXISTS `subject_info`;
CREATE TABLE `subject_info` (
  `course_id` int(11) DEFAULT NULL,
  `subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `subject_type_id` int(11) DEFAULT NULL,
  `optionsA` varchar(1000) DEFAULT NULL,
  `optionsB` varchar(1000) DEFAULT NULL,
  `optionsC` varchar(1000) DEFAULT NULL,
  `optionsD` varchar(1000) DEFAULT NULL,
  `true_option` varchar(200) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
  `function_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `stateDate` datetime DEFAULT NULL,
  `state` int(2) DEFAULT '1',
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subject_info
-- ----------------------------
INSERT INTO `subject_info` VALUES ('88', '1', '坚强的、成功的人不容易患心理疾病', '2', null, null, null, null, 'B', '1', '580', '3', '226', '2017-12-18 16:10:55', '2017-12-18 16:10:55', '1');
INSERT INTO `subject_info` VALUES ('88', '2', '身体不健康不会引发心理不健康', '2', null, null, null, null, 'B', '1', '580', '3', '226', '2017-12-18 16:11:34', '2017-12-18 16:11:34', '1');
INSERT INTO `subject_info` VALUES ('88', '3', '下列符合心理健康的特点的是', '3', '相对性', '连续性', '动态性', '可逆性', 'ABCD', '1', '580', '3', '226', '2017-12-18 16:14:35', '2017-12-18 16:14:35', '1');
INSERT INTO `subject_info` VALUES ('88', '4', '世界卫生组织对于健康的概念包括', '3', '生理健康', '心理健康', '社会适应良好', '道德健康', 'ABCD', '1', '580', '3', '226', '2017-12-18 16:16:12', '2017-12-18 16:16:12', '1');
INSERT INTO `subject_info` VALUES ('88', '5', '趁着年轻就该拼命挣钱，不用顾忌健康问题。', '2', null, null, null, null, 'B', '1', '580', '3', '226', '2017-12-18 16:16:34', '2017-12-18 16:16:34', '1');
INSERT INTO `subject_info` VALUES ('88', '6', '只有少数人才会出现心理问题', '2', null, null, null, null, 'B', '1', '679', '3', '226', '2017-12-18 16:17:43', '2017-12-18 16:17:43', '1');
INSERT INTO `subject_info` VALUES ('88', '7', '一个人出现心理问题就意味着心理不正常', '2', null, null, null, null, 'B', '1', '679', '3', '226', '2017-12-18 16:18:24', '2017-12-18 16:18:24', '1');
INSERT INTO `subject_info` VALUES ('88', '8', '学生很单纯，不会出现心理问题。', '2', null, null, null, null, 'B', '1', '679', '3', '226', '2017-12-18 16:20:54', '2017-12-18 16:20:54', '1');
INSERT INTO `subject_info` VALUES ('88', '9', '当一个人出现心理问题时，常常会表现出一系列的情绪反应、生理反应和行为反应。', '2', null, null, null, null, 'A', '1', '679', '3', '226', '2017-12-18 16:21:12', '2017-12-18 16:21:12', '1');
INSERT INTO `subject_info` VALUES ('88', '10', '学生只会出现一般心理问题，不会出现严重心理问题，更不可能患精神疾病。', '2', null, null, null, null, 'B', '1', '679', '3', '226', '2017-12-18 16:21:36', '2017-12-18 16:21:36', '1');
INSERT INTO `subject_info` VALUES ('88', '11', '只有有心理疾病的人才需要做咨询。', '2', null, null, null, null, 'B', '1', '683', '3', '226', '2017-12-18 16:22:02', '2017-12-18 16:22:02', '1');
INSERT INTO `subject_info` VALUES ('88', '12', '心理咨询的效果特别好，做一次就够了。', '2', null, null, null, null, 'B', '1', '683', '3', '226', '2017-12-18 16:22:24', '2017-12-18 16:22:24', '1');
INSERT INTO `subject_info` VALUES ('88', '13', '只有经历了失败才能走向成功', '2', null, null, null, null, 'B', '1', '686', '3', '226', '2017-12-18 16:49:38', '2017-12-18 16:49:38', '1');

-- ----------------------------
-- Table structure for subject_type
-- ----------------------------
DROP TABLE IF EXISTS `subject_type`;
CREATE TABLE `subject_type` (
  `subject_type_id` int(11) NOT NULL,
  `type_name` varchar(100) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `stateDate` datetime DEFAULT NULL,
  `state` int(2) DEFAULT '1',
  PRIMARY KEY (`subject_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1:单选，2:判断，3:多选';

-- ----------------------------
-- Records of subject_type
-- ----------------------------
INSERT INTO `subject_type` VALUES ('1', '单选题', '2016-11-04 15:42:16', '2016-11-04 15:42:18', '1');
INSERT INTO `subject_type` VALUES ('2', '判断题', '2016-11-04 15:43:02', '2016-11-04 15:43:05', '1');
INSERT INTO `subject_type` VALUES ('3', '多选题', '2016-11-04 15:43:26', '2016-11-04 15:43:29', '1');
INSERT INTO `subject_type` VALUES ('4', '主观题', '2016-11-04 15:43:49', '2016-11-04 15:43:53', '1');

-- ----------------------------
-- Table structure for teacher_class_rls
-- ----------------------------
DROP TABLE IF EXISTS `teacher_class_rls`;
CREATE TABLE `teacher_class_rls` (
  `class_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher_class_rls
-- ----------------------------

-- ----------------------------
-- Table structure for teacher_info
-- ----------------------------
DROP TABLE IF EXISTS `teacher_info`;
CREATE TABLE `teacher_info` (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `login_id` int(11) DEFAULT NULL,
  `number` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `roleCode` varchar(100) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher_info
-- ----------------------------
INSERT INTO `teacher_info` VALUES ('76', '226', '301', 'admin', '管理员', 'admin', '技术部', '技术部');
INSERT INTO `teacher_info` VALUES ('77', '227', '302', 'teacher01', '教师01', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('78', '228', '303', 'teacher02', '教师02', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('79', '229', '304', 'teacher03', '教师03', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('80', '230', '305', 'teacher04', '教师04', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('81', '231', '306', 'teacher05', '教师05', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('82', '232', '307', 'teacher06', '教师06', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('83', '233', '308', 'teacher07', '教师07', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('84', '234', '309', 'teacher08', '教师08', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('85', '235', '310', 'teacher09', '教师09', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('86', '236', '311', 'teacher10', '教师10', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('87', '237', '312', 'teacher11', '教师11', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('88', '238', '313', 'teacher12', '教师12', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('89', '239', '314', 'teacher13', '教师13', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('90', '240', '315', 'teacher14', '教师14', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('91', '241', '316', 'teacher15', '教师15', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('92', '242', '317', 'teacher16', '教师16', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('93', '243', '318', 'teacher17', '教师17', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('94', '244', '319', 'teacher18', '教师18', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('95', '245', '320', 'teacher19', '教师19', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('96', '246', '321', 'teacher20', '教师20', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('97', '247', '322', 'teacher21', '教师21', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('98', '248', '323', 'teacher22', '教师22', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('99', '249', '324', 'teacher23', '教师23', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('100', '250', '325', 'teacher24', '教师24', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('101', '251', '326', 'teacher25', '教师25', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('102', '252', '327', 'teacher26', '教师26', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('103', '253', '328', 'teacher27', '教师27', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('104', '254', '329', 'teacher28', '教师28', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('105', '255', '330', 'teacher29', '教师29', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('106', '256', '331', 'teacher30', '教师30', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('107', '257', '332', 'teacher31', '教师31', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('108', '258', '333', 'teacher32', '教师32', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('109', '259', '334', 'teacher33', '教师33', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('110', '260', '335', 'teacher34', '教师34', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('111', '261', '336', 'teacher35', '教师35', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('112', '262', '337', 'teacher36', '教师36', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('113', '263', '338', 'teacher37', '教师37', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('114', '264', '339', 'teacher38', '教师38', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('115', '265', '340', 'teacher39', '教师39', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('116', '266', '341', 'teacher40', '教师40', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('117', '267', '342', 'teacher41', '教师41', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('118', '268', '343', 'teacher42', '教师42', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('119', '269', '344', 'teacher43', '教师43', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('120', '270', '345', 'teacher44', '教师44', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('121', '271', '346', 'teacher45', '教师45', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('122', '272', '347', 'teacher46', '教师46', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('123', '273', '348', 'teacher47', '教师47', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('124', '274', '349', 'teacher48', '教师48', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('125', '275', '350', 'teacher49', '教师49', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('126', '276', '351', 'teacher50', '教师50', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('127', '277', '352', 'teacher51', '教师51', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('128', '278', '353', 'teacher52', '教师52', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('129', '279', '354', 'teacher53', '教师53', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('130', '280', '355', 'teacher54', '教师54', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('131', '281', '356', 'teacher55', '教师55', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('132', '282', '357', 'teacher56', '教师56', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('133', '283', '358', 'teacher57', '教师57', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('134', '284', '359', 'teacher58', '教师58', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('135', '285', '360', 'teacher59', '教师59', 'teacher', null, null);
INSERT INTO `teacher_info` VALUES ('136', '286', '361', 'teacher60', '教师60', 'teacher', null, null);

-- ----------------------------
-- Table structure for token_info
-- ----------------------------
DROP TABLE IF EXISTS `token_info`;
CREATE TABLE `token_info` (
  `token_id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`token_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2597 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of token_info
-- ----------------------------
INSERT INTO `token_info` VALUES ('2001', null, null);
INSERT INTO `token_info` VALUES ('2002', null, null);
INSERT INTO `token_info` VALUES ('2003', null, null);
INSERT INTO `token_info` VALUES ('2004', null, null);
INSERT INTO `token_info` VALUES ('2005', null, null);
INSERT INTO `token_info` VALUES ('2006', null, null);
INSERT INTO `token_info` VALUES ('2007', null, null);
INSERT INTO `token_info` VALUES ('2008', null, null);
INSERT INTO `token_info` VALUES ('2009', null, null);
INSERT INTO `token_info` VALUES ('2010', null, null);
INSERT INTO `token_info` VALUES ('2011', null, null);
INSERT INTO `token_info` VALUES ('2012', null, null);
INSERT INTO `token_info` VALUES ('2013', null, null);
INSERT INTO `token_info` VALUES ('2014', null, null);
INSERT INTO `token_info` VALUES ('2015', null, null);
INSERT INTO `token_info` VALUES ('2016', null, null);
INSERT INTO `token_info` VALUES ('2017', null, null);
INSERT INTO `token_info` VALUES ('2018', null, null);
INSERT INTO `token_info` VALUES ('2019', null, null);
INSERT INTO `token_info` VALUES ('2020', null, null);
INSERT INTO `token_info` VALUES ('2021', null, null);
INSERT INTO `token_info` VALUES ('2022', null, null);
INSERT INTO `token_info` VALUES ('2023', null, null);
INSERT INTO `token_info` VALUES ('2024', null, null);
INSERT INTO `token_info` VALUES ('2025', null, null);
INSERT INTO `token_info` VALUES ('2026', null, null);
INSERT INTO `token_info` VALUES ('2027', null, null);
INSERT INTO `token_info` VALUES ('2028', null, null);
INSERT INTO `token_info` VALUES ('2029', null, null);
INSERT INTO `token_info` VALUES ('2030', null, null);
INSERT INTO `token_info` VALUES ('2031', null, null);
INSERT INTO `token_info` VALUES ('2032', null, null);
INSERT INTO `token_info` VALUES ('2033', null, null);
INSERT INTO `token_info` VALUES ('2034', null, null);
INSERT INTO `token_info` VALUES ('2035', null, null);
INSERT INTO `token_info` VALUES ('2036', null, null);
INSERT INTO `token_info` VALUES ('2037', null, null);
INSERT INTO `token_info` VALUES ('2038', null, null);
INSERT INTO `token_info` VALUES ('2039', null, null);
INSERT INTO `token_info` VALUES ('2040', null, null);
INSERT INTO `token_info` VALUES ('2041', null, null);
INSERT INTO `token_info` VALUES ('2042', null, null);
INSERT INTO `token_info` VALUES ('2043', null, null);
INSERT INTO `token_info` VALUES ('2044', null, null);
INSERT INTO `token_info` VALUES ('2045', null, null);
INSERT INTO `token_info` VALUES ('2046', null, null);
INSERT INTO `token_info` VALUES ('2047', null, null);
INSERT INTO `token_info` VALUES ('2048', null, null);
INSERT INTO `token_info` VALUES ('2049', null, null);
INSERT INTO `token_info` VALUES ('2050', null, null);
INSERT INTO `token_info` VALUES ('2051', null, null);
INSERT INTO `token_info` VALUES ('2052', null, null);
INSERT INTO `token_info` VALUES ('2053', null, null);
INSERT INTO `token_info` VALUES ('2054', null, null);
INSERT INTO `token_info` VALUES ('2055', null, null);
INSERT INTO `token_info` VALUES ('2056', null, null);
INSERT INTO `token_info` VALUES ('2057', null, null);
INSERT INTO `token_info` VALUES ('2058', null, null);
INSERT INTO `token_info` VALUES ('2059', null, null);
INSERT INTO `token_info` VALUES ('2060', null, null);
INSERT INTO `token_info` VALUES ('2061', null, null);
INSERT INTO `token_info` VALUES ('2062', null, null);
INSERT INTO `token_info` VALUES ('2063', null, null);
INSERT INTO `token_info` VALUES ('2064', null, null);
INSERT INTO `token_info` VALUES ('2065', null, null);
INSERT INTO `token_info` VALUES ('2066', null, null);
INSERT INTO `token_info` VALUES ('2067', null, null);
INSERT INTO `token_info` VALUES ('2068', null, null);
INSERT INTO `token_info` VALUES ('2069', null, null);
INSERT INTO `token_info` VALUES ('2070', null, null);
INSERT INTO `token_info` VALUES ('2071', null, null);
INSERT INTO `token_info` VALUES ('2072', null, null);
INSERT INTO `token_info` VALUES ('2073', null, null);
INSERT INTO `token_info` VALUES ('2074', null, null);
INSERT INTO `token_info` VALUES ('2075', null, null);
INSERT INTO `token_info` VALUES ('2076', null, null);
INSERT INTO `token_info` VALUES ('2077', null, null);
INSERT INTO `token_info` VALUES ('2078', null, null);
INSERT INTO `token_info` VALUES ('2079', null, null);
INSERT INTO `token_info` VALUES ('2080', null, null);
INSERT INTO `token_info` VALUES ('2081', null, null);
INSERT INTO `token_info` VALUES ('2082', null, null);
INSERT INTO `token_info` VALUES ('2083', null, null);
INSERT INTO `token_info` VALUES ('2084', null, null);
INSERT INTO `token_info` VALUES ('2085', null, null);
INSERT INTO `token_info` VALUES ('2086', null, null);
INSERT INTO `token_info` VALUES ('2087', null, null);
INSERT INTO `token_info` VALUES ('2088', null, null);
INSERT INTO `token_info` VALUES ('2089', null, null);
INSERT INTO `token_info` VALUES ('2090', null, null);
INSERT INTO `token_info` VALUES ('2091', null, null);
INSERT INTO `token_info` VALUES ('2092', null, null);
INSERT INTO `token_info` VALUES ('2093', null, null);
INSERT INTO `token_info` VALUES ('2094', null, null);
INSERT INTO `token_info` VALUES ('2095', null, null);
INSERT INTO `token_info` VALUES ('2096', null, null);
INSERT INTO `token_info` VALUES ('2097', null, null);
INSERT INTO `token_info` VALUES ('2098', null, null);
INSERT INTO `token_info` VALUES ('2099', null, null);
INSERT INTO `token_info` VALUES ('2100', null, null);
INSERT INTO `token_info` VALUES ('2101', null, null);
INSERT INTO `token_info` VALUES ('2102', null, null);
INSERT INTO `token_info` VALUES ('2103', null, null);
INSERT INTO `token_info` VALUES ('2104', null, null);
INSERT INTO `token_info` VALUES ('2105', null, null);
INSERT INTO `token_info` VALUES ('2106', null, null);
INSERT INTO `token_info` VALUES ('2107', null, null);
INSERT INTO `token_info` VALUES ('2108', null, null);
INSERT INTO `token_info` VALUES ('2109', null, null);
INSERT INTO `token_info` VALUES ('2110', null, null);
INSERT INTO `token_info` VALUES ('2111', null, null);
INSERT INTO `token_info` VALUES ('2112', null, null);
INSERT INTO `token_info` VALUES ('2113', null, null);
INSERT INTO `token_info` VALUES ('2114', null, null);
INSERT INTO `token_info` VALUES ('2115', null, null);
INSERT INTO `token_info` VALUES ('2116', null, null);
INSERT INTO `token_info` VALUES ('2117', null, null);
INSERT INTO `token_info` VALUES ('2118', null, null);
INSERT INTO `token_info` VALUES ('2119', null, null);
INSERT INTO `token_info` VALUES ('2120', null, null);
INSERT INTO `token_info` VALUES ('2121', null, null);
INSERT INTO `token_info` VALUES ('2122', null, null);
INSERT INTO `token_info` VALUES ('2123', null, null);
INSERT INTO `token_info` VALUES ('2124', null, null);
INSERT INTO `token_info` VALUES ('2125', null, null);
INSERT INTO `token_info` VALUES ('2126', null, null);
INSERT INTO `token_info` VALUES ('2127', null, null);
INSERT INTO `token_info` VALUES ('2128', null, null);
INSERT INTO `token_info` VALUES ('2129', null, null);
INSERT INTO `token_info` VALUES ('2130', null, null);
INSERT INTO `token_info` VALUES ('2131', null, null);
INSERT INTO `token_info` VALUES ('2132', null, null);
INSERT INTO `token_info` VALUES ('2133', null, null);
INSERT INTO `token_info` VALUES ('2134', null, null);
INSERT INTO `token_info` VALUES ('2135', null, null);
INSERT INTO `token_info` VALUES ('2136', null, null);
INSERT INTO `token_info` VALUES ('2137', null, null);
INSERT INTO `token_info` VALUES ('2138', null, null);
INSERT INTO `token_info` VALUES ('2139', null, null);
INSERT INTO `token_info` VALUES ('2140', null, null);
INSERT INTO `token_info` VALUES ('2141', null, null);
INSERT INTO `token_info` VALUES ('2142', null, null);
INSERT INTO `token_info` VALUES ('2143', null, null);
INSERT INTO `token_info` VALUES ('2144', null, null);
INSERT INTO `token_info` VALUES ('2145', null, null);
INSERT INTO `token_info` VALUES ('2146', null, null);
INSERT INTO `token_info` VALUES ('2147', null, null);
INSERT INTO `token_info` VALUES ('2148', null, null);
INSERT INTO `token_info` VALUES ('2149', null, null);
INSERT INTO `token_info` VALUES ('2150', null, null);
INSERT INTO `token_info` VALUES ('2151', null, null);
INSERT INTO `token_info` VALUES ('2152', null, null);
INSERT INTO `token_info` VALUES ('2153', null, null);
INSERT INTO `token_info` VALUES ('2154', null, null);
INSERT INTO `token_info` VALUES ('2155', null, null);
INSERT INTO `token_info` VALUES ('2156', null, null);
INSERT INTO `token_info` VALUES ('2157', null, null);
INSERT INTO `token_info` VALUES ('2158', null, null);
INSERT INTO `token_info` VALUES ('2159', null, null);
INSERT INTO `token_info` VALUES ('2160', null, null);
INSERT INTO `token_info` VALUES ('2161', null, null);
INSERT INTO `token_info` VALUES ('2162', null, null);
INSERT INTO `token_info` VALUES ('2163', null, null);
INSERT INTO `token_info` VALUES ('2164', null, null);
INSERT INTO `token_info` VALUES ('2165', null, null);
INSERT INTO `token_info` VALUES ('2166', null, null);
INSERT INTO `token_info` VALUES ('2167', null, null);
INSERT INTO `token_info` VALUES ('2168', null, null);
INSERT INTO `token_info` VALUES ('2169', null, null);
INSERT INTO `token_info` VALUES ('2170', null, null);
INSERT INTO `token_info` VALUES ('2171', null, null);
INSERT INTO `token_info` VALUES ('2172', null, null);
INSERT INTO `token_info` VALUES ('2173', null, null);
INSERT INTO `token_info` VALUES ('2174', null, null);
INSERT INTO `token_info` VALUES ('2175', null, null);
INSERT INTO `token_info` VALUES ('2176', null, null);
INSERT INTO `token_info` VALUES ('2177', null, null);
INSERT INTO `token_info` VALUES ('2178', null, null);
INSERT INTO `token_info` VALUES ('2179', null, null);
INSERT INTO `token_info` VALUES ('2180', null, null);
INSERT INTO `token_info` VALUES ('2181', null, null);
INSERT INTO `token_info` VALUES ('2182', null, null);
INSERT INTO `token_info` VALUES ('2183', null, null);
INSERT INTO `token_info` VALUES ('2184', null, null);
INSERT INTO `token_info` VALUES ('2185', null, null);
INSERT INTO `token_info` VALUES ('2186', null, null);
INSERT INTO `token_info` VALUES ('2187', null, null);
INSERT INTO `token_info` VALUES ('2188', null, null);
INSERT INTO `token_info` VALUES ('2189', null, null);
INSERT INTO `token_info` VALUES ('2190', null, null);
INSERT INTO `token_info` VALUES ('2191', null, null);
INSERT INTO `token_info` VALUES ('2192', null, null);
INSERT INTO `token_info` VALUES ('2193', null, null);
INSERT INTO `token_info` VALUES ('2194', null, null);
INSERT INTO `token_info` VALUES ('2195', null, null);
INSERT INTO `token_info` VALUES ('2196', null, null);
INSERT INTO `token_info` VALUES ('2197', null, null);
INSERT INTO `token_info` VALUES ('2198', null, null);
INSERT INTO `token_info` VALUES ('2199', null, null);
INSERT INTO `token_info` VALUES ('2200', null, null);
INSERT INTO `token_info` VALUES ('2201', null, null);
INSERT INTO `token_info` VALUES ('2202', null, null);
INSERT INTO `token_info` VALUES ('2203', null, null);
INSERT INTO `token_info` VALUES ('2204', null, null);
INSERT INTO `token_info` VALUES ('2205', null, null);
INSERT INTO `token_info` VALUES ('2206', null, null);
INSERT INTO `token_info` VALUES ('2207', null, null);
INSERT INTO `token_info` VALUES ('2208', null, null);
INSERT INTO `token_info` VALUES ('2209', null, null);
INSERT INTO `token_info` VALUES ('2210', null, null);
INSERT INTO `token_info` VALUES ('2211', null, null);
INSERT INTO `token_info` VALUES ('2212', null, null);
INSERT INTO `token_info` VALUES ('2213', null, null);
INSERT INTO `token_info` VALUES ('2214', null, null);
INSERT INTO `token_info` VALUES ('2215', null, null);
INSERT INTO `token_info` VALUES ('2216', null, null);
INSERT INTO `token_info` VALUES ('2217', null, null);
INSERT INTO `token_info` VALUES ('2218', null, null);
INSERT INTO `token_info` VALUES ('2219', null, null);
INSERT INTO `token_info` VALUES ('2220', null, null);
INSERT INTO `token_info` VALUES ('2221', null, null);
INSERT INTO `token_info` VALUES ('2222', null, null);
INSERT INTO `token_info` VALUES ('2223', null, null);
INSERT INTO `token_info` VALUES ('2224', null, null);
INSERT INTO `token_info` VALUES ('2225', null, null);
INSERT INTO `token_info` VALUES ('2226', null, null);
INSERT INTO `token_info` VALUES ('2227', null, null);
INSERT INTO `token_info` VALUES ('2228', null, null);
INSERT INTO `token_info` VALUES ('2229', null, null);
INSERT INTO `token_info` VALUES ('2230', null, null);
INSERT INTO `token_info` VALUES ('2231', null, null);
INSERT INTO `token_info` VALUES ('2232', null, null);
INSERT INTO `token_info` VALUES ('2233', null, null);
INSERT INTO `token_info` VALUES ('2234', null, null);
INSERT INTO `token_info` VALUES ('2235', null, null);
INSERT INTO `token_info` VALUES ('2236', null, null);
INSERT INTO `token_info` VALUES ('2237', null, null);
INSERT INTO `token_info` VALUES ('2238', null, null);
INSERT INTO `token_info` VALUES ('2239', null, null);
INSERT INTO `token_info` VALUES ('2240', null, null);
INSERT INTO `token_info` VALUES ('2241', null, null);
INSERT INTO `token_info` VALUES ('2242', null, null);
INSERT INTO `token_info` VALUES ('2243', null, null);
INSERT INTO `token_info` VALUES ('2244', null, null);
INSERT INTO `token_info` VALUES ('2245', null, null);
INSERT INTO `token_info` VALUES ('2246', null, null);
INSERT INTO `token_info` VALUES ('2247', null, null);
INSERT INTO `token_info` VALUES ('2248', null, null);
INSERT INTO `token_info` VALUES ('2249', null, null);
INSERT INTO `token_info` VALUES ('2250', null, null);
INSERT INTO `token_info` VALUES ('2251', null, null);
INSERT INTO `token_info` VALUES ('2252', null, null);
INSERT INTO `token_info` VALUES ('2253', null, null);
INSERT INTO `token_info` VALUES ('2254', null, null);
INSERT INTO `token_info` VALUES ('2255', null, null);
INSERT INTO `token_info` VALUES ('2256', null, null);
INSERT INTO `token_info` VALUES ('2257', null, null);
INSERT INTO `token_info` VALUES ('2258', null, null);
INSERT INTO `token_info` VALUES ('2259', null, null);
INSERT INTO `token_info` VALUES ('2260', null, null);
INSERT INTO `token_info` VALUES ('2261', null, null);
INSERT INTO `token_info` VALUES ('2262', null, null);
INSERT INTO `token_info` VALUES ('2263', null, null);
INSERT INTO `token_info` VALUES ('2264', null, null);
INSERT INTO `token_info` VALUES ('2265', null, null);
INSERT INTO `token_info` VALUES ('2266', null, null);
INSERT INTO `token_info` VALUES ('2267', null, null);
INSERT INTO `token_info` VALUES ('2268', null, null);
INSERT INTO `token_info` VALUES ('2269', null, null);
INSERT INTO `token_info` VALUES ('2270', null, null);
INSERT INTO `token_info` VALUES ('2271', null, null);
INSERT INTO `token_info` VALUES ('2272', null, null);
INSERT INTO `token_info` VALUES ('2273', null, null);
INSERT INTO `token_info` VALUES ('2274', null, null);
INSERT INTO `token_info` VALUES ('2275', null, null);
INSERT INTO `token_info` VALUES ('2276', null, null);
INSERT INTO `token_info` VALUES ('2277', null, null);
INSERT INTO `token_info` VALUES ('2278', null, null);
INSERT INTO `token_info` VALUES ('2279', null, null);
INSERT INTO `token_info` VALUES ('2280', null, null);
INSERT INTO `token_info` VALUES ('2281', null, null);
INSERT INTO `token_info` VALUES ('2282', null, null);
INSERT INTO `token_info` VALUES ('2283', null, null);
INSERT INTO `token_info` VALUES ('2284', null, null);
INSERT INTO `token_info` VALUES ('2285', null, null);
INSERT INTO `token_info` VALUES ('2286', null, null);
INSERT INTO `token_info` VALUES ('2287', null, null);
INSERT INTO `token_info` VALUES ('2288', null, null);
INSERT INTO `token_info` VALUES ('2289', null, null);
INSERT INTO `token_info` VALUES ('2290', null, null);
INSERT INTO `token_info` VALUES ('2291', null, null);
INSERT INTO `token_info` VALUES ('2292', null, null);
INSERT INTO `token_info` VALUES ('2293', null, null);
INSERT INTO `token_info` VALUES ('2294', null, null);
INSERT INTO `token_info` VALUES ('2295', null, null);
INSERT INTO `token_info` VALUES ('2296', null, null);
INSERT INTO `token_info` VALUES ('2297', null, null);
INSERT INTO `token_info` VALUES ('2298', null, null);
INSERT INTO `token_info` VALUES ('2299', null, null);
INSERT INTO `token_info` VALUES ('2300', null, null);
INSERT INTO `token_info` VALUES ('2301', null, null);
INSERT INTO `token_info` VALUES ('2302', null, null);
INSERT INTO `token_info` VALUES ('2303', null, null);
INSERT INTO `token_info` VALUES ('2304', null, null);
INSERT INTO `token_info` VALUES ('2305', null, null);
INSERT INTO `token_info` VALUES ('2306', null, null);
INSERT INTO `token_info` VALUES ('2307', null, null);
INSERT INTO `token_info` VALUES ('2308', null, null);
INSERT INTO `token_info` VALUES ('2309', null, null);
INSERT INTO `token_info` VALUES ('2310', null, null);
INSERT INTO `token_info` VALUES ('2311', null, null);
INSERT INTO `token_info` VALUES ('2312', null, null);
INSERT INTO `token_info` VALUES ('2313', null, null);
INSERT INTO `token_info` VALUES ('2314', null, null);
INSERT INTO `token_info` VALUES ('2315', null, null);
INSERT INTO `token_info` VALUES ('2316', null, null);
INSERT INTO `token_info` VALUES ('2317', null, null);
INSERT INTO `token_info` VALUES ('2318', null, null);
INSERT INTO `token_info` VALUES ('2319', null, null);
INSERT INTO `token_info` VALUES ('2320', null, null);
INSERT INTO `token_info` VALUES ('2321', null, null);
INSERT INTO `token_info` VALUES ('2322', null, null);
INSERT INTO `token_info` VALUES ('2323', null, null);
INSERT INTO `token_info` VALUES ('2324', null, null);
INSERT INTO `token_info` VALUES ('2325', null, null);
INSERT INTO `token_info` VALUES ('2326', null, null);
INSERT INTO `token_info` VALUES ('2327', null, null);
INSERT INTO `token_info` VALUES ('2328', null, null);
INSERT INTO `token_info` VALUES ('2329', null, null);
INSERT INTO `token_info` VALUES ('2330', null, null);
INSERT INTO `token_info` VALUES ('2331', null, null);
INSERT INTO `token_info` VALUES ('2332', null, null);
INSERT INTO `token_info` VALUES ('2333', null, null);
INSERT INTO `token_info` VALUES ('2334', null, null);
INSERT INTO `token_info` VALUES ('2335', null, null);
INSERT INTO `token_info` VALUES ('2336', null, null);
INSERT INTO `token_info` VALUES ('2337', null, null);
INSERT INTO `token_info` VALUES ('2338', null, null);
INSERT INTO `token_info` VALUES ('2339', null, null);
INSERT INTO `token_info` VALUES ('2340', null, null);
INSERT INTO `token_info` VALUES ('2341', null, null);
INSERT INTO `token_info` VALUES ('2342', null, null);
INSERT INTO `token_info` VALUES ('2343', null, null);
INSERT INTO `token_info` VALUES ('2344', null, null);
INSERT INTO `token_info` VALUES ('2345', null, null);
INSERT INTO `token_info` VALUES ('2346', null, null);
INSERT INTO `token_info` VALUES ('2347', null, null);
INSERT INTO `token_info` VALUES ('2348', null, null);
INSERT INTO `token_info` VALUES ('2349', null, null);
INSERT INTO `token_info` VALUES ('2350', null, null);
INSERT INTO `token_info` VALUES ('2351', null, null);
INSERT INTO `token_info` VALUES ('2352', null, null);
INSERT INTO `token_info` VALUES ('2353', null, null);
INSERT INTO `token_info` VALUES ('2354', null, null);
INSERT INTO `token_info` VALUES ('2355', null, null);
INSERT INTO `token_info` VALUES ('2356', null, null);
INSERT INTO `token_info` VALUES ('2357', null, null);
INSERT INTO `token_info` VALUES ('2358', null, null);
INSERT INTO `token_info` VALUES ('2359', null, null);
INSERT INTO `token_info` VALUES ('2360', null, null);
INSERT INTO `token_info` VALUES ('2361', null, null);
INSERT INTO `token_info` VALUES ('2362', null, null);
INSERT INTO `token_info` VALUES ('2363', null, null);
INSERT INTO `token_info` VALUES ('2364', null, null);
INSERT INTO `token_info` VALUES ('2365', null, null);
INSERT INTO `token_info` VALUES ('2366', null, null);
INSERT INTO `token_info` VALUES ('2367', null, null);
INSERT INTO `token_info` VALUES ('2368', null, null);
INSERT INTO `token_info` VALUES ('2369', null, null);
INSERT INTO `token_info` VALUES ('2370', null, null);
INSERT INTO `token_info` VALUES ('2371', null, null);
INSERT INTO `token_info` VALUES ('2372', null, null);
INSERT INTO `token_info` VALUES ('2373', null, null);
INSERT INTO `token_info` VALUES ('2374', null, null);
INSERT INTO `token_info` VALUES ('2375', null, null);
INSERT INTO `token_info` VALUES ('2376', null, null);
INSERT INTO `token_info` VALUES ('2377', null, null);
INSERT INTO `token_info` VALUES ('2378', null, null);
INSERT INTO `token_info` VALUES ('2379', null, null);
INSERT INTO `token_info` VALUES ('2380', null, null);
INSERT INTO `token_info` VALUES ('2381', null, null);
INSERT INTO `token_info` VALUES ('2382', null, null);
INSERT INTO `token_info` VALUES ('2383', null, null);
INSERT INTO `token_info` VALUES ('2384', null, null);
INSERT INTO `token_info` VALUES ('2385', null, null);
INSERT INTO `token_info` VALUES ('2386', null, null);
INSERT INTO `token_info` VALUES ('2387', null, null);
INSERT INTO `token_info` VALUES ('2388', null, null);
INSERT INTO `token_info` VALUES ('2389', null, null);
INSERT INTO `token_info` VALUES ('2390', null, null);
INSERT INTO `token_info` VALUES ('2391', null, null);
INSERT INTO `token_info` VALUES ('2392', null, null);
INSERT INTO `token_info` VALUES ('2393', null, null);
INSERT INTO `token_info` VALUES ('2394', null, null);
INSERT INTO `token_info` VALUES ('2395', null, null);
INSERT INTO `token_info` VALUES ('2396', null, null);
INSERT INTO `token_info` VALUES ('2397', null, null);
INSERT INTO `token_info` VALUES ('2398', null, null);
INSERT INTO `token_info` VALUES ('2399', null, null);
INSERT INTO `token_info` VALUES ('2400', null, null);
INSERT INTO `token_info` VALUES ('2401', null, null);
INSERT INTO `token_info` VALUES ('2402', null, null);
INSERT INTO `token_info` VALUES ('2403', null, null);
INSERT INTO `token_info` VALUES ('2404', null, null);
INSERT INTO `token_info` VALUES ('2405', null, null);
INSERT INTO `token_info` VALUES ('2406', null, null);
INSERT INTO `token_info` VALUES ('2407', null, null);
INSERT INTO `token_info` VALUES ('2408', null, null);
INSERT INTO `token_info` VALUES ('2409', null, null);
INSERT INTO `token_info` VALUES ('2410', null, null);
INSERT INTO `token_info` VALUES ('2411', null, null);
INSERT INTO `token_info` VALUES ('2412', null, null);
INSERT INTO `token_info` VALUES ('2413', null, null);
INSERT INTO `token_info` VALUES ('2414', null, null);
INSERT INTO `token_info` VALUES ('2415', null, null);
INSERT INTO `token_info` VALUES ('2416', null, null);
INSERT INTO `token_info` VALUES ('2417', null, null);
INSERT INTO `token_info` VALUES ('2418', null, null);
INSERT INTO `token_info` VALUES ('2419', null, null);
INSERT INTO `token_info` VALUES ('2420', null, null);
INSERT INTO `token_info` VALUES ('2421', null, null);
INSERT INTO `token_info` VALUES ('2422', null, null);
INSERT INTO `token_info` VALUES ('2423', null, null);
INSERT INTO `token_info` VALUES ('2424', null, null);
INSERT INTO `token_info` VALUES ('2425', null, null);
INSERT INTO `token_info` VALUES ('2426', null, null);
INSERT INTO `token_info` VALUES ('2427', null, null);
INSERT INTO `token_info` VALUES ('2428', null, null);
INSERT INTO `token_info` VALUES ('2429', null, null);
INSERT INTO `token_info` VALUES ('2430', null, null);
INSERT INTO `token_info` VALUES ('2431', null, null);
INSERT INTO `token_info` VALUES ('2432', null, null);
INSERT INTO `token_info` VALUES ('2433', null, null);
INSERT INTO `token_info` VALUES ('2434', null, null);
INSERT INTO `token_info` VALUES ('2435', null, null);
INSERT INTO `token_info` VALUES ('2436', null, null);
INSERT INTO `token_info` VALUES ('2437', null, null);
INSERT INTO `token_info` VALUES ('2438', null, null);
INSERT INTO `token_info` VALUES ('2439', null, null);
INSERT INTO `token_info` VALUES ('2440', null, null);
INSERT INTO `token_info` VALUES ('2441', null, null);
INSERT INTO `token_info` VALUES ('2442', null, null);
INSERT INTO `token_info` VALUES ('2443', null, null);
INSERT INTO `token_info` VALUES ('2444', null, null);
INSERT INTO `token_info` VALUES ('2445', null, null);
INSERT INTO `token_info` VALUES ('2446', null, null);
INSERT INTO `token_info` VALUES ('2447', null, null);
INSERT INTO `token_info` VALUES ('2448', null, null);
INSERT INTO `token_info` VALUES ('2449', null, null);
INSERT INTO `token_info` VALUES ('2450', null, null);
INSERT INTO `token_info` VALUES ('2451', null, null);
INSERT INTO `token_info` VALUES ('2452', null, null);
INSERT INTO `token_info` VALUES ('2453', null, null);
INSERT INTO `token_info` VALUES ('2454', null, null);
INSERT INTO `token_info` VALUES ('2455', null, null);
INSERT INTO `token_info` VALUES ('2456', null, null);
INSERT INTO `token_info` VALUES ('2457', null, null);
INSERT INTO `token_info` VALUES ('2458', null, null);
INSERT INTO `token_info` VALUES ('2459', null, null);
INSERT INTO `token_info` VALUES ('2460', null, null);
INSERT INTO `token_info` VALUES ('2461', null, null);
INSERT INTO `token_info` VALUES ('2462', null, null);
INSERT INTO `token_info` VALUES ('2463', null, null);
INSERT INTO `token_info` VALUES ('2464', null, null);
INSERT INTO `token_info` VALUES ('2465', null, null);
INSERT INTO `token_info` VALUES ('2466', null, null);
INSERT INTO `token_info` VALUES ('2467', null, null);
INSERT INTO `token_info` VALUES ('2468', null, null);
INSERT INTO `token_info` VALUES ('2469', null, null);
INSERT INTO `token_info` VALUES ('2470', null, null);
INSERT INTO `token_info` VALUES ('2471', null, null);
INSERT INTO `token_info` VALUES ('2472', null, null);
INSERT INTO `token_info` VALUES ('2473', null, null);
INSERT INTO `token_info` VALUES ('2474', null, null);
INSERT INTO `token_info` VALUES ('2475', null, null);
INSERT INTO `token_info` VALUES ('2476', null, null);
INSERT INTO `token_info` VALUES ('2477', null, null);
INSERT INTO `token_info` VALUES ('2478', null, null);
INSERT INTO `token_info` VALUES ('2479', null, null);
INSERT INTO `token_info` VALUES ('2480', null, null);
INSERT INTO `token_info` VALUES ('2481', null, null);
INSERT INTO `token_info` VALUES ('2482', null, null);
INSERT INTO `token_info` VALUES ('2483', null, null);
INSERT INTO `token_info` VALUES ('2484', null, null);
INSERT INTO `token_info` VALUES ('2485', null, null);
INSERT INTO `token_info` VALUES ('2486', null, null);
INSERT INTO `token_info` VALUES ('2487', null, null);
INSERT INTO `token_info` VALUES ('2488', null, null);
INSERT INTO `token_info` VALUES ('2489', null, null);
INSERT INTO `token_info` VALUES ('2490', null, null);
INSERT INTO `token_info` VALUES ('2491', null, null);
INSERT INTO `token_info` VALUES ('2492', null, null);
INSERT INTO `token_info` VALUES ('2493', null, null);
INSERT INTO `token_info` VALUES ('2494', null, null);
INSERT INTO `token_info` VALUES ('2495', null, null);
INSERT INTO `token_info` VALUES ('2496', null, null);
INSERT INTO `token_info` VALUES ('2497', null, null);
INSERT INTO `token_info` VALUES ('2498', null, null);
INSERT INTO `token_info` VALUES ('2499', null, null);
INSERT INTO `token_info` VALUES ('2500', null, null);
INSERT INTO `token_info` VALUES ('2501', null, null);
INSERT INTO `token_info` VALUES ('2502', null, null);
INSERT INTO `token_info` VALUES ('2503', null, null);
INSERT INTO `token_info` VALUES ('2504', null, null);
INSERT INTO `token_info` VALUES ('2505', null, null);
INSERT INTO `token_info` VALUES ('2506', null, null);
INSERT INTO `token_info` VALUES ('2507', null, null);
INSERT INTO `token_info` VALUES ('2508', null, null);
INSERT INTO `token_info` VALUES ('2509', null, null);
INSERT INTO `token_info` VALUES ('2510', null, null);
INSERT INTO `token_info` VALUES ('2511', null, null);
INSERT INTO `token_info` VALUES ('2512', null, null);
INSERT INTO `token_info` VALUES ('2513', null, null);
INSERT INTO `token_info` VALUES ('2514', null, null);
INSERT INTO `token_info` VALUES ('2515', null, null);
INSERT INTO `token_info` VALUES ('2516', null, null);
INSERT INTO `token_info` VALUES ('2517', null, null);
INSERT INTO `token_info` VALUES ('2518', null, null);
INSERT INTO `token_info` VALUES ('2519', null, null);
INSERT INTO `token_info` VALUES ('2520', null, null);
INSERT INTO `token_info` VALUES ('2521', null, null);
INSERT INTO `token_info` VALUES ('2522', null, null);
INSERT INTO `token_info` VALUES ('2523', null, null);
INSERT INTO `token_info` VALUES ('2524', null, null);
INSERT INTO `token_info` VALUES ('2525', null, null);
INSERT INTO `token_info` VALUES ('2526', null, null);
INSERT INTO `token_info` VALUES ('2527', null, null);
INSERT INTO `token_info` VALUES ('2528', null, null);
INSERT INTO `token_info` VALUES ('2529', null, null);
INSERT INTO `token_info` VALUES ('2530', null, null);
INSERT INTO `token_info` VALUES ('2531', null, null);
INSERT INTO `token_info` VALUES ('2532', null, null);
INSERT INTO `token_info` VALUES ('2533', null, null);
INSERT INTO `token_info` VALUES ('2534', null, null);
INSERT INTO `token_info` VALUES ('2535', null, null);
INSERT INTO `token_info` VALUES ('2536', null, null);
INSERT INTO `token_info` VALUES ('2537', null, null);
INSERT INTO `token_info` VALUES ('2538', null, null);
INSERT INTO `token_info` VALUES ('2539', null, null);
INSERT INTO `token_info` VALUES ('2540', null, null);
INSERT INTO `token_info` VALUES ('2541', null, null);
INSERT INTO `token_info` VALUES ('2542', null, null);
INSERT INTO `token_info` VALUES ('2543', null, null);
INSERT INTO `token_info` VALUES ('2544', null, null);
INSERT INTO `token_info` VALUES ('2545', null, null);
INSERT INTO `token_info` VALUES ('2546', null, null);
INSERT INTO `token_info` VALUES ('2547', null, null);
INSERT INTO `token_info` VALUES ('2548', null, null);
INSERT INTO `token_info` VALUES ('2549', null, null);
INSERT INTO `token_info` VALUES ('2550', null, null);
INSERT INTO `token_info` VALUES ('2551', null, null);
INSERT INTO `token_info` VALUES ('2552', null, null);
INSERT INTO `token_info` VALUES ('2553', null, null);
INSERT INTO `token_info` VALUES ('2554', null, null);
INSERT INTO `token_info` VALUES ('2555', null, null);
INSERT INTO `token_info` VALUES ('2556', null, null);
INSERT INTO `token_info` VALUES ('2557', null, null);
INSERT INTO `token_info` VALUES ('2558', null, null);
INSERT INTO `token_info` VALUES ('2559', null, null);
INSERT INTO `token_info` VALUES ('2560', null, null);
INSERT INTO `token_info` VALUES ('2561', null, null);
INSERT INTO `token_info` VALUES ('2562', null, null);
INSERT INTO `token_info` VALUES ('2563', null, null);
INSERT INTO `token_info` VALUES ('2564', null, null);
INSERT INTO `token_info` VALUES ('2565', null, null);
INSERT INTO `token_info` VALUES ('2566', null, null);
INSERT INTO `token_info` VALUES ('2567', null, null);
INSERT INTO `token_info` VALUES ('2568', null, null);
INSERT INTO `token_info` VALUES ('2569', null, null);
INSERT INTO `token_info` VALUES ('2570', null, null);
INSERT INTO `token_info` VALUES ('2571', null, null);
INSERT INTO `token_info` VALUES ('2572', null, null);
INSERT INTO `token_info` VALUES ('2573', null, null);
INSERT INTO `token_info` VALUES ('2574', null, null);
INSERT INTO `token_info` VALUES ('2575', null, null);
INSERT INTO `token_info` VALUES ('2576', null, null);
INSERT INTO `token_info` VALUES ('2577', null, null);
INSERT INTO `token_info` VALUES ('2578', null, null);
INSERT INTO `token_info` VALUES ('2579', null, null);
INSERT INTO `token_info` VALUES ('2580', null, null);
INSERT INTO `token_info` VALUES ('2581', null, null);
INSERT INTO `token_info` VALUES ('2582', null, null);
INSERT INTO `token_info` VALUES ('2583', null, null);
INSERT INTO `token_info` VALUES ('2584', null, null);
INSERT INTO `token_info` VALUES ('2585', null, null);
INSERT INTO `token_info` VALUES ('2586', null, null);
INSERT INTO `token_info` VALUES ('2587', null, null);
INSERT INTO `token_info` VALUES ('2588', null, null);
INSERT INTO `token_info` VALUES ('2589', null, null);
INSERT INTO `token_info` VALUES ('2590', null, null);
INSERT INTO `token_info` VALUES ('2591', null, null);
INSERT INTO `token_info` VALUES ('2592', null, null);
INSERT INTO `token_info` VALUES ('2593', null, null);
INSERT INTO `token_info` VALUES ('2594', null, null);
INSERT INTO `token_info` VALUES ('2595', null, null);
INSERT INTO `token_info` VALUES ('2596', null, null);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `school_id` int(11) DEFAULT NULL,
  `roleCode` varchar(100) DEFAULT NULL,
  `loginId` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `gender` int(2) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `IdCard` varchar(20) DEFAULT NULL,
  `info` varchar(500) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `stopDate` datetime DEFAULT NULL,
  `state` int(2) DEFAULT '1' COMMENT '0:注销,1:可用,2:正在申请的用户',
  `remark` varchar(255) DEFAULT NULL,
  `courseTypeIds` varchar(255) DEFAULT NULL,
  `openIds` varchar(255) DEFAULT NULL,
  `courseTypeParentIds` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=288 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('226', '1', 'admin', '301', '管理员', 'admin', 'jifjsdo@qq.com', '2', '2017-03-15 00:00:00', 'avatar/31C7706EE8A043642C030C2D0AA4BDF61496735188655.jpg', null, '', '215412111410101224', '亚卓教育vdsfffsdf的', '2017-03-07 14:45:21', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('227', '1', 'teacher', '302', '教师01', 'teacher01', 'yzteacher01@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('228', '1', 'teacher', '303', '教师02', 'teacher02', 'yzteacher02@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('229', '1', 'teacher', '304', '教师03', 'teacher03', 'yzteacher03@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('230', '1', 'teacher', '305', '教师04', 'teacher04', 'yzteacher04@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('231', '1', 'teacher', '306', '教师05', 'teacher05', 'yzteacher05@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('232', '1', 'teacher', '307', '教师06', 'teacher06', 'yzteacher06@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('233', '1', 'teacher', '308', '教师07', 'teacher07', 'yzteacher07@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('234', '1', 'teacher', '309', '教师08', 'teacher08', 'yzteacher08@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('235', '1', 'teacher', '310', '教师09', 'teacher09', 'yzteacher09@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('236', '1', 'teacher', '311', '教师10', 'teacher10', 'yzteacher10@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('237', '1', 'teacher', '312', '教师11', 'teacher11', 'yzteacher11@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('238', '1', 'teacher', '313', '教师12', 'teacher12', 'yzteacher12@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('239', '1', 'teacher', '314', '教师13', 'teacher13', 'yzteacher13@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('240', '1', 'teacher', '315', '教师14', 'teacher14', 'yzteacher14@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('241', '1', 'teacher', '316', '教师15', 'teacher15', 'yzteacher15@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('242', '1', 'teacher', '317', '教师16', 'teacher16', 'yzteacher16@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('243', '1', 'teacher', '318', '教师17', 'teacher17', 'yzteacher17@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('244', '1', 'teacher', '319', '教师18', 'teacher18', 'yzteacher18@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('245', '1', 'teacher', '320', '教师19', 'teacher19', 'yzteacher19@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('246', '1', 'teacher', '321', '教师20', 'teacher20', 'yzteacher20@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('247', '1', 'teacher', '322', '教师21', 'teacher21', 'yzteacher21@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('248', '1', 'teacher', '323', '教师22', 'teacher22', 'yzteacher22@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('249', '1', 'teacher', '324', '教师23', 'teacher23', 'yzteacher23@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('250', '1', 'teacher', '325', '教师24', 'teacher24', 'yzteacher24@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('251', '1', 'teacher', '326', '教师25', 'teacher25', 'yzteacher25@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('252', '1', 'teacher', '327', '教师26', 'teacher26', 'yzteacher26@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('253', '1', 'teacher', '328', '教师27', 'teacher27', 'yzteacher27@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('254', '1', 'teacher', '329', '教师28', 'teacher28', 'yzteacher28@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('255', '1', 'teacher', '330', '教师29', 'teacher29', 'yzteacher29@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('256', '1', 'teacher', '331', '教师30', 'teacher30', 'yzteacher30@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('257', '1', 'teacher', '332', '教师31', 'teacher31', 'yzteacher31@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('258', '1', 'teacher', '333', '教师32', 'teacher32', 'yzteacher32@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('259', '1', 'teacher', '334', '教师33', 'teacher33', 'yzteacher33@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('260', '1', 'teacher', '335', '教师34', 'teacher34', 'yzteacher34@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('261', '1', 'teacher', '336', '教师35', 'teacher35', 'yzteacher35@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('262', '1', 'teacher', '337', '教师36', 'teacher36', 'yzteacher36@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('263', '1', 'teacher', '338', '教师37', 'teacher37', 'yzteacher37@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('264', '1', 'teacher', '339', '教师38', 'teacher38', 'yzteacher38@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('265', '1', 'teacher', '340', '教师39', 'teacher39', 'yzteacher39@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('266', '1', 'teacher', '341', '教师40', 'teacher40', 'yzteacher40@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('267', '1', 'teacher', '342', '教师41', 'teacher41', 'yzteacher41@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('268', '1', 'teacher', '343', '教师42', 'teacher42', 'yzteacher42@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('269', '1', 'teacher', '344', '教师43', 'teacher43', 'yzteacher43@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('270', '1', 'teacher', '345', '教师44', 'teacher44', 'yzteacher44@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('271', '1', 'teacher', '346', '教师45', 'teacher45', 'yzteacher45@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('272', '1', 'teacher', '347', '教师46', 'teacher46', 'yzteacher46@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('273', '1', 'teacher', '348', '教师47', 'teacher47', 'yzteacher47@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('274', '1', 'teacher', '349', '教师48', 'teacher48', 'yzteacher48@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('275', '1', 'teacher', '350', '教师49', 'teacher49', 'yzteacher49@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('276', '1', 'teacher', '351', '教师50', 'teacher50', 'yzteacher50@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('277', '1', 'teacher', '352', '教师51', 'teacher51', 'yzteacher51@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('278', '1', 'teacher', '353', '教师52', 'teacher52', 'yzteacher52@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('279', '1', 'teacher', '354', '教师53', 'teacher53', 'yzteacher53@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('280', '1', 'teacher', '355', '教师54', 'teacher54', 'yzteacher54@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('281', '1', 'teacher', '356', '教师55', 'teacher55', 'yzteacher55@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('282', '1', 'teacher', '357', '教师56', 'teacher56', 'yzteacher56@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('283', '1', 'teacher', '358', '教师57', 'teacher57', 'yzteacher57@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('284', '1', 'teacher', '359', '教师58', 'teacher58', 'yzteacher58@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('285', '1', 'teacher', '360', '教师59', 'teacher59', 'yzteacher59@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('286', '1', 'teacher', '361', '教师60', 'teacher60', 'yzteacher60@qq.com', '1', null, null, null, '', '', null, '2017-11-13 10:00:32', null, '1', null, null, null, null);
INSERT INTO `user_info` VALUES ('287', '1', 'student', '362', '亚卓教育', '1709', '', '1', '2017-12-18 00:00:00', 'avatar/avatar.png', '', null, '', '亚卓教育', null, null, '1', null, null, null, null);

-- ----------------------------
-- Table structure for video_info
-- ----------------------------
DROP TABLE IF EXISTS `video_info`;
CREATE TABLE `video_info` (
  `video_id` int(11) NOT NULL AUTO_INCREMENT,
  `chapter_id` int(11) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `info` varchar(200) DEFAULT NULL,
  `video_size` bigint(20) DEFAULT NULL,
  `second` int(11) DEFAULT NULL,
  `video_suffix` varchar(20) DEFAULT NULL,
  `create_dt` datetime DEFAULT NULL,
  `state_dt` datetime DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `state` int(2) DEFAULT '1',
  `isshow` int(2) DEFAULT '1',
  PRIMARY KEY (`video_id`)
) ENGINE=InnoDB AUTO_INCREMENT=958 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video_info
-- ----------------------------
INSERT INTO `video_info` VALUES ('146', '729', '1', '226', '96', '你能教教我吗？.mp4', 'resource/96/video/26C5F902DF5A3CFC93BCF9EAB0DFF0871496630794621.mp4', '', null, null, 'mp4', '2017-06-05 10:47:18', '2017-06-05 10:47:18', null, '1', '1');
INSERT INTO `video_info` VALUES ('147', '739', '1', '226', '96', '这件事交给我！.mp4', 'resource/96/video/7C9CC78C64BCF1BD37AFEE032D84A8681496631327089.mp4', '', null, null, 'mp4', '2017-06-05 10:56:25', '2017-06-05 10:56:25', null, '1', '1');
INSERT INTO `video_info` VALUES ('148', '740', '1', '226', '96', '细节决定成败.mp4', 'resource/96/video/3419A1F1BFA52402E746921CE41F17961496631441752.mp4', '', null, null, 'mp4', '2017-06-05 10:58:17', '2017-06-05 10:58:17', null, '1', '1');
INSERT INTO `video_info` VALUES ('149', '741', '1', '226', '96', '和拖延说拜拜.mp4', 'resource/96/video/2F88721B3D7C83ADF69305D4BAD3544C1496631686516.mp4', '', null, null, 'mp4', '2017-06-05 11:02:06', '2017-06-05 11:02:06', null, '1', '1');
INSERT INTO `video_info` VALUES ('150', '742', '1', '226', '96', '我成年啦！.mp4', 'resource/96/video/1342BE2BFEB305F339FDB741373050541496631896195.mp4', '', null, null, 'mp4', '2017-06-05 11:05:13', '2017-06-05 11:05:13', null, '1', '1');
INSERT INTO `video_info` VALUES ('151', '743', '1', '226', '96', '和而不同.mp4', 'resource/96/video/C8F4FDF0A847351D4FBB47D3CA570F471496631945720.mp4', '', null, null, 'mp4', '2017-06-05 11:06:24', '2017-06-05 11:06:24', null, '1', '1');
INSERT INTO `video_info` VALUES ('152', '745', '1', '226', '96', '非礼勿视，非礼勿听.mp4', 'resource/96/video/F7EE3ED04FEDD3D07B57B33635BEDDC21496632096985.mp4', '', null, null, 'mp4', '2017-06-05 11:08:27', '2017-06-05 11:08:27', null, '1', '1');
INSERT INTO `video_info` VALUES ('153', '746', '1', '226', '96', '你的意见真不错！.mp4', 'resource/96/video/C86ACEF15CB091D168351478759AB8EC1496632158186.mp4', '', null, null, 'mp4', '2017-06-05 11:09:57', '2017-06-05 11:09:57', null, '1', '1');
INSERT INTO `video_info` VALUES ('154', '747', '1', '226', '96', '从每天上班不迟到做起.mp4', 'resource/96/video/74A01A569782AEFD5E1A55FC406540531496632246765.mp4', '', null, null, 'mp4', '2017-06-05 11:11:04', '2017-06-05 11:11:04', null, '1', '1');
INSERT INTO `video_info` VALUES ('156', '748', '1', '226', '96', '我要当老板.mp4', 'resource/96/video/F0AB881A7BAB72EA7B2222BEC905CA731496632645181.mp4', '', null, null, 'mp4', '2017-06-05 11:18:08', '2017-06-05 11:18:08', null, '1', '1');
INSERT INTO `video_info` VALUES ('157', '607', '1', '226', '91', '认识你真好.mp4', 'resource/91/video/89A268E55D97606D22F39153DBF986C01496632659321.mp4', '', null, null, 'mp4', '2017-06-05 11:18:31', '2017-06-05 11:18:31', null, '1', '1');
INSERT INTO `video_info` VALUES ('158', '608', '1', '226', '91', '我是谁？.mp4', 'resource/91/video/75732DDCC94398FB5F5E3F62B8ACD9B81496632768293.mp4', '', null, null, 'mp4', '2017-06-05 11:20:15', '2017-06-05 11:20:15', null, '1', '1');
INSERT INTO `video_info` VALUES ('159', '609', '1', '226', '91', '情感超市.mp4', 'resource/91/video/C328B93CE251EE4004405671A829185F1496632882616.mp4', '', null, null, 'mp4', '2017-06-05 11:22:02', '2017-06-05 11:22:02', null, '1', '1');
INSERT INTO `video_info` VALUES ('160', '663', '1', '226', '93', '快乐学习.mp4', 'resource/93/video/D18ABB9E5D621C0B9FD4BFF59C00AC2A1496632861850.mp4', '', null, null, 'mp4', '2017-06-05 11:22:15', '2017-06-05 11:22:15', null, '1', '1');
INSERT INTO `video_info` VALUES ('161', '610', '1', '226', '91', '富有的生命历程.mp4', 'resource/91/video/8EC5EAE0E5D863D34B02FCA0F4C1C3A01496633046150.mp4', '', null, null, 'mp4', '2017-06-05 11:24:56', '2017-06-05 11:24:56', null, '1', '1');
INSERT INTO `video_info` VALUES ('162', '681', '1', '226', '93', '学校是我的第二个家.mp4', 'resource/93/video/81B3A3AE0B71F3440691342017B0A28D1496633091682.mp4', '', null, null, 'mp4', '2017-06-05 11:25:27', '2017-06-05 11:25:27', null, '1', '1');
INSERT INTO `video_info` VALUES ('163', '611', '1', '226', '91', '好好地爱自己.mp4', 'resource/91/video/707F1B97EB2092863BEA39F1BBB7B5CE1496633150057.mp4', '', null, null, 'mp4', '2017-06-05 11:26:53', '2017-06-05 11:26:53', null, '1', '1');
INSERT INTO `video_info` VALUES ('164', '682', '1', '226', '93', '没有规矩不成方圆.mp4', 'resource/93/video/4627540F9C1D6B8C2BABC2A1AFDB10BE1496633215866.mp4', '', null, null, 'mp4', '2017-06-05 11:27:23', '2017-06-05 11:27:23', null, '1', '1');
INSERT INTO `video_info` VALUES ('165', '683', '1', '226', '93', '新起点，新梦想.mp4', 'resource/93/video/447B71A598BDBD386D6023584EC10FD41496633331648.mp4', '', null, null, 'mp4', '2017-06-05 11:29:43', '2017-06-05 11:29:43', null, '1', '1');
INSERT INTO `video_info` VALUES ('166', '684', '1', '226', '93', '我的未来不是梦.mp4', 'resource/93/video/16EC35A888F017DA79E08134C76AEE4E1496633427725.mp4', '', null, null, 'mp4', '2017-06-05 11:31:34', '2017-06-05 11:31:34', null, '1', '1');
INSERT INTO `video_info` VALUES ('167', '613', '1', '226', '91', '自我情绪管理.mp4', 'resource/91/video/D67DE87729E5860986BF64FA1D3886281496633290525.mp4', '', null, null, 'mp4', '2017-06-05 11:32:56', '2017-06-05 11:32:56', null, '1', '1');
INSERT INTO `video_info` VALUES ('168', '685', '1', '226', '93', '成功是一种习惯.mp4', 'resource/93/video/B725526051CBF7C50D9E8187161935821496633646423.mp4', '', null, null, 'mp4', '2017-06-05 11:34:19', '2017-06-05 11:34:19', null, '1', '1');
INSERT INTO `video_info` VALUES ('169', '614', '1', '226', '91', '战胜自卑.mp4', 'resource/91/video/D3542438FEAD8F5CDE52E471A37C46B31496633642823.mp4', '', null, null, 'mp4', '2017-06-05 11:34:42', '2017-06-05 11:34:42', null, '1', '1');
INSERT INTO `video_info` VALUES ('170', '686', '1', '226', '93', '创新，迈向成功的原动力.mp4', 'resource/93/video/8C3F162DB110213B918D171ACAD9B5891496633704529.mp4', '', null, null, 'mp4', '2017-06-05 11:36:17', '2017-06-05 11:36:17', null, '1', '1');
INSERT INTO `video_info` VALUES ('171', '615', '1', '226', '91', '妒忌的危害.mp4', 'resource/91/video/331D0678FBD76F7AAA3BEBF3E7D0C4021496633857500.mp4', '', null, null, 'mp4', '2017-06-05 11:38:49', '2017-06-05 11:38:49', null, '1', '1');
INSERT INTO `video_info` VALUES ('172', '687', '1', '226', '93', '光荣与传统.mp4', 'resource/93/video/1CC2E7DFD16A4BB035EC151DE868878A1496633917764.mp4', '', null, null, 'mp4', '2017-06-05 11:38:54', '2017-06-05 11:38:54', null, '1', '1');
INSERT INTO `video_info` VALUES ('174', '616', '1', '226', '91', '爱情这东西.mp4', 'resource/91/video/4E525A0CECE0C0FC6D18F3F5726DE2CB1496634003727.mp4', '', null, null, 'mp4', '2017-06-05 11:40:48', '2017-06-05 11:40:48', null, '1', '1');
INSERT INTO `video_info` VALUES ('175', '617', '1', '226', '91', '愤怒蒙蔽了我们的双眼.mp4', 'resource/91/video/816381ACA6DF63EE7F9D79C94B5524001496634106138.mp4', '', null, null, 'mp4', '2017-06-05 11:42:24', '2017-06-05 11:42:24', null, '1', '1');
INSERT INTO `video_info` VALUES ('176', '689', '1', '226', '93', '一个字—“干”.mp4', 'resource/93/video/29D1B633C0A4FDE62F85417E859D8EB1496634179835.mp4', '', null, null, 'mp4', '2017-06-05 11:43:13', '2017-06-05 11:43:13', null, '1', '1');
INSERT INTO `video_info` VALUES ('177', '690', '1', '226', '93', '授人玫瑰，手留余香.mp4', 'resource/93/video/BD86C048AFD5E42DD7328A48389BD8F91496634239147.mp4', '', null, null, 'mp4', '2017-06-05 11:44:25', '2017-06-05 11:44:25', null, '1', '1');
INSERT INTO `video_info` VALUES ('178', '618', '1', '226', '91', '风雨人生路.mp4', 'resource/91/video/59EDFDAAF6AE298A924890E1ABC6B08B1496634248161.mp4', '', null, null, 'mp4', '2017-06-05 11:45:09', '2017-06-05 11:45:09', null, '1', '1');
INSERT INTO `video_info` VALUES ('179', '691', '1', '226', '93', '奔跑吧，我的兄弟姐妹.mp4', 'resource/93/video/C7545A39261BECD1811B2373F7A666811496634314551.mp4', '', null, null, 'mp4', '2017-06-05 11:45:29', '2017-06-05 11:45:29', null, '1', '1');
INSERT INTO `video_info` VALUES ('180', '619', '1', '226', '91', '交谈的艺术.mp4', 'resource/91/video/A0E9B66773C192A06D9A85188355E9FF1496634387029.mp4', '', null, null, 'mp4', '2017-06-05 11:47:04', '2017-06-05 11:47:04', null, '1', '1');
INSERT INTO `video_info` VALUES ('181', '692', '1', '226', '93', '对不良诱惑说“不”.mp4', 'resource/93/video/BA771FAB67F2B947A9A606399B87A0ED1496634368877.mp4', '', null, null, 'mp4', '2017-06-05 11:47:30', '2017-06-05 11:47:30', null, '1', '1');
INSERT INTO `video_info` VALUES ('182', '621', '1', '226', '91', '生命在我手中.mp4', 'resource/91/video/4513B2AB2B34418383DA7BBD068AEC11496634511044.mp4', '', null, null, 'mp4', '2017-06-05 11:49:00', '2017-06-05 11:49:00', null, '1', '1');
INSERT INTO `video_info` VALUES ('183', '693', '1', '226', '93', '自由与自律.mp4', 'resource/93/video/A90760A0F5311B5C2D91A54E91F638C11496634583004.mp4', '', null, null, 'mp4', '2017-06-05 11:50:07', '2017-06-05 11:50:07', null, '1', '1');
INSERT INTO `video_info` VALUES ('184', '622', '1', '226', '91', '意愿百分百，方法无穷多.mp4', 'resource/91/video/BC027E0B1100AB838D6B6C04A9B70B771496634646145.mp4', '', null, null, 'mp4', '2017-06-05 11:50:56', '2017-06-05 11:50:56', null, '1', '1');
INSERT INTO `video_info` VALUES ('185', '694', '1', '226', '93', '责任与压力.mp4', 'resource/93/video/EF07C51E9686B9F2EA30465EBA98D2F21496634654354.mp4', '', null, null, 'mp4', '2017-06-05 11:51:15', '2017-06-05 11:51:15', null, '1', '1');
INSERT INTO `video_info` VALUES ('186', '623', '1', '226', '91', '让生命之根更深更远.mp4', 'resource/91/video/678597CEE76DD17B2E1DED85946E1D881496634705797.mp4', '', null, null, 'mp4', '2017-06-05 11:52:41', '2017-06-05 11:52:41', null, '1', '1');
INSERT INTO `video_info` VALUES ('187', '624', '1', '226', '91', '减压训练.mp4', 'resource/91/video/D333FDB445843AAF8AA1959645E33E761496634906644.mp4', '', null, null, 'mp4', '2017-06-05 11:55:31', '2017-06-05 11:55:31', null, '1', '1');
INSERT INTO `video_info` VALUES ('188', '718', '1', '226', '95', '职位永远“在线”.mp4', 'resource/95/video/47E9A20130D26F017A1047055770AB451496634940460.mp4', '', null, null, 'mp4', '2017-06-05 11:56:32', '2017-06-05 11:56:32', null, '1', '1');
INSERT INTO `video_info` VALUES ('189', '720', '1', '226', '95', '规则，You know！.mp4', 'resource/95/video/DBDA4DC68AF759BD037B624CC4D320E41496635066410.mp4', '', null, null, 'mp4', '2017-06-05 11:58:12', '2017-06-05 11:58:12', null, '1', '1');
INSERT INTO `video_info` VALUES ('190', '625', '1', '226', '91', '戒除网瘾.mp4', 'resource/91/video/CCD11387437C794C1FF857DD91849D01496635062929.mp4', '', null, null, 'mp4', '2017-06-05 11:58:17', '2017-06-05 11:58:17', null, '1', '1');
INSERT INTO `video_info` VALUES ('191', '719', '1', '226', '95', '做一个靠谱的人.mp4', 'resource/95/video/C261684439497ECE2947FC46A29CA9711496635128499.mp4', '', null, null, 'mp4', '2017-06-05 11:59:13', '2017-06-05 11:59:13', null, '1', '1');
INSERT INTO `video_info` VALUES ('192', '721', '1', '226', '95', '说话之道大有学问.mp4', 'resource/95/video/28185CF1C28DB50C2815126B325E7A6F1496635225387.mp4', '', null, null, 'mp4', '2017-06-05 12:00:35', '2017-06-05 12:00:35', null, '1', '1');
INSERT INTO `video_info` VALUES ('193', '626', '1', '226', '91', '积极心理品质的培养.mp4', 'resource/91/video/DE323929EDEDF958B1C31715F68703D91496635207242.mp4', '', null, null, 'mp4', '2017-06-05 12:00:56', '2017-06-05 12:00:56', null, '1', '1');
INSERT INTO `video_info` VALUES ('194', '722', '1', '226', '95', '组好团队事半功倍.mp4', 'resource/95/video/E5CFF4B26C3FCBBA5883034AD763BC441496635270686.mp4', '', null, null, 'mp4', '2017-06-05 12:02:15', '2017-06-05 12:02:15', null, '1', '1');
INSERT INTO `video_info` VALUES ('195', '627', '1', '226', '91', '决不放弃.mp4', 'resource/91/video/B94513B45790752238BA7BB65DF2BB9E1496635349933.mp4', '', null, null, 'mp4', '2017-06-05 12:02:52', '2017-06-05 12:02:52', null, '1', '1');
INSERT INTO `video_info` VALUES ('196', '724', '1', '226', '95', '海阔天空成就人生.mp4', 'resource/95/video/DC5F3290AC92307C49686C50D1A4E7961496635431272.mp4', '', null, null, 'mp4', '2017-06-05 12:04:06', '2017-06-05 12:04:06', null, '1', '1');
INSERT INTO `video_info` VALUES ('197', '723', '1', '226', '95', '不能事事慢动作.mp4', 'resource/95/video/F43DDEF972C2CC688639E365ED978AB31496641023252.mp4', '', null, null, 'mp4', '2017-06-05 13:37:35', '2017-06-05 13:37:35', null, '1', '1');
INSERT INTO `video_info` VALUES ('198', '726', '1', '226', '95', '信息时代，你low了吗？.mp4', 'resource/95/video/90D272E08C3E8C874EFA5324AA20941A1496641185820.mp4', '', null, null, 'mp4', '2017-06-05 13:40:26', '2017-06-05 13:40:26', null, '1', '1');
INSERT INTO `video_info` VALUES ('199', '725', '1', '226', '95', '有一种快乐叫分享.mp4', 'resource/95/video/A86BD30B798B82BF50BCA9E80719238E1496641299654.mp4', '', null, null, 'mp4', '2017-06-05 13:41:51', '2017-06-05 13:41:51', null, '1', '1');
INSERT INTO `video_info` VALUES ('200', '727', '1', '226', '95', '30秒，让人喜欢你.mp4', 'resource/95/video/E0CF5D564E968C3496A83ADF1152A7911496641351655.mp4', '', null, null, 'mp4', '2017-06-05 13:43:03', '2017-06-05 13:43:03', null, '1', '1');
INSERT INTO `video_info` VALUES ('201', '629', '1', '226', '92', '校园安全伴我行（人身安全）.mp4', 'resource/92/video/B111C6FF5262859CBC46939C3C58F8DC1496644189308.mp4', '', null, null, 'mp4', '2017-06-05 14:30:02', '2017-06-05 14:30:02', null, '1', '1');
INSERT INTO `video_info` VALUES ('202', '648', '1', '226', '92', '相处有道，接触有度（恋爱安全与性健康教育）.mp4', 'resource/92/video/61CDE7ED1CADF0257300AD28F40FAEFC1496644339514.mp4', '', null, null, 'mp4', '2017-06-05 14:32:32', '2017-06-05 14:32:32', null, '1', '1');
INSERT INTO `video_info` VALUES ('203', '649', '1', '226', '92', '和咸猪手说拜拜（女同学安全教育）.mp4', 'resource/92/video/D2B2AFD4CA198E05002544FA1BF26E771496644422600.mp4', '', null, null, 'mp4', '2017-06-05 14:33:55', '2017-06-05 14:33:55', null, '1', '1');
INSERT INTO `video_info` VALUES ('204', '650', '1', '226', '92', '一时放纵带来百年孤独  半点星火毁掉万卷图书（消防安全）.mp4', 'resource/92/video/D1B7055F174E34452BD96DE3604C88CE1496644513409.mp4', '', null, null, 'mp4', '2017-06-05 14:38:45', '2017-06-05 14:38:45', null, '1', '1');
INSERT INTO `video_info` VALUES ('205', '751', '1', '226', '98', '说说法律那点儿事.mp4', 'resource/98/video/3ACBB4103A8962C6A1B21F5BC33724221496644825278.mp4', '', null, null, 'mp4', '2017-06-05 14:41:38', '2017-06-05 14:41:38', null, '1', '1');
INSERT INTO `video_info` VALUES ('206', '651', '1', '226', '92', '减灾防灾进课堂  安全意识传万家（自然灾害和公共安全）.mp4', 'resource/92/video/8F35C7C417F0C62A4E55E125BDA248581496644902602.mp4', '', null, null, 'mp4', '2017-06-05 14:42:17', '2017-06-05 14:42:17', null, '1', '1');
INSERT INTO `video_info` VALUES ('207', '790', '1', '226', '98', '说说法律那点事 说课.mp4', 'resource/98/video/D1781ABC66193ADC9EF0465505B0FBD01496644941113.mp4', '', null, null, 'mp4', '2017-06-05 14:43:42', '2017-06-05 14:43:42', null, '1', '1');
INSERT INTO `video_info` VALUES ('208', '652', '1', '226', '92', '急救我最行，安全伴你行（急救安全）.mp4', 'resource/92/video/974C7C68A141207B3B8EAE094696F74C1496645039922.mp4', '', null, null, 'mp4', '2017-06-05 14:44:28', '2017-06-05 14:44:28', null, '1', '1');
INSERT INTO `video_info` VALUES ('209', '653', '1', '226', '92', '防人之心不可无，害人之心不可有（防盗与防骗—财产安全）.mp4', 'resource/92/video/A18652A5A47FBA3401D278B7D55FD5AA1496645161678.mp4', '', null, null, 'mp4', '2017-06-05 14:46:18', '2017-06-05 14:46:18', null, '1', '1');
INSERT INTO `video_info` VALUES ('210', '654', '1', '226', '92', '请你帮帮我（遇险求助）.mp4', 'resource/92/video/8C42D5A1E54841A35D164B5ECA6A5CD71496645240745.mp4', '', null, null, 'mp4', '2017-06-05 14:47:41', '2017-06-05 14:47:41', null, '1', '1');
INSERT INTO `video_info` VALUES ('211', '656', '1', '226', '92', '有勇有谋（见义智为）.mp4', 'resource/92/video/427DD83F02BF18653FE9DE56A0A847421496645319923.mp4', '', null, null, 'mp4', '2017-06-05 14:48:49', '2017-06-05 14:48:49', null, '1', '1');
INSERT INTO `video_info` VALUES ('212', '657', '1', '226', '92', '生命最可贵，交规放心间（交通安全）.mp4', 'resource/92/video/FB640EB5FF94F908DC703D7C6A4175051496645427556.mp4', '', null, null, 'mp4', '2017-06-05 14:50:55', '2017-06-05 14:50:55', null, '1', '1');
INSERT INTO `video_info` VALUES ('213', '752', '1', '226', '98', '02 第一单元 第二课 宪法 讲课.mp4', 'resource/98/video/2463945CFBBFADD68796C9A45A81773B1496645498233.mp4', '', null, null, 'mp4', '2017-06-05 14:51:57', '2017-06-05 14:51:57', null, '1', '1');
INSERT INTO `video_info` VALUES ('214', '658', '1', '226', '92', '绿色上网，健康成长，共建“文明网络家园”（上网安全）.mp4', 'resource/92/video/A151495E8F02ED8E96C059248DD605DB1496645536869.mp4', '', null, null, 'mp4', '2017-06-05 14:52:34', '2017-06-05 14:52:34', null, '1', '1');
INSERT INTO `video_info` VALUES ('215', '791', '1', '226', '98', '02 第一单元 第二课 宪法 说课.mp4', 'resource/98/video/C2061F864F1B9BE43148D062E9A132361496645538376.mp4', '', null, null, 'mp4', '2017-06-05 14:52:51', '2017-06-05 14:52:51', null, '1', '1');
INSERT INTO `video_info` VALUES ('216', '659', '1', '226', '92', '尊老爱幼是美德（文明礼仪）.mp4', 'resource/92/video/445BDFF3D3B2112F3FBA5A457DC5BDC41496645664657.mp4', '', null, null, 'mp4', '2017-06-05 14:54:42', '2017-06-05 14:54:42', null, '1', '1');
INSERT INTO `video_info` VALUES ('217', '792', '1', '226', '98', '03 第一单元 第三课 法治理念 说课.mp4', 'resource/98/video/328A7A1C59E0F7410D499441F610BFB51496645671238.mp4', '', null, null, 'mp4', '2017-06-05 14:54:45', '2017-06-05 14:54:45', null, '1', '1');
INSERT INTO `video_info` VALUES ('218', '753', '1', '226', '98', '03 第一单元 第三课 法治理念 讲课.mp4', 'resource/98/video/1582E0A53C91364B84F73BF5DC3ADF781496645723393.mp4', '', null, null, 'mp4', '2017-06-05 14:55:38', '2017-06-05 14:55:38', null, '1', '1');
INSERT INTO `video_info` VALUES ('219', '660', '1', '226', '92', '带走垃圾，留下回忆（文明出行，文明旅游）.mp4', 'resource/92/video/E0878CEE9923675C86EC0B7177B727F1496645805195.mp4', '', null, null, 'mp4', '2017-06-05 14:57:07', '2017-06-05 14:57:07', null, '1', '1');
INSERT INTO `video_info` VALUES ('220', '754', '1', '226', '98', '04 第一单元 第四课  公民 讲课.mp4', 'resource/98/video/412DD46961E9F48039AF12E9E2FBF8F61496645916954.mp4', '', null, null, 'mp4', '2017-06-05 14:58:53', '2017-06-05 14:58:53', null, '1', '1');
INSERT INTO `video_info` VALUES ('221', '661', '1', '226', '92', '我爱照镜子（个人为生与礼仪）.mp4', 'resource/92/video/ACBBEA3773466B41AB61AF8D4476A60E1496645945842.mp4', '', null, null, 'mp4', '2017-06-05 14:59:22', '2017-06-05 14:59:22', null, '1', '1');
INSERT INTO `video_info` VALUES ('222', '793', '1', '226', '98', '04 第一单元 第四课 公民 说课  .mp4', 'resource/98/video/67FC061F25D7CF2B7183954F1454AFBE1496645949278.mp4', '', null, null, 'mp4', '2017-06-05 14:59:33', '2017-06-05 14:59:33', null, '1', '1');
INSERT INTO `video_info` VALUES ('223', '794', '1', '226', '98', '05 第二单元 第一课 亲子关系 说课.mp4', 'resource/98/video/8459D68EF6171EE00724CCF694B67B841496646013603.mp4', '', null, null, 'mp4', '2017-06-05 15:00:29', '2017-06-05 15:00:29', null, '1', '1');
INSERT INTO `video_info` VALUES ('224', '756', '1', '226', '98', '05 第二单元 第一课 亲子关系 讲课.mp4', 'resource/98/video/CD8C423E280B3C5398AFB47C1DF40E4D1496646087115.mp4', '', null, null, 'mp4', '2017-06-05 15:01:53', '2017-06-05 15:01:53', null, '1', '1');
INSERT INTO `video_info` VALUES ('225', '800', '1', '226', '98', '06 第二单元 第二课  家庭暴力 讲课.mp4', 'resource/98/video/96495EB06DBBF5D9959168F37889EAED1496648657122.mp4', '', null, null, 'mp4', '2017-06-05 15:04:37', '2017-06-05 15:04:37', null, '1', '1');
INSERT INTO `video_info` VALUES ('226', '801', '1', '226', '98', '06 第二单元 第二课 家庭暴力 说课.mp4', 'resource/98/video/2937F2FACE772900651B56B381A04471496648828083.mp4', '', null, null, 'mp4', '2017-06-05 15:05:20', '2017-06-05 15:05:20', null, '1', '1');
INSERT INTO `video_info` VALUES ('227', '803', '1', '226', '98', '07 第二单元 第三课 性侵 说课.mp4', 'resource/98/video/A8A60F854EA8219E63996E6645AA24E61496648936565.mp4', '', null, null, 'mp4', '2017-06-05 15:06:17', '2017-06-05 15:06:17', null, '1', '1');
INSERT INTO `video_info` VALUES ('228', '860', '1', '226', '92', '团结友爱创美誉（文明利益）.mp4', 'resource/92/video/2315D38B3619C0D00A3BFEE2177092F1496646436796.mp4', '', null, null, 'mp4', '2017-06-05 15:07:27', '2017-06-05 15:07:27', null, '1', '1');
INSERT INTO `video_info` VALUES ('229', '862', '1', '226', '92', '团结友爱创美誉（文明利益）.mp4', 'resource/92/video/2315D38B3619C0D00A3BFEE2177092F1496646915042.mp4', '', null, null, 'mp4', '2017-06-05 15:15:27', '2017-06-05 15:15:27', null, '1', '1');
INSERT INTO `video_info` VALUES ('230', '577', '1', '226', '90', '第一章 《弟子规》与我.mp4', 'resource/90/video/2A3271598EF279D8372B03F23A86E6101496648410399.mp4', '', null, null, 'mp4', '2017-06-05 15:41:01', '2017-06-05 15:41:01', null, '1', '1');
INSERT INTO `video_info` VALUES ('231', '579', '1', '226', '90', '第二章 中华第一规.mp4', 'resource/90/video/2AF0F706608821D772C943897C2FBB361496648526202.mp4', '', null, null, 'mp4', '2017-06-05 15:42:18', '2017-06-05 15:42:18', null, '1', '1');
INSERT INTO `video_info` VALUES ('232', '581', '1', '226', '90', '第一节 接纳他们.mp4', 'resource/90/video/73BA868537A7D5E6A86B80334A90E5B1496648713466.mp4', '', null, null, 'mp4', '2017-06-05 15:45:30', '2017-06-05 15:45:30', null, '1', '1');
INSERT INTO `video_info` VALUES ('233', '582', '1', '226', '90', '第二节 尊重他们.mp4', 'resource/90/video/7CD29806023C87BF4FC8BB3444BDFA011496648805374.mp4', '', null, null, 'mp4', '2017-06-05 15:46:56', '2017-06-05 15:46:56', null, '1', '1');
INSERT INTO `video_info` VALUES ('234', '583', '1', '226', '90', '第三节 体谅他们.mp4', 'resource/90/video/61A122432B1857ECC9D82CFE6F493ED11496648888907.mp4', '', null, null, 'mp4', '2017-06-05 15:48:22', '2017-06-05 15:48:22', null, '1', '1');
INSERT INTO `video_info` VALUES ('235', '584', '1', '226', '90', '第四节 关心他们.mp4', 'resource/90/video/FBC0D8503B1D2783A3B522E356F7ED421496648958141.mp4', '', null, null, 'mp4', '2017-06-05 15:51:02', '2017-06-05 15:51:02', null, '1', '1');
INSERT INTO `video_info` VALUES ('236', '802', '1', '226', '98', '07 第二单元 第三课 性侵 讲课.mp4', 'resource/98/video/17607B4D0454CC15A6C4541E34FF09A1496649050282.mp4', '', null, null, 'mp4', '2017-06-05 15:51:09', '2017-06-05 15:51:09', null, '1', '1');
INSERT INTO `video_info` VALUES ('237', '585', '1', '226', '90', '第五节 包容他们.mp4', 'resource/90/video/7BF5558D1372A5379390C160BCAE4B311496649131214.mp4', '', null, null, 'mp4', '2017-06-05 15:52:24', '2017-06-05 15:52:24', null, '1', '1');
INSERT INTO `video_info` VALUES ('238', '804', '1', '226', '98', '08 第二单元 第四课 继承权 讲课.mp4', 'resource/98/video/30053115F273499CE15DB9489D8287B51496649151931.mp4', '', null, null, 'mp4', '2017-06-05 15:52:55', '2017-06-05 15:52:55', null, '1', '1');
INSERT INTO `video_info` VALUES ('239', '805', '1', '226', '98', '08 第二单元 第四课 继承权 说课.mp4', 'resource/98/video/B47DB54352F49590A5564A5D3BB027B71496649202209.mp4', '', null, null, 'mp4', '2017-06-05 15:53:43', '2017-06-05 15:53:43', null, '1', '1');
INSERT INTO `video_info` VALUES ('240', '811', '1', '226', '98', '09 第二单元 第五课 侵权 说课.mp4', 'resource/98/video/A698BE95E05E74CBF1435F1B167DFEFE1496649281461.mp4', '', null, null, 'mp4', '2017-06-05 15:54:46', '2017-06-05 15:54:46', null, '1', '1');
INSERT INTO `video_info` VALUES ('241', '587', '1', '226', '90', '第一节 管住嘴巴.mp4', 'resource/90/video/44C057DB12BBA55064E43C392B6A9D451496649264099.mp4', '', null, null, 'mp4', '2017-06-05 15:54:50', '2017-06-05 15:54:50', null, '1', '1');
INSERT INTO `video_info` VALUES ('242', '806', '1', '226', '98', '09 第二单元 第五课 侵权 讲课.mp4', 'resource/98/video/EA37A51A92BFDD125F5F253AE79417781496649359411.mp4', '', null, null, 'mp4', '2017-06-05 15:56:18', '2017-06-05 15:56:18', null, '1', '1');
INSERT INTO `video_info` VALUES ('243', '812', '1', '226', '98', '10 第二单元 第六课 婚姻法 讲课.mp4', 'resource/98/video/E2B7EF4DF87316EE032DB601B3AACC111496649439528.mp4', '', null, null, 'mp4', '2017-06-05 15:58:06', '2017-06-05 15:58:06', null, '1', '1');
INSERT INTO `video_info` VALUES ('244', '808', '1', '226', '98', '10 第二单元 第六课 婚姻法 说课 .mp4', 'resource/98/video/74ADA9819FBD4649C2C1CA95174A285D1496649509060.mp4', '', null, null, 'mp4', '2017-06-05 15:58:44', '2017-06-05 15:58:44', null, '1', '1');
INSERT INTO `video_info` VALUES ('245', '818', '1', '226', '98', '11 第三单元 第一课 教育权 说课.mp4', 'resource/98/video/A5128D1C78E7EC145ADEFC621AE86C731496649578032.mp4', '', null, null, 'mp4', '2017-06-05 15:59:46', '2017-06-05 15:59:46', null, '1', '1');
INSERT INTO `video_info` VALUES ('246', '588', '1', '226', '90', '第二节 管住举止.mp4', 'resource/90/video/368BBA3B56494C15E77ACB26B22431251496649584528.mp4', '', null, null, 'mp4', '2017-06-05 16:01:09', '2017-06-05 16:01:09', null, '1', '1');
INSERT INTO `video_info` VALUES ('247', '763', '1', '226', '98', '11 第三单元 第一课 教育权 讲课.mp4', 'resource/98/video/F825CE7D1E3D1B0CDC54D6FCD62B4D431496649646061.mp4', '', null, null, 'mp4', '2017-06-05 16:01:10', '2017-06-05 16:01:10', null, '1', '1');
INSERT INTO `video_info` VALUES ('248', '819', '1', '226', '98', '12 第三单元 第二课 人格权 讲课.mp4', 'resource/98/video/10B8D7DBA8860000120103D5137696C41496649751288.mp4', '', null, null, 'mp4', '2017-06-05 16:02:51', '2017-06-05 16:02:51', null, '1', '1');
INSERT INTO `video_info` VALUES ('249', '820', '1', '226', '98', '12 第三单元 第二课 人格权 说课.mp4', 'resource/98/video/F1FB10B547DC7CA8EBC98838DE66C2821496649786829.mp4', '', null, null, 'mp4', '2017-06-05 16:03:41', '2017-06-05 16:03:41', null, '1', '1');
INSERT INTO `video_info` VALUES ('250', '589', '1', '226', '90', '第三节 管住时间.mp4', 'resource/90/video/B452524AE462E7066464706A07C985381496649863249.mp4', '', null, null, 'mp4', '2017-06-05 16:05:11', '2017-06-05 16:05:11', null, '1', '1');
INSERT INTO `video_info` VALUES ('251', '822', '1', '226', '98', '13 第三单元 第三课 生命健康权 说课.mp4', 'resource/98/video/515941F149B6A86277E6721D29E4D2BE1496649914525.mp4', '', null, null, 'mp4', '2017-06-05 16:05:24', '2017-06-05 16:05:24', null, '1', '1');
INSERT INTO `video_info` VALUES ('252', '821', '1', '226', '98', '13 第三单元 第三课 生命健康权 讲课.mp4', 'resource/98/video/34EF2D528734A17733FF06B0D99C71E21496649989245.mp4', '', null, null, 'mp4', '2017-06-05 16:06:44', '2017-06-05 16:06:44', null, '1', '1');
INSERT INTO `video_info` VALUES ('253', '823', '1', '226', '98', '14 第三单元 第四课 健康饮食权 讲课.mp4', 'resource/98/video/453524FE536022E589B5BF5A14B8D511496650092244.mp4', '', null, null, 'mp4', '2017-06-05 16:08:31', '2017-06-05 16:08:31', null, '1', '1');
INSERT INTO `video_info` VALUES ('254', '824', '1', '226', '98', '14 第三单元 第四课 健康饮食权 说课.mp4', 'resource/98/video/5547242AB30EF23BF6C788FEAC2E464F1496650128150.mp4', '', null, null, 'mp4', '2017-06-05 16:09:29', '2017-06-05 16:09:29', null, '1', '1');
INSERT INTO `video_info` VALUES ('255', '590', '1', '226', '90', '第四节 管住环境.mp4', 'resource/90/video/D8C6C4BA47450E6CB5028E1A76836A21496650125341.mp4', '', null, null, 'mp4', '2017-06-05 16:09:36', '2017-06-05 16:09:36', null, '1', '1');
INSERT INTO `video_info` VALUES ('256', '826', '1', '226', '98', '15 第三单元 第五课 财产权 说课.mp4', 'resource/98/video/FF11849351385C85D1F6952D71EB87B21496650217113.mp4', '', null, null, 'mp4', '2017-06-05 16:10:25', '2017-06-05 16:10:25', null, '1', '1');
INSERT INTO `video_info` VALUES ('257', '825', '1', '226', '98', '15 第三单元 第五课 财产权 讲课.mp4', 'resource/98/video/4269B26D24B895926DBF4F071AAF282F1496650285832.mp4', '', null, null, 'mp4', '2017-06-05 16:11:45', '2017-06-05 16:11:45', null, '1', '1');
INSERT INTO `video_info` VALUES ('258', '827', '1', '226', '98', '16 第三单元 第六课 校园欺凌 讲课.mp4', 'resource/98/video/1672B0BCEF77492CD529C78CD82535251496650372143.mp4', '', null, null, 'mp4', '2017-06-05 16:13:23', '2017-06-05 16:13:23', null, '1', '1');
INSERT INTO `video_info` VALUES ('259', '591', '1', '226', '90', '第五节 管住欲望.mp4', 'resource/90/video/321C9D8259B37E03E3717B8FEAFBEF651496650245355.mp4', '', null, null, 'mp4', '2017-06-05 16:13:36', '2017-06-05 16:13:36', null, '1', '1');
INSERT INTO `video_info` VALUES ('260', '828', '1', '226', '98', '16 第三单元 第六课 校园欺凌 说课.mp4', 'resource/98/video/9FD240A2EDFF3333002CF26EA56FCDF81496650421804.mp4', '', null, null, 'mp4', '2017-06-05 16:14:22', '2017-06-05 16:14:22', null, '1', '1');
INSERT INTO `video_info` VALUES ('261', '592', '1', '226', '90', '第六节 管住手机.mp4', 'resource/90/video/2C7EB45E3920F1EA40916441D0F858CB1496650512542.mp4', '', null, null, 'mp4', '2017-06-05 16:15:24', '2017-06-05 16:15:24', null, '1', '1');
INSERT INTO `video_info` VALUES ('262', '770', '1', '226', '98', '17 第四单元 第一课 人身权 讲课.mp4', 'resource/98/video/F7931A8D4B4B1950D60EB354A07C550E1496650559444.mp4', '', null, null, 'mp4', '2017-06-05 16:16:21', '2017-06-05 16:16:21', null, '1', '1');
INSERT INTO `video_info` VALUES ('263', '829', '1', '226', '98', '17 第四单元 第一课 人身权 说课.mp4', 'resource/98/video/9222063EFFE6FA4A727EB4D9D867B24A1496650600461.mp4', '', null, null, 'mp4', '2017-06-05 16:17:01', '2017-06-05 16:17:01', null, '1', '1');
INSERT INTO `video_info` VALUES ('264', '831', '1', '226', '98', '18 第四单元 第二课  隐私权 说课.mp4', 'resource/98/video/42D1DAA99AA852C23461ED5765587CE51496650666115.mp4', '', null, null, 'mp4', '2017-06-05 16:17:51', '2017-06-05 16:17:51', null, '1', '1');
INSERT INTO `video_info` VALUES ('265', '830', '1', '226', '98', '18 第四单元 第二课 隐私权 讲课.mp4', 'resource/98/video/C1782A8B975FB19A5B6867A7EB1097321496650736122.mp4', '', null, null, 'mp4', '2017-06-05 16:19:11', '2017-06-05 16:19:11', null, '1', '1');
INSERT INTO `video_info` VALUES ('266', '593', '1', '226', '90', '第七节 管住斗殴.mp4', 'resource/90/video/1CF0A4752493BF7DB77556B765108181496650718830.mp4', '', null, null, 'mp4', '2017-06-05 16:19:22', '2017-06-05 16:19:22', null, '1', '1');
INSERT INTO `video_info` VALUES ('267', '832', '1', '226', '98', '19 第四单元 第三课 知识产权 讲课.mp4', 'resource/98/video/F2EA06F429E8E8A2FB0A363BFBC623E81496650828767.mp4', '', null, null, 'mp4', '2017-06-05 16:20:45', '2017-06-05 16:20:45', null, '1', '1');
INSERT INTO `video_info` VALUES ('268', '595', '1', '226', '90', '第一节 你是老师.mp4', 'resource/90/video/6481DA5402B5D2869DE0964B0EF608EF1496650888818.mp4', '', null, null, 'mp4', '2017-06-05 16:21:40', '2017-06-05 16:21:40', null, '1', '1');
INSERT INTO `video_info` VALUES ('269', '833', '1', '226', '98', '19 第四单元 第三课 知识产权 说课.mp4', 'resource/98/video/700047E184DD42F54D99BFF4FE8C79C01496650875110.mp4', '', null, null, 'mp4', '2017-06-05 16:21:51', '2017-06-05 16:21:51', null, '1', '1');
INSERT INTO `video_info` VALUES ('270', '835', '1', '226', '98', '20 第四单元 第四课  劳动权 说课.mp4', 'resource/98/video/8D9E95C9592BB7E8073C68B73AE12FCF1496650975474.mp4', '', null, null, 'mp4', '2017-06-05 16:23:11', '2017-06-05 16:23:11', null, '1', '1');
INSERT INTO `video_info` VALUES ('271', '596', '1', '226', '90', '第二节 你是同学.mp4', 'resource/90/video/6A1C5FB7820349EE56E78C2BCF73BF351496650985461.mp4', '', null, null, 'mp4', '2017-06-05 16:23:31', '2017-06-05 16:23:31', null, '1', '1');
INSERT INTO `video_info` VALUES ('272', '834', '1', '226', '98', '20 第四单元 第四课 劳动权 讲课.mp4', 'resource/98/video/BC07965EF24A19EBC6B2B24ECEF48FA41496651074711.mp4', '', null, null, 'mp4', '2017-06-05 16:25:07', '2017-06-05 16:25:07', null, '1', '1');
INSERT INTO `video_info` VALUES ('273', '598', '1', '226', '90', '第一节 他是福星.mp4', 'resource/90/video/D8789DFDF709CF241195E2268FD3C6661496651167816.mp4', '', null, null, 'mp4', '2017-06-05 16:26:30', '2017-06-05 16:26:30', null, '1', '1');
INSERT INTO `video_info` VALUES ('274', '836', '1', '226', '98', '21 第四单元 第五课 保险法 讲课.mp4', 'resource/98/video/BF2C8F1B03CD21DE96416C5D6CBF2421496651203679.mp4', '', null, null, 'mp4', '2017-06-05 16:27:05', '2017-06-05 16:27:05', null, '1', '1');
INSERT INTO `video_info` VALUES ('275', '837', '1', '226', '98', '21 第四单元 第五课  保险法 说课.mp4', 'resource/98/video/E4B02BD02F2BD1740030D4AC4ED5FE91496651250778.mp4', '', null, null, 'mp4', '2017-06-05 16:27:56', '2017-06-05 16:27:56', null, '1', '1');
INSERT INTO `video_info` VALUES ('276', '839', '1', '226', '98', '22 第四单元 第六课 网络法律准则 说课.mp4', 'resource/98/video/72AE6233ECB22571803585BA69A326651496651337879.mp4', '', null, null, 'mp4', '2017-06-05 16:29:34', '2017-06-05 16:29:34', null, '1', '1');
INSERT INTO `video_info` VALUES ('277', '599', '1', '226', '90', '第二节 他是灾星.mp4', 'resource/90/video/7C5A0032F60C393C69F1314850A7DEDB1496651344676.mp4', '', null, null, 'mp4', '2017-06-05 16:30:01', '2017-06-05 16:30:01', null, '1', '1');
INSERT INTO `video_info` VALUES ('278', '838', '1', '226', '98', '22 第四单元 第六课 网络法律准则 讲课.mp4', 'resource/98/video/FCB123A8C1FE46BA095181D4AF698C131496651421593.mp4', '', null, null, 'mp4', '2017-06-05 16:30:41', '2017-06-05 16:30:41', null, '1', '1');
INSERT INTO `video_info` VALUES ('279', '602', '1', '226', '90', '《弟子规》-第七章 第一节 为什么要学.mp4', 'resource/90/video/BF86A1A8B646A6D7756C504A8BCCB871496651439883.mp4', '', null, null, 'mp4', '2017-06-05 16:31:30', '2017-06-05 16:31:30', null, '1', '1');
INSERT INTO `video_info` VALUES ('280', '604', '1', '226', '90', '《弟子规》-第七章 第二节 学习没那么难.mp4', 'resource/90/video/AEDEAD42385C17D729A64669010CF32E1496651524468.mp4', '', null, null, 'mp4', '2017-06-05 16:33:03', '2017-06-05 16:33:03', null, '1', '1');
INSERT INTO `video_info` VALUES ('281', '840', '1', '226', '98', '23 第四单元 第七课 司法程序的特殊保护 讲课.mp4', 'resource/98/video/DAB94DA42948466C3C63EA470CF909761496651581007.mp4', '', null, null, 'mp4', '2017-06-05 16:33:30', '2017-06-05 16:33:30', null, '1', '1');
INSERT INTO `video_info` VALUES ('282', '841', '1', '226', '98', '23 第四单元 第七课 司法程序的特殊保护 说课.mp4', 'resource/98/video/38026A9533B98CA1E32F57249652F3931496651637928.mp4', '', null, null, 'mp4', '2017-06-05 16:34:18', '2017-06-05 16:34:18', null, '1', '1');
INSERT INTO `video_info` VALUES ('283', '847', '1', '226', '98', '24 第五单元 第一课 人身权利犯罪 说课.mp4', 'resource/98/video/62899D78AB0B68ECD17994C23E078FB61496651708902.mp4', '', null, null, 'mp4', '2017-06-05 16:35:28', '2017-06-05 16:35:28', null, '1', '1');
INSERT INTO `video_info` VALUES ('284', '779', '1', '226', '98', '24 第五单元 第一课 人身权利犯罪 讲课.mp4', 'resource/98/video/1AFC121B2EA30EC9B74FA01C1AF851401496651788511.mp4', '', null, null, 'mp4', '2017-06-05 16:37:01', '2017-06-05 16:37:01', null, '1', '1');
INSERT INTO `video_info` VALUES ('285', '848', '1', '226', '98', '25 第五单元 第二课  财产犯罪 讲课.mp4', 'resource/98/video/448FFCDDA5FABB6286F83D71827410BF1496651917246.mp4', '', null, null, 'mp4', '2017-06-05 16:38:59', '2017-06-05 16:38:59', null, '1', '1');
INSERT INTO `video_info` VALUES ('286', '849', '1', '226', '98', '25 第五单元 第二课  财产犯罪 说课.mp4', 'resource/98/video/D0D96FCE7AB3DDA2B753EC5DAAD7BBB1496651956519.mp4', '', null, null, 'mp4', '2017-06-05 16:39:47', '2017-06-05 16:39:47', null, '1', '1');
INSERT INTO `video_info` VALUES ('287', '851', '1', '226', '98', '26 第五单元 第三课 毒品犯罪 说课 .mp4', 'resource/98/video/6C86BA5503E7D7F0945E5B571956C521496652026868.mp4', '', null, null, 'mp4', '2017-06-05 16:40:32', '2017-06-05 16:40:32', null, '1', '1');
INSERT INTO `video_info` VALUES ('288', '850', '1', '226', '98', '26 第五单元 第三课 毒品犯罪 讲课.mp4', 'resource/98/video/E2984537912BD2FEA3856B4BB844D2851496652124090.mp4', '', null, null, 'mp4', '2017-06-05 16:40:52', '2017-06-05 16:40:52', null, '1', '1');
INSERT INTO `video_info` VALUES ('289', '852', '1', '226', '98', '27 第五单元 第四课 共同犯罪 讲课.mp4', 'resource/98/video/BD0692001679E88511666BD73F9338021496652193607.mp4', '', null, null, 'mp4', '2017-06-05 16:43:29', '2017-06-05 16:43:29', null, '1', '1');
INSERT INTO `video_info` VALUES ('290', '855', '1', '226', '98', '28 第五单元 第五课 犯罪预防 说课.mp4', 'resource/98/video/CF825372AAD15020F7F07D70ABB6F6751496652307350.mp4', '', null, null, 'mp4', '2017-06-05 16:45:14', '2017-06-05 16:45:14', null, '1', '1');
INSERT INTO `video_info` VALUES ('291', '854', '1', '226', '98', '28 第五单元 第五课 犯罪预防 讲课.mp4', 'resource/98/video/30BC636EB666E095108211BAC6B3E4F1496652373489.mp4', '', null, null, 'mp4', '2017-06-05 16:46:32', '2017-06-05 16:46:32', null, '1', '1');
INSERT INTO `video_info` VALUES ('292', '856', '1', '226', '98', '29 第五单元 第六课 正当防卫与紧急避险 讲课.mp4', 'resource/98/video/52832765A80D34286F0888008E3B37D51496652463879.mp4', '', null, null, 'mp4', '2017-06-05 16:48:02', '2017-06-05 16:48:02', null, '1', '1');
INSERT INTO `video_info` VALUES ('293', '857', '1', '226', '98', '29 第五单元 第六课 正当防卫与紧急避险 说课.mp4', 'resource/98/video/4CB568456BE06EA1B36B9C4A2D9AAB4F1496652501235.mp4', '', null, null, 'mp4', '2017-06-05 16:48:47', '2017-06-05 16:48:47', null, '1', '1');
INSERT INTO `video_info` VALUES ('294', '844', '1', '226', '98', '30 第六单元 第一课 契约精神 说课.mp4', 'resource/98/video/EBAB95050DF55E1547BCB95F3A00671E1496652594580.mp4', '', null, null, 'mp4', '2017-06-05 16:50:00', '2017-06-05 16:50:00', null, '1', '1');
INSERT INTO `video_info` VALUES ('295', '786', '1', '226', '98', '30 第六单元 第一课 契约精神 讲课.mp4', 'resource/98/video/DE91F0D8F507ABB6E94C008F200CF5971496652649445.mp4', '', null, null, 'mp4', '2017-06-05 16:51:55', '2017-06-05 16:51:55', null, '1', '1');
INSERT INTO `video_info` VALUES ('296', '845', '1', '226', '98', '31 第六单元 第二课 规则意识.mp4', 'resource/98/video/19FAFA76921680E76B0A71E888D126F41496652939442.mp4', '', null, null, 'mp4', '2017-06-05 16:56:10', '2017-06-05 16:56:10', null, '1', '1');
INSERT INTO `video_info` VALUES ('297', '846', '1', '226', '98', '31 第六单元 第二课 规则意识 说课.mp4', 'resource/98/video/68FF9E84DDC7D24AEA4A01ECF542B671496653010819.mp4', '', null, null, 'mp4', '2017-06-05 16:57:34', '2017-06-05 16:57:34', null, '1', '1');
INSERT INTO `video_info` VALUES ('298', '864', '1', '226', '98', '32 第六单元 第三课 中国梦 说课.mp4', 'resource/98/video/4ACE4856A21C8CD1DA3F34B2E6FECD141496653105387.mp4', '', null, null, 'mp4', '2017-06-05 16:58:33', '2017-06-05 16:58:33', null, '1', '1');
INSERT INTO `video_info` VALUES ('299', '863', '1', '226', '98', '32 第六单元 第三课 中国梦 讲课.mp4', 'resource/98/video/92AA84C54BFDA766F8A3257083BCCD2D1496653165246.mp4', '', null, null, 'mp4', '2017-06-05 17:00:06', '2017-06-05 17:00:06', null, '1', '1');
INSERT INTO `video_info` VALUES ('300', '865', '1', '226', '91', '适应新环境.mp4', 'resource/91/video/73EC45CD082E772C9E4F57BE4B28B0F41496719321755.mp4', '', null, null, 'mp4', '2017-06-06 11:22:13', '2017-06-06 11:22:13', null, '1', '1');
INSERT INTO `video_info` VALUES ('301', '866', '1', '226', '93', '绿色校园，低碳生活.mp4', 'resource/93/video/AB80C0D012BCA6F4EF1917936B605ACA1496719988936.mp4', '', null, null, 'mp4', '2017-06-06 11:36:32', '2017-06-06 11:36:32', null, '1', '1');
INSERT INTO `video_info` VALUES ('302', '853', '1', '226', '98', '27 第五单元 第四课 共同犯罪 说课.mp4', 'resource/98/video/7DAA455B33BCAD66E880AF94BF3D51F81496721091305.mp4', '', null, null, 'mp4', '2017-06-06 11:51:57', '2017-06-06 11:51:57', null, '1', '1');
INSERT INTO `video_info` VALUES ('303', '888', '1', '226', '100', '乡情篇 颂乡之情 说课.mp4', 'resource/100/video/D2023E6F7DBB07FBF7CA4F2D7889E2EA1504581336516.mp4', '', null, null, 'mp4', '2017-09-05 11:15:42', '2017-09-05 11:15:42', null, '1', '1');
INSERT INTO `video_info` VALUES ('304', '889', '1', '226', '100', '乡情篇 颂乡之情 说课.mp4', 'resource/100/video/D2023E6F7DBB07FBF7CA4F2D7889E2EA1504583868746.mp4', '', null, null, 'mp4', '2017-09-05 11:57:56', '2017-09-05 11:57:56', null, '1', '1');
INSERT INTO `video_info` VALUES ('305', '890', '1', '226', '100', '乡情篇 别乡之情 说课.mp4', 'resource/100/video/BE9B826C279358E4A26880AA3A0A48A21504583979116.mp4', '', null, null, 'mp4', '2017-09-05 11:59:44', '2017-09-05 11:59:44', null, '1', '1');
INSERT INTO `video_info` VALUES ('306', '891', '1', '226', '100', '乡情篇 别乡之情 说课.mp4', 'resource/100/video/BE9B826C279358E4A26880AA3A0A48A21504584045159.mp4', '', null, null, 'mp4', '2017-09-05 12:01:14', '2017-09-05 12:01:14', null, '1', '1');
INSERT INTO `video_info` VALUES ('307', '892', '1', '226', '100', '乡情篇 思乡之情 说课.mp4', 'resource/100/video/14275599AE777DB092BE7093B4CAB42E1504584156278.mp4', '', null, null, 'mp4', '2017-09-05 12:02:47', '2017-09-05 12:02:47', null, '1', '1');
INSERT INTO `video_info` VALUES ('308', '893', '1', '226', '100', '乡情篇 思乡之情 说课.mp4', 'resource/100/video/14275599AE777DB092BE7093B4CAB42E1504584734660.mp4', '', null, null, 'mp4', '2017-09-05 12:12:30', '2017-09-05 12:12:30', null, '1', '1');
INSERT INTO `video_info` VALUES ('309', '894', '1', '226', '100', '爱国篇 疆土之爱 说课.mp4', 'resource/100/video/D5EEE9BB79833A9ADB6436C3083E895A1504584950852.mp4', '', null, null, 'mp4', '2017-09-05 12:15:57', '2017-09-05 12:15:57', null, '1', '1');
INSERT INTO `video_info` VALUES ('310', '895', '1', '226', '100', '爱国篇 疆土之爱 说课.mp4', 'resource/100/video/D5EEE9BB79833A9ADB6436C3083E895A1504585009443.mp4', '', null, null, 'mp4', '2017-09-05 12:16:52', '2017-09-05 12:16:52', null, '1', '1');
INSERT INTO `video_info` VALUES ('311', '896', '1', '226', '100', '爱国篇 人民之爱 说课.mp4', 'resource/100/video/1746BDEC45C93602867378A7E9DFF5691504585107357.mp4', '', null, null, 'mp4', '2017-09-05 12:18:31', '2017-09-05 12:18:31', null, '1', '1');
INSERT INTO `video_info` VALUES ('312', '897', '1', '226', '100', '爱国篇 人民之爱 说课.mp4', 'resource/100/video/1746BDEC45C93602867378A7E9DFF5691504585221901.mp4', '', null, null, 'mp4', '2017-09-05 12:20:43', '2017-09-05 12:20:43', null, '1', '1');
INSERT INTO `video_info` VALUES ('313', '898', '1', '226', '100', '爱国篇 匹夫之爱 说课.mp4', 'resource/100/video/B923D1D58114280905DE14BBD51D6FB51504585339863.mp4', '', null, null, 'mp4', '2017-09-05 12:22:23', '2017-09-05 12:22:23', null, '1', '1');
INSERT INTO `video_info` VALUES ('314', '899', '1', '226', '100', '爱国篇 匹夫之爱 说课.mp4', 'resource/100/video/B923D1D58114280905DE14BBD51D6FB51504585386875.mp4', '', null, null, 'mp4', '2017-09-05 12:23:09', '2017-09-05 12:23:09', null, '1', '1');
INSERT INTO `video_info` VALUES ('315', '900', '1', '226', '100', '生命篇 生命可贵 说课.mp4', 'resource/100/video/C039E22B220354E8953E6F922AF3F4FF1504585476016.mp4', '', null, null, 'mp4', '2017-09-05 12:24:39', '2017-09-05 12:24:39', null, '1', '1');
INSERT INTO `video_info` VALUES ('316', '901', '1', '226', '100', '生命篇 生命可贵 说课.mp4', 'resource/100/video/C039E22B220354E8953E6F922AF3F4FF1504585521550.mp4', '', null, null, 'mp4', '2017-09-05 12:25:24', '2017-09-05 12:25:24', null, '1', '1');
INSERT INTO `video_info` VALUES ('317', '902', '1', '226', '100', '生命篇 惜时勤学 说课.mp4', 'resource/100/video/72C4211F9B9013EF01B82EC49E3559F51504585560217.mp4', '', null, null, 'mp4', '2017-09-05 12:26:05', '2017-09-05 12:26:05', null, '1', '1');
INSERT INTO `video_info` VALUES ('318', '903', '1', '226', '100', '生命篇 惜时勤学 说课.mp4', 'resource/100/video/72C4211F9B9013EF01B82EC49E3559F51504585630970.mp4', '', null, null, 'mp4', '2017-09-05 12:27:13', '2017-09-05 12:27:13', null, '1', '1');
INSERT INTO `video_info` VALUES ('319', '904', '1', '226', '100', '生命篇 生命绽放 说课.mp4', 'resource/100/video/ECA2E73555BE3611003F7971E759F45E1504585683874.mp4', '', null, null, 'mp4', '2017-09-05 12:28:07', '2017-09-05 12:28:07', null, '1', '1');
INSERT INTO `video_info` VALUES ('320', '905', '1', '226', '100', '生命篇 生命绽放 说课.mp4', 'resource/100/video/ECA2E73555BE3611003F7971E759F45E1504585737247.mp4', '', null, null, 'mp4', '2017-09-05 12:28:59', '2017-09-05 12:28:59', null, '1', '1');
INSERT INTO `video_info` VALUES ('321', '906', '1', '226', '100', '感恩篇 以孝事亲 说课.mp4', 'resource/100/video/350D5BB8E147408DE60EEC87188281BD1504585782169.mp4', '', null, null, 'mp4', '2017-09-05 12:29:45', '2017-09-05 12:29:45', null, '1', '1');
INSERT INTO `video_info` VALUES ('322', '907', '1', '226', '100', '感恩篇 以孝事亲 说课.mp4', 'resource/100/video/350D5BB8E147408DE60EEC87188281BD1504585826686.mp4', '', null, null, 'mp4', '2017-09-05 12:30:33', '2017-09-05 12:30:33', null, '1', '1');
INSERT INTO `video_info` VALUES ('323', '908', '1', '226', '100', '感恩篇 亲师信道 说课.mp4', 'resource/100/video/D62B902DF0C4E6D7FDE28A4DD0513AF61504585871679.mp4', '', null, null, 'mp4', '2017-09-05 12:31:15', '2017-09-05 12:31:15', null, '1', '1');
INSERT INTO `video_info` VALUES ('324', '909', '1', '226', '100', '感恩篇 亲师信道 说课.mp4', 'resource/100/video/D62B902DF0C4E6D7FDE28A4DD0513AF61504585913001.mp4', '', null, null, 'mp4', '2017-09-05 12:31:55', '2017-09-05 12:31:55', null, '1', '1');
INSERT INTO `video_info` VALUES ('325', '910', '1', '226', '100', '国学经典.mp4', 'resource/100/video/E56014628B5987A3B3DB40D5FAE64BC51504586172716.mp4', '', null, null, 'mp4', '2017-09-05 12:36:15', '2017-09-05 12:36:15', null, '1', '1');
INSERT INTO `video_info` VALUES ('326', '911', '1', '226', '100', '国学经典.mp4', 'resource/100/video/E56014628B5987A3B3DB40D5FAE64BC51504586219285.mp4', '', null, null, 'mp4', '2017-09-05 12:37:01', '2017-09-05 12:37:01', null, '1', '1');
INSERT INTO `video_info` VALUES ('327', '912', '1', '226', '100', '修德篇 个人品德 说课.mp4', 'resource/100/video/C84B00B1CE7543FE6D8675D2CDA4BA241504586351886.mp4', '', null, null, 'mp4', '2017-09-05 12:39:15', '2017-09-05 12:39:15', null, '1', '1');
INSERT INTO `video_info` VALUES ('328', '913', '1', '226', '100', '修德篇 个人品德 说课.mp4', 'resource/100/video/C84B00B1CE7543FE6D8675D2CDA4BA241504586396035.mp4', '', null, null, 'mp4', '2017-09-05 12:39:59', '2017-09-05 12:39:59', null, '1', '1');
INSERT INTO `video_info` VALUES ('329', '914', '1', '226', '100', '修德篇 家庭美德 说课.mp4', 'resource/100/video/D0D6F6FBA28EE7F0F45E2DB8B8B396F01504586457612.mp4', '', null, null, 'mp4', '2017-09-05 12:41:00', '2017-09-05 12:41:00', null, '1', '1');
INSERT INTO `video_info` VALUES ('330', '915', '1', '226', '100', '修德篇 家庭美德 说课.mp4', 'resource/100/video/D0D6F6FBA28EE7F0F45E2DB8B8B396F01504586498866.mp4', '', null, null, 'mp4', '2017-09-05 12:41:43', '2017-09-05 12:41:43', null, '1', '1');
INSERT INTO `video_info` VALUES ('331', '916', '1', '226', '100', '修德篇 交往之德 说课.mp4', 'resource/100/video/C1F4E19DB71561AB00C903D7F8820D191504586533752.mp4', '', null, null, 'mp4', '2017-09-05 12:42:16', '2017-09-05 12:42:16', null, '1', '1');
INSERT INTO `video_info` VALUES ('332', '917', '1', '226', '100', '修德篇 交往之德 说课.mp4', 'resource/100/video/C1F4E19DB71561AB00C903D7F8820D191504586571844.mp4', '', null, null, 'mp4', '2017-09-05 12:42:54', '2017-09-05 12:42:54', null, '1', '1');
INSERT INTO `video_info` VALUES ('333', '918', '1', '226', '100', '立志篇 读书之志 说课.mp4', 'resource/100/video/ED1D957BA1C233E1814B7B589373EAC81504586633692.mp4', '', null, null, 'mp4', '2017-09-05 12:43:57', '2017-09-05 12:43:57', null, '1', '1');
INSERT INTO `video_info` VALUES ('334', '919', '1', '226', '100', '立志篇 读书之志 说课.mp4', 'resource/100/video/ED1D957BA1C233E1814B7B589373EAC81504586673402.mp4', '', null, null, 'mp4', '2017-09-05 12:44:36', '2017-09-05 12:44:36', null, '1', '1');
INSERT INTO `video_info` VALUES ('335', '920', '1', '226', '100', '立志篇 立业之志 说课.mp4', 'resource/100/video/4F8986385C7A067F08C340F6ACECCD751504586751383.mp4', '', null, null, 'mp4', '2017-09-05 12:45:54', '2017-09-05 12:45:54', null, '1', '1');
INSERT INTO `video_info` VALUES ('336', '921', '1', '226', '100', '立志篇 立业之志 说课.mp4', 'resource/100/video/4F8986385C7A067F08C340F6ACECCD751504586792482.mp4', '', null, null, 'mp4', '2017-09-05 12:46:35', '2017-09-05 12:46:35', null, '1', '1');
INSERT INTO `video_info` VALUES ('337', '922', '1', '226', '100', '立志篇 报国之志 说课.mp4', 'resource/100/video/40ABE9F8D74C1B73908BA495EB527EB51504586836553.mp4', '', null, null, 'mp4', '2017-09-05 12:47:19', '2017-09-05 12:47:19', null, '1', '1');
INSERT INTO `video_info` VALUES ('338', '923', '1', '226', '100', '立志篇 报国之志 说课.mp4', 'resource/100/video/40ABE9F8D74C1B73908BA495EB527EB51504586879676.mp4', '', null, null, 'mp4', '2017-09-05 12:48:02', '2017-09-05 12:48:02', null, '1', '1');
INSERT INTO `video_info` VALUES ('339', '924', '1', '226', '100', '礼仪篇 政治之礼 说课.mp4', 'resource/100/video/463F402070F7746F645B26C82DC14D701504625689581.mp4', '', null, null, 'mp4', '2017-09-05 23:34:52', '2017-09-05 23:34:52', null, '1', '1');
INSERT INTO `video_info` VALUES ('340', '925', '1', '226', '100', '礼仪篇 政治之礼 说课.mp4', 'resource/100/video/463F402070F7746F645B26C82DC14D701504625746667.mp4', '', null, null, 'mp4', '2017-09-05 23:35:50', '2017-09-05 23:35:50', null, '1', '1');
INSERT INTO `video_info` VALUES ('341', '926', '1', '226', '100', '礼仪篇 生活之礼 说课.mp4', 'resource/100/video/23BF8CAF414F1F9850D7F72E507A6DD1504625786075.mp4', '', null, null, 'mp4', '2017-09-05 23:36:30', '2017-09-05 23:36:30', null, '1', '1');
INSERT INTO `video_info` VALUES ('342', '927', '1', '226', '100', '礼仪篇 生活之礼 说课.mp4', 'resource/100/video/23BF8CAF414F1F9850D7F72E507A6DD1504625837620.mp4', '', null, null, 'mp4', '2017-09-05 23:37:26', '2017-09-05 23:37:26', null, '1', '1');
INSERT INTO `video_info` VALUES ('343', '928', '1', '226', '100', '礼仪篇 个人之礼 说课.mp4', 'resource/100/video/2D8DCE338C38A6D8EE595B11229BF61F1504625912594.mp4', '', null, null, 'mp4', '2017-09-05 23:38:39', '2017-09-05 23:38:39', null, '1', '1');
INSERT INTO `video_info` VALUES ('344', '929', '1', '226', '100', '礼仪篇 个人之礼 说课.mp4', 'resource/100/video/2D8DCE338C38A6D8EE595B11229BF61F1504625960702.mp4', '', null, null, 'mp4', '2017-09-05 23:39:27', '2017-09-05 23:39:27', null, '1', '1');
INSERT INTO `video_info` VALUES ('345', '930', '1', '226', '100', '仁爱篇 仁爱之心 说课.mp4', 'resource/100/video/94333E2F7C1A27C88206A67D2B6BE9411504626029518.mp4', '', null, null, 'mp4', '2017-09-05 23:40:38', '2017-09-05 23:40:38', null, '1', '1');
INSERT INTO `video_info` VALUES ('346', '931', '1', '226', '100', '仁爱篇 仁爱之心 说课.mp4', 'resource/100/video/94333E2F7C1A27C88206A67D2B6BE9411504626077319.mp4', '', null, null, 'mp4', '2017-09-05 23:41:20', '2017-09-05 23:41:20', null, '1', '1');
INSERT INTO `video_info` VALUES ('347', '932', '1', '226', '100', '国学经典.mp4', 'resource/100/video/E56014628B5987A3B3DB40D5FAE64BC51504626168886.mp4', '', null, null, 'mp4', '2017-09-05 23:42:51', '2017-09-05 23:42:51', null, '1', '1');
INSERT INTO `video_info` VALUES ('348', '933', '1', '226', '100', '国学经典.mp4', 'resource/100/video/E56014628B5987A3B3DB40D5FAE64BC51504626292859.mp4', '', null, null, 'mp4', '2017-09-05 23:44:59', '2017-09-05 23:44:59', null, '1', '1');
INSERT INTO `video_info` VALUES ('349', '934', '1', '226', '100', '国学经典.mp4', 'resource/100/video/E56014628B5987A3B3DB40D5FAE64BC51504626651876.mp4', '', null, null, 'mp4', '2017-09-05 23:51:07', '2017-09-05 23:51:07', null, '1', '1');
INSERT INTO `video_info` VALUES ('350', '935', '1', '226', '100', '国学经典.mp4', 'resource/100/video/E56014628B5987A3B3DB40D5FAE64BC51504626713901.mp4', '', null, null, 'mp4', '2017-09-05 23:52:01', '2017-09-05 23:52:01', null, '1', '1');
INSERT INTO `video_info` VALUES ('351', '936', '1', '226', '100', '仁爱篇 众人之爱 说课.mp4', 'resource/100/video/A4EC3B390856C0254FE69053A2CCCE141504626786453.mp4', '', null, null, 'mp4', '2017-09-05 23:53:20', '2017-09-05 23:53:20', null, '1', '1');
INSERT INTO `video_info` VALUES ('352', '937', '1', '226', '100', '仁爱篇 众人之爱 说课.mp4', 'resource/100/video/A4EC3B390856C0254FE69053A2CCCE141504626836021.mp4', '', null, null, 'mp4', '2017-09-05 23:53:59', '2017-09-05 23:53:59', null, '1', '1');
INSERT INTO `video_info` VALUES ('353', '938', '1', '226', '100', '仁爱篇 万物之爱 说课.mp4', 'resource/100/video/86C81AAAD707276902821E5E049CB2361504626875335.mp4', '', null, null, 'mp4', '2017-09-05 23:54:39', '2017-09-05 23:54:39', null, '1', '1');
INSERT INTO `video_info` VALUES ('354', '939', '1', '226', '100', '仁爱篇 万物之爱 说课.mp4', 'resource/100/video/86C81AAAD707276902821E5E049CB2361504626917262.mp4', '', null, null, 'mp4', '2017-09-05 23:55:38', '2017-09-05 23:55:38', null, '1', '1');
INSERT INTO `video_info` VALUES ('355', '940', '1', '226', '100', '技艺篇 利在千秋 说课.mp4', 'resource/100/video/CA67382B92BBF46CDC1EA6F9F644913A1504626980839.mp4', '', null, null, 'mp4', '2017-09-05 23:56:32', '2017-09-05 23:56:32', null, '1', '1');
INSERT INTO `video_info` VALUES ('356', '941', '1', '226', '100', '技艺篇 利在千秋 说课.mp4', 'resource/100/video/CA67382B92BBF46CDC1EA6F9F644913A1504627035169.mp4', '', null, null, 'mp4', '2017-09-05 23:57:27', '2017-09-05 23:57:27', null, '1', '1');
INSERT INTO `video_info` VALUES ('357', '942', '1', '226', '100', '技艺篇 巧夺天工 说课.mp4', 'resource/100/video/5394F4981E3567032268EF22F9383E1B1504627143909.mp4', '', null, null, 'mp4', '2017-09-05 23:59:12', '2017-09-05 23:59:12', null, '1', '1');
INSERT INTO `video_info` VALUES ('358', '943', '1', '226', '100', '技艺篇 巧夺天工 说课.mp4', 'resource/100/video/5394F4981E3567032268EF22F9383E1B1504627192341.mp4', '', null, null, 'mp4', '2017-09-06 00:00:05', '2017-09-06 00:00:05', null, '1', '1');
INSERT INTO `video_info` VALUES ('359', '944', '1', '226', '100', '国学经典.mp4', 'resource/100/video/E56014628B5987A3B3DB40D5FAE64BC51504627324788.mp4', '', null, null, 'mp4', '2017-09-06 00:02:07', '2017-09-06 00:02:07', null, '1', '1');
INSERT INTO `video_info` VALUES ('360', '945', '1', '226', '100', '国学经典.mp4', 'resource/100/video/E56014628B5987A3B3DB40D5FAE64BC51504627386170.mp4', '', null, null, 'mp4', '2017-09-06 00:03:39', '2017-09-06 00:03:39', null, '1', '1');
INSERT INTO `video_info` VALUES ('361', '946', '1', '226', '100', '诚信篇 诚信之重 说课.mp4', 'resource/100/video/89A4BF4201F6B2555D1DD5CC893ECC141504627461673.mp4', '', null, null, 'mp4', '2017-09-06 00:04:38', '2017-09-06 00:04:38', null, '1', '1');
INSERT INTO `video_info` VALUES ('362', '947', '1', '226', '100', '诚信篇 诚信之重 说课.mp4', 'resource/100/video/89A4BF4201F6B2555D1DD5CC893ECC141504627519275.mp4', '', null, null, 'mp4', '2017-09-06 00:05:21', '2017-09-06 00:05:21', null, '1', '1');
INSERT INTO `video_info` VALUES ('363', '948', '1', '226', '100', '诚信篇 诚信立人 说课.mp4', 'resource/100/video/A30A9B5DE2374BBC4F54F61D66B2B10D1504627575444.mp4', '', null, null, 'mp4', '2017-09-06 00:06:22', '2017-09-06 00:06:22', null, '1', '1');
INSERT INTO `video_info` VALUES ('364', '949', '1', '226', '100', '诚信篇 诚信立人 说课.mp4', 'resource/100/video/A30A9B5DE2374BBC4F54F61D66B2B10D1504627698910.mp4', '', null, null, 'mp4', '2017-09-06 00:08:41', '2017-09-06 00:08:41', null, '1', '1');
INSERT INTO `video_info` VALUES ('365', '950', '1', '226', '100', '诚信篇 诚信立业 说课.mp4', 'resource/100/video/58493CA6D5990582F8153834D84851501504627752683.mp4', '', null, null, 'mp4', '2017-09-06 00:09:16', '2017-09-06 00:09:16', null, '1', '1');
INSERT INTO `video_info` VALUES ('366', '951', '1', '226', '100', '诚信篇 诚信立业 说课.mp4', 'resource/100/video/58493CA6D5990582F8153834D84851501504627798096.mp4', '', null, null, 'mp4', '2017-09-06 00:10:17', '2017-09-06 00:10:17', null, '1', '1');
INSERT INTO `video_info` VALUES ('367', '987', '1', '226', '100', '国学经典.mp4', 'resource/100/video/E56014628B5987A3B3DB40D5FAE64BC51504628562251.mp4', '', null, null, 'mp4', '2017-09-06 00:22:54', '2017-09-06 00:22:54', null, '1', '1');
INSERT INTO `video_info` VALUES ('368', '988', '1', '226', '100', '国学经典.mp4', 'resource/100/video/E56014628B5987A3B3DB40D5FAE64BC51504628635408.mp4', '', null, null, 'mp4', '2017-09-06 00:24:02', '2017-09-06 00:24:02', null, '1', '1');
INSERT INTO `video_info` VALUES ('369', '989', '1', '226', '100', '规则篇 职场之规 说课.mp4', 'resource/100/video/2CE591CB17645EB9C5B21AC89E6BE94F1504628813624.mp4', '', null, null, 'mp4', '2017-09-06 00:26:56', '2017-09-06 00:26:56', null, '1', '1');
INSERT INTO `video_info` VALUES ('370', '990', '1', '226', '100', '规则篇 职场之规 说课.mp4', 'resource/100/video/2CE591CB17645EB9C5B21AC89E6BE94F1504628853239.mp4', '', null, null, 'mp4', '2017-09-06 00:27:38', '2017-09-06 00:27:38', null, '1', '1');
INSERT INTO `video_info` VALUES ('371', '991', '1', '226', '100', '规则篇 社会之规 说课.mp4', 'resource/100/video/C0E91A75AAE892B3D640B05D1DBEC7B51504628896639.mp4', '', null, null, 'mp4', '2017-09-06 00:28:20', '2017-09-06 00:28:20', null, '1', '1');
INSERT INTO `video_info` VALUES ('372', '992', '1', '226', '100', '规则篇 社会之规 说课.mp4', 'resource/100/video/C0E91A75AAE892B3D640B05D1DBEC7B51504628936011.mp4', '', null, null, 'mp4', '2017-09-06 00:29:10', '2017-09-06 00:29:10', null, '1', '1');
INSERT INTO `video_info` VALUES ('373', '952', '1', '226', '100', '责任篇 责任之心 说课.mp4', 'resource/100/video/4719CA6BB601C0622A7B5C281BD3EF731504628980750.mp4', '', null, null, 'mp4', '2017-09-06 00:29:44', '2017-09-06 00:29:44', null, '1', '1');
INSERT INTO `video_info` VALUES ('374', '953', '1', '226', '100', '责任篇 责任之心 说课.mp4', 'resource/100/video/4719CA6BB601C0622A7B5C281BD3EF731504629056909.mp4', '', null, null, 'mp4', '2017-09-06 00:31:01', '2017-09-06 00:31:01', null, '1', '1');
INSERT INTO `video_info` VALUES ('375', '954', '1', '226', '100', '责任篇 善于负责 说课.mp4', 'resource/100/video/23981F6A0EC135BBDC46B48344EA9A9B1504629104961.mp4', '', null, null, 'mp4', '2017-09-06 00:31:48', '2017-09-06 00:31:48', null, '1', '1');
INSERT INTO `video_info` VALUES ('376', '955', '1', '226', '100', '责任篇 善于负责 说课.mp4', 'resource/100/video/23981F6A0EC135BBDC46B48344EA9A9B1504629150593.mp4', '', null, null, 'mp4', '2017-09-06 00:32:35', '2017-09-06 00:32:35', null, '1', '1');
INSERT INTO `video_info` VALUES ('377', '956', '1', '226', '100', '国学经典.mp4', 'resource/100/video/E56014628B5987A3B3DB40D5FAE64BC51504629203747.mp4', '', null, null, 'mp4', '2017-09-06 00:33:26', '2017-09-06 00:33:26', null, '1', '1');
INSERT INTO `video_info` VALUES ('378', '957', '1', '226', '100', '国学经典.mp4', 'resource/100/video/E56014628B5987A3B3DB40D5FAE64BC51504629246605.mp4', '', null, null, 'mp4', '2017-09-06 00:34:12', '2017-09-06 00:34:12', null, '1', '1');
INSERT INTO `video_info` VALUES ('379', '958', '1', '226', '100', '敬业篇 敬业爱岗 说课.mp4', 'resource/100/video/8CF91CC47001EB871635E10F123332D81504629376746.mp4', '', null, null, 'mp4', '2017-09-06 00:36:21', '2017-09-06 00:36:21', null, '1', '1');
INSERT INTO `video_info` VALUES ('380', '959', '1', '226', '100', '敬业篇 敬业爱岗 说课.mp4', 'resource/100/video/8CF91CC47001EB871635E10F123332D81504629453917.mp4', '', null, null, 'mp4', '2017-09-06 00:37:36', '2017-09-06 00:37:36', null, '1', '1');
INSERT INTO `video_info` VALUES ('381', '960', '1', '226', '100', '敬业篇 敬业乐群 说课.mp4', 'resource/100/video/F36C1B1553F2F6A17F3E7AD253393FB61504629486653.mp4', '', null, null, 'mp4', '2017-09-06 00:38:09', '2017-09-06 00:38:09', null, '1', '1');
INSERT INTO `video_info` VALUES ('382', '961', '1', '226', '100', '敬业篇 敬业乐群 说课.mp4', 'resource/100/video/F36C1B1553F2F6A17F3E7AD253393FB61504629534662.mp4', '', null, null, 'mp4', '2017-09-06 00:38:58', '2017-09-06 00:38:58', null, '1', '1');
INSERT INTO `video_info` VALUES ('383', '962', '1', '226', '100', '敬业篇 敬业奉献 说课.mp4', 'resource/100/video/F3CA29E217ABF2000C806B71C9F859631504629617055.mp4', '', null, null, 'mp4', '2017-09-06 00:40:20', '2017-09-06 00:40:20', null, '1', '1');
INSERT INTO `video_info` VALUES ('384', '963', '1', '226', '100', '敬业篇 敬业奉献 说课.mp4', 'resource/100/video/F3CA29E217ABF2000C806B71C9F859631504629678792.mp4', '', null, null, 'mp4', '2017-09-06 00:41:24', '2017-09-06 00:41:24', null, '1', '1');
INSERT INTO `video_info` VALUES ('385', '964', '1', '226', '100', '意志篇 知行合一 说课.mp4', 'resource/100/video/BCC24852D46C7C710C468CA00FC806F91504629716534.mp4', '', null, null, 'mp4', '2017-09-06 00:42:08', '2017-09-06 00:42:08', null, '1', '1');
INSERT INTO `video_info` VALUES ('386', '965', '1', '226', '100', '意志篇 知行合一 说课.mp4', 'resource/100/video/BCC24852D46C7C710C468CA00FC806F91504629769134.mp4', '', null, null, 'mp4', '2017-09-06 00:43:00', '2017-09-06 00:43:00', null, '1', '1');
INSERT INTO `video_info` VALUES ('387', '966', '1', '226', '100', '意志篇 自强不息 说课.mp4', 'resource/100/video/C0AA2A8D32320803A5AE5C19F23819931504629805675.mp4', '', null, null, 'mp4', '2017-09-06 00:43:28', '2017-09-06 00:43:28', null, '1', '1');
INSERT INTO `video_info` VALUES ('388', '967', '1', '226', '100', '意志篇 自强不息 说课.mp4', 'resource/100/video/C0AA2A8D32320803A5AE5C19F23819931504629855373.mp4', '', null, null, 'mp4', '2017-09-06 00:44:20', '2017-09-06 00:44:20', null, '1', '1');
INSERT INTO `video_info` VALUES ('389', '968', '1', '226', '100', '意志篇 持之以恒 说课 .mp4', 'resource/100/video/4EA93917D22E5CEC30F3D5F70C219DDE1504629888420.mp4', '', null, null, 'mp4', '2017-09-06 00:44:54', '2017-09-06 00:44:54', null, '1', '1');
INSERT INTO `video_info` VALUES ('390', '969', '1', '226', '100', '意志篇 持之以恒 说课 .mp4', 'resource/100/video/4EA93917D22E5CEC30F3D5F70C219DDE1504629934117.mp4', '', null, null, 'mp4', '2017-09-06 00:45:39', '2017-09-06 00:45:39', null, '1', '1');
INSERT INTO `video_info` VALUES ('391', '970', '1', '226', '100', '廉洁篇 一心为民 说课 .mp4', 'resource/100/video/2FF836079B3DB8B6511F01062716B2D81504629975065.mp4', '', null, null, 'mp4', '2017-09-06 00:46:25', '2017-09-06 00:46:25', null, '1', '1');
INSERT INTO `video_info` VALUES ('392', '971', '1', '226', '100', '廉洁篇 一心为民 说课 .mp4', 'resource/100/video/2FF836079B3DB8B6511F01062716B2D81504630020873.mp4', '', null, null, 'mp4', '2017-09-06 00:47:05', '2017-09-06 00:47:05', null, '1', '1');
INSERT INTO `video_info` VALUES ('393', '972', '1', '226', '100', '廉洁篇 大公无私 说课.mp4', 'resource/100/video/A23BACC6A60582BE5211682890487C011504630053698.mp4', '', null, null, 'mp4', '2017-09-06 00:47:39', '2017-09-06 00:47:39', null, '1', '1');
INSERT INTO `video_info` VALUES ('394', '973', '1', '226', '100', '廉洁篇 大公无私 说课.mp4', 'resource/100/video/A23BACC6A60582BE5211682890487C011504630107690.mp4', '', null, null, 'mp4', '2017-09-06 00:48:33', '2017-09-06 00:48:33', null, '1', '1');
INSERT INTO `video_info` VALUES ('395', '974', '1', '226', '100', '廉洁篇 公正刚直 说课.mp4', 'resource/100/video/36AED778F3406D4C4AA26F12421CA7161504630179251.mp4', '', null, null, 'mp4', '2017-09-06 00:49:43', '2017-09-06 00:49:43', null, '1', '1');
INSERT INTO `video_info` VALUES ('396', '975', '1', '226', '100', '廉洁篇 公正刚直 说课.mp4', 'resource/100/video/36AED778F3406D4C4AA26F12421CA7161504630225824.mp4', '', null, null, 'mp4', '2017-09-06 00:50:30', '2017-09-06 00:50:30', null, '1', '1');
INSERT INTO `video_info` VALUES ('397', '976', '1', '226', '100', '环保篇 道法自然 说课.mp4', 'resource/100/video/89EDA2476CE00ED5465F423A0ADBBC571504630260737.mp4', '', null, null, 'mp4', '2017-09-06 00:51:03', '2017-09-06 00:51:03', null, '1', '1');
INSERT INTO `video_info` VALUES ('398', '977', '1', '226', '100', '环保篇 道法自然 说课.mp4', 'resource/100/video/89EDA2476CE00ED5465F423A0ADBBC571504630298567.mp4', '', null, null, 'mp4', '2017-09-06 00:51:41', '2017-09-06 00:51:41', null, '1', '1');
INSERT INTO `video_info` VALUES ('399', '978', '1', '226', '100', '环保篇 环保轶事 说课.mp4', 'resource/100/video/22E4291CE1FDD37461B3DBD785589DC31504630335184.mp4', '', null, null, 'mp4', '2017-09-06 00:52:25', '2017-09-06 00:52:25', null, '1', '1');
INSERT INTO `video_info` VALUES ('400', '979', '1', '226', '100', '环保篇 环保轶事 说课.mp4', 'resource/100/video/22E4291CE1FDD37461B3DBD785589DC31504630390349.mp4', '', null, null, 'mp4', '2017-09-06 00:53:22', '2017-09-06 00:53:22', null, '1', '1');
INSERT INTO `video_info` VALUES ('401', '980', '1', '226', '100', '环保篇 低碳节俭 说课.mp4', 'resource/100/video/6544A2BD85C93BE1ABD94EA587B4429C1504630430074.mp4', '', null, null, 'mp4', '2017-09-06 00:53:53', '2017-09-06 00:53:53', null, '1', '1');
INSERT INTO `video_info` VALUES ('402', '981', '1', '226', '100', '环保篇 低碳节俭 说课.mp4', 'resource/100/video/6544A2BD85C93BE1ABD94EA587B4429C1504630477963.mp4', '', null, null, 'mp4', '2017-09-06 00:54:50', '2017-09-06 00:54:50', null, '1', '1');
INSERT INTO `video_info` VALUES ('403', '982', '1', '226', '100', '安全篇 未雨绸缪 说课.mp4', 'resource/100/video/2D868D223562905CC97AFF4EFA5B157B1504630558338.mp4', '', null, null, 'mp4', '2017-09-06 00:56:07', '2017-09-06 00:56:07', null, '1', '1');
INSERT INTO `video_info` VALUES ('404', '983', '1', '226', '100', '安全篇 未雨绸缪 说课.mp4', 'resource/100/video/2D868D223562905CC97AFF4EFA5B157B1504630633338.mp4', '', null, null, 'mp4', '2017-09-06 00:57:33', '2017-09-06 00:57:33', null, '1', '1');
INSERT INTO `video_info` VALUES ('405', '984', '1', '226', '100', '安全篇 亡羊补牢 说课.mp4', 'resource/100/video/A0C043293827019E9F062B35AB09142B1504630681039.mp4', '', null, null, 'mp4', '2017-09-06 00:58:03', '2017-09-06 00:58:03', null, '1', '1');
INSERT INTO `video_info` VALUES ('406', '985', '1', '226', '100', '安全篇 亡羊补牢 说课.mp4', 'resource/100/video/A0C043293827019E9F062B35AB09142B1504630736205.mp4', '', null, null, 'mp4', '2017-09-06 00:58:59', '2017-09-06 00:58:59', null, '1', '1');
INSERT INTO `video_info` VALUES ('407', '1018', '1', '226', '102', 'rjjwsk.mp4', 'resource/102/video/E06A290DE6AFEB0C6E2404D99E72B2761504634073344.mp4', '', null, null, 'mp4', '2017-09-06 01:54:38', '2017-09-06 01:54:38', null, '1', '1');
INSERT INTO `video_info` VALUES ('408', '1019', '1', '226', '102', 'rsxlzxsk.mp4', 'resource/102/video/7DEB27E6A57BC781774C41B5761DE8EB1504634244379.mp4', '', null, null, 'mp4', '2017-09-06 01:57:26', '2017-09-06 01:57:26', null, '1', '1');
INSERT INTO `video_info` VALUES ('409', '1020', '1', '226', '102', 'rszwsk.mp4', 'resource/102/video/65AF77AB5B2974FFF2592DF4703E4FC81504634281213.mp4', '', null, null, 'mp4', '2017-09-06 01:58:05', '2017-09-06 01:58:05', null, '1', '1');
INSERT INTO `video_info` VALUES ('410', '1021', '1', '226', '102', 'jdxlkcsk.mp4', 'resource/102/video/48B6D5EA7FDAC11C78499793D45219231504634313390.mp4', '', null, null, 'mp4', '2017-09-06 01:58:36', '2017-09-06 01:58:36', null, '1', '1');
INSERT INTO `video_info` VALUES ('411', '1022', '1', '226', '102', 'byydwsk.mp4', 'resource/102/video/204900D344BB0C94732E935DB71CA6C01504634344907.mp4', '', null, null, 'mp4', '2017-09-06 01:59:07', '2017-09-06 01:59:07', null, '1', '1');
INSERT INTO `video_info` VALUES ('412', '1023', '1', '226', '102', 'czsk.mp4', 'resource/102/video/F38A907F6462CE12CDFB60E16A4ADEA01504634376477.mp4', '', null, null, 'mp4', '2017-09-06 01:59:38', '2017-09-06 01:59:38', null, '1', '1');
INSERT INTO `video_info` VALUES ('413', '1024', '1', '226', '102', 'yygtsk.mp4', 'resource/102/video/CDC239CF3BDAB1FB7DE0BACF109ABAA11504634403920.mp4', '', null, null, 'mp4', '2017-09-06 02:00:05', '2017-09-06 02:00:05', null, '1', '1');
INSERT INTO `video_info` VALUES ('414', '1025', '1', '226', '102', 'a87d205d71734f8b9f3f501fc1fa532b.mp4', 'resource/102/video/B974647F15149BEBFDDCD957614414901504634432530.mp4', '', null, null, 'mp4', '2017-09-06 02:00:34', '2017-09-06 02:00:34', null, '1', '1');
INSERT INTO `video_info` VALUES ('415', '1026', '1', '226', '102', 'xxffsk.mp4', 'resource/102/video/96015B6817FC00B769F184FD3E582F61504634459858.mp4', '', null, null, 'mp4', '2017-09-06 02:01:01', '2017-09-06 02:01:01', null, '1', '1');
INSERT INTO `video_info` VALUES ('416', '1027', '1', '226', '102', 'sjglsk.mp4', 'resource/102/video/54C2B8F6F3CE8922DB89982540B49E011504634485746.mp4', '', null, null, 'mp4', '2017-09-06 02:01:27', '2017-09-06 02:01:27', null, '1', '1');
INSERT INTO `video_info` VALUES ('417', '200', '1', '226', '85', '职业与职业的种类.mp4', 'resource/85/video/6D1A76BADA11137562737BB2156E55451504719721808.mp4', '', null, null, 'mp4', '2017-09-07 01:47:11', '2017-09-07 01:47:11', null, '1', '1');
INSERT INTO `video_info` VALUES ('418', '202', '1', '226', '85', '职业与职业的种类（说课）.mp4', 'resource/85/video/6D1A76BADA11137562737BB2156E55451504720069266.mp4', '', null, null, 'mp4', '2017-09-07 01:48:07', '2017-09-07 01:48:07', null, '1', '1');
INSERT INTO `video_info` VALUES ('419', '201', '1', '226', '85', '职业与我（职业理想及其作用）.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504720125825.mp4', '', null, null, 'mp4', '2017-09-07 01:48:51', '2017-09-07 01:48:51', null, '1', '1');
INSERT INTO `video_info` VALUES ('420', '203', '1', '226', '85', '职业与我（职业理想及其作用）（说课）.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504720158781.mp4', '', null, null, 'mp4', '2017-09-07 01:49:40', '2017-09-07 01:49:40', null, '1', '1');
INSERT INTO `video_info` VALUES ('421', '205', '1', '226', '85', '企业对从业者的基本要求.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504720209150.mp4', '', null, null, 'mp4', '2017-09-07 01:50:14', '2017-09-07 01:50:14', null, '1', '1');
INSERT INTO `video_info` VALUES ('422', '206', '1', '226', '85', '1. 企业对从业者的基本要求（说课）.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504720240994.mp4', '', null, null, 'mp4', '2017-09-07 01:51:06', '2017-09-07 01:51:06', null, '1', '1');
INSERT INTO `video_info` VALUES ('423', '207', '1', '226', '85', '2. 规则意识.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504720541396.mp4', '', null, null, 'mp4', '2017-09-07 01:55:47', '2017-09-07 01:55:47', null, '1', '1');
INSERT INTO `video_info` VALUES ('424', '208', '1', '226', '85', '2. 规则意识（说课）.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504720571238.mp4', '', null, null, 'mp4', '2017-09-07 01:56:34', '2017-09-07 01:56:34', null, '1', '1');
INSERT INTO `video_info` VALUES ('425', '209', '1', '226', '85', '3. 责任与服务意识.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504720701024.mp4', '', null, null, 'mp4', '2017-09-07 01:58:24', '2017-09-07 01:58:24', null, '1', '1');
INSERT INTO `video_info` VALUES ('426', '210', '1', '226', '85', '3. 责任与服务意识（说课）.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504720739426.mp4', '', null, null, 'mp4', '2017-09-07 02:00:08', '2017-09-07 02:00:08', null, '1', '1');
INSERT INTO `video_info` VALUES ('427', '211', '1', '226', '85', '4. 沟通与合作意识.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504720831635.mp4', '', null, null, 'mp4', '2017-09-07 02:00:52', '2017-09-07 02:00:52', null, '1', '1');
INSERT INTO `video_info` VALUES ('428', '212', '1', '226', '85', '4. 沟通与合作意识（说课）.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504720876788.mp4', '', null, null, 'mp4', '2017-09-07 02:01:38', '2017-09-07 02:01:38', null, '1', '1');
INSERT INTO `video_info` VALUES ('429', '216', '1', '226', '85', '1. 职业生涯规划的基本概念.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E15047210502671.mp4', '', null, null, 'mp4', '2017-09-07 02:04:14', '2017-09-07 02:04:14', null, '1', '1');
INSERT INTO `video_info` VALUES ('430', '217', '1', '226', '85', '1. 职业生涯规划的基本概念（说课）.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E15047212878241.mp4', '', null, null, 'mp4', '2017-09-07 02:09:28', '2017-09-07 02:09:28', null, '1', '1');
INSERT INTO `video_info` VALUES ('431', '218', '1', '226', '85', '2. 中职生职业生涯规划的特点和意义.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504721427594.mp4', '', null, null, 'mp4', '2017-09-07 02:10:32', '2017-09-07 02:10:32', null, '1', '1');
INSERT INTO `video_info` VALUES ('432', '219', '1', '226', '85', '2. 中职生职业生涯规划的特点和意义（说课）.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504721455744.mp4', '', null, null, 'mp4', '2017-09-07 02:11:56', '2017-09-07 02:11:56', null, '1', '1');
INSERT INTO `video_info` VALUES ('433', '225', '1', '226', '85', '1. 职业兴趣及其培养.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504721543247.mp4', '', null, null, 'mp4', '2017-09-07 02:12:27', '2017-09-07 02:12:27', null, '1', '1');
INSERT INTO `video_info` VALUES ('434', '226', '1', '226', '85', '1. 职业兴趣及其培养（说课）.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504721590213.mp4', '', null, null, 'mp4', '2017-09-07 02:14:17', '2017-09-07 02:14:17', null, '1', '1');
INSERT INTO `video_info` VALUES ('435', '227', '1', '226', '85', '2. 自我评估.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504721758003.mp4', '', null, null, 'mp4', '2017-09-07 02:16:03', '2017-09-07 02:16:03', null, '1', '1');
INSERT INTO `video_info` VALUES ('436', '228', '1', '226', '85', '2. 自我评估（说课）.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504721782028.mp4', '', null, null, 'mp4', '2017-09-07 02:17:27', '2017-09-07 02:17:27', null, '1', '1');
INSERT INTO `video_info` VALUES ('437', '230', '1', '226', '85', '1. 从学校人到职业人的转变.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504721883911.mp4', '', null, null, 'mp4', '2017-09-07 02:18:09', '2017-09-07 02:18:09', null, '1', '1');
INSERT INTO `video_info` VALUES ('438', '231', '1', '226', '85', '1. 从学校人到职业人的转变（说课）.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504721936936.mp4', '', null, null, 'mp4', '2017-09-07 02:19:18', '2017-09-07 02:19:18', null, '1', '1');
INSERT INTO `video_info` VALUES ('439', '232', '1', '226', '85', '2. 了解就业形势.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504722007907.mp4', '', null, null, 'mp4', '2017-09-07 02:20:16', '2017-09-07 02:20:16', null, '1', '1');
INSERT INTO `video_info` VALUES ('440', '233', '1', '226', '85', '2. 了解就业形势（说课）.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504722062980.mp4', '', null, null, 'mp4', '2017-09-07 02:21:59', '2017-09-07 02:21:59', null, '1', '1');
INSERT INTO `video_info` VALUES ('441', '240', '1', '226', '85', '第一课 求职途径.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504722199802.mp4', '', null, null, 'mp4', '2017-09-07 02:24:02', '2017-09-07 02:24:02', null, '1', '1');
INSERT INTO `video_info` VALUES ('442', '241', '1', '226', '85', '第一课 求职途径（说课）.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504722312899.mp4', '', null, null, 'mp4', '2017-09-07 02:26:14', '2017-09-07 02:26:14', null, '1', '1');
INSERT INTO `video_info` VALUES ('443', '243', '1', '226', '85', '1. 填写大中专毕业生就业推荐表.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504722447205.mp4', '', null, null, 'mp4', '2017-09-07 02:28:55', '2017-09-07 02:28:55', null, '1', '1');
INSERT INTO `video_info` VALUES ('444', '244', '1', '226', '85', '1. 填写大中专毕业生就业推荐表（说课）.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504731870382.mp4', '', null, null, 'mp4', '2017-09-07 05:04:53', '2017-09-07 05:04:53', null, '1', '1');
INSERT INTO `video_info` VALUES ('445', '245', '1', '226', '85', '2. 制作简历.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504731914488.mp4', '', null, null, 'mp4', '2017-09-07 05:05:18', '2017-09-07 05:05:18', null, '1', '1');
INSERT INTO `video_info` VALUES ('446', '246', '1', '226', '85', '2. 制作简历（说课）.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504731944243.mp4', '', null, null, 'mp4', '2017-09-07 05:06:31', '2017-09-07 05:06:31', null, '1', '1');
INSERT INTO `video_info` VALUES ('447', '247', '1', '226', '85', '3. 撰写求职自荐信.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504732058584.mp4', '', null, null, 'mp4', '2017-09-07 05:07:42', '2017-09-07 05:07:42', null, '1', '1');
INSERT INTO `video_info` VALUES ('448', '248', '1', '226', '85', '3. 撰写求职自荐信（说课）.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504732086828.mp4', '', null, null, 'mp4', '2017-09-07 05:08:29', '2017-09-07 05:08:29', null, '1', '1');
INSERT INTO `video_info` VALUES ('449', '250', '1', '226', '85', '1. 求职基本礼仪.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504732177821.mp4', '', null, null, 'mp4', '2017-09-07 05:09:43', '2017-09-07 05:09:43', null, '1', '1');
INSERT INTO `video_info` VALUES ('450', '251', '1', '226', '85', '1. 求职基本礼仪（说课）.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504732206884.mp4', '', null, null, 'mp4', '2017-09-07 05:10:29', '2017-09-07 05:10:29', null, '1', '1');
INSERT INTO `video_info` VALUES ('451', '252', '1', '226', '85', '2. 塑造良好个人形象.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504732250331.mp4', '', null, null, 'mp4', '2017-09-07 05:10:54', '2017-09-07 05:10:54', null, '1', '1');
INSERT INTO `video_info` VALUES ('452', '253', '1', '226', '85', '2. 塑造良好个人形象（说课）.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504732277548.mp4', '', null, null, 'mp4', '2017-09-07 05:11:44', '2017-09-07 05:11:44', null, '1', '1');
INSERT INTO `video_info` VALUES ('453', '255', '1', '226', '85', '1. 模拟面试.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504732332214.mp4', '', null, null, 'mp4', '2017-09-07 05:12:16', '2017-09-07 05:12:16', null, '1', '1');
INSERT INTO `video_info` VALUES ('454', '256', '1', '226', '85', '1. 模拟面试（说课）.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504732371122.mp4', '', null, null, 'mp4', '2017-09-07 05:13:13', '2017-09-07 05:13:13', null, '1', '1');
INSERT INTO `video_info` VALUES ('455', '257', '1', '226', '85', '2. 面试技巧.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504732418273.mp4', '', null, null, 'mp4', '2017-09-07 05:13:56', '2017-09-07 05:13:56', null, '1', '1');
INSERT INTO `video_info` VALUES ('456', '258', '1', '226', '85', '2. 面试技巧（说课）.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504732460559.mp4', '', null, null, 'mp4', '2017-09-07 05:14:44', '2017-09-07 05:14:44', null, '1', '1');
INSERT INTO `video_info` VALUES ('457', '260', '1', '226', '85', '1. 劳动合同的订立及其形式.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504732510789.mp4', '', null, null, 'mp4', '2017-09-07 05:15:16', '2017-09-07 05:15:16', null, '1', '1');
INSERT INTO `video_info` VALUES ('458', '261', '1', '226', '85', '1. 劳动合同的订立及其形式（说课）.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504732537402.mp4', '', null, null, 'mp4', '2017-09-07 05:15:58', '2017-09-07 05:15:58', null, '1', '1');
INSERT INTO `video_info` VALUES ('459', '262', '1', '226', '85', '2. 签订劳动合同的注意事项.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504732579063.mp4', '', null, null, 'mp4', '2017-09-07 05:16:24', '2017-09-07 05:16:24', null, '1', '1');
INSERT INTO `video_info` VALUES ('460', '263', '1', '226', '85', '2. 签订劳动合同的注意事项（说课）.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504732605711.mp4', '', null, null, 'mp4', '2017-09-07 05:17:05', '2017-09-07 05:17:05', null, '1', '1');
INSERT INTO `video_info` VALUES ('461', '266', '1', '226', '85', '第一课 创业的意义（说课）.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504732667839.mp4', '', null, null, 'mp4', '2017-09-07 05:18:11', '2017-09-07 05:18:11', null, '1', '1');
INSERT INTO `video_info` VALUES ('462', '267', '1', '226', '85', '第二课 对创业者素质和能力的要求.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504732713737.mp4', '', null, null, 'mp4', '2017-09-07 05:18:37', '2017-09-07 05:18:37', null, '1', '1');
INSERT INTO `video_info` VALUES ('463', '268', '1', '226', '85', '第二课 对创业者素质和能力的要求（说课）.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504732738535.mp4', '', null, null, 'mp4', '2017-09-07 05:19:18', '2017-09-07 05:19:18', null, '1', '1');
INSERT INTO `video_info` VALUES ('464', '269', '1', '226', '85', '第三课 创业构想.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504732783920.mp4', '', null, null, 'mp4', '2017-09-07 05:19:48', '2017-09-07 05:19:48', null, '1', '1');
INSERT INTO `video_info` VALUES ('465', '270', '1', '226', '85', '第三课 创业构想（说课）.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504732810836.mp4', '', null, null, 'mp4', '2017-09-07 05:20:32', '2017-09-07 05:20:32', null, '1', '1');
INSERT INTO `video_info` VALUES ('466', '271', '1', '226', '85', '第四课 创业行动指南.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504732851361.mp4', '', null, null, 'mp4', '2017-09-07 05:20:54', '2017-09-07 05:20:54', null, '1', '1');
INSERT INTO `video_info` VALUES ('467', '272', '1', '226', '85', '第四课 创业行动指南（说课）.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504732875433.mp4', '', null, null, 'mp4', '2017-09-07 05:21:39', '2017-09-07 05:21:39', null, '1', '1');
INSERT INTO `video_info` VALUES ('468', '433', '1', '226', '89', '1. 商品和货币.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504733210171.mp4', '', null, null, 'mp4', '2017-09-07 05:26:58', '2017-09-07 05:26:58', null, '1', '1');
INSERT INTO `video_info` VALUES ('469', '434', '1', '226', '89', '1. 商品和货币（说课）.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504733240910.mp4', '', null, null, 'mp4', '2017-09-07 05:27:40', '2017-09-07 05:27:40', null, '1', '1');
INSERT INTO `video_info` VALUES ('470', '435', '1', '226', '89', '2. 价格和价值规律.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504733280790.mp4', '', null, null, 'mp4', '2017-09-07 05:28:05', '2017-09-07 05:28:05', null, '1', '1');
INSERT INTO `video_info` VALUES ('471', '436', '1', '226', '89', '2. 价格和价值规律（说课）.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504733304055.mp4', '', null, null, 'mp4', '2017-09-07 05:28:44', '2017-09-07 05:28:44', null, '1', '1');
INSERT INTO `video_info` VALUES ('472', '438', '1', '226', '89', '1. 提高企业的经济效益.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504733346258.mp4', '', null, null, 'mp4', '2017-09-07 05:29:12', '2017-09-07 05:29:12', null, '1', '1');
INSERT INTO `video_info` VALUES ('473', '439', '1', '226', '89', '1. 提高企业的经济效益（说课）.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504733372078.mp4', '', null, null, 'mp4', '2017-09-07 05:29:50', '2017-09-07 05:29:50', null, '1', '1');
INSERT INTO `video_info` VALUES ('474', '440', '1', '226', '89', '2. 企业中的劳动者.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504733409492.mp4', '', null, null, 'mp4', '2017-09-07 05:30:16', '2017-09-07 05:30:16', null, '1', '1');
INSERT INTO `video_info` VALUES ('475', '441', '1', '226', '89', '2. 企业中的劳动者（说课）.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504733434630.mp4', '', null, null, 'mp4', '2017-09-07 05:30:53', '2017-09-07 05:30:53', null, '1', '1');
INSERT INTO `video_info` VALUES ('476', '443', '1', '226', '89', '1. 个人收入与分配.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504733473982.mp4', '', null, null, 'mp4', '2017-09-07 05:31:37', '2017-09-07 05:31:37', null, '1', '1');
INSERT INTO `video_info` VALUES ('477', '444', '1', '226', '89', '1. 个人收入与分配（说课）.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504733526492.mp4', '', null, null, 'mp4', '2017-09-07 05:32:19', '2017-09-07 05:32:19', null, '1', '1');
INSERT INTO `video_info` VALUES ('478', '445', '1', '226', '89', '2. 依法纳税和投资理财.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504733560559.mp4', '', null, null, 'mp4', '2017-09-07 05:32:44', '2017-09-07 05:32:44', null, '1', '1');
INSERT INTO `video_info` VALUES ('479', '446', '1', '226', '89', '2. 依法纳税和投资理财（说课）.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504733594709.mp4', '', null, null, 'mp4', '2017-09-07 05:33:38', '2017-09-07 05:33:38', null, '1', '1');
INSERT INTO `video_info` VALUES ('480', '449', '1', '226', '89', '1. 维护社会主义基本经济制度.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504733662480.mp4', '', null, null, 'mp4', '2017-09-07 05:34:26', '2017-09-07 05:34:26', null, '1', '1');
INSERT INTO `video_info` VALUES ('481', '450', '1', '226', '89', '1. 维护社会主义基本经济制度（说课）.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504733687686.mp4', '', null, null, 'mp4', '2017-09-07 05:35:11', '2017-09-07 05:35:11', null, '1', '1');
INSERT INTO `video_info` VALUES ('482', '451', '1', '226', '89', '2. 把握社会注意市场经济的特征.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504733732312.mp4', '', null, null, 'mp4', '2017-09-07 05:35:38', '2017-09-07 05:35:38', null, '1', '1');
INSERT INTO `video_info` VALUES ('483', '452', '1', '226', '89', '2. 把握社会注意市场经济的特征（说课）.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504733758015.mp4', '', null, null, 'mp4', '2017-09-07 05:36:18', '2017-09-07 05:36:18', null, '1', '1');
INSERT INTO `video_info` VALUES ('484', '454', '1', '226', '89', '1. 全面建设小康社会.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504733804358.mp4', '', null, null, 'mp4', '2017-09-07 05:36:48', '2017-09-07 05:36:48', null, '1', '1');
INSERT INTO `video_info` VALUES ('485', '455', '1', '226', '89', '1. 全面建设小康社会（说课）.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504733837065.mp4', '', null, null, 'mp4', '2017-09-07 05:37:39', '2017-09-07 05:37:39', null, '1', '1');
INSERT INTO `video_info` VALUES ('486', '456', '1', '226', '89', '2. 坚持科学发展观，促进经济社会生态协调发展.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504733884631.mp4', '', null, null, 'mp4', '2017-09-07 05:38:08', '2017-09-07 05:38:08', null, '1', '1');
INSERT INTO `video_info` VALUES ('487', '457', '1', '226', '89', '2. 坚持科学发展观，促进经济社会生态协调发展（说课）.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504733907751.mp4', '', null, null, 'mp4', '2017-09-07 05:38:47', '2017-09-07 05:38:47', null, '1', '1');
INSERT INTO `video_info` VALUES ('488', '465', '1', '226', '89', '1. 人民代表大会制度及政党制度.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504733956415.mp4', '', null, null, 'mp4', '2017-09-07 05:39:20', '2017-09-07 05:39:20', null, '1', '1');
INSERT INTO `video_info` VALUES ('489', '466', '1', '226', '89', '1. 人民代表大会制度及政党制度（说课）.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504733979852.mp4', '', null, null, 'mp4', '2017-09-07 05:39:56', '2017-09-07 05:39:56', null, '1', '1');
INSERT INTO `video_info` VALUES ('490', '467', '1', '226', '89', '2. 民族区域与基层群众自治制度.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504734015540.mp4', '', null, null, 'mp4', '2017-09-07 05:40:31', '2017-09-07 05:40:31', null, '1', '1');
INSERT INTO `video_info` VALUES ('491', '468', '1', '226', '89', '2. 民族区域与基层群众自治制度（说课）.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504734050849.mp4', '', null, null, 'mp4', '2017-09-07 05:41:11', '2017-09-07 05:41:11', null, '1', '1');
INSERT INTO `video_info` VALUES ('492', '470', '1', '226', '89', '1. 人民民主是社会主义的生命.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504734096252.mp4', '', null, null, 'mp4', '2017-09-07 05:41:40', '2017-09-07 05:41:40', null, '1', '1');
INSERT INTO `video_info` VALUES ('493', '471', '1', '226', '89', '1. 人民民主是社会主义的生命（说课）.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504734125015.mp4', '', null, null, 'mp4', '2017-09-07 05:42:22', '2017-09-07 05:42:22', null, '1', '1');
INSERT INTO `video_info` VALUES ('494', '472', '1', '226', '89', '2. 发展社会主义民主政治.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504734163404.mp4', '', null, null, 'mp4', '2017-09-07 05:42:49', '2017-09-07 05:42:49', null, '1', '1');
INSERT INTO `video_info` VALUES ('495', '473', '1', '226', '89', '2. 发展社会主义民主政治（说课）.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504734189532.mp4', '', null, null, 'mp4', '2017-09-07 05:43:32', '2017-09-07 05:43:32', null, '1', '1');
INSERT INTO `video_info` VALUES ('496', '476', '1', '226', '89', '1. 公民享有民主权利.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504734265750.mp4', '', null, null, 'mp4', '2017-09-07 05:44:30', '2017-09-07 05:44:30', null, '1', '1');
INSERT INTO `video_info` VALUES ('497', '477', '1', '226', '89', '1. 公民享有民主权利（说课）.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504734291951.mp4', '', null, null, 'mp4', '2017-09-07 05:45:13', '2017-09-07 05:45:13', null, '1', '1');
INSERT INTO `video_info` VALUES ('498', '478', '1', '226', '89', '2. 人民政府服务人民.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504734334470.mp4', '', null, null, 'mp4', '2017-09-07 05:45:44', '2017-09-07 05:45:44', null, '1', '1');
INSERT INTO `video_info` VALUES ('499', '479', '1', '226', '89', '2. 人民政府服务人民（说课）.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504734363851.mp4', '', null, null, 'mp4', '2017-09-07 05:46:26', '2017-09-07 05:46:26', null, '1', '1');
INSERT INTO `video_info` VALUES ('500', '481', '1', '226', '89', '1. 公民的政治性任务.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504734410738.mp4', '', null, null, 'mp4', '2017-09-07 05:46:54', '2017-09-07 05:46:54', null, '1', '1');
INSERT INTO `video_info` VALUES ('501', '482', '1', '226', '89', '1. 公民的政治性任务（说课）.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504734433864.mp4', '', null, null, 'mp4', '2017-09-07 05:47:32', '2017-09-07 05:47:32', null, '1', '1');
INSERT INTO `video_info` VALUES ('502', '483', '1', '226', '89', '2. 自觉参与政治生活.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504734472147.mp4', '', null, null, 'mp4', '2017-09-07 05:47:57', '2017-09-07 05:47:57', null, '1', '1');
INSERT INTO `video_info` VALUES ('503', '484', '1', '226', '89', '2. 自觉参与政治生活（说课）.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504734497421.mp4', '', null, null, 'mp4', '2017-09-07 05:48:37', '2017-09-07 05:48:37', null, '1', '1');
INSERT INTO `video_info` VALUES ('504', '486', '1', '226', '89', '1. 中国在国际社会中的作用.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504734541472.mp4', '', null, null, 'mp4', '2017-09-07 05:49:05', '2017-09-07 05:49:05', null, '1', '1');
INSERT INTO `video_info` VALUES ('505', '487', '1', '226', '89', '1. 中国在国际社会中的作用（说课）.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504734563413.mp4', '', null, null, 'mp4', '2017-09-07 05:49:41', '2017-09-07 05:49:41', null, '1', '1');
INSERT INTO `video_info` VALUES ('506', '488', '1', '226', '89', '2. 我国奉行的外交政策.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504734603324.mp4', '', null, null, 'mp4', '2017-09-07 05:50:07', '2017-09-07 05:50:07', null, '1', '1');
INSERT INTO `video_info` VALUES ('507', '489', '1', '226', '89', '2. 我国奉行的外交政策（说课）.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504734629407.mp4', '', null, null, 'mp4', '2017-09-07 05:50:49', '2017-09-07 05:50:49', null, '1', '1');
INSERT INTO `video_info` VALUES ('508', '492', '1', '226', '89', '1. 优先发展教育：学有所教.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504734679455.mp4', '', null, null, 'mp4', '2017-09-07 05:51:23', '2017-09-07 05:51:23', null, '1', '1');
INSERT INTO `video_info` VALUES ('509', '493', '1', '226', '89', '1. 优先发展教育：学有所教（说课）.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504734703170.mp4', '', null, null, 'mp4', '2017-09-07 05:52:03', '2017-09-07 05:52:03', null, '1', '1');
INSERT INTO `video_info` VALUES ('510', '494', '1', '226', '89', '2. 医疗和社会保障：普惠百姓.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504734745315.mp4', '', null, null, 'mp4', '2017-09-07 05:52:39', '2017-09-07 05:52:39', null, '1', '1');
INSERT INTO `video_info` VALUES ('511', '495', '1', '226', '89', '2. 医疗和社会保障：普惠百姓（说课）.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504734780469.mp4', '', null, null, 'mp4', '2017-09-07 05:53:21', '2017-09-07 05:53:21', null, '1', '1');
INSERT INTO `video_info` VALUES ('512', '497', '1', '226', '89', '1. 推动社会主义文化大发展大繁荣.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504735048470.mp4', '', null, null, 'mp4', '2017-09-07 05:57:33', '2017-09-07 05:57:33', null, '1', '1');
INSERT INTO `video_info` VALUES ('513', '498', '1', '226', '89', '1. 推动社会主义文化大发展大繁荣（说课）.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504735728267.mp4', '', null, null, 'mp4', '2017-09-07 06:09:08', '2017-09-07 06:09:08', null, '1', '1');
INSERT INTO `video_info` VALUES ('514', '499', '1', '226', '89', '2. 社会主义核心价值体系.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504736407460.mp4', '', null, null, 'mp4', '2017-09-07 06:12:02', '2017-09-07 06:12:02', null, '1', '1');
INSERT INTO `video_info` VALUES ('515', '500', '1', '226', '89', '2. 社会主义核心价值体系（说课）.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504736108897.mp4', '', null, null, 'mp4', '2017-09-07 06:19:18', '2017-09-07 06:19:18', null, '1', '1');
INSERT INTO `video_info` VALUES ('516', '502', '1', '226', '89', '1. 高举旗帜 科学发展.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504736437928.mp4', '', null, null, 'mp4', '2017-09-07 06:20:42', '2017-09-07 06:20:42', null, '1', '1');
INSERT INTO `video_info` VALUES ('517', '503', '1', '226', '89', '1. 高举旗帜 科学发展（说课）.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504736463837.mp4', '', null, null, 'mp4', '2017-09-07 06:21:23', '2017-09-07 06:21:23', null, '1', '1');
INSERT INTO `video_info` VALUES ('518', '504', '1', '226', '89', '2. 和谐社会 共建共享.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504736506159.mp4', '', null, null, 'mp4', '2017-09-07 06:21:51', '2017-09-07 06:21:51', null, '1', '1');
INSERT INTO `video_info` VALUES ('519', '505', '1', '226', '89', '2. 和谐社会 共建共享（说课）.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504736540627.mp4', '', null, null, 'mp4', '2017-09-07 06:22:43', '2017-09-07 06:22:43', null, '1', '1');
INSERT INTO `video_info` VALUES ('520', '274', '1', '226', '86', '职业道德与法律.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504736617226.mp4', '', null, null, 'mp4', '2017-09-07 06:23:43', '2017-09-07 06:23:43', null, '1', '1');
INSERT INTO `video_info` VALUES ('521', '275', '1', '226', '86', '职业道德与法律（说课）.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504736643291.mp4', '', null, null, 'mp4', '2017-09-07 06:24:35', '2017-09-07 06:24:35', null, '1', '1');
INSERT INTO `video_info` VALUES ('522', '277', '1', '226', '86', '第一课 塑造自己的良好形象—学生日常礼仪.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504736702407.mp4', '', null, null, 'mp4', '2017-09-07 06:25:07', '2017-09-07 06:25:07', null, '1', '1');
INSERT INTO `video_info` VALUES ('523', '278', '1', '226', '86', '第一课 塑造自己的良好形象—学生日常礼仪（说课）.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504736731112.mp4', '', null, null, 'mp4', '2017-09-07 06:25:54', '2017-09-07 06:25:54', null, '1', '1');
INSERT INTO `video_info` VALUES ('524', '279', '1', '226', '86', '第二课 展示自己的职业风采—常见的职业礼仪.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504736791096.mp4', '', null, null, 'mp4', '2017-09-07 06:26:36', '2017-09-07 06:26:36', null, '1', '1');
INSERT INTO `video_info` VALUES ('525', '280', '1', '226', '86', '第二课 展示自己的职业风采—常见的职业礼仪（说课）.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504736817030.mp4', '', null, null, 'mp4', '2017-09-07 06:27:16', '2017-09-07 06:27:16', null, '1', '1');
INSERT INTO `video_info` VALUES ('526', '282', '1', '226', '86', '第一课 我国公民的基本道德规范.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504736855525.mp4', '', null, null, 'mp4', '2017-09-07 06:27:39', '2017-09-07 06:27:39', null, '1', '1');
INSERT INTO `video_info` VALUES ('527', '283', '1', '226', '86', '第一课 我国公民的基本道德规范（说课）.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504736878278.mp4', '', null, null, 'mp4', '2017-09-07 06:28:26', '2017-09-07 06:28:26', null, '1', '1');
INSERT INTO `video_info` VALUES ('528', '284', '1', '226', '86', '第二课 幸福生活的家庭美德.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504736928740.mp4', '', null, null, 'mp4', '2017-09-07 06:29:21', '2017-09-07 06:29:21', null, '1', '1');
INSERT INTO `video_info` VALUES ('529', '285', '1', '226', '86', '第二课 幸福生活的家庭美德（说课）.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504736983192.mp4', '', null, null, 'mp4', '2017-09-07 06:30:06', '2017-09-07 06:30:06', null, '1', '1');
INSERT INTO `video_info` VALUES ('530', '286', '1', '226', '86', '第三课 和谐社会里的社会公德.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504737027492.mp4', '', null, null, 'mp4', '2017-09-07 06:30:31', '2017-09-07 06:30:31', null, '1', '1');
INSERT INTO `video_info` VALUES ('531', '289', '1', '226', '86', '第三课 和谐社会里的社会公德（说课）.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504737053085.mp4', '', null, null, 'mp4', '2017-09-07 06:31:15', '2017-09-07 06:31:15', null, '1', '1');
INSERT INTO `video_info` VALUES ('532', '291', '1', '226', '86', '1. 爱岗敬业，立足岗位成才.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504737098661.mp4', '', null, null, 'mp4', '2017-09-07 06:31:43', '2017-09-07 06:31:43', null, '1', '1');
INSERT INTO `video_info` VALUES ('533', '292', '1', '226', '86', '1. 爱岗敬业，立足岗位成才（说课）.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504737124392.mp4', '', null, null, 'mp4', '2017-09-07 06:32:28', '2017-09-07 06:32:28', null, '1', '1');
INSERT INTO `video_info` VALUES ('534', '293', '1', '226', '86', '2. 诚实守信.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504737172350.mp4', '', null, null, 'mp4', '2017-09-07 06:32:58', '2017-09-07 06:32:58', null, '1', '1');
INSERT INTO `video_info` VALUES ('535', '294', '1', '226', '86', '2. 诚实守信（说课）.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504737689086.mp4', '', null, null, 'mp4', '2017-09-07 06:42:00', '2017-09-07 06:42:00', null, '1', '1');
INSERT INTO `video_info` VALUES ('536', '295', '1', '226', '86', '3. 办事公道.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504737743498.mp4', '', null, null, 'mp4', '2017-09-07 06:42:27', '2017-09-07 06:42:27', null, '1', '1');
INSERT INTO `video_info` VALUES ('537', '296', '1', '226', '86', '3. 办事公道（说课）.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504737771251.mp4', '', null, null, 'mp4', '2017-09-07 06:43:15', '2017-09-07 06:43:15', null, '1', '1');
INSERT INTO `video_info` VALUES ('538', '297', '1', '226', '86', '4. 服务群众，奉献社会.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504737818700.mp4', '', null, null, 'mp4', '2017-09-07 06:43:43', '2017-09-07 06:43:43', null, '1', '1');
INSERT INTO `video_info` VALUES ('539', '298', '1', '226', '86', '4.服务群众，奉献社会（说课）.mp4', 'resource/86/video/B452524AE462E7066464706A07C985381496649863249.mp4', '', null, null, 'mp4', '2017-09-07 06:44:54', '2017-09-07 06:44:54', null, '1', '1');
INSERT INTO `video_info` VALUES ('540', '299', '1', '226', '86', '5. 养成良好的职业行为习惯.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504738801414.mp4', '', null, null, 'mp4', '2017-09-07 07:00:34', '2017-09-07 07:00:34', null, '1', '1');
INSERT INTO `video_info` VALUES ('541', '300', '1', '226', '86', '5. 养成良好的职业行为习惯（说课）.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504738885052.mp4', '', null, null, 'mp4', '2017-09-07 07:02:28', '2017-09-07 07:02:28', null, '1', '1');
INSERT INTO `video_info` VALUES ('542', '302', '1', '226', '86', '第一课 弘扬法治精神，建设法治国家.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504738973849.mp4', '', null, null, 'mp4', '2017-09-07 07:03:05', '2017-09-07 07:03:05', null, '1', '1');
INSERT INTO `video_info` VALUES ('543', '303', '1', '226', '86', '第一课 弘扬法治精神，建设法治国家（说课）.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504739006712.mp4', '', null, null, 'mp4', '2017-09-07 07:03:49', '2017-09-07 07:03:49', null, '1', '1');
INSERT INTO `video_info` VALUES ('544', '304', '1', '226', '86', '第二课 维护宪法权威，当好国家公民.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504739086884.mp4', '', null, null, 'mp4', '2017-09-07 07:04:55', '2017-09-07 07:04:55', null, '1', '1');
INSERT INTO `video_info` VALUES ('545', '305', '1', '226', '86', '第二课 维护宪法权威，当好国家公民（说课）.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504739116776.mp4', '', null, null, 'mp4', '2017-09-07 07:05:34', '2017-09-07 07:05:34', null, '1', '1');
INSERT INTO `video_info` VALUES ('546', '307', '1', '226', '86', '1. 崇尚程序正义—行政处罚.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504739156729.mp4', '', null, null, 'mp4', '2017-09-07 07:06:06', '2017-09-07 07:06:06', null, '1', '1');
INSERT INTO `video_info` VALUES ('547', '308', '1', '226', '86', '1. 崇尚程序正义—行政处罚（说课）.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504739206929.mp4', '', null, null, 'mp4', '2017-09-07 07:07:05', '2017-09-07 07:07:05', null, '1', '1');
INSERT INTO `video_info` VALUES ('548', '309', '1', '226', '86', '2. 增强维权意识—合法权益是否被侵犯.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504739246165.mp4', '', null, null, 'mp4', '2017-09-07 07:07:31', '2017-09-07 07:07:31', null, '1', '1');
INSERT INTO `video_info` VALUES ('549', '310', '1', '226', '86', '2. 增强维权意识—合法权益是否被侵犯（说课）.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504739296608.mp4', '', null, null, 'mp4', '2017-09-07 07:08:37', '2017-09-07 07:08:37', null, '1', '1');
INSERT INTO `video_info` VALUES ('550', '311', '1', '226', '86', '3. 依法维护自己的合法权益—维权途径.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504739337747.mp4', '', null, null, 'mp4', '2017-09-07 07:09:01', '2017-09-07 07:09:01', null, '1', '1');
INSERT INTO `video_info` VALUES ('551', '312', '1', '226', '86', '3. 依法维护自己的合法权益—维权途径（说课）.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504739362033.mp4', '', null, null, 'mp4', '2017-09-07 07:09:47', '2017-09-07 07:09:47', null, '1', '1');
INSERT INTO `video_info` VALUES ('552', '315', '1', '226', '86', '1. 一般违法行为.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504739411841.mp4', '', null, null, 'mp4', '2017-09-07 07:10:19', '2017-09-07 07:10:19', null, '1', '1');
INSERT INTO `video_info` VALUES ('553', '316', '1', '226', '86', '1. 一般违法行为（说课）.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504739438813.mp4', '', null, null, 'mp4', '2017-09-07 07:11:00', '2017-09-07 07:11:00', null, '1', '1');
INSERT INTO `video_info` VALUES ('554', '317', '1', '226', '86', '2. 杜绝不良行为.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504739481096.mp4', '', null, null, 'mp4', '2017-09-07 07:11:30', '2017-09-07 07:11:30', null, '1', '1');
INSERT INTO `video_info` VALUES ('555', '318', '1', '226', '86', '2. 杜绝不良行为（说课）.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504739528111.mp4', '', null, null, 'mp4', '2017-09-07 07:12:35', '2017-09-07 07:12:35', null, '1', '1');
INSERT INTO `video_info` VALUES ('556', '319', '1', '226', '86', '3. 依法处理违法行为.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504739587594.mp4', '', null, null, 'mp4', '2017-09-07 07:13:14', '2017-09-07 07:13:14', null, '1', '1');
INSERT INTO `video_info` VALUES ('557', '321', '1', '226', '86', '3. 依法处理违法行为（说课）.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504739618818.mp4', '', null, null, 'mp4', '2017-09-07 07:14:07', '2017-09-07 07:14:07', null, '1', '1');
INSERT INTO `video_info` VALUES ('558', '323', '1', '226', '86', '1. 犯罪.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504739672492.mp4', '', null, null, 'mp4', '2017-09-07 07:14:38', '2017-09-07 07:14:38', null, '1', '1');
INSERT INTO `video_info` VALUES ('559', '324', '1', '226', '86', '1. 犯罪（说课）.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504739699422.mp4', '', null, null, 'mp4', '2017-09-07 07:15:46', '2017-09-07 07:15:46', null, '1', '1');
INSERT INTO `video_info` VALUES ('560', '325', '1', '226', '86', '2. 运用刑法武器依法制裁犯罪行为.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504739768036.mp4', '', null, null, 'mp4', '2017-09-07 07:16:21', '2017-09-07 07:16:21', null, '1', '1');
INSERT INTO `video_info` VALUES ('561', '326', '1', '226', '86', '2. 运用刑法武器依法制裁犯罪行为（说课）.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504739805046.mp4', '', null, null, 'mp4', '2017-09-07 07:17:10', '2017-09-07 07:17:10', null, '1', '1');
INSERT INTO `video_info` VALUES ('562', '327', '1', '226', '86', '3. 同犯罪行为作斗争.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504739852241.mp4', '', null, null, 'mp4', '2017-09-07 07:17:36', '2017-09-07 07:17:36', null, '1', '1');
INSERT INTO `video_info` VALUES ('563', '328', '1', '226', '86', '3. 同犯罪行为作斗争（说课）.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504739877543.mp4', '', null, null, 'mp4', '2017-09-07 07:18:20', '2017-09-07 07:18:20', null, '1', '1');
INSERT INTO `video_info` VALUES ('564', '331', '1', '226', '86', '1. 依法参与民事活动.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504739929840.mp4', '', null, null, 'mp4', '2017-09-07 07:18:53', '2017-09-07 07:18:53', null, '1', '1');
INSERT INTO `video_info` VALUES ('565', '332', '1', '226', '86', '1. 依法参与民事活动（说课）.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504739955612.mp4', '', null, null, 'mp4', '2017-09-07 07:19:36', '2017-09-07 07:19:36', null, '1', '1');
INSERT INTO `video_info` VALUES ('566', '333', '1', '226', '86', '2. 依法维护人身权利.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504740004552.mp4', '', null, null, 'mp4', '2017-09-07 07:20:20', '2017-09-07 07:20:20', null, '1', '1');
INSERT INTO `video_info` VALUES ('567', '334', '1', '226', '86', '2. 依法维护人身权利（说课）.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504740040821.mp4', '', null, null, 'mp4', '2017-09-07 07:21:08', '2017-09-07 07:21:08', null, '1', '1');
INSERT INTO `video_info` VALUES ('568', '335', '1', '226', '86', '3. 依法保护财产权.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504740092645.mp4', '', null, null, 'mp4', '2017-09-07 07:21:36', '2017-09-07 07:21:36', null, '1', '1');
INSERT INTO `video_info` VALUES ('569', '336', '1', '226', '86', '3. 依法保护财产权（说课）.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504740124034.mp4', '', null, null, 'mp4', '2017-09-07 07:22:24', '2017-09-07 07:22:24', null, '1', '1');
INSERT INTO `video_info` VALUES ('570', '337', '1', '226', '86', '4. 正确利用合同参与民事活动.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504740172386.mp4', '', null, null, 'mp4', '2017-09-07 07:23:07', '2017-09-07 07:23:07', null, '1', '1');
INSERT INTO `video_info` VALUES ('571', '338', '1', '226', '86', '4. 正确利用合同参与民事活动（说课）.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504740208100.mp4', '', null, null, 'mp4', '2017-09-07 07:23:59', '2017-09-07 07:23:59', null, '1', '1');
INSERT INTO `video_info` VALUES ('572', '339', '1', '226', '86', '5. 依法维护在家庭中的权利和义务.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504740263585.mp4', '', null, null, 'mp4', '2017-09-07 07:24:29', '2017-09-07 07:24:29', null, '1', '1');
INSERT INTO `video_info` VALUES ('573', '340', '1', '226', '86', '5. 依法维护在家庭中的权利和义务（说课）.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504740294170.mp4', '', null, null, 'mp4', '2017-09-07 07:25:16', '2017-09-07 07:25:16', null, '1', '1');
INSERT INTO `video_info` VALUES ('574', '341', '1', '226', '86', '6. 依法维护在学校中的权利和义务.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504740338083.mp4', '', null, null, 'mp4', '2017-09-07 07:25:44', '2017-09-07 07:25:44', null, '1', '1');
INSERT INTO `video_info` VALUES ('575', '342', '1', '226', '86', '6. 依法维护在学校中的权利和义务（说课）.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504740366119.mp4', '', null, null, 'mp4', '2017-09-07 07:26:29', '2017-09-07 07:26:29', null, '1', '1');
INSERT INTO `video_info` VALUES ('576', '344', '1', '226', '86', '1. 依法维护劳动者的合法权益.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504740411905.mp4', '', null, null, 'mp4', '2017-09-07 07:26:56', '2017-09-07 07:26:56', null, '1', '1');
INSERT INTO `video_info` VALUES ('577', '345', '1', '226', '86', '1. 依法维护劳动者的合法权益（说课）.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504740451699.mp4', '', null, null, 'mp4', '2017-09-07 07:27:53', '2017-09-07 07:27:53', null, '1', '1');
INSERT INTO `video_info` VALUES ('578', '346', '1', '226', '86', '2. 依法保护人类共有的家园.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504740525447.mp4', '', null, null, 'mp4', '2017-09-07 07:28:49', '2017-09-07 07:28:49', null, '1', '1');
INSERT INTO `video_info` VALUES ('579', '347', '1', '226', '86', '2. 依法保护人类共有的家园（说课）.mp4', 'resource/86/video/C430C8A7597FEA7595AA70239506716E1504740556298.mp4', '', null, null, 'mp4', '2017-09-07 07:29:42', '2017-09-07 07:29:42', null, '1', '1');
INSERT INTO `video_info` VALUES ('580', '506', '1', '226', '88', '第一课 关注心理健康.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504740921546.mp4', '', null, null, 'mp4', '2017-09-07 07:35:26', '2017-09-07 07:35:26', null, '1', '1');
INSERT INTO `video_info` VALUES ('581', '507', '1', '226', '88', '第一课 关注心理健康（说课）.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504740950095.mp4', '', null, null, 'mp4', '2017-09-07 07:36:09', '2017-09-07 07:36:09', null, '1', '1');
INSERT INTO `video_info` VALUES ('582', '1029', '1', '226', '103', '第一课　生殖系统与健康（讲课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504749193234.mp4', '', null, null, 'mp4', '2017-09-07 09:53:18', '2017-09-07 09:53:18', null, '1', '1');
INSERT INTO `video_info` VALUES ('583', '1065', '1', '226', '103', '第一课　生殖系统与健康（说课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504749231481.mp4', '', null, null, 'mp4', '2017-09-07 09:54:04', '2017-09-07 09:54:04', null, '1', '1');
INSERT INTO `video_info` VALUES ('584', '1030', '1', '226', '103', '第二课   新生命的孕育（讲课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504749482073.mp4', '', null, null, 'mp4', '2017-09-07 09:58:13', '2017-09-07 09:58:13', null, '1', '1');
INSERT INTO `video_info` VALUES ('585', '1066', '1', '226', '103', '第二课   新生命的孕育（说课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504749552492.mp4', '', null, null, 'mp4', '2017-09-07 09:59:26', '2017-09-07 09:59:26', null, '1', '1');
INSERT INTO `video_info` VALUES ('586', '1031', '1', '226', '103', '第三课　身体发育与困惑（讲课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504749671610.mp4', '', null, null, 'mp4', '2017-09-07 10:01:16', '2017-09-07 10:01:16', null, '1', '1');
INSERT INTO `video_info` VALUES ('587', '1067', '1', '226', '103', '第三课　身体发育与困惑（说课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504749706205.mp4', '', null, null, 'mp4', '2017-09-07 10:01:59', '2017-09-07 10:01:59', null, '1', '1');
INSERT INTO `video_info` VALUES ('588', '1032', '1', '226', '103', '第四课　月经与遗精（讲课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504749755256.mp4', '', null, null, 'mp4', '2017-09-07 10:02:42', '2017-09-07 10:02:42', null, '1', '1');
INSERT INTO `video_info` VALUES ('589', '1068', '1', '226', '103', '第四课　月经与遗精（说课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504749799081.mp4', '', null, null, 'mp4', '2017-09-07 10:03:32', '2017-09-07 10:03:32', null, '1', '1');
INSERT INTO `video_info` VALUES ('590', '1033', '1', '226', '103', '第五课　性的觉醒（讲课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504749882345.mp4', '', null, null, 'mp4', '2017-09-07 10:04:46', '2017-09-07 10:04:46', null, '1', '1');
INSERT INTO `video_info` VALUES ('591', '1069', '1', '226', '103', '第五课　性的觉醒（说课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504749904482.mp4', '', null, null, 'mp4', '2017-09-07 10:05:14', '2017-09-07 10:05:14', null, '1', '1');
INSERT INTO `video_info` VALUES ('592', '1036', '1', '226', '103', '第一课　性心理现象.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750148055.mp4', '', null, null, 'mp4', '2017-09-07 10:09:15', '2017-09-07 10:09:15', null, '1', '1');
INSERT INTO `video_info` VALUES ('593', '1070', '1', '226', '103', '第一课　性心理现象（说课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750174918.mp4', '', null, null, 'mp4', '2017-09-07 10:09:48', '2017-09-07 10:09:48', null, '1', '1');
INSERT INTO `video_info` VALUES ('594', '1037', '1', '226', '103', '第二课　体像烦恼.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750212939.mp4', '', null, null, 'mp4', '2017-09-07 10:10:17', '2017-09-07 10:10:17', null, '1', '1');
INSERT INTO `video_info` VALUES ('595', '1071', '1', '226', '103', '第二课　体像烦恼（说课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750238096.mp4', '', null, null, 'mp4', '2017-09-07 10:10:58', '2017-09-07 10:10:58', null, '1', '1');
INSERT INTO `video_info` VALUES ('596', '1038', '1', '226', '103', '第三课　性别认同.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750292623.mp4', '', null, null, 'mp4', '2017-09-07 10:11:38', '2017-09-07 10:11:38', null, '1', '1');
INSERT INTO `video_info` VALUES ('597', '1072', '1', '226', '103', '第三课　性别认同（说课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750318276.mp4', '', null, null, 'mp4', '2017-09-07 10:12:07', '2017-09-07 10:12:07', null, '1', '1');
INSERT INTO `video_info` VALUES ('598', '1039', '1', '226', '103', '第四课　亲子关系.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750364082.mp4', '', null, null, 'mp4', '2017-09-07 10:12:48', '2017-09-07 10:12:48', null, '1', '1');
INSERT INTO `video_info` VALUES ('599', '1073', '1', '226', '103', '第四课　亲子关系（说课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750391282.mp4', '', null, null, 'mp4', '2017-09-07 10:13:20', '2017-09-07 10:13:20', null, '1', '1');
INSERT INTO `video_info` VALUES ('600', '1040', '1', '226', '103', '第五课　偶像崇拜.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750424710.mp4', '', null, null, 'mp4', '2017-09-07 10:13:57', '2017-09-07 10:13:57', null, '1', '1');
INSERT INTO `video_info` VALUES ('601', '1074', '1', '226', '103', '第五课　偶像崇拜（说课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750470797.mp4', '', null, null, 'mp4', '2017-09-07 10:14:40', '2017-09-07 10:14:40', null, '1', '1');
INSERT INTO `video_info` VALUES ('602', '1041', '1', '226', '103', '第一课　朋友.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750660307.mp4', '', null, null, 'mp4', '2017-09-07 10:17:44', '2017-09-07 10:17:44', null, '1', '1');
INSERT INTO `video_info` VALUES ('603', '1075', '1', '226', '103', '第一课　朋友（说课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750686026.mp4', '', null, null, 'mp4', '2017-09-07 10:18:14', '2017-09-07 10:18:14', null, '1', '1');
INSERT INTO `video_info` VALUES ('604', '1042', '1', '226', '103', '第二课　同伴压力.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750724487.mp4', '', null, null, 'mp4', '2017-09-07 10:18:48', '2017-09-07 10:18:48', null, '1', '1');
INSERT INTO `video_info` VALUES ('605', '1076', '1', '226', '103', '第二课　同伴压力（说课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750746480.mp4', '', null, null, 'mp4', '2017-09-07 10:19:15', '2017-09-07 10:19:15', null, '1', '1');
INSERT INTO `video_info` VALUES ('606', '1043', '1', '226', '103', '第三课　异性交往.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750776445.mp4', '', null, null, 'mp4', '2017-09-07 10:19:41', '2017-09-07 10:19:41', null, '1', '1');
INSERT INTO `video_info` VALUES ('607', '1077', '1', '226', '103', '第三课　异性交往（说课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750798561.mp4', '', null, null, 'mp4', '2017-09-07 10:20:07', '2017-09-07 10:20:07', null, '1', '1');
INSERT INTO `video_info` VALUES ('608', '1044', '1', '226', '103', '第四课    情感的烦恼.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750832745.mp4', '', null, null, 'mp4', '2017-09-07 10:20:36', '2017-09-07 10:20:36', null, '1', '1');
INSERT INTO `video_info` VALUES ('609', '1078', '1', '226', '103', '第四课    情感的烦恼（说课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750854725.mp4', '', null, null, 'mp4', '2017-09-07 10:21:03', '2017-09-07 10:21:03', null, '1', '1');
INSERT INTO `video_info` VALUES ('610', '1045', '1', '226', '103', '第五课    真爱.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750887342.mp4', '', null, null, 'mp4', '2017-09-07 10:21:36', '2017-09-07 10:21:36', null, '1', '1');
INSERT INTO `video_info` VALUES ('611', '1079', '1', '226', '103', '第五课   真爱（说课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750914871.mp4', '', null, null, 'mp4', '2017-09-07 10:22:06', '2017-09-07 10:22:06', null, '1', '1');
INSERT INTO `video_info` VALUES ('612', '1046', '1', '226', '103', '第六课　分手与失恋.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750948299.mp4', '', null, null, 'mp4', '2017-09-07 10:22:33', '2017-09-07 10:22:33', null, '1', '1');
INSERT INTO `video_info` VALUES ('613', '1080', '1', '226', '103', '第六课　分手与失恋（说课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504750971637.mp4', '', null, null, 'mp4', '2017-09-07 10:23:03', '2017-09-07 10:23:03', null, '1', '1');
INSERT INTO `video_info` VALUES ('614', '1047', '1', '226', '103', '第七课　学会拒绝.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751006031.mp4', '', null, null, 'mp4', '2017-09-07 10:23:29', '2017-09-07 10:23:29', null, '1', '1');
INSERT INTO `video_info` VALUES ('615', '1081', '1', '226', '103', '第七课　学会拒绝（说课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751026742.mp4', '', null, null, 'mp4', '2017-09-07 10:23:56', '2017-09-07 10:23:56', null, '1', '1');
INSERT INTO `video_info` VALUES ('616', '1050', '1', '226', '103', '第一课    性行为的选择.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751100282.mp4', '', null, null, 'mp4', '2017-09-07 10:25:03', '2017-09-07 10:25:03', null, '1', '1');
INSERT INTO `video_info` VALUES ('617', '1082', '1', '226', '103', '第一课    性行为的选择（说课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751122796.mp4', '', null, null, 'mp4', '2017-09-07 10:25:36', '2017-09-07 10:25:36', null, '1', '1');
INSERT INTO `video_info` VALUES ('618', '1051', '1', '226', '103', '第二课    避孕知识.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751168964.mp4', '', null, null, 'mp4', '2017-09-07 10:26:13', '2017-09-07 10:26:13', null, '1', '1');
INSERT INTO `video_info` VALUES ('619', '1083', '1', '226', '103', '第二课    避孕知识（说课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751191165.mp4', '', null, null, 'mp4', '2017-09-07 10:26:40', '2017-09-07 10:26:40', null, '1', '1');
INSERT INTO `video_info` VALUES ('620', '1052', '1', '226', '103', '第三课    意外怀孕以后.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751219801.mp4', '', null, null, 'mp4', '2017-09-07 10:27:03', '2017-09-07 10:27:03', null, '1', '1');
INSERT INTO `video_info` VALUES ('621', '1084', '1', '226', '103', '第三课    意外怀孕以后（说课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751241807.mp4', '', null, null, 'mp4', '2017-09-07 10:27:30', '2017-09-07 10:27:30', null, '1', '1');
INSERT INTO `video_info` VALUES ('622', '1053', '1', '226', '103', '第四课    预防性侵害.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751269441.mp4', '', null, null, 'mp4', '2017-09-07 10:27:53', '2017-09-07 10:27:53', null, '1', '1');
INSERT INTO `video_info` VALUES ('623', '1057', '1', '226', '103', '第四课    预防性侵害(说课).mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751293725.mp4', '', null, null, 'mp4', '2017-09-07 10:28:24', '2017-09-07 10:28:24', null, '1', '1');
INSERT INTO `video_info` VALUES ('624', '1054', '1', '226', '103', '第五课    拒绝约会暴力.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751326813.mp4', '', null, null, 'mp4', '2017-09-07 10:28:51', '2017-09-07 10:28:51', null, '1', '1');
INSERT INTO `video_info` VALUES ('625', '1085', '1', '226', '103', '第五课    拒绝约会暴力（说课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751348297.mp4', '', null, null, 'mp4', '2017-09-07 10:29:17', '2017-09-07 10:29:17', null, '1', '1');
INSERT INTO `video_info` VALUES ('626', '1055', '1', '226', '103', '第六课    酒精与毒品.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751375320.mp4', '', null, null, 'mp4', '2017-09-07 10:29:39', '2017-09-07 10:29:39', null, '1', '1');
INSERT INTO `video_info` VALUES ('627', '1086', '1', '226', '103', '第六课    酒精与毒品（说课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751396322.mp4', '', null, null, 'mp4', '2017-09-07 10:30:05', '2017-09-07 10:30:05', null, '1', '1');
INSERT INTO `video_info` VALUES ('628', '1056', '1', '226', '103', '第七课    远离性病.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751427876.mp4', '', null, null, 'mp4', '2017-09-07 10:30:31', '2017-09-07 10:30:31', null, '1', '1');
INSERT INTO `video_info` VALUES ('629', '1087', '1', '226', '103', '第七课    远离性病（说课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751448933.mp4', '', null, null, 'mp4', '2017-09-07 10:30:58', '2017-09-07 10:30:58', null, '1', '1');
INSERT INTO `video_info` VALUES ('630', '1058', '1', '226', '103', '第一课   性与文化.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751481894.mp4', '', null, null, 'mp4', '2017-09-07 10:31:25', '2017-09-07 10:31:25', null, '1', '1');
INSERT INTO `video_info` VALUES ('631', '1088', '1', '226', '103', '第一课   性与文化（说课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751503282.mp4', '', null, null, 'mp4', '2017-09-07 10:31:51', '2017-09-07 10:31:51', null, '1', '1');
INSERT INTO `video_info` VALUES ('632', '1059', '1', '226', '103', '第二课   性别平等.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751531025.mp4', '', null, null, 'mp4', '2017-09-07 10:32:14', '2017-09-07 10:32:14', null, '1', '1');
INSERT INTO `video_info` VALUES ('633', '1089', '1', '226', '103', '第二课   性别平等（说课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751551531.mp4', '', null, null, 'mp4', '2017-09-07 10:32:40', '2017-09-07 10:32:40', null, '1', '1');
INSERT INTO `video_info` VALUES ('634', '1060', '1', '226', '103', '第三课　性权利.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751581741.mp4', '', null, null, 'mp4', '2017-09-07 10:33:05', '2017-09-07 10:33:05', null, '1', '1');
INSERT INTO `video_info` VALUES ('635', '1090', '1', '226', '103', '第三课　性权利（说课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751603798.mp4', '', null, null, 'mp4', '2017-09-07 10:33:31', '2017-09-07 10:33:31', null, '1', '1');
INSERT INTO `video_info` VALUES ('636', '1061', '1', '226', '103', '第四课　多元的性.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751635071.mp4', '', null, null, 'mp4', '2017-09-07 10:33:59', '2017-09-07 10:33:59', null, '1', '1');
INSERT INTO `video_info` VALUES ('637', '1091', '1', '226', '103', '第四课　多元的性（说课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751655998.mp4', '', null, null, 'mp4', '2017-09-07 10:34:23', '2017-09-07 10:34:23', null, '1', '1');
INSERT INTO `video_info` VALUES ('638', '1062', '1', '226', '103', '第五课　性道德.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751682749.mp4', '', null, null, 'mp4', '2017-09-07 10:34:46', '2017-09-07 10:34:46', null, '1', '1');
INSERT INTO `video_info` VALUES ('639', '1092', '1', '226', '103', '第五课　性道德（说课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751703923.mp4', '', null, null, 'mp4', '2017-09-07 10:35:12', '2017-09-07 10:35:12', null, '1', '1');
INSERT INTO `video_info` VALUES ('640', '1063', '1', '226', '103', '第六课　性法律.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751740145.mp4', '', null, null, 'mp4', '2017-09-07 10:35:44', '2017-09-07 10:35:44', null, '1', '1');
INSERT INTO `video_info` VALUES ('641', '1093', '1', '226', '103', '第六课　性法律（说课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751760450.mp4', '', null, null, 'mp4', '2017-09-07 10:36:08', '2017-09-07 10:36:08', null, '1', '1');
INSERT INTO `video_info` VALUES ('642', '1064', '1', '226', '103', '第七课　婚姻与家庭.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751787848.mp4', '', null, null, 'mp4', '2017-09-07 10:36:35', '2017-09-07 10:36:35', null, '1', '1');
INSERT INTO `video_info` VALUES ('643', '1094', '1', '226', '103', '第七课　婚姻与家庭（说课）.mp4', 'resource/103/video/C430C8A7597FEA7595AA70239506716E1504751812184.mp4', '', null, null, 'mp4', '2017-09-07 10:37:00', '2017-09-07 10:37:00', null, '1', '1');
INSERT INTO `video_info` VALUES ('644', '236', '1', '226', '85', '职业生涯发展的目标与措施（说课）.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504751818337.mp4', '', null, null, 'mp4', '2017-09-07 10:37:18', '2017-09-07 10:37:18', null, '1', '1');
INSERT INTO `video_info` VALUES ('645', '235', '1', '226', '85', '职业生涯发展的目标与措施.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504751891384.mp4', '', null, null, 'mp4', '2017-09-07 10:38:15', '2017-09-07 10:38:15', null, '1', '1');
INSERT INTO `video_info` VALUES ('646', '237', '1', '226', '85', '制定职业生涯规划意向书.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504751917820.mp4', '', null, null, 'mp4', '2017-09-07 10:38:48', '2017-09-07 10:38:48', null, '1', '1');
INSERT INTO `video_info` VALUES ('647', '238', '1', '226', '85', '制定职业生涯规划意向书（说课）.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504751946628.mp4', '', null, null, 'mp4', '2017-09-07 10:40:00', '2017-09-07 10:40:00', null, '1', '1');
INSERT INTO `video_info` VALUES ('648', '265', '1', '226', '85', '第一课 创业的意义.mp4', 'resource/85/video/C430C8A7597FEA7595AA70239506716E1504752073813.mp4', '', null, null, 'mp4', '2017-09-07 10:41:17', '2017-09-07 10:41:17', null, '1', '1');
INSERT INTO `video_info` VALUES ('665', '459', '1', '226', '89', '1. 对外开放是强国之路.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504754012784.mp4', '', null, null, 'mp4', '2017-09-07 11:13:36', '2017-09-07 11:13:36', null, '1', '1');
INSERT INTO `video_info` VALUES ('666', '460', '1', '226', '89', '1. 对外开放是强国之路（说课）.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504754035319.mp4', '', null, null, 'mp4', '2017-09-07 11:14:03', '2017-09-07 11:14:03', null, '1', '1');
INSERT INTO `video_info` VALUES ('667', '350', '1', '226', '87', '客观实际是人生选择的前提和基础.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754087491.mp4', '', null, null, 'mp4', '2017-09-07 11:14:51', '2017-09-07 11:14:51', null, '1', '1');
INSERT INTO `video_info` VALUES ('668', '461', '1', '226', '89', '2. 面对全球化 增强开放意识.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504754100836.mp4', '', null, null, 'mp4', '2017-09-07 11:15:04', '2017-09-07 11:15:04', null, '1', '1');
INSERT INTO `video_info` VALUES ('669', '462', '1', '226', '89', '2. 面对全球化 增强开放意识（说课）.mp4', 'resource/89/video/C430C8A7597FEA7595AA70239506716E1504754123925.mp4', '', null, null, 'mp4', '2017-09-07 11:15:38', '2017-09-07 11:15:38', null, '1', '1');
INSERT INTO `video_info` VALUES ('670', '351', '1', '226', '87', '1. 客观实际是人生选择的前提和基础（说课）.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754127961.mp4', '', null, null, 'mp4', '2017-09-07 11:15:40', '2017-09-07 11:15:40', null, '1', '1');
INSERT INTO `video_info` VALUES ('671', '352', '1', '226', '87', '物质世界的多样性与人生选择.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754162274.mp4', '', null, null, 'mp4', '2017-09-07 11:16:07', '2017-09-07 11:16:07', null, '1', '1');
INSERT INTO `video_info` VALUES ('672', '353', '1', '226', '87', '物质世界的多样性与人生选择（说课）.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754192893.mp4', '', null, null, 'mp4', '2017-09-07 11:16:44', '2017-09-07 11:16:44', null, '1', '1');
INSERT INTO `video_info` VALUES ('673', '355', '1', '226', '87', '运动是物质的存在方式.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754224099.mp4', '', null, null, 'mp4', '2017-09-07 11:17:19', '2017-09-07 11:17:19', null, '1', '1');
INSERT INTO `video_info` VALUES ('674', '356', '1', '226', '87', '运动是物质的存在方式（说课）.rar', 'resource/87/video/F57A5C1439ACAF839F0A624B21D2AC891504754271029.mp4', '', null, null, 'rar', '2017-09-07 11:18:19', '2017-09-07 11:18:19', null, '1', '1');
INSERT INTO `video_info` VALUES ('675', '357', '1', '226', '87', '把握客观规律善于行动.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754318787.mp4', '', null, null, 'mp4', '2017-09-07 11:18:42', '2017-09-07 11:18:42', null, '1', '1');
INSERT INTO `video_info` VALUES ('676', '358', '1', '226', '87', '把握客观规律善于行动（说课）.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754345707.mp4', '', null, null, 'mp4', '2017-09-07 11:19:19', '2017-09-07 11:19:19', null, '1', '1');
INSERT INTO `video_info` VALUES ('677', '361', '1', '226', '87', '正确发挥自觉能动性（说课）.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754437550.mp4', '', null, null, 'mp4', '2017-09-07 11:20:53', '2017-09-07 11:20:53', null, '1', '1');
INSERT INTO `video_info` VALUES ('678', '362', '1', '226', '87', '自强不息与成功人生.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754472393.mp4', '', null, null, 'mp4', '2017-09-07 11:21:16', '2017-09-07 11:21:16', null, '1', '1');
INSERT INTO `video_info` VALUES ('679', '508', '1', '226', '88', '第二课 解读心理问题.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754476727.mp4', '', null, null, 'mp4', '2017-09-07 11:21:22', '2017-09-07 11:21:22', null, '1', '1');
INSERT INTO `video_info` VALUES ('680', '363', '1', '226', '87', '自强不息与成功人生（说课）.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754498609.mp4', '', null, null, 'mp4', '2017-09-07 11:21:50', '2017-09-07 11:21:50', null, '1', '1');
INSERT INTO `video_info` VALUES ('681', '509', '1', '226', '88', '第二课 解读心理问题（说课）.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754500285.mp4', '', null, null, 'mp4', '2017-09-07 11:21:53', '2017-09-07 11:21:53', null, '1', '1');
INSERT INTO `video_info` VALUES ('682', '366', '1', '226', '87', '第一课 普遍联系与人际和谐.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754528870.mp4', '', null, null, 'mp4', '2017-09-07 11:22:13', '2017-09-07 11:22:13', null, '1', '1');
INSERT INTO `video_info` VALUES ('683', '510', '1', '226', '88', '第三课 认识心理咨询.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754533646.mp4', '', null, null, 'mp4', '2017-09-07 11:22:17', '2017-09-07 11:22:17', null, '1', '1');
INSERT INTO `video_info` VALUES ('684', '511', '1', '226', '88', '第三课 认识心理咨询（说课）.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754553296.mp4', '', null, null, 'mp4', '2017-09-07 11:22:46', '2017-09-07 11:22:46', null, '1', '1');
INSERT INTO `video_info` VALUES ('685', '365', '1', '226', '87', '用普遍联系的观点看待人际关系.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754561380.mp4', '', null, null, 'mp4', '2017-09-07 11:22:48', '2017-09-07 11:22:48', null, '1', '1');
INSERT INTO `video_info` VALUES ('686', '513', '1', '226', '88', '第一课 认识自我.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754590585.mp4', '', null, null, 'mp4', '2017-09-07 11:23:14', '2017-09-07 11:23:14', null, '1', '1');
INSERT INTO `video_info` VALUES ('687', '367', '1', '226', '87', '用普遍联系的观点看待人际关系（说课）.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754592462.mp4', '', null, null, 'mp4', '2017-09-07 11:23:24', '2017-09-07 11:23:24', null, '1', '1');
INSERT INTO `video_info` VALUES ('688', '515', '1', '226', '88', '第一课 认识自我（说课）.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754619383.mp4', '', null, null, 'mp4', '2017-09-07 11:23:48', '2017-09-07 11:23:48', null, '1', '1');
INSERT INTO `video_info` VALUES ('689', '368', '1', '226', '87', '2. 在复杂多样的联系中营造和谐的人际关系.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754630637.mp4', '', null, null, 'mp4', '2017-09-07 11:23:55', '2017-09-07 11:23:55', null, '1', '1');
INSERT INTO `video_info` VALUES ('690', '516', '1', '226', '88', '第二课 悦纳自我.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754649234.mp4', '', null, null, 'mp4', '2017-09-07 11:24:14', '2017-09-07 11:24:14', null, '1', '1');
INSERT INTO `video_info` VALUES ('691', '369', '1', '226', '87', '2. 在复杂多样的联系中营造和谐的人际关系（说课）.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754657381.mp4', '', null, null, 'mp4', '2017-09-07 11:24:34', '2017-09-07 11:24:34', null, '1', '1');
INSERT INTO `video_info` VALUES ('692', '517', '1', '226', '88', '第二课 悦纳自我（说课）.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754671327.mp4', '', null, null, 'mp4', '2017-09-07 11:24:38', '2017-09-07 11:24:38', null, '1', '1');
INSERT INTO `video_info` VALUES ('693', '518', '1', '226', '88', '第三课 不一样的我.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754697196.mp4', '', null, null, 'mp4', '2017-09-07 11:25:02', '2017-09-07 11:25:02', null, '1', '1');
INSERT INTO `video_info` VALUES ('694', '371', '1', '226', '87', '事物发展的永恒性及其本质.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754692472.mp4', '', null, null, 'mp4', '2017-09-07 11:25:02', '2017-09-07 11:25:02', null, '1', '1');
INSERT INTO `video_info` VALUES ('695', '519', '1', '226', '88', '第三课 不一样的我（说课）.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754719109.mp4', '', null, null, 'mp4', '2017-09-07 11:25:27', '2017-09-07 11:25:27', null, '1', '1');
INSERT INTO `video_info` VALUES ('696', '372', '1', '226', '87', '事物发展的永恒性及其本质（说课）.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754725585.mp4', '', null, null, 'mp4', '2017-09-07 11:25:40', '2017-09-07 11:25:40', null, '1', '1');
INSERT INTO `video_info` VALUES ('697', '520', '1', '226', '88', '第四课 完善自我.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754747231.mp4', '', null, null, 'mp4', '2017-09-07 11:25:51', '2017-09-07 11:25:51', null, '1', '1');
INSERT INTO `video_info` VALUES ('698', '373', '1', '226', '87', '用发展的观点看待顺境与逆境.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754758078.mp4', '', null, null, 'mp4', '2017-09-07 11:26:02', '2017-09-07 11:26:02', null, '1', '1');
INSERT INTO `video_info` VALUES ('699', '521', '1', '226', '88', '第四课 完善自我（说课）.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754769594.mp4', '', null, null, 'mp4', '2017-09-07 11:26:18', '2017-09-07 11:26:18', null, '1', '1');
INSERT INTO `video_info` VALUES ('700', '544', '1', '226', '88', '第一课 学习适应.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754801937.mp4', '', null, null, 'mp4', '2017-09-07 11:26:45', '2017-09-07 11:26:45', null, '1', '1');
INSERT INTO `video_info` VALUES ('701', '374', '1', '226', '87', '用发展的观点看待顺境与逆境（说课）.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754795791.mp4', '', null, null, 'mp4', '2017-09-07 11:26:49', '2017-09-07 11:26:49', null, '1', '1');
INSERT INTO `video_info` VALUES ('702', '545', '1', '226', '88', '第一课 学习适应（说课）.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754823839.mp4', '', null, null, 'mp4', '2017-09-07 11:27:12', '2017-09-07 11:27:12', null, '1', '1');
INSERT INTO `video_info` VALUES ('703', '376', '1', '226', '87', '矛盾是事物发展的动力.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754833369.mp4', '', null, null, 'mp4', '2017-09-07 11:27:17', '2017-09-07 11:27:17', null, '1', '1');
INSERT INTO `video_info` VALUES ('704', '546', '1', '226', '88', '第二课 学习方法.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754856414.mp4', '', null, null, 'mp4', '2017-09-07 11:27:39', '2017-09-07 11:27:39', null, '1', '1');
INSERT INTO `video_info` VALUES ('705', '377', '1', '226', '87', '矛盾是事物发展的动力（说课）.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754864815.mp4', '', null, null, 'mp4', '2017-09-07 11:27:58', '2017-09-07 11:27:58', null, '1', '1');
INSERT INTO `video_info` VALUES ('706', '547', '1', '226', '88', '第二课 学习方法（说课）.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754875660.mp4', '', null, null, 'mp4', '2017-09-07 11:28:04', '2017-09-07 11:28:04', null, '1', '1');
INSERT INTO `video_info` VALUES ('707', '378', '1', '226', '87', '矛盾是人生发展的动力.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754894894.mp4', '', null, null, 'mp4', '2017-09-07 11:28:18', '2017-09-07 11:28:18', null, '1', '1');
INSERT INTO `video_info` VALUES ('708', '548', '1', '226', '88', '第三课 时间管理.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754903556.mp4', '', null, null, 'mp4', '2017-09-07 11:28:27', '2017-09-07 11:28:27', null, '1', '1');
INSERT INTO `video_info` VALUES ('709', '549', '1', '226', '88', '第三课 时间管理（说课）.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754924136.mp4', '', null, null, 'mp4', '2017-09-07 11:28:51', '2017-09-07 11:28:51', null, '1', '1');
INSERT INTO `video_info` VALUES ('710', '550', '1', '226', '88', '第四课 快乐学习.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754951570.mp4', '', null, null, 'mp4', '2017-09-07 11:29:15', '2017-09-07 11:29:15', null, '1', '1');
INSERT INTO `video_info` VALUES ('711', '379', '1', '226', '87', '矛盾是人生发展的动力（说课）.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754956489.mp4', '', null, null, 'mp4', '2017-09-07 11:29:20', '2017-09-07 11:29:20', null, '1', '1');
INSERT INTO `video_info` VALUES ('712', '551', '1', '226', '88', '第四课 快乐学习（说课）.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754971689.mp4', '', null, null, 'mp4', '2017-09-07 11:29:39', '2017-09-07 11:29:39', null, '1', '1');
INSERT INTO `video_info` VALUES ('713', '382', '1', '226', '87', '在实践中寻求真知.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504754986872.mp4', '', null, null, 'mp4', '2017-09-07 11:29:50', '2017-09-07 11:29:50', null, '1', '1');
INSERT INTO `video_info` VALUES ('714', '572', '1', '226', '88', '第一课 积极心理.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504754999656.mp4', '', null, null, 'mp4', '2017-09-07 11:30:02', '2017-09-07 11:30:02', null, '1', '1');
INSERT INTO `video_info` VALUES ('715', '383', '1', '226', '87', '在实践中寻求真知（说课）.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755006070.mp4', '', null, null, 'mp4', '2017-09-07 11:30:21', '2017-09-07 11:30:21', null, '1', '1');
INSERT INTO `video_info` VALUES ('716', '573', '1', '226', '88', '第一课 积极心理（说课）.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755018557.mp4', '', null, null, 'mp4', '2017-09-07 11:30:26', '2017-09-07 11:30:26', null, '1', '1');
INSERT INTO `video_info` VALUES ('717', '384', '1', '226', '87', '在实践中快乐成长.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755037494.mp4', '', null, null, 'mp4', '2017-09-07 11:30:41', '2017-09-07 11:30:41', null, '1', '1');
INSERT INTO `video_info` VALUES ('718', '574', '1', '226', '88', '第二课 幸福心理.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755048265.mp4', '', null, null, 'mp4', '2017-09-07 11:30:51', '2017-09-07 11:30:51', null, '1', '1');
INSERT INTO `video_info` VALUES ('719', '385', '1', '226', '87', '在实践中快乐成长（说课）.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755061092.mp4', '', null, null, 'mp4', '2017-09-07 11:31:16', '2017-09-07 11:31:16', null, '1', '1');
INSERT INTO `video_info` VALUES ('720', '575', '1', '226', '88', '第二课 幸福心理（说课）.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755068460.mp4', '', null, null, 'mp4', '2017-09-07 11:31:16', '2017-09-07 11:31:16', null, '1', '1');
INSERT INTO `video_info` VALUES ('721', '387', '1', '226', '87', '把握事物的本质.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755098470.mp4', '', null, null, 'mp4', '2017-09-07 11:31:41', '2017-09-07 11:31:41', null, '1', '1');
INSERT INTO `video_info` VALUES ('722', '530', '1', '226', '88', '第一课 人际交往.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755104283.mp4', '', null, null, 'mp4', '2017-09-07 11:31:47', '2017-09-07 11:31:47', null, '1', '1');
INSERT INTO `video_info` VALUES ('723', '388', '1', '226', '87', '把握事物的本质（说课）.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755117328.mp4', '', null, null, 'mp4', '2017-09-07 11:32:09', '2017-09-07 11:32:09', null, '1', '1');
INSERT INTO `video_info` VALUES ('724', '531', '1', '226', '88', '第一课 人际交往（说课）.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755125986.mp4', '', null, null, 'mp4', '2017-09-07 11:32:15', '2017-09-07 11:32:15', null, '1', '1');
INSERT INTO `video_info` VALUES ('725', '389', '1', '226', '87', '. 提高辨识能力.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755144737.mp4', '', null, null, 'mp4', '2017-09-07 11:32:28', '2017-09-07 11:32:28', null, '1', '1');
INSERT INTO `video_info` VALUES ('726', '532', '1', '226', '88', '第二课 人际冲突.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755155946.mp4', '', null, null, 'mp4', '2017-09-07 11:32:39', '2017-09-07 11:32:39', null, '1', '1');
INSERT INTO `video_info` VALUES ('727', '390', '1', '226', '87', '提高辨识能力（说课）.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755163917.mp4', '', null, null, 'mp4', '2017-09-07 11:32:59', '2017-09-07 11:32:59', null, '1', '1');
INSERT INTO `video_info` VALUES ('728', '533', '1', '226', '88', '第二课 人际冲突（说课）.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755176716.mp4', '', null, null, 'mp4', '2017-09-07 11:33:04', '2017-09-07 11:33:04', null, '1', '1');
INSERT INTO `video_info` VALUES ('729', '392', '1', '226', '87', '培养科学的思维方法.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755199452.mp4', '', null, null, 'mp4', '2017-09-07 11:33:23', '2017-09-07 11:33:23', null, '1', '1');
INSERT INTO `video_info` VALUES ('730', '534', '1', '226', '88', '第三课 人际沟通—语言沟通.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755203780.mp4', '', null, null, 'mp4', '2017-09-07 11:33:27', '2017-09-07 11:33:27', null, '1', '1');
INSERT INTO `video_info` VALUES ('731', '535', '1', '226', '88', '第三课 人际沟通—语言沟通（说课）.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755225206.mp4', '', null, null, 'mp4', '2017-09-07 11:33:54', '2017-09-07 11:33:54', null, '1', '1');
INSERT INTO `video_info` VALUES ('732', '393', '1', '226', '87', '培养科学的思维方法（说课）.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755224732.mp4', '', null, null, 'mp4', '2017-09-07 11:33:57', '2017-09-07 11:33:57', null, '1', '1');
INSERT INTO `video_info` VALUES ('733', '536', '1', '226', '88', '第四课 人际沟通—非语言沟通.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755257957.mp4', '', null, null, 'mp4', '2017-09-07 11:34:21', '2017-09-07 11:34:21', null, '1', '1');
INSERT INTO `video_info` VALUES ('734', '394', '1', '226', '87', '提高创新能力.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755257019.mp4', '', null, null, 'mp4', '2017-09-07 11:34:22', '2017-09-07 11:34:22', null, '1', '1');
INSERT INTO `video_info` VALUES ('735', '537', '1', '226', '88', '第四课 人际沟通—非语言沟通（说课）.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755278154.mp4', '', null, null, 'mp4', '2017-09-07 11:34:46', '2017-09-07 11:34:46', null, '1', '1');
INSERT INTO `video_info` VALUES ('736', '395', '1', '226', '87', '提高创新能力（说课）.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755277936.mp4', '', null, null, 'mp4', '2017-09-07 11:34:47', '2017-09-07 11:34:47', null, '1', '1');
INSERT INTO `video_info` VALUES ('737', '523', '1', '226', '88', '第一课 认识情绪.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755306860.mp4', '', null, null, 'mp4', '2017-09-07 11:35:11', '2017-09-07 11:35:11', null, '1', '1');
INSERT INTO `video_info` VALUES ('738', '398', '1', '226', '87', '历史规律的特点.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755314394.mp4', '', null, null, 'mp4', '2017-09-07 11:35:19', '2017-09-07 11:35:19', null, '1', '1');
INSERT INTO `video_info` VALUES ('739', '399', '1', '226', '87', '历史规律的特点（说课）.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755334860.mp4', '', null, null, 'mp4', '2017-09-07 11:35:44', '2017-09-07 11:35:44', null, '1', '1');
INSERT INTO `video_info` VALUES ('740', '400', '1', '226', '87', '实现人生目标必须符合历史规律.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755359640.mp4', '', null, null, 'mp4', '2017-09-07 11:36:04', '2017-09-07 11:36:04', null, '1', '1');
INSERT INTO `video_info` VALUES ('741', '401', '1', '226', '87', '2. 实现人生目标必须符合历史规律（说课）.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755380846.mp4', '', null, null, 'mp4', '2017-09-07 11:36:32', '2017-09-07 11:36:32', null, '1', '1');
INSERT INTO `video_info` VALUES ('742', '1118', '1', '226', '88', '第一课 认识情绪（说课）.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755394539.mp4', '', null, null, 'mp4', '2017-09-07 11:36:42', '2017-09-07 11:36:42', null, '1', '1');
INSERT INTO `video_info` VALUES ('743', '403', '1', '226', '87', '个人理想与社会理想.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755416413.mp4', '', null, null, 'mp4', '2017-09-07 11:37:01', '2017-09-07 11:37:01', null, '1', '1');
INSERT INTO `video_info` VALUES ('744', '525', '1', '226', '88', '第二课 调控情绪.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755426940.mp4', '', null, null, 'mp4', '2017-09-07 11:37:12', '2017-09-07 11:37:12', null, '1', '1');
INSERT INTO `video_info` VALUES ('745', '404', '1', '226', '87', '个人理想与社会理想（说课）.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755440928.mp4', '', null, null, 'mp4', '2017-09-07 11:37:38', '2017-09-07 11:37:38', null, '1', '1');
INSERT INTO `video_info` VALUES ('746', '526', '1', '226', '88', '第二课 调控情绪（说课）.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755451890.mp4', '', null, null, 'mp4', '2017-09-07 11:37:39', '2017-09-07 11:37:39', null, '1', '1');
INSERT INTO `video_info` VALUES ('747', '405', '1', '226', '87', '理想与现实.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755474051.mp4', '', null, null, 'mp4', '2017-09-07 11:37:58', '2017-09-07 11:37:58', null, '1', '1');
INSERT INTO `video_info` VALUES ('748', '527', '1', '226', '88', '第三课 情绪ABC.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755476754.mp4', '', null, null, 'mp4', '2017-09-07 11:38:00', '2017-09-07 11:38:00', null, '1', '1');
INSERT INTO `video_info` VALUES ('749', '528', '1', '226', '88', '第三课 情绪ABC（说课）.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755496138.mp4', '', null, null, 'mp4', '2017-09-07 11:38:24', '2017-09-07 11:38:24', null, '1', '1');
INSERT INTO `video_info` VALUES ('750', '560', '1', '226', '88', '第一课 挫折.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755529938.mp4', '', null, null, 'mp4', '2017-09-07 11:38:55', '2017-09-07 11:38:55', null, '1', '1');
INSERT INTO `video_info` VALUES ('751', '406', '1', '226', '87', '理想与现实（说课）.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755523842.mp4', '', null, null, 'mp4', '2017-09-07 11:39:00', '2017-09-07 11:39:00', null, '1', '1');
INSERT INTO `video_info` VALUES ('752', '561', '1', '226', '88', '第一课 挫折（说课）.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755553484.mp4', '', null, null, 'mp4', '2017-09-07 11:39:21', '2017-09-07 11:39:21', null, '1', '1');
INSERT INTO `video_info` VALUES ('753', '408', '1', '226', '87', '实现理想需要坚强的意志.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755561725.mp4', '', null, null, 'mp4', '2017-09-07 11:39:27', '2017-09-07 11:39:27', null, '1', '1');
INSERT INTO `video_info` VALUES ('754', '562', '1', '226', '88', '第二课 压力应对.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755579691.mp4', '', null, null, 'mp4', '2017-09-07 11:39:44', '2017-09-07 11:39:44', null, '1', '1');
INSERT INTO `video_info` VALUES ('755', '409', '1', '226', '87', '实现理想需要坚强的意志（说课）.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755585658.mp4', '', null, null, 'mp4', '2017-09-07 11:39:56', '2017-09-07 11:39:56', null, '1', '1');
INSERT INTO `video_info` VALUES ('756', '563', '1', '226', '88', '第二课 压力应对（说课）.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755603332.mp4', '', null, null, 'mp4', '2017-09-07 11:40:10', '2017-09-07 11:40:10', null, '1', '1');
INSERT INTO `video_info` VALUES ('757', '410', '1', '226', '87', '实现理想要敢于担当.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755612803.mp4', '', null, null, 'mp4', '2017-09-07 11:40:18', '2017-09-07 11:40:18', null, '1', '1');
INSERT INTO `video_info` VALUES ('758', '564', '1', '226', '88', '第三课 危机干预.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755628822.mp4', '', null, null, 'mp4', '2017-09-07 11:40:32', '2017-09-07 11:40:32', null, '1', '1');
INSERT INTO `video_info` VALUES ('759', '565', '1', '226', '88', '第三课 危机干预（说课）.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755649801.mp4', '', null, null, 'mp4', '2017-09-07 11:40:57', '2017-09-07 11:40:57', null, '1', '1');
INSERT INTO `video_info` VALUES ('760', '411', '1', '226', '87', '实现理想要敢于担当（说课）.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755634332.mp4', '', null, null, 'mp4', '2017-09-07 11:40:59', '2017-09-07 11:40:59', null, '1', '1');
INSERT INTO `video_info` VALUES ('761', '414', '1', '226', '87', '人是社会存在物.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755677333.mp4', '', null, null, 'mp4', '2017-09-07 11:41:21', '2017-09-07 11:41:21', null, '1', '1');
INSERT INTO `video_info` VALUES ('762', '567', '1', '226', '88', '第一课 生命教育.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755679952.mp4', '', null, null, 'mp4', '2017-09-07 11:41:23', '2017-09-07 11:41:23', null, '1', '1');
INSERT INTO `video_info` VALUES ('763', '568', '1', '226', '88', '第一课 生命教育（说课）.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755700039.mp4', '', null, null, 'mp4', '2017-09-07 11:41:47', '2017-09-07 11:41:47', null, '1', '1');
INSERT INTO `video_info` VALUES ('764', '415', '1', '226', '87', '人是社会存在物（说课）.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755704642.mp4', '', null, null, 'mp4', '2017-09-07 11:41:59', '2017-09-07 11:41:59', null, '1', '1');
INSERT INTO `video_info` VALUES ('765', '569', '1', '226', '88', '第二课 生命价值观.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755726707.mp4', '', null, null, 'mp4', '2017-09-07 11:42:10', '2017-09-07 11:42:10', null, '1', '1');
INSERT INTO `video_info` VALUES ('766', '416', '1', '226', '87', '个人与集体的关系.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755735793.mp4', '', null, null, 'mp4', '2017-09-07 11:42:19', '2017-09-07 11:42:19', null, '1', '1');
INSERT INTO `video_info` VALUES ('767', '570', '1', '226', '88', '第二课 生命价值观（说课）.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755747653.mp4', '', null, null, 'mp4', '2017-09-07 11:42:34', '2017-09-07 11:42:34', null, '1', '1');
INSERT INTO `video_info` VALUES ('768', '417', '1', '226', '87', '个人与集体的关系（说课）.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755757173.mp4', '', null, null, 'mp4', '2017-09-07 11:42:48', '2017-09-07 11:42:48', null, '1', '1');
INSERT INTO `video_info` VALUES ('769', '539', '1', '226', '88', '第一课 如何谈恋爱.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755777237.mp4', '', null, null, 'mp4', '2017-09-07 11:43:00', '2017-09-07 11:43:00', null, '1', '1');
INSERT INTO `video_info` VALUES ('770', '419', '1', '226', '87', '自我价值.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755788171.mp4', '', null, null, 'mp4', '2017-09-07 11:43:15', '2017-09-07 11:43:15', null, '1', '1');
INSERT INTO `video_info` VALUES ('771', '540', '1', '226', '88', '第一课 如何谈恋爱（说课）.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755798471.mp4', '', null, null, 'mp4', '2017-09-07 11:43:26', '2017-09-07 11:43:26', null, '1', '1');
INSERT INTO `video_info` VALUES ('772', '421', '1', '226', '87', '自我价值（说课）.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755811731.mp4', '', null, null, 'mp4', '2017-09-07 11:43:41', '2017-09-07 11:43:41', null, '1', '1');
INSERT INTO `video_info` VALUES ('773', '541', '1', '226', '88', '第二课 爱情底线在哪里.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755828049.mp4', '', null, null, 'mp4', '2017-09-07 11:43:52', '2017-09-07 11:43:52', null, '1', '1');
INSERT INTO `video_info` VALUES ('774', '422', '1', '226', '87', '劳动奉献与人的价值.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755845846.mp4', '', null, null, 'mp4', '2017-09-07 11:44:09', '2017-09-07 11:44:09', null, '1', '1');
INSERT INTO `video_info` VALUES ('775', '542', '1', '226', '88', '第二课 爱情底线在哪里（说课）.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755857580.mp4', '', null, null, 'mp4', '2017-09-07 11:44:25', '2017-09-07 11:44:25', null, '1', '1');
INSERT INTO `video_info` VALUES ('776', '423', '1', '226', '87', '劳动奉献与人的价值（说课）.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755867151.mp4', '', null, null, 'mp4', '2017-09-07 11:44:38', '2017-09-07 11:44:38', null, '1', '1');
INSERT INTO `video_info` VALUES ('777', '553', '1', '226', '88', '第一课 网络与心理健康.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755886758.mp4', '', null, null, 'mp4', '2017-09-07 11:44:50', '2017-09-07 11:44:50', null, '1', '1');
INSERT INTO `video_info` VALUES ('778', '425', '1', '226', '87', '努力实现人的全面发展.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755900745.mp4', '', null, null, 'mp4', '2017-09-07 11:45:04', '2017-09-07 11:45:04', null, '1', '1');
INSERT INTO `video_info` VALUES ('779', '554', '1', '226', '88', '第一课 网络与心理健康（说课）.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755906064.mp4', '', null, null, 'mp4', '2017-09-07 11:45:16', '2017-09-07 11:45:16', null, '1', '1');
INSERT INTO `video_info` VALUES ('780', '426', '1', '226', '87', '1. 努力实现人的全面发展（说课）.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755931831.mp4', '', null, null, 'mp4', '2017-09-07 11:45:38', '2017-09-07 11:45:38', null, '1', '1');
INSERT INTO `video_info` VALUES ('781', '555', '1', '226', '88', '第二课 网络依赖.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755937656.mp4', '', null, null, 'mp4', '2017-09-07 11:45:41', '2017-09-07 11:45:41', null, '1', '1');
INSERT INTO `video_info` VALUES ('782', '427', '1', '226', '87', '在社会发展中实现人的个性自由.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755955587.mp4', '', null, null, 'mp4', '2017-09-07 11:45:59', '2017-09-07 11:45:59', null, '1', '1');
INSERT INTO `video_info` VALUES ('783', '556', '1', '226', '88', '第二课 网络依赖（说课）.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755957372.mp4', '', null, null, 'mp4', '2017-09-07 11:46:06', '2017-09-07 11:46:06', null, '1', '1');
INSERT INTO `video_info` VALUES ('784', '428', '1', '226', '87', '社会发展中实现人的个性自由（说课）.mp4', 'resource/87/video/C430C8A7597FEA7595AA70239506716E1504755976598.mp4', '', null, null, 'mp4', '2017-09-07 11:46:28', '2017-09-07 11:46:28', null, '1', '1');
INSERT INTO `video_info` VALUES ('785', '557', '1', '226', '88', '第三课 游戏成瘾.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504755984915.mp4', '', null, null, 'mp4', '2017-09-07 11:46:28', '2017-09-07 11:46:28', null, '1', '1');
INSERT INTO `video_info` VALUES ('786', '558', '1', '226', '88', '第三课 游戏成瘾（说课）.mp4', 'resource/88/video/C430C8A7597FEA7595AA70239506716E1504756005052.mp4', '', null, null, 'mp4', '2017-09-07 11:46:52', '2017-09-07 11:46:52', null, '1', '1');
INSERT INTO `video_info` VALUES ('787', '360', '1', '226', '87', '一、正确发挥自觉能动性.mp4', 'resource/87/video/6B9594A4C767EF7498E28C2009F972521505097242218.mp4', '', null, null, 'mp4', '2017-09-11 10:34:10', '2017-09-11 10:34:10', null, '1', '1');
INSERT INTO `video_info` VALUES ('788', '1121', '1', '226', '103', '4.8 第八课 预防艾滋病 说课.mp4', 'resource/103/video/DDEA9C75001B744F97E754FEE33292DD1505118254052.mp4', '', null, null, 'mp4', '2017-09-11 16:24:19', '2017-09-11 16:24:19', null, '0', '0');
INSERT INTO `video_info` VALUES ('789', '1122', '1', '226', '103', '4.8 第八课 预防艾滋病 说课.mp4', 'resource/103/video/DDEA9C75001B744F97E754FEE33292DD1505118330181.mp4', '', null, null, 'mp4', '2017-09-11 16:25:35', '2017-09-11 16:25:35', null, '0', '0');
INSERT INTO `video_info` VALUES ('790', '1139', '1', '226', '104', '第一课  古韵悠长——高山流水.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374396060.mp4', '', null, null, 'mp4', '2017-09-14 15:09:11', '2017-09-14 15:09:11', null, '1', '1');
INSERT INTO `video_info` VALUES ('791', '1125', '1', '226', '104', '第一课  巴蜀之音——盼红军.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374876191.mp4', '', null, null, 'mp4', '2017-09-14 15:10:05', '2017-09-14 15:10:05', null, '1', '1');
INSERT INTO `video_info` VALUES ('792', '1148', '1', '226', '104', '第一课  蝴蝶的爱情——梁祝.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505373406839.mp4', '', null, null, 'mp4', '2017-09-14 15:17:20', '2017-09-14 15:17:20', null, '1', '1');
INSERT INTO `video_info` VALUES ('793', '1126', '1', '226', '104', '02 江南小调——《茉莉花》.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505373439788.mp4', '', null, null, 'mp4', '2017-09-14 15:17:23', '2017-09-14 15:17:23', null, '1', '1');
INSERT INTO `video_info` VALUES ('794', '1149', '1', '226', '104', '第二课    屈人生——命运交响曲.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505373470008.mp4', '', null, null, 'mp4', '2017-09-14 15:17:52', '2017-09-14 15:17:52', null, '1', '1');
INSERT INTO `video_info` VALUES ('795', '1150', '1', '226', '104', '第三课    民族之魂——我的祖国交响诗套曲之《伏尔塔瓦河》.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505373528307.mp4', '', null, null, 'mp4', '2017-09-14 15:19:02', '2017-09-14 15:19:02', null, '1', '1');
INSERT INTO `video_info` VALUES ('796', '1151', '1', '226', '104', '第四课    硝烟弥漫——1812序曲.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505373566557.mp4', '', null, null, 'mp4', '2017-09-14 15:19:37', '2017-09-14 15:19:37', null, '1', '1');
INSERT INTO `video_info` VALUES ('797', '1152', '1', '226', '104', '第五课    交响素描——大海.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505373592527.mp4', '', null, null, 'mp4', '2017-09-14 15:20:14', '2017-09-14 15:20:14', null, '1', '1');
INSERT INTO `video_info` VALUES ('798', '1153', '1', '226', '104', '第一课  春的韵律——春舞.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505373628695.mp4', '', null, null, 'mp4', '2017-09-14 15:20:37', '2017-09-14 15:20:37', null, '1', '1');
INSERT INTO `video_info` VALUES ('799', '1155', '1', '226', '104', '第三课     浪漫音诗——爱之梦.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505373669537.mp4', '', null, null, 'mp4', '2017-09-14 15:21:12', '2017-09-14 15:21:12', null, '1', '1');
INSERT INTO `video_info` VALUES ('800', '1127', '1', '226', '104', '1-3 黄河大合唱——《保卫黄河》.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505373672462.mp4', '', null, null, 'mp4', '2017-09-14 15:21:15', '2017-09-14 15:21:15', null, '1', '1');
INSERT INTO `video_info` VALUES ('801', '1156', '1', '226', '104', '第二课     节日欢歌——春节序曲.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505373696577.mp4', '', null, null, 'mp4', '2017-09-14 15:21:45', '2017-09-14 15:21:45', null, '1', '1');
INSERT INTO `video_info` VALUES ('802', '1162', '1', '226', '104', '第四课     诗人情怀——升c小调幻想即兴曲.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505373870262.mp4', '', null, null, 'mp4', '2017-09-14 15:24:33', '2017-09-14 15:24:33', null, '1', '1');
INSERT INTO `video_info` VALUES ('803', '1128', '1', '226', '104', '1-4 歌声飞扬——《乘着歌声的翅膀》.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505373880835.mp4', '', null, null, 'mp4', '2017-09-14 15:24:45', '2017-09-14 15:24:45', null, '1', '1');
INSERT INTO `video_info` VALUES ('804', '1157', '1', '226', '104', '第五课     动物的聚会——动物狂欢.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505373911280.mp4', '', null, null, 'mp4', '2017-09-14 15:25:16', '2017-09-14 15:25:16', null, '1', '1');
INSERT INTO `video_info` VALUES ('805', '1129', '1', '226', '104', '1-5 拿波里民谣——《我的太阳》.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505373991303.mp4', '', null, null, 'mp4', '2017-09-14 15:26:38', '2017-09-14 15:26:38', null, '1', '1');
INSERT INTO `video_info` VALUES ('806', '1131', '1', '226', '104', '1-6 拉美之声——《美丽小天使》.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374049729.mp4', '', null, null, 'mp4', '2017-09-14 15:27:32', '2017-09-14 15:27:32', null, '1', '1');
INSERT INTO `video_info` VALUES ('807', '1158', '1', '226', '104', '第六课   蓝色梦幻——蓝色多瑙河.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374049099.mp4', '', null, null, 'mp4', '2017-09-14 15:27:32', '2017-09-14 15:27:32', null, '1', '1');
INSERT INTO `video_info` VALUES ('808', '1132', '1', '226', '104', '1-7 爵士乐——《不知为何》.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374096378.mp4', '', null, null, 'mp4', '2017-09-14 15:28:18', '2017-09-14 15:28:18', null, '1', '1');
INSERT INTO `video_info` VALUES ('809', '1159', '1', '226', '104', '第七课  灵动之美——天鹅湖.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374112541.mp4', '', null, null, 'mp4', '2017-09-14 15:28:54', '2017-09-14 15:28:54', null, '1', '1');
INSERT INTO `video_info` VALUES ('810', '1160', '1', '226', '104', '第八课  音画印象——水中倒影.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374170328.mp4', '', null, null, 'mp4', '2017-09-14 15:29:43', '2017-09-14 15:29:43', null, '1', '1');
INSERT INTO `video_info` VALUES ('811', '1161', '1', '226', '104', '第九课  律动之美——波莱罗舞曲.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374842411.mp4', '', null, null, 'mp4', '2017-09-14 15:30:04', '2017-09-14 15:30:04', null, '1', '1');
INSERT INTO `video_info` VALUES ('812', '1133', '1', '226', '104', '第八课    音乐剧《猫》——memory.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374300223.mp4', '', null, null, 'mp4', '2017-09-14 15:31:43', '2017-09-14 15:31:43', null, '1', '1');
INSERT INTO `video_info` VALUES ('813', '1134', '1', '226', '104', '第九课    歌剧《卡门》——哈巴涅拉舞曲.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374352408.mp4', '', null, null, 'mp4', '2017-09-14 15:32:41', '2017-09-14 15:32:41', null, '1', '1');
INSERT INTO `video_info` VALUES ('814', '1140', '1', '226', '104', '第二课    战鼓声声——十面埋伏.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374428365.mp4', '', null, null, 'mp4', '2017-09-14 15:33:58', '2017-09-14 15:33:58', null, '1', '1');
INSERT INTO `video_info` VALUES ('815', '1141', '1', '226', '104', '第三课    落日余晖——渔舟唱晚.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374620694.mp4', '', null, null, 'mp4', '2017-09-14 15:37:09', '2017-09-14 15:37:09', null, '1', '1');
INSERT INTO `video_info` VALUES ('816', '1143', '1', '226', '104', '第五课    凄美旋律——二泉映月.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374691263.mp4', '', null, null, 'mp4', '2017-09-14 15:38:20', '2017-09-14 15:38:20', null, '1', '1');
INSERT INTO `video_info` VALUES ('817', '1144', '1', '226', '104', '第六课    喜庆唢呐——百鸟朝凤.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374751447.mp4', '', null, null, 'mp4', '2017-09-14 15:39:16', '2017-09-14 15:39:16', null, '1', '1');
INSERT INTO `video_info` VALUES ('818', '1145', '1', '226', '104', '第七课    锵锵京调——夜深沉.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374780946.mp4', '', null, null, 'mp4', '2017-09-14 15:39:46', '2017-09-14 15:39:46', null, '1', '1');
INSERT INTO `video_info` VALUES ('819', '1146', '1', '226', '104', '第八课   童真童趣——滚核桃.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374806343.mp4', '', null, null, 'mp4', '2017-09-14 15:40:13', '2017-09-14 15:40:13', null, '1', '1');
INSERT INTO `video_info` VALUES ('820', '1142', '1', '226', '104', '第四课    洒脱不羁——酒狂.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505374959190.mp4', '', null, null, 'mp4', '2017-09-14 15:42:49', '2017-09-14 15:42:49', null, '1', '1');
INSERT INTO `video_info` VALUES ('821', '1147', '1', '226', '104', '第九课    诗情画意——春江花月夜.mp4', 'resource/104/video/C430C8A7597FEA7595AA70239506716E1505375011937.mp4', '', null, null, 'mp4', '2017-09-14 15:43:39', '2017-09-14 15:43:39', null, '1', '1');
INSERT INTO `video_info` VALUES ('822', '1165', '1', '226', '105', '第一课 做真实的自己.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506504259168.mp4', '', null, null, 'mp4', '2017-09-27 17:24:22', '2017-09-27 17:24:22', null, '1', '1');
INSERT INTO `video_info` VALUES ('823', '1166', '1', '226', '105', '第二课 实诚于己.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506504287403.mp4', '', null, null, 'mp4', '2017-09-27 17:24:56', '2017-09-27 17:24:56', null, '1', '1');
INSERT INTO `video_info` VALUES ('824', '1167', '1', '226', '105', '第三课 坦诚待人.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506504324484.mp4', '', null, null, 'mp4', '2017-09-27 17:25:32', '2017-09-27 17:25:32', null, '1', '1');
INSERT INTO `video_info` VALUES ('825', '1169', '1', '226', '105', '第一课 自信，源自内心的力量.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506504347641.mp4', '', null, null, 'mp4', '2017-09-27 17:25:56', '2017-09-27 17:25:56', null, '1', '1');
INSERT INTO `video_info` VALUES ('826', '1170', '1', '226', '105', '第二课 找到属于你自己的那把钥匙.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506504375642.mp4', '', null, null, 'mp4', '2017-09-27 17:26:25', '2017-09-27 17:26:25', null, '1', '1');
INSERT INTO `video_info` VALUES ('827', '1171', '1', '226', '105', '第三课 青春，我们自信前行.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506504398617.mp4', '', null, null, 'mp4', '2017-09-27 17:26:50', '2017-09-27 17:26:50', null, '1', '1');
INSERT INTO `video_info` VALUES ('828', '1173', '1', '226', '105', '第一课 乐观是一种力量.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506504561895.mp4', '', null, null, 'mp4', '2017-09-27 17:29:47', '2017-09-27 17:29:47', null, '1', '1');
INSERT INTO `video_info` VALUES ('829', '1174', '1', '226', '105', '第二课 活出乐观的自己.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506504602488.mp4', '', null, null, 'mp4', '2017-09-27 17:30:19', '2017-09-27 17:30:19', null, '1', '1');
INSERT INTO `video_info` VALUES ('830', '1175', '1', '226', '105', '第三课 做一个乐观的人.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506504635761.mp4', '', null, null, 'mp4', '2017-09-27 17:30:46', '2017-09-27 17:30:46', null, '1', '1');
INSERT INTO `video_info` VALUES ('831', '1177', '1', '226', '105', '第一课 知恩于心.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506504669048.mp4', '', null, null, 'mp4', '2017-09-27 17:31:16', '2017-09-27 17:31:16', null, '1', '1');
INSERT INTO `video_info` VALUES ('832', '1178', '1', '226', '105', '第二课 感恩于情.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506504688955.mp4', '', null, null, 'mp4', '2017-09-27 17:31:39', '2017-09-27 17:31:39', null, '1', '1');
INSERT INTO `video_info` VALUES ('833', '1179', '1', '226', '105', '第三课 懂报恩，能施恩.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506504712550.mp4', '', null, null, 'mp4', '2017-09-27 17:32:22', '2017-09-27 17:32:22', null, '1', '1');
INSERT INTO `video_info` VALUES ('834', '1181', '1', '226', '105', '第一课 做一个自尊自爱的人.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506504808700.mp4', '', null, null, 'mp4', '2017-09-27 17:33:41', '2017-09-27 17:33:41', null, '1', '1');
INSERT INTO `video_info` VALUES ('835', '1182', '1', '226', '105', '第二课 构建长幼有序的人际关系.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506504835703.mp4', '', null, null, 'mp4', '2017-09-27 17:36:15', '2017-09-27 17:36:15', null, '1', '1');
INSERT INTO `video_info` VALUES ('836', '1183', '1', '226', '105', '第三课 实现万物共生的社会生态格局.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506504992206.mp4', '', null, null, 'mp4', '2017-09-27 17:36:41', '2017-09-27 17:36:41', null, '1', '1');
INSERT INTO `video_info` VALUES ('837', '1186', '1', '226', '105', '第二课 对自己尽责.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506505046537.mp4', '', null, null, 'mp4', '2017-09-27 17:37:46', '2017-09-27 17:37:46', null, '1', '1');
INSERT INTO `video_info` VALUES ('838', '1187', '1', '226', '105', '第三课 社会责任需要担当.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506505080364.mp4', '', null, null, 'mp4', '2017-09-27 17:38:08', '2017-09-27 17:38:08', null, '1', '1');
INSERT INTO `video_info` VALUES ('839', '1189', '1', '226', '105', '第一课 我眼中的宽容.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506505570771.mp4', '', null, null, 'mp4', '2017-09-27 17:46:23', '2017-09-27 17:46:23', null, '1', '1');
INSERT INTO `video_info` VALUES ('840', '1190', '1', '226', '105', '第二课 宽容的限度.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506505613226.mp4', '', null, null, 'mp4', '2017-09-27 17:47:02', '2017-09-27 17:47:02', null, '1', '1');
INSERT INTO `video_info` VALUES ('841', '1191', '1', '226', '105', '第三课 力行宽容.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506505638650.mp4', '', null, null, 'mp4', '2017-09-27 17:47:36', '2017-09-27 17:47:36', null, '1', '1');
INSERT INTO `video_info` VALUES ('842', '1193', '1', '226', '105', '第一课 沟通，从心开始.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506505681572.mp4', '', null, null, 'mp4', '2017-09-27 17:48:12', '2017-09-27 17:48:12', null, '1', '1');
INSERT INTO `video_info` VALUES ('843', '1194', '1', '226', '105', '第二课 表达与倾听.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506505705009.mp4', '', null, null, 'mp4', '2017-09-27 17:48:32', '2017-09-27 17:48:32', null, '1', '1');
INSERT INTO `video_info` VALUES ('844', '1195', '1', '226', '105', '第三课 拒绝与冲突.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506505730268.mp4', '', null, null, 'mp4', '2017-09-27 17:49:01', '2017-09-27 17:49:01', null, '1', '1');
INSERT INTO `video_info` VALUES ('845', '1212', '1', '226', '105', '第一课 做真实的自己（讲课）.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506506067165.mp4', '', null, null, 'mp4', '2017-09-27 17:54:29', '2017-09-27 17:54:29', null, '1', '1');
INSERT INTO `video_info` VALUES ('846', '1213', '1', '226', '105', '第二课 实诚于己（讲课）.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506506230506.mp4', '', null, null, 'mp4', '2017-09-27 17:57:12', '2017-09-27 17:57:12', null, '1', '1');
INSERT INTO `video_info` VALUES ('847', '1214', '1', '226', '105', '第三课 坦诚待人（讲课）.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506506277587.mp4', '', null, null, 'mp4', '2017-09-27 17:57:59', '2017-09-27 17:57:59', null, '1', '1');
INSERT INTO `video_info` VALUES ('848', '1215', '1', '226', '105', '第一课 自信，源自内心的力量(讲课).mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506561127575.mp4', '', null, null, 'mp4', '2017-09-28 09:12:13', '2017-09-28 09:12:13', null, '1', '1');
INSERT INTO `video_info` VALUES ('849', '1216', '1', '226', '105', '属于你自己的那把钥匙（讲课）.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506561243030.mp4', '', null, null, 'mp4', '2017-09-28 09:14:04', '2017-09-28 09:14:04', null, '1', '1');
INSERT INTO `video_info` VALUES ('850', '1217', '1', '226', '105', '第三课 青春，我们自信前行（讲课）.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506561320363.mp4', '', null, null, 'mp4', '2017-09-28 09:15:23', '2017-09-28 09:15:23', null, '1', '1');
INSERT INTO `video_info` VALUES ('851', '1218', '1', '226', '105', '第一课 乐观是一种力量(讲课).mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506561679421.mp4', '', null, null, 'mp4', '2017-09-28 09:22:22', '2017-09-28 09:22:22', null, '1', '1');
INSERT INTO `video_info` VALUES ('852', '1219', '1', '226', '105', '第二课 活出乐观的自己（讲课）.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506561915961.mp4', '', null, null, 'mp4', '2017-09-28 09:25:59', '2017-09-28 09:25:59', null, '1', '1');
INSERT INTO `video_info` VALUES ('853', '1220', '1', '226', '105', '第三课 做一个乐观的人（讲课）.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506562023154.mp4', '', null, null, 'mp4', '2017-09-28 09:53:52', '2017-09-28 09:53:52', null, '1', '1');
INSERT INTO `video_info` VALUES ('854', '1221', '1', '226', '105', '第一课 知恩于心(讲课).mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506563706687.mp4', '', null, null, 'mp4', '2017-09-28 09:55:11', '2017-09-28 09:55:11', null, '1', '1');
INSERT INTO `video_info` VALUES ('855', '1222', '1', '226', '105', '第二课 感恩于情（讲课）.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506563885065.mp4', '', null, null, 'mp4', '2017-09-28 09:58:07', '2017-09-28 09:58:07', null, '1', '1');
INSERT INTO `video_info` VALUES ('856', '1223', '1', '226', '105', '第三课 懂报恩，能施恩（讲课）.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506564369814.mp4', '', null, null, 'mp4', '2017-09-28 10:06:13', '2017-09-28 10:06:13', null, '1', '1');
INSERT INTO `video_info` VALUES ('857', '1224', '1', '226', '105', '第一课 做一个自尊自爱的人（讲课）.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506564437287.mp4', '', null, null, 'mp4', '2017-09-28 10:07:19', '2017-09-28 10:07:19', null, '1', '1');
INSERT INTO `video_info` VALUES ('858', '1225', '1', '226', '105', '第二课 构建长幼有序的人际关系（讲课）.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506564495645.mp4', '', null, null, 'mp4', '2017-09-28 10:09:55', '2017-09-28 10:09:55', null, '1', '1');
INSERT INTO `video_info` VALUES ('859', '1226', '1', '226', '105', '第三课 实现万物共生的社会生态格局.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506564738085.mp4', '', null, null, 'mp4', '2017-09-28 10:12:20', '2017-09-28 10:12:20', null, '1', '1');
INSERT INTO `video_info` VALUES ('860', '1229', '1', '226', '105', '第三课 做一个懂服从的人（说课）.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506565389099.mp4', '', null, null, 'mp4', '2017-09-28 10:23:39', '2017-09-28 10:23:39', null, '1', '1');
INSERT INTO `video_info` VALUES ('861', '1211', '1', '226', '105', '第三课 做一个懂服从的人.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506565446988.mp4', '', null, null, 'mp4', '2017-09-28 10:24:11', '2017-09-28 10:24:11', null, '1', '1');
INSERT INTO `video_info` VALUES ('862', '1228', '1', '226', '105', '第二课 学会服从（说课）.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506565470106.mp4', '', null, null, 'mp4', '2017-09-28 10:26:58', '2017-09-28 10:26:58', null, '1', '1');
INSERT INTO `video_info` VALUES ('863', '1210', '1', '226', '105', '第二课 学会服从.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506565633196.mp4', '', null, null, 'mp4', '2017-09-28 10:27:15', '2017-09-28 10:27:15', null, '1', '1');
INSERT INTO `video_info` VALUES ('864', '1227', '1', '226', '105', '第一课 我们需要服从的品格（说课）.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506565652416.mp4', '', null, null, 'mp4', '2017-09-28 10:29:18', '2017-09-28 10:29:18', null, '1', '1');
INSERT INTO `video_info` VALUES ('865', '1209', '1', '226', '105', '第一课 我们需要服从的品格.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506565770988.mp4', '', null, null, 'mp4', '2017-09-28 10:29:42', '2017-09-28 10:29:42', null, '1', '1');
INSERT INTO `video_info` VALUES ('866', '1232', '1', '226', '105', '第三课 友善伴我行（说课）.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506565803605.mp4', '', null, null, 'mp4', '2017-09-28 10:30:18', '2017-09-28 10:30:18', null, '1', '1');
INSERT INTO `video_info` VALUES ('867', '1207', '1', '226', '105', '第三课 友善伴我行.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506565831658.mp4', '', null, null, 'mp4', '2017-09-28 10:30:34', '2017-09-28 10:30:34', null, '1', '1');
INSERT INTO `video_info` VALUES ('868', '1231', '1', '226', '105', '第二课 友善的力量（说课）.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506565849270.mp4', '', null, null, 'mp4', '2017-09-28 10:31:05', '2017-09-28 10:31:05', null, '1', '1');
INSERT INTO `video_info` VALUES ('869', '1206', '1', '226', '105', '第二课 友善的力量.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506565878704.mp4', '', null, null, 'mp4', '2017-09-28 10:31:21', '2017-09-28 10:31:21', null, '1', '1');
INSERT INTO `video_info` VALUES ('870', '1230', '1', '226', '105', '第一课 友善之花（说课）.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506565899103.mp4', '', null, null, 'mp4', '2017-09-28 10:31:56', '2017-09-28 10:31:56', null, '1', '1');
INSERT INTO `video_info` VALUES ('871', '1205', '1', '226', '105', '第一课 友善之花.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506565929540.mp4', '', null, null, 'mp4', '2017-09-28 10:32:11', '2017-09-28 10:32:11', null, '1', '1');
INSERT INTO `video_info` VALUES ('872', '1235', '1', '226', '105', '第三课 做一个节俭的人（说课）.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506565953131.mp4', '', null, null, 'mp4', '2017-09-28 10:32:49', '2017-09-28 10:32:49', null, '1', '1');
INSERT INTO `video_info` VALUES ('873', '1203', '1', '226', '105', '第三课 做一个节俭的人.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506565986513.mp4', '', null, null, 'mp4', '2017-09-28 10:33:09', '2017-09-28 10:33:09', null, '1', '1');
INSERT INTO `video_info` VALUES ('874', '1234', '1', '226', '105', '第二课 我们需要节俭（说课）.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566024261.mp4', '', null, null, 'mp4', '2017-09-28 10:34:32', '2017-09-28 10:34:32', null, '1', '1');
INSERT INTO `video_info` VALUES ('875', '1202', '1', '226', '105', '第二课 我们需要节俭.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566091498.mp4', '', null, null, 'mp4', '2017-09-28 10:34:53', '2017-09-28 10:34:53', null, '1', '1');
INSERT INTO `video_info` VALUES ('876', '1233', '1', '226', '105', '第一课 节俭是一种美德（说课）.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566120645.mp4', '', null, null, 'mp4', '2017-09-28 10:35:23', '2017-09-28 10:35:23', null, '1', '1');
INSERT INTO `video_info` VALUES ('877', '1201', '1', '226', '105', '第一课 节俭是一种美德.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566149542.mp4', '', null, null, 'mp4', '2017-09-28 10:35:51', '2017-09-28 10:35:51', null, '1', '1');
INSERT INTO `video_info` VALUES ('878', '1238', '1', '226', '105', '第三课 勇于选择，规划未来（说课）.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566188986.mp4', '', null, null, 'mp4', '2017-09-28 10:36:50', '2017-09-28 10:36:50', null, '1', '1');
INSERT INTO `video_info` VALUES ('879', '1199', '1', '226', '105', '第三课 勇于选择，规划未来.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566232644.mp4', '', null, null, 'mp4', '2017-09-28 10:37:15', '2017-09-28 10:37:15', null, '1', '1');
INSERT INTO `video_info` VALUES ('880', '1237', '1', '226', '105', '第二课 勇敢挑战心理舒适区（说课）.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566266727.mp4', '', null, null, 'mp4', '2017-09-28 10:38:06', '2017-09-28 10:38:06', null, '1', '1');
INSERT INTO `video_info` VALUES ('881', '1198', '1', '226', '105', '第二课 勇敢挑战心理舒适区.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566299794.mp4', '', null, null, 'mp4', '2017-09-28 10:38:26', '2017-09-28 10:38:26', null, '1', '1');
INSERT INTO `video_info` VALUES ('882', '1236', '1', '226', '105', '第一课 勇于作为，敢为人先（说课）.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566343675.mp4', '', null, null, 'mp4', '2017-09-28 10:39:19', '2017-09-28 10:39:19', null, '1', '1');
INSERT INTO `video_info` VALUES ('883', '1197', '1', '226', '105', '第一课 勇于作为，敢为人先.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566396768.mp4', '', null, null, 'mp4', '2017-09-28 10:39:59', '2017-09-28 10:39:59', null, '1', '1');
INSERT INTO `video_info` VALUES ('884', '1242', '1', '226', '105', '第三课 拒绝与冲突（说课）.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566427119.mp4', '', null, null, 'mp4', '2017-09-28 10:40:43', '2017-09-28 10:40:43', null, '1', '1');
INSERT INTO `video_info` VALUES ('885', '1241', '1', '226', '105', '第二课 表达与倾听（说课）.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566459690.mp4', '', null, null, 'mp4', '2017-09-28 10:41:12', '2017-09-28 10:41:12', null, '1', '1');
INSERT INTO `video_info` VALUES ('886', '1240', '1', '226', '105', '第一课 沟通，从心开始（说课）.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566488453.mp4', '', null, null, 'mp4', '2017-09-28 10:41:40', '2017-09-28 10:41:40', null, '1', '1');
INSERT INTO `video_info` VALUES ('887', '1245', '1', '226', '105', '第三课 力行宽容（说课）.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566520701.mp4', '', null, null, 'mp4', '2017-09-28 10:42:27', '2017-09-28 10:42:27', null, '1', '1');
INSERT INTO `video_info` VALUES ('888', '1244', '1', '226', '105', '第二课 宽容的限度（说课）.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566564480.mp4', '', null, null, 'mp4', '2017-09-28 10:42:54', '2017-09-28 10:42:54', null, '1', '1');
INSERT INTO `video_info` VALUES ('889', '1243', '1', '226', '105', '第一课 我眼中的宽容（说课）.mp4', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566589197.mp4', '', null, null, 'mp4', '2017-09-28 10:43:19', '2017-09-28 10:43:19', null, '1', '1');
INSERT INTO `video_info` VALUES ('890', '1248', '1', '226', '105', '第三课 社会责任需要担当（说课）', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566624221.mp4', '', null, null, 'mp4', '2017-09-28 10:43:53', '2017-09-28 10:43:53', null, '1', '1');
INSERT INTO `video_info` VALUES ('891', '1247', '1', '226', '105', '第二课 对自己尽责（说课）', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566651794.mp4', '', null, null, 'mp4', '2017-09-28 10:44:20', '2017-09-28 10:44:20', null, '1', '1');
INSERT INTO `video_info` VALUES ('892', '1246', '1', '226', '105', '第一课 山一样的责任（说课）', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566692640.mp4', '', null, null, 'mp4', '2017-09-28 10:44:55', '2017-09-28 10:44:55', null, '1', '1');
INSERT INTO `video_info` VALUES ('893', '1185', '1', '226', '105', '第一课 山一样的责任', 'resource/105/video/C430C8A7597FEA7595AA70239506716E1506566723290.mp4', '', null, null, 'mp4', '2017-09-28 10:45:25', '2017-09-28 10:45:25', null, '1', '1');
INSERT INTO `video_info` VALUES ('894', '1250', '1', '226', '106', '第一单元 从社会主义核心价值体系到社会主义核心价值观（一）', 'resource/106/video/C430C8A7597FEA7595AA70239506716E1506586258698.mp4', '', null, null, 'mp4', '2017-09-28 16:11:02', '2017-09-28 16:11:02', null, '1', '1');
INSERT INTO `video_info` VALUES ('895', '1252', '1', '226', '106', '第一单元 从社会主义核心价值体系到社会主义核心价值观（二）', 'resource/106/video/C430C8A7597FEA7595AA70239506716E1506586973344.mp4', '', null, null, 'mp4', '2017-09-28 16:28:27', '2017-09-28 16:28:27', null, '1', '1');
INSERT INTO `video_info` VALUES ('896', '1253', '1', '226', '106', '第二单元 培育和弘扬社会主义核心价值观的重要性和紧迫性', 'resource/106/video/C430C8A7597FEA7595AA70239506716E1506587735760.mp4', '', null, null, 'mp4', '2017-09-28 16:35:45', '2017-09-28 16:35:45', null, '1', '1');
INSERT INTO `video_info` VALUES ('897', '1255', '1', '226', '106', '第三单元 培育和弘扬社会主义核心价值观的主要途径（一）', 'resource/106/video/C430C8A7597FEA7595AA70239506716E1506587777224.mp4', '', null, null, 'mp4', '2017-09-28 16:36:24', '2017-09-28 16:36:24', null, '1', '1');
INSERT INTO `video_info` VALUES ('898', '1256', '1', '226', '106', '第三单元 培育和弘扬社会主义核心价值观的主要途径（二）', 'resource/106/video/C430C8A7597FEA7595AA70239506716E1506587813696.mp4', '', null, null, 'mp4', '2017-09-28 16:37:01', '2017-09-28 16:37:01', null, '1', '1');
INSERT INTO `video_info` VALUES ('899', '1257', '1', '226', '106', '第三单元 培育和弘扬社会主义核心价值观的主要途径（三）', 'resource/106/video/C430C8A7597FEA7595AA70239506716E1506587851788.mp4', '', null, null, 'mp4', '2017-09-28 16:37:36', '2017-09-28 16:37:36', null, '1', '1');
INSERT INTO `video_info` VALUES ('900', '1268', '1', '226', '106', '第六单元 建设社会主义核心价值体系必须回答的问题', 'resource/106/video/C430C8A7597FEA7595AA70239506716E1506587886701.mp4', '', null, null, 'mp4', '2017-09-28 16:38:09', '2017-09-28 16:38:09', null, '1', '1');
INSERT INTO `video_info` VALUES ('901', '1259', '1', '226', '106', '第一课： 应以什么样的方式来思考核心价值观的培育这个文化核心问题.', 'resource/106/video/C430C8A7597FEA7595AA70239506716E1506587920194.mp4', '', null, null, 'mp4', '2017-09-28 16:38:44', '2017-09-28 16:38:44', null, '1', '1');
INSERT INTO `video_info` VALUES ('902', '1260', '1', '226', '106', '第二课： 应以什么样的方式来思考核心价值观的培育这个文化核心问题', 'resource/106/video/C430C8A7597FEA7595AA70239506716E1506587948867.mp4', '', null, null, 'mp4', '2017-09-28 16:39:13', '2017-09-28 16:39:13', null, '1', '1');
INSERT INTO `video_info` VALUES ('903', '1261', '1', '226', '106', '第三课： 应以什么样的方式来思考核心价值观的培育这个文化核心问题', 'resource/106/video/C430C8A7597FEA7595AA70239506716E1506587983547.mp4', '', null, null, 'mp4', '2017-09-28 16:39:46', '2017-09-28 16:39:46', null, '1', '1');
INSERT INTO `video_info` VALUES ('904', '1262', '1', '226', '106', '第四课： 应以什么样的方式来思考核心价值观的培育这个文化核心问题', 'resource/106/video/C430C8A7597FEA7595AA70239506716E1506588018517.mp4', '', null, null, 'mp4', '2017-09-28 16:41:02', '2017-09-28 16:41:02', null, '1', '1');
INSERT INTO `video_info` VALUES ('905', '1264', '1', '226', '106', '说核心价值观是兴国之魂合成', 'resource/106/video/C430C8A7597FEA7595AA70239506716E1506588093266.mp4', '', null, null, 'mp4', '2017-09-28 16:41:36', '2017-09-28 16:41:36', null, '1', '1');
INSERT INTO `video_info` VALUES ('906', '1270', '1', '226', '107', '第一单元  “中国梦”——百年追梦与民族自强（一）', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506588548531.mp4', '', null, null, 'mp4', '2017-09-28 16:49:42', '2017-09-28 16:49:42', null, '1', '1');
INSERT INTO `video_info` VALUES ('907', '1271', '1', '226', '107', '第一单元  “中国梦”——百年追梦与民族自强（二）', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506588814171.mp4', '', null, null, 'mp4', '2017-09-28 16:54:43', '2017-09-28 16:54:43', null, '1', '1');
INSERT INTO `video_info` VALUES ('908', '1272', '1', '226', '107', '第一单元  “中国梦”——百年追梦与民族自强（三）', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506588907663.mp4', '', null, null, 'mp4', '2017-09-28 16:55:10', '2017-09-28 16:55:10', null, '1', '1');
INSERT INTO `video_info` VALUES ('909', '1274', '1', '226', '107', '第二单元 “中国道路”——中华民族伟大复兴的路径选择（一）', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506588962674.mp4', '', null, null, 'mp4', '2017-09-28 16:56:05', '2017-09-28 16:56:05', null, '1', '1');
INSERT INTO `video_info` VALUES ('910', '1275', '1', '226', '107', '第二单元 “中国道路”——中华民族伟大复兴的路径选择（二）', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506588988460.mp4', '', null, null, 'mp4', '2017-09-28 16:56:31', '2017-09-28 16:56:31', null, '1', '1');
INSERT INTO `video_info` VALUES ('911', '1276', '1', '226', '107', '第二单元 “中国道路”——中华民族伟大复兴的路径选择（三）', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506589010420.mp4', '', null, null, 'mp4', '2017-09-28 16:56:59', '2017-09-28 16:56:59', null, '1', '1');
INSERT INTO `video_info` VALUES ('912', '1278', '1', '226', '107', '第三单元 伟大复兴——”中国梦“的深刻内涵（一）', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506589092276.mp4', '', null, null, 'mp4', '2017-09-28 16:58:15', '2017-09-28 16:58:15', null, '1', '1');
INSERT INTO `video_info` VALUES ('913', '1279', '1', '226', '107', '第三单元 伟大复兴——”中国梦“的深刻内涵（二）', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506589116425.mp4', '', null, null, 'mp4', '2017-09-28 16:58:41', '2017-09-28 16:58:41', null, '1', '1');
INSERT INTO `video_info` VALUES ('914', '1281', '1', '226', '107', '第四单元 实干兴邦——”中国梦“的根本保障（一）', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506589475267.mp4', '', null, null, 'mp4', '2017-09-28 17:04:39', '2017-09-28 17:04:39', null, '1', '1');
INSERT INTO `video_info` VALUES ('915', '1282', '1', '226', '107', '第四单元 实干兴邦——”中国梦“的根本保障（二）', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506589503321.mp4', '', null, null, 'mp4', '2017-09-28 17:05:09', '2017-09-28 17:05:09', null, '1', '1');
INSERT INTO `video_info` VALUES ('916', '1283', '1', '226', '107', '第四单元 实干兴邦——”中国梦“的根本保障（三）', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506589535555.mp4', '', null, null, 'mp4', '2017-09-28 17:05:39', '2017-09-28 17:05:39', null, '1', '1');
INSERT INTO `video_info` VALUES ('917', '1285', '1', '226', '107', '第五单元 凝心聚力——“中国精神”的民族特征（一）', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506589581054.mp4', '', null, null, 'mp4', '2017-09-28 17:06:25', '2017-09-28 17:06:25', null, '1', '1');
INSERT INTO `video_info` VALUES ('918', '1286', '1', '226', '107', '第五单元 凝心聚力——“中国精神”的民族特征（二）', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506589604627.mp4', '', null, null, 'mp4', '2017-09-28 17:06:48', '2017-09-28 17:06:48', null, '1', '1');
INSERT INTO `video_info` VALUES ('919', '1287', '1', '226', '107', '第五单元 凝心聚力——“中国精神”的民族特征（三）', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506589626326.mp4', '', null, null, 'mp4', '2017-09-28 17:07:08', '2017-09-28 17:07:08', null, '1', '1');
INSERT INTO `video_info` VALUES ('920', '1289', '1', '226', '107', '第六单元 共筑中国梦——“中国精神”的时代要求（一）', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506589675161.mp4', '', null, null, 'mp4', '2017-09-28 17:08:00', '2017-09-28 17:08:00', null, '1', '1');
INSERT INTO `video_info` VALUES ('921', '1290', '1', '226', '107', '第六单元 共筑中国梦——“中国精神”的时代要求（二）', 'resource/107/video/C430C8A7597FEA7595AA70239506716E1506589703359.mp4', '', null, null, 'mp4', '2017-09-28 17:08:55', '2017-09-28 17:08:55', null, '1', '1');
INSERT INTO `video_info` VALUES ('922', '1292', '1', '226', '108', '1-1 艺术的起源——史前艺术', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510304176359.mp4', '', null, null, 'mp4', '2017-11-10 16:57:23', '2017-11-10 16:57:23', null, '1', '1');
INSERT INTO `video_info` VALUES ('923', '1293', '1', '226', '108', 'C4301-2 卑微的狰狞——商周青铜文化', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510304672953.mp4', '', null, null, 'mp4', '2017-11-10 17:04:42', '2017-11-10 17:04:42', null, '1', '1');
INSERT INTO `video_info` VALUES ('924', '1294', '1', '226', '108', '1-3 彪悍的现实主义——秦汉墓葬艺术.mp4', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510304849208.mp4', '', null, null, 'mp4', '2017-11-10 17:08:01', '2017-11-10 17:08:01', null, '1', '1');
INSERT INTO `video_info` VALUES ('925', '1295', '1', '226', '108', '1-4 世界中心的艺术——唐代艺术.mp4', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510304901802.mp4', '', null, null, 'mp4', '2017-11-10 17:09:01', '2017-11-10 17:09:01', null, '1', '1');
INSERT INTO `video_info` VALUES ('926', '1296', '1', '226', '108', '1-5 格物致知——宋代花鸟画.mp4', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510304961580.mp4', '', null, null, 'mp4', '2017-11-10 17:09:49', '2017-11-10 17:09:49', null, '1', '1');
INSERT INTO `video_info` VALUES ('927', '1297', '1', '226', '108', '1-6 溪山高远——宋代山水画.mp4', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510305029194.mp4', '', null, null, 'mp4', '2017-11-10 17:16:20', '2017-11-10 17:16:20', null, '1', '1');
INSERT INTO `video_info` VALUES ('928', '1298', '1', '226', '108', '1-7 文人自觉与艺术交融——元代艺术.mp4', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510305395196.mp4', '', null, null, 'mp4', '2017-11-10 17:16:47', '2017-11-10 17:16:47', null, '1', '1');
INSERT INTO `video_info` VALUES ('929', '1299', '1', '226', '108', '1-8 江南风韵——明代艺术.mp4', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510305421484.mp4', '', null, null, 'mp4', '2017-11-10 17:17:25', '2017-11-10 17:17:25', null, '1', '1');
INSERT INTO `video_info` VALUES ('930', '1300', '1', '226', '108', '1-9 皇家典藏与江南艺术——清代艺术.mp4', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510305479575.mp4', '', null, null, 'mp4', '2017-11-10 17:18:09', '2017-11-10 17:18:09', null, '1', '1');
INSERT INTO `video_info` VALUES ('931', '1301', '1', '226', '108', '1-10 爱国运动中的艺术——近代艺术.mp4', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510305509455.mp4', '', null, null, 'mp4', '2017-11-10 17:18:35', '2017-11-10 17:18:35', null, '1', '1');
INSERT INTO `video_info` VALUES ('932', '1302', '1', '226', '108', '1-11 沟通到表现——书法.mp4', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510305529569.mp4', '', null, null, 'mp4', '2017-11-10 17:18:58', '2017-11-10 17:18:58', null, '1', '1');
INSERT INTO `video_info` VALUES ('933', '1303', '1', '226', '108', '1-12 火与泥的涅槃——陶瓷（上）.mp4', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510305553053.mp4', '', null, null, 'mp4', '2017-11-10 17:20:11', '2017-11-10 17:20:11', null, '1', '1');
INSERT INTO `video_info` VALUES ('934', '1304', '1', '226', '108', '3 china的化身——陶瓷（下）.mp4', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510305814355.mp4', '', null, null, 'mp4', '2017-11-10 17:23:43', '2017-11-10 17:23:43', null, '1', '1');
INSERT INTO `video_info` VALUES ('935', '1305', '1', '226', '108', '1-14 织物上的艺术——帛画、纺织品艺术.mp4', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510305837357.mp4', '', null, null, 'mp4', '2017-11-10 17:24:05', '2017-11-10 17:24:05', null, '1', '1');
INSERT INTO `video_info` VALUES ('936', '1306', '1', '226', '108', '1-15 把玩的艺术——牙、角、匏艺术品.mp4', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510305861190.mp4', '', null, null, 'mp4', '2017-11-10 17:24:43', '2017-11-10 17:24:43', null, '1', '1');
INSERT INTO `video_info` VALUES ('937', '1307', '1', '226', '108', '1-16 千年不朽——漆器艺术.mp4', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510305896914.mp4', '', null, null, 'mp4', '2017-11-10 17:25:08', '2017-11-10 17:25:08', null, '1', '1');
INSERT INTO `video_info` VALUES ('938', '1308', '1', '226', '108', '1-17 装扮之美——饰品.mp4', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510305922945.mp4', '', null, null, 'mp4', '2017-11-10 17:25:32', '2017-11-10 17:25:32', null, '1', '1');
INSERT INTO `video_info` VALUES ('939', '1309', '1', '226', '108', '1-18 书房里的宝贝——文房用品.mp4', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510305945339.mp4', '', null, null, 'mp4', '2017-11-10 17:25:56', '2017-11-10 17:25:56', null, '1', '1');
INSERT INTO `video_info` VALUES ('940', '1310', '1', '226', '108', '1-19 信仰之光——宗教艺术.mp4', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510305969480.mp4', '', null, null, 'mp4', '2017-11-10 17:26:17', '2017-11-10 17:26:17', null, '1', '1');
INSERT INTO `video_info` VALUES ('941', '1311', '1', '226', '108', '1-20 凝固的音乐——建筑中的艺术美.mp4', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510305991996.mp4', '', null, null, 'mp4', '2017-11-10 17:26:38', '2017-11-10 17:26:38', null, '1', '1');
INSERT INTO `video_info` VALUES ('942', '1312', '1', '226', '108', '1-21 民族瑰宝——民族艺术.mp4', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510306013205.mp4', '', null, null, 'mp4', '2017-11-10 17:27:04', '2017-11-10 17:27:04', null, '1', '1');
INSERT INTO `video_info` VALUES ('943', '1313', '1', '226', '108', '1-22 生活中的艺术——民间艺术.mp4', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510306037310.mp4', '', null, null, 'mp4', '2017-11-10 17:27:25', '2017-11-10 17:27:25', null, '1', '1');
INSERT INTO `video_info` VALUES ('944', '1315', '1', '226', '108', '2-1 逝去的文明——埃及、两河文明.mp4', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510535923627.mp4', '', null, null, 'mp4', '2017-11-13 09:18:55', '2017-11-13 09:18:55', null, '1', '1');
INSERT INTO `video_info` VALUES ('945', '1316', '1', '226', '108', '欧陆曙光——古希腊罗马艺术.mp4', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510535947826.mp4', '', null, null, 'mp4', '2017-11-13 09:19:22', '2017-11-13 09:19:22', null, '1', '1');
INSERT INTO `video_info` VALUES ('946', '1317', '1', '226', '108', '冷峻严肃——中世纪欧洲艺术.mp4', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510535975593.mp4', '', null, null, 'mp4', '2017-11-13 09:19:48', '2017-11-13 09:19:48', null, '1', '1');
INSERT INTO `video_info` VALUES ('947', '1318', '1', '226', '108', '群星璀璨——欧洲文艺复兴时期艺术.mp4', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510536002244.mp4', '', null, null, 'mp4', '2017-11-13 09:20:16', '2017-11-13 09:20:16', null, '1', '1');
INSERT INTO `video_info` VALUES ('948', '1319', '1', '226', '108', '2-5 重归理性——从巴洛克到新古典主义.mp4', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510536033536.mp4', '', null, null, 'mp4', '2017-11-13 09:20:44', '2017-11-13 09:20:44', null, '1', '1');
INSERT INTO `video_info` VALUES ('949', '1320', '1', '226', '108', '2-6 走向表现——印象派及以后.mp4', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510536057316.mp4', '', null, null, 'mp4', '2017-11-13 09:21:08', '2017-11-13 09:21:08', null, '1', '1');
INSERT INTO `video_info` VALUES ('950', '1321', '1', '226', '108', '2-7 一切皆有可能——现代艺术.mp4', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510536081523.mp4', '', null, null, 'mp4', '2017-11-13 09:21:33', '2017-11-13 09:21:33', null, '1', '1');
INSERT INTO `video_info` VALUES ('951', '1323', '1', '226', '108', '3-1 品味的变迁——设计风格的变化.mp4', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510536111204.mp4', '', null, null, 'mp4', '2017-11-13 09:22:01', '2017-11-13 09:22:01', null, '1', '1');
INSERT INTO `video_info` VALUES ('952', '1324', '1', '226', '108', '3-2 艺术与科学——艺术中体现的科学问题.mp4', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510536135165.mp4', '', null, null, 'mp4', '2017-11-13 09:22:29', '2017-11-13 09:22:29', null, '1', '1');
INSERT INTO `video_info` VALUES ('953', '1325', '1', '226', '108', '3-3 艺术基础ABC——一些常用的基本概念.mp4', 'resource/108/video/C430C8A7597FEA7595AA70239506716E1510536166492.mp4', '', null, null, 'mp4', '2017-11-13 09:22:57', '2017-11-13 09:22:57', null, '1', '1');
INSERT INTO `video_info` VALUES ('954', '1331', '1', '226', '109', '2-4 伟大的牛顿革命（一）：哥白尼的“第一枪” 讲课.mp4', 'resource/109/video/fcc2d375eaac451ebe050ec4acc3a34f1513068061951.mp4', '', null, null, 'mp4', '2017-12-12 16:41:37', '2017-12-12 16:41:37', null, '1', '1');
INSERT INTO `video_info` VALUES ('955', '1332', '1', '226', '109', '2-4 伟大的牛顿革命（一）：哥白尼的“第一枪” 说课.mp4', 'resource/109/video/07a5dbfce5534786ae64fffe7b6a62331513068114007.mp4', '', null, null, 'mp4', '2017-12-12 16:42:05', '2017-12-12 16:42:05', null, '1', '1');
INSERT INTO `video_info` VALUES ('956', '1328', '1', '226', '109', '1-6 古代中国的辉煌成就（一） 讲课.mp4', 'resource/109/video/4085da874846405ca32b77998c8aad741513070091697.mp4', '', null, null, 'mp4', '2017-12-12 17:15:03', '2017-12-12 17:15:03', null, '1', '1');
INSERT INTO `video_info` VALUES ('957', '1329', '1', '226', '109', '1-6 古代中国的辉煌成就（一） 说课.mp4', 'resource/109/video/46fef0de72a3493b9866f732a417d5541513070116501.mp4', '', null, null, 'mp4', '2017-12-12 17:15:30', '2017-12-12 17:15:30', null, '1', '1');

-- ----------------------------
-- Table structure for visit_record
-- ----------------------------
DROP TABLE IF EXISTS `visit_record`;
CREATE TABLE `visit_record` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `state` int(2) DEFAULT '1',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3218 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of visit_record
-- ----------------------------
INSERT INTO `visit_record` VALUES ('2001', '1', '227', '2017-03-30 13:38:13', '1');
INSERT INTO `visit_record` VALUES ('2002', '1', '226', '2017-03-30 13:39:09', '1');
INSERT INTO `visit_record` VALUES ('2003', '1', '226', '2017-03-30 13:46:31', '1');
INSERT INTO `visit_record` VALUES ('2004', '2', '226', '2017-03-30 13:47:27', '1');
INSERT INTO `visit_record` VALUES ('2005', '1', '226', '2017-03-30 13:48:21', '1');
INSERT INTO `visit_record` VALUES ('2006', '1', '227', '2017-03-30 14:05:22', '1');
INSERT INTO `visit_record` VALUES ('2007', '2', '227', '2017-03-30 14:08:03', '1');
INSERT INTO `visit_record` VALUES ('2008', '1', '226', '2017-03-30 14:08:53', '1');
INSERT INTO `visit_record` VALUES ('2009', '1', '226', '2017-03-30 14:08:08', '1');
INSERT INTO `visit_record` VALUES ('2010', '1', '226', '2017-03-30 15:04:38', '1');
INSERT INTO `visit_record` VALUES ('2011', '1', '226', '2017-03-30 15:13:09', '1');
INSERT INTO `visit_record` VALUES ('2012', '2', '226', '2017-03-30 15:15:16', '1');
INSERT INTO `visit_record` VALUES ('2013', '1', '226', '2017-03-30 15:15:24', '1');
INSERT INTO `visit_record` VALUES ('2014', '1', '226', '2017-03-30 15:40:07', '1');
INSERT INTO `visit_record` VALUES ('2015', '2', '226', '2017-03-30 15:45:37', '1');
INSERT INTO `visit_record` VALUES ('2016', '1', '226', '2017-03-30 15:45:49', '1');
INSERT INTO `visit_record` VALUES ('2017', '2', '226', '2017-03-30 15:49:47', '1');
INSERT INTO `visit_record` VALUES ('2018', '1', '228', '2017-03-30 15:50:01', '1');
INSERT INTO `visit_record` VALUES ('2019', '2', '228', '2017-03-30 15:54:17', '1');
INSERT INTO `visit_record` VALUES ('2020', '1', '226', '2017-03-30 15:55:17', '1');
INSERT INTO `visit_record` VALUES ('2021', '1', '226', '2017-03-30 15:54:27', '1');
INSERT INTO `visit_record` VALUES ('2022', '1', '226', '2017-03-30 16:23:30', '1');
INSERT INTO `visit_record` VALUES ('2023', '1', '227', '2017-03-30 16:30:44', '1');
INSERT INTO `visit_record` VALUES ('2024', '2', '227', '2017-03-30 16:30:52', '1');
INSERT INTO `visit_record` VALUES ('2025', '1', '226', '2017-03-30 16:30:59', '1');
INSERT INTO `visit_record` VALUES ('2026', '2', '226', '2017-03-30 16:44:58', '1');
INSERT INTO `visit_record` VALUES ('2027', '1', '226', '2017-03-30 16:45:22', '1');
INSERT INTO `visit_record` VALUES ('2028', '1', '226', '2017-03-31 09:16:04', '1');
INSERT INTO `visit_record` VALUES ('2029', '1', '226', '2017-03-31 09:24:12', '1');
INSERT INTO `visit_record` VALUES ('2030', '1', '226', '2017-03-31 09:54:19', '1');
INSERT INTO `visit_record` VALUES ('2031', '1', '226', '2017-03-31 10:05:10', '1');
INSERT INTO `visit_record` VALUES ('2032', '1', '226', '2017-03-31 10:24:24', '1');
INSERT INTO `visit_record` VALUES ('2033', '1', '226', '2017-03-31 10:48:51', '1');
INSERT INTO `visit_record` VALUES ('2034', '1', '226', '2017-03-31 10:55:35', '1');
INSERT INTO `visit_record` VALUES ('2035', '1', '226', '2017-03-31 11:10:02', '1');
INSERT INTO `visit_record` VALUES ('2036', '1', '226', '2017-03-31 11:16:32', '1');
INSERT INTO `visit_record` VALUES ('2037', '1', '226', '2017-03-31 13:19:06', '1');
INSERT INTO `visit_record` VALUES ('2038', '1', '226', '2017-03-31 13:19:59', '1');
INSERT INTO `visit_record` VALUES ('2039', '1', '226', '2017-03-31 13:30:48', '1');
INSERT INTO `visit_record` VALUES ('2040', '1', '226', '2017-03-31 13:45:25', '1');
INSERT INTO `visit_record` VALUES ('2041', '1', '226', '2017-03-31 14:15:26', '1');
INSERT INTO `visit_record` VALUES ('2042', '1', '226', '2017-03-31 14:22:18', '1');
INSERT INTO `visit_record` VALUES ('2043', '1', '226', '2017-03-31 14:22:18', '1');
INSERT INTO `visit_record` VALUES ('2044', '1', '226', '2017-03-31 14:32:06', '1');
INSERT INTO `visit_record` VALUES ('2045', '1', '226', '2017-03-31 14:43:59', '1');
INSERT INTO `visit_record` VALUES ('2046', '2', '226', '2017-03-31 14:50:31', '1');
INSERT INTO `visit_record` VALUES ('2047', '1', '228', '2017-03-31 14:50:56', '1');
INSERT INTO `visit_record` VALUES ('2048', '1', '226', '2017-03-31 15:02:19', '1');
INSERT INTO `visit_record` VALUES ('2049', '1', '226', '2017-03-31 15:13:13', '1');
INSERT INTO `visit_record` VALUES ('2050', '1', '226', '2017-03-31 15:23:36', '1');
INSERT INTO `visit_record` VALUES ('2051', '2', '226', '2017-03-31 15:26:48', '1');
INSERT INTO `visit_record` VALUES ('2052', '1', '226', '2017-03-31 15:30:55', '1');
INSERT INTO `visit_record` VALUES ('2053', '1', '226', '2017-03-31 15:37:07', '1');
INSERT INTO `visit_record` VALUES ('2054', '2', '226', '2017-03-31 15:38:58', '1');
INSERT INTO `visit_record` VALUES ('2055', '1', '228', '2017-03-31 15:39:06', '1');
INSERT INTO `visit_record` VALUES ('2056', '2', '228', '2017-03-31 15:42:20', '1');
INSERT INTO `visit_record` VALUES ('2057', '1', '226', '2017-03-31 15:42:28', '1');
INSERT INTO `visit_record` VALUES ('2058', '2', '226', '2017-03-31 15:43:15', '1');
INSERT INTO `visit_record` VALUES ('2059', '1', '228', '2017-03-31 15:43:28', '1');
INSERT INTO `visit_record` VALUES ('2060', '2', '228', '2017-03-31 15:47:47', '1');
INSERT INTO `visit_record` VALUES ('2061', '1', '226', '2017-03-31 15:47:55', '1');
INSERT INTO `visit_record` VALUES ('2062', '2', '226', '2017-03-31 15:52:13', '1');
INSERT INTO `visit_record` VALUES ('2063', '1', '228', '2017-03-31 15:52:26', '1');
INSERT INTO `visit_record` VALUES ('2064', '2', '228', '2017-03-31 15:53:04', '1');
INSERT INTO `visit_record` VALUES ('2065', '1', '226', '2017-03-31 15:53:10', '1');
INSERT INTO `visit_record` VALUES ('2066', '2', '226', '2017-03-31 15:55:01', '1');
INSERT INTO `visit_record` VALUES ('2067', '1', '228', '2017-03-31 15:55:11', '1');
INSERT INTO `visit_record` VALUES ('2068', '1', '228', '2017-03-31 15:55:12', '1');
INSERT INTO `visit_record` VALUES ('2069', '1', '228', '2017-03-31 15:58:34', '1');
INSERT INTO `visit_record` VALUES ('2070', '2', '228', '2017-03-31 16:00:20', '1');
INSERT INTO `visit_record` VALUES ('2071', '1', '226', '2017-03-31 16:00:25', '1');
INSERT INTO `visit_record` VALUES ('2072', '1', '226', '2017-03-31 16:00:57', '1');
INSERT INTO `visit_record` VALUES ('2073', '1', '226', '2017-03-31 16:05:22', '1');
INSERT INTO `visit_record` VALUES ('2074', '2', '226', '2017-03-31 16:10:39', '1');
INSERT INTO `visit_record` VALUES ('2075', '1', '226', '2017-03-31 16:10:41', '1');
INSERT INTO `visit_record` VALUES ('2076', '1', '226', '2017-03-31 16:18:04', '1');
INSERT INTO `visit_record` VALUES ('2077', '1', '226', '2017-03-31 16:30:30', '1');
INSERT INTO `visit_record` VALUES ('2078', '1', '226', '2017-03-31 16:34:47', '1');
INSERT INTO `visit_record` VALUES ('2079', '2', '226', '2017-03-31 16:38:58', '1');
INSERT INTO `visit_record` VALUES ('2080', '1', '226', '2017-03-31 16:39:08', '1');
INSERT INTO `visit_record` VALUES ('2081', '2', '226', '2017-03-31 16:40:44', '1');
INSERT INTO `visit_record` VALUES ('2082', '1', '226', '2017-03-31 16:40:53', '1');
INSERT INTO `visit_record` VALUES ('2083', '2', '226', '2017-03-31 16:46:46', '1');
INSERT INTO `visit_record` VALUES ('2084', '1', '229', '2017-03-31 16:46:52', '1');
INSERT INTO `visit_record` VALUES ('2085', '2', '229', '2017-03-31 16:47:26', '1');
INSERT INTO `visit_record` VALUES ('2086', '1', '226', '2017-03-31 16:47:30', '1');
INSERT INTO `visit_record` VALUES ('2087', '2', '226', '2017-03-31 16:54:17', '1');
INSERT INTO `visit_record` VALUES ('2088', '1', '229', '2017-03-31 16:54:30', '1');
INSERT INTO `visit_record` VALUES ('2089', '2', '229', '2017-03-31 17:03:21', '1');
INSERT INTO `visit_record` VALUES ('2090', '1', '226', '2017-03-31 17:03:27', '1');
INSERT INTO `visit_record` VALUES ('2091', '2', '226', '2017-03-31 17:04:10', '1');
INSERT INTO `visit_record` VALUES ('2092', '1', '226', '2017-03-31 17:04:20', '1');
INSERT INTO `visit_record` VALUES ('2093', '1', '226', '2017-03-31 17:05:14', '1');
INSERT INTO `visit_record` VALUES ('2094', '2', '226', '2017-03-31 17:18:35', '1');
INSERT INTO `visit_record` VALUES ('2095', '1', '226', '2017-03-31 17:18:37', '1');
INSERT INTO `visit_record` VALUES ('2096', '1', '226', '2017-03-31 17:25:09', '1');
INSERT INTO `visit_record` VALUES ('2097', '2', '226', '2017-03-31 17:25:48', '1');
INSERT INTO `visit_record` VALUES ('2098', '1', '226', '2017-03-31 17:25:54', '1');
INSERT INTO `visit_record` VALUES ('2099', '2', '226', '2017-03-31 17:26:02', '1');
INSERT INTO `visit_record` VALUES ('2100', '1', '226', '2017-03-31 17:26:25', '1');
INSERT INTO `visit_record` VALUES ('2101', '2', '226', '2017-03-31 17:33:05', '1');
INSERT INTO `visit_record` VALUES ('2102', '1', '226', '2017-03-31 17:33:10', '1');
INSERT INTO `visit_record` VALUES ('2103', '1', '226', '2017-03-31 17:37:24', '1');
INSERT INTO `visit_record` VALUES ('2104', '2', '226', '2017-03-31 17:44:21', '1');
INSERT INTO `visit_record` VALUES ('2105', '1', '226', '2017-03-31 17:44:25', '1');
INSERT INTO `visit_record` VALUES ('2106', '2', '226', '2017-03-31 17:45:42', '1');
INSERT INTO `visit_record` VALUES ('2107', '1', '226', '2017-03-31 17:51:07', '1');
INSERT INTO `visit_record` VALUES ('2108', '1', '226', '2017-03-31 17:51:07', '1');
INSERT INTO `visit_record` VALUES ('2109', '2', '226', '2017-03-31 17:51:59', '1');
INSERT INTO `visit_record` VALUES ('2110', '1', '226', '2017-04-01 09:12:20', '1');
INSERT INTO `visit_record` VALUES ('2111', '1', '226', '2017-04-01 09:19:22', '1');
INSERT INTO `visit_record` VALUES ('2112', '1', '226', '2017-04-01 09:22:26', '1');
INSERT INTO `visit_record` VALUES ('2113', '1', '226', '2017-04-01 09:24:37', '1');
INSERT INTO `visit_record` VALUES ('2114', '1', '226', '2017-04-01 09:27:22', '1');
INSERT INTO `visit_record` VALUES ('2115', '1', '226', '2017-04-01 09:32:57', '1');
INSERT INTO `visit_record` VALUES ('2116', '1', '226', '2017-04-01 09:57:18', '1');
INSERT INTO `visit_record` VALUES ('2117', '1', '226', '2017-04-01 09:57:18', '1');
INSERT INTO `visit_record` VALUES ('2118', '1', '226', '2017-04-01 11:06:49', '1');
INSERT INTO `visit_record` VALUES ('2119', '1', '226', '2017-04-01 11:56:13', '1');
INSERT INTO `visit_record` VALUES ('2120', '1', '226', '2017-04-01 12:05:18', '1');
INSERT INTO `visit_record` VALUES ('2121', '1', '226', '2017-04-01 12:32:21', '1');
INSERT INTO `visit_record` VALUES ('2122', '1', '226', '2017-04-01 13:33:58', '1');
INSERT INTO `visit_record` VALUES ('2123', '1', '226', '2017-04-01 13:48:32', '1');
INSERT INTO `visit_record` VALUES ('2124', '2', '226', '2017-04-01 14:05:20', '1');
INSERT INTO `visit_record` VALUES ('2125', '1', '227', '2017-04-01 14:05:37', '1');
INSERT INTO `visit_record` VALUES ('2126', '2', '227', '2017-04-01 14:08:07', '1');
INSERT INTO `visit_record` VALUES ('2127', '1', '226', '2017-04-01 14:08:15', '1');
INSERT INTO `visit_record` VALUES ('2128', '2', '226', '2017-04-01 14:12:47', '1');
INSERT INTO `visit_record` VALUES ('2129', '1', '229', '2017-04-01 14:12:58', '1');
INSERT INTO `visit_record` VALUES ('2130', '2', '229', '2017-04-01 14:13:42', '1');
INSERT INTO `visit_record` VALUES ('2131', '1', '226', '2017-04-01 14:13:50', '1');
INSERT INTO `visit_record` VALUES ('2132', '2', '226', '2017-04-01 14:16:28', '1');
INSERT INTO `visit_record` VALUES ('2133', '1', '226', '2017-04-01 14:16:35', '1');
INSERT INTO `visit_record` VALUES ('2134', '1', '226', '2017-04-01 14:16:36', '1');
INSERT INTO `visit_record` VALUES ('2135', '1', '226', '2017-04-05 10:17:52', '1');
INSERT INTO `visit_record` VALUES ('2136', '1', '226', '2017-04-05 10:20:05', '1');
INSERT INTO `visit_record` VALUES ('2137', '1', '228', '2017-04-05 11:32:59', '1');
INSERT INTO `visit_record` VALUES ('2138', '1', '228', '2017-04-05 11:32:59', '1');
INSERT INTO `visit_record` VALUES ('2139', '2', '228', '2017-04-05 11:35:39', '1');
INSERT INTO `visit_record` VALUES ('2140', '1', '226', '2017-04-05 11:35:47', '1');
INSERT INTO `visit_record` VALUES ('2141', '1', '228', '2017-04-05 11:36:33', '1');
INSERT INTO `visit_record` VALUES ('2142', '1', '226', '2017-04-05 13:41:46', '1');
INSERT INTO `visit_record` VALUES ('2143', '2', '226', '2017-04-05 13:42:48', '1');
INSERT INTO `visit_record` VALUES ('2144', '1', '228', '2017-04-05 13:42:54', '1');
INSERT INTO `visit_record` VALUES ('2145', '2', '228', '2017-04-05 13:43:15', '1');
INSERT INTO `visit_record` VALUES ('2146', '1', '226', '2017-04-05 13:43:22', '1');
INSERT INTO `visit_record` VALUES ('2147', '2', '226', '2017-04-05 14:00:34', '1');
INSERT INTO `visit_record` VALUES ('2148', '1', '226', '2017-04-05 14:00:40', '1');
INSERT INTO `visit_record` VALUES ('2149', '1', '226', '2017-04-05 15:48:56', '1');
INSERT INTO `visit_record` VALUES ('2150', '2', '226', '2017-04-05 15:49:59', '1');
INSERT INTO `visit_record` VALUES ('2151', '1', '226', '2017-04-05 15:50:05', '1');
INSERT INTO `visit_record` VALUES ('2152', '1', '226', '2017-04-05 16:03:38', '1');
INSERT INTO `visit_record` VALUES ('2153', '2', '247', '2017-04-05 16:12:09', '1');
INSERT INTO `visit_record` VALUES ('2154', '1', '226', '2017-04-05 16:12:49', '1');
INSERT INTO `visit_record` VALUES ('2155', '1', '226', '2017-04-05 16:12:03', '1');
INSERT INTO `visit_record` VALUES ('2156', '2', '226', '2017-04-05 16:20:47', '1');
INSERT INTO `visit_record` VALUES ('2157', '1', '228', '2017-04-05 16:20:52', '1');
INSERT INTO `visit_record` VALUES ('2158', '2', '228', '2017-04-05 16:24:59', '1');
INSERT INTO `visit_record` VALUES ('2159', '1', '226', '2017-04-05 16:25:05', '1');
INSERT INTO `visit_record` VALUES ('2160', '2', '226', '2017-04-05 16:26:28', '1');
INSERT INTO `visit_record` VALUES ('2161', '1', '228', '2017-04-05 16:26:34', '1');
INSERT INTO `visit_record` VALUES ('2162', '2', '228', '2017-04-05 16:35:44', '1');
INSERT INTO `visit_record` VALUES ('2163', '1', '226', '2017-04-05 16:35:49', '1');
INSERT INTO `visit_record` VALUES ('2164', '2', '226', '2017-04-05 16:50:22', '1');
INSERT INTO `visit_record` VALUES ('2165', '1', '228', '2017-04-05 16:50:28', '1');
INSERT INTO `visit_record` VALUES ('2166', '2', '228', '2017-04-05 16:51:19', '1');
INSERT INTO `visit_record` VALUES ('2167', '1', '226', '2017-04-05 16:51:24', '1');
INSERT INTO `visit_record` VALUES ('2168', '1', '226', '2017-04-06 13:45:30', '1');
INSERT INTO `visit_record` VALUES ('2169', '1', '226', '2017-04-06 14:44:50', '1');
INSERT INTO `visit_record` VALUES ('2170', '1', '226', '2017-04-06 15:20:00', '1');
INSERT INTO `visit_record` VALUES ('2171', '2', '226', '2017-04-06 15:20:17', '1');
INSERT INTO `visit_record` VALUES ('2172', '1', '228', '2017-04-06 15:20:28', '1');
INSERT INTO `visit_record` VALUES ('2173', '2', '228', '2017-04-06 15:35:35', '1');
INSERT INTO `visit_record` VALUES ('2174', '1', '228', '2017-04-06 15:35:42', '1');
INSERT INTO `visit_record` VALUES ('2175', '1', '226', '2017-04-06 16:10:29', '1');
INSERT INTO `visit_record` VALUES ('2176', '1', '226', '2017-04-06 16:46:27', '1');
INSERT INTO `visit_record` VALUES ('2177', '1', '226', '2017-04-06 16:59:32', '1');
INSERT INTO `visit_record` VALUES ('2178', '1', '226', '2017-04-06 17:22:32', '1');
INSERT INTO `visit_record` VALUES ('2179', '1', '226', '2017-04-06 18:54:44', '1');
INSERT INTO `visit_record` VALUES ('2180', '1', '226', '2017-04-06 19:11:51', '1');
INSERT INTO `visit_record` VALUES ('2181', '1', '226', '2017-04-06 19:21:46', '1');
INSERT INTO `visit_record` VALUES ('2182', '2', '226', '2017-04-06 19:22:38', '1');
INSERT INTO `visit_record` VALUES ('2183', '1', '226', '2017-04-06 19:22:40', '1');
INSERT INTO `visit_record` VALUES ('2184', '1', '226', '2017-04-07 11:15:28', '1');
INSERT INTO `visit_record` VALUES ('2185', '1', '226', '2017-04-07 11:53:05', '1');
INSERT INTO `visit_record` VALUES ('2186', '1', '226', '2017-04-07 13:41:37', '1');
INSERT INTO `visit_record` VALUES ('2187', '1', '226', '2017-04-07 15:32:20', '1');
INSERT INTO `visit_record` VALUES ('2188', '1', '226', '2017-04-10 09:31:06', '1');
INSERT INTO `visit_record` VALUES ('2189', '1', '226', '2017-04-10 10:26:45', '1');
INSERT INTO `visit_record` VALUES ('2190', '1', '228', '2017-04-10 11:05:09', '1');
INSERT INTO `visit_record` VALUES ('2191', '1', '228', '2017-04-10 11:23:12', '1');
INSERT INTO `visit_record` VALUES ('2192', '1', '226', '2017-04-10 11:22:46', '1');
INSERT INTO `visit_record` VALUES ('2193', '2', '228', '2017-04-10 11:34:20', '1');
INSERT INTO `visit_record` VALUES ('2194', '1', '226', '2017-04-10 11:34:36', '1');
INSERT INTO `visit_record` VALUES ('2195', '2', '226', '2017-04-10 11:38:27', '1');
INSERT INTO `visit_record` VALUES ('2196', '1', '228', '2017-04-10 11:38:41', '1');
INSERT INTO `visit_record` VALUES ('2197', '2', '228', '2017-04-10 11:38:59', '1');
INSERT INTO `visit_record` VALUES ('2198', '1', '226', '2017-04-10 11:39:07', '1');
INSERT INTO `visit_record` VALUES ('2199', '2', '226', '2017-04-10 11:40:07', '1');
INSERT INTO `visit_record` VALUES ('2200', '1', '228', '2017-04-10 11:40:15', '1');
INSERT INTO `visit_record` VALUES ('2201', '1', '226', '2017-04-10 14:08:24', '1');
INSERT INTO `visit_record` VALUES ('2202', '1', '226', '2017-04-17 11:08:52', '1');
INSERT INTO `visit_record` VALUES ('2203', '1', '226', '2017-04-17 11:13:48', '1');
INSERT INTO `visit_record` VALUES ('2204', '1', '226', '2017-05-04 15:51:07', '1');
INSERT INTO `visit_record` VALUES ('2205', '1', '226', '2017-05-11 15:22:29', '1');
INSERT INTO `visit_record` VALUES ('2206', '1', '226', '2017-05-11 15:23:14', '1');
INSERT INTO `visit_record` VALUES ('2207', '1', '226', '2017-05-11 15:23:39', '1');
INSERT INTO `visit_record` VALUES ('2208', '1', '226', '2017-05-11 15:23:49', '1');
INSERT INTO `visit_record` VALUES ('2209', '2', '226', '2017-05-11 15:27:39', '1');
INSERT INTO `visit_record` VALUES ('2210', '1', '226', '2017-05-11 15:46:55', '1');
INSERT INTO `visit_record` VALUES ('2211', '1', '226', '2017-05-11 15:48:18', '1');
INSERT INTO `visit_record` VALUES ('2212', '1', '228', '2017-05-11 15:50:19', '1');
INSERT INTO `visit_record` VALUES ('2213', '1', '226', '2017-05-11 15:51:03', '1');
INSERT INTO `visit_record` VALUES ('2214', '1', '228', '2017-05-11 15:53:28', '1');
INSERT INTO `visit_record` VALUES ('2215', '1', '226', '2017-05-11 17:03:00', '1');
INSERT INTO `visit_record` VALUES ('2216', '1', '226', '2017-05-11 17:06:41', '1');
INSERT INTO `visit_record` VALUES ('2217', '1', '226', '2017-05-11 17:27:26', '1');
INSERT INTO `visit_record` VALUES ('2218', '1', '226', '2017-05-11 19:53:55', '1');
INSERT INTO `visit_record` VALUES ('2219', '1', '226', '2017-05-11 20:05:23', '1');
INSERT INTO `visit_record` VALUES ('2220', '1', '226', '2017-05-11 20:06:58', '1');
INSERT INTO `visit_record` VALUES ('2221', '1', '226', '2017-05-11 20:08:21', '1');
INSERT INTO `visit_record` VALUES ('2222', '1', '226', '2017-05-11 20:25:12', '1');
INSERT INTO `visit_record` VALUES ('2223', '1', '226', '2017-05-11 21:02:08', '1');
INSERT INTO `visit_record` VALUES ('2224', '1', '226', '2017-05-11 21:07:29', '1');
INSERT INTO `visit_record` VALUES ('2225', '1', '226', '2017-05-11 21:22:48', '1');
INSERT INTO `visit_record` VALUES ('2226', '1', '226', '2017-05-11 21:34:07', '1');
INSERT INTO `visit_record` VALUES ('2227', '1', '226', '2017-05-11 21:38:29', '1');
INSERT INTO `visit_record` VALUES ('2228', '1', '226', '2017-05-11 21:39:49', '1');
INSERT INTO `visit_record` VALUES ('2229', '1', '226', '2017-05-12 09:11:09', '1');
INSERT INTO `visit_record` VALUES ('2230', '1', '226', '2017-05-12 09:12:07', '1');
INSERT INTO `visit_record` VALUES ('2231', '2', '226', '2017-05-12 09:40:52', '1');
INSERT INTO `visit_record` VALUES ('2232', '1', '228', '2017-05-12 09:41:02', '1');
INSERT INTO `visit_record` VALUES ('2233', '2', '228', '2017-05-12 09:42:02', '1');
INSERT INTO `visit_record` VALUES ('2234', '1', '228', '2017-05-12 09:42:12', '1');
INSERT INTO `visit_record` VALUES ('2235', '2', '228', '2017-05-12 09:46:11', '1');
INSERT INTO `visit_record` VALUES ('2236', '1', '228', '2017-05-12 09:46:18', '1');
INSERT INTO `visit_record` VALUES ('2237', '2', '228', '2017-05-12 09:47:35', '1');
INSERT INTO `visit_record` VALUES ('2238', '1', '226', '2017-05-12 09:47:42', '1');
INSERT INTO `visit_record` VALUES ('2239', '2', '226', '2017-05-12 09:49:10', '1');
INSERT INTO `visit_record` VALUES ('2240', '1', '228', '2017-05-12 09:49:17', '1');
INSERT INTO `visit_record` VALUES ('2241', '2', '228', '2017-05-12 09:50:43', '1');
INSERT INTO `visit_record` VALUES ('2242', '1', '228', '2017-05-12 09:50:57', '1');
INSERT INTO `visit_record` VALUES ('2243', '2', '228', '2017-05-12 09:56:00', '1');
INSERT INTO `visit_record` VALUES ('2244', '1', '228', '2017-05-12 09:56:08', '1');
INSERT INTO `visit_record` VALUES ('2245', '2', '226', '2017-05-12 09:57:15', '1');
INSERT INTO `visit_record` VALUES ('2246', '1', '228', '2017-05-12 09:57:35', '1');
INSERT INTO `visit_record` VALUES ('2247', '2', '228', '2017-05-12 09:59:09', '1');
INSERT INTO `visit_record` VALUES ('2248', '1', '226', '2017-05-12 09:59:14', '1');
INSERT INTO `visit_record` VALUES ('2249', '2', '226', '2017-05-12 10:00:59', '1');
INSERT INTO `visit_record` VALUES ('2250', '1', '228', '2017-05-12 10:01:07', '1');
INSERT INTO `visit_record` VALUES ('2251', '2', '228', '2017-05-12 10:01:34', '1');
INSERT INTO `visit_record` VALUES ('2252', '1', '226', '2017-05-12 10:01:42', '1');
INSERT INTO `visit_record` VALUES ('2253', '2', '228', '2017-05-12 10:06:37', '1');
INSERT INTO `visit_record` VALUES ('2254', '1', '226', '2017-05-12 10:06:43', '1');
INSERT INTO `visit_record` VALUES ('2255', '1', '228', '2017-05-12 10:29:19', '1');
INSERT INTO `visit_record` VALUES ('2256', '2', '226', '2017-05-12 10:30:45', '1');
INSERT INTO `visit_record` VALUES ('2257', '1', '228', '2017-05-12 10:30:52', '1');
INSERT INTO `visit_record` VALUES ('2258', '2', '228', '2017-05-12 10:32:12', '1');
INSERT INTO `visit_record` VALUES ('2259', '2', '228', '2017-05-12 10:32:24', '1');
INSERT INTO `visit_record` VALUES ('2260', '1', '226', '2017-05-12 10:32:26', '1');
INSERT INTO `visit_record` VALUES ('2261', '1', '226', '2017-05-12 10:32:31', '1');
INSERT INTO `visit_record` VALUES ('2262', '2', '226', '2017-05-12 10:34:19', '1');
INSERT INTO `visit_record` VALUES ('2263', '1', '228', '2017-05-12 10:34:27', '1');
INSERT INTO `visit_record` VALUES ('2264', '2', '228', '2017-05-12 10:34:59', '1');
INSERT INTO `visit_record` VALUES ('2265', '1', '228', '2017-05-12 10:35:13', '1');
INSERT INTO `visit_record` VALUES ('2266', '2', '228', '2017-05-12 10:37:10', '1');
INSERT INTO `visit_record` VALUES ('2267', '1', '226', '2017-05-12 10:37:19', '1');
INSERT INTO `visit_record` VALUES ('2268', '2', '226', '2017-05-12 10:38:02', '1');
INSERT INTO `visit_record` VALUES ('2269', '1', '228', '2017-05-12 10:38:12', '1');
INSERT INTO `visit_record` VALUES ('2270', '1', '226', '2017-05-12 10:43:20', '1');
INSERT INTO `visit_record` VALUES ('2271', '2', '226', '2017-05-12 11:07:37', '1');
INSERT INTO `visit_record` VALUES ('2272', '1', '228', '2017-05-12 11:07:45', '1');
INSERT INTO `visit_record` VALUES ('2273', '2', '228', '2017-05-12 11:08:09', '1');
INSERT INTO `visit_record` VALUES ('2274', '1', '226', '2017-05-12 11:08:11', '1');
INSERT INTO `visit_record` VALUES ('2275', '2', '226', '2017-05-12 11:08:38', '1');
INSERT INTO `visit_record` VALUES ('2276', '1', '228', '2017-05-12 11:08:45', '1');
INSERT INTO `visit_record` VALUES ('2277', '2', '228', '2017-05-12 11:09:51', '1');
INSERT INTO `visit_record` VALUES ('2278', '1', '226', '2017-05-12 11:09:56', '1');
INSERT INTO `visit_record` VALUES ('2279', '1', '226', '2017-05-12 11:14:41', '1');
INSERT INTO `visit_record` VALUES ('2280', '2', '226', '2017-05-12 11:19:33', '1');
INSERT INTO `visit_record` VALUES ('2281', '1', '228', '2017-05-12 11:19:48', '1');
INSERT INTO `visit_record` VALUES ('2282', '2', '228', '2017-05-12 11:25:26', '1');
INSERT INTO `visit_record` VALUES ('2283', '1', '226', '2017-05-12 11:25:33', '1');
INSERT INTO `visit_record` VALUES ('2284', '2', '226', '2017-05-12 11:29:13', '1');
INSERT INTO `visit_record` VALUES ('2285', '1', '228', '2017-05-12 11:29:22', '1');
INSERT INTO `visit_record` VALUES ('2286', '1', '226', '2017-05-12 11:36:28', '1');
INSERT INTO `visit_record` VALUES ('2287', '1', '228', '2017-05-12 11:41:58', '1');
INSERT INTO `visit_record` VALUES ('2288', '1', '226', '2017-05-12 11:44:26', '1');
INSERT INTO `visit_record` VALUES ('2289', '1', '226', '2017-05-12 12:01:56', '1');
INSERT INTO `visit_record` VALUES ('2290', '2', '226', '2017-05-12 12:02:01', '1');
INSERT INTO `visit_record` VALUES ('2291', '1', '228', '2017-05-12 12:02:07', '1');
INSERT INTO `visit_record` VALUES ('2292', '2', '228', '2017-05-12 12:05:46', '1');
INSERT INTO `visit_record` VALUES ('2293', '1', '226', '2017-05-12 12:05:58', '1');
INSERT INTO `visit_record` VALUES ('2294', '2', '226', '2017-05-12 12:07:37', '1');
INSERT INTO `visit_record` VALUES ('2295', '1', '228', '2017-05-12 12:07:44', '1');
INSERT INTO `visit_record` VALUES ('2296', '1', '228', '2017-05-12 12:12:55', '1');
INSERT INTO `visit_record` VALUES ('2297', '1', '226', '2017-05-12 12:21:42', '1');
INSERT INTO `visit_record` VALUES ('2298', '2', '226', '2017-05-12 12:26:52', '1');
INSERT INTO `visit_record` VALUES ('2299', '1', '226', '2017-05-12 12:27:06', '1');
INSERT INTO `visit_record` VALUES ('2300', '2', '228', '2017-05-12 12:30:53', '1');
INSERT INTO `visit_record` VALUES ('2301', '1', '228', '2017-05-12 12:31:02', '1');
INSERT INTO `visit_record` VALUES ('2302', '2', '228', '2017-05-12 12:31:16', '1');
INSERT INTO `visit_record` VALUES ('2303', '1', '228', '2017-05-12 12:31:35', '1');
INSERT INTO `visit_record` VALUES ('2304', '2', '228', '2017-05-12 12:33:09', '1');
INSERT INTO `visit_record` VALUES ('2305', '1', '228', '2017-05-12 12:33:37', '1');
INSERT INTO `visit_record` VALUES ('2306', '2', '228', '2017-05-12 12:33:53', '1');
INSERT INTO `visit_record` VALUES ('2307', '1', '226', '2017-05-12 12:34:05', '1');
INSERT INTO `visit_record` VALUES ('2308', '2', '226', '2017-05-12 12:36:04', '1');
INSERT INTO `visit_record` VALUES ('2309', '1', '228', '2017-05-12 12:36:11', '1');
INSERT INTO `visit_record` VALUES ('2310', '2', '228', '2017-05-12 12:36:21', '1');
INSERT INTO `visit_record` VALUES ('2311', '1', '226', '2017-05-12 12:36:29', '1');
INSERT INTO `visit_record` VALUES ('2312', '1', '226', '2017-05-12 12:39:51', '1');
INSERT INTO `visit_record` VALUES ('2313', '1', '226', '2017-05-12 13:09:22', '1');
INSERT INTO `visit_record` VALUES ('2314', '1', '226', '2017-05-12 13:11:44', '1');
INSERT INTO `visit_record` VALUES ('2315', '2', '226', '2017-05-12 13:12:18', '1');
INSERT INTO `visit_record` VALUES ('2316', '1', '228', '2017-05-12 13:12:30', '1');
INSERT INTO `visit_record` VALUES ('2317', '2', '228', '2017-05-12 13:12:54', '1');
INSERT INTO `visit_record` VALUES ('2318', '1', '226', '2017-05-12 13:13:00', '1');
INSERT INTO `visit_record` VALUES ('2319', '1', '226', '2017-05-12 13:14:00', '1');
INSERT INTO `visit_record` VALUES ('2320', '2', '226', '2017-05-12 13:22:01', '1');
INSERT INTO `visit_record` VALUES ('2321', '1', '228', '2017-05-12 13:22:10', '1');
INSERT INTO `visit_record` VALUES ('2322', '2', '228', '2017-05-12 13:25:17', '1');
INSERT INTO `visit_record` VALUES ('2323', '1', '226', '2017-05-12 13:25:25', '1');
INSERT INTO `visit_record` VALUES ('2324', '2', '226', '2017-05-12 13:25:55', '1');
INSERT INTO `visit_record` VALUES ('2325', '1', '228', '2017-05-12 13:26:02', '1');
INSERT INTO `visit_record` VALUES ('2326', '2', '228', '2017-05-12 13:28:28', '1');
INSERT INTO `visit_record` VALUES ('2327', '1', '226', '2017-05-12 13:28:37', '1');
INSERT INTO `visit_record` VALUES ('2328', '2', '226', '2017-05-12 13:30:50', '1');
INSERT INTO `visit_record` VALUES ('2329', '1', '226', '2017-05-12 13:30:55', '1');
INSERT INTO `visit_record` VALUES ('2330', '2', '226', '2017-05-12 13:33:58', '1');
INSERT INTO `visit_record` VALUES ('2331', '1', '228', '2017-05-12 13:34:11', '1');
INSERT INTO `visit_record` VALUES ('2332', '1', '228', '2017-05-12 13:34:45', '1');
INSERT INTO `visit_record` VALUES ('2333', '2', '228', '2017-05-12 13:44:34', '1');
INSERT INTO `visit_record` VALUES ('2334', '1', '226', '2017-05-12 13:44:43', '1');
INSERT INTO `visit_record` VALUES ('2335', '1', '226', '2017-05-12 13:52:50', '1');
INSERT INTO `visit_record` VALUES ('2336', '1', '226', '2017-05-12 13:56:04', '1');
INSERT INTO `visit_record` VALUES ('2337', '1', '226', '2017-05-12 13:56:45', '1');
INSERT INTO `visit_record` VALUES ('2338', '1', '226', '2017-05-12 14:02:35', '1');
INSERT INTO `visit_record` VALUES ('2339', '1', '226', '2017-05-12 14:02:35', '1');
INSERT INTO `visit_record` VALUES ('2340', '1', '226', '2017-05-12 14:02:37', '1');
INSERT INTO `visit_record` VALUES ('2341', '1', '226', '2017-05-12 14:14:29', '1');
INSERT INTO `visit_record` VALUES ('2342', '2', '226', '2017-05-12 14:14:43', '1');
INSERT INTO `visit_record` VALUES ('2343', '1', '226', '2017-05-12 14:15:22', '1');
INSERT INTO `visit_record` VALUES ('2344', '2', '226', '2017-05-12 14:19:03', '1');
INSERT INTO `visit_record` VALUES ('2345', '1', '226', '2017-05-12 14:19:50', '1');
INSERT INTO `visit_record` VALUES ('2346', '2', '226', '2017-05-12 14:21:45', '1');
INSERT INTO `visit_record` VALUES ('2347', '1', '228', '2017-05-12 14:22:00', '1');
INSERT INTO `visit_record` VALUES ('2348', '2', '228', '2017-05-12 14:25:00', '1');
INSERT INTO `visit_record` VALUES ('2349', '1', '226', '2017-05-12 14:25:03', '1');
INSERT INTO `visit_record` VALUES ('2350', '1', '228', '2017-05-12 14:25:05', '1');
INSERT INTO `visit_record` VALUES ('2351', '2', '226', '2017-05-12 14:29:09', '1');
INSERT INTO `visit_record` VALUES ('2352', '1', '228', '2017-05-12 14:29:13', '1');
INSERT INTO `visit_record` VALUES ('2353', '2', '228', '2017-05-12 14:36:51', '1');
INSERT INTO `visit_record` VALUES ('2354', '1', '226', '2017-05-12 14:36:55', '1');
INSERT INTO `visit_record` VALUES ('2355', '2', '226', '2017-05-12 14:37:24', '1');
INSERT INTO `visit_record` VALUES ('2356', '1', '228', '2017-05-12 14:37:28', '1');
INSERT INTO `visit_record` VALUES ('2357', '2', '228', '2017-05-12 14:39:24', '1');
INSERT INTO `visit_record` VALUES ('2358', '1', '226', '2017-05-12 14:39:35', '1');
INSERT INTO `visit_record` VALUES ('2359', '1', '228', '2017-05-12 14:41:21', '1');
INSERT INTO `visit_record` VALUES ('2360', '2', '226', '2017-05-12 14:42:31', '1');
INSERT INTO `visit_record` VALUES ('2361', '1', '228', '2017-05-12 14:42:38', '1');
INSERT INTO `visit_record` VALUES ('2362', '1', '228', '2017-05-12 14:42:38', '1');
INSERT INTO `visit_record` VALUES ('2363', '2', '228', '2017-05-12 14:45:29', '1');
INSERT INTO `visit_record` VALUES ('2364', '1', '226', '2017-05-12 14:45:32', '1');
INSERT INTO `visit_record` VALUES ('2365', '2', '226', '2017-05-12 14:46:53', '1');
INSERT INTO `visit_record` VALUES ('2366', '1', '228', '2017-05-12 14:46:59', '1');
INSERT INTO `visit_record` VALUES ('2367', '1', '228', '2017-05-12 14:47:00', '1');
INSERT INTO `visit_record` VALUES ('2368', '2', '228', '2017-05-12 14:52:48', '1');
INSERT INTO `visit_record` VALUES ('2369', '1', '226', '2017-05-12 14:52:57', '1');
INSERT INTO `visit_record` VALUES ('2370', '2', '226', '2017-05-12 15:18:42', '1');
INSERT INTO `visit_record` VALUES ('2371', '1', '228', '2017-05-12 15:18:45', '1');
INSERT INTO `visit_record` VALUES ('2372', '1', '228', '2017-05-12 15:18:46', '1');
INSERT INTO `visit_record` VALUES ('2373', '2', '228', '2017-05-12 15:21:11', '1');
INSERT INTO `visit_record` VALUES ('2374', '1', '226', '2017-05-12 15:21:15', '1');
INSERT INTO `visit_record` VALUES ('2375', '1', '226', '2017-05-12 15:21:16', '1');
INSERT INTO `visit_record` VALUES ('2376', '1', '228', '2017-05-12 15:38:04', '1');
INSERT INTO `visit_record` VALUES ('2377', '1', '228', '2017-05-12 15:39:02', '1');
INSERT INTO `visit_record` VALUES ('2378', '2', '226', '2017-05-12 15:48:03', '1');
INSERT INTO `visit_record` VALUES ('2379', '2', '228', '2017-05-12 15:53:29', '1');
INSERT INTO `visit_record` VALUES ('2380', '1', '226', '2017-05-12 15:53:43', '1');
INSERT INTO `visit_record` VALUES ('2381', '1', '226', '2017-05-12 15:54:49', '1');
INSERT INTO `visit_record` VALUES ('2382', '2', '226', '2017-05-12 15:56:55', '1');
INSERT INTO `visit_record` VALUES ('2383', '1', '228', '2017-05-12 15:56:58', '1');
INSERT INTO `visit_record` VALUES ('2384', '2', '228', '2017-05-12 15:59:07', '1');
INSERT INTO `visit_record` VALUES ('2385', '1', '226', '2017-05-12 15:59:17', '1');
INSERT INTO `visit_record` VALUES ('2386', '2', '228', '2017-05-12 16:08:41', '1');
INSERT INTO `visit_record` VALUES ('2387', '1', '226', '2017-05-12 16:08:45', '1');
INSERT INTO `visit_record` VALUES ('2388', '1', '226', '2017-05-12 17:08:36', '1');
INSERT INTO `visit_record` VALUES ('2389', '1', '228', '2017-05-12 17:23:25', '1');
INSERT INTO `visit_record` VALUES ('2390', '2', '228', '2017-05-12 17:25:23', '1');
INSERT INTO `visit_record` VALUES ('2391', '1', '226', '2017-05-12 17:25:30', '1');
INSERT INTO `visit_record` VALUES ('2392', '2', '226', '2017-05-12 17:25:57', '1');
INSERT INTO `visit_record` VALUES ('2393', '1', '228', '2017-05-12 17:26:04', '1');
INSERT INTO `visit_record` VALUES ('2394', '2', '228', '2017-05-12 17:27:59', '1');
INSERT INTO `visit_record` VALUES ('2395', '1', '226', '2017-05-12 17:28:06', '1');
INSERT INTO `visit_record` VALUES ('2396', '1', '226', '2017-05-15 11:37:28', '1');
INSERT INTO `visit_record` VALUES ('2397', '1', '226', '2017-05-15 11:43:28', '1');
INSERT INTO `visit_record` VALUES ('2398', '2', '226', '2017-05-15 11:53:28', '1');
INSERT INTO `visit_record` VALUES ('2399', '1', '226', '2017-05-15 11:57:48', '1');
INSERT INTO `visit_record` VALUES ('2400', '1', '226', '2017-05-15 13:41:58', '1');
INSERT INTO `visit_record` VALUES ('2401', '2', '226', '2017-05-15 13:42:03', '1');
INSERT INTO `visit_record` VALUES ('2402', '1', '226', '2017-05-15 13:42:04', '1');
INSERT INTO `visit_record` VALUES ('2403', '1', '226', '2017-05-15 13:42:08', '1');
INSERT INTO `visit_record` VALUES ('2404', '1', '226', '2017-05-15 13:42:09', '1');
INSERT INTO `visit_record` VALUES ('2405', '2', '226', '2017-05-15 13:42:11', '1');
INSERT INTO `visit_record` VALUES ('2406', '1', '228', '2017-05-15 13:43:35', '1');
INSERT INTO `visit_record` VALUES ('2407', '2', '228', '2017-05-15 13:45:46', '1');
INSERT INTO `visit_record` VALUES ('2408', '1', '226', '2017-05-15 13:45:53', '1');
INSERT INTO `visit_record` VALUES ('2409', '1', '226', '2017-05-15 13:48:57', '1');
INSERT INTO `visit_record` VALUES ('2410', '2', '226', '2017-05-15 14:14:09', '1');
INSERT INTO `visit_record` VALUES ('2411', '1', '228', '2017-05-15 14:14:18', '1');
INSERT INTO `visit_record` VALUES ('2412', '2', '228', '2017-05-15 14:24:18', '1');
INSERT INTO `visit_record` VALUES ('2413', '1', '226', '2017-05-15 14:24:26', '1');
INSERT INTO `visit_record` VALUES ('2414', '1', '226', '2017-05-15 14:26:38', '1');
INSERT INTO `visit_record` VALUES ('2415', '1', '226', '2017-05-15 14:53:53', '1');
INSERT INTO `visit_record` VALUES ('2416', '2', '226', '2017-05-15 15:00:20', '1');
INSERT INTO `visit_record` VALUES ('2417', '1', '228', '2017-05-15 15:00:32', '1');
INSERT INTO `visit_record` VALUES ('2418', '2', '228', '2017-05-15 15:11:23', '1');
INSERT INTO `visit_record` VALUES ('2419', '1', '226', '2017-05-15 15:11:30', '1');
INSERT INTO `visit_record` VALUES ('2420', '1', '226', '2017-05-15 15:40:00', '1');
INSERT INTO `visit_record` VALUES ('2421', '2', '226', '2017-05-15 15:52:24', '1');
INSERT INTO `visit_record` VALUES ('2422', '1', '228', '2017-05-15 15:52:31', '1');
INSERT INTO `visit_record` VALUES ('2423', '2', '228', '2017-05-15 15:52:40', '1');
INSERT INTO `visit_record` VALUES ('2424', '1', '226', '2017-05-15 15:52:49', '1');
INSERT INTO `visit_record` VALUES ('2425', '1', '228', '2017-05-15 15:53:41', '1');
INSERT INTO `visit_record` VALUES ('2426', '1', '226', '2017-05-15 17:44:50', '1');
INSERT INTO `visit_record` VALUES ('2427', '2', '226', '2017-05-15 17:53:03', '1');
INSERT INTO `visit_record` VALUES ('2428', '1', '228', '2017-05-15 17:53:11', '1');
INSERT INTO `visit_record` VALUES ('2429', '2', '228', '2017-05-15 17:59:17', '1');
INSERT INTO `visit_record` VALUES ('2430', '1', '226', '2017-05-15 17:59:24', '1');
INSERT INTO `visit_record` VALUES ('2431', '2', '226', '2017-05-15 18:00:29', '1');
INSERT INTO `visit_record` VALUES ('2432', '1', '228', '2017-05-15 18:00:39', '1');
INSERT INTO `visit_record` VALUES ('2433', '1', '226', '2017-05-15 18:03:12', '1');
INSERT INTO `visit_record` VALUES ('2434', '1', '226', '2017-05-16 09:39:11', '1');
INSERT INTO `visit_record` VALUES ('2435', '2', '226', '2017-05-16 09:49:15', '1');
INSERT INTO `visit_record` VALUES ('2436', '1', '226', '2017-05-16 10:10:12', '1');
INSERT INTO `visit_record` VALUES ('2437', '2', '226', '2017-05-16 10:21:18', '1');
INSERT INTO `visit_record` VALUES ('2438', '1', '226', '2017-05-16 10:21:48', '1');
INSERT INTO `visit_record` VALUES ('2439', '2', '226', '2017-05-16 10:22:35', '1');
INSERT INTO `visit_record` VALUES ('2440', '1', '226', '2017-05-16 10:29:02', '1');
INSERT INTO `visit_record` VALUES ('2441', '2', '226', '2017-05-16 10:29:38', '1');
INSERT INTO `visit_record` VALUES ('2442', '1', '226', '2017-05-16 10:40:47', '1');
INSERT INTO `visit_record` VALUES ('2443', '2', '226', '2017-05-16 10:41:00', '1');
INSERT INTO `visit_record` VALUES ('2444', '1', '226', '2017-05-16 10:41:42', '1');
INSERT INTO `visit_record` VALUES ('2445', '2', '226', '2017-05-16 10:43:08', '1');
INSERT INTO `visit_record` VALUES ('2446', '1', '228', '2017-05-16 10:43:15', '1');
INSERT INTO `visit_record` VALUES ('2447', '2', '228', '2017-05-16 10:45:56', '1');
INSERT INTO `visit_record` VALUES ('2448', '1', '226', '2017-05-16 10:51:44', '1');
INSERT INTO `visit_record` VALUES ('2449', '2', '226', '2017-05-16 10:51:56', '1');
INSERT INTO `visit_record` VALUES ('2450', '1', '228', '2017-05-16 10:54:53', '1');
INSERT INTO `visit_record` VALUES ('2451', '2', '228', '2017-05-16 10:59:24', '1');
INSERT INTO `visit_record` VALUES ('2452', '1', '226', '2017-05-16 10:59:31', '1');
INSERT INTO `visit_record` VALUES ('2453', '2', '226', '2017-05-16 11:00:17', '1');
INSERT INTO `visit_record` VALUES ('2454', '1', '228', '2017-05-16 11:01:41', '1');
INSERT INTO `visit_record` VALUES ('2455', '2', '228', '2017-05-16 11:06:04', '1');
INSERT INTO `visit_record` VALUES ('2456', '1', '228', '2017-05-16 11:06:56', '1');
INSERT INTO `visit_record` VALUES ('2457', '2', '228', '2017-05-16 11:08:54', '1');
INSERT INTO `visit_record` VALUES ('2458', '1', '228', '2017-05-16 11:27:04', '1');
INSERT INTO `visit_record` VALUES ('2459', '1', '226', '2017-05-16 11:28:13', '1');
INSERT INTO `visit_record` VALUES ('2460', '2', '226', '2017-05-16 11:28:19', '1');
INSERT INTO `visit_record` VALUES ('2461', '1', '226', '2017-05-16 11:29:33', '1');
INSERT INTO `visit_record` VALUES ('2462', '2', '226', '2017-05-16 12:28:03', '1');
INSERT INTO `visit_record` VALUES ('2463', '1', '226', '2017-05-16 12:29:03', '1');
INSERT INTO `visit_record` VALUES ('2464', '1', '226', '2017-05-16 13:00:55', '1');
INSERT INTO `visit_record` VALUES ('2465', '1', '226', '2017-05-16 13:38:42', '1');
INSERT INTO `visit_record` VALUES ('2466', '1', '226', '2017-05-16 13:49:06', '1');
INSERT INTO `visit_record` VALUES ('2467', '1', '226', '2017-05-16 15:18:38', '1');
INSERT INTO `visit_record` VALUES ('2468', '1', '226', '2017-05-16 15:21:49', '1');
INSERT INTO `visit_record` VALUES ('2469', '1', '226', '2017-05-16 15:35:02', '1');
INSERT INTO `visit_record` VALUES ('2470', '2', '226', '2017-05-16 15:44:35', '1');
INSERT INTO `visit_record` VALUES ('2471', '1', '228', '2017-05-16 15:44:42', '1');
INSERT INTO `visit_record` VALUES ('2472', '2', '228', '2017-05-16 16:25:31', '1');
INSERT INTO `visit_record` VALUES ('2473', '1', '226', '2017-05-16 16:25:33', '1');
INSERT INTO `visit_record` VALUES ('2474', '2', '226', '2017-05-16 16:27:59', '1');
INSERT INTO `visit_record` VALUES ('2475', '1', '226', '2017-05-16 16:28:03', '1');
INSERT INTO `visit_record` VALUES ('2476', '1', '226', '2017-05-16 16:29:17', '1');
INSERT INTO `visit_record` VALUES ('2477', '2', '226', '2017-05-16 16:29:39', '1');
INSERT INTO `visit_record` VALUES ('2478', '1', '226', '2017-05-16 16:30:25', '1');
INSERT INTO `visit_record` VALUES ('2479', '2', '226', '2017-05-16 16:55:59', '1');
INSERT INTO `visit_record` VALUES ('2480', '1', '228', '2017-05-16 16:56:08', '1');
INSERT INTO `visit_record` VALUES ('2481', '2', '228', '2017-05-16 16:57:07', '1');
INSERT INTO `visit_record` VALUES ('2482', '1', '226', '2017-05-16 16:57:14', '1');
INSERT INTO `visit_record` VALUES ('2483', '2', '226', '2017-05-16 16:58:53', '1');
INSERT INTO `visit_record` VALUES ('2484', '1', '228', '2017-05-16 16:59:04', '1');
INSERT INTO `visit_record` VALUES ('2485', '2', '228', '2017-05-16 17:20:13', '1');
INSERT INTO `visit_record` VALUES ('2486', '1', '226', '2017-05-16 17:20:20', '1');
INSERT INTO `visit_record` VALUES ('2487', '2', '226', '2017-05-16 17:21:38', '1');
INSERT INTO `visit_record` VALUES ('2488', '1', '228', '2017-05-16 17:21:49', '1');
INSERT INTO `visit_record` VALUES ('2489', '1', '226', '2017-05-17 09:38:37', '1');
INSERT INTO `visit_record` VALUES ('2490', '2', '226', '2017-05-17 09:38:54', '1');
INSERT INTO `visit_record` VALUES ('2491', '1', '226', '2017-05-17 09:39:00', '1');
INSERT INTO `visit_record` VALUES ('2492', '2', '226', '2017-05-17 09:43:57', '1');
INSERT INTO `visit_record` VALUES ('2493', '1', '228', '2017-05-17 09:44:06', '1');
INSERT INTO `visit_record` VALUES ('2494', '2', '228', '2017-05-17 09:48:32', '1');
INSERT INTO `visit_record` VALUES ('2495', '1', '226', '2017-05-17 09:48:40', '1');
INSERT INTO `visit_record` VALUES ('2496', '2', '226', '2017-05-17 09:49:14', '1');
INSERT INTO `visit_record` VALUES ('2497', '1', '228', '2017-05-17 09:49:26', '1');
INSERT INTO `visit_record` VALUES ('2498', '1', '226', '2017-05-17 09:49:05', '1');
INSERT INTO `visit_record` VALUES ('2499', '1', '226', '2017-05-17 09:52:55', '1');
INSERT INTO `visit_record` VALUES ('2500', '1', '226', '2017-05-17 10:12:49', '1');
INSERT INTO `visit_record` VALUES ('2501', '1', '226', '2017-05-17 10:38:51', '1');
INSERT INTO `visit_record` VALUES ('2502', '1', '228', '2017-05-17 10:53:51', '1');
INSERT INTO `visit_record` VALUES ('2503', '1', '228', '2017-05-17 10:55:13', '1');
INSERT INTO `visit_record` VALUES ('2504', '1', '228', '2017-05-17 10:56:02', '1');
INSERT INTO `visit_record` VALUES ('2505', '1', '226', '2017-05-17 11:02:15', '1');
INSERT INTO `visit_record` VALUES ('2506', '2', '228', '2017-05-17 11:18:49', '1');
INSERT INTO `visit_record` VALUES ('2507', '1', '228', '2017-05-17 11:27:06', '1');
INSERT INTO `visit_record` VALUES ('2508', '1', '228', '2017-05-17 11:27:15', '1');
INSERT INTO `visit_record` VALUES ('2509', '2', '228', '2017-05-17 11:30:50', '1');
INSERT INTO `visit_record` VALUES ('2510', '1', '228', '2017-05-17 11:30:59', '1');
INSERT INTO `visit_record` VALUES ('2511', '1', '226', '2017-05-17 11:41:35', '1');
INSERT INTO `visit_record` VALUES ('2512', '2', '228', '2017-05-17 11:49:49', '1');
INSERT INTO `visit_record` VALUES ('2513', '1', '228', '2017-05-17 11:50:03', '1');
INSERT INTO `visit_record` VALUES ('2514', '1', '226', '2017-05-17 11:55:40', '1');
INSERT INTO `visit_record` VALUES ('2515', '1', '228', '2017-05-17 12:14:36', '1');
INSERT INTO `visit_record` VALUES ('2516', '2', '228', '2017-05-17 12:15:00', '1');
INSERT INTO `visit_record` VALUES ('2517', '1', '226', '2017-05-17 12:15:07', '1');
INSERT INTO `visit_record` VALUES ('2518', '2', '226', '2017-05-17 12:15:40', '1');
INSERT INTO `visit_record` VALUES ('2519', '1', '228', '2017-05-17 12:15:51', '1');
INSERT INTO `visit_record` VALUES ('2520', '1', '228', '2017-05-17 12:41:35', '1');
INSERT INTO `visit_record` VALUES ('2521', '1', '226', '2017-05-17 12:44:19', '1');
INSERT INTO `visit_record` VALUES ('2522', '1', '226', '2017-05-17 13:39:43', '1');
INSERT INTO `visit_record` VALUES ('2523', '1', '226', '2017-05-17 13:43:01', '1');
INSERT INTO `visit_record` VALUES ('2524', '1', '226', '2017-05-17 13:47:04', '1');
INSERT INTO `visit_record` VALUES ('2525', '1', '226', '2017-05-17 13:45:34', '1');
INSERT INTO `visit_record` VALUES ('2526', '1', '226', '2017-05-17 13:48:13', '1');
INSERT INTO `visit_record` VALUES ('2527', '1', '228', '2017-05-17 13:59:01', '1');
INSERT INTO `visit_record` VALUES ('2528', '1', '226', '2017-05-17 14:05:25', '1');
INSERT INTO `visit_record` VALUES ('2529', '1', '226', '2017-05-17 14:20:21', '1');
INSERT INTO `visit_record` VALUES ('2530', '1', '226', '2017-05-17 14:20:38', '1');
INSERT INTO `visit_record` VALUES ('2531', '1', '228', '2017-05-17 14:31:29', '1');
INSERT INTO `visit_record` VALUES ('2532', '1', '226', '2017-05-17 14:35:40', '1');
INSERT INTO `visit_record` VALUES ('2533', '1', '226', '2017-05-17 14:44:04', '1');
INSERT INTO `visit_record` VALUES ('2534', '1', '226', '2017-05-17 14:59:09', '1');
INSERT INTO `visit_record` VALUES ('2535', '1', '226', '2017-05-17 15:14:40', '1');
INSERT INTO `visit_record` VALUES ('2536', '1', '226', '2017-05-17 15:14:58', '1');
INSERT INTO `visit_record` VALUES ('2537', '1', '226', '2017-05-17 15:39:47', '1');
INSERT INTO `visit_record` VALUES ('2538', '1', '226', '2017-05-17 15:46:29', '1');
INSERT INTO `visit_record` VALUES ('2539', '1', '226', '2017-05-17 15:49:39', '1');
INSERT INTO `visit_record` VALUES ('2540', '2', '226', '2017-05-17 15:54:43', '1');
INSERT INTO `visit_record` VALUES ('2541', '1', '228', '2017-05-17 15:55:03', '1');
INSERT INTO `visit_record` VALUES ('2542', '1', '226', '2017-05-17 16:00:10', '1');
INSERT INTO `visit_record` VALUES ('2543', '2', '226', '2017-05-17 16:00:32', '1');
INSERT INTO `visit_record` VALUES ('2544', '1', '228', '2017-05-17 16:00:38', '1');
INSERT INTO `visit_record` VALUES ('2545', '2', '228', '2017-05-17 16:05:38', '1');
INSERT INTO `visit_record` VALUES ('2546', '1', '228', '2017-05-17 16:05:46', '1');
INSERT INTO `visit_record` VALUES ('2547', '1', '228', '2017-05-17 16:23:37', '1');
INSERT INTO `visit_record` VALUES ('2548', '2', '228', '2017-05-17 16:24:51', '1');
INSERT INTO `visit_record` VALUES ('2549', '1', '228', '2017-05-17 16:24:57', '1');
INSERT INTO `visit_record` VALUES ('2550', '1', '226', '2017-05-17 16:22:36', '1');
INSERT INTO `visit_record` VALUES ('2551', '1', '228', '2017-05-17 16:38:56', '1');
INSERT INTO `visit_record` VALUES ('2552', '1', '226', '2017-05-17 16:42:55', '1');
INSERT INTO `visit_record` VALUES ('2553', '1', '226', '2017-05-17 16:42:56', '1');
INSERT INTO `visit_record` VALUES ('2554', '1', '226', '2017-05-17 16:50:14', '1');
INSERT INTO `visit_record` VALUES ('2555', '1', '226', '2017-05-17 17:07:50', '1');
INSERT INTO `visit_record` VALUES ('2556', '1', '226', '2017-05-17 17:15:49', '1');
INSERT INTO `visit_record` VALUES ('2557', '1', '228', '2017-05-17 17:41:05', '1');
INSERT INTO `visit_record` VALUES ('2558', '2', '228', '2017-05-17 17:44:51', '1');
INSERT INTO `visit_record` VALUES ('2559', '1', '228', '2017-05-17 17:44:59', '1');
INSERT INTO `visit_record` VALUES ('2560', '2', '228', '2017-05-17 17:46:55', '1');
INSERT INTO `visit_record` VALUES ('2561', '1', '226', '2017-05-17 17:47:31', '1');
INSERT INTO `visit_record` VALUES ('2562', '1', '226', '2017-05-17 17:53:36', '1');
INSERT INTO `visit_record` VALUES ('2563', '1', '228', '2017-05-17 17:55:21', '1');
INSERT INTO `visit_record` VALUES ('2564', '1', '226', '2017-05-18 09:19:00', '1');
INSERT INTO `visit_record` VALUES ('2565', '1', '226', '2017-05-18 09:27:24', '1');
INSERT INTO `visit_record` VALUES ('2566', '1', '226', '2017-05-18 09:27:25', '1');
INSERT INTO `visit_record` VALUES ('2567', '1', '226', '2017-05-18 09:37:23', '1');
INSERT INTO `visit_record` VALUES ('2568', '1', '226', '2017-05-18 09:35:16', '1');
INSERT INTO `visit_record` VALUES ('2569', '1', '226', '2017-05-18 09:35:16', '1');
INSERT INTO `visit_record` VALUES ('2570', '1', '226', '2017-05-18 09:35:16', '1');
INSERT INTO `visit_record` VALUES ('2571', '1', '226', '2017-05-18 09:35:16', '1');
INSERT INTO `visit_record` VALUES ('2572', '1', '226', '2017-05-18 09:35:18', '1');
INSERT INTO `visit_record` VALUES ('2573', '1', '226', '2017-05-18 09:35:18', '1');
INSERT INTO `visit_record` VALUES ('2574', '1', '226', '2017-05-18 09:35:18', '1');
INSERT INTO `visit_record` VALUES ('2575', '1', '226', '2017-05-18 09:35:18', '1');
INSERT INTO `visit_record` VALUES ('2576', '1', '226', '2017-05-18 09:35:19', '1');
INSERT INTO `visit_record` VALUES ('2577', '1', '226', '2017-05-18 09:35:19', '1');
INSERT INTO `visit_record` VALUES ('2578', '1', '226', '2017-05-18 09:35:19', '1');
INSERT INTO `visit_record` VALUES ('2579', '1', '226', '2017-05-18 09:35:19', '1');
INSERT INTO `visit_record` VALUES ('2580', '1', '226', '2017-05-18 09:35:19', '1');
INSERT INTO `visit_record` VALUES ('2581', '1', '226', '2017-05-18 09:35:19', '1');
INSERT INTO `visit_record` VALUES ('2582', '1', '226', '2017-05-18 09:35:19', '1');
INSERT INTO `visit_record` VALUES ('2583', '1', '226', '2017-05-18 09:35:20', '1');
INSERT INTO `visit_record` VALUES ('2584', '1', '226', '2017-05-18 09:35:20', '1');
INSERT INTO `visit_record` VALUES ('2585', '1', '226', '2017-05-18 09:35:19', '1');
INSERT INTO `visit_record` VALUES ('2586', '1', '226', '2017-05-18 09:35:20', '1');
INSERT INTO `visit_record` VALUES ('2587', '1', '226', '2017-05-18 09:35:20', '1');
INSERT INTO `visit_record` VALUES ('2588', '1', '226', '2017-05-18 09:35:20', '1');
INSERT INTO `visit_record` VALUES ('2589', '1', '226', '2017-05-18 09:35:20', '1');
INSERT INTO `visit_record` VALUES ('2590', '1', '226', '2017-05-18 09:35:20', '1');
INSERT INTO `visit_record` VALUES ('2591', '1', '226', '2017-05-18 09:35:20', '1');
INSERT INTO `visit_record` VALUES ('2592', '1', '226', '2017-05-18 09:35:20', '1');
INSERT INTO `visit_record` VALUES ('2593', '1', '226', '2017-05-18 09:47:43', '1');
INSERT INTO `visit_record` VALUES ('2594', '1', '226', '2017-05-18 09:52:47', '1');
INSERT INTO `visit_record` VALUES ('2595', '1', '226', '2017-05-18 09:52:48', '1');
INSERT INTO `visit_record` VALUES ('2596', '1', '226', '2017-05-18 09:52:48', '1');
INSERT INTO `visit_record` VALUES ('2597', '1', '226', '2017-05-18 09:59:58', '1');
INSERT INTO `visit_record` VALUES ('2598', '2', '226', '2017-05-18 10:09:55', '1');
INSERT INTO `visit_record` VALUES ('2599', '1', '228', '2017-05-18 10:10:08', '1');
INSERT INTO `visit_record` VALUES ('2600', '2', '228', '2017-05-18 10:11:10', '1');
INSERT INTO `visit_record` VALUES ('2601', '1', '226', '2017-05-18 10:11:17', '1');
INSERT INTO `visit_record` VALUES ('2602', '1', '226', '2017-05-18 10:08:08', '1');
INSERT INTO `visit_record` VALUES ('2603', '1', '226', '2017-05-18 10:22:48', '1');
INSERT INTO `visit_record` VALUES ('2604', '2', '226', '2017-05-18 10:23:16', '1');
INSERT INTO `visit_record` VALUES ('2605', '1', '226', '2017-05-18 10:24:22', '1');
INSERT INTO `visit_record` VALUES ('2606', '1', '226', '2017-05-18 10:24:23', '1');
INSERT INTO `visit_record` VALUES ('2607', '2', '226', '2017-05-18 10:24:34', '1');
INSERT INTO `visit_record` VALUES ('2608', '1', '228', '2017-05-18 10:24:42', '1');
INSERT INTO `visit_record` VALUES ('2609', '1', '226', '2017-05-18 10:29:53', '1');
INSERT INTO `visit_record` VALUES ('2610', '2', '228', '2017-05-18 10:36:08', '1');
INSERT INTO `visit_record` VALUES ('2611', '1', '226', '2017-05-18 10:36:21', '1');
INSERT INTO `visit_record` VALUES ('2612', '2', '226', '2017-05-18 10:36:44', '1');
INSERT INTO `visit_record` VALUES ('2613', '1', '228', '2017-05-18 10:36:59', '1');
INSERT INTO `visit_record` VALUES ('2614', '1', '226', '2017-05-18 10:41:13', '1');
INSERT INTO `visit_record` VALUES ('2615', '2', '228', '2017-05-18 10:39:05', '1');
INSERT INTO `visit_record` VALUES ('2616', '1', '228', '2017-05-18 10:39:15', '1');
INSERT INTO `visit_record` VALUES ('2617', '1', '226', '2017-05-18 10:49:36', '1');
INSERT INTO `visit_record` VALUES ('2618', '1', '226', '2017-05-18 10:49:37', '1');
INSERT INTO `visit_record` VALUES ('2619', '2', '226', '2017-05-18 10:49:40', '1');
INSERT INTO `visit_record` VALUES ('2620', '1', '226', '2017-05-18 10:49:46', '1');
INSERT INTO `visit_record` VALUES ('2621', '2', '226', '2017-05-18 10:49:49', '1');
INSERT INTO `visit_record` VALUES ('2622', '1', '226', '2017-05-18 10:49:52', '1');
INSERT INTO `visit_record` VALUES ('2623', '1', '226', '2017-05-18 10:49:54', '1');
INSERT INTO `visit_record` VALUES ('2624', '1', '226', '2017-05-18 11:03:21', '1');
INSERT INTO `visit_record` VALUES ('2625', '2', '228', '2017-05-18 11:05:10', '1');
INSERT INTO `visit_record` VALUES ('2626', '1', '226', '2017-05-18 11:05:17', '1');
INSERT INTO `visit_record` VALUES ('2627', '2', '226', '2017-05-18 11:06:46', '1');
INSERT INTO `visit_record` VALUES ('2628', '1', '228', '2017-05-18 11:06:55', '1');
INSERT INTO `visit_record` VALUES ('2629', '2', '228', '2017-05-18 11:12:40', '1');
INSERT INTO `visit_record` VALUES ('2630', '1', '226', '2017-05-18 11:12:46', '1');
INSERT INTO `visit_record` VALUES ('2631', '1', '226', '2017-05-18 11:22:25', '1');
INSERT INTO `visit_record` VALUES ('2632', '1', '226', '2017-05-18 11:19:40', '1');
INSERT INTO `visit_record` VALUES ('2633', '1', '226', '2017-05-18 11:34:01', '1');
INSERT INTO `visit_record` VALUES ('2634', '2', '226', '2017-05-18 11:31:15', '1');
INSERT INTO `visit_record` VALUES ('2635', '2', '226', '2017-05-18 11:34:34', '1');
INSERT INTO `visit_record` VALUES ('2636', '1', '228', '2017-05-18 11:31:25', '1');
INSERT INTO `visit_record` VALUES ('2637', '2', '226', '2017-05-18 11:32:52', '1');
INSERT INTO `visit_record` VALUES ('2638', '1', '228', '2017-05-18 11:33:02', '1');
INSERT INTO `visit_record` VALUES ('2639', '2', '228', '2017-05-18 11:33:29', '1');
INSERT INTO `visit_record` VALUES ('2640', '1', '228', '2017-05-18 11:33:40', '1');
INSERT INTO `visit_record` VALUES ('2641', '2', '228', '2017-05-18 11:36:53', '1');
INSERT INTO `visit_record` VALUES ('2642', '1', '226', '2017-05-18 11:37:04', '1');
INSERT INTO `visit_record` VALUES ('2643', '1', '228', '2017-05-18 11:38:06', '1');
INSERT INTO `visit_record` VALUES ('2644', '1', '228', '2017-05-18 11:44:34', '1');
INSERT INTO `visit_record` VALUES ('2645', '2', '228', '2017-05-18 11:45:00', '1');
INSERT INTO `visit_record` VALUES ('2646', '1', '226', '2017-05-18 11:45:06', '1');
INSERT INTO `visit_record` VALUES ('2647', '2', '226', '2017-05-18 11:46:11', '1');
INSERT INTO `visit_record` VALUES ('2648', '1', '228', '2017-05-18 11:46:19', '1');
INSERT INTO `visit_record` VALUES ('2649', '1', '226', '2017-05-18 11:54:11', '1');
INSERT INTO `visit_record` VALUES ('2650', '2', '228', '2017-05-18 11:52:40', '1');
INSERT INTO `visit_record` VALUES ('2651', '1', '226', '2017-05-18 11:52:47', '1');
INSERT INTO `visit_record` VALUES ('2652', '2', '226', '2017-05-18 11:56:19', '1');
INSERT INTO `visit_record` VALUES ('2653', '1', '226', '2017-05-18 11:58:27', '1');
INSERT INTO `visit_record` VALUES ('2654', '1', '226', '2017-05-18 11:55:58', '1');
INSERT INTO `visit_record` VALUES ('2655', '2', '226', '2017-05-18 11:58:01', '1');
INSERT INTO `visit_record` VALUES ('2656', '1', '228', '2017-05-18 11:58:08', '1');
INSERT INTO `visit_record` VALUES ('2657', '2', '226', '2017-05-18 12:07:54', '1');
INSERT INTO `visit_record` VALUES ('2658', '1', '228', '2017-05-18 12:08:02', '1');
INSERT INTO `visit_record` VALUES ('2659', '2', '228', '2017-05-18 12:09:26', '1');
INSERT INTO `visit_record` VALUES ('2660', '1', '226', '2017-05-18 12:09:32', '1');
INSERT INTO `visit_record` VALUES ('2661', '2', '226', '2017-05-18 12:10:47', '1');
INSERT INTO `visit_record` VALUES ('2662', '1', '228', '2017-05-18 12:10:53', '1');
INSERT INTO `visit_record` VALUES ('2663', '2', '228', '2017-05-18 12:11:04', '1');
INSERT INTO `visit_record` VALUES ('2664', '1', '226', '2017-05-18 12:11:10', '1');
INSERT INTO `visit_record` VALUES ('2665', '2', '226', '2017-05-18 12:19:12', '1');
INSERT INTO `visit_record` VALUES ('2666', '1', '228', '2017-05-18 12:19:20', '1');
INSERT INTO `visit_record` VALUES ('2667', '2', '228', '2017-05-18 12:23:46', '1');
INSERT INTO `visit_record` VALUES ('2668', '1', '226', '2017-05-18 12:23:53', '1');
INSERT INTO `visit_record` VALUES ('2669', '2', '226', '2017-05-18 13:26:54', '1');
INSERT INTO `visit_record` VALUES ('2670', '1', '228', '2017-05-18 13:27:05', '1');
INSERT INTO `visit_record` VALUES ('2671', '1', '228', '2017-05-18 13:38:30', '1');
INSERT INTO `visit_record` VALUES ('2672', '1', '228', '2017-05-18 13:41:09', '1');
INSERT INTO `visit_record` VALUES ('2673', '2', '228', '2017-05-18 13:48:25', '1');
INSERT INTO `visit_record` VALUES ('2674', '1', '228', '2017-05-18 13:48:48', '1');
INSERT INTO `visit_record` VALUES ('2675', '1', '228', '2017-05-18 13:54:05', '1');
INSERT INTO `visit_record` VALUES ('2676', '1', '228', '2017-05-18 13:58:52', '1');
INSERT INTO `visit_record` VALUES ('2677', '1', '228', '2017-05-18 14:04:19', '1');
INSERT INTO `visit_record` VALUES ('2678', '2', '228', '2017-05-18 14:27:50', '1');
INSERT INTO `visit_record` VALUES ('2679', '1', '226', '2017-05-18 14:27:59', '1');
INSERT INTO `visit_record` VALUES ('2680', '2', '226', '2017-05-18 14:28:16', '1');
INSERT INTO `visit_record` VALUES ('2681', '1', '228', '2017-05-18 14:28:30', '1');
INSERT INTO `visit_record` VALUES ('2682', '2', '228', '2017-05-18 14:38:51', '1');
INSERT INTO `visit_record` VALUES ('2683', '1', '226', '2017-05-18 14:38:59', '1');
INSERT INTO `visit_record` VALUES ('2684', '2', '226', '2017-05-18 14:39:18', '1');
INSERT INTO `visit_record` VALUES ('2685', '1', '228', '2017-05-18 14:39:26', '1');
INSERT INTO `visit_record` VALUES ('2686', '2', '228', '2017-05-18 15:07:09', '1');
INSERT INTO `visit_record` VALUES ('2687', '1', '226', '2017-05-18 15:07:16', '1');
INSERT INTO `visit_record` VALUES ('2688', '2', '226', '2017-05-18 15:09:20', '1');
INSERT INTO `visit_record` VALUES ('2689', '1', '228', '2017-05-18 15:12:18', '1');
INSERT INTO `visit_record` VALUES ('2690', '2', '228', '2017-05-18 15:12:25', '1');
INSERT INTO `visit_record` VALUES ('2691', '1', '228', '2017-05-18 15:14:36', '1');
INSERT INTO `visit_record` VALUES ('2692', '2', '228', '2017-05-18 15:14:44', '1');
INSERT INTO `visit_record` VALUES ('2693', '1', '228', '2017-05-18 15:16:50', '1');
INSERT INTO `visit_record` VALUES ('2694', '2', '228', '2017-05-18 15:21:08', '1');
INSERT INTO `visit_record` VALUES ('2695', '1', '226', '2017-05-18 17:16:11', '1');
INSERT INTO `visit_record` VALUES ('2696', '2', '226', '2017-05-18 17:25:37', '1');
INSERT INTO `visit_record` VALUES ('2697', '1', '228', '2017-05-18 17:25:48', '1');
INSERT INTO `visit_record` VALUES ('2698', '1', '226', '2017-05-18 17:39:40', '1');
INSERT INTO `visit_record` VALUES ('2699', '1', '228', '2017-05-18 17:44:14', '1');
INSERT INTO `visit_record` VALUES ('2700', '2', '228', '2017-05-18 17:46:22', '1');
INSERT INTO `visit_record` VALUES ('2701', '1', '228', '2017-05-19 09:51:40', '1');
INSERT INTO `visit_record` VALUES ('2702', '1', '226', '2017-05-19 09:56:35', '1');
INSERT INTO `visit_record` VALUES ('2703', '1', '226', '2017-05-19 12:06:39', '1');
INSERT INTO `visit_record` VALUES ('2704', '1', '226', '2017-05-19 14:13:09', '1');
INSERT INTO `visit_record` VALUES ('2705', '1', '226', '2017-05-19 14:15:59', '1');
INSERT INTO `visit_record` VALUES ('2706', '1', '226', '2017-05-19 15:35:56', '1');
INSERT INTO `visit_record` VALUES ('2707', '1', '226', '2017-05-19 15:37:47', '1');
INSERT INTO `visit_record` VALUES ('2708', '1', '226', '2017-05-19 15:40:53', '1');
INSERT INTO `visit_record` VALUES ('2709', '2', '226', '2017-05-19 15:42:24', '1');
INSERT INTO `visit_record` VALUES ('2710', '1', '226', '2017-05-19 15:42:40', '1');
INSERT INTO `visit_record` VALUES ('2711', '1', '226', '2017-05-19 15:48:53', '1');
INSERT INTO `visit_record` VALUES ('2712', '1', '226', '2017-05-19 16:12:15', '1');
INSERT INTO `visit_record` VALUES ('2713', '1', '226', '2017-05-19 16:16:30', '1');
INSERT INTO `visit_record` VALUES ('2714', '1', '226', '2017-05-19 16:20:16', '1');
INSERT INTO `visit_record` VALUES ('2715', '2', '226', '2017-05-19 16:32:55', '1');
INSERT INTO `visit_record` VALUES ('2716', '1', '226', '2017-05-19 16:33:13', '1');
INSERT INTO `visit_record` VALUES ('2717', '1', '226', '2017-05-19 16:48:37', '1');
INSERT INTO `visit_record` VALUES ('2718', '1', '228', '2017-05-22 09:32:09', '1');
INSERT INTO `visit_record` VALUES ('2719', '1', '226', '2017-05-22 09:32:18', '1');
INSERT INTO `visit_record` VALUES ('2720', '2', '228', '2017-05-22 09:48:50', '1');
INSERT INTO `visit_record` VALUES ('2721', '1', '226', '2017-05-22 09:48:57', '1');
INSERT INTO `visit_record` VALUES ('2722', '2', '226', '2017-05-22 10:01:00', '1');
INSERT INTO `visit_record` VALUES ('2723', '1', '228', '2017-05-22 10:01:13', '1');
INSERT INTO `visit_record` VALUES ('2724', '1', '226', '2017-05-22 10:15:24', '1');
INSERT INTO `visit_record` VALUES ('2725', '2', '226', '2017-05-22 10:15:32', '1');
INSERT INTO `visit_record` VALUES ('2726', '1', '228', '2017-05-22 10:15:38', '1');
INSERT INTO `visit_record` VALUES ('2727', '2', '228', '2017-05-22 10:17:40', '1');
INSERT INTO `visit_record` VALUES ('2728', '1', '226', '2017-05-22 10:17:47', '1');
INSERT INTO `visit_record` VALUES ('2729', '2', '226', '2017-05-22 10:25:38', '1');
INSERT INTO `visit_record` VALUES ('2730', '1', '228', '2017-05-22 10:26:42', '1');
INSERT INTO `visit_record` VALUES ('2731', '2', '228', '2017-05-22 10:34:01', '1');
INSERT INTO `visit_record` VALUES ('2732', '1', '226', '2017-05-22 10:34:08', '1');
INSERT INTO `visit_record` VALUES ('2733', '2', '226', '2017-05-22 10:35:31', '1');
INSERT INTO `visit_record` VALUES ('2734', '1', '228', '2017-05-22 10:35:40', '1');
INSERT INTO `visit_record` VALUES ('2735', '1', '226', '2017-05-22 10:37:39', '1');
INSERT INTO `visit_record` VALUES ('2736', '2', '228', '2017-05-22 11:53:09', '1');
INSERT INTO `visit_record` VALUES ('2737', '1', '226', '2017-05-22 11:53:18', '1');
INSERT INTO `visit_record` VALUES ('2738', '2', '226', '2017-05-22 11:55:17', '1');
INSERT INTO `visit_record` VALUES ('2739', '1', '228', '2017-05-22 11:55:24', '1');
INSERT INTO `visit_record` VALUES ('2740', '1', '226', '2017-05-22 15:24:04', '1');
INSERT INTO `visit_record` VALUES ('2741', '1', '226', '2017-05-22 15:42:57', '1');
INSERT INTO `visit_record` VALUES ('2742', '2', '226', '2017-05-22 15:44:27', '1');
INSERT INTO `visit_record` VALUES ('2743', '1', '250', '2017-05-22 15:44:38', '1');
INSERT INTO `visit_record` VALUES ('2744', '2', '250', '2017-05-22 15:45:48', '1');
INSERT INTO `visit_record` VALUES ('2745', '1', '235', '2017-05-22 15:46:10', '1');
INSERT INTO `visit_record` VALUES ('2746', '2', '235', '2017-05-22 15:49:47', '1');
INSERT INTO `visit_record` VALUES ('2747', '1', '226', '2017-05-22 15:49:48', '1');
INSERT INTO `visit_record` VALUES ('2748', '1', '226', '2017-05-22 16:11:52', '1');
INSERT INTO `visit_record` VALUES ('2749', '1', '226', '2017-05-22 16:17:59', '1');
INSERT INTO `visit_record` VALUES ('2750', '1', '226', '2017-05-22 16:23:50', '1');
INSERT INTO `visit_record` VALUES ('2751', '1', '226', '2017-05-22 16:23:50', '1');
INSERT INTO `visit_record` VALUES ('2752', '2', '226', '2017-05-22 16:27:00', '1');
INSERT INTO `visit_record` VALUES ('2753', '1', '226', '2017-05-22 16:27:11', '1');
INSERT INTO `visit_record` VALUES ('2754', '2', '226', '2017-05-22 16:28:27', '1');
INSERT INTO `visit_record` VALUES ('2755', '1', '226', '2017-05-22 16:28:40', '1');
INSERT INTO `visit_record` VALUES ('2756', '2', '226', '2017-05-22 16:26:33', '1');
INSERT INTO `visit_record` VALUES ('2757', '1', '226', '2017-05-22 16:26:36', '1');
INSERT INTO `visit_record` VALUES ('2758', '2', '226', '2017-05-22 16:28:47', '1');
INSERT INTO `visit_record` VALUES ('2759', '1', '228', '2017-05-22 16:28:56', '1');
INSERT INTO `visit_record` VALUES ('2760', '2', '226', '2017-05-22 16:30:31', '1');
INSERT INTO `visit_record` VALUES ('2761', '1', '235', '2017-05-22 16:30:42', '1');
INSERT INTO `visit_record` VALUES ('2762', '2', '235', '2017-05-22 16:31:23', '1');
INSERT INTO `visit_record` VALUES ('2763', '1', '236', '2017-05-22 16:31:29', '1');
INSERT INTO `visit_record` VALUES ('2764', '1', '226', '2017-05-22 16:31:07', '1');
INSERT INTO `visit_record` VALUES ('2765', '2', '236', '2017-05-22 16:32:32', '1');
INSERT INTO `visit_record` VALUES ('2766', '1', '226', '2017-05-22 16:32:37', '1');
INSERT INTO `visit_record` VALUES ('2767', '1', '226', '2017-05-22 16:34:11', '1');
INSERT INTO `visit_record` VALUES ('2768', '2', '226', '2017-05-22 16:41:49', '1');
INSERT INTO `visit_record` VALUES ('2769', '1', '228', '2017-05-22 16:41:57', '1');
INSERT INTO `visit_record` VALUES ('2770', '1', '226', '2017-05-22 16:43:24', '1');
INSERT INTO `visit_record` VALUES ('2771', '1', '228', '2017-05-22 16:58:02', '1');
INSERT INTO `visit_record` VALUES ('2772', '1', '228', '2017-05-22 17:05:40', '1');
INSERT INTO `visit_record` VALUES ('2773', '1', '226', '2017-05-22 17:15:10', '1');
INSERT INTO `visit_record` VALUES ('2774', '2', '226', '2017-05-22 17:19:02', '1');
INSERT INTO `visit_record` VALUES ('2775', '1', '226', '2017-05-22 17:16:30', '1');
INSERT INTO `visit_record` VALUES ('2776', '1', '226', '2017-05-22 17:19:37', '1');
INSERT INTO `visit_record` VALUES ('2777', '2', '226', '2017-05-22 17:33:09', '1');
INSERT INTO `visit_record` VALUES ('2778', '1', '226', '2017-05-22 17:33:40', '1');
INSERT INTO `visit_record` VALUES ('2779', '2', '226', '2017-05-22 17:50:56', '1');
INSERT INTO `visit_record` VALUES ('2780', '1', '235', '2017-05-22 17:51:01', '1');
INSERT INTO `visit_record` VALUES ('2781', '2', '235', '2017-05-22 17:51:25', '1');
INSERT INTO `visit_record` VALUES ('2782', '1', '226', '2017-05-22 17:51:42', '1');
INSERT INTO `visit_record` VALUES ('2783', '2', '226', '2017-05-22 17:53:53', '1');
INSERT INTO `visit_record` VALUES ('2784', '1', '228', '2017-05-22 17:53:58', '1');
INSERT INTO `visit_record` VALUES ('2785', '1', '228', '2017-05-22 18:21:42', '1');
INSERT INTO `visit_record` VALUES ('2786', '1', '228', '2017-05-22 18:21:44', '1');
INSERT INTO `visit_record` VALUES ('2787', '1', '228', '2017-05-23 09:02:12', '1');
INSERT INTO `visit_record` VALUES ('2788', '1', '228', '2017-05-23 09:02:13', '1');
INSERT INTO `visit_record` VALUES ('2789', '2', '228', '2017-05-23 09:07:25', '1');
INSERT INTO `visit_record` VALUES ('2790', '1', '226', '2017-05-23 09:07:32', '1');
INSERT INTO `visit_record` VALUES ('2791', '2', '226', '2017-05-23 09:08:29', '1');
INSERT INTO `visit_record` VALUES ('2792', '1', '228', '2017-05-23 09:08:36', '1');
INSERT INTO `visit_record` VALUES ('2793', '2', '228', '2017-05-23 09:09:09', '1');
INSERT INTO `visit_record` VALUES ('2794', '1', '226', '2017-05-23 09:09:13', '1');
INSERT INTO `visit_record` VALUES ('2795', '2', '226', '2017-05-23 09:09:22', '1');
INSERT INTO `visit_record` VALUES ('2796', '1', '226', '2017-05-23 09:09:25', '1');
INSERT INTO `visit_record` VALUES ('2797', '2', '226', '2017-05-23 09:09:37', '1');
INSERT INTO `visit_record` VALUES ('2798', '1', '228', '2017-05-23 09:09:41', '1');
INSERT INTO `visit_record` VALUES ('2799', '1', '226', '2017-05-23 09:15:23', '1');
INSERT INTO `visit_record` VALUES ('2800', '1', '226', '2017-05-23 09:22:01', '1');
INSERT INTO `visit_record` VALUES ('2801', '1', '226', '2017-05-23 09:22:54', '1');
INSERT INTO `visit_record` VALUES ('2802', '1', '226', '2017-05-23 09:26:57', '1');
INSERT INTO `visit_record` VALUES ('2803', '2', '228', '2017-05-23 09:36:50', '1');
INSERT INTO `visit_record` VALUES ('2804', '1', '226', '2017-05-23 09:36:57', '1');
INSERT INTO `visit_record` VALUES ('2805', '2', '226', '2017-05-23 09:38:40', '1');
INSERT INTO `visit_record` VALUES ('2806', '1', '228', '2017-05-23 09:38:47', '1');
INSERT INTO `visit_record` VALUES ('2807', '1', '228', '2017-05-23 09:58:03', '1');
INSERT INTO `visit_record` VALUES ('2808', '1', '226', '2017-05-23 10:01:21', '1');
INSERT INTO `visit_record` VALUES ('2809', '1', '226', '2017-05-23 10:32:41', '1');
INSERT INTO `visit_record` VALUES ('2810', '1', '226', '2017-05-23 10:39:38', '1');
INSERT INTO `visit_record` VALUES ('2811', '2', '226', '2017-05-23 10:45:18', '1');
INSERT INTO `visit_record` VALUES ('2812', '1', '226', '2017-05-23 10:45:36', '1');
INSERT INTO `visit_record` VALUES ('2813', '1', '226', '2017-05-23 10:43:15', '1');
INSERT INTO `visit_record` VALUES ('2814', '1', '226', '2017-05-23 10:46:20', '1');
INSERT INTO `visit_record` VALUES ('2815', '2', '226', '2017-05-23 10:55:07', '1');
INSERT INTO `visit_record` VALUES ('2816', '1', '226', '2017-05-23 10:55:22', '1');
INSERT INTO `visit_record` VALUES ('2817', '2', '226', '2017-05-23 10:56:50', '1');
INSERT INTO `visit_record` VALUES ('2818', '1', '226', '2017-05-23 10:57:13', '1');
INSERT INTO `visit_record` VALUES ('2819', '1', '226', '2017-05-23 11:01:37', '1');
INSERT INTO `visit_record` VALUES ('2820', '2', '226', '2017-05-23 11:08:56', '1');
INSERT INTO `visit_record` VALUES ('2821', '1', '226', '2017-05-23 11:09:12', '1');
INSERT INTO `visit_record` VALUES ('2822', '1', '226', '2017-05-23 11:10:24', '1');
INSERT INTO `visit_record` VALUES ('2823', '1', '226', '2017-05-23 11:11:53', '1');
INSERT INTO `visit_record` VALUES ('2824', '1', '235', '2017-05-23 11:15:31', '1');
INSERT INTO `visit_record` VALUES ('2825', '1', '228', '2017-05-23 11:15:41', '1');
INSERT INTO `visit_record` VALUES ('2826', '2', '235', '2017-05-23 11:16:25', '1');
INSERT INTO `visit_record` VALUES ('2827', '1', '226', '2017-05-23 11:16:35', '1');
INSERT INTO `visit_record` VALUES ('2828', '1', '252', '2017-05-23 11:20:13', '1');
INSERT INTO `visit_record` VALUES ('2829', '2', '252', '2017-05-23 11:23:46', '1');
INSERT INTO `visit_record` VALUES ('2830', '1', '252', '2017-05-23 11:23:53', '1');
INSERT INTO `visit_record` VALUES ('2831', '1', '245', '2017-05-23 11:25:54', '1');
INSERT INTO `visit_record` VALUES ('2832', '1', '252', '2017-05-23 11:34:46', '1');
INSERT INTO `visit_record` VALUES ('2833', '2', '245', '2017-05-23 11:39:12', '1');
INSERT INTO `visit_record` VALUES ('2834', '1', '226', '2017-05-23 11:38:31', '1');
INSERT INTO `visit_record` VALUES ('2835', '1', '226', '2017-05-23 11:39:24', '1');
INSERT INTO `visit_record` VALUES ('2836', '2', '226', '2017-05-23 11:41:02', '1');
INSERT INTO `visit_record` VALUES ('2837', '1', '245', '2017-05-23 11:41:19', '1');
INSERT INTO `visit_record` VALUES ('2838', '2', '245', '2017-05-23 11:43:58', '1');
INSERT INTO `visit_record` VALUES ('2839', '1', '226', '2017-05-23 11:44:06', '1');
INSERT INTO `visit_record` VALUES ('2840', '2', '226', '2017-05-23 11:55:06', '1');
INSERT INTO `visit_record` VALUES ('2841', '1', '245', '2017-05-23 11:55:23', '1');
INSERT INTO `visit_record` VALUES ('2842', '1', '226', '2017-05-23 11:56:07', '1');
INSERT INTO `visit_record` VALUES ('2843', '1', '226', '2017-05-23 12:03:05', '1');
INSERT INTO `visit_record` VALUES ('2844', '1', '226', '2017-05-23 13:34:20', '1');
INSERT INTO `visit_record` VALUES ('2845', '1', '226', '2017-05-23 13:41:16', '1');
INSERT INTO `visit_record` VALUES ('2846', '1', '226', '2017-05-23 13:38:59', '1');
INSERT INTO `visit_record` VALUES ('2847', '1', '226', '2017-05-23 13:50:21', '1');
INSERT INTO `visit_record` VALUES ('2848', '1', '226', '2017-05-23 13:51:22', '1');
INSERT INTO `visit_record` VALUES ('2849', '1', '226', '2017-05-23 14:01:53', '1');
INSERT INTO `visit_record` VALUES ('2850', '1', '228', '2017-05-23 14:04:47', '1');
INSERT INTO `visit_record` VALUES ('2851', '1', '226', '2017-05-23 14:19:05', '1');
INSERT INTO `visit_record` VALUES ('2852', '1', '226', '2017-05-23 14:19:29', '1');
INSERT INTO `visit_record` VALUES ('2853', '1', '226', '2017-05-23 14:20:45', '1');
INSERT INTO `visit_record` VALUES ('2854', '2', '226', '2017-05-23 14:25:09', '1');
INSERT INTO `visit_record` VALUES ('2855', '1', '226', '2017-05-23 14:22:37', '1');
INSERT INTO `visit_record` VALUES ('2856', '1', '226', '2017-05-23 14:25:24', '1');
INSERT INTO `visit_record` VALUES ('2857', '1', '235', '2017-05-23 14:23:10', '1');
INSERT INTO `visit_record` VALUES ('2858', '1', '235', '2017-05-23 14:23:11', '1');
INSERT INTO `visit_record` VALUES ('2859', '1', '252', '2017-05-23 14:25:13', '1');
INSERT INTO `visit_record` VALUES ('2860', '1', '252', '2017-05-23 14:26:19', '1');
INSERT INTO `visit_record` VALUES ('2861', '2', '226', '2017-05-23 14:33:31', '1');
INSERT INTO `visit_record` VALUES ('2862', '1', '228', '2017-05-23 14:33:38', '1');
INSERT INTO `visit_record` VALUES ('2863', '2', '228', '2017-05-23 14:40:32', '1');
INSERT INTO `visit_record` VALUES ('2864', '1', '228', '2017-05-23 14:40:39', '1');
INSERT INTO `visit_record` VALUES ('2865', '1', '245', '2017-05-23 14:42:59', '1');
INSERT INTO `visit_record` VALUES ('2866', '2', '245', '2017-05-23 14:43:36', '1');
INSERT INTO `visit_record` VALUES ('2867', '1', '226', '2017-05-23 14:43:43', '1');
INSERT INTO `visit_record` VALUES ('2868', '2', '226', '2017-05-23 14:46:10', '1');
INSERT INTO `visit_record` VALUES ('2869', '1', '245', '2017-05-23 14:46:27', '1');
INSERT INTO `visit_record` VALUES ('2870', '1', '228', '2017-05-23 14:47:48', '1');
INSERT INTO `visit_record` VALUES ('2871', '1', '226', '2017-05-23 15:01:05', '1');
INSERT INTO `visit_record` VALUES ('2872', '2', '245', '2017-05-23 15:04:54', '1');
INSERT INTO `visit_record` VALUES ('2873', '1', '226', '2017-05-23 15:05:03', '1');
INSERT INTO `visit_record` VALUES ('2874', '2', '226', '2017-05-23 15:07:22', '1');
INSERT INTO `visit_record` VALUES ('2875', '1', '245', '2017-05-23 15:07:40', '1');
INSERT INTO `visit_record` VALUES ('2876', '2', '245', '2017-05-23 15:08:26', '1');
INSERT INTO `visit_record` VALUES ('2877', '1', '226', '2017-05-23 15:08:42', '1');
INSERT INTO `visit_record` VALUES ('2878', '1', '228', '2017-05-23 15:14:55', '1');
INSERT INTO `visit_record` VALUES ('2879', '1', '226', '2017-05-23 15:27:12', '1');
INSERT INTO `visit_record` VALUES ('2880', '1', '235', '2017-05-23 15:28:50', '1');
INSERT INTO `visit_record` VALUES ('2881', '2', '228', '2017-05-23 15:32:17', '1');
INSERT INTO `visit_record` VALUES ('2882', '1', '228', '2017-05-23 15:32:27', '1');
INSERT INTO `visit_record` VALUES ('2883', '2', '235', '2017-05-23 15:30:48', '1');
INSERT INTO `visit_record` VALUES ('2884', '1', '228', '2017-05-23 15:30:52', '1');
INSERT INTO `visit_record` VALUES ('2885', '2', '228', '2017-05-23 15:37:18', '1');
INSERT INTO `visit_record` VALUES ('2886', '1', '228', '2017-05-23 15:37:45', '1');
INSERT INTO `visit_record` VALUES ('2887', '1', '228', '2017-05-23 15:38:01', '1');
INSERT INTO `visit_record` VALUES ('2888', '1', '228', '2017-05-23 15:38:57', '1');
INSERT INTO `visit_record` VALUES ('2889', '2', '228', '2017-05-23 15:45:01', '1');
INSERT INTO `visit_record` VALUES ('2890', '1', '228', '2017-05-23 15:45:08', '1');
INSERT INTO `visit_record` VALUES ('2891', '2', '228', '2017-05-23 15:52:08', '1');
INSERT INTO `visit_record` VALUES ('2892', '1', '228', '2017-05-23 15:52:18', '1');
INSERT INTO `visit_record` VALUES ('2893', '2', '228', '2017-05-23 15:52:49', '1');
INSERT INTO `visit_record` VALUES ('2894', '2', '228', '2017-05-23 15:50:51', '1');
INSERT INTO `visit_record` VALUES ('2895', '1', '248', '2017-05-23 15:51:20', '1');
INSERT INTO `visit_record` VALUES ('2896', '1', '228', '2017-05-23 15:56:08', '1');
INSERT INTO `visit_record` VALUES ('2897', '1', '226', '2017-05-23 15:54:10', '1');
INSERT INTO `visit_record` VALUES ('2898', '1', '228', '2017-05-23 15:56:50', '1');
INSERT INTO `visit_record` VALUES ('2899', '1', '228', '2017-05-23 15:57:15', '1');
INSERT INTO `visit_record` VALUES ('2900', '1', '228', '2017-05-23 15:57:44', '1');
INSERT INTO `visit_record` VALUES ('2901', '2', '228', '2017-05-23 16:00:50', '1');
INSERT INTO `visit_record` VALUES ('2902', '1', '226', '2017-05-23 16:02:58', '1');
INSERT INTO `visit_record` VALUES ('2903', '2', '248', '2017-05-23 16:01:55', '1');
INSERT INTO `visit_record` VALUES ('2904', '1', '228', '2017-05-23 16:02:09', '1');
INSERT INTO `visit_record` VALUES ('2905', '2', '228', '2017-05-23 16:03:40', '1');
INSERT INTO `visit_record` VALUES ('2906', '1', '248', '2017-05-23 16:04:26', '1');
INSERT INTO `visit_record` VALUES ('2907', '1', '248', '2017-05-23 16:04:26', '1');
INSERT INTO `visit_record` VALUES ('2908', '1', '248', '2017-05-23 16:04:27', '1');
INSERT INTO `visit_record` VALUES ('2909', '1', '248', '2017-05-23 16:04:27', '1');
INSERT INTO `visit_record` VALUES ('2910', '1', '248', '2017-05-23 16:04:27', '1');
INSERT INTO `visit_record` VALUES ('2911', '1', '226', '2017-05-23 16:04:34', '1');
INSERT INTO `visit_record` VALUES ('2912', '2', '248', '2017-05-23 16:04:44', '1');
INSERT INTO `visit_record` VALUES ('2913', '1', '228', '2017-05-23 16:04:55', '1');
INSERT INTO `visit_record` VALUES ('2914', '1', '226', '2017-05-23 16:05:34', '1');
INSERT INTO `visit_record` VALUES ('2915', '2', '226', '2017-05-23 16:06:31', '1');
INSERT INTO `visit_record` VALUES ('2916', '1', '228', '2017-05-23 16:06:36', '1');
INSERT INTO `visit_record` VALUES ('2917', '1', '226', '2017-05-23 16:09:09', '1');
INSERT INTO `visit_record` VALUES ('2918', '1', '226', '2017-05-23 16:23:35', '1');
INSERT INTO `visit_record` VALUES ('2919', '2', '226', '2017-05-23 16:23:38', '1');
INSERT INTO `visit_record` VALUES ('2920', '2', '228', '2017-05-23 16:23:53', '1');
INSERT INTO `visit_record` VALUES ('2921', '1', '245', '2017-05-23 16:23:56', '1');
INSERT INTO `visit_record` VALUES ('2922', '1', '226', '2017-05-23 16:24:01', '1');
INSERT INTO `visit_record` VALUES ('2923', '1', '226', '2017-05-23 16:28:08', '1');
INSERT INTO `visit_record` VALUES ('2924', '2', '226', '2017-05-23 16:33:09', '1');
INSERT INTO `visit_record` VALUES ('2925', '1', '228', '2017-05-23 16:32:44', '1');
INSERT INTO `visit_record` VALUES ('2926', '2', '228', '2017-05-23 16:34:49', '1');
INSERT INTO `visit_record` VALUES ('2927', '1', '226', '2017-05-23 16:34:58', '1');
INSERT INTO `visit_record` VALUES ('2928', '1', '228', '2017-05-23 16:40:49', '1');
INSERT INTO `visit_record` VALUES ('2929', '2', '228', '2017-05-23 16:41:44', '1');
INSERT INTO `visit_record` VALUES ('2930', '1', '226', '2017-05-23 16:41:51', '1');
INSERT INTO `visit_record` VALUES ('2931', '2', '226', '2017-05-23 16:50:02', '1');
INSERT INTO `visit_record` VALUES ('2932', '1', '228', '2017-05-23 16:50:12', '1');
INSERT INTO `visit_record` VALUES ('2933', '1', '226', '2017-05-23 16:48:19', '1');
INSERT INTO `visit_record` VALUES ('2934', '2', '228', '2017-05-23 16:53:22', '1');
INSERT INTO `visit_record` VALUES ('2935', '1', '226', '2017-05-23 16:53:28', '1');
INSERT INTO `visit_record` VALUES ('2936', '1', '226', '2017-05-23 17:02:34', '1');
INSERT INTO `visit_record` VALUES ('2937', '2', '226', '2017-05-23 17:07:39', '1');
INSERT INTO `visit_record` VALUES ('2938', '1', '226', '2017-05-23 17:07:46', '1');
INSERT INTO `visit_record` VALUES ('2939', '1', '226', '2017-05-23 17:08:19', '1');
INSERT INTO `visit_record` VALUES ('2940', '1', '226', '2017-05-23 17:10:45', '1');
INSERT INTO `visit_record` VALUES ('2941', '1', '226', '2017-05-23 17:11:53', '1');
INSERT INTO `visit_record` VALUES ('2942', '1', '226', '2017-05-23 17:16:40', '1');
INSERT INTO `visit_record` VALUES ('2943', '1', '226', '2017-05-23 17:27:52', '1');
INSERT INTO `visit_record` VALUES ('2944', '1', '226', '2017-05-23 17:29:19', '1');
INSERT INTO `visit_record` VALUES ('2945', '2', '226', '2017-05-23 17:29:33', '1');
INSERT INTO `visit_record` VALUES ('2946', '1', '226', '2017-05-23 17:30:22', '1');
INSERT INTO `visit_record` VALUES ('2947', '2', '226', '2017-05-23 17:30:28', '1');
INSERT INTO `visit_record` VALUES ('2948', '1', '226', '2017-05-23 17:31:57', '1');
INSERT INTO `visit_record` VALUES ('2949', '2', '226', '2017-05-23 17:32:13', '1');
INSERT INTO `visit_record` VALUES ('2950', '1', '226', '2017-05-23 17:29:58', '1');
INSERT INTO `visit_record` VALUES ('2951', '1', '226', '2017-05-23 17:34:27', '1');
INSERT INTO `visit_record` VALUES ('2952', '2', '226', '2017-05-23 17:34:33', '1');
INSERT INTO `visit_record` VALUES ('2953', '1', '226', '2017-05-23 17:35:21', '1');
INSERT INTO `visit_record` VALUES ('2954', '2', '226', '2017-05-23 17:35:28', '1');
INSERT INTO `visit_record` VALUES ('2955', '1', '226', '2017-05-23 17:37:30', '1');
INSERT INTO `visit_record` VALUES ('2956', '2', '226', '2017-05-23 17:38:42', '1');
INSERT INTO `visit_record` VALUES ('2957', '1', '226', '2017-05-23 17:39:16', '1');
INSERT INTO `visit_record` VALUES ('2958', '2', '226', '2017-05-23 17:39:21', '1');
INSERT INTO `visit_record` VALUES ('2959', '1', '226', '2017-05-23 17:43:32', '1');
INSERT INTO `visit_record` VALUES ('2960', '2', '226', '2017-05-23 17:43:37', '1');
INSERT INTO `visit_record` VALUES ('2961', '1', '226', '2017-05-23 17:43:45', '1');
INSERT INTO `visit_record` VALUES ('2962', '1', '226', '2017-05-23 17:44:05', '1');
INSERT INTO `visit_record` VALUES ('2963', '1', '226', '2017-05-23 17:44:58', '1');
INSERT INTO `visit_record` VALUES ('2964', '1', '226', '2017-05-24 10:16:12', '1');
INSERT INTO `visit_record` VALUES ('2965', '1', '226', '2017-05-24 10:16:13', '1');
INSERT INTO `visit_record` VALUES ('2966', '2', '226', '2017-05-24 10:19:14', '1');
INSERT INTO `visit_record` VALUES ('2967', '1', '228', '2017-05-24 10:19:23', '1');
INSERT INTO `visit_record` VALUES ('2968', '2', '228', '2017-05-24 10:23:38', '1');
INSERT INTO `visit_record` VALUES ('2969', '1', '226', '2017-05-24 10:24:03', '1');
INSERT INTO `visit_record` VALUES ('2970', '1', '245', '2017-05-24 10:55:59', '1');
INSERT INTO `visit_record` VALUES ('2971', '1', '245', '2017-05-24 11:58:27', '1');
INSERT INTO `visit_record` VALUES ('2972', '1', '245', '2017-05-24 17:30:25', '1');
INSERT INTO `visit_record` VALUES ('2973', '1', '226', '2017-05-25 09:10:20', '1');
INSERT INTO `visit_record` VALUES ('2974', '1', '226', '2017-05-25 09:24:53', '1');
INSERT INTO `visit_record` VALUES ('2975', '1', '228', '2017-05-25 09:43:49', '1');
INSERT INTO `visit_record` VALUES ('2976', '1', '226', '2017-05-25 10:51:30', '1');
INSERT INTO `visit_record` VALUES ('2977', '2', '226', '2017-05-25 10:51:43', '1');
INSERT INTO `visit_record` VALUES ('2978', '1', '228', '2017-05-25 10:51:54', '1');
INSERT INTO `visit_record` VALUES ('2979', '1', '226', '2017-05-25 11:01:59', '1');
INSERT INTO `visit_record` VALUES ('2980', '2', '226', '2017-05-25 11:02:25', '1');
INSERT INTO `visit_record` VALUES ('2981', '1', '228', '2017-05-25 11:02:33', '1');
INSERT INTO `visit_record` VALUES ('2982', '1', '240', '2017-05-25 11:07:28', '1');
INSERT INTO `visit_record` VALUES ('2983', '1', '228', '2017-05-25 11:16:10', '1');
INSERT INTO `visit_record` VALUES ('2984', '1', '226', '2017-05-25 11:36:58', '1');
INSERT INTO `visit_record` VALUES ('2985', '2', '226', '2017-05-25 11:45:50', '1');
INSERT INTO `visit_record` VALUES ('2986', '1', '235', '2017-05-25 11:47:17', '1');
INSERT INTO `visit_record` VALUES ('2987', '2', '235', '2017-05-25 11:49:40', '1');
INSERT INTO `visit_record` VALUES ('2988', '1', '256', '2017-05-25 11:49:45', '1');
INSERT INTO `visit_record` VALUES ('2989', '2', '256', '2017-05-25 11:49:52', '1');
INSERT INTO `visit_record` VALUES ('2990', '1', '226', '2017-05-25 11:50:02', '1');
INSERT INTO `visit_record` VALUES ('2991', '2', '226', '2017-05-25 11:53:37', '1');
INSERT INTO `visit_record` VALUES ('2992', '1', '227', '2017-05-25 11:54:10', '1');
INSERT INTO `visit_record` VALUES ('2993', '1', '228', '2017-05-25 12:04:00', '1');
INSERT INTO `visit_record` VALUES ('2994', '1', '228', '2017-05-25 12:27:21', '1');
INSERT INTO `visit_record` VALUES ('2995', '1', '228', '2017-05-25 12:35:39', '1');
INSERT INTO `visit_record` VALUES ('2996', '2', '228', '2017-05-25 12:36:26', '1');
INSERT INTO `visit_record` VALUES ('2997', '1', '228', '2017-05-25 13:39:37', '1');
INSERT INTO `visit_record` VALUES ('2998', '1', '235', '2017-05-25 13:50:39', '1');
INSERT INTO `visit_record` VALUES ('2999', '2', '235', '2017-05-25 13:50:46', '1');
INSERT INTO `visit_record` VALUES ('3000', '1', '245', '2017-05-25 13:50:57', '1');
INSERT INTO `visit_record` VALUES ('3001', '2', '245', '2017-05-25 13:51:58', '1');
INSERT INTO `visit_record` VALUES ('3002', '1', '228', '2017-05-25 13:57:24', '1');
INSERT INTO `visit_record` VALUES ('3003', '2', '228', '2017-05-25 13:58:44', '1');
INSERT INTO `visit_record` VALUES ('3004', '1', '226', '2017-05-25 13:58:51', '1');
INSERT INTO `visit_record` VALUES ('3005', '1', '239', '2017-05-25 14:57:17', '1');
INSERT INTO `visit_record` VALUES ('3006', '1', '226', '2017-05-25 16:52:56', '1');
INSERT INTO `visit_record` VALUES ('3007', '2', '226', '2017-05-25 17:02:39', '1');
INSERT INTO `visit_record` VALUES ('3008', '1', '226', '2017-05-25 17:06:41', '1');
INSERT INTO `visit_record` VALUES ('3009', '1', '226', '2017-05-25 17:09:14', '1');
INSERT INTO `visit_record` VALUES ('3010', '1', '226', '2017-05-25 17:28:05', '1');
INSERT INTO `visit_record` VALUES ('3011', '1', '239', '2017-05-26 08:58:51', '1');
INSERT INTO `visit_record` VALUES ('3012', '2', '239', '2017-05-26 08:58:58', '1');
INSERT INTO `visit_record` VALUES ('3013', '1', '239', '2017-05-26 09:00:16', '1');
INSERT INTO `visit_record` VALUES ('3014', '2', '239', '2017-05-26 09:09:54', '1');
INSERT INTO `visit_record` VALUES ('3015', '1', '249', '2017-05-26 09:10:28', '1');
INSERT INTO `visit_record` VALUES ('3016', '2', '249', '2017-05-26 09:15:16', '1');
INSERT INTO `visit_record` VALUES ('3017', '1', '249', '2017-05-26 09:15:27', '1');
INSERT INTO `visit_record` VALUES ('3018', '2', '249', '2017-05-26 09:19:04', '1');
INSERT INTO `visit_record` VALUES ('3019', '1', '249', '2017-05-26 09:23:03', '1');
INSERT INTO `visit_record` VALUES ('3020', '1', '226', '2017-05-26 09:26:15', '1');
INSERT INTO `visit_record` VALUES ('3021', '1', '226', '2017-05-26 10:55:29', '1');
INSERT INTO `visit_record` VALUES ('3022', '1', '236', '2017-05-26 11:24:50', '1');
INSERT INTO `visit_record` VALUES ('3023', '1', '226', '2017-05-26 11:27:50', '1');
INSERT INTO `visit_record` VALUES ('3024', '1', '236', '2017-05-26 12:36:28', '1');
INSERT INTO `visit_record` VALUES ('3025', '2', '236', '2017-05-26 12:37:33', '1');
INSERT INTO `visit_record` VALUES ('3026', '1', '246', '2017-05-26 12:37:41', '1');
INSERT INTO `visit_record` VALUES ('3027', '1', '226', '2017-05-26 13:29:07', '1');
INSERT INTO `visit_record` VALUES ('3028', '1', '226', '2017-05-26 14:04:26', '1');
INSERT INTO `visit_record` VALUES ('3029', '1', '226', '2017-05-26 14:56:16', '1');
INSERT INTO `visit_record` VALUES ('3030', '1', '226', '2017-05-26 15:03:47', '1');
INSERT INTO `visit_record` VALUES ('3031', '1', '226', '2017-05-26 15:03:50', '1');
INSERT INTO `visit_record` VALUES ('3032', '1', '226', '2017-05-26 15:09:37', '1');
INSERT INTO `visit_record` VALUES ('3033', '1', '226', '2017-05-26 15:15:12', '1');
INSERT INTO `visit_record` VALUES ('3034', '1', '226', '2017-05-26 15:20:18', '1');
INSERT INTO `visit_record` VALUES ('3035', '1', '226', '2017-05-26 15:29:36', '1');
INSERT INTO `visit_record` VALUES ('3036', '1', '228', '2017-05-26 15:49:49', '1');
INSERT INTO `visit_record` VALUES ('3037', '1', '226', '2017-05-26 16:03:46', '1');
INSERT INTO `visit_record` VALUES ('3038', '2', '226', '2017-05-26 16:22:36', '1');
INSERT INTO `visit_record` VALUES ('3039', '1', '245', '2017-05-26 16:22:47', '1');
INSERT INTO `visit_record` VALUES ('3040', '2', '245', '2017-05-26 16:27:42', '1');
INSERT INTO `visit_record` VALUES ('3041', '1', '226', '2017-05-26 16:27:49', '1');
INSERT INTO `visit_record` VALUES ('3042', '2', '226', '2017-05-26 16:40:52', '1');
INSERT INTO `visit_record` VALUES ('3043', '1', '228', '2017-05-26 16:41:31', '1');
INSERT INTO `visit_record` VALUES ('3044', '1', '228', '2017-05-26 16:41:36', '1');
INSERT INTO `visit_record` VALUES ('3045', '1', '226', '2017-05-26 16:49:57', '1');
INSERT INTO `visit_record` VALUES ('3046', '1', '228', '2017-05-26 16:54:00', '1');
INSERT INTO `visit_record` VALUES ('3047', '1', '226', '2017-05-26 17:16:56', '1');
INSERT INTO `visit_record` VALUES ('3048', '1', '228', '2017-05-26 17:17:54', '1');
INSERT INTO `visit_record` VALUES ('3049', '1', '226', '2017-05-27 09:55:46', '1');
INSERT INTO `visit_record` VALUES ('3050', '1', '226', '2017-05-27 10:33:35', '1');
INSERT INTO `visit_record` VALUES ('3051', '1', '226', '2017-05-27 10:53:54', '1');
INSERT INTO `visit_record` VALUES ('3052', '1', '226', '2017-05-27 11:20:09', '1');
INSERT INTO `visit_record` VALUES ('3053', '1', '226', '2017-05-27 11:21:48', '1');
INSERT INTO `visit_record` VALUES ('3054', '1', '228', '2017-05-27 11:36:19', '1');
INSERT INTO `visit_record` VALUES ('3055', '1', '226', '2017-05-27 11:34:02', '1');
INSERT INTO `visit_record` VALUES ('3056', '1', '226', '2017-05-27 11:38:25', '1');
INSERT INTO `visit_record` VALUES ('3057', '1', '226', '2017-05-27 11:44:15', '1');
INSERT INTO `visit_record` VALUES ('3058', '1', '226', '2017-05-27 11:56:57', '1');
INSERT INTO `visit_record` VALUES ('3059', '1', '226', '2017-05-27 13:30:41', '1');
INSERT INTO `visit_record` VALUES ('3060', '1', '226', '2017-05-27 13:39:05', '1');
INSERT INTO `visit_record` VALUES ('3061', '1', '228', '2017-05-27 13:40:17', '1');
INSERT INTO `visit_record` VALUES ('3062', '1', '228', '2017-05-27 14:07:51', '1');
INSERT INTO `visit_record` VALUES ('3063', '1', '228', '2017-05-27 14:55:33', '1');
INSERT INTO `visit_record` VALUES ('3064', '2', '228', '2017-05-27 15:00:22', '1');
INSERT INTO `visit_record` VALUES ('3065', '1', '226', '2017-05-27 15:00:29', '1');
INSERT INTO `visit_record` VALUES ('3066', '1', '226', '2017-05-27 15:42:03', '1');
INSERT INTO `visit_record` VALUES ('3067', '1', '226', '2017-05-31 14:56:14', '1');
INSERT INTO `visit_record` VALUES ('3068', '1', '226', '2017-05-31 14:59:00', '1');
INSERT INTO `visit_record` VALUES ('3069', '1', '226', '2017-05-31 15:35:40', '1');
INSERT INTO `visit_record` VALUES ('3070', '1', '226', '2017-05-31 16:29:41', '1');
INSERT INTO `visit_record` VALUES ('3071', '2', '226', '2017-05-31 16:40:25', '1');
INSERT INTO `visit_record` VALUES ('3072', '1', '245', '2017-05-31 16:41:50', '1');
INSERT INTO `visit_record` VALUES ('3073', '1', '226', '2017-05-31 16:50:53', '1');
INSERT INTO `visit_record` VALUES ('3074', '1', '226', '2017-05-31 16:50:54', '1');
INSERT INTO `visit_record` VALUES ('3075', '1', '226', '2017-05-31 17:01:56', '1');
INSERT INTO `visit_record` VALUES ('3076', '1', '226', '2017-05-31 17:29:07', '1');
INSERT INTO `visit_record` VALUES ('3077', '1', '226', '2017-06-01 09:11:43', '1');
INSERT INTO `visit_record` VALUES ('3078', '1', '226', '2017-06-01 10:22:30', '1');
INSERT INTO `visit_record` VALUES ('3079', '1', '226', '2017-06-01 13:36:52', '1');
INSERT INTO `visit_record` VALUES ('3080', '1', '226', '2017-06-01 15:18:39', '1');
INSERT INTO `visit_record` VALUES ('3081', '1', '226', '2017-06-01 15:27:05', '1');
INSERT INTO `visit_record` VALUES ('3082', '1', '226', '2017-06-01 17:30:19', '1');
INSERT INTO `visit_record` VALUES ('3083', '1', '226', '2017-06-02 09:25:02', '1');
INSERT INTO `visit_record` VALUES ('3084', '1', '226', '2017-06-02 09:32:39', '1');
INSERT INTO `visit_record` VALUES ('3085', '1', '226', '2017-06-02 09:38:56', '1');
INSERT INTO `visit_record` VALUES ('3086', '1', '228', '2017-06-02 09:44:21', '1');
INSERT INTO `visit_record` VALUES ('3087', '1', '226', '2017-06-02 09:56:32', '1');
INSERT INTO `visit_record` VALUES ('3088', '1', '226', '2017-06-02 10:02:42', '1');
INSERT INTO `visit_record` VALUES ('3089', '1', '226', '2017-06-02 10:48:18', '1');
INSERT INTO `visit_record` VALUES ('3090', '1', '226', '2017-06-02 11:25:53', '1');
INSERT INTO `visit_record` VALUES ('3091', '1', '226', '2017-06-02 14:53:43', '1');
INSERT INTO `visit_record` VALUES ('3092', '1', '226', '2017-06-02 17:01:06', '1');
INSERT INTO `visit_record` VALUES ('3093', '1', '226', '2017-06-02 17:29:18', '1');
INSERT INTO `visit_record` VALUES ('3094', '1', '226', '2017-06-05 09:12:48', '1');
INSERT INTO `visit_record` VALUES ('3095', '1', '226', '2017-06-05 09:25:32', '1');
INSERT INTO `visit_record` VALUES ('3096', '1', '226', '2017-06-05 09:38:33', '1');
INSERT INTO `visit_record` VALUES ('3097', '1', '226', '2017-06-05 10:20:52', '1');
INSERT INTO `visit_record` VALUES ('3098', '1', '226', '2017-06-05 11:00:55', '1');
INSERT INTO `visit_record` VALUES ('3099', '1', '226', '2017-06-05 12:51:34', '1');
INSERT INTO `visit_record` VALUES ('3100', '1', '226', '2017-06-05 13:32:03', '1');
INSERT INTO `visit_record` VALUES ('3101', '1', '226', '2017-06-05 13:52:21', '1');
INSERT INTO `visit_record` VALUES ('3102', '1', '226', '2017-06-05 14:27:40', '1');
INSERT INTO `visit_record` VALUES ('3103', '1', '226', '2017-06-05 15:38:03', '1');
INSERT INTO `visit_record` VALUES ('3104', '1', '226', '2017-06-06 09:08:53', '1');
INSERT INTO `visit_record` VALUES ('3105', '1', '226', '2017-06-06 13:37:06', '1');
INSERT INTO `visit_record` VALUES ('3106', '1', '226', '2017-06-06 14:08:00', '1');
INSERT INTO `visit_record` VALUES ('3107', '1', '226', '2017-06-06 14:11:30', '1');
INSERT INTO `visit_record` VALUES ('3108', '1', '226', '2017-06-06 14:11:31', '1');
INSERT INTO `visit_record` VALUES ('3109', '2', '226', '2017-06-06 14:16:20', '1');
INSERT INTO `visit_record` VALUES ('3110', '1', '226', '2017-06-06 14:24:24', '1');
INSERT INTO `visit_record` VALUES ('3111', '1', '226', '2017-06-06 14:32:26', '1');
INSERT INTO `visit_record` VALUES ('3112', '1', '226', '2017-06-06 14:58:46', '1');
INSERT INTO `visit_record` VALUES ('3113', '1', '226', '2017-06-06 15:30:59', '1');
INSERT INTO `visit_record` VALUES ('3114', '1', '226', '2017-06-06 15:45:56', '1');
INSERT INTO `visit_record` VALUES ('3115', '2', '226', '2017-06-06 15:46:39', '1');
INSERT INTO `visit_record` VALUES ('3116', '1', '226', '2017-06-06 15:46:43', '1');
INSERT INTO `visit_record` VALUES ('3117', '1', '226', '2017-06-06 16:19:48', '1');
INSERT INTO `visit_record` VALUES ('3118', '1', '226', '2017-06-06 16:49:08', '1');
INSERT INTO `visit_record` VALUES ('3119', '1', '226', '2017-06-06 17:21:38', '1');
INSERT INTO `visit_record` VALUES ('3120', '1', '226', '2017-06-07 09:14:22', '1');
INSERT INTO `visit_record` VALUES ('3121', '1', '226', '2017-08-22 13:27:27', '1');
INSERT INTO `visit_record` VALUES ('3122', '1', '226', '2017-09-02 17:09:56', '1');
INSERT INTO `visit_record` VALUES ('3123', '1', '226', '2017-09-02 20:18:02', '1');
INSERT INTO `visit_record` VALUES ('3124', '1', '226', '2017-09-05 10:47:27', '1');
INSERT INTO `visit_record` VALUES ('3125', '1', '226', '2017-09-05 11:34:37', '1');
INSERT INTO `visit_record` VALUES ('3126', '1', '226', '2017-09-05 23:32:53', '1');
INSERT INTO `visit_record` VALUES ('3127', '1', '226', '2017-09-06 14:02:17', '1');
INSERT INTO `visit_record` VALUES ('3128', '1', '226', '2017-09-06 15:11:55', '1');
INSERT INTO `visit_record` VALUES ('3129', '1', '226', '2017-09-06 15:17:05', '1');
INSERT INTO `visit_record` VALUES ('3130', '1', '226', '2017-09-06 15:55:05', '1');
INSERT INTO `visit_record` VALUES ('3131', '1', '226', '2017-09-06 15:57:03', '1');
INSERT INTO `visit_record` VALUES ('3132', '1', '226', '2017-09-06 22:40:52', '1');
INSERT INTO `visit_record` VALUES ('3133', '1', '226', '2017-09-07 00:10:10', '1');
INSERT INTO `visit_record` VALUES ('3134', '1', '226', '2017-09-07 05:03:24', '1');
INSERT INTO `visit_record` VALUES ('3135', '1', '226', '2017-09-07 09:46:40', '1');
INSERT INTO `visit_record` VALUES ('3136', '1', '226', '2017-09-07 09:45:46', '1');
INSERT INTO `visit_record` VALUES ('3137', '1', '226', '2017-09-07 10:33:00', '1');
INSERT INTO `visit_record` VALUES ('3138', '1', '226', '2017-09-07 11:55:46', '1');
INSERT INTO `visit_record` VALUES ('3139', '1', '226', '2017-09-07 13:01:53', '1');
INSERT INTO `visit_record` VALUES ('3140', '1', '226', '2017-09-07 14:00:29', '1');
INSERT INTO `visit_record` VALUES ('3141', '1', '226', '2017-09-07 15:38:44', '1');
INSERT INTO `visit_record` VALUES ('3142', '1', '226', '2017-09-07 15:43:57', '1');
INSERT INTO `visit_record` VALUES ('3143', '1', '226', '2017-09-07 16:12:30', '1');
INSERT INTO `visit_record` VALUES ('3144', '1', '226', '2017-09-07 16:30:01', '1');
INSERT INTO `visit_record` VALUES ('3145', '1', '226', '2017-09-07 16:30:10', '1');
INSERT INTO `visit_record` VALUES ('3146', '1', '226', '2017-09-07 17:24:26', '1');
INSERT INTO `visit_record` VALUES ('3147', '1', '226', '2017-09-07 19:56:10', '1');
INSERT INTO `visit_record` VALUES ('3148', '1', '226', '2017-09-07 20:59:28', '1');
INSERT INTO `visit_record` VALUES ('3149', '1', '226', '2017-09-08 08:33:59', '1');
INSERT INTO `visit_record` VALUES ('3150', '1', '226', '2017-09-11 09:38:22', '1');
INSERT INTO `visit_record` VALUES ('3151', '1', '226', '2017-09-11 10:20:39', '1');
INSERT INTO `visit_record` VALUES ('3152', '1', '226', '2017-09-11 11:19:58', '1');
INSERT INTO `visit_record` VALUES ('3153', '1', '226', '2017-09-11 14:30:38', '1');
INSERT INTO `visit_record` VALUES ('3154', '1', '226', '2017-09-11 17:29:58', '1');
INSERT INTO `visit_record` VALUES ('3155', '1', '226', '2017-09-11 17:36:57', '1');
INSERT INTO `visit_record` VALUES ('3156', '1', '226', '2017-09-12 09:53:38', '1');
INSERT INTO `visit_record` VALUES ('3157', '1', '226', '2017-09-12 10:10:53', '1');
INSERT INTO `visit_record` VALUES ('3158', '1', '226', '2017-09-12 10:10:54', '1');
INSERT INTO `visit_record` VALUES ('3159', '1', '226', '2017-09-14 10:27:15', '1');
INSERT INTO `visit_record` VALUES ('3160', '1', '226', '2017-09-14 13:23:37', '1');
INSERT INTO `visit_record` VALUES ('3161', '1', '226', '2017-09-14 13:48:50', '1');
INSERT INTO `visit_record` VALUES ('3162', '1', '226', '2017-09-14 13:52:54', '1');
INSERT INTO `visit_record` VALUES ('3163', '2', '226', '2017-09-14 14:17:20', '1');
INSERT INTO `visit_record` VALUES ('3164', '1', '226', '2017-09-14 14:18:53', '1');
INSERT INTO `visit_record` VALUES ('3165', '1', '226', '2017-09-14 14:18:54', '1');
INSERT INTO `visit_record` VALUES ('3166', '1', '226', '2017-09-14 14:56:26', '1');
INSERT INTO `visit_record` VALUES ('3167', '1', '226', '2017-09-14 15:00:06', '1');
INSERT INTO `visit_record` VALUES ('3168', '1', '226', '2017-09-14 15:00:50', '1');
INSERT INTO `visit_record` VALUES ('3169', '1', '226', '2017-09-14 15:24:01', '1');
INSERT INTO `visit_record` VALUES ('3170', '1', '226', '2017-09-14 15:24:02', '1');
INSERT INTO `visit_record` VALUES ('3171', '1', '226', '2017-09-14 15:40:57', '1');
INSERT INTO `visit_record` VALUES ('3172', '1', '226', '2017-09-25 16:32:57', '1');
INSERT INTO `visit_record` VALUES ('3173', '1', '226', '2017-09-27 16:52:55', '1');
INSERT INTO `visit_record` VALUES ('3174', '2', '226', '2017-09-27 17:12:24', '1');
INSERT INTO `visit_record` VALUES ('3175', '1', '226', '2017-09-27 17:12:37', '1');
INSERT INTO `visit_record` VALUES ('3176', '1', '226', '2017-09-28 09:09:13', '1');
INSERT INTO `visit_record` VALUES ('3177', '1', '226', '2017-09-28 09:10:08', '1');
INSERT INTO `visit_record` VALUES ('3178', '1', '226', '2017-09-28 09:49:38', '1');
INSERT INTO `visit_record` VALUES ('3179', '1', '226', '2017-09-28 10:05:51', '1');
INSERT INTO `visit_record` VALUES ('3180', '1', '226', '2017-09-28 11:30:16', '1');
INSERT INTO `visit_record` VALUES ('3181', '1', '226', '2017-09-28 12:01:31', '1');
INSERT INTO `visit_record` VALUES ('3182', '1', '226', '2017-09-28 12:01:32', '1');
INSERT INTO `visit_record` VALUES ('3183', '1', '226', '2017-09-28 12:01:33', '1');
INSERT INTO `visit_record` VALUES ('3184', '1', '226', '2017-09-28 12:48:09', '1');
INSERT INTO `visit_record` VALUES ('3185', '1', '226', '2017-09-28 15:36:40', '1');
INSERT INTO `visit_record` VALUES ('3186', '1', '226', '2017-09-28 15:36:42', '1');
INSERT INTO `visit_record` VALUES ('3187', '1', '226', '2017-09-28 15:59:49', '1');
INSERT INTO `visit_record` VALUES ('3188', '1', '226', '2017-11-03 09:54:20', '1');
INSERT INTO `visit_record` VALUES ('3189', '1', '226', '2017-11-10 16:30:57', '1');
INSERT INTO `visit_record` VALUES ('3190', '1', '226', '2017-11-10 16:33:39', '1');
INSERT INTO `visit_record` VALUES ('3191', '1', '226', '2017-11-13 09:08:15', '1');
INSERT INTO `visit_record` VALUES ('3192', '1', '226', '2017-11-13 09:53:21', '1');
INSERT INTO `visit_record` VALUES ('3193', '2', '226', '2017-11-13 10:00:38', '1');
INSERT INTO `visit_record` VALUES ('3194', '1', '230', '2017-11-13 10:00:51', '1');
INSERT INTO `visit_record` VALUES ('3195', '1', '226', '2017-11-27 10:01:49', '1');
INSERT INTO `visit_record` VALUES ('3196', '1', '226', '2017-12-12 16:32:33', '1');
INSERT INTO `visit_record` VALUES ('3197', '1', '226', '2017-12-12 16:32:33', '1');
INSERT INTO `visit_record` VALUES ('3198', '1', '226', '2017-12-12 17:10:09', '1');
INSERT INTO `visit_record` VALUES ('3199', '1', '226', '2017-12-18 15:31:05', '1');
INSERT INTO `visit_record` VALUES ('3200', '1', '226', '2017-12-18 15:31:08', '1');
INSERT INTO `visit_record` VALUES ('3201', '1', '226', '2017-12-18 15:38:10', '1');
INSERT INTO `visit_record` VALUES ('3202', '2', '226', '2017-12-18 15:44:31', '1');
INSERT INTO `visit_record` VALUES ('3203', '1', '287', '2017-12-18 15:44:38', '1');
INSERT INTO `visit_record` VALUES ('3204', '1', '287', '2017-12-18 15:48:41', '1');
INSERT INTO `visit_record` VALUES ('3205', '2', '287', '2017-12-18 15:51:13', '1');
INSERT INTO `visit_record` VALUES ('3206', '1', '226', '2017-12-18 15:51:34', '1');
INSERT INTO `visit_record` VALUES ('3207', '1', '287', '2017-12-18 16:03:49', '1');
INSERT INTO `visit_record` VALUES ('3208', '1', '287', '2017-12-18 16:24:54', '1');
INSERT INTO `visit_record` VALUES ('3209', '2', '226', '2017-12-18 16:34:51', '1');
INSERT INTO `visit_record` VALUES ('3210', '1', '287', '2017-12-18 16:35:02', '1');
INSERT INTO `visit_record` VALUES ('3211', '2', '287', '2017-12-18 16:41:29', '1');
INSERT INTO `visit_record` VALUES ('3212', '1', '226', '2017-12-18 16:41:38', '1');
INSERT INTO `visit_record` VALUES ('3213', '1', '226', '2017-12-18 16:41:39', '1');
INSERT INTO `visit_record` VALUES ('3214', '1', '287', '2017-12-18 16:52:27', '1');
INSERT INTO `visit_record` VALUES ('3215', '1', '287', '2017-12-18 16:52:29', '1');
INSERT INTO `visit_record` VALUES ('3216', '2', '226', '2017-12-18 17:11:26', '1');
INSERT INTO `visit_record` VALUES ('3217', '1', '287', '2017-12-18 17:11:43', '1');

-- ----------------------------
-- Table structure for visit_type
-- ----------------------------
DROP TABLE IF EXISTS `visit_type`;
CREATE TABLE `visit_type` (
  `visit_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `visit_type_name` varchar(100) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `stateDate` datetime DEFAULT NULL,
  `state` int(2) DEFAULT '1',
  PRIMARY KEY (`visit_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='1:登录\r\n2:退出登录';

-- ----------------------------
-- Records of visit_type
-- ----------------------------
INSERT INTO `visit_type` VALUES ('1', '登录', '2016-10-27 11:50:18', '2016-11-22 11:51:03', '1');
INSERT INTO `visit_type` VALUES ('2', '登出', '2016-10-27 11:51:00', '2016-10-27 15:48:41', '1');
