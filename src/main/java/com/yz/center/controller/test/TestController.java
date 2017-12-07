package com.yz.center.controller.test;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yz.center.model.form.TestInfoForm;
import com.yz.center.model.form.TestStatisticsCheckForm;
import com.yz.center.model.po.course.CourseChapterPo;
import com.yz.center.model.po.course.CoursePo;
import com.yz.center.model.po.course.OpenCoursePo;
import com.yz.center.model.po.paper.PaperPo;
import com.yz.center.model.po.paper.SubjectPo;
import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.model.po.test.FunctionPo;
import com.yz.center.model.po.test.SubjectTypePo;
import com.yz.center.model.po.test.TestPo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.model.po.video.VideoPo;
import com.yz.center.model.vo.test.TestVo;
import com.yz.center.service.iface.course.CourseChapterService;
import com.yz.center.service.iface.course.CourseService;
import com.yz.center.service.iface.homework.HomeworkService;
import com.yz.center.service.iface.test.TestService;
import com.yz.center.service.iface.video.VideoService;
import com.yz.center.util.Static;
import com.yz.center.util.common.PageBean;
import com.yz.center.util.test.ReadSubjectExcel;


/**  
* @Description: TODO
* @author: 
* @date: 2016年12月22日 下午4:31:31 
* @version V1.0   
*/
@Controller
@RequestMapping("/test")
public class TestController {
	
	@Resource
	private TestService testService;
	@Resource
	private CourseService courseService;
	@Resource
	private VideoService videoService;
	@Resource
	private CourseChapterService courseChapterService;
	@Resource 
	private HomeworkService homeworkService;
	/**
	 * 列表
	 * @return
	 */
	@RequestMapping(value="/list.html",method=RequestMethod.GET)
	public String  toTestList(ModelMap model,HttpSession session) {
	
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		Integer schoolId=school.getSchoolId();
		List<CoursePo> courseNamePos  = courseService.findCourseNameAllBySchoolId(schoolId);
		model.addAttribute("courseNamePos", courseNamePos);
		return "/admin/test/list";
	}
	
	/**
	 * 列表
	 * @return
	 */
	@RequestMapping(value="/list.html",method=RequestMethod.POST)
	@ResponseBody
	public ModelMap  testList(PageBean pageBean,HttpSession session) {
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		Integer schoolId=school.getSchoolId();
		ModelMap map = new ModelMap();
		pageBean.setSchoolId(schoolId);
		pageBean = testService.findTest(pageBean);
		map.addAttribute("page",pageBean);

		return map;
		
	}
	/**
	 * 跳转到添加试题页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/toAdd.html")
	public String  toAdd(ModelMap model,HttpSession session) {
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		Integer schoolId=school.getSchoolId();
		List<CoursePo> courseNamePos  = courseService.findCourseNameAllBySchoolId(schoolId);
		List<SubjectTypePo> subjectTypePos = testService.findType();
		List<FunctionPo> functionPos = testService.findAllFunction();
		model.addAttribute("courseNamePos", courseNamePos)
			 .addAttribute("subjectTypePos",subjectTypePos)
			 .addAttribute("functionPos", functionPos);
		return "/admin/test/addTest";
	}
	/**
	 * 添加试题
	 * @return
	 */
	@RequestMapping("/addTest.html")
	@ResponseBody
	public ModelMap  addTest(TestVo testVo,HttpSession session){
		ModelMap model = new ModelMap();
		UserPo baseUser = (UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		testVo.setSchoolId(school.getSchoolId());
		Integer flag = testService.addTest(testVo,baseUser);
		if (flag ==1) {
			return model.addAttribute("flag", "1")
						.addAttribute("msg", "添加试题成功！");
		}
		return model.addAttribute("flag", "0")
				 	.addAttribute("msg", "添加试题失败！");
		
	}
	@RequestMapping("/toUpdate.html")
	public String toUpdate(HttpSession session,@RequestParam("subjectId")Integer subjectId,ModelMap model){
		List<VideoPo> videoPos = new ArrayList<VideoPo>();
		TestPo testPo = testService.findTestBySubjectId(subjectId);
		List<CourseChapterPo> courseChapterPos = courseChapterService.findCourseChapterByCourseId(testPo.getCoursePo().getCourseId());
		int chapterIds[] = new int[courseChapterPos.size()];
		for(int i = 0;i<courseChapterPos.size();i++){
			chapterIds[i]=courseChapterPos.get(i).getChapterId();
		}
		if(chapterIds!=null&chapterIds.length!=0){
			 videoPos = videoService.findVideoByChapterIds(chapterIds);
			}
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		Integer schoolId=school.getSchoolId();
		List<CoursePo> courseNamePos  = courseService.findCourseNameAllBySchoolId(schoolId);
		List<SubjectTypePo> subjectTypePos = testService.findType();
		List<FunctionPo> functionPos = testService.findAllFunction();
		model.addAttribute("courseNamePos", courseNamePos)
			 .addAttribute("subjectTypePos",subjectTypePos)
			 .addAttribute("functionPos", functionPos)
			 .addAttribute("testPo", testPo)
			 .addAttribute("videoPos", videoPos);
			 
		return "/admin/test/testEdit";
		
		
	}
	/**
	 * 更新试题
	 * @return
	 */
	@RequestMapping("/updateTest.html")
	@ResponseBody
	public ModelMap updateTest(TestVo testVo,HttpSession session) {
        ModelMap model = new ModelMap();
        SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
        testVo.setSchoolId(school.getSchoolId());
        int flag = testService.updateTest(testVo);
        if(0 == flag){
            return model.addAttribute("flag", "0")
                        .addAttribute("msg", "修改试题失败！");
        }
        return model.addAttribute("flag", "1")
                .addAttribute("msg", "修改试题成功！");
	}
	/**
	 * 单条删除试题
	 * @return
	 */
	@RequestMapping("/deleteTestById.html")
	@ResponseBody
	public ModelMap deleteTestById(ModelMap model,@RequestParam(value="testId")Integer testId){
		System.out.println(testId);
		int flag = testService.updateTestState(testId);
		if (0==flag) {
			 return model.addAttribute("flag", "0")
                     .addAttribute("msg", "删除试题失败！");
		}
		return model.addAttribute("flag", "1")
                .addAttribute("msg", "删除试题成功！");

	}
	/**
	 * 批量删除试题
	 * @return
	 */
	@RequestMapping("/deleteTestByIds.html")
	@ResponseBody
	public ModelMap deleteTestByIds(ModelMap model,@RequestParam(value="testIds[]")Integer[] testIds){
		int flag = testService.updateManyTestState(testIds);
		if (0==flag) {
			 return model.addAttribute("flag", flag)
                     .addAttribute("msg", "删除试题失败！");
		}
		return model.addAttribute("flag", flag)
                .addAttribute("msg", "删除试题成功！");
	}
	
	
	@RequestMapping("/toInsertTest.html")
	public String toInsertTest(ModelMap model,HttpSession session){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		Integer schoolId=school.getSchoolId();
		List<CoursePo> courseNamePos  = courseService.findCourseNameAllBySchoolId(schoolId);
		model.addAttribute("courseNamePos", courseNamePos);
		return "/admin/test/insertTest";
	}
	/**
	 * 导入excel表的数据
	 * @param model
	 * @param courseId
	 * @param videoId
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping("/insertTest.html")
	@ResponseBody
	public ModelMap insertTest(ModelMap model,Integer courseId,Integer videoId,
			@RequestParam(value= "file", required = false) MultipartFile file,
			HttpSession session
			){
		List<TestVo> testVos = new ArrayList<TestVo>();
		// 文件保存路径  
				String fileDir =session.getServletContext().getRealPath("/") + "upload/test/"; 
				File file1 = new File(fileDir);
				int flag=0;
				try {
					if  (!file1.exists())      
	            	{       
	            		System.out.println("//不存在");
	            		file1.mkdirs();  
	            	} 
	            	String filePath=fileDir+new Date().getTime()+".xls";
	            	// 转存文件  
	            	file.transferTo(new File(filePath));
	            	testVos = ReadSubjectExcel.readXls(filePath);
	            	flag=testService.insertTest(courseId, videoId,session, testVos);
				} catch (Exception e) {
					return model.addAttribute("flag",flag)
							.addAttribute("msg", "导入试题失败！");
				}
				return model.addAttribute("flag", flag)
					.addAttribute("msg", "导入试题成功！");
	}
	
	 /* 考试信息模块 开始*/
	 
	/**   
	* @Title: toTestInfo
	* @Description: 跳转考试信息列表 
	* @return
	* @author:
	*/
	@RequestMapping("/toTestInfo")
	public String toTestInfo(ModelMap map,HttpSession session){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		Integer schoolId=school.getSchoolId();
		List<TestInfoForm> courseNameList = testService.getCourseNameForTest(schoolId);
		map.addAttribute("courseNameList", courseNameList);
		return  "admin/test/testInfo";
	}
	
	
	/**   
	* @Title: testInfo
	* @Description: 考试信息 
	* @param courseName
	* @param title
	* @param pageBean
	* @return ModelMap
	* @author:
	*/
	@RequestMapping("/testInfo")
	@ResponseBody
	public ModelMap testInfo(String courseName,String title,HttpSession session,PageBean pageBean){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		pageBean.setSchoolId(school.getSchoolId());
		pageBean = testService.getTestInfo(pageBean, courseName, title);//统计考试信息条数
		ModelMap map = new ModelMap();
		map.addAttribute("page", pageBean);
		return  map;
	}
	@RequestMapping("/toGetPaperByPaperIdsOfTest")
	public String toGetPaperByPaperIdsOfTest(String paperIds,HttpSession session){
		session.setAttribute("paperIds",paperIds);
		return  "admin/test/testPaperList";
	}
	@RequestMapping("/getPaperByPaperIdsOfTest")
	@ResponseBody
	public ModelMap getPaperByPaperIdsOfTest(PageBean pageBean,String paperIds,String title,HttpSession session){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		Integer schoolId = school.getSchoolId();
		pageBean.setSchoolId(schoolId);
		pageBean = testService.getPaperByPaperIdsOfTest(pageBean, title, paperIds);
		ModelMap map = new ModelMap();
		map.addAttribute("page", pageBean);
		return  map;
	}
	
	/**   
	* @Title: checkPaperOfTest
	* @Description: 查看试卷
	* @param paperIds 试卷id集合
	* @param session
	* @param map
	* @return
	* @author:
	*/
	@RequestMapping(value = "/checkPaperOfTest",method = RequestMethod.GET)
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
	    
		 List<SubjectPo> hwTest = testService.getExamine(paper.getSubjectIds());
		 map.addAttribute("paper", paper);
		 map.addAttribute("hwTest", hwTest);
		 map.addAttribute("ct1", ct1);
		 map.addAttribute("ct2", ct2);
		 map.addAttribute("ct3", ct3);
		return "admin/test/checkPaperOfTest";
	}
	
	
	/**   
	* @Title: testDelete
	* @Description: 删除考试  
	* @param Id
	* @param paperIds
	* @param openId
	* @return map flag 0 删除失败
	*                  1 删除成功
	*                  3 已有学生在做题,不能删除
	* @author:
	*/
	@RequestMapping("/testDelete")
	@ResponseBody
	public ModelMap testDelete(HttpSession session,Integer Id,Integer openId){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		Integer schoolId=school.getSchoolId();
		Integer countOfDelete = testService.getCountOfDelete(Id,schoolId);
		ModelMap map = new ModelMap();
		if(countOfDelete==0){
			int flag= testService.testDelete(Id,openId);
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
	
	/* 考试信息模块 结束*/
	
	
	
}
