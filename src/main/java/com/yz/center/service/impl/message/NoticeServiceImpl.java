package com.yz.center.service.impl.message;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yz.center.dao.message.NoticeDao;
import com.yz.center.model.po.message.NoticePo;
import com.yz.center.model.vo.BaseConditionVO;
import com.yz.center.model.vo.message.NoticeVo;
import com.yz.center.service.iface.message.NoticeService;
import com.yz.center.util.CommonUtil;
import com.yz.center.util.common.PageBean;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月15日 下午3:57:10 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{
	@Resource
	private NoticeDao noticeDao;
	
	@Override
	public Integer addNotice(NoticePo noticePo,Integer userId) {
		noticePo.setClickNum(0);
		noticePo.setUserId(userId);
		try {
			noticeDao.addNotice(noticePo);
		} catch (Exception e) {
			System.out.println(e);
			return CommonUtil.FLAG_FAILD;
		}
		
		return CommonUtil.FLAG_SUCESS;
	}

	@Override
	public Integer updateNotice(NoticePo noticePo) {
		
		int flag = noticeDao.updateNotice(noticePo);
		if (flag ==1) {
			
			return CommonUtil.FLAG_SUCESS;
		}
		return CommonUtil.FLAG_FAILD;
	}

	@Override
	public Integer del(Integer noticeId) {
		try {
			noticeDao.del(noticeId);
		} catch (Exception e) {
			return CommonUtil.FLAG_FAILD;
		}
		
		return CommonUtil.FLAG_SUCESS;
	}

	@Override
	public Integer delAll(int[] noticeIds) {
		try {
			noticeDao.delAll(noticeIds);
		} catch (Exception e) {
			System.out.println(e);
			return CommonUtil.FLAG_FAILD;
		}
		
		return CommonUtil.FLAG_SUCESS;
	}

	@Override
	public PageBean findNoticePos(PageBean pageBean) {
		int count = noticeDao.selectPageCount(pageBean);
		pageBean.setTotalPage(count);
		List<NoticeVo> list = noticeDao.findNoticePos(pageBean);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public NoticeVo findNoticePoById(Integer noticeId) {
		NoticeVo noticeVo = noticeDao.findNoticePoById(noticeId);
		NoticePo noticePo = new NoticePo();
		
		Integer clickNum = noticeVo.getClickNum()+1;
		noticePo.setClickNum(clickNum);
		noticePo.setNoticeId(noticeId);
		noticeDao.updateClickNum(noticePo);
		return noticeVo;
	}



	@Override
	public List<NoticeVo> findIndexNotices() {
		
		return noticeDao.findIndexNotices();
	}

}
