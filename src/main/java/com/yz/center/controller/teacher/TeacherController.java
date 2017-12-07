
package com.yz.center.controller.teacher;

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

import com.yz.center.model.form.TeacherForm;
import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.model.po.teacher.TeacherPo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.model.vo.BaseConditionVO;
import com.yz.center.model.vo.teacher.SelTeacherForm;
import com.yz.center.service.iface.teacher.TeacherService;
import com.yz.center.util.Static;
import com.yz.center.util.common.PageBean;


/**  
 *  教师管理控制器
* @Description: 教师管理控制器
* @author:  
* @date: 2017年1月8日 下午2:11:10 
* @version V1.0   
*/
@RequestMapping("admin/teacher")
@Controller
public class TeacherController{
	
    @Resource
    private TeacherService teacherService;
    
    /**   
     * 跳转教师列表页面 
    * @Title: toTeacherList
    * @Description: 跳转教师列表页面 
    * @return 教师列表页面路径
    * @author:
    */
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String toTeacherList(){
    	 return "admin/teacher/list";
    }
    
    /**   
     * 分页获取教师列表信息
    * @Title: teacherSearch
    * @Description: 分页获取教师列表信息  
    * @param pageBean 分页条件
    * @param teacher 查询条件
    * @param session 缓存
    * @return 分页信息包括教师列表
    * @author:
    */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public ModelMap teacherSearch(PageBean pageBean,SelTeacherForm teacher,HttpSession session){
    	SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
    	pageBean.setSchoolId(school.getSchoolId());
        pageBean = teacherService.getTeacherByCondition(pageBean,teacher);
        ModelMap map=new ModelMap();
        return  map.addAttribute("page", pageBean);
    }
    
    
    /**   
     * 跳转教师修改页面 
    * @Title: toteacherUpdate
    * @Description: 跳转教师修改页面 
    * @param userId 用户ID
    * @param map 绑定教师信息
    * @return 教师修改页面路径
    * @author:
    */
    @RequestMapping("/update/{userId}")
    public String toteacherUpdate(@PathVariable("userId") Integer userId,ModelMap map){
    	UserPo userPo = teacherService.getTeacherById(userId);
    	map.addAttribute("users", userPo);
        return "admin/teacher/update";
      
    }
    
	
	/**   
	 * 跳转个人信息页面
	* @Title: toTeacherPersonalUpdate
	* @Description: 跳转个人信息页面
	* @param session 缓存
	* @param map 绑定用户信息参数
	* @return 个人信息修改页面路径
	* @author:
	*/
	@RequestMapping(value = "/update",method = RequestMethod.GET)
    public String toTeacherPersonalUpdate(HttpSession session,ModelMap map){
    	UserPo user=(UserPo)session.getAttribute(Static.LOGIN_USER_SESSION);
        UserPo userPo = teacherService.getTeacherById(user.getUserId());
        session.setAttribute(Static.LOGIN_USER_SESSION, userPo);
        map.addAttribute("users", userPo);
        return "admin/teacher/updatePersonal";
    }
    
    /**   
     * 修改教师信息
     * @Title: teacherUpdate
     * @Description:修改教师信息
     * @param teacherForm 教师信息
     * @return ModelMap  flag:1:成功，0:失败
     *                   msg:提示信息
    */
    @RequestMapping(value ="/update.html",method=RequestMethod.POST)	
	@ResponseBody
    public ModelMap teacherUpdate(TeacherForm teacherForm,HttpSession session){
    	SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
    	teacherForm.setSchoolId(school.getSchoolId());
    	int flag = teacherService.teacherUpdate(teacherForm);
    	ModelMap model = new ModelMap();
    	 if(0 == flag){
             return model.addAttribute("flag", flag)
                         .addAttribute("msg", "修改失败!");
         }
         return model.addAttribute("flag", flag).addAttribute("msg", "修改成功!");
      
    }
    /**   
     * @Title: validate
     * @Description:验证教师工号
     * @param teacherForm 教师工号 number 学校schoolId
     * @return ModelMap  flag:1:成功，0:失败
     *                   info:提示信息
    */
   @RequestMapping(value ="/validate.html",method=RequestMethod.POST)	
   	@ResponseBody
       public ModelMap validate(TeacherForm teacherForm,HttpSession session){
       	SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
       	teacherForm.setSchoolId(school.getSchoolId());
        int flag = teacherService.validate(teacherForm);
       	ModelMap model = new ModelMap();
       	 if(1 == flag){
       		return model.addAttribute("status", "y");
            }else{
            	 return model.addAttribute("status", "n")
                         .addAttribute("info", "工号已存在！");
            }
       }
    
    
    /**   
     * 跳转教师新增页面
    * @Title: toAddTeacher
    * @Description: 跳转教师新增页面
    * @return 新增教师页面路径
    * @author:
    */
    @RequestMapping(value="/add",method = RequestMethod.GET)
    public String toAddTeacher(){
        return "admin/teacher/add";
      
    }
    
    /**   
    * @Title: teacherAdd
    * @Description: 新增教师
    * @param teacherForm 教师信息
    * @param session 缓存，取得学校信息
    * @return	flag:1:成功，0:失败
     *          msg:提示信息
    * @author:
    */
    @RequestMapping(value ="/add",method=RequestMethod.POST)	
	@ResponseBody
    public ModelMap teacherAdd(TeacherForm teacherForm,HttpSession session){
    	SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
    	teacherForm.setCreateDate(new Date());
    	teacherForm.setRoleCode("teacher");
    	teacherForm.setSchoolId(school.getSchoolId());
    	ModelMap model = new ModelMap();
    	int flag = teacherService.teacherAdd(teacherForm);
    	 if(0 == flag){
             return model.addAttribute("flag", flag)
                         .addAttribute("msg", "新建失败!");
         }
    	 
         return model.addAttribute("flag", flag).addAttribute("msg", "新建成功!");
    }
    
    
    /**   
     * 批量删除老师信息
     * @Title: teacherDelete   
     * @Description:批量删除老师信息
     * @param ids 老师的id拼接的字符串，如1,2,3
     * @return flag:1:成功，0:失败  <br>
     *         msg:提示信息
    */
    @RequestMapping(value ="/delete",method=RequestMethod.POST)	
	@ResponseBody
    public ModelMap teacherDelete(String ids){
    	ModelMap model = new ModelMap();
    	String[] strings=ids.split(",");
    	int flag=0;
        for (String userId:strings){
    		flag = teacherService.teacherDelete(Integer.parseInt(userId));
        }
    	 if(0 == flag){
             return model.addAttribute("flag", flag)
                         .addAttribute("msg", "删除失败");
         }
         return model.addAttribute("flag", flag).addAttribute("msg", "删除成功");
      
    }
    
    /**   
     * 更新教师登录密码
    * @Title: updateLoginForPwd
    * @Description: 更新教师登录密码
    * @param loginPwd 随机登录密码
    * @param loginId  教师登录信息ID
    * @return flag:1:成功，0:失败  <br>
     *         msg:提示信息
    * @author:
    */
    @RequestMapping(value ="/updatePwd.html",method=RequestMethod.POST)	
	@ResponseBody
    public ModelMap updateLoginForPwd(String loginPwd,Integer loginId){
    	ModelMap model = new ModelMap();
    	int flag = teacherService.updateLoginForPwd(loginId, loginPwd);
    	 if(0 == flag){
             return model.addAttribute("flag", flag)
                         .addAttribute("msg", "密码分配失败");
         }
         return model.addAttribute("flag", flag).addAttribute("msg", "密码分配成功");
      
    }
    
    /**   
     * 跳转教师详细信息页面
    * @Title: toTeacherDetail
    * @Description: 跳转教师详细信息页面
    * @param userId 用户ID
    * @param map 绑定教师数据
    * @return 教师详细信息页面路劲
    * @author:
    */
    @RequestMapping("/detail/{userId}")
    public String toTeacherDetail(@PathVariable("userId") Integer userId,ModelMap map){
    	 UserPo userPo = teacherService.getTeacherById(userId);
    	map.addAttribute("users", userPo);
        return "admin/teacher/detail";
    }
    
    /**   
     * 跳转批量导入教师页面
    * @Title: insertTeacherPre
    * @Description: 跳转批量导入教师页面
    * @return 导入页面路径
    * @author:
    */
    @RequestMapping(value = "/import", method = RequestMethod.GET)
    public String insertTeacherPre(){
        return "admin/teacher/import";
    }
    
    /**   
     * 批量导入教师信息
    * @Title: importTeacher
    * @Description: 批量导入教师信息
    * @param file execl表格文件
    * @param request 请求信息
    * @return msg:消息
    * @author:
    */
    @RequestMapping(value ="/import.html",method=RequestMethod.POST)
	@ResponseBody
	public ModelMap importTeacher(@RequestParam(value="file") MultipartFile file,HttpServletRequest request){
		String msg = teacherService.importTeacher(file, request);
		ModelMap model = new ModelMap();
		return model.addAttribute("msg", msg);
    }
    
    @RequestMapping(value ="/delPic.html",method=RequestMethod.GET)	
    @ResponseBody
    public void delPic(String picPath,HttpServletRequest request){
    	String realPath = request.getSession().getServletContext().getRealPath("/")+picPath;
    	File file=new File(realPath);
    	file.delete();
    }
    
    /**
     * 根据班级，关键词查询（分页）查询教师基本信息
     * @param classId
     * @param baseConditionVO
     * @return
     */
    @RequestMapping("/getTeacherByclassId.html") 
    @ResponseBody
    public ModelMap getTeacherByclassId(Integer classId,PageBean pageBean,HttpSession session){
 	   ModelMap model = new ModelMap(); 
 	  SchoolPo schoolPo =(SchoolPo) session.getAttribute(Static.SCHOOL_SESSION);
      Integer schoolId = schoolPo.getSchoolId();
 	   //查询
 	   pageBean = teacherService.getTeacherByclassId(classId,pageBean,schoolId);
 	   
 	   model.addAttribute("page", pageBean)
 	   		.addAttribute("flag", "1");
 	   return model; 
    }
}
