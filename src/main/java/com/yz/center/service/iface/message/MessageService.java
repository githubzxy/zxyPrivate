package com.yz.center.service.iface.message;

import java.util.List;

import com.yz.center.model.po.message.MessagePo;
import com.yz.center.model.vo.message.MessageVo;
import com.yz.center.util.common.PageBean;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年12月7日 下午2:00:33 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
public interface MessageService {


	public PageBean findMessagePos(PageBean pageBean);

	public MessageVo findMessageById(Integer messageId);

	public Integer addMessage(MessagePo messagePo, Integer[] toUserIds, Integer userId);

	public Integer updateMessage(MessagePo messagePo);

	public Integer delAll(int[] messageIds);

	public Integer del(Integer messageId);

	
	/**   
	* Title: findMessageBytoUserId 
	* Description: 查询用户自己的通知
	* @param userId
	* @return
	* @author Administrator 
	*/
	
	public List<MessagePo> findMessageBytoUserId(Integer userId);

	
	/**   
	* Title: findStudentMessageById 
	* Description: TODO  
	* @param messageId
	* @return
	* @author Administrator 
	*/
	
	public MessageVo findStudentMessageById(Integer messageId,Integer userId);

	


}
