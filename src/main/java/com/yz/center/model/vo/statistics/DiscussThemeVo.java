
/**    
* @Title: DiscussThemeVo.java
* @Package com.yz.center.model.vo.statistics
* Description: TODO
* @author: 
* @date: 2017年1月5日 上午11:32:56 
* @version V1.0 
*   
*/  

package com.yz.center.model.vo.statistics;

import java.util.Date;

import lombok.Data;

/**  
* Description: TODO
* @author Administrator  
* @date: 2017年1月5日 上午11:32:56 
* @version V1.0   
*/
@Data
public class DiscussThemeVo {
	private Integer themeId;
	private String title;
	private Date createDate;
	private String userNumber;
	private String userName;
	private Integer replyNumber;
}