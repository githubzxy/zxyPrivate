package com.yz.center.model.po.user;

import java.io.Serializable;
import java.util.Date;

import com.yz.center.model.po.ClassPo;
import com.yz.center.model.po.StudentPo;
import com.yz.center.model.po.teacher.TeacherPo;

import lombok.Data;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年10月25日 下午4:35:27 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */

/**
 * 
 * 用户实体类
 */
@Data
public class UserPo implements Serializable {
//@Fields serialVersionUID : 
    
    private static final long serialVersionUID = 1L;
    private Integer userId;//用户id
	private Integer schoolId;//学校id
	private Integer loginId;//登录id
	private Integer gender;
	private Integer state;
	private String roleCode;//roleCode
	private String name;
	private String number;
	private String avatar;
	private String phone;
	private String mobile;
	private String info;
	private String idCard;//身份证
	private String email;
	private String birthday;
	private Date birthday2;//前台接收生日
	private Date createDate;
	private Date stopDate;
	private LoginPo loginPo;
	private TeacherPo teacherPo;
	private String dengluDate;
	private ClassPo classPo;
	private StudentPo studentPo;
}
