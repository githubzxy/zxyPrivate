
/**    
* @Title: StudentCourseVo2.java
* @Package com.yz.center.model.vo
* Description: TODO
* @author: 
* @date: 2017年1月4日 下午5:30:19 
* @version V1.0 
*   
*/  

package com.yz.center.model.vo;

import lombok.Data;

/**  
* Description: TODO
* @author Administrator  
* @date: 2017年1月4日 下午5:30:19 
* @version V1.0   
*/
@Data
public class StudentCourseVo2 {
	private Integer openId;
	private Integer studentNumber;
	private String studentName;
	private Integer myvideoPercent;
	private Integer videoCount;
	private Integer examineCount;
	private Integer discussCount;
	private Integer taskCount;
	private Integer myTaskPercent;
	private Integer mydiscussPercent;
	private Integer myexamePercent;
	private Integer myexameGrade;
	private Integer myFinalGrade;
	
	private Integer MinMyvideoPercent;
	private Integer MaxMyvideoPercent;
	private Integer MinmyexameGrade;
	private Integer MaxmyexameGrade;
	private Integer MinvideoCount;
	private Integer MaxvideoCount;
	private Integer oldDiscussCount;
}
