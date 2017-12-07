package com.yz.center.model.po.teacher;

import java.io.Serializable;

import com.yz.center.model.po.user.UserPo;

import lombok.Data;
@Data
/**
 * 
 * 老师实体类
 */
public class TeacherPo implements Serializable {
//@Fields serialVersionUID : 
    
    private static final long serialVersionUID = 1L;
	private Integer teacherId;
	private Integer userId;//用户id
	private Integer loginId;//登录id
	private String  number;
	private String roleCode;//roleCode
	private String position;
	private String department;
	private UserPo userPo;
	private String name;
	
	
 
}
