package com.yz.center.model.po.user;

import java.io.Serializable;

import lombok.Data;


/**  
 * 登录账户信息实体类
* @Description: 登录账户信息实体类
* @author: 
* @date: 2017年1月7日 下午5:48:51 
* @version V1.0   
*/
@Data
public class LoginPo implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private Integer loginId;
	private Integer schoolId;
	private String loginName;
	private String loginPwd;
	private String roleCode;
	
}
