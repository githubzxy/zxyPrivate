package com.yz.center.service.impl.video;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yz.center.dao.video.VideoDao;
import com.yz.center.model.po.paper.PaperPo;
import com.yz.center.model.po.video.VideoPo;
import com.yz.center.service.iface.video.VideoService;
import com.yz.center.util.common.PageBean;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月7日 上午11:28:18 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
@Service("videoService")
public class VideoServiceImpl implements VideoService{
	@Resource
	private VideoDao videoDao;

	@Override
	public List<VideoPo> findVideoByChapterIds(int[] chapterIds) {
		// TODO Auto-generated method stub
		return videoDao.findVideoByChapterIds(chapterIds);
	}

	@Override
	public List<VideoPo> findVideoBySchoolId(int schoolId) {
		// TODO Auto-generated method stub
		return videoDao.findVideoBySchoolId(schoolId);
	}

	@Override
	public List<VideoPo> getVideoByCourseId(PageBean pageBean) {
		// TODO Auto-generated method stub
		return videoDao.getVideoByCourseId(pageBean);
	}

}
