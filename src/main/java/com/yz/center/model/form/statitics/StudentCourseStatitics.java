
/**    
* @Title: StudentCourseStatitics.java
* @Package com.yz.center.model.form.statitics
* @Description: TODO
* @author: 
* @date: 2017年1月13日 上午10:27:28 
* @version V1.0 
* @Copyright 亚卓教育
*   
*/  

package com.yz.center.model.form.statitics;

import lombok.Data;

/**  
* @Description: TODO
* @author: 
* @date: 2017年1月13日 上午10:27:28 
* @version V1.0   
*/
@Data
public class StudentCourseStatitics {
	private Integer openId;
	private Integer studentNumber;
	private String studentName;
	private Integer classId; 
	private Integer gradeId;
	private String className; 
	private String gradeName;
	private Float myvideoPercent;
	
	//我的相关信息
	private Float videoCount;
	private Float examineCount;
	private Integer discussCount;
	private Integer taskCount;
	
	private Float myTaskPercent;
	private Float mydiscussPercent;
	private Float myexamePercent;
	private Float myexameGrade;
	private Float myFinalGrade;
	
	private Float MinMyvideoPercent;
	private Float MaxMyvideoPercent;
	private Float MinmyexameGrade;
	private Float MaxmyexameGrade;
	private Integer MinvideoCount;
	private Integer MaxvideoCount;
	//总的
	private Integer oldDiscussCount;
	private Integer oldVideoCount;
	private Integer oldExamineCount;
	private Integer oldTaskCount;
}
