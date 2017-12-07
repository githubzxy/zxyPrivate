package com.yz.center.model.po;

import java.util.Date;

import com.yz.center.model.po.school.SchoolPo;

public class ClassPo {
private Integer classId;
private GradePo gradePo;
private SchoolPo schoolPo;
private String name;
private String major;
private Date creDt;
private Date staDt;
private Integer state;
private String info;
private String createDate;

public Integer getClassId() {
	return classId;
}
public void setClassId(Integer classId) {
	this.classId = classId;
}
public GradePo getGradePo() {
	return gradePo;
}
public void setGradePo(GradePo gradePo) {
	this.gradePo = gradePo;
}
public SchoolPo getSchoolPo() {
	return schoolPo;
}
public void setSchoolPo(SchoolPo schoolPo) {
	this.schoolPo = schoolPo;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getMajor() {
	return major;
}
public void setMajor(String major) {
	this.major = major;
}
public Date getCreDt() {
	return creDt;
}
public void setCreDt(Date creDt) {
	this.creDt = creDt;
}
public Date getStaDt() {
	return staDt;
}
public void setStaDt(Date staDt) {
	this.staDt = staDt;
}
public Integer getState() {
	return state;
}
public void setState(Integer state) {
	this.state = state;
}
public String getInfo() {
	return info;
}
public void setInfo(String info) {
	this.info = info;
}
@Override
public String toString() {
	return "ClassPo [classId=" + classId + ", gradePo=" + gradePo + ", schoolPo=" + schoolPo + ", name=" + name
			+ ", major=" + major + ", creDt=" + creDt + ", staDt=" + staDt + ", state=" + state + ", info=" + info
			+ ", createDate=" + createDate + "]";
}
public String getCreateDate() {
	return createDate;
}
public void setCreateDate(String createDate) {
	this.createDate = createDate;
}


}