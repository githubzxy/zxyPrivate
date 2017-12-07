package com.yz.center.model.vo;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.apache.bval.constraints.Email;

import lombok.Data;
@Data
public class StudentForm {
	 private Integer loginId;
	 private Integer userId;
	 private Integer studentId;
	 private Integer schoolId;
	 @NotNull(message="姓名不能为空")
     private String name;
     private String birthday;
     private Date birthday2;
     private Integer gender;
     @Email(message="邮箱格式错误")
     private String email;
     private String loginPwd;
     private String confirmPwd;
     private String phone;
     private String mobile;
     private String number;//學生學號
     private String beforeNumber;//學生修改前學號
     private String idCard;
     private String info;
     private String avatar;//头像
     private Integer classId;
     private Integer gradeId;
     private String gradeName;
     private String className;
     private String major;
     private String roleId;
     private Date createDate;//创建时间
 	 private Date stopDate;
}