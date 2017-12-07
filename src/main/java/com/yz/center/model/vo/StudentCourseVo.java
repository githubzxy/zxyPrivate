
/**    
* @Title: StudentCourseVo.java
* @Package com.yz.center.model.vo
* Description: TODO
* @author: 
* @date: 2016年12月21日 下午5:51:17 
* @version V1.0 
*   
*/  

package com.yz.center.model.vo;

import java.util.Date;

import com.yz.center.model.po.course.CoverPo;

import lombok.Data;

/**  
* Description: TODO
* @author Administrator  
* @date: 2016年12月21日 下午5:51:17 
* @version V1.0   
*/
@Data
public class StudentCourseVo {
	private Integer studentId;
	private Integer studentCourseId;
	private Integer openId;
	private String openCourseName;
	private CoverPo coverPo;//封面 
	private Date exameStartTime;
	private Date exameEndTime;
	private Integer studyScore;
	
	private Integer containVideo;
	private Integer containTask;
	private Integer containExamine;
	private Integer containDiscuss;
	
	private Integer exameCount;
	private float exameTotalScore;
	private Integer videoTotalCount;
	private Integer paperCount;
	private float paperTotalScore;
	private Integer discussTotalCount;
	
	
	private Integer myexamCount;
	private float myExameTotalScore;
	private Integer myVideoTotalCount;
	private float  myVideoTotalScore;
	private Integer mypaperCount;
	private float myPaperTotalScore;
	private Integer myDiscussTotalCount;
	private float myDiscussTotalScore;
	
	private Integer discussPercent;
	private Integer examinPercent;
	private Integer paperPercent;
	private Integer videoPercent;
	
	private float myFinalScore;//计算后的总分
	private float passScore;
	private Integer state;//1：通过,0:未通过
	
	private float coursePro;
	private Integer classhour;
	private Date studyStartDate;
	private Date studyEndDate;
	
}