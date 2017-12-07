package com.yz.center.controller.course;

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
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.yz.center.model.form.CourseForm;
import com.yz.center.model.form.FileForm;
import com.yz.center.model.po.course.CoursePo;
import com.yz.center.model.po.course.CourseTypePo;
import com.yz.center.model.po.course.CoverPo;
import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.service.iface.course.CourseChapterService;
import com.yz.center.service.iface.course.CourseService;
import com.yz.center.service.iface.course.CourseTypeService;
import com.yz.center.service.iface.lecturer.LecturerService;
import com.yz.center.service.iface.resource.ResourceService;
import com.yz.center.service.iface.user.UserService;
import com.yz.center.util.BaseUtil;
import com.yz.center.util.CommonUtil;
import com.yz.center.util.Static;
import com.yz.center.util.common.PageBean;

@Controller
@RequestMapping("admin/course")

public class CourseController{

	@Resource
	private CourseService courseService;
	
	@Resource
    private CourseChapterService courseChapterService;
    @Resource
    private UserService userService;
    
    @Resource
    private CourseTypeService courseTypeService;
    
    @Resource
    private ResourceService resourceService;
    
    @Resource
    private LecturerService lecturerService;

    /**
     * zz findCourseNamebyTypeId
     * @param courseTypeId
     * @param model
     * @return
     */
	@RequestMapping(value = "/findCourseNamebyTypeId.html",method = RequestMethod.POST)
	@ResponseBody
	public ModelMap findcourseNameBytypeId(Integer courseTypeId,ModelMap model){
		List<CoursePo> coursePos = courseService.findCourseNameByTypeId(courseTypeId);
		return model.addAttribute("coursePos", coursePos)
					.addAttribute("flag", "1");
	}
	
    //跳转建课页面
    @RequestMapping(value="/add",method = RequestMethod.GET)
    public String toAddCourse(ModelMap model){
        List<CourseTypePo> courseTypes = courseTypeService.findAllTypes();
        model.addAttribute("courseTypes", courseTypes);
        return "admin/course/addCourse";
    }
    
    //跳转建课页面
    @RequestMapping("/toEditCourse")
    public String toEditCourse(ModelMap model,Integer courseId){
        CoursePo coursePo = courseService.getCourseByCourseId(courseId);
        CoverPo cover = coursePo.getCover();
        if(cover!=null){
        cover.setMaxUrl(BaseUtil.getValueFormProperties("uploadPath")+"/"+cover.getMaxUrl());
        coursePo.setCover(cover);
        }
        List<CourseTypePo> courseTypes = courseTypeService.findAllTypes();
        model.addAttribute("courseTypes", courseTypes);
        model.addAttribute("course", coursePo);
        model.addAttribute("type", 1);
        System.out.println(coursePo);
        return "admin/course/editCourse";
    }
    
    /**   
     * @return FileForm
     * @Title: uploadCover   
     * @Description:上传封面
    */
    @RequestMapping("/uploadCover")
    @ResponseBody
    public FileForm uploadCover(@RequestParam(value="fileData") CommonsMultipartFile fileData,
                    final HttpServletRequest request) throws Exception {
        FileForm fileForm = null;
        try{
            fileForm = resourceService.add(fileData, "/cover", request);
        }catch(Exception e){
            e.printStackTrace();
        }
        return fileForm;
    }
    
	/**   
     * @Title: addStepOne   
     * @Description:建课第一步 
     * @param coursePo 添加的课程信息
     * @return ModelMap  flag:1:成功，0:失败
     *                   msg:提示信息
	 * @throws Exception 
    */
    @RequestMapping(value ="/add/1.html")	
	@ResponseBody
    public ModelMap addStepOne(CourseForm courseForm,
            final HttpServletRequest request,
            HttpSession session) throws Exception{
    	SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
    	UserPo user = (UserPo)session.getAttribute(Static.LOGIN_USER_SESSION);
    	//建课第一步
        courseForm.setSchoolId(school.getSchoolId());
        courseForm.setCreateUserId(user.getUserId());
        ModelMap model = new ModelMap();
        System.out.println(courseForm.getClasshour());
        int flag = courseService.addStepOne(courseForm);
        System.out.println(flag);
        if(flag == CommonUtil.FLAG_FAILD){
        	model.addAttribute("flag", flag)
        		  .addAttribute("msg", "保存失败");
        }
        model.addAttribute("courseId", courseForm.getCourseId())
        	 .addAttribute("flag", flag)
        	 .addAttribute("msg", "保存成功");
        return model;
    }
    
    @RequestMapping(value ="/update/1.html")	
	@ResponseBody
    public ModelMap updateOne(CourseForm courseForm,
            HttpServletRequest request,
            HttpSession session){
    	SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
    	UserPo user = (UserPo)session.getAttribute(Static.LOGIN_USER_SESSION);
        courseForm.setSchoolId(school.getSchoolId());
        courseForm.setCreateUserId(user.getUserId());
        courseForm.setUpdateDt(new Date());
        int flag = courseService.updateCourseInfo(courseForm);
        //lecturerService.delAllLecturer(courseForm.getCourseId());
    	ModelMap model = new ModelMap();
    	if(flag == 0){
    		return model.addAttribute("flag", flag)
    					.addAttribute("msg", "修改失败");
    	}
    	return model.addAttribute("flag", flag)
    				.addAttribute("msg", "修改成功");
    }
    
    
    /**   
     * @Title: toCourseList   
     * @Description:跳转课程列表 
     * @return String
     */
    @RequestMapping(value = "/list" , method = RequestMethod.GET)
    public String courseList(){
    	return "admin/course/courseList";
    }
    
    /**   
     * @Title: toCourseList   
     * @Description:跳转课程列表 
     * @return String
    */
    @RequestMapping(value = "/list" , method = RequestMethod.POST)
    @ResponseBody
    public ModelMap toCourseList(PageBean pageBean,HttpSession session){
    	SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		UserPo user = (UserPo)session.getAttribute(Static.LOGIN_USER_SESSION);
        pageBean.setUserId(user.getUserId());
        pageBean.setSchoolId(school.getSchoolId());
        pageBean = courseService.findCourses(pageBean);
        ModelMap map = new ModelMap();
        map.addAttribute("page", pageBean);
        return map;
    }
    
    @RequestMapping("/add/3")
    @ResponseBody
    public int saveCourseType(Integer courseId,Integer courseType){
        int flag= 0;
        try{
            flag = courseService.saveCourseType(courseId,courseType);
        }catch(Exception e){
            e.printStackTrace();
        }
        courseService.updateDtByCourseId(courseId);
        return flag;
    }
    
    /**   
     * @Title: delCourse   
     * @Description:单条删除课程数据 
     * @param courseId 课程ID
     * @return ModelMap
    */
    @RequestMapping("/delCourse")
    @ResponseBody
    public ModelMap delCourse(int courseId){
        ModelMap model = new ModelMap();
        int flag = courseService.removeCourse(courseId);
        if(0 == flag){
            return model.addAttribute("flag", flag)
                        .addAttribute("msg", "删除课程类别失败");
        }
        return model.addAttribute("flag", flag)
                .addAttribute("msg", "删除课程类别成功");
    }
    
    
    /**   
     * @Title: delAllCourse   
     * @Description:删除多条课程数据 
     * @param courseId 课程ID
     * @return ModelMap
     * @throws Exception 
    */
    @RequestMapping("/delAllCourse")
    @ResponseBody
    public int delAllCourse(@RequestParam(value="courseIds[]") Integer courseIds[]) throws Exception{
            int flag = 0;
            try{
                for(int i=0;i<courseIds.length;i++){
                    flag = courseService.removeCourse(courseIds[i]);
                    if(flag==0) break;
                }
            }
            catch(Exception e){
                    flag=0;
                  throw new Exception();
            }
            return flag;
    }
    /**   
     * @Title: delCover   
     * @Description:删除封面 
     * @param coverId 封面ID
     * @return ModelMap
    */
    @RequestMapping("/delCover")
    @ResponseBody
    public ModelMap delCover(ModelMap model,Integer coverId,Integer courseId){
        int flag = 0;
        if(courseId!=null){
        	 flag = courseService.delCourseCover(courseId);
        }else{
        	 flag = courseService.delCover(coverId);
        }
        if(0 == flag){
            return model.addAttribute("flag", flag)
                        .addAttribute("msg", "删除封面失败！");
        }
        return model.addAttribute("flag", flag)
                .addAttribute("msg", "删除封面成功！");
    }
}
