package com.yz.center.model.po.message;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年12月7日 下午2:02:48 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
@Data
public class MessagePo implements Serializable {
	/**
	 * @Description
	 * @author
	 * @Title
	 * @param
	 * @return
	 */
	private static final long serialVersionUID = 1L;
	private Integer messageId;
	private String title;
	private String content;
	private Integer fromUserId;
	private Integer toUserId;
	private Date fromDate;
	private Date toDate;
	private Integer isDelete;
	
}
