
/**    
* @Title: paperTimePo.java
* @Package com.yz.center.model.po.timeLimit
* @Description: TODO
* @author: 
* @date: 2016年12月29日 下午5:16:42 
* @version V1.0 
* @Copyright 亚卓教育
*   
*/  

package com.yz.center.model.po.timeLimit;

import java.util.Date;

import lombok.Data;

/**  
* @Description: TODO
* @author: 
* @date: 2016年12月29日 下午5:16:42 
* @version V1.0   
*/
@Data
public class PaperTimePo {
	private Integer studentPaperId;
	private String limitTime;
	private String startDate;
	private String  endDate;

}
