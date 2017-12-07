/**
  * @FileName: StudentController.java
  * @Author 
  * @Description:
  * @Date 2016��10��24�� ����3:45:28
  * @CopyRight yazhuokj Corporation
  */
package com.yz.center.controller.student;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

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

import com.yz.center.model.form.TeacherForm;
import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.model.vo.ClassForm;
import com.yz.center.model.vo.StudentForm;
import com.yz.center.model.vo.StudentVo;
import com.yz.center.service.iface.student.StudentService;
import com.yz.center.util.CommonUtil;
import com.yz.center.util.ReadExcel;
import com.yz.center.util.Static;
import com.yz.center.util.common.PageBean;

@Controller
@RequestMapping("admin/student")
public class StudentController {
	@Resource
	StudentService studentService;
	
	
	@RequestMapping(value = "/add",method = RequestMethod.GET)
	public String toAdd(ModelMap map,HttpSession session) {
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		map.addAttribute("grades",studentService.getGradeList(school.getSchoolId()));
		return "admin/student/add";
	}

	@RequestMapping(value = "/add",method = RequestMethod.POST)
	@ResponseBody
	public Integer addStudent(StudentForm studentAdd,HttpSession session) {
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		studentAdd.setSchoolId(school.getSchoolId());
		studentAdd.setRoleId("student");
		Integer flag=studentService.addStudent(studentAdd);
		return flag;
	}
	
	 /**   
     * @Title: validate
     * @Description:验证学生学号
     * @param teacherForm 学生学号 number 学校schoolId
     * @return ModelMap  flag:1:成功，0:失败
     *                   info:提示信息
    */
   @RequestMapping(value ="/validate.html",method=RequestMethod.POST)	
   	@ResponseBody
       public ModelMap validate(StudentForm studentForm,HttpSession session){
       	SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
       	studentForm.setSchoolId(school.getSchoolId());
        int flag = studentService.validate(studentForm);
       	ModelMap model = new ModelMap();
       	 if(1 == flag){
       		return model.addAttribute("status", "y");
            }else{
            	 return model.addAttribute("status", "n")
                         .addAttribute("info", "学号已存在！");
            }
       }
    
	@ResponseBody
	@RequestMapping(value = "/delete",method = RequestMethod.POST)
	public ModelMap del(String ids){
		ModelMap modelMap=new ModelMap();
		String[] idStr = ids.split(",");
		try{
			for(int i =0 ; i < idStr.length; i++){
				studentService.delete(Integer.parseInt(idStr[i]));
			}
			modelMap.addAttribute("flag", CommonUtil.FLAG_SUCESS)
					.addAttribute("msg", "删除成功");
		}catch(Exception exception){
			modelMap.addAttribute("flag", CommonUtil.FLAG_FAILD)
					.addAttribute("msg", "删除失败");
		}
		
		return modelMap;
	}
	@RequestMapping(value = "/update/{studentId}",method = RequestMethod.GET)
	public String toupdate(@PathVariable("studentId")Integer studentId,Map<String,Object> map,HttpServletRequest request){
		Map<String,Object> studentInfo=studentService.getStudentById(studentId);
		map.put("studentInfo", studentInfo);
		map.put("grades",studentService.getGradeList(1));
		return "admin/student/update";
	}
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	@ResponseBody
	public ModelMap update(StudentForm studentForm,Map<String,Integer> map,HttpServletRequest request){
		ModelMap modelMap=new ModelMap();
		Date birth;
		try{
			String birthday=studentForm.getBirthday();
			if(birthday!=null&&!birthday.equals("")){
				SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
				birth=format.parse(birthday);
			}else{
				birth=null;
			}
		Integer f=studentService.update(studentForm, birth);
		if(f==1){
			modelMap.addAttribute("flag",1).addAttribute("msg", "修改成功");
		}else{
			modelMap.addAttribute("flag",0).addAttribute("msg", "修改失败");		
		}
		
		}catch(Exception exception){
			exception.printStackTrace();
			modelMap.addAttribute("flag",0).addAttribute("msg", "修改失败");	
		}
	return modelMap;
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String toList(ModelMap map,HttpSession session){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		map.put("grades",studentService.getGradeList(school.getSchoolId()));
		//map.put("classes",studentService.getClassList(pageBean.getGradeId(),1));
		return "admin/student/list";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	@ResponseBody
	public ModelMap studentList(PageBean pageBean,StudentVo student,HttpSession session){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		pageBean.setSchoolId(school.getSchoolId());
		pageBean = studentService.getStudentList(pageBean,student);
		ModelMap map = new ModelMap();
		map.put("page",pageBean);
		return map;
	}
	
	@RequestMapping("/query")
	public String query(Integer studentId,ModelMap map){
		Map<String,Object> studentInfo=studentService.getStudentById(studentId);
		map.addAttribute("stuDetail",studentInfo);
		return "admin/student/detail";
	}
	@ResponseBody
	@RequestMapping("/delSome")
	public ModelMap delSelected(@RequestParam(value="studentIds[]") Integer studentIds[]){
	      ModelMap modelMap=new ModelMap();
		try{
		if(studentService.deleteSelected(studentIds)==1){
		modelMap.addAttribute("flag", 1);
		}else{
			modelMap.addAttribute("flag", 0);
		}
		}catch(Exception e){
			modelMap.addAttribute("flag", 0);
		}
		return modelMap;
	}
	
	@ResponseBody
	@RequestMapping("/reuse")
	public ModelMap reset(Integer studentId){
		ModelMap modelMap=new ModelMap();
		try{
			if(studentService.resetUse(studentId)>=1){
			modelMap.addAttribute("flag", 1);
			}else{
		    modelMap.addAttribute("flag", 0);
			}
			}catch(Exception e){
				modelMap.addAttribute("flag", 0);
			}
			return modelMap;
	}
	@ResponseBody
	@RequestMapping("/logout")
	public ModelMap logout(Integer studentId){
		ModelMap modelMap=new ModelMap();
		try{
			if(studentService.resetLogOut(studentId)>=1){
				modelMap.addAttribute("flag", 1);	
			}else {
				modelMap.addAttribute("flag", 0);
			}
			}catch(Exception e){
				modelMap.addAttribute("flag", 0);
			}
			return modelMap;
	}
	
	@RequestMapping(value="/import",method = RequestMethod.GET)
	public String toInsertStu(ModelMap map, HttpSession session){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		map.addAttribute("grades",studentService.getGradeList(school.getSchoolId()));
		return "admin/student/import";
	}
	@RequestMapping(value = "/import",method = RequestMethod.POST)
	@ResponseBody
	public String imp(@RequestParam("file") MultipartFile file,
			HttpServletRequest request,
			HttpSession session,
			Integer classId,Integer gradeId){
		
	   if(gradeId==null){
 		   return "年级不能为空";
 	   }else if(classId==null){
 		   return "班级不能为空";
 	   }
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		// 文件保存路径  
		String fileDir = request.getSession().getServletContext().getRealPath("/") + "upload/"; 
		File file1=new File(fileDir);
		//String matchName="^.{2,4}$";
		//String matchEmail="^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
		//String matchIdCard="^(\\d{15}$|^\\d{18}$|^\\d{17}(\\d|X|x))$";
		//String matchPhone="^1\\d{10}$|^(0\\d{2,3}-?|\\(0\\d{2,3}\\))?[1-9]\\d{4,7}(-\\d{1,8})?$";
		try { 
            	if  (!file1.exists())      
            	{       
            		file1.mkdirs();  
            	} 
            	String filePath=fileDir+new Date().getTime();
            	// 转存文件  
            	file.transferTo(new File(filePath));
      	        List<StudentForm> students=ReadExcel.readXls(filePath);
      	      if(students != null&&!(students.size()==0)){
               for(StudentForm studentForm:students){
            	   
            	   studentForm.setSchoolId(school.getSchoolId());
            	  if(studentForm!=null){
            		 //Integer classId=studentService.getClassIdByGradeAndClassName(studentForm.getGradeName(),studentForm.getClassName());
            	   String name=studentForm.getName();
            	   String number=studentForm.getNumber();
            	   @SuppressWarnings("unused")
            	   String pwd=studentForm.getLoginPwd();
            	   Integer gender=studentForm.getGender();
            	   if(name==null){
            		   return "姓名不能为空";
            	   }else if(number==null){
            		   return "学号不能为空";
            	   }else if(studentService.getuserBynumber(school.getSchoolId(),number)!=null){
            		   return "该用户已存在";
            	   }else if (gender==null){
            		   return "性别不能为空或者性别格式不正确";
            	   }else if(pwd==null){
            		   return "密码不能为空";
            	   }
            	   studentForm.setClassId(classId);	
               }
               }
               }else{
            	   return "请填写表格信息";
               }
               Integer f=studentService.addStus(students);
               if(f==1){
            	   return "导入成功";
               }else{
            	   return "导入失败";
               }
            } catch (Exception e) {
                e.printStackTrace();  
                return "导入失败";
            }  
	}
	@RequestMapping("/getClassByGrade")
	@ResponseBody
	public List<ClassForm> getClassByGrade(Integer gradeId){
		List<ClassForm> clase=new ArrayList<ClassForm>();
		if(gradeId!=null){
			clase=studentService.getClassList(gradeId,1);
		}
		return clase;
	}
	
	/**
	    * 根据班级，关键词查询（分页）查询学生基本信息
	    * @param classId
	    * @param baseConditionVO
	    * @return
	    */
	   @RequestMapping("/getStudentByclassId.html") 
	   @ResponseBody
	   public ModelMap getStudentByclassId(Integer classId,PageBean pageBean,HttpSession session){
		   ModelMap model = new ModelMap();
		   //查询
		   SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		   pageBean.setSchoolId(school.getSchoolId());
		   pageBean = studentService.getStudentByclassId(classId,pageBean);
		   model.addAttribute("page", pageBean)
		   		.addAttribute("flag", "1");
		   return model;
	   }
}
	

