package com.yz.center.model.vo.message;

import java.util.Date;

import com.yz.center.model.po.message.MessagePo;
import com.yz.center.model.po.user.UserPo;

import lombok.Data;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年12月7日 下午2:12:19 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
@Data
public class MessageVo {
	private Integer messageId;
	private String title;
	private String content;
	private UserPo fromUser;
	private UserPo toUser;
	private Date fromDate;
	private Date toDate;
	private Integer isDelete;
	private MessagePo preMessage;
	private MessagePo nextMessage;
}
