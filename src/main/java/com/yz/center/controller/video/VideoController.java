package com.yz.center.controller.video;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.yz.center.model.po.course.CourseChapterPo;
import com.yz.center.model.po.paper.PaperPo;
import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.model.po.video.VideoPo;
import com.yz.center.service.iface.course.CourseChapterService;
import com.yz.center.service.iface.video.VideoService;
import com.yz.center.util.Static;
import com.yz.center.util.common.PageBean;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月10日 上午9:38:22 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */

/**  
* @Description: TODO
* @author: 
* @date: 2017年1月18日 上午10:42:07 
* @version V1.0   
*/
@Controller
@RequestMapping("/video")
public class VideoController {
	@Resource
	private CourseChapterService courseChapterService;
	@Resource
	private VideoService videoService;
	@ResponseBody
	@RequestMapping("/findVideo.html")
	public ModelMap findVideoByCourseId(ModelMap model,Integer courseId){
		List<CourseChapterPo> courseChapterPos = courseChapterService.findCourseChapterByCourseId(courseId);
		int chapterIds[] = new int[courseChapterPos.size()];
		for(int i = 0;i<courseChapterPos.size();i++){
			chapterIds[i]=courseChapterPos.get(i).getChapterId();
		}
		if(chapterIds!=null&chapterIds.length!=0){
			List<VideoPo> videoPos = videoService.findVideoByChapterIds(chapterIds);
			return model.addAttribute("videoPos", videoPos)
						.addAttribute("flag","1");
		}else {
			return model.addAttribute("flag", "1")
						.addAttribute("msg", "该课程下没有视频！");
		}
			
	}
	@ResponseBody
	@RequestMapping("/getVideos.html")
	public ModelMap getVideoByCourseId(PageBean pageBean){
		List<VideoPo> videos = videoService.getVideoByCourseId(pageBean);
		ModelMap model = new ModelMap();
		return model.addAttribute("videos", videos);	
	}
	
}
