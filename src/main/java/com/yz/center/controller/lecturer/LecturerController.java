package com.yz.center.controller.lecturer;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.yz.center.model.po.course.LecturerPo;
import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.model.vo.BaseConditionVO;
import com.yz.center.service.iface.lecturer.LecturerService;
import com.yz.center.util.Static;
import com.yz.center.util.common.PageBean;

@Controller
@RequestMapping("admin/lecturer")
public class LecturerController {
	@Resource
	private LecturerService lecturerService;
    /**   
     * @Title: lecturerAdd   
     * @Description:添加或讲师 
     * @param session 获取学校id
     * @param lecturerPo 添加或修改的讲师信息
     * @return ModelMap  flag:1:成功，0:失败
     *                   msg:提示信息
    */
    @RequestMapping(value ="/lecturerAdd.html",method=RequestMethod.POST)	
	@ResponseBody
    public ModelMap lecturerAdd(LecturerPo lecturerPo,HttpSession session){
    	ModelMap model = new ModelMap();
    	SchoolPo schoolPo =(SchoolPo) session.getAttribute(Static.SCHOOL_SESSION);
        Integer schoolId = schoolPo.getSchoolId();
    	if (lecturerPo.getLecturerId()!=null) {
    		int flag = lecturerService.lecturerUpdate(lecturerPo);
    		if(0 == flag){
                return model.addAttribute("flag", flag)
                            .addAttribute("msg", "修改失败!");
            }
            return model.addAttribute("flag", flag).addAttribute("msg", "修改成功!");
		}else{
			int flag = lecturerService.lecturerAdd(lecturerPo,schoolId);
			if(0 == flag){
	             return model.addAttribute("flag", flag)
	                         .addAttribute("msg", "新建失败!");
	         }
	         return model.addAttribute("flag", flag).addAttribute("msg", "新建成功!");
		}
    	 
      
    }
    
    @RequestMapping("/lecturerList")
    @ResponseBody
    public List<LecturerPo> lecturerList(String lecturerName,ModelMap model){
        List<LecturerPo> lecturers = lecturerService.getLecturers(lecturerName);
        return lecturers;
    }
    
    /**   
     * @Title: lecturerDel   
     * @Description:删除讲师 
     * @param lecturerId 讲师id
     * @return ModelMap  flag:1:成功，0:失败
     *                   msg:提示信息
    */
    @RequestMapping(value ="/lecturerDel.html",method=RequestMethod.POST)	
	@ResponseBody
    public ModelMap lecturerDel(Integer lecturerId){
    	ModelMap model = new ModelMap();
    	int flag = lecturerService.lecturerDel(lecturerId);
    	 if(0 == flag){
             return model.addAttribute("flag", flag)
                         .addAttribute("msg", "删除失败!");
         }
         return model.addAttribute("flag", flag).addAttribute("msg", "删除成功!");
      
    }
    /**   
     * @Title: lecturersDel   
     * @Description:批量删除讲师 
     * @param lecturerId 讲师id
     * @return ModelMap  flag:1:成功，0:失败
     *                   msg:提示信息
    */
    @RequestMapping(value ="/lecturersDel.html",method=RequestMethod.POST)	
	@ResponseBody
    public ModelMap lecturersDel(String lecturerIds){
    	ModelMap model = new ModelMap();
    	int flag = lecturerService.lecturersDel(lecturerIds);
    	 if(0 == flag){
             return model.addAttribute("flag", flag)
                         .addAttribute("msg", "批量删除失败!");
         }
         return model.addAttribute("flag", flag).addAttribute("msg", "批量删除成功!");
      
    }
    @RequestMapping("/findMoreLecturerInfo.html")
    public  String findMoreLecturerInfo(BaseConditionVO baseConditionVO,ModelMap modelMap){
    
    	List<LecturerPo> lecturerPos = lecturerService.findMoreLecturerInfo(baseConditionVO);
    	modelMap.addAttribute("lecturerPos", lecturerPos)
    			.addAttribute("baseConditionVO", baseConditionVO);
		return "home/moreTeacher";
    	
    }
    
    /**   
     * @Title: list   
     * @Description:跳转讲师列表 
     * @return admin/lecturer/list 
     *                   
    */
    @RequestMapping(value ="/list.html",method=RequestMethod.GET)	
    public String list(){
         return "admin/lecturer/list";
    }
    /**   
     * @Title: list   
     * @Description:讲师信息列表 
     * @param pageBean 
     * @param name  讲师名字
     * @param position 职位
     * @param session  获取schoolId
     * @return ModelMap  pageBean
     *                   
    */
    @RequestMapping(value ="/list.html",method=RequestMethod.POST)
    @ResponseBody
    public ModelMap list(PageBean pageBean,String name,String position,HttpSession session){
    	SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
    	pageBean.setSchoolId(school.getSchoolId());
    	pageBean=lecturerService.getLecturersByCondition(pageBean,name, position);
    	ModelMap model = new ModelMap();
    	model.addAttribute("page", pageBean);
    	return model;
    }
    /**   
     * @Title: add   
     * @Description:添加与修改讲师 
     * @param map 存放修改回显讲师对象lecturerPo
     * @param lecturerId  讲师id
     * @param session  获取schoolId
     * @return String  
     *                   
    */
    @RequestMapping(value ="/add.html",method=RequestMethod.GET)	
    public String add(Integer lecturerId,ModelMap map){
    	if (lecturerId!=null) {
    		LecturerPo lecturerPo = lecturerService.getLecturer(lecturerId);
    		map.addAttribute("lecturerPo", lecturerPo);
		}
         return "admin/lecturer/add";
    }
   
}