
/**    
* @Title: StatisticsController.java
* @Package com.yz.center.controller.statistics
* Description: TODO
* @author: 
* @date: 2017年1月4日 上午11:37:48 
* @version V1.0 
*   
*/  

package com.yz.center.controller.statistics;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yz.center.model.form.statitics.StudentCourseStatitics;
import com.yz.center.model.po.course.OpenCoursePo;
import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.model.vo.course.OpenCourseVo2;
import com.yz.center.service.iface.statistics.StatisticsService;
import com.yz.center.service.iface.student.StudentService;
import com.yz.center.util.Static;
import com.yz.center.util.common.PageBean;

/**  
* Description: 统计模块控制器
* @author Administrator  
* @date: 2017年1月4日 上午11:37:48 
* @version V1.0   
*/
@Controller 
@RequestMapping("admin/statistics")
public class StatisticsController {
	@Resource
	private StatisticsService statisticsService;
	@Resource
	private StudentService studentService;
	
	@RequestMapping(value ="/videoStatistics", method=RequestMethod.GET)
	public String toVideoStatistics(ModelMap map,HttpSession session){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		List<OpenCoursePo> courses=statisticsService.getCourseBySchool(school.getSchoolId());
		map.addAttribute("courses", courses);
		return "admin/statistics/video/videoStatistics";
	}
	
	@RequestMapping(value ="/videoStatistics", method=RequestMethod.POST)
	@ResponseBody
	public ModelMap getVideoStatistics(PageBean pageBean,HttpSession session){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		pageBean.setSchoolId(school.getSchoolId());
		pageBean = statisticsService.getVideosByCourse(pageBean);
		ModelMap map = new ModelMap();
		map.addAttribute("page", pageBean);
		return map;
	}
	
	@RequestMapping(value="/videoStatisticsCheck",method = RequestMethod.GET)
	public String toVideoStatistics(Integer courseId, Integer videoId,ModelMap model){
		model.addAttribute("courseId", courseId);
		model.addAttribute("videoId", videoId);
		return "admin/statistics/video/videoStatisticsCheck";
	}
	
	@RequestMapping(value ="/videoStatisticsCheck", method = RequestMethod.POST)
	@ResponseBody
	public ModelMap getVideoStatistics(Integer pageNum,PageBean pageBean,String videoName){
		pageBean.setKeyWords(videoName);
		pageBean =statisticsService.getWatchStudentByVideo(pageBean);
		ModelMap map = new ModelMap();
		map.addAttribute("page",pageBean);
		return map;
	}
	
	
	@RequestMapping(value = "/discussStatistics",method = RequestMethod.GET)
	public String toDiscussStatistics(HttpSession session,ModelMap map){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		List<OpenCoursePo> courses=statisticsService.getOpenCourseBySchool(school.getSchoolId());
		map.addAttribute("courses", courses);
		return "admin/statistics/discuss/discussStatistics";
	}
	
	@RequestMapping(value = "/discussStatistics", method = RequestMethod.POST)
	@ResponseBody
	public ModelMap getDiscussStatistics(PageBean pageBean,HttpSession session,String name,String number){
		pageBean = statisticsService.getDiscussTheme(pageBean,name,number);
		ModelMap map = new ModelMap();
		map.addAttribute("page", pageBean);
		return map;
	}
	
	@RequestMapping("/discussStatisticsCheck")
	public String discussStatisticsCheck(){
		return "admin/statistics/discuss/discussStatisticsCheck";
	} 
	
	@RequestMapping(value = "/courseStatistics.html", method = RequestMethod.GET)
    public String toCourseStatistics() {
		return "/admin/statistics/course/courseStatistics";
	}
	
    @RequestMapping(value = "/courseStatistics.html", method = RequestMethod.POST)
    @ResponseBody
    public ModelMap getCourseStatistics(PageBean pageBean,String courseName,Integer isEnd,HttpSession session) {
    	SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
    	pageBean.setSchoolId(school.getSchoolId());
    	pageBean = statisticsService.getCourseStatistics(pageBean,courseName,isEnd);
    	ModelMap model = new ModelMap();
    	model.addAttribute("page", pageBean);
		return model;
	}
    @RequestMapping("/toCourseStatisticschar.html")
    public String toCourseStatisticschar(Integer openId,String courseName,ModelMap modelMap){
    	OpenCourseVo2 openCourseVo2 = statisticsService.getCourseStatisticschar(openId);
    	openCourseVo2.setCourseName(courseName);
    	modelMap.addAttribute("openCourseVo2", openCourseVo2);
		return "/admin/statistics/course/courseStatisticsChar";
    	
    	
    }
    
    @RequestMapping(value="/studentOfCourseStatistics.html",method = RequestMethod.GET)
    public String toStudentOfCourseStatistics(Integer openId,ModelMap map,HttpSession session){
    	SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		map.put("grades",studentService.getGradeList(school.getSchoolId()));
    	map.addAttribute("openId", openId);
		return "/admin/statistics/course/studentOfcourseStatistics";
    }
    
    @RequestMapping(value="/studentOfCourseStatistics.html",method = RequestMethod.POST)
    @ResponseBody
    public ModelMap getStudentOfCourseStatistics(PageBean pageBean,StudentCourseStatitics studentCourseStatitics,HttpSession session){
    	SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
    	pageBean.setSchoolId(school.getSchoolId());
    	pageBean = statisticsService.getStudentOfCourseStatistics(pageBean,studentCourseStatitics);
    	ModelMap model = new ModelMap();
    	model.addAttribute("page", pageBean);
		return model;
    }
    
	@RequestMapping(value = "/homeworkStatistics",method = RequestMethod.GET)
	public String toHomeworkStatistics(ModelMap map,HttpSession session){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		List<OpenCoursePo> courseList = statisticsService.getCourseName(school.getSchoolId(),1);//useType=1表作业
		map.addAttribute("courseList", courseList);
		return  "admin/statistics/homework/homeworkStatistics";
	}
	@RequestMapping(value = "/homeworkStatistics",method = RequestMethod.POST)
	@ResponseBody
	public ModelMap homeworkStatistics(PageBean pageBean,HttpSession session){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		pageBean.setSchoolId(school.getSchoolId());
		pageBean = statisticsService.getHwInfo(pageBean,1,0);//useType=1 isExam=0表示作业
		ModelMap model = new ModelMap();
		model.addAttribute("page", pageBean);
		return model;
	}
	@RequestMapping(value = "/homeworkStatisticsCheck",method = RequestMethod.GET)
	public String toHomeworkStatisticsCheck(ModelMap map,Integer Id,HttpSession session){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		map.put("grades",studentService.getGradeList(school.getSchoolId()));
		map.addAttribute("Id", Id);
		return  "admin/statistics/homework/homeworkStatisticsCheck";
	}
	@RequestMapping(value ="/homeworkStatisticsCheck", method = RequestMethod.POST)
	@ResponseBody
	public ModelMap homeworkStatisticsCheck(PageBean pageBean,String name,String number,Integer classId,Integer gradeId,Integer Id,HttpSession session){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		pageBean.setSchoolId(school.getSchoolId());
		pageBean = statisticsService.testStatisticsCheck(pageBean, name, number, classId, gradeId,Id,1);
		ModelMap model = new ModelMap();
		model. addAttribute("page", pageBean);
		return model;
	}
	@RequestMapping(value = "testStatistics", method = RequestMethod.GET)
	public String toTestStatistics(ModelMap map , HttpSession session){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		List<OpenCoursePo> courseList = statisticsService.getCourseName(school.getSchoolId(),2);//useType=2表考试
		map.addAttribute("courseList", courseList);
		return  "admin/statistics/test/testStatistics";
	}
	
	@RequestMapping(value = "/testStatistics", method = RequestMethod.POST)
	@ResponseBody
	public ModelMap testStatistics(PageBean pageBean, HttpSession session){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		pageBean.setSchoolId(school.getSchoolId());
		pageBean = statisticsService.getHwInfo(pageBean,2,1);//useType=2 isExam=1表示考试
		ModelMap model = new ModelMap();
		model.addAttribute("page", pageBean);
		return model;
	}
	@RequestMapping(value = "/testStatisticsCheck",method = RequestMethod.GET)
	public String toTestStatisticsCheck(ModelMap map,Integer Id,HttpSession session){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		map.put("grades",studentService.getGradeList(school.getSchoolId()));
		map.addAttribute("Id",Id);
		return  "admin/statistics/test/testStatisticsCheck";
	}
	@RequestMapping(value ="/testStatisticsCheck", method = RequestMethod.POST)
	@ResponseBody
	public ModelMap testStatisticsCheck(PageBean pageBean,String name,String number,Integer classId,Integer gradeId,Integer Id,HttpSession session){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		pageBean.setSchoolId(school.getSchoolId());
		pageBean = statisticsService.testStatisticsCheck(pageBean, name, number, classId, gradeId,Id,2);
		ModelMap model = new ModelMap();
		model. addAttribute("page", pageBean);
		return model;
	}
	
}
