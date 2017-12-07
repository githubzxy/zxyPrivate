package com.yz.center.controller.banji;
import java.io.File;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.model.vo.ClassForm;
import com.yz.center.service.iface.myClass.ClassService;
import com.yz.center.util.ReadExcelClass;
import com.yz.center.util.Static;
import com.yz.center.util.common.PageBean;
@Controller
@RequestMapping("admin/class")
public class ClassController {
	@Resource
	ClassService classService;
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String toadd(ModelMap modelMap) {
			modelMap.addAttribute("grades",classService.getGradeList(1));
		return "admin/school/class/add";
	}
	
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	@ResponseBody
	public ModelMap add(ClassForm classForm,HttpSession session){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		UserPo user = (UserPo)session.getAttribute(Static.LOGIN_USER_SESSION);
		classForm.setSchoolId(school.getSchoolId());
		classForm.setCreateUserId(user.getUserId());
		ModelMap modelMap=new ModelMap();
		try{
			if(classService.getclassByName(classForm)!=null){
			modelMap.addAttribute("flag",2)
					.addAttribute("msg", "班级已经存在");
			return modelMap;
			}
			if(classService.addClass(classForm)>=1){
				modelMap.addAttribute("flag",1)
						.addAttribute("msg", "新增成功");
			}else{
				modelMap.addAttribute("flag",0)
						.addAttribute("msg", "新增失败");
			}
		}catch(Exception exception){
			modelMap.addAttribute("msg","新增失败");
		}
		return modelMap;
	}
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	 public String toList(PageBean pageBean){
		return "admin/school/class/list";
	 }
	
	@RequestMapping(value = "/list",method = RequestMethod.POST)
	@ResponseBody
	 public ModelMap list(PageBean pageBean,HttpSession session){
    	SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		Integer schoolId = school.getSchoolId();
		pageBean.setSchoolId(schoolId);
		pageBean=classService.getClassList(pageBean);
		ModelMap map = new ModelMap();
		map.put("page", pageBean);
		return map;
	 }
	@RequestMapping(value = "/update/{classId}",method = RequestMethod.GET)
	public String toupdate(@PathVariable("classId") Integer classId,ModelMap modelMap){
		modelMap.addAttribute("grades",classService.getGradeList(1));
		ClassForm classForm=classService.getClassById(classId);
		classForm.setClassId(classId);
		modelMap.addAttribute("classInfo",classForm);
		return "admin/school/class/update";
	}
	@RequestMapping(value= "/update", method = RequestMethod.POST)
	@ResponseBody
	public ModelMap update(ClassForm classForm){
		ModelMap modelMap=new ModelMap();
		try{
			if(classService.updateClass(classForm)>=1){
			modelMap.addAttribute("flag","修改成功");
			}else{
				modelMap.addAttribute("flag","修改失败");
			}
		}catch(Exception e){
			e.printStackTrace();
			modelMap.addAttribute("flag", "修改失败");
		}
		return modelMap;
	}
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public ModelMap del(String ids){
		ModelMap modelMap=new ModelMap();
		String[] idStr = ids.split(",");
		try{
			for(int i = 0 ; i < idStr.length; i++){
				classService.delete(Integer.parseInt(idStr[i]));
			}
			modelMap.addAttribute("flag",1)
					.addAttribute("msg", "删除成功");
		}catch(Exception e){
			modelMap.addAttribute("flag",0)
					.addAttribute("msg", "删除失败");
		}
		return modelMap;
	}
	
	@RequestMapping(value ="/import", method = RequestMethod.GET)
	public String toInsertCla(){
		return "admin/school/class/import";
	}
	@RequestMapping(value = "/import", method = RequestMethod.POST)
	@ResponseBody
	public String imp(@RequestParam("file") MultipartFile file,
			HttpServletRequest request, HttpSession session){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		String fileDir = request.getSession().getServletContext().getRealPath("/") + "upload/";
		File file1=new File(fileDir);
		try { 
        	if  (!file1.exists())      
        	{       
        		file1.mkdirs();  
        	} 
        	String filePath=fileDir+new Date().getTime();
        	// 转存文件  
        	file.transferTo(new File(filePath));
  	        List<ClassForm> classes=ReadExcelClass.readXls(filePath);
  	        for(ClassForm classForm:classes){
  	        	classForm.setSchoolId(school.getSchoolId());
  	        	String className=classForm.getName();
  	        	String gradeName=classForm.getGradeName();
  	        	String info=classForm.getInfo();
  	        	if(gradeName==null){
  	        		return "年级名称不能为空";
  	        	}else if(className==null){
  	        		return "班级名称不能为空";
  	        	}else if(info==null){
  	        		return "班级简介不能为空";
  	        	}
  	        	Integer gradeId=classService.getGradeIdByGradeName(gradeName).getGradeId();
  	        	if(classService.getclassByName(classForm)!=null){
  	        		return "该年级的班级已存在";
  	        	}
  	        	classForm.setGradeId(gradeId);
  	        }
  	        if(classService.addClasses(classes)==1){
  	  	     return "导入成功";
  	        }else{
  	        	return "导入失败";
  	        }
  	        }catch(Exception e){
  	        	e.printStackTrace();
  	        	return "导入失败";
  	        }
	}
}
