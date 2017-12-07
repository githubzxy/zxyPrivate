/**
  * @FileName: MainIndexController.java
  * @Author 
  * @Description:
  * @Date 2016��10��24�� ����3:44:29
  * @CopyRight yazhuokj Corporation
  */
package com.yz.center.controller.index;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yz.center.dao.banner.BannerDao;
import com.yz.center.model.form.CourseInfoForm;
import com.yz.center.model.po.PageBean;
import com.yz.center.model.po.bannerPo.BannerPo;
import com.yz.center.model.po.comment.CommentPo;
import com.yz.center.model.po.course.CourseChapterPo;
import com.yz.center.model.po.course.CoursePo;
import com.yz.center.model.po.course.CourseTypePo;
import com.yz.center.model.po.course.LecturerPo;
import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.model.po.video.VideoPo;
import com.yz.center.model.vo.frontPage.DownLoadSourceVo;
import com.yz.center.model.vo.frontPage.OpenCourseChapterNameVo;
import com.yz.center.model.vo.frontPage.VideoPlayVo;
import com.yz.center.model.vo.message.NoticeVo;
import com.yz.center.service.iface.banner.BannerService;
import com.yz.center.service.iface.course.CourseChapterService;
import com.yz.center.service.iface.course.CourseService;
import com.yz.center.service.iface.frontPage.FrontPageService;
import com.yz.center.service.iface.lecturer.LecturerService;
import com.yz.center.service.iface.message.NoticeService;
import com.yz.center.service.iface.school.SchoolService;
import com.yz.center.service.iface.user.LoginService;
import com.yz.center.service.iface.user.UserService;
import com.yz.center.util.Static;


@RequestMapping("main")
@Controller
public class MainIndexController{
	@Resource
	private CourseChapterService chapterService;
	@Resource
	FrontPageService frontPageService;
	@Resource
	private LecturerService lecturerService;
	@Resource
	private CourseService courseService;
	@Resource 
	private NoticeService noticeService;
	@Resource
	private SchoolService schoolService;
	
	@Resource
	private LoginService loginService;
	@Resource
	private UserService userService;
	@Resource
	private BannerService bannerService;
    @RequestMapping("/index")
    public String index(Map<String,Object> map,HttpSession session,HttpServletRequest request){
		String host = request.getServerName();
		SchoolPo school = schoolService.findSchoolByUrl(host);
    	List<CourseTypePo> courseTypes=new ArrayList<CourseTypePo>(); 
    	List<CourseTypePo> parentTypes=frontPageService.getParentIds(school.getSchoolId());
    	List<LecturerPo> indexLecturers = lecturerService.findIndexLectures();
    	List<NoticeVo> indexNotices = noticeService.findIndexNotices();
    	List<BannerPo> bannerPos = bannerService.getIndexBanner(school.getSchoolId());
    	for(CourseTypePo parentType:parentTypes){
    		List<CourseTypePo> courseType=frontPageService.getCourseTypes(school.getSchoolId(), parentType.getCourseTypeId());
    		courseTypes.addAll(courseType);
    	}
    	map.put("courseTypes", courseTypes);
    	map.put("parentTypes",parentTypes);
    	map.put("indexLecturers", indexLecturers);
    	map.put("indexNotices", indexNotices);
    	map.put("bannerPos", bannerPos);
        return "home/index";
    }
    
    @RequestMapping("/category")
    public ModelAndView category(@RequestParam(value="pageNum", defaultValue="1") int pageNum,PageBean pageBean,HttpSession session){
    	pageBean.setPageNum(pageNum);
    	SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
    	pageBean.setSchoolId(school.getSchoolId());
    	ModelAndView modelAndView=new ModelAndView();
    	modelAndView.setViewName("home/category");
        
        List<CourseTypePo> courseTypes=new ArrayList<CourseTypePo>();
    	List<CourseTypePo> parentTypes=frontPageService.getParentIds(school.getSchoolId());
		for(CourseTypePo parentType:parentTypes){
			List<CourseTypePo> courseType=frontPageService.getCourseTypeNolimit(school.getSchoolId(), parentType.getCourseTypeId());
			courseTypes.addAll(courseType);
		}
		if(pageBean.getCourseTypeId()==null||"".equals(pageBean.getCourseTypeId())){
			
			Integer courseTypeId = courseTypes.get(0).getCourseTypeId();
			pageBean.setCourseTypeId(courseTypeId);
			
		}
		List<CoursePo> courses=frontPageService.getCourseByCourseTypeId(pageBean);
		System.out.println(pageBean.getCourseTypeId());
    	modelAndView.addObject("courses",courses);
    	modelAndView.addObject("page", pageBean);
    	modelAndView.addObject("parentTypes",parentTypes);
    	modelAndView.addObject("courseTypes", courseTypes);
    	System.out.println("我是课程："+courses);
    	System.out.println("课程个数："+courses.size());
    	return modelAndView;
    }
    //跳转课程目录界面
    @RequestMapping("/toChapter")
    public String toChapter(ModelMap map,Integer openId){
    	CourseInfoForm courseInfo = courseService.getCourseInfo(openId);
    	Integer courseId = courseInfo.getCourseId();
    	List<LecturerPo> lecturers = lecturerService.getlecturersByCourseId(courseId);
    	List<CourseChapterPo> children=new ArrayList<CourseChapterPo>();
  	     frontPageService.getChildrenChapters(children,0,openId);
  	     System.out.println(children);
  	    map.addAttribute("chapters", children);
    	map.addAttribute("lecturers",lecturers);
    	map.addAttribute("course",courseInfo);
        return "home/chapter";
      
    }

    
	@RequestMapping("/isHavaSonChapter")
	@ResponseBody
    public ModelMap isHaveSonChapter(Integer courseId,Integer chapterId){
    	ModelMap model =  new ModelMap();
    	List<CourseChapterPo> children=new ArrayList<CourseChapterPo>();
 	     frontPageService.getChildrenChapters(children,chapterId,courseId);
 	     System.out.println(children);
 	    List<CourseChapterPo> children2=new ArrayList<CourseChapterPo>();
 	     for(CourseChapterPo chapterPo :children){
 	    	 if (chapterPo.getParentId()==chapterId) {
				children2.add(chapterPo);
			}
 	     }
 	     System.out.println(children2);
 	    Integer flag;
 	     if (children2.size()!=0) {
 	    	 //有子目录
 	    	 flag=1;
		}else {
			 flag=0;
		}

		return model.addAttribute("flag", flag);
    	
    }
    
    /**   
     * @Title: getChapterSon   
     * @Description:取得章节下的小节 
     * @param chapterId 章节Id
     * @return ModelMap  
    */
    @RequestMapping(value ="/getChapterSon.html",method=RequestMethod.POST)	
	@ResponseBody
    public ModelMap getChapterSon(Integer chapterId,Integer courseId){
    	ModelMap model = new ModelMap();
    	CourseChapterPo chapterPo=new CourseChapterPo();
    	chapterPo.setCourseId(courseId);
    	chapterPo.setParentId(chapterId);
    	List<CourseChapterPo> chapterSonList = chapterService.getChapterList(chapterPo);
        return model.addAttribute("chapterSons", chapterSonList);
      
    }

    
    //跳转
    @RequestMapping("/toCourseCategories")
    public String toCourseCategories(){
        return "home/courseCategories";
      
    }
    @RequestMapping("/toCoursePlay")
    public String toCoursePlay(Map<String, Object> map,Integer openId,Integer chapterId,Integer parentId,Integer currentVideoId){
    	OpenCourseChapterNameVo name=frontPageService.getOpenCourseName(openId);
         map.put("CourseName",name);
     	int index = -1;
     	List<VideoPlayVo> videos=new ArrayList<VideoPlayVo>();
     	if(parentId!=null && parentId == 0){
     	   videos.add(frontPageService.getvideoBy(chapterId,openId));
     	}else{
     	   if(parentId==null){
               parentId=0;
           }
         	System.out.println("chapterId"+chapterId+"===parentId"+parentId+"===openId"+openId+"currentVideoId"+currentVideoId);
        	frontPageService.getVideosByChapters(videos, parentId, openId);
     	}
    	if(currentVideoId!=null){
        	for(int i = 0;i < videos.size();i++){
        		Integer varVideoId=videos.get(i).getVideoId();
        	    if(currentVideoId.equals(varVideoId)){
        	        index=i;
        	    }
        		
        	}
    	}
        map.put("videos", videos);
        map.put("chapterId", chapterId);
        map.put("openId",openId);
        map.put("currentVideoIndex",index);
    	return "home/coursePlay";
    }
    
    @RequestMapping("/getResourceByChapterId")
    @ResponseBody
    public List<DownLoadSourceVo> getResourceByChapterId(Integer chapterId,HttpSession session){
    	SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
        return frontPageService.getDownloadInfo(chapterId,school.getSchoolId());
    }
    @RequestMapping("/getVideoAfterComplete")
    @ResponseBody
    public ModelMap getVideoAfterComplete(Integer chapterId,Integer parentId){
    	ModelMap map=new ModelMap();
    	List<CourseChapterPo> chaptersofSon=frontPageService.getChaptersofSon(parentId, chapterId);
    	VideoPo video=null;
    	if(chaptersofSon!=null&&!chaptersofSon.isEmpty()){
    		 video=frontPageService.getvideoByChapterId(chaptersofSon.get(0).getChapterId());
    	}
        map.addAttribute("video", video);
    	return map;
    }
    @RequestMapping("/addComment")
    @ResponseBody
    public ModelMap addComment(CommentPo commentPo,HttpSession session){
    	UserPo userPo=(UserPo)session.getAttribute(Static.LOGIN_USER_SESSION);
    	commentPo.setUserId(userPo.getUserId());
    	Integer flag;
    	try{
    		Integer f=frontPageService.addComment(commentPo);
    		if(f>=1){
    			flag=1;
    		}else{
    			flag=0;
    		}
    	
    	}catch(Exception e){
    		flag=0;
    		e.printStackTrace();
    	}
    	ModelMap map=new ModelMap();
    	map.addAttribute("flag", flag);
    	return map;
    }
    @RequestMapping("/commentList")
    @ResponseBody
    public ModelMap commentList(HttpSession session,
    		@RequestParam(value="pageNum", defaultValue="1") Integer pageNum,PageBean pageBean){
    	SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
    	ModelMap map=new ModelMap();
    	pageBean.setPageSize(2);
    	pageBean.setPageNum(pageNum);
    	pageBean.setSchoolId(school.getSchoolId());
    	List<CommentPo> comments=frontPageService.getCommentList(pageBean);
    	map.put("comments",comments);
    	map.put("page", pageBean);
        return map;
    }
  
}