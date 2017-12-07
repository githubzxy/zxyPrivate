
/**    
* @Title: TestStatisticsCheckForm.java
* @Package com.yz.center.model.form
* @Description: TODO
* @author: 
* @date: 2017年1月4日 下午3:51:30 
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
* @date: 2017年1月4日 下午3:51:30 
* @version V1.0   
*/
@Data
public class TestStatisticsCheckForm {
	private Integer number;//学生学号
	private String name;//学生姓名
	private String className; 
	private String gradeName;
	private String phone;//电话
	private Float score;//分数
	private Date submitDate;//提交时间
	

}
