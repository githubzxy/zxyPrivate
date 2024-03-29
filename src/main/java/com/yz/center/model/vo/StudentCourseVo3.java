
/**    
* @Title: StudentCourseVo3.java
* @Package com.yz.center.model.vo
* Description: TODO
* @author: 
* @date: 2017年1月11日 下午2:29:19 
* @version V1.0 
*   
*/  

package com.yz.center.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

/**  
* Description: TODO
* @author Administrator  
* @date: 2017年1月11日 下午2:29:19 
* @version V1.0   
*/
@Data
public class StudentCourseVo3 implements Serializable{
	
		/**  
		  * @Fields serialVersionUID : TODO 
	     */  
	
	private static final long serialVersionUID = 1L;
	private Integer studentId;
	private Integer studentCourseId;
	private Integer openId;
	private String openCourseName;
	private Integer videoTotalCount;
	 
	private Integer studyScore;
	
	private Integer classhour;
	
	private float studyPro;
	private Integer myDiscussTotalCount;
	private Integer mypaperDiscussCount;
	private Integer DiscussTotalCount;
	private Integer paperDiscussCount;
	
	private Date exameStartTime;
	private Date exameEndTime;
	private Date studyStartDate;
	private Date studyEndDate;
	//考核比例
	private Integer discussPercent;
	private Integer examinPercent;
	private Integer paperPercent;
	private Integer videoPercent;
	
	private String middleUrl;
	private Integer coverId;
}
