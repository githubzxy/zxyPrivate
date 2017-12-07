/**
  * @FileName: CourseTypeController.java
  * @Author 
  * @Description:
  * @Date 2016��10��24�� ����3:43:51
  * @CopyRight yazhuokj Corporation
  */

package com.yz.center.controller.course;

import java.io.File;
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
import com.yz.center.model.po.course.CourseTypePo;
import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.service.iface.course.CourseTypeService;
import com.yz.center.service.iface.user.UserService;
import com.yz.center.util.BaseUtil;
import com.yz.center.util.CommonUtil;
import com.yz.center.util.Static;
import com.yz.center


.util.common.PageBean;

 
@Controller
@RequestMapping("admin/course/type")

public class CourseTypeController{

          
    
    @Resource
    private CourseTypeService courseTypeService;
    
    @Resource
    private UserService userService;
    
    /**   
     * @Title: toList   
     * @Description:跳转课程类别列表
     * @param model
     * @return String
    */
    @RequestMapping(value = "/list.html",method=RequestMethod.GET)
    public String toCourseTypeList(){
        return "/admin/course/type/list";
    }
    
    
    /**   
     * @Title: getTypeList   
     * @Description:分页获取课程类别列表  
     * @param vo 分页条件
     * @return PageDatagridBean
    */
    @RequestMapping(value = "/list.html",method=RequestMethod.POST)
    @ResponseBody
    public ModelMap getTypeList(PageBean pageBean,HttpSession session){
    	SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
    	pageBean.setSchoolId(school.getSchoolId());
    	ModelMap map = new ModelMap();
    	pageBean = courseTypeService.findCourseTypes(pageBean);
        map.addAttribute("page", pageBean);
        return map;
    }
    
    /**   
     * @Title: toAddCourseType   
     * @Description:跳转新增课程类别页面 
     * @return String
    */
    @RequestMapping(value="/add.html", method =RequestMethod.GET)
    public String toAddCourseType(ModelMap map){
    	List<CourseTypePo> list = courseTypeService.findPatrentType();
    	map.addAttribute("typeList", list);
        return "/admin/course/type/add";
    }
    
    
    /**   
     * @Title: addCourseType   
     * @Description:添加课程类别 
     * @param courseTypePo 添加的课程信息
     * @return ModelMap  flag:1:成功，0:失败
     *                   msg:提示信息
     * @throws Exception 
     *  
    */
    @RequestMapping(value = "/add.html",method = RequestMethod.POST)
    @ResponseBody
    public ModelMap addCourseType(@RequestParam(value = "file", required = false) CommonsMultipartFile file,
    		CourseTypePo courseTypePo,HttpSession session,HttpServletRequest request) throws Exception{

        ModelMap model = new ModelMap();
        UserPo loginUser = (UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
        SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
        courseTypePo.setSchoolId(school.getSchoolId());
        String url = BaseUtil.getValueFormProperties("courseTypeImgRul");
        System.out.println("hand:"+url);
        File file1 = new File(url);
        if  (!file1.exists())      
    	{       
    		file1.mkdirs();  
    	} 
        	//FileForm fileform = CommonUtil.add(file, url, request,0);
        String fileRul = CommonUtil.uploadImg(file, url,request);	
        courseTypePo.setUrl(fileRul);
        int flag = courseTypeService.addCourseType(courseTypePo,loginUser);
        if(0 == flag){
            return model.addAttribute("flag", flag)
                        .addAttribute("msg", "添加课程类别失败");
        }
        return model.addAttribute("flag", flag)
                .addAttribute("msg", "添加课程类别成功！");
    }
    
    /**   
     * @Title: toUpdateCourseType   
     * @Description:跳转更新课程类别页面
     * @param model
     * @param courseTypeId
     * @return String
    */
    @RequestMapping(value = "/update.html",method = RequestMethod.GET)
    public String toUpdateCourseType(ModelMap model, Integer courseTypeId){
        CourseTypePo type = courseTypeService.findCourseType(courseTypeId);
        List<CourseTypePo> list = courseTypeService.findPatrentType();
        model.addAttribute("typeList", list);
        model.addAttribute("type", type);
        return "/admin/course/type/modify";
    }
    
    /**   
     * @Title: updateCourseType   
     * @Description:修改课程类别信息  
     * @param courseTypePo 课程类别信息
     * @return ModelMap flag:1:成功，0:失败
     *                   msg:提示信息
    */
    @RequestMapping(value="/update.html", method = RequestMethod.POST)
    @ResponseBody
    public ModelMap modifyCourseType(
    		HttpServletRequest request,
    		@RequestParam(value = "file", required = false) CommonsMultipartFile file,
    		CourseTypePo courseTypePo,HttpSession session){
        ModelMap model = new ModelMap();
        UserPo loginUser = (UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
        SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
        courseTypePo.setSchoolId(school.getSchoolId());
        if(!file.isEmpty() && file != null){
        	String url = BaseUtil.getValueFormProperties("courseTypeImgRul");
        	File file1 = new File(url);
        	if  (!file1.exists())      
        	{       
        		file1.mkdirs();  
        	} 
        	String fileRul = CommonUtil.uploadImg(file, url,request);	
    		courseTypePo.setUrl(fileRul);
    	}
        int flag = courseTypeService.modifyCourseType(courseTypePo,loginUser);
        if(0 == flag){
            return model.addAttribute("flag", flag)
                        .addAttribute("msg", "修改课程类别失败");
        }
        return model.addAttribute("flag", flag)
                .addAttribute("msg", "修改课程类别成功");
    }
    
    
    /**   
     * @Title: deleteCourseType   
     * @Description: 删除课程类别
     * @param courseId  课程类别ID
     * @return ModelMap  flag:1:成功，0:失败
     *                   msg:提示信息
    */
    @RequestMapping(value="/delete.html",method=RequestMethod.POST)
    @ResponseBody
    public ModelMap deleteCourseType(Integer courseTypeId){
        ModelMap model = new ModelMap();
        int flag = courseTypeService.removeCourseType(courseTypeId);
        if(0 == flag){
            return model.addAttribute("flag", flag)
                        .addAttribute("msg", "删除课程类别失败");
        }

        return model.addAttribute("flag", flag)
                .addAttribute("msg", "删除课程类别成功");
    }
    
    
    /**   
     * @Title: deleteAllCourseType   
     * @Description:删除多条课程类别数据
     * @param ids 课程类别ID组成的数组
     * @return ModelMap  flag:1:成功，0:失败
     *                   msg:提示信息
    */
    @RequestMapping(value = "/delMany.html",method = RequestMethod.POST)
    @ResponseBody
    public ModelMap deleteAllCourseType(@RequestParam(value="typeIds[]")int typeIds[]){
        ModelMap model = new ModelMap();
        int flag = courseTypeService.removeAllCourseType(typeIds);
        if(0 == flag){
            return model.addAttribute("flag", flag)
                        .addAttribute("msg", "批量删除课程类别失败");
        }
       
        return model.addAttribute("flag", flag)
                .addAttribute("msg", "批量删除课程类别成功");
    }
	
}
