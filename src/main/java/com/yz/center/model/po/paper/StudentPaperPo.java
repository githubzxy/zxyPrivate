
/**    
* @Title: studentPaperPo.java
* @Package com.yz.center.model.po.paper
* @Description: TODO
* @author: 
* @date: 2016年12月22日 上午11:11:40 
* @version V1.0 
* @Copyright 亚卓教育
*   
*/  

package com.yz.center.model.po.paper;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

/**  
* @Description: TODO
* @author: 
* @date: 2016年12月22日 上午11:11:40 
* @version V1.0   
*/
@Data
public class StudentPaperPo  implements Serializable {
	  private static final long serialVersionUID = 1L;//@Fields serialVersionUID : 
	  private Integer studentPaperId;
	  private Integer paperId;
	  private Integer id;
	  private Integer student_id;
	  private Integer schoolId;
	  private Integer openCourseId;//开课Id
	  private Integer videoId;
	  private Integer isExam;
	  private Integer isSubmit;
	  private Integer isMarking;
	  private Integer markingType;
	  private Float score;
	  private Date createDate;
	  private Date submitDate;
	  
}
