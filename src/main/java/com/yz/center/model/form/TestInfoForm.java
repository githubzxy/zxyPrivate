
/**    
* @Title: TestInfoForm.java
* @Package com.yz.center.model.form
* @Description: TODO
* @author: 
* @date: 2017年1月11日 下午4:44:03 
* @version V1.0 
* @Copyright 亚卓教育
*   
*/  

package com.yz.center.model.form;

import java.util.Date;

import lombok.Data;

/**  
* @Description: TODO
* @author: 
* @date: 2017年1月11日 下午4:44:03 
* @version V1.0   
*/
@Data
public class TestInfoForm {
	private Integer paperId;
	private Integer Id;
	private Integer openId;
	private Integer videoId;
	private String videoName;
	private String title;
	private String paperIds;
	private Integer paperNum;
	private Integer subjectNum;
	private String courseName;
	private Date createDate;
	private String name;

}
