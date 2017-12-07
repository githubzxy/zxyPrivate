/**
  * @FileName: ResourceController.java
  * @Author 
  * @Description:
  * @Date 2016年9月8日 上午10:46:00
  * @CopyRight yazhuokj Corporation
  */
package com.yz.center.controller.school.Resource;

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
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.yz.center.model.form.FileForm;
import com.yz.center.model.po.course.CoursePo;
import com.yz.center.model.po.resource.ResourcePo;
import com.yz.center.model.po.resource.ResourceTypePo;
import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.service.iface.course.CourseService;
import com.yz.center.service.iface.resource.ResourceService;
import com.yz.center.util.Static;
import com.yz.center.util.common.PageBean;



@Controller
@RequestMapping("resource")
public class ResourceController{
    
    @Resource
    private ResourceService resourceService;
    
    @Resource
    private CourseService courseService;
    
    @RequestMapping(value = "/publicList", method = RequestMethod.GET)
    public String toList() {
        return "admin/resource/publicList";
    }
    
    /**   
     * @return Integer
     * @Title: toResourceList   
     * @Description:公共资源列表
    */
    @RequestMapping(value = "/publicList", method = RequestMethod.POST)
    @ResponseBody
    public ModelMap resourceList(PageBean pageBean,HttpSession session) {
    	SchoolPo schoolPo = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
    	pageBean.setSchoolId(schoolPo.getSchoolId());
        pageBean = resourceService.getResourceList(pageBean);
        ModelMap map = new ModelMap();
        map.addAttribute("page", pageBean);
        return map;
    }
    
    /**   
     * @return Integer
     * @Title: toResourceList1   
     * @Description:课程资源列表
    */
    @RequestMapping(value = "/courseResList", method=RequestMethod.GET)
    public String toCourseResList(ModelMap map) {
        List<CoursePo> courseList = courseService.getAllCource();
        map.addAttribute("courseList", courseList);
        return "admin/resource/courseResList" ;
    }
    
    /**   
     * @return Integer
     * @Title: toResourceList1   
     * @Description:课程资源列表
    */
    @RequestMapping(value = "/courseResList", method=RequestMethod.POST)
    @ResponseBody
    public ModelMap courseResList(PageBean pageBean,HttpSession session) {
    	SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		Integer schoolId = school.getSchoolId();
		pageBean.setSchoolId(schoolId);
        pageBean = resourceService.getCResourceList(pageBean);
        ModelMap map = new ModelMap();
        map.addAttribute("page", pageBean);
        return map ;
    }
    
    /**   
     * @return Integer
     * @Title: toResourceList2   
     * @Description:公共资源列表（我的）
    */
    @RequestMapping(value = "/myPublicList",method = RequestMethod.GET)
    public String toMyPublicList() {
        return "admin/resource/myPublicList" ;
    }
    
    /**   
     * @return Integer
     * @Title: toResourceList2   
     * @Description:公共资源列表（我的）
    */
    @RequestMapping(value = "/myPublicList", method = RequestMethod.POST)
    @ResponseBody
    public ModelMap myPublicList(PageBean pageBean,HttpSession session) {
    	SchoolPo schoolPo = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
    	UserPo userPo =(UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
        pageBean.setUserId(userPo.getUserId());
        pageBean.setSchoolId(schoolPo.getSchoolId());
        pageBean = resourceService.getResourceList(pageBean);
        ModelMap map = new ModelMap();
        map.addAttribute("page", pageBean);
        return map ;
    }
    
    /**   
     * @return Integer
     * @Title: toResourceList3   
     * @Description:课程资源列表（我的）
    */
    @RequestMapping(value = "/myCourseResList", method = RequestMethod.GET)
    public String toMyCourseResList(ModelMap map) {
        List<CoursePo> courseList = courseService.getAllCource();
        map.addAttribute("courseList", courseList);
        return "admin/resource/myCourseResList" ;
    }
    /**   
     * @return Integer
     * @Title: toResourceList3   
     * @Description:课程资源列表（我的）
    */
    @RequestMapping(value = "/myCourseResList", method = RequestMethod.POST)
    @ResponseBody
    public ModelMap myCourseResList(PageBean pageBean,HttpSession session) {
    	SchoolPo schoolPo = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
    	UserPo userPo =(UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
        pageBean.setUserId(userPo.getUserId());
        pageBean.setSchoolId(schoolPo.getSchoolId());
        pageBean = resourceService.getCResourceList(pageBean);
        ModelMap map = new ModelMap();
        map.addAttribute("page", pageBean);
        return map ;
    }
    /**   
     * @return Integer
     * @Title: toTypeList   
     * @Description:课程资源列表
    */
    @RequestMapping(value = "/typeList", method = RequestMethod.GET)
    public String toTypeList() {
        return "admin/resource/typeList" ;
    }
    
    /**   
     * @return Integer
     * @Title: toTypeList   
     * @Description:课程资源列表
    */
    @RequestMapping(value = "/typeList", method = RequestMethod.POST)
    @ResponseBody
    public ModelMap getTypeList(PageBean pageBean) {
        pageBean = resourceService.getTypeList(pageBean);
        ModelMap map = new ModelMap();
        map.addAttribute("page", pageBean);
        return map;
    }
    
    /**   
     * @return Integer
     * @Title: toUploadRes   
     * @Description:上传资源页面
    */
    @RequestMapping(value = "/toUploadRes" , method = RequestMethod.GET)
    public String toUploadRes() {
        return "admin/resource/uploadRes" ;
    }
    /**   
     * @return Integer
     * @Title: toUploadRes   
     * @Description:上传资源页面
    */
    @RequestMapping(value = "/toUploadRes" , method = RequestMethod.POST)
    @ResponseBody
    public ModelMap toUploadRes(PageBean pageBean,HttpSession session) {
    	  System.out.println("haha--------");
    	SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		Integer schoolId = school.getSchoolId();
		pageBean.setSchoolId(schoolId);
        pageBean = courseService.findCourses(pageBean);
        System.out.println("haha"+pageBean.getList());
        ModelMap map = new ModelMap();
        map.addAttribute("page",pageBean);
        return map ;
    }
    
    /**   
     * @return FileForm
     * @Title: toUploadRes   
     * @Description:uploadify上传资源
    */
    @RequestMapping(value = "/uploadRes" , method = RequestMethod.POST)
    @ResponseBody
    public FileForm uploadRes(
                    @RequestParam(value="fileData") CommonsMultipartFile fileData,
                    final HttpServletRequest request,Integer courseId,Integer type) throws Exception {
        FileForm fileForm = null;
        try{
        	if(type == 1){
        		if(courseId == 0){
        			fileForm = resourceService.add(fileData, "resource/publicfiles", request);
        		}else{
        			fileForm = resourceService.add(fileData, "resource/"+courseId+"/video", request);
        		}
        	}else{
        		fileForm = resourceService.add(fileData, "resource/"+courseId+"/files", request);
        	}
        }catch(Exception e){
            e.printStackTrace();
        }
        return fileForm;
    }
    /**   
     * @return FileForm
     * @Title: toUploadRes   
     * @Description:百度上传资源
    */
    @RequestMapping(value = "/uploadRes2" , method = RequestMethod.POST)
    @ResponseBody
    public FileForm uploadRes2(
    		@RequestParam(value = "file", required = false) MultipartFile file,
                    final HttpServletRequest request,Integer courseId,String resourceType) throws Exception {
        FileForm fileForm = null;
        try{
        	if(resourceType.equals("1")){
        		if(courseId == 0){
        			fileForm = resourceService.add2(file, "resource/publicfiles", request);
        		}else{
        			fileForm = resourceService.add2(file, "resource/"+courseId+"/video", request);
        		}
        	}else{
        		fileForm = resourceService.add2(file, "resource/"+courseId+"/files", request);
        	}
        }catch(Exception e){
        	
        	
        	
        	
        	
        	
            e.printStackTrace();
        }
        return fileForm;
    }
    /**   
     * @return String
     * @Title: addResType   
     * @Description:新建类别
    */
    @RequestMapping("/addResType")
    @ResponseBody
    public Integer addResType(ResourceTypePo resourceType) {
        int flag;
        if(resourceType.getId()!=null){
            flag = resourceService.updateRestype(resourceType);
        }else{
            resourceType.setCreateDt(new Date());
            flag = resourceService.addResType(resourceType);
        }
        return flag;
    }
    
    /**   
     * @return String
     * @Title: toAddresType   
     * @Description:新建类别页面
    */
    @RequestMapping("/toAddresType")
    public String toAddresType(ModelMap model, PageBean vo,Integer id) {
        if(id!=null){
            ResourceTypePo resourceType = resourceService.getResourceTypeById(id);
            model.addAttribute("resourceType", resourceType);
        }
        return "admin/resource/addresType" ;
    }
    /**
     *@return String
     * @Title: delResource   
     * @Description:删除资源,改变state的值,非真删
     */
    @RequestMapping("/delResource")
    @ResponseBody
    public ModelMap delResource(Integer fileId,Integer fileType){
        int flag = resourceService.delResource(fileId,fileType);
        ModelMap model=new ModelMap();
        if(flag == 1){
        	model.addAttribute("flag", flag) .addAttribute("msg", "删除成功!");
        }else {
        	model.addAttribute("msg", "删除失败!");
        }
        return model;
    }
    /**
     *@return String
     * @Title: delResource   
     * @Description:删除资源,同时ftp删除
     */
    @RequestMapping("/delFtpResource")
    @ResponseBody
    public ModelMap delPublicResource(Integer fileId,Integer fileType){
        int flag = resourceService.delFtpResource(fileId,fileType);
        ModelMap model=new ModelMap();
        if(flag == 1){
        	model.addAttribute("flag", flag) .addAttribute("msg", "删除成功!");
        }else {
        	model.addAttribute("msg", "删除失败!");
        }
        return model;
    }
    
    
    /**
     *@return String
     * @Title: delResource   
     * @Description:删除资源类别
     */
    @RequestMapping("/delResourceType")
    @ResponseBody
    public ModelMap delResourceType(Integer fileTypeId){
        int flag = resourceService.delResourceType(fileTypeId);
        ModelMap model=new ModelMap();
        if(flag == 1){
        	model.addAttribute("flag", flag) .addAttribute("msg", "删除成功！");
        }else {
        	model.addAttribute("msg", "删除失败！");
        }
        return model;
    }
    /**
     *@return ModelMap
     * @Title: delAllResourceType   
     * @Description:批量删除资源类别
     * @param fileTypeIds  资源类别id集合，以逗号隔开
     * @return ModelMap  flag:1:成功，0:失败
     *                   msg:提示信息 
    */
    @RequestMapping(value = "/delAllResourceType", method = RequestMethod.POST)
    @ResponseBody
    public ModelMap delAllResourceType(String fileTypeIds){
    	int flag =resourceService.delAllResourceType(fileTypeIds);
    	ModelMap model=new ModelMap();
    	if(flag == 0){
    		model.addAttribute("flag", flag).addAttribute("msg", "批量删除失败！");

    	}
    	return model.addAttribute("flag", flag) .addAttribute("msg", "批量删除成功！");
    }
    
    /**
     *@return String
     * @throws Exception 
     * @Title: delAll   
     * @Description:批量删除资源
     */
    @RequestMapping("/delAll")
    @ResponseBody
    public Integer delAll(@RequestParam(value="fileIds[]") Integer fileIds[],Integer fileType) throws Exception{
        int flag=0;
        try{
            for(int i=0;i<fileIds.length;i++){
                flag = resourceService.delResource(fileIds[i],fileType);
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
     *@return String
     * @Title: delResource   
     * @Description:审核资源
     */
    @RequestMapping("/checkRes")
    @ResponseBody
    public Integer checkRes(Integer fileId,Integer type,Integer fileType){
        Integer state = 0;
        if(type==-1){
            state=3;
        }
        if(type==1){
        	state=2;
        }
        int flag = resourceService.checkRes(fileId,state,fileType);
        return flag;
    }
    /**
     *@return String
     * @Title: delResource   
     * @Description:分享资源
     */
    @RequestMapping("/shareRes")
    @ResponseBody
    public Integer shareRes(Integer fileId,Integer type,Integer fileType){
        Integer state = 0;
        if(type==-1){
            state=1;
        }
        if(type==1){
            state=2;
        }
        int flag = resourceService.checkRes(fileId,state,fileType);
        return flag;
    }
    
    /**
     *@return String
     * @Title: addResource   
     * @Description:添加资源
     */
    @RequestMapping("/addResource")
    @ResponseBody
    public String addResource(HttpServletRequest request,FileForm fileInfo,Integer courseId,HttpSession session){
        FileForm fileForm = resourceService.getTmpFileById(fileInfo.getId());
        System.out.println(fileForm);
        fileForm.setCreateDate(new Date());
        fileForm.setInfo(fileInfo.getInfo());
        System.out.println(fileForm.getUrl());
    	UserPo userPo =(UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
        fileForm.setCreatUserId(userPo.getUserId());
        fileForm.setResourceType(fileInfo.getResourceType());
        if(courseId != null && !"".equals(courseId)){
           // String[] courseIdss = courseIds.split(",");
           // for(int i= 0;i < courseIdss.length;i++){
             //   System.out.println(courseIdss[i]);
        		//fileForm.setId(null);
              	fileForm.setCourseId(courseId);
                resourceService.addResource(fileForm);
           // }
        }else{
            resourceService.addResource(fileForm);
        }
        return "SUCCESS";
    }
    /**
     *@return String
     * @Title: delResource   
     * @Description:审核资源
     */
    @RequestMapping("/setClickNum")
    @ResponseBody
    public Integer setClickNum(Integer fileId,Integer fileType){
        FileForm fileForm = resourceService.getResourceById(fileId,fileType);
        fileForm.setDownNum(fileForm.getDownNum()+1);
        fileForm.setResourceType(fileType);
        int flag = resourceService.setClickNum(fileForm);
        return flag;
    }
    
    /**   
     * @return Integer
     * @Title: getAllResource   
     * @Description:获取所有资源
    */
    @RequestMapping("/getAllResource")
    @ResponseBody
    public List<ResourcePo> getAllResource(ModelMap model) {
        List<ResourcePo> list = resourceService.getAllResource();
        return list;
    }
}