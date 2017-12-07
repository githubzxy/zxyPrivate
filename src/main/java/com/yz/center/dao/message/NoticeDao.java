package com.yz.center.dao.message;

import java.util.List;

import com.yz.center.model.po.message.NoticePo;
import com.yz.center.model.vo.BaseConditionVO;
import com.yz.center.model.vo.message.NoticeVo;
import com.yz.center.util.common.PageBean;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月15日 下午3:37:55 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
public interface NoticeDao {

	public void addNotice(NoticePo noticePo);

	public int updateNotice(NoticePo noticePo) ;

	public void del(Integer noticeId);

	public void delAll(int[] noticeIds) ;

	public List<NoticeVo> findNoticePos(PageBean pageBean) ;

	public NoticeVo findNoticePoById(Integer noticeId);

	public Integer selectPageCount(PageBean pageBean) ;

	public void updateClickNum(NoticePo noticePo);

	public List<NoticeVo> findIndexNotices();
}
