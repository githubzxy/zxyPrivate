
/**    
* @Title: FindHomeworkForm.java
* @Package com.yz.center.model.form
* @Description: TODO
* @author: 
* @date: 2016年12月16日 下午6:00:46 
* @version V1.0 
* @Copyright 亚卓教育
*   
*/  

package com.yz.center.model.form;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

/**  
* @Description: TODO
* @author: 
* @date: 2016年12月16日 下午6:00:46 
* @version V1.0   
*/
@Data
public class FindHomeworkForm implements Serializable {
	  private static final long serialVersionUID = 1L;//@Fields serialVersionUID :
	  private Integer id;
	  private Integer studentPaperId;
	  private Integer openCourseId;//开课Id
	  private Integer videoId;//视频Id
	  private String title;
	  private String courseName;
	  private Date studyEndDate;
	  private String studyEndDateStr;
	  private Integer paperId;
	  private Integer isSubmit;//是否完成 1完成 0未完成

}
