package com.yz.center.model.vo.paper;

import lombok.Data;

@Data
public class PaperCoursePage {
	private Integer openId;
    private Integer courseId;
    private Integer courseTypeId;
    private Integer userId;
    private String courseName;
    private String courseTypeName;
    private String  userName;
    private Integer num;//如果有考试则显示数据，判断该开课下是否已建考试
    
    
	public Integer getOpenId() {
		return openId;
	}
	public void setOpenId(Integer openId) {
		this.openId = openId;
	}
	public Integer getCourseId() {
		return courseId;
	}
	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}
	public Integer getCourseTypeId() {
		return courseTypeId;
	}
	public void setCourseTypeId(Integer courseTypeId) {
		this.courseTypeId = courseTypeId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getCourseTypeName() {
		return courseTypeName;
	}
	public void setCourseTypeName(String courseTypeName) {
		this.courseTypeName = courseTypeName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Override
	public String toString() {
		return "PaperCoursePage [courseId=" + courseId + ", courseTypeId=" + courseTypeId + ", userId=" + userId
				+ ", courseName=" + courseName + ", courseTypeName=" + courseTypeName + ", userName=" + userName + "]";
	}
    
}
