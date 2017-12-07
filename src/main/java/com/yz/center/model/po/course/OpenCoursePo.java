package com.yz.center.model.po.course;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月17日 上午11:49:31 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
@Data
public class OpenCoursePo implements Serializable {
    private static final long serialVersionUID = 1L;
	private Integer openId;
	private Integer courseId;
	private Integer userId;
	private String courseName;
	private String videoName;//视频名 
	private String title;//作业或考试标题
	private Integer Id;//examine_task_paper_info Id
	private Integer schoolId;
	private Integer courseCode;
	private float studyScore;
	private Integer passScore;
	
	private Integer videoSeePercent;
	//0,1是否有
	private Integer containVideo;
	private Integer containTask;
	private Integer containExamine;
	private Integer containDiscuss;
	//百分占比
	private Integer videoPercent;
	private Integer taskPercent;
	private Integer examinPercent;
	private Integer discussPercent;
	//次数
	private Integer discussCount;
	private Integer taskCount;
	private Integer videoCount;
	private Integer examineCount;
	
	private Date selectStartDate;//学生选课时间
	private Date selectEndDate;
	private Date studyStartDate;//课程开放时间
	private Date studyEndDate;
	private Date examineStartDate;//考试开放时间
	private Date examineEndDate;
	private Date finishDate;//预定归档日期
	
	private Date createDate;//创建时间
	private Integer isAllowSelect; //是狗允许选课
	private Integer clickNum;
	private Integer sort;
	private Integer state;
	
	
	
	private Integer markCount;//批阅份数
	private Integer submitCount;//提交份数
	
	public OpenCoursePo(){}
	
	public OpenCoursePo(OpenCoursePo openCoursePo) {
		super();
		this.Id = openCoursePo.getId();
		this.openId = openCoursePo.getOpenId();
		this.courseId = openCoursePo.getCourseId();
		this.userId = openCoursePo.getUserId();
		this.courseName = openCoursePo.getCourseName();
		this.schoolId = openCoursePo.getSchoolId();
		this.courseCode = openCoursePo.getCourseCode();
		this.studyScore = openCoursePo.getStudyScore();
		this.passScore = openCoursePo.getPassScore();
		this.videoSeePercent = openCoursePo.getVideoSeePercent();
		this.containVideo = openCoursePo.getContainVideo();
		this.containTask = openCoursePo.getContainTask();
		this.containExamine = openCoursePo.getContainExamine();
		this.containDiscuss = openCoursePo.getContainDiscuss();
		this.videoPercent = openCoursePo.getVideoPercent();
		this.taskPercent = openCoursePo.getTaskPercent();
		this.examinPercent = openCoursePo.getExaminPercent();
		this.discussPercent = openCoursePo.getDiscussPercent();
		this.discussCount = openCoursePo.getDiscussCount();
		this.taskCount = openCoursePo.getTaskCount();
		this.videoCount = openCoursePo.getVideoCount();
		this.examineCount = openCoursePo.getExamineCount();
		this.selectStartDate = openCoursePo.getSelectStartDate();
		this.selectEndDate = openCoursePo.getSelectEndDate();
		this.studyStartDate = openCoursePo.studyStartDate;
		this.studyEndDate = openCoursePo.studyEndDate;
		this.examineStartDate = openCoursePo.getExamineStartDate();
		this.examineEndDate = openCoursePo.getExamineEndDate();
		this.finishDate = openCoursePo.getFinishDate();
		this.createDate = openCoursePo.getCreateDate();
		this.isAllowSelect = openCoursePo.getIsAllowSelect();
		this.clickNum = openCoursePo.getClickNum();
		this.sort = openCoursePo.getSort();
		this.state = openCoursePo.getState();
		this.markCount = openCoursePo.getMarkCount();
		this.submitCount = openCoursePo.getSubmitCount();
	}

	
}
