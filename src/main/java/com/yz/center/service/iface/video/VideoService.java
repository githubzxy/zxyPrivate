package com.yz.center.service.iface.video;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yz.center.model.po.paper.PaperPo;
import com.yz.center.model.po.video.VideoPo;
import com.yz.center.util.common.PageBean;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月7日 上午11:27:23 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
public interface VideoService {
		public List<VideoPo> findVideoByChapterIds(int chapterIds[]);
		public List<VideoPo> findVideoBySchoolId(int schoolId);
		public List<VideoPo> getVideoByCourseId(PageBean pageBean);
		
}
