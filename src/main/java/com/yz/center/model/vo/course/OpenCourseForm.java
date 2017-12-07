package com.yz.center.model.vo.course;

import lombok.Data;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月21日 上午10:28:16 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
@Data
public class OpenCourseForm {

	private String courseName;
	private Integer courseCode;
	private Integer studyScore;
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
/*	private Integer taskCount;
	private Integer videoCount;
	private Integer examineCount;*/
	
	private String  selectStartDate;//学生选课时间
	private String  selectEndDate;
	private String  studyStartDate;//课程开放时间
	private String  studyEndDate;
	private String  examineStartDate;//考试开放时间
	private String  examineEndDate;
	private String  finishDate;//预定归档日期

	private Integer isAllowSelect; //是狗允许选课
}
