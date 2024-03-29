/**
  * @FileName: RoleController.java
  * @Author 
  * @Description:
  * @Date 2016��10��24�� ����3:11:45
  * @CopyRight yazhuokj Corporation
  */
package com.yz.center.controller.base;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yz.center.model.po.role.BaseControllerPo;
import com.yz.center.model.po.role.RolePo;
import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.model.vo.teacher.SelTeacherForm;
import com.yz.center.service.iface.role.RoleService;
import com.yz.center.service.iface.teacher.TeacherService;
import com.yz.center.util.Static;
import com.yz.center.util.common.PageBean;

@RequestMapping("admin/role")
@Controller
public class RoleController{
	
	@Resource
	private RoleService roleService;
	
	@Resource
    private TeacherService teacherService;
	
	/**   跳转新增角色页面
	* @Title: toAddRole
	* @Description: 跳转新增角色页面 
	* @return
	* @author:
	*/
	@RequestMapping(value="add",method=RequestMethod.GET)
	public String toAddRole(){
		return "admin/sys/role/add";
	}
	
	/**   新增角色
	* @Title: addRole
	* @Description: 新增角色 
	* @return
	* @author:
	*/
	@RequestMapping(value="add",method=RequestMethod.POST)
	@ResponseBody
	public ModelMap addRole(RolePo rolePo){
		ModelMap model = new ModelMap();
		int flag = roleService.addRole(rolePo);
		if(flag == 0){
			return model.addAttribute("flag", flag)
				    .addAttribute("msg", "添加失败");
		}
		return model.addAttribute("flag", flag)
				    .addAttribute("msg", "添加成功");
	}
	
	
	/**   跳转修改角色页面
	* @Title: toUpdateRole
	* @Description: 跳转修改角色页面
	* @return
	* @author:
	*/
	@RequestMapping(value="{roleId}/update",method=RequestMethod.GET)
	public String toUpdateRole(@PathVariable String roleId,ModelMap model){
		RolePo role = roleService.findRoleById(roleId);
		model.addAttribute("role", role);
		return "admin/sys/role/update";
	}
	
	/**   修改角色
	* @Title: pdateRole
	* @Description: 修改角色
	* @return
	* @author:
	*/
	@RequestMapping(value="{roleId}/update",method=RequestMethod.POST)
	@ResponseBody
	public ModelMap pdateRole(@PathVariable String roleId,RolePo rolePo){
		rolePo.setRoleId(roleId);
		int flag = roleService.updateRole(rolePo);
		ModelMap model = new ModelMap();
		if(flag == 0){
			return model.addAttribute("flag", flag)
				    .addAttribute("msg", "修改失败");
		}
		return model.addAttribute("flag", flag)
			    .addAttribute("msg", "修改成功");
	}
	
	
	/**   跳转角色列表页面
	* @Title: toRoleList
	* @Description: 跳转角色列表页面
	* @return
	* @author:
	*/
	@RequestMapping(value="list",method=RequestMethod.GET)
	public String toRoleList(){
		return "admin/sys/role/list";
	}
	
	/**   分页获取角色列表
	* @Title: getRoleList
	* @Description: 分页获取角色列表
	* @return
	* @author:
	*/
	@RequestMapping(value="list",method=RequestMethod.POST)
	@ResponseBody
	public ModelMap getRoleList(PageBean pageBean){
		ModelMap model = new ModelMap();
		pageBean = roleService.findRoles(pageBean);
		model.addAttribute("page", pageBean);
		return model;
	}
	
	/**   
     * 跳转教师列表页面 
    * @Title: toTeacherList
    * @Description: 跳转教师列表页面 
    * @return 教师列表页面路径
    * @author:
    */
    @RequestMapping(value = "teacher/list",method = RequestMethod.GET)
    public String toTeacherList(){
    	 return "admin/sys/role/set/list";
      
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
    @RequestMapping(value = "teacher/list", method = RequestMethod.POST)
    @ResponseBody
    public ModelMap teacherSearch(PageBean pageBean,SelTeacherForm teacher,HttpSession session){
    	SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
    	pageBean.setSchoolId(school.getSchoolId());
        pageBean = teacherService.getTeacherByCondition(pageBean,teacher);
        ModelMap map=new ModelMap();
        return  map.addAttribute("page", pageBean);
    }
    
    
    /**   跳转个人角色设置
    * @Title: toPersonalSetRole
    * @Description: 跳转个人角色设置
    * @param idStr 用户ID组成的字符串
    * @param nameStr 用户名组成的字符串
    * @param model
    * @return
    * @author:
    */
    @RequestMapping(value = "teacher/set", method = RequestMethod.GET)
    public String toPersonalSetRole(String idStr,String n,ModelMap model){
    	List<RolePo> roles = roleService.findAllRoles();
    	UserPo userPo= roleService.findMyroles(idStr);
    	System.out.println(userPo.getRoleCode());
    	model.addAttribute("myRole", userPo.getRoleCode());
    	model.addAttribute("idStr", idStr);
    	model.addAttribute("nameStr", n);
    	model.addAttribute("roles", roles);
    	return "admin/sys/role/set/set";
    }
    
    /**   个人角色设置
     * @Title: toPersonalSetRole
     * @Description: 个人角色设置
     * @param idStr 用户ID组成的字符串
     * @param model
     * @return
     * @author:
     */
     @RequestMapping(value = "teacher/set", method = RequestMethod.POST)
     @ResponseBody
     public ModelMap personalSetRole(String idStr,String roleId){
    	 ModelMap model = new ModelMap();
    	 int flag = roleService.updateUserRoleId(idStr, roleId);
    	 if(flag == 0){
    		 return model.addAttribute("flag", flag)
    				 	.addAttribute("msg", "权限设置失败！");
    	 }
     	 return model.addAttribute("flag", flag)
     			 	.addAttribute("msg", "权限设置成功！");
     }
     
     @RequestMapping(value="set/{roleId}",method = RequestMethod.GET)
     public String toSeting(@PathVariable("roleId") String roleId,String role,ModelMap model){
    	 //TODO 获取权限列表
    	 List<BaseControllerPo> list = roleService.findBaseControllers(roleId);
    	 System.out.println(list);
    	 model.addAttribute("reslist", list);
    	 model.addAttribute("roleId", roleId);
    	 model.addAttribute("roleName", role);
    	 return "admin/sys/role/set/disUpdate";
     }
     
     @RequestMapping(value="set/{roleId}",method=RequestMethod.POST)
     @ResponseBody
     public ModelMap setRoleController(Integer[] controllerId, @PathVariable("roleId")String roleId){
    	 ModelMap model = new ModelMap();
    	 //TODO 修改角色控制权限
    	 System.out.println("所选角色为："+controllerId);
    	 int flag = roleService.updateRoleController(roleId, controllerId);
    	 if(flag == 0){
    		 model.addAttribute("flag", flag).addAttribute("msg", "修改失败");
    	 }
    	 return model.addAttribute("flag", flag).addAttribute("msg", "修改成功");
     }
	
}
