package com.yz.center.model.vo.paper;

public class subjectAndpaperVo {
   private Integer videoId;
   private String videoName;
   private Integer subjectNum;
   private Integer paperNum;
   private Integer num;//如果有作业则显示数据，判断该开课下是否已建作业
   
public Integer getNum() {
	return num;
}
public void setNum(Integer num) {
	this.num = num;
}
public Integer getVideoId() {
	return videoId;
}
public void setVideoId(Integer videoId) {
	this.videoId = videoId;
}
public String getVideoName() {
	return videoName;
}
public void setVideoName(String videoName) {
	this.videoName = videoName;
}
public Integer getSubjectNum() {
	return subjectNum;
}
public void setSubjectNum(Integer subjectNum) {
	this.subjectNum = subjectNum;
}
public Integer getPaperNum() {
	return paperNum;
}
public void setPaperNum(Integer paperNum) {
	this.paperNum = paperNum;
}
@Override
public String toString() {
	return "subjectAndpaperVo [videoId=" + videoId + ", videoName=" + videoName + ", subjectNum=" + subjectNum
			+ ", paperNum=" + paperNum + "]";
}
   
}
