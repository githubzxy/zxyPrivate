
/**    
* @Title: FeedBackPo.java
* @Package com.yz.center.model.po.user
* Description: TODO
* @author: 
* @date: 2017年2月17日 上午10:40:37 
* @version V1.0 
*   
*/  

package com.yz.center.model.po.user;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

/**  
* Description: TODO
* @author Administrator  
* @date: 2017年2月17日 上午10:40:37 
* @version V1.0   
*/
@Data
public class FeedBackPo implements Serializable{
	
		/**  
		  * @Fields serialVersionUID : TODO 
	     */  
	
	private static final long serialVersionUID = 1L;
	private int id;
	private int typeId;
	private String title;
	private String content;
	private String phone;
	private Date createDate;
	private Date handleDate;
	private int isSolve;
	private int state;
}