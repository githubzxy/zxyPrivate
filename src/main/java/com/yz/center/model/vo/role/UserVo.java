
/**    
* @Title: UserVo.java
* @Package com.yz.center.model.vo.role
* @Description: 
* @author: lcy
* @date: 2017年2月24日 上午9:14:31 
* @version V1.0 
* @Copyright 亚卓教育
*   
*/  

package com.yz.center.model.vo.role;

import lombok.Data;

/**  
* @Description: 用于用户角色修改
* @author: lcy
* @date: 2017年2月24日 上午9:14:31 
* @version V1.0   
*/
@Data
public class UserVo {
	private Integer userId;
	private Integer loginId;
	private Integer teacherId;
}
