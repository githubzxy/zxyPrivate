/**
 * @FileName: AdminIndexController.java
 * @Author 
 * @Description:
 * @Date 2016年10月25日 下午3:34:18
 * @CopyRight yazhuokj Corporation
 */
package com.yz.center.controller.student;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yz.center.model.po.PageBean;
import com.yz.center.model.po.StudentPo;
import com.yz.center.model.po.comment.CommentPo;
import com.yz.center.model.po.course.CourseChapterPo;
import com.yz.center.model.po.course.CourseTypePo;
import com.yz.center.model.po.discuss.DiscussPo;
import com.yz.center.model.po.discuss.DiscussThemePo;
import com.yz.center.model.po.message.MessagePo;
import com.yz.center.model.po.paper.StudentPaperPo;
import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.model.po.student.PlayRecordPo;
import com.yz.center.model.po.task.TaskPo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.model.po.video.VideoPo;
import com.yz.center.model.vo.BaseConditionVO;
import com.yz.center.model.vo.DiscussVo;
import com.yz.center.model.vo.StudentCourseVo;
import com.yz.center.model.vo.StudentForm;
import com.yz.center.model.vo.course.OpenCourseVo;
import com.yz.center.model.vo.frontPage.OpenCourseChapterNameVo;
import com.yz.center.service.iface.course.CourseTypeService;
import com.yz.center.service.iface.course.OpenCourseService;
import com.yz.center.service.iface.discuss.DiscussService;
import com.yz.center.service.iface.frontPage.FrontPageService;
import com.yz.center.service.iface.homework.HomeworkService;
import com.yz.center.service.iface.message.MessageService;
import com.yz.center.service.iface.student.StudentService;
import com.yz.center.service.iface.student.StudyService;
import com.yz.center.service.iface.test.TestService;
import com.yz.center.service.iface.user.UserService;
import com.yz.center.util.CommonUtil;
import com.yz.center.util.Static;


@RequestMapping("study")
@Controller
public class StudentIndexController{

	@Resource
	private StudyService studyService;
	@Resource
	FrontPageService frontPageService;
	@Resource
	private OpenCourseService openCourseService; 
	@Resource
	private MessageService messageService;
	@Resource
	private CourseTypeService courseTypeService;
	@Resource
	private DiscussService discussService;
	@Resource
	private StudentService studentService;
	@Resource
	private UserService userService;
	@Resource
	private HomeworkService homeworkService;
	@Resource
	private TestService testService;
	//个人中心
	
	/**   
	* Title: defualt 
	* Description: TODO  
	* @param userId
	* @return
	* @author Administrator 
	*/
	@RequestMapping("personal.html")
	public String defualt(BaseConditionVO baseConditionVO ,HttpSession session,ModelMap model){
		UserPo userPo = (UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
		SchoolPo schoolPo = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		Integer schoolId = schoolPo.getSchoolId();
		Integer studentId = userPo.getStudentPo().getId();
		Integer userId = userPo.getUserId();
		//查询学生已选课程
		//分页初始化
		BaseConditionVO page1 = new BaseConditionVO(baseConditionVO);
		page1=openCourseService.init3(null,page1,userId, schoolId);
		List<OpenCourseVo> openCourseVos = openCourseService.findByUserId(null,page1);
		//查询开课，而学生未选课程
		BaseConditionVO page2 = new BaseConditionVO(baseConditionVO);
		page2=openCourseService.init4(null,page2,userId, schoolId);
		List<OpenCourseVo> openCourseVos2 = openCourseService.find2ByUserId(null,page2);
		//查询自己的个人通知
		List<MessagePo> messagePos = messageService.findMessageBytoUserId(userId);
		//查询自己的头像，姓名，学院
		StudentForm studentForm = studentService.findMyinfo(userId);
		//查询作业条数,考试条数，。。。
		com.yz.center.util.common.PageBean pageBean=new com.yz.center.util.common.PageBean();
		pageBean.setUserId(userId);
		pageBean.setSchoolId(schoolPo.getSchoolId());
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("studentId", studentId);
		pageBean.params = map;
		Integer hwCount = homeworkService.getHomeworkCountOfPersonal(pageBean);
		Integer myTestcount = testService.getCountByIsSubmit(pageBean,studentId,0);
		//查询讨论
		List<DiscussVo> discussVos = discussService.findsomeDiscuss(userId);
		model.addAttribute("page1", page1)
			 .addAttribute("page2", page2)
			 .addAttribute("openCourseVos", openCourseVos)
			 .addAttribute("openCourseVos2", openCourseVos2)
			 .addAttribute("messagePos", messagePos)
			 .addAttribute("studentForm", studentForm)
			 .addAttribute("hwCount", hwCount)
			 .addAttribute("myTestcount", myTestcount)
			 .addAttribute("discussVos", discussVos);
		return "study/personal";
	} 
	//已选课程
	@RequestMapping("toSelectedCourse.html")
	public String selectedCourse(Integer courseTypeId,BaseConditionVO baseConditionVO ,HttpSession session,ModelMap model){
		UserPo baseUser = (UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
		Integer userId = baseUser.getUserId();
		SchoolPo schoolPo =(SchoolPo) session.getAttribute(Static.SCHOOL_SESSION);
        Integer schoolId = schoolPo.getSchoolId();
		//查询课程分类
		List<CourseTypePo> courseTypePos = courseTypeService.findAllCourseTypesName(schoolId);		
		//查询学生已选课程
		//分页初始化
		BaseConditionVO page = openCourseService.init3(courseTypeId,baseConditionVO,userId,schoolId);
		List<OpenCourseVo> openCourseVos = openCourseService.findByUserId(courseTypeId,baseConditionVO);
		model.addAttribute("courseTypePos", courseTypePos)
			 .addAttribute("openCourseVos", openCourseVos)
			 .addAttribute("page", page)
			 .addAttribute("courseTypeId", courseTypeId);
		return "study/selectedCourse";
	}
	//已选课程
	@RequestMapping("toSelectedCourse2.html")
	@ResponseBody
	public ModelMap selectedCourse2(Integer courseTypeId,BaseConditionVO baseConditionVO ,HttpSession session){
		ModelMap model = new ModelMap();
		UserPo baseUser = (UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
		Integer userId = baseUser.getUserId();
		SchoolPo schoolPo =(SchoolPo) session.getAttribute(Static.SCHOOL_SESSION);
        Integer schoolId = schoolPo.getSchoolId();
		
		//查询课程分类
		List<CourseTypePo> courseTypePos = courseTypeService.findAllCourseTypesName(schoolId);
		//查询学生已选课程
		//分页初始化
		BaseConditionVO page = openCourseService.init3(null,baseConditionVO,userId,schoolId);
		List<OpenCourseVo> openCourseVos = openCourseService.findByUserId(courseTypeId,baseConditionVO);
		//处理时间
		openCourseService.updateTimeAndcourseInfo(openCourseVos);
		model.addAttribute("courseTypePos", courseTypePos)
			 .addAttribute("openCourseVos", openCourseVos)
			 .addAttribute("page", page)
			 .addAttribute("courseTypeId", courseTypeId);
		return model;
	}

	//我要选课
	@RequestMapping("/toNoselectedcourse.html")
	public String noSelectedCourse(Integer courseTypeId,BaseConditionVO baseConditionVO,
			HttpSession session,ModelMap model){
		UserPo baseUser = (UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
		Integer userId = baseUser.getUserId();
		System.out.println(userId);
		SchoolPo schoolPo =(SchoolPo) session.getAttribute(Static.SCHOOL_SESSION);
        Integer schoolId = schoolPo.getSchoolId();
		//查询课程分类
		List<CourseTypePo> courseTypePos = courseTypeService.findAllCourseTypesName(schoolId);
		
		//查询学生wei选课程
		//分页初始化
		BaseConditionVO page = openCourseService.init4(courseTypeId,baseConditionVO,userId,schoolId);
		List<OpenCourseVo> openCourseVos = openCourseService.find2ByUserId(courseTypeId, baseConditionVO);
		model.addAttribute("courseTypePos", courseTypePos)
			 .addAttribute("page", page)
			 .addAttribute("openCourseVos", openCourseVos)
			 .addAttribute("courseTypeId", courseTypeId);
			
		return "study/noSelectedCourse";
	}
	@RequestMapping("/toNoselectedcourse2.html")
	@ResponseBody
	public ModelMap noSelectedCourse2(Integer courseTypeId,BaseConditionVO baseConditionVO,
			HttpSession session){
		ModelMap model = new ModelMap();
		UserPo baseUser = (UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
		Integer userId = baseUser.getUserId();
		SchoolPo schoolPo =(SchoolPo) session.getAttribute(Static.SCHOOL_SESSION);
        Integer schoolId = schoolPo.getSchoolId();
		//查询课程分类
		List<CourseTypePo> courseTypePos = courseTypeService.findAllCourseTypesName(schoolId);
		//查询学生wei选课程
		//分页初始化
		BaseConditionVO page = openCourseService.init4(null,baseConditionVO,userId,schoolId);
		List<OpenCourseVo> openCourseVos = openCourseService.find2ByUserId(courseTypeId, baseConditionVO);
		model.addAttribute("courseTypePos", courseTypePos)
			 .addAttribute("page", page)
			 .addAttribute("openCourseVos", openCourseVos)
			 .addAttribute("courseTypeId", courseTypeId);	
		return model;
	}
	//讨论中心
	@RequestMapping("toDisCenter.html")
	public String disCenter(BaseConditionVO baseConditionVO,Integer themeId,ModelMap model,HttpSession session){
		UserPo baseUser = (UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
		Integer userId = baseUser.getUserId();
		baseConditionVO.setUserId(userId);
		SchoolPo schoolPo = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		baseConditionVO.setSchoolId(schoolPo.getSchoolId());
		//查询跟我相关课程的所有的讨论主题及其品论，分页
		BaseConditionVO page = discussService.init2(baseConditionVO);
		//查询所有的讨论主题
		List<DiscussVo> discussVoThemeId = discussService.findDiscussTheme(baseConditionVO);
		model.addAttribute("page",page)
			 .addAttribute("discussVos", discussVoThemeId);
		return "study/disCenter";
	}
	//讨论详情
	@RequestMapping("detailDiscuss.html")
	public String  detailDiscuss(BaseConditionVO baseConditionVO,Integer themeId,ModelMap model){
		List<DiscussVo> discussVos = discussService.findAllDiscussBythemeId(baseConditionVO,themeId);
		 model.addAttribute("discussVos", discussVos)
		 	  .addAttribute("page", baseConditionVO);
		return "study/detailDiscuss";
		
		
	}
	/**	
	 * 
	* Title: seeDiscuss 
	* Description: 根据主题ID查询下面的讨论 
	* @param themeId
	* @param baseConditionVO
	* @return
	* @author Administrator
	 */
	@RequestMapping("seeDiscuss.html")
	@ResponseBody
	public ModelMap seeDiscuss(Integer themeId,BaseConditionVO baseConditionVO){
		ModelMap model = new ModelMap();
		List<DiscussPo> discussPos = discussService.findDiscussBythemeId(baseConditionVO,themeId);
		model.addAttribute("discussPos", discussPos)
				.addAttribute("flag", CommonUtil.FLAG_SUCESS);
		return model;
		
		
	}
	
	//发表讨论
	@RequestMapping("addDiscussByThemeId.html")
	@ResponseBody
	public ModelMap addDiscussByThemeId(DiscussPo discussPo,Integer themeId,HttpSession session) {
		ModelMap model = new ModelMap();			
		DiscussThemePo discussThemePo = new DiscussThemePo();
		discussThemePo.setThemeId(themeId);
		discussPo.setDiscussThemePo(discussThemePo);
		UserPo baseUser = (UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
		discussPo.setUserId(baseUser.getUserId());
		Integer flag = discussService.addDiscussByThemeId(discussPo);
		model.addAttribute("themeId", themeId)
			 .addAttribute("flag",CommonUtil.FLAG_SUCESS)
			 .addAttribute("msg", "添加成功")
			 .addAttribute("discussPo", discussPo);
		return model;
		
	}
	//我的讨论
	@RequestMapping("myDiscuss.html")
	public String mydiscuss(BaseConditionVO baseConditionVO,HttpSession session,ModelMap model){
		UserPo baseUser = (UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
		BaseConditionVO page = discussService.init1(baseConditionVO,baseUser.getUserId());
		//查询跟我相关的讨论
		List<DiscussPo> discussPos = discussService.findmydiscuss(baseConditionVO);
		model.addAttribute("page", page)
			 .addAttribute("discussPos", discussPos);
		return "study/discuss";
	}

	//作业列表，随堂测试
	@RequestMapping("toHomeWork")
	public String homeWork(){
		return "study/homeWork";
	}
	//我的考试
	@RequestMapping("toMyTest")
	public String myTest(){
		return "study/myTest";
	}
	//考试列表
	@RequestMapping("toTestList")
	public String testList(){
		return "study/testList";
	}
	//通过的课程
	@RequestMapping("toPassCourse.html")
	public String toPassCourse(BaseConditionVO baseConditionVO,HttpSession session,ModelMap model){
		UserPo baseUser = (UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
		baseConditionVO.setUserId(baseUser.getUserId());
		//查询该学生选择的所有的课程
		List<StudentCourseVo> studentCourseVos = studentService.findMycourse(baseConditionVO);
		//选出该学生通过的课程
		List<StudentCourseVo> studentCourseVos2 = studentService.findMyPasscourse(studentCourseVos);
		//分页初始化及返回数据
		baseConditionVO.setPageSize(5);
		baseConditionVO.setTotalCount(studentCourseVos2.size());
		//分页选出数据
		Integer start = 0;//开始位置
		if (baseConditionVO.getStartIndex()<=studentCourseVos2.size()) {
			start=baseConditionVO.getStartIndex();
		}
		Integer end = 0;//结束位置
		if (baseConditionVO.getStartIndex()+baseConditionVO.getPageSize()<=studentCourseVos2.size()) {
			end = baseConditionVO.getStartIndex()+baseConditionVO.getPageSize();
		}
		else{
			end = studentCourseVos2.size();
		}
		List<StudentCourseVo> studentCourseVos3 = new ArrayList<StudentCourseVo>();
		for(int i = start;i<end;i++){
			if (studentCourseVos2.get(i)!=null) {
				studentCourseVos3.add(studentCourseVos2.get(i));
			}
		}
		model.addAttribute("studentCourseVos3", studentCourseVos3)
			 .addAttribute("page", baseConditionVO);
		return "study/passCourse";
	}
	//未通过课程
	@RequestMapping("toUnpassCourse.html")
	public String toUnpassCourse(BaseConditionVO baseConditionVO,HttpSession session,ModelMap model){
		UserPo baseUser = (UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
		baseConditionVO.setUserId(baseUser.getUserId());
		//查询该学生选择的所有的课程de信息
		List<StudentCourseVo> studentCourseVos = studentService.findMycourse(baseConditionVO);
		//选出该学生wei通过的课程
		List<StudentCourseVo> studentCourseVos2 = studentService.findMyUnPasscourse(studentCourseVos);
		//分页选出数据
		baseConditionVO.setPageSize(5);
		baseConditionVO.setTotalCount(studentCourseVos2.size());
				Integer start = 0;//开始位置
				if (baseConditionVO.getStartIndex()<=studentCourseVos2.size()) {
					start=baseConditionVO.getStartIndex();
				}
				Integer end = 0;//结束位置
				if (baseConditionVO.getStartIndex()+baseConditionVO.getPageSize()<=studentCourseVos2.size()) {
					end = baseConditionVO.getStartIndex()+baseConditionVO.getPageSize();
				}
				else{
					end = studentCourseVos2.size();
				}
				List<StudentCourseVo> studentCourseVos3 = new ArrayList<StudentCourseVo>();
				for(int i = start;i<end;i++){
					if (studentCourseVos2.get(i)!=null) {
						studentCourseVos3.add(studentCourseVos2.get(i));
					}
				}
				model.addAttribute("studentCourseVos3", studentCourseVos3)
					 .addAttribute("page", baseConditionVO);
		return "study/unPassCourse";
	}
	//查看资料
	@RequestMapping("/toPersonalInfo.html")
	public String toPersonalInfo(HttpSession session,ModelMap model){
		UserPo baseUser = (UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
		Integer userId = baseUser.getUserId();
		//查看学生自己的个人信息
		StudentForm studentForm = studentService.findMyinfo(userId);
		studentForm.setLoginId(baseUser.getLoginId());
		model.addAttribute("studentForm", studentForm);
		return "study/personalInfo";
	}
	//修改头像
	@RequestMapping("toAvatarUpdate")
	public String toAvatarUpdate(){
		return "study/avatarUpdate";
	}
	//到修改密码页面
	@RequestMapping("/toPwdUpdate.html")
	public String pwdUpdate(HttpSession session){
		return "study/pwdUpdate";
	}
	//修改密码
	@RequestMapping("PwdUpdate.html")
	@ResponseBody
	public ModelMap PwdUpdate(String oldPwd,String newPwd,String newPwd2,HttpSession session,ModelMap model){
		UserPo baseUser = (UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
		Integer userId =  baseUser.getUserId();
		//验证
		Integer flag = userService.verify(userId,oldPwd,newPwd,newPwd2);
		//1,通过;0,确认密码输错;2,原密码输错
		if (flag==1) {
			Integer flag2 = userService.update(userId,oldPwd,newPwd,session);
			if (flag2==1) {
				model.addAttribute("flag", 1)
					 .addAttribute("msg", "更新成功！");
				session.removeAttribute("loginUser");
			}else{
				model.addAttribute("flag", 0)
					 .addAttribute("msg","更新失败！");	
			}
		}
		if(flag==0){
			model.addAttribute("flag", 2)
				 .addAttribute("msg", "确认密码输入错误!");
		}
		if (flag==2) {
			model.addAttribute("flag", 3)
			 .addAttribute("msg", "原密码输入错误!");
		}
		
		return model;
		
	}
	//学习进度
	@RequestMapping("toStuProgress")
	public String toStuProgress(){
		return "study/stuProgress";
	}
	
	public void test(int parent){
		//查询数据库
		// list<chahpterPo> lst = selectChatper(parentId);
		List<CourseChapterPo> list = new ArrayList<CourseChapterPo>();
		if(list != null){
			for(CourseChapterPo chapterPo : list){
				test(chapterPo.getChapterId());
			}
		}
	}
	
	//视频学习
	@RequestMapping("toCoursePlay")
	public String toCoursePlay(Integer openId,ModelMap modelMap,HttpSession session){
		UserPo user = (UserPo)session.getAttribute(Static.LOGIN_USER_SESSION);
		StudentPo studentPo = user.getStudentPo();
		try{
	    List<VideoPo> videos=studyService.getvideosByOpenId(openId,0);
	    modelMap.addAttribute("videos",videos);
		modelMap.addAttribute("openId",openId);
		PlayRecordPo recordPo=studyService.addOrgetPlayRecordByStudentId(studentPo.getId(),openId);
	    VideoPo videoPo=studyService.getVideoByRecord(recordPo);
	    List<VideoPo> unlockVideos=studyService.getvideosByOpenId(openId, recordPo.getVideoId());
	    Integer unlockNumber=videos.size()-unlockVideos.size();
	    modelMap.addAttribute("unlockNumber", unlockNumber);
		modelMap.addAttribute("video", videoPo);
		OpenCourseChapterNameVo names=studyService.getOpenCourseName(openId);
		modelMap.addAttribute("names", names);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "study/playCourse";
	}
  @RequestMapping("/getVideoByChapter")
  @ResponseBody
  public ModelMap getVideoByChapter(HttpSession session,Integer openId,Integer videoId,Integer unlockNum){
	  ModelMap modelMap=new ModelMap();
	  SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
	  Integer schoolId = school.getSchoolId();
	  UserPo userPo = (UserPo)session.getAttribute(Static.LOGIN_USER_SESSION);
	  StudentPo studentPo = userPo.getStudentPo();
	  Integer studentId = studentPo.getId();
	  VideoPo videoPo=null;
	  try{
		  List<VideoPo> videos=studyService.getvideosByOpenId(openId, videoId);
		  if(videos!=null&&!videos.isEmpty()){
			  videoPo=videos.get(0);
		  }
		  Integer flag=studyService.getIsUnlockVideoOrNot(openId, unlockNum, videoId);
      if(flag==0){
    	  modelMap.addAttribute("flag", 1);
	  if(videoPo==null){
		  studyService.updateViewVideoCount(studentId, openId);
	     studyService.updatePlayRecord(studentPo.getId(), openId, videoId,0, 1,0);
	     modelMap.addAttribute("video", 1);
	  }else {
		studyService.updateViewVideoCount(studentId, openId);
		studyService.updatePlayRecord(studentId, openId, videoPo.getVideoId(), 0, 0,1);
		videoPo.setSecond(0);
		modelMap.addAttribute("video",videoPo);
	}
      }else{
    	  modelMap.addAttribute("flag", 0);
          if(videoPo==null){
        	  modelMap.addAttribute("video", 1);
        	  }else{
        		  videoPo.setSecond(0); 
        		  modelMap.addAttribute("video",videoPo);  
        	  }
      }
      //判断是否有作业
	 TaskPo task=studyService.getExamineTaskPaper(openId,videoId,schoolId);
	 studyService.addStudentPaperOfTest(openId, schoolId, studentId);
	  if(task!=null){
		  String[] paperIds=task.getPaperIds().split(",");
		  Random rand = new Random();
		  Integer num = rand.nextInt(paperIds.length);
		  StudentPaperPo paper=studyService.getStudentPaperInfo(studentId, openId, videoId, Integer.parseInt(paperIds[num]), task.getId(),schoolId);
		  if(paper.getIsSubmit()!=1){
			  modelMap.addAttribute("task", 1);
			  modelMap.addAttribute("paperId",paper.getPaperId());
			  modelMap.addAttribute("isSubmit",paper.getIsSubmit());
			  modelMap.addAttribute("studentPaperId", paper.getStudentPaperId());
			  }else{
				   modelMap.addAttribute("task", 0);   
			   }
       }else{
    	   modelMap.addAttribute("task", 0); 
	  }
	  
	  
	  
	  }catch(Exception e){
		  e.printStackTrace();
		  modelMap.addAttribute("video",0);
	  }
	  
	 return modelMap;
  }
  @RequestMapping("/updatePlayRecord")
  @ResponseBody
  public ModelMap updatePlayRecord(Integer openId,Integer second,Integer videoId,Integer unlockNum,HttpSession session){
	 
	  UserPo user = (UserPo)session.getAttribute(Static.LOGIN_USER_SESSION);
		StudentPo studentPo = user.getStudentPo();
	  ModelMap modelMap=new ModelMap();
	  try {
		  PlayRecordPo recordPo=studyService.addOrgetPlayRecordByStudentId(studentPo.getId(), openId);
		  Integer flag=studyService.getIsUnlockVideoOrNot(openId, unlockNum, videoId);
	     if(recordPo.getIsover()==0){
		  if(flag==0){
			if(second>=recordPo.getSecond()){
		  studyService.updatePlayRecord(studentPo.getId(), openId, videoId, second,0,0);
		  }
			  }
	    }
		  modelMap.addAttribute("second", recordPo.getSecond());
	} catch (Exception e) {
		e.printStackTrace();
		modelMap.addAttribute("flag", 0);
	}
	  return modelMap;
	  
  }
  
  @RequestMapping("/getVideoBySelected")
  @ResponseBody
  public ModelMap getVideoBySelected(Integer openId,Integer videoId){
	  ModelMap modelMap=new ModelMap();
	 VideoPo videoPo=studyService.getVideoByVideoId(videoId);
	 modelMap.addAttribute("video", videoPo);
	  return modelMap;
	  
  }
  @RequestMapping("/addComment")
  @ResponseBody
  public ModelMap addComment(CommentPo commentPo){
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
  public ModelMap commentList(@RequestParam(value="pageNum", defaultValue="1") Integer pageNum,PageBean pageBean,
		  HttpSession session){
	  SchoolPo schoolPo = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
  	ModelMap map=new ModelMap();
  	pageBean.setPageSize(5);
  	pageBean.setPageNum(pageNum);
  	pageBean.setSchoolId(schoolPo.getSchoolId());
  	map.put("comments", frontPageService.getCommentList(pageBean));
  	map.put("page", pageBean);
      return map;
  }
    
}
