
/**    
* @Title: DiscussTheme.java
* @Package com.yz.center.model.po.discuss
* Description: TODO
* @author: 
* @date: 2016年12月19日 上午11:18:13 
* @version V1.0 
*   
*/  

package com.yz.center.model.po.discuss;

import java.io.Serializable;
import java.util.Date;

import com.yz.center.model.po.course.OpenCoursePo;

import lombok.Data;

/**  
* Description: TODO
* @author Administrator  
* @date: 2016年12月19日 上午11:18:13 
* @version V1.0   
*/
@Data
public class DiscussThemePo implements Serializable{
	
		/**  
		  * @Fields serialVersionUID : TODO 
	     */  
	
	private static final long serialVersionUID = 1L;
	private Integer themeId;
	private Integer userId;
	private String userName;
	private OpenCoursePo openCoursePo;
	private String title;
	private Integer verify;
	private Date createDate;
	private Integer sort;
	private Integer isTop;
	private Integer isEnable;
	
	
	
}
