package com.yz.center.model.po;

import java.util.Date;

import com.yz.center.model.po.school.SchoolPo;

public class GradePo {
 private Integer gradeId ;
 private String name;
 private SchoolPo schoolPo;
 private Date creDt;
 private Date staDt;
 private Integer state;
public Integer getGradeId() {
	return gradeId;
}
public void setGradeId(Integer gradeId) {
	this.gradeId = gradeId;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public SchoolPo getSchoolPo() {
	return schoolPo;
}
public void setSchoolPo(SchoolPo schoolPo) {
	this.schoolPo = schoolPo;
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
@Override
public String toString() {
	return "GradePo [gradeId=" + gradeId + ", name=" + name + ", schoolPo=" + schoolPo + ", creDt=" + creDt + ", staDt="
			+ staDt + ", state=" + state + "]";
}
 
 
 
}
