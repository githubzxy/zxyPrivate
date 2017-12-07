
/**    
* @Title: DiscussPo.java
* @Package com.yz.center.model.po.discuss
* Description: TODO
* @author: 
* @date: 2016年12月19日 上午11:17:45 
* @version V1.0 
*   
*/  

package com.yz.center.model.po.discuss;

import java.io.Serializable;
import java.util.Date;

import com.yz.center.model.po.user.UserPo;

import lombok.Data;

/**  
* Description: TODO
* @author Administrator  
* @date: 2016年12月19日 上午11:17:45 
* @version V1.0   
*/
@Data
public class DiscussPo implements Serializable{
	
		/**  
		  * @Fields serialVersionUID : TODO 
	     */  
	
	private static final long serialVersionUID = 1L;
	private Integer userId;
	private Integer discussId;
	private DiscussThemePo discussThemePo;
	private DiscussPo parentDiscuss;
	private String content;
	private Date createDate;
	private String timeInterval;
	private Integer verify;
	private String avatar;
	
}