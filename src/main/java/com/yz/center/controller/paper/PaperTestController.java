package com.yz.center.controller.paper;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yz.center.model.po.course.CourseTypePo;
import com.yz.center.model.po.course.OpenCoursePo;
import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.model.po.task.TaskPo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.model.po.video.VideoPo;
import com.yz.center.model.vo.paper.PaperForm;
import com.yz.center.model.vo.paper.PaperVo;
import com.yz.center.service.iface.homework.HomeworkService;
import com.yz.center.service.iface.paper.PaperService;
import com.yz.center.service.iface.test.TestService;
import com.yz.center.util.Static;
import com.yz.center.util.common.PageBean;
   @Controller
   @RequestMapping("/paper")
   public class PaperTestController {
   @Resource
   PaperService paperService;
   @Resource
   private TestService testService;
   @Resource
   private HomeworkService homeworkService;
   @RequestMapping("/topaper")
   public String topaper(){
   return "admin/testpaper/createpaper";
  }
   
/**   
* @Title: getcourses
* @Description: 取得课程列表 
* @param pageBean
* @return
* @author:
*/
@RequestMapping("/getcourses")
@ResponseBody
public ModelMap getcourses(PageBean pageBean,HttpSession session){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		Integer schoolId = school.getSchoolId();
	  pageBean.setSchoolId(schoolId);
	  ModelMap map=new ModelMap();
	  pageBean= paperService.getCourseList(pageBean);
	  map.put("page", pageBean);
	   return map;	  
}
/**   
* @Title: getcoursesOftest
* @Description: 取得考试下课程列表 
* @param pageBean
* @return
* @author:
*/
@RequestMapping("/getcoursesOftest")
@ResponseBody
public ModelMap getcoursesOftest(PageBean pageBean,HttpSession session){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		Integer schoolId = school.getSchoolId();
	  pageBean.setSchoolId(schoolId);
	  ModelMap map=new ModelMap();
	  pageBean= paperService.getcoursesOftest(pageBean);
	  map.put("page", pageBean);
	   return map;	  
}
/**   
* @Title: getcoursesOfhomework
* @Description: 取得作业下课程列表 
* @param pageBean
* @return
* @author:
*/
@RequestMapping("/getcoursesOfhomework")
@ResponseBody
public ModelMap getcoursesOfhomework(PageBean pageBean,HttpSession session){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		Integer schoolId = school.getSchoolId();
	  pageBean.setSchoolId(schoolId);
	  ModelMap map=new ModelMap();
	  pageBean= paperService.getcoursesOfhomework(pageBean);
	  map.put("page", pageBean);
	   return map;	  
}
   
   /**   
	* @Title: getPaperByIdOfTest
	* @Description: 取得新建试卷下的试卷列表 
	* @param pageBean
	* @param openId  开课ID
	* @param session
	* @return
	* @author:
	*/
	@ResponseBody
	@RequestMapping("/getPaperByIdOfTest.html")
	public ModelMap getPaperByIdOfTest(PageBean pageBean,HttpSession session){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		Integer schoolId = school.getSchoolId();
		pageBean.setSchoolId(schoolId);
		pageBean= paperService.getPaperByIdOfTest(pageBean);
		ModelMap model = new ModelMap();
		return model.addAttribute("page", pageBean);	
	}
	/**   
	* @Title: getPaperByIdOfHomework
	* @Description: 取得新建作业下的试卷列表 
	* @param pageBean
	* @param session
	* @return
	* @author:
	*/
	@ResponseBody
	@RequestMapping("/getPaperByIdOfHomework.html")
	public ModelMap getPaperByIdOfHomework(PageBean pageBean,HttpSession session){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		Integer schoolId = school.getSchoolId();
		pageBean.setSchoolId(schoolId);
		pageBean= paperService.getPaperByIdOfHomework(pageBean);
		ModelMap model = new ModelMap();
		return model.addAttribute("page", pageBean);	
	}
	/**   
	 * @Title: toNewTest   
	 * @Description:跳转新建考试页面
	 * @param 
	 */
	@RequestMapping("/toNewTest")
	public String toNewTest(){
		return "admin/test/newTest";

	}
   
   
/**   
* Title: createPaper 
* Description: TODO  
* @param paperForm
* @return
* @author Administrator 
*/
@RequestMapping("/createPaper")
   @ResponseBody
   public ModelMap createPaper(PaperForm paperForm,HttpSession session){
	SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
	UserPo userPo = (UserPo)session.getAttribute(Static.LOGIN_USER_SESSION);
	paperForm.setTeacherId(userPo.getTeacherPo().getTeacherId());
	   ModelMap map=new ModelMap();
	   try{
		   int flag=paperService.addpapers(paperForm,school.getSchoolId());  
	   map.addAttribute("flag",1);
	   }catch(Exception e){
		   map.addAttribute("flag",0);
		   e.printStackTrace();
	   }
	   return map;
   }
   
   
/**   
* @Title: getvideos
* @Description: TODO  
* @param pageBean
* @return
* @author:
*/
@RequestMapping("/getvideos")
   @ResponseBody
   public ModelMap getvideos(PageBean pageBean,HttpSession session){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		Integer schoolId = school.getSchoolId();
	    pageBean.setSchoolId(schoolId);
	    pageBean=paperService.getVideoList(pageBean);
	    ModelMap map=new ModelMap();
	    map.put("page", pageBean);
	   return map;
   }

@RequestMapping("/getvideosOfcreatePaper")
@ResponseBody
public ModelMap getvideosOfcreatePaper(PageBean pageBean,HttpSession session){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		Integer schoolId = school.getSchoolId();
	    pageBean.setSchoolId(schoolId);
	    pageBean=paperService.getVideoAndsubjectNum(pageBean);
	    ModelMap map=new ModelMap();
	    System.out.println("huhuh"+pageBean.getList());
	    map.put("page", pageBean);
	   return map;
}

   @RequestMapping("/getsubjectcount")
   @ResponseBody
   public ModelMap getsubjectcount(Integer courseId,Integer subjectTypeId,Integer videoId,Integer functionId){
	   ModelMap modelMap=new ModelMap();
       Integer subjectCount=paperService.getcountBYopenIdANDsubjectType(courseId, subjectTypeId,1,videoId,functionId);
	   modelMap.addAttribute("subjectCount", subjectCount);
	   return modelMap;
   }
   
   /**   
	* @Title: homeworkAdd
	* @Description: 新增作业
	* @param taskPo
	* @return ModelMap  flag:1:成功，0:失败
	 *                   msg:提示信息
	*/
	@RequestMapping("/homeworkAdd")
	@ResponseBody
	public ModelMap taskAdd(TaskPo taskPo,HttpSession session){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		Integer schoolId = school.getSchoolId();
		UserPo  userPo = (UserPo)session.getAttribute(Static.LOGIN_USER_SESSION);
		Integer userId = userPo.getUserId();		
		taskPo.setSchoolId(schoolId);
		taskPo.setCreateUserId(userId);
		ModelMap model = new ModelMap();
		int flag = homeworkService.homeworkAdd(taskPo);
		if(0 == flag){
			return model.addAttribute("flag", flag)
					.addAttribute("msg", "新建失败");
		}
		return model.addAttribute("flag", flag).addAttribute("msg", "新建成功");  
	}
	/**   
	 * @Title: testAdd   
	 * @Description:新建考试
	 * @param taskPo 新建的考试信息
	 * @return ModelMap  flag:1:成功，0:失败
	 *                   msg:提示信息
	 */
	@RequestMapping("/testAdd")
	@ResponseBody
	public ModelMap testAdd(TaskPo taskPo,HttpSession session){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		Integer schoolId = school.getSchoolId();
		UserPo  userPo = (UserPo)session.getAttribute(Static.LOGIN_USER_SESSION);
		Integer userId = userPo.getUserId();
		taskPo.setSchoolId(schoolId);
		taskPo.setCreateUserId(userId);
		ModelMap model = new ModelMap();
		int flag = testService.testAdd(taskPo);
		if(0 == flag){
			return model.addAttribute("flag", flag)
					.addAttribute("msg", "新建失败");
		}
		return model.addAttribute("flag", flag).addAttribute("msg", "新建成功");  
	}
	
	@RequestMapping(value= "/list", method = RequestMethod.GET)
	public String toPaperList(HttpSession session,ModelMap map){
		//List<?> papers=null;
		List<CourseTypePo> types=null;
		//PageBean pageBean=new PageBean();
		//List<OpenCoursePo> courses=null;
		//List<VideoPo> videos=null;
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		Integer schoolId=school.getSchoolId();
		try{
		 //pageBean.setSchoolId(schoolId);
		 types=paperService.getCourseType(schoolId);
		//courses=paperService.getOpenCourse(pageBean.getCourseTypeId(), school.getSchoolId());
		//videos=paperService.getVideos(pageBean.getOpenId(),school.getSchoolId());
		 //papers=paperService.getPaper(pageBean).getList();
		}catch(Exception e){
			e.printStackTrace();
		}
		//System.out.println("zuizui"+papers);
		//map.addAttribute("papers",papers);
		map.addAttribute("types", types);
		//map.addAttribute("page", pageBean);
		//map.addAttribute("courses", courses);
		//map.addAttribute("videos", videos);
		return "admin/testpaper/paperList";
	}
	
	@RequestMapping(value= "/list", method = RequestMethod.POST)
	@ResponseBody
	public ModelMap pageList(HttpSession session,PageBean pageBean,Integer functionId){
		
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		pageBean.setSchoolId(school.getSchoolId());
		Map<String,Object> params = new HashMap<String,Object>();
		List<CourseTypePo> types=paperService.getCourseType(school.getSchoolId());
		params.put("functionId", functionId);
		pageBean.params = params;
		pageBean = paperService.getPaper(pageBean);
	
		ModelMap map = new ModelMap();
		map.addAttribute("page", pageBean);
		map.addAttribute("types", types);
		return map;
	}
	
	@RequestMapping("/getCourseByType")
	@ResponseBody
	public ModelMap getCourseByType(Integer courseTypeId){
		ModelMap map=new ModelMap();
		List<OpenCoursePo> courses=paperService.getOpenCourse(courseTypeId, 1);
		map.put("courses", courses);
		return map;
	}
	@RequestMapping("/getVideoByOpenCourse")
	@ResponseBody
	public ModelMap getVideoByOpenCourse(Integer openId){
		ModelMap map=new ModelMap();
		List<VideoPo> videos=paperService.getVideos(openId,1);
		map.put("videos", videos);
		return map;
	}
	@RequestMapping("/delete")
	@ResponseBody
	public ModelMap delete(Integer paperId){
		  ModelMap modelMap=new ModelMap();
			try{
			if(paperService.delete(paperId)>=1){
			modelMap.addAttribute("flag", 1);
			}else{
				modelMap.addAttribute("flag", 0);
			}
			}catch(Exception e){
				modelMap.addAttribute("flag", 0);
			}
			return modelMap;
	}
	@RequestMapping("/deleteAll")
	@ResponseBody
	public ModelMap deleteAll(@RequestParam(value="paperIds[]") Integer paperIds[]){
		
		 ModelMap modelMap=new ModelMap();
			try{
			paperService.deleteAll(paperIds);
			modelMap.addAttribute("flag", 1);
			}catch(Exception e){
				modelMap.addAttribute("flag", 0);
			}
			return modelMap;
	}
}
