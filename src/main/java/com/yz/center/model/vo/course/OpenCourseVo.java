package com.yz.center.model.vo.course;

import java.io.Serializable;
import java.util.Date;

import com.yz.center.model.po.user.UserPo;

import lombok.Data;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月17日 下午4:17:09 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
@Data
public class OpenCourseVo implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer openId;
	private Integer studentCourseId;
	private String courseName;
	private Date finishDate;//预定归档日期
	
	private Date createDate;//创建事件
	private String createDate2;
	private UserPo userPo;
	private float  studyScore;
	private Integer passScore;
	private Integer sort;
	private Integer state;
	private Integer classhour;//课时
	private String coverMinUrl;
	private String middleUrl;
	private String maxUrl;//大图
	private String courseInfo;
	private String lecturerName;
	
	private Integer studentId;
	private Integer allChapterCount;
	
	private Integer studyPeopleCount;
	private Integer studyOverchapterCount;
	
	private Date studyStartDate;
	private long studyStartDateStr;
	private Date studyEndDate;
	private long  studyEndDateStr;
	private Integer studyState;
	private String studyString;
}