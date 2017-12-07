
/**    
* @Title: StuTestForm.java
* @Package com.yz.center.model.form
* @Description: TODO
* @author: 
* @date: 2016年12月22日 下午3:53:54 
* @version V1.0 
* @Copyright 亚卓教育
*   
*/  

package com.yz.center.model.form;

import java.util.Date;

import lombok.Data;
import lombok.val;

/**  
* @Description: TODO
* @author: 
* @date: 2016年12月22日 下午3:53:54 
* @version V1.0   
*/
@Data
public class StuTestForm {
	private Integer studentPaperId;
	private Integer studentId;
	private Integer Id;
	private Integer paperId;
	private Integer passScore;
	private Integer openCourseId;
	private Integer studyScore;
	private Integer isTimeLimit;
	private Integer limitTime;
	private Date examineStartDate; 
	private Date examineEndDate;
	private String courseName;
	private String title; 
	private Integer testCounts;
	private Float score;
	private Date submitDate;
	private String maxUrl;//最小图片
	

}