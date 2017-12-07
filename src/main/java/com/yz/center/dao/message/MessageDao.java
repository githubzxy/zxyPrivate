package com.yz.center.dao.message;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yz.center.model.po.message.MessagePo;
import com.yz.center.model.vo.BaseConditionVO;
import com.yz.center.model.vo.message.MessageVo;
import com.yz.center.util.common.PageBean;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年12月7日 下午2:02:03 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
public interface MessageDao {

	public Integer selectPageCount(PageBean pageBean);

	public List<MessageVo> findMessagePos(PageBean pageBean);

	public MessageVo findMessageById(@Param("messageId")Integer messageId);

	public Integer addMessage(List<MessagePo> messagePos);

	public Integer updateMessage(MessagePo messagePo);

	public Integer delAll(int[] messageIds);

	public Integer del(Integer messageId);

	
	/**   
	* Title: findMessageBytoUserId 
	* Description: TODO  
	* @param userId
	* @return
	* @author Administrator 
	*/
	
	public List<MessagePo> findMessageBytoUserId(Integer userId);

	

	
	/**   
	* Title: findNextMessageById 
	* Description: TODO  
	* @param messageId
	* @param userId
	* @return
	* @author Administrator 
	*/
	
	public MessagePo findNextMessageById(@Param("messageId")Integer messageId, @Param("userId")Integer userId);

	
	/**   
	* Title: findPreMessageById 
	* Description: TODO  
	* @param messageId
	* @param userId
	* @return
	* @author Administrator 
	*/
	
	public MessagePo findPreMessageById(@Param("messageId")Integer messageId, @Param("userId")Integer userId);

}
