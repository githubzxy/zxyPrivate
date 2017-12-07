package com.yz.center.model.vo;

import com.yz.center.model.po.UserPo;

public class StudentList {
	private Integer studentId;
	private String name;
	private String number;
	private UserPo userPo;
	private String gradeName;
	private String className;
	
	
	public StudentList() {
	
	}
	public Integer getStudentId() {
		return studentId;
	}
	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public UserPo getUserPo() {
		return userPo;
	}
	public void setUserPo(UserPo userPo) {
		this.userPo = userPo;
	}
	
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	@Override
	public String toString() {
		return "StudentList [studentId=" + studentId + ", name=" + name + ", number=" + number + ", userPo=" + userPo
				+ ", gradeName=" + gradeName + ", className=" + className + "]";
	}
	
    
	
    
    
  
   
    
}
