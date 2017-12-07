
/**    
* @Title: HomeworkController.java
* @Package com.yz.center.controller.homework
* @Description: TODO
* @author: 
* @date: 2017年1月13日 下午3:03:29 
* @version V1.0 
* @Copyright 亚卓教育
*   
*/  

package com.yz.center.controller.homework;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yz.center.model.form.TestInfoForm;
import com.yz.center.model.po.course.OpenCoursePo;
import com.yz.center.model.po.paper.PaperPo;
import com.yz.center.model.po.paper.SubjectPo;
import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.service.iface.homework.HomeworkService;
import com.yz.center.service.iface.test.TestService;
import com.yz.center.util.Static;
import com.yz.center.util.common.PageBean;

/**  
* @Description: TODO
* @author: 
* @date: 2017年1月13日 下午3:03:29 
* @version V1.0   
*/
@Controller
@RequestMapping("/homework")
public class HomeworkController {
	@Resource 
	private HomeworkService homeworkService;
	@Resource 
	private TestService testService;
	   /**   
		 * @Title: toNewHomework   
		 * @Description:跳转新建作业 
		 */
		@RequestMapping("/toNewHomework")
		public String toNewHomework(){
			return "admin/homework/newHomework";

		}
		
//作业信息模块		
		/**  
		* @Title: toHomeWorkInfo
		* @Description:  跳转作业信息列表 
		* @return
		* @author:
		*/
		@RequestMapping("/toHomeworkInfo")
		public String toHomeworkInfo(ModelMap map,HttpSession session){
			
			SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
			Integer schoolId=school.getSchoolId();
			List<TestInfoForm> courseNames = homeworkService.getCourseNameOfHw(schoolId);
			List<TestInfoForm> videoNames = homeworkService.getVideoNameOfHw(schoolId);
			map.addAttribute("courseNames", courseNames);
			map.addAttribute("videoNames", videoNames);
			return  "admin/homework/homeworkInfo";
		}
		
		
		/**   
		* @Title: homeworkInfo 作业信息
		* @Description: TODO  
		* @param pageBean
		* @param courseName
		* @param videoName
		* @param title
		* @return
		* @author:
		*/
		@RequestMapping("/homeworkInfo")
		@ResponseBody
		public ModelMap homeworkInfo(String courseName,String videoName,String title,PageBean pageBean,HttpSession session){
			SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
			pageBean.setSchoolId(school.getSchoolId());
			pageBean=homeworkService.getHomeworkInfo(pageBean,courseName, videoName, title);
			ModelMap map = new ModelMap();
			map.addAttribute("page", pageBean);
			return  map;
		}
		
		/**   
		* @Title: homeworkDelete
		* @Description: 删除作业
		* @param Id
		* @param paperIds
		* @param openId
		* @return map flag 0 删除失败
		*                  1 删除成功
		*                  3 已有学生在做题,不能删除
		* @author:
		*/
		@RequestMapping("/homeworkDelete")
		@ResponseBody
		public ModelMap homeworkDelete(Integer Id,Integer openId,HttpSession session){
			SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
			Integer schoolId=school.getSchoolId();
			Integer countOfDelete = testService.getCountOfDelete(Id, schoolId);
			ModelMap map = new ModelMap();
			if(countOfDelete==0){
				int flag= homeworkService.homeworkDelete(Id,openId);
				if(0 == flag){
		              map.addAttribute("flag", flag);
		              map.addAttribute("msg", "删除失败");
		         }else{
		        	 map.addAttribute("flag", flag);
		             map.addAttribute("msg", "删除成功");
		         }
			
			}else {
				 map.addAttribute("flag",3);
				 map.addAttribute("msg", "已有学生在做题,不能删除");
			}
			
			return map;
		}
		
		
		/**   
		* @Title: toGetPaperByPaperIdsOfHw
		* @Description: TODO  
		* @param paperIds
		* @param session
		* @return
		* @author:
		*/
		@RequestMapping("/toGetPaperByPaperIdsOfHw")
		public String toGetPaperByPaperIdsOfHw(String paperIds,HttpSession session){
			session.setAttribute("paperIds",paperIds);
			return  "admin/homework/homeworkPaperList";
		}
		
		
		/**   
		* @Title: getPaperByPaperIdsOfHw
		* @Description: TODO  
		* @param pageBean
		* @param title
		* @param session
		* @return
		* @author:
		*/
		@RequestMapping("/getPaperByPaperIdsOfHw")
		@ResponseBody
		public ModelMap getPaperByPaperIdsOfHw(PageBean pageBean,String title,HttpSession session){
			SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
			Integer schoolId = school.getSchoolId();
			String paperIds = (String)session.getAttribute("paperIds");
			pageBean.setSchoolId(schoolId);
			pageBean = homeworkService.getPaperByPaperIdsOfHw(pageBean, title, paperIds);
			ModelMap model = new ModelMap();
			return model.addAttribute("page", pageBean);
		}
		/**   
		* @Title: checkPaperOfHw
		* @Description: 查看试卷
		* @param paperIds 试卷id集合
		* @param session
		* @param map
		* @return
		* @author:
		*/
		@RequestMapping(value = "/checkPaperOfHw",method = RequestMethod.GET)
		public String toCheckPaper(Integer paperId,HttpSession session,ModelMap map){
			UserPo userPo = (UserPo)session.getAttribute(Static.LOGIN_USER_SESSION);
			 PaperPo paper = homeworkService.getPaperByPaperId(paperId,userPo.getTeacherPo().getTeacherId());
			 String scores = paper.getAnySubjectScore();
			 SubjectPo typeCount = homeworkService.getsubjectTypeCount(paper.getSubjectIds());
			 Integer ct1=typeCount.getCt1();
			 Integer ct2=typeCount.getCt2();
			 Integer ct3=typeCount.getCt3();
		     String[] score = scores.split(",");
		     if (ct1!=0) {
		    	 Integer typeScore1=Integer.parseInt(score[0]);
		    	 Integer score1=typeScore1/ct1;//type=2每道题分数
		    	 map.addAttribute("score1", score1);
		    	 map.addAttribute("typeScore1", typeScore1);
			}
		     if (ct2!=0) {
		    	 Integer typeScore2=Integer.parseInt(score[1]);
		    	 Integer score2=typeScore2/ct2;//type=2每道题分数
		    	 map.addAttribute("score2", score2);
		    	 map.addAttribute("typeScore2", typeScore2);
			}
		     if (ct3!=0) {
		    	 Integer typeScore3=Integer.parseInt(score[2]);
		    	 Integer score3=typeScore3/ct3;//type=2每道题分数
		    	 map.addAttribute("score3", score3);
		    	 map.addAttribute("typeScore3", typeScore3);
			}
		    
			 List<SubjectPo> hwTest = homeworkService.getHwTest(paper.getSubjectIds());
			 map.addAttribute("paper", paper);
			 map.addAttribute("hwTest", hwTest);
			 map.addAttribute("ct1", ct1);
			 map.addAttribute("ct2", ct2);
			 map.addAttribute("ct3", ct3);
			return "admin/homework/checkPaperOfHw";
		}
		

}