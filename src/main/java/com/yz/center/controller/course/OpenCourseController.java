/**
  * @FileName: OpenCourseController.java
  * @Author 
  * @Description:
  * @Date 2016��10��24�� ����3:43:31
  * @CopyRight yazhuokj Corporation
  */
package com.yz.center.controller.course;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.multipart.MultipartFile;

import com.yz.center.dao.student.StudentDao;
import com.yz.center.model.po.course.CourseTypePo;
import com.yz.center.model.po.course.OpenCoursePo;
import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.model.vo.BaseConditionVO;
import com.yz.center.model.vo.course.CourseInfoVo;
import com.yz.center.model.vo.course.OpenCourseVo;
import com.yz.center.service.iface.course.CourseTypeService;
import com.yz.center.service.iface.course.OpenCourseService;
import com.yz.center.service.iface.student.StudentService;
import com.yz.center.service.iface.student.StudyService;
import com.yz.center.util.Static;
import com.yz.center.util.common.PageBean;
import com.yz.center.util.course.readStudentExcel;

@Controller
@RequestMapping("/course/open")
public class OpenCourseController{
	Integer baseCourseIds[] ;
	String  baseName[];
	@Resource
	private OpenCourseService openCourseService;
	@Resource
	private CourseTypeService courseTypeService;
	@Resource
	private StudentService studentService;
	@Resource
	private StudentDao studentDao;
	@Resource
	private StudyService studyService;
	/**
	 * 跳转到开课页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/toAdd.html")
	public String toAdd(ModelMap model,HttpSession session){
		//查询所有课程类别及其包含课程
	    SchoolPo schoolPo =(SchoolPo) session.getAttribute(Static.SCHOOL_SESSION);
	    Integer schoolId = schoolPo.getSchoolId();
		List< CourseInfoVo> courseInfoVos = courseTypeService.findCourseInfoVos(schoolId);
		model.addAttribute("courseInfoVos", courseInfoVos);
		return "/admin/course/open/openFirst";
	}
	
	
	@RequestMapping(value = "/list22.html", method=RequestMethod.GET)
	public String aalist(ModelMap model,HttpSession session){
		System.out.println("adssad");
		return null;
	}
	/**
	 * 开课下一步
	 * @param courseId
	 * @param name
	 * @return
	 */
	@RequestMapping(value = "/next.html",method = RequestMethod.POST)
	@ResponseBody
	public ModelMap next( @RequestParam(value = "courseId[]")Integer courseId[],@RequestParam(value = "name[]")String name[]){
		ModelMap model =new ModelMap();
		baseCourseIds = courseId;
		baseName = name;
		return model.addAttribute("flag", "1");
		
	}
	/**
	 * 跳转到开课的下一个页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/toAddSecond.html")
	public String  toAddSecond(ModelMap model){
		model.addAttribute("baseCourseIds", baseCourseIds)
			 .addAttribute("baseName", baseName);
		return "/admin/course/open/add";
	}
	
	/**
	 * 到结课页面
	 * @param baseConditionVO
	 * @param courseId
	 * @param isEnd
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/toOverCourse.html",method = RequestMethod.GET)
	public String toOverCourse(ModelMap model,HttpSession session) {
		//查询课程类别
	    SchoolPo schoolPo =(SchoolPo) session.getAttribute(Static.SCHOOL_SESSION);
        Integer schoolId = schoolPo.getSchoolId();
		 List<CourseTypePo> courseTypePos = courseTypeService.findAllCourseTypesName(schoolId);
		 model.addAttribute("courseTypePos", courseTypePos);
		return "/admin/course/open/overCourse";
	}
	
	/**
	 * 到结课页面
	 * @param baseConditionVO
	 * @param courseId
	 * @param isEnd
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/toOverCourse.html",method = RequestMethod.POST)
	@ResponseBody
	public ModelMap overCourse(PageBean pageBean,Integer courseId,Integer isEnd,String courseName,HttpSession session) {
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		pageBean.setSchoolId(school.getSchoolId());
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("isEnd", isEnd);
		params.put("courseName", courseName);
		pageBean.params = params;
		//查询开课信息
		 pageBean = openCourseService.findOpenCourses(pageBean);
		 ModelMap model = new ModelMap();
		 model.addAttribute("page", pageBean);
		return model;
	}
	
	/**
	 * 开课列表
	 * @param baseConditionVO
	 * @param courseId
	 * @param isEnd
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/list.html", method=RequestMethod.GET)
	public String toList(ModelMap model,HttpSession session){
		//查询课程类别
		System.out.println("hahahhahahhhahahah");
	    SchoolPo schoolPo =(SchoolPo) session.getAttribute(Static.SCHOOL_SESSION);
        Integer schoolId = schoolPo.getSchoolId();
		 List<CourseTypePo> courseTypePos = courseTypeService.findAllCourseTypesName(schoolId);
		 model.addAttribute("courseTypePos", courseTypePos);
		return "/admin/course/open/list";
	}
	
	
	/**
	 * 开课列表
	 * @param baseConditionVO
	 * @param courseId
	 * @param isEnd
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/list.html", method = RequestMethod.POST)
	@ResponseBody
	public ModelMap list(HttpSession session,PageBean pageBean,Integer courseId,Integer isEnd,String courseName){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		pageBean.setSchoolId(school.getSchoolId());
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("isEnd", isEnd);
		params.put("courseName", courseName);
		pageBean.params = params;
		//查询开课信息
		 pageBean = openCourseService.findOpenCourses(pageBean);
		 ModelMap map = new ModelMap();
		 map.addAttribute("page", pageBean);
		return map;
	}
	/**
	 * 删除开课课程
	 * @param openId
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/del.html",method = RequestMethod.POST)
	@ResponseBody
	public ModelMap del(Integer openId,ModelMap model){
		Integer flag = openCourseService.deleteById(openId);
		if (flag ==1) {
			return model.addAttribute("flag", "1")
					.addAttribute("msg", "删除开课课程成功！！");
		}
		return model.addAttribute("flag", "0")
					.addAttribute("msg", "删除开课课程失败！！");
	}
	/**
	 *批量删除，没得这个功能
	 * @param openIds
	 * @return
	 */
	@RequestMapping(value = "delAll.html",method = RequestMethod.POST)
	@ResponseBody
	public ModelMap delAll(@RequestParam(value="openIds")Integer openIds[]){
		return null;
		
	}
	/**
	 * 跳转到开课编辑页面
	 * @param openId
	 * @param model
	 * @return
	 */
	@RequestMapping("/toEdit.html")
	public String toEdit(Integer openId,ModelMap model){
		//按ID查询开课信息
		OpenCoursePo openCoursePo = openCourseService.findByopenId(openId);
		model.addAttribute("openCoursePo", openCoursePo);
		return "/admin/course/open/edit";
		
	}
	/**
	 * 添加开课课程
	 * @param openCourseForm
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/add.html",method=RequestMethod.POST)
	@ResponseBody
	public ModelMap add(OpenCoursePo openCourseForm, HttpSession session) {
		ModelMap model = new ModelMap();
		UserPo baseUser = (UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
		openCourseForm.setUserId(baseUser.getUserId());
		SchoolPo schoolPo =(SchoolPo) session.getAttribute(Static.SCHOOL_SESSION);		
	    Integer schoolId = schoolPo.getSchoolId();
	    Integer flag=openCourseService.adds(openCourseForm, baseCourseIds, baseName, schoolId);
		if (flag == 1) {
			return model.addAttribute("flag", "1")
					.addAttribute("msg", "添加开课课程成功！");
		}
		return model.addAttribute("flag", "0")
					.addAttribute("msg", "添加开课课程失败！");
		
	}
	/**
	 * 更新课程
	 * @param openCoursePo
	 * @return
	 */
	@RequestMapping("/update.html")
	@ResponseBody
	public ModelMap update(OpenCoursePo openCoursePo){
		ModelMap model = new ModelMap();
		Integer flag =openCourseService.update(openCoursePo);
		if (flag == 1) {
			return model.addAttribute("flag", "1")
					.addAttribute("msg","更新成功！");
		}
		return model.addAttribute("flag", "0")
					.addAttribute("msg","更新失败！");
		
	}
	/**
	 * @Desciption :结课
	 * @param openId
	 * @return flag:1:成功，0:失败
	 * 			msg:提示信息
	 */
	@RequestMapping("/over.html")
	@ResponseBody
	public ModelMap overCourse(Integer openId){
		ModelMap model = new ModelMap();
		Integer flag = openCourseService.overCourse(openId);
		if (flag ==1) {
			return model.addAttribute("flag", "1")
					.addAttribute("msg", "结课成功！");
		}
		return model.addAttribute("flag", "0")
					.addAttribute("msg", "结课失败！");
		
	}
	/**
	 * 
	 * @param baseConditionVO
	 * @param courseId
	 * @param isEnd
	 * @param model
	 * @Description:添加学生的列表页面 
	 * @return 
	 */
	@RequestMapping(value = "/addStu.html",method = RequestMethod.GET)
	public String  toAddStudent(ModelMap model,HttpSession session) {
		//查询课程类别
	    SchoolPo schoolPo =(SchoolPo) session.getAttribute(Static.SCHOOL_SESSION);
        Integer schoolId = schoolPo.getSchoolId();
		 List<CourseTypePo> courseTypePos = courseTypeService.findAllCourseTypesName(schoolId);
		 model.addAttribute("courseTypePos", courseTypePos);
		return "/admin/course/open/addStudent";
		
	}
	
	/**
	 * 
	 * @param baseConditionVO
	 * @param courseId
	 * @param isEnd
	 * @param model
	 * @Description:添加学生的列表页面 
	 * @return 
	 */
	@RequestMapping(value = "/addStu.html", method = RequestMethod.POST)
	@ResponseBody
	public ModelMap  addStudent(PageBean pageBean,Integer courseId,Integer isEnd,String courseName) {
		pageBean.setSchoolId(1);
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("courseName", courseName);
		params.put("isEnd", isEnd);
		pageBean.params = params;
		//查询开课信息
		 pageBean = openCourseService.findOpenCourses(pageBean);
		 ModelMap model = new ModelMap();
		 model.addAttribute("page", pageBean);
		return model;
		
	}
	
	/**
	 * 跳转到导入添加学生页面
	 * @param openId
	 * @param courseName
	 * @param model
	 * @return
	 */
	@RequestMapping("/toImportStudents.html")
	public String toImportStudents(Integer openId,String courseName,ModelMap model){
		model.addAttribute("openId", openId)
			 .addAttribute("courseName", courseName);
		return "/admin/course/open/importStudents";
		
	}
	/**
	 * 批量导入学生
	 * @param model
	 * @param openId
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping("/importStudents.html")
	@ResponseBody
	public ModelMap importStudents(ModelMap model,@RequestParam(value="openId")Integer openId,			
			@RequestParam(value= "file", required = false) MultipartFile file,
			HttpServletRequest request,HttpSession session) {
		SchoolPo schoolPo=(SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		//该集合用于存放excel中的学生学号
		List<Integer> studentNums = new ArrayList<Integer>();
		Integer flag=null;
		//存放学生Id
		List<Integer> studentIds = new ArrayList<Integer>();
		String fileDir = request.getSession().getServletContext().getRealPath("/") + "upload/importStudents/";
		File file1 = new File(fileDir);
		try {
			if  (!file1.exists())      
        	{       
        		System.out.println("//不存在");
        		file1.mkdirs();  
        	} 
        	String filePath=fileDir+new Date().getTime()+".xls";
        	// 转存文件  
        	file.transferTo(new File(filePath));
        	studentNums = readStudentExcel.readXls(filePath);
        	for (int i = 0; i < studentNums.size(); i++) {
				System.out.println(studentNums.get(i));
			}
        	//根据学号查询学生的ID
        	studentIds = studentService.findIdByNums(studentNums,schoolPo.getSchoolId());
        
        	
        	//批量插入
        	flag=openCourseService.importStudents(openId,studentIds);
		} catch (Exception e) {
		
			return model.addAttribute("flag", 0);
				
		}
		return model.addAttribute("flag", flag);
			
	}
	
	/**
	 * 查看选课的学生
	 * @param baseConditionVO
	 * @param openId
	 * @param name
	 * @param number
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/toOpenCourseStudents.html", method=RequestMethod.GET)
	public String  toOpenCourseStudents(Integer openId,ModelMap map) {
		map.addAttribute("openId", openId);
		return "/admin/course/open/detailStudent";
		
	}
	/**
	 * 查看选课的学生
	 * @param baseConditionVO
	 * @param openId
	 * @param name
	 * @param number
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/toOpenCourseStudents.html",method = RequestMethod.POST)
	@ResponseBody
	public ModelMap  openCourseStudents(PageBean pageBean,Integer openId,
			String name,String number) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("openId", openId);
		map.put("name", name);
		map.put("number", number);
		pageBean.params = map;
		pageBean = openCourseService.findOpenCourseStudents(pageBean);
		ModelMap model = new ModelMap();
		model.addAttribute("page", pageBean);
		return model;
		
	}
	/**
	 * 删除选课的学生
	 * @param studentId
	 * @param model
	 * @return
	 */
	@RequestMapping("/delCourseStudent.html")
	@ResponseBody
	public ModelMap delCourseStudent(Integer studentId,Integer openId,ModelMap model) {
		int flag = openCourseService.delCourseStudent(studentId,openId);
		if (flag ==0) {
			return model.addAttribute("flag", flag)
				    .addAttribute("msg", "退选失败！");
		}
		return model.addAttribute("flag", flag)
			    .addAttribute("msg", "退选成功！")
			    .addAttribute("openId", openId);
		
	}
	@RequestMapping("/addCourseStudent.html")
	@ResponseBody
	public ModelMap addCourseStudent(Integer openId,ModelMap model,HttpSession session){
		UserPo baseUser = (UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
		SchoolPo schoolPo=(SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		Integer userId = baseUser.getUserId();
		Integer studentId = baseUser.getStudentPo().getId();
		//根据userId,查询studentId
		//Integer studentId = studentService.findStudentId(userId);
		studyService.addStudentPaperOfTest(openId, schoolPo.getSchoolId(), studentId);
		int flag = openCourseService.addCourseStudent(openId,studentId);
		if (flag ==0) {
			return model.addAttribute("flag", flag)
				    .addAttribute("msg", "添加学生选课失败");
		}
		return model.addAttribute("flag", flag)
			    .addAttribute("msg", "添加学生选课成功")
			    .addAttribute("openId", openId);
		
	}
    
    @RequestMapping("/findIndexOpencourse.html")
    public String findIndexOpencourse(BaseConditionVO baseConditionVO,ModelMap model,HttpSession session){
        SchoolPo schoolPo =(SchoolPo) session.getAttribute(Static.SCHOOL_SESSION);
        Integer schoolId = schoolPo.getSchoolId();
    	List<OpenCourseVo> openCourseVos = openCourseService.findIndexOpencourse(baseConditionVO,schoolId);
    	model.addAttribute("openCourseVos", openCourseVos)
    		 .addAttribute("page", baseConditionVO);
		return "/home/search";
    	
    	
    }
}
