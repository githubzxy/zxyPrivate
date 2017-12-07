package com.yz.center.model.form;

import lombok.Data;

@Data
public class CourseInfoForm {
	private Integer courseId; 
	private Integer count;  //学习人数统计
	private Integer openId; 
	private float classhour;    //课时
	private String  typeName;
	private String courseInfo;  //课程简介
	private String  courseName;
	private String cover;
	private String maxUrl;//大图
		
	
	

}
