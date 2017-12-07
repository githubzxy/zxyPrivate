package com.yz.center.service.impl.message;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yz.center.dao.message.MessageDao;
import com.yz.center.model.po.message.MessagePo;
import com.yz.center.model.vo.BaseConditionVO;
import com.yz.center.model.vo.message.MessageVo;
import com.yz.center.service.iface.message.MessageService;
import com.yz.center.util.common.PageBean;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年12月7日 下午2:01:09 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
@Service("messageService")
public class MessageServiceImpl implements MessageService{
	@Resource
	private MessageDao messageDao;

	@Override
	public PageBean findMessagePos(PageBean pageBean) {
		int count = messageDao.selectPageCount(pageBean);
		pageBean.setTotalPage(count);
		List<MessageVo> msgs = messageDao.findMessagePos(pageBean);
		pageBean.setList(msgs);
		return pageBean;
	}

	@Override
	public MessageVo findMessageById(Integer messageId) {
		return messageDao.findMessageById(messageId);
	}

	@Override
	public Integer addMessage(MessagePo messagePo,Integer toUserIds[], Integer userId) {
		List<MessagePo> messagePos = new ArrayList<MessagePo>();
		for(int i = 0;i<toUserIds.length;i++){
			MessagePo messagePo2 = new MessagePo();
			messagePo2.setContent(messagePo.getContent());
			messagePo2.setTitle(messagePo.getTitle());
			messagePo2.setFromUserId(userId);
			messagePo2.setToUserId(toUserIds[i]);
			messagePos.add(messagePo2);
		}
		Integer flag = messageDao.addMessage(messagePos);
		return flag;
	}

	@Override
	public Integer updateMessage(MessagePo messagePo) {
		Integer flag = messageDao.updateMessage(messagePo);
		return flag;
	}

	@Override
	public Integer delAll(int[] messageIds) {
		Integer flag = messageDao.delAll(messageIds);
		return flag;
	}

	@Override
	public Integer del(Integer messageId) {
		Integer flag = messageDao.del(messageId);
		return flag;
	}

	
	/** 
	* Title: findMessageBytoUserId
	* Description: 
	* @see com.yz.center.service.iface.message.MessageService#findMessageBytoUserId(java.lang.Integer)  
	*/
	
	@Override
	public List<MessagePo> findMessageBytoUserId(Integer userId) {
		
		return messageDao.findMessageBytoUserId(userId);
	}

	
	/** 
	* Title: findStudentMessageById
	* Description: 
	* @see com.yz.center.service.iface.message.MessageService#findStudentMessageById(java.lang.Integer)  
	*/
	
	@Override
	public MessageVo findStudentMessageById(Integer messageId,Integer userId) {
		MessageVo messageVo = messageDao.findMessageById(messageId);
		//找到wode通知的前一条通知
		MessagePo preMessage  = new MessagePo();
		preMessage = messageDao.findPreMessageById(messageId,userId);
		messageVo.setPreMessage(preMessage);
		MessagePo nextMessage = new MessagePo();
		nextMessage = messageDao.findNextMessageById(messageId,userId);
		messageVo.setNextMessage(nextMessage);
		return messageVo;
	}

}