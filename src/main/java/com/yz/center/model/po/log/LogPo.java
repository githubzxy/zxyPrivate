package com.yz.center.model.po.log;

import java.util.Date;

import lombok.Data;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年10月26日 上午9:49:21 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
@Data
public class LogPo {
	private Integer logId;
	private Integer typeId;
	private Integer userId;
	private Date createDate;	
	private  Integer state;
}
