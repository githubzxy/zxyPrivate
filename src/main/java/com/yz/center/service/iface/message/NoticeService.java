package com.yz.center.service.iface.message;

import java.util.List;

import com.yz.center.model.po.message.NoticePo;
import com.yz.center.model.vo.BaseConditionVO;
import com.yz.center.model.vo.message.MessageVo;
import com.yz.center.model.vo.message.NoticeVo;
import com.yz.center.util.common.PageBean;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月15日 下午3:35:39 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
public interface NoticeService {
	
	public Integer addNotice(NoticePo noticePo,Integer userId);
	
	public Integer updateNotice(NoticePo noticePo);
	
	public Integer del(Integer noticeId);
	
	public Integer delAll(int[] noticeIds);
	
	public PageBean findNoticePos(PageBean pageBean);
	
	public NoticeVo findNoticePoById(Integer noticeId);
	/**
	 * 查询首页公告
	 * @return
	 */
	public List<NoticeVo> findIndexNotices();
	
}
