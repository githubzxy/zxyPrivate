package com.yz.center.model.vo;

import java.util.Date;

import lombok.Data;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年10月28日 上午9:16:17 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
@Data
public class BaseUser {
	
	 private Integer userId;
	 private String roleCode;
	 private String name;
	 private Integer loginId;
	 private String avatar;
	 private Date stopDate;
	 private Integer state;
	 private String dengluDate;
	 private Integer schoolId;
}
