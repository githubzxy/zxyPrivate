
/**    
* @Title: OpenCourseVo2.java
* @Package com.yz.center.model.vo.course
* Description: TODO
* @author: 
* @date: 2017年1月4日 上午10:56:00 
* @version V1.0 
*   
*/  

package com.yz.center.model.vo.course;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

/**  
* Description: TODO
* @author Administrator  
* @date: 2017年1月4日 上午10:56:00 
* @version V1.0   
*/
@Data
public class OpenCourseVo2 implements Serializable{
	
		/**  
		  * @Fields serialVersionUID : TODO 
	     */  
	
	private static final long serialVersionUID = 1L;
	private Integer openId;
	private String courseName;
	private Date  studyStartDate;//课程开放时间
	private Date  studyEndDate;
	private Integer selectedStudentTotal;
	private Integer examPeopleTotal;
	private Integer videohits;
	private Integer taskhits;
	private Integer examinehits;
	private Integer discusshits;
	private Integer passPeople;
	private Integer state;//2,结课1，为节课
}
