package com.yz.center.model.form;

import java.io.Serializable;
import java.util.Date;
import javax.validation.constraints.Size;
import org.apache.bval.constraints.NotEmpty;
import lombok.Data;


@Data
public class TeacherForm implements Serializable{
	 

	private static final long serialVersionUID = 1L;//@Fields serialVersionUID : 
	private Integer userId;//用户id
	private Integer schoolId;//学校id
	private Integer loginId;//登录id
	private Integer teacherId;//老师id
	private Integer gender;//性别
	private Integer state;//状态
	private String roleCode;//roleCode
	private String name;//姓名
	private String number;//工号
	private String beforeNumber;//修改前工号
	private String avatar;//上传头像
	private String mobile;//手机号
	private String info;//简介
	private String IdCard;//身份证
	private String email;//邮箱
	private String birthday;//生日
	private Date birthday2;//前台接收生日
	private Date createDate;//创建时间
	private Date stopDate;
	private String position;//职称
	private String department;//部门
	private String loginPwd;//密码
	private String phone;//座机号
	private String pic;//修改前图片
	
	
	
	
	

}
