
/**    
* @Title: SysLogPo.java
* @Package com.yz.center.model.po.user
* Description: TODO
* @author: 
* @date: 2016年12月30日 下午2:37:40 
* @version V1.0 
*   
*/  

package com.yz.center.model.vo.log;

import java.util.Date;

import lombok.Data;

/**  
* Description: TODO
* @author Administrator  
* @date: 2016年12月30日 下午2:37:40 
* @version V1.0   
*/
@Data
public class SysLogVo {
	private Integer logId;
	private Integer typeId;
	private String type;//操作系统的类型 登录或者登出
	private String  loginName;
	private Integer userId;
	private String userName;
	private String ip;
	private String createDate;
	private String role;//身份
}
