
/**    
* @Title: MyTestController.java
* @Package com.yz.center.controller.student
* @Description: TODO
* @author: 
* @date: 2016年12月22日 下午3:24:57 
* @version V1.0 
* @Copyright 亚卓教育
*   
*/  

package com.yz.center.controller.student;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yz.center.model.po.paper.PaperPo;
import com.yz.center.model.po.paper.StudentPaperPo;
import com.yz.center.model.po.paper.StudentSubjectPo;
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
* @date: 2016年12月22日 下午3:24:57 
* @version V1.0   
*/
@Controller
@RequestMapping("/student/test")
public class StuTestController {
	@Resource
	private TestService testService;
	@Resource
	private HomeworkService homeworkService;
	
	//我的考试
	@RequestMapping("toMyTest")
	public String myTest(PageBean pageBean,HttpSession session,ModelMap map){
		UserPo userPo = (UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
		SchoolPo schoolPo = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		Integer studentId = userPo.getStudentPo().getId();
		pageBean.setSchoolId(schoolPo.getSchoolId());
		pageBean.setUserId(userPo.getUserId());
		System.out.println(schoolPo.getSchoolId()+"--"+studentId);
		pageBean = testService.getTestListByUserId(pageBean,0,studentId);//0表示未考试
		map. addAttribute("page", pageBean);
		map. addAttribute("now", new Date());
		return "study/myTest";
	}
	@RequestMapping(value = "/examineAdd",method = RequestMethod.GET)
	public String examineAdd(Integer paperId,Integer studentPaperId,Integer openId,String title,ModelMap map,HttpSession session){
		UserPo userPo = (UserPo)session.getAttribute(Static.LOGIN_USER_SESSION);
		SchoolPo schoolPo = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		Integer schoolId = schoolPo.getSchoolId();
		String name = userPo.getName();//考生姓名
		PaperPo paper = homeworkService.getPaperByPaperId(paperId,userPo.getStudentPo().getId());
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
		Integer hour=testService.getlimitTime(openId,schoolId);
		List<SubjectPo> hwTest =testService.getExamine(paper.getSubjectIds());
		Date now = new Date();
		Calendar cal = Calendar.getInstance(); 
		cal.setTime(now); 
		//h = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"); //hh是以12制//HH是以24制
		SimpleDateFormat h= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String startDate = h.format(now);
		if (hour>0&hour!=null) {
			cal.add(Calendar.SECOND, hour*60);
			String limitTime = h.format(cal.getTime());
			map.addAttribute("limitTime",limitTime);	
		}
		
		map.addAttribute("paper", paper);
		map.addAttribute("hwTest", hwTest);
		map.addAttribute("ct1", ct1);
		map.addAttribute("ct2", ct2);
		map.addAttribute("ct3", ct3);
		map.addAttribute("studentPaperId", studentPaperId);
		map.addAttribute("name", name);
		map.addAttribute("title", title);
		map.addAttribute("startDate", startDate);
		return "study/examineAdd";
	}
	
	
		
	//考试列表
		@RequestMapping("toTestList")
		public String testList(PageBean pageBean,HttpSession session,ModelMap map){
			UserPo userPo = (UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
			SchoolPo schoolPo = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
			Integer studentId = userPo.getStudentPo().getId();
			pageBean.setSchoolId(schoolPo.getSchoolId());
			pageBean.setUserId(userPo.getUserId());
			pageBean= testService.getTestListByUserId(pageBean,1,studentId);//1表示已考试
			map.addAttribute("page",pageBean );
			return "study/testList";
		}
		@RequestMapping(value = "/examineAdd",method = RequestMethod.POST)
		@ResponseBody
		public ModelMap hwTestAdd(StudentSubjectPo studentSubjectPo,HttpSession session){
			UserPo userPo=(UserPo)session.getAttribute(Static.LOGIN_USER_SESSION);
			studentSubjectPo.setStudentId(userPo.getStudentPo().getId());
			int flag = testService.examineAdd(studentSubjectPo);
			ModelMap model = new ModelMap();
			 if(0 == flag){
	             return model.addAttribute("flag", flag)
	                         .addAttribute("msg", "提交失败!");
	         }
	         return model.addAttribute("flag", flag).addAttribute("msg", "提交成功!");
		}
		/**   
		* @Title: checkExamine 查看试卷
		* @Description: TODO  
		* @param studentPaperId
		* @param map
		* @param paperId
		* @return
		* @author:
		*/
		@RequestMapping(value = "/checkExamine",method = RequestMethod.GET)
		public String checkPaperOfStuHomework(Integer studentPaperId,ModelMap map,Integer paperId,HttpSession session){
			UserPo userPo = (UserPo)session.getAttribute(Static.LOGIN_USER_SESSION);
			String name = userPo.getName();//考生姓名
			PaperPo paper = homeworkService.getPaperByPaperId(paperId,userPo.getStudentPo().getId());
			StudentPaperPo sPP = homeworkService.getSubjectSubDateById(studentPaperId);//取得试卷提交时间
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");   
	         String subDate=sdf.format(sPP.getSubmitDate());
			 StudentSubjectPo subject1 = homeworkService.getSubjectById(studentPaperId, 1);//type为1的答题集合
			 if(subject1 != null){
				 
				 String subjectIds1 = subject1.getSubjectIds();
				 String stuAnswers1 = subject1.getStuAnswers();
				 String[] stuAnswerArray1;
				 if(stuAnswers1.indexOf(",")!=-1){
					 stuAnswerArray1 = stuAnswers1.split(",");
				 }else{
					 stuAnswerArray1 = new String[]{stuAnswers1};
				 }
				 List<SubjectPo> hwTest1 = testService.getExamine(subjectIds1);
				 for(int i = 0; i < hwTest1.size(); i++){
					 hwTest1.get(i).setStuAnswer(stuAnswerArray1[i]);
				 }
				 map.addAttribute("hwTest1", hwTest1);
			 }
			 StudentSubjectPo subject2 = homeworkService.getSubjectById(studentPaperId, 2);//type为1的答题集合
			 if(subject2 != null){
				 String subjectIds2 = subject2.getSubjectIds();
				 String stuAnswers2 = subject2.getStuAnswers();
				 String[] stuAnswerArray2;
				 if(stuAnswers2.indexOf(",")!=-1){
					 stuAnswerArray2 = stuAnswers2.split(",");
				 }else{
					 stuAnswerArray2 = new String[]{stuAnswers2};
				 }
				 List<SubjectPo> hwTest2 = testService.getExamine(subjectIds2);
				 for(int i = 0; i < hwTest2.size(); i++){
					 hwTest2.get(i).setStuAnswer(stuAnswerArray2[i]);
				 }
				 map.addAttribute("hwTest2", hwTest2);
			 }
			 StudentSubjectPo subject3 = homeworkService.getSubjectById(studentPaperId, 3);//type为1的答题集合
			 if(subject3 != null){
				 
				 String subjectIds3 = subject3.getSubjectIds();
				 String stuAnswers3 = subject3.getStuAnswers();
				 String[] stuAnswerArray3;
				 if(stuAnswers3.indexOf(",")!=-1){
					 stuAnswerArray3 = stuAnswers3.split(",");
				 }else{
					 stuAnswerArray3 = new String[]{stuAnswers3};
				 }
				 List<SubjectPo> hwTest3 = testService.getExamine(subjectIds3);
				 for(int i = 0; i < hwTest3.size(); i++){
					 hwTest3.get(i).setStuAnswer(stuAnswerArray3[i]);
				 }
				 map.addAttribute("hwTest3", hwTest3);
			 }
		     map.addAttribute("subject1", subject1);
		     map.addAttribute("subject2", subject2);
		     map.addAttribute("subject3", subject3);
		     map.addAttribute("subDate", subDate);
		     map.addAttribute("paper", paper);
		     map.addAttribute("name", name);
			return "study/checkExamine";
		}

}
