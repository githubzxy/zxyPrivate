package com.yz.center.dao.video;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.yz.center.model.po.paper.PaperPo;
import com.yz.center.model.po.video.VideoPo;
import com.yz.center.util.common.PageBean;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月7日 上午11:30:05 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
public interface VideoDao {
	public List<VideoPo> findVideoByChapterIds(int[] chapterIds) ;
	public List<VideoPo> findVideoBySchoolId(int schoolId);
	public List<VideoPo> getVideoByCourseId(PageBean pageBean);//取得作业下的视频
	public Integer getVideoCount(PageBean pageBean);//统计作业下的视频数量
	public String getVideoUrlById(Integer videoId);//取得video的url路径
	public String getVideoUrlBychapterId(Integer chapterId);//取得video的url路径
	public List<String> getVideoUrlsBychapterId(Integer chapterId);//取得video的url路径
}