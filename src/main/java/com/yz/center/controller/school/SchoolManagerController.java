/**
  * @FileName: SchoolManagerController.java
  * @Author 
  * @Description:
  * @Date 2016��10��24�� ����3:45:11
  * @CopyRight yazhuokj Corporation
  */
package com.yz.center.controller.school;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.service.iface.school.SchoolService;
import com.yz.center.util.Static;
import com.yz.center.util.common.PageBean;

/**  
* @Description: 学校管理控制器
* @author: zf
* @date: 2016年12月16日 下午4:32:34 
* @version V1.0   
*/
@RequestMapping("admin/school")
@Controller
public class SchoolManagerController{
	
	@Resource
	private SchoolService schoolService;
	
	/**   
	* @Title: toSchoolList
	* @Description: 跳转学校列表页面 
	* @return  学校页面路径
	* @author:
	*/
	@RequestMapping(value="/list",method = RequestMethod.GET)
	public String toSchoolList(){
		return "admin/school/list";
	}
	
	/**   
	* @Title: schoolList
	* @Description: 分页获取学校列表 
	* @param pageBean 分页条件
	* @return ModelMap page:分页条件和学校列表
	* @author:
	*/
	@RequestMapping(value = "/list",method = RequestMethod.POST)
	@ResponseBody
	public ModelMap schoolList(PageBean pageBean){
		ModelMap map = new ModelMap();
		pageBean = schoolService.getSchoolByCondition(pageBean);
		return  map.addAttribute("page", pageBean);
	}
	
	/**   
	* @Title: toSchoolAdd
	* @Description: 跳转添加学校页面
	* @return  添加学校页面路径
	* @author:
	*/
	@RequestMapping(value="/add",method = RequestMethod.GET)
	    public String toSchoolAdd(){
	        return "admin/school/add";
	    }
	 
	
	/**   
	* @Title: schoolAdd
	* @Description: 添加学校
	* @param schoolPo  学校信息
	* @return  ModelMap flag: 1 添加成功，2 添加失败<br>
	* 					msg: 消息	
	* @author:
	*/
	@RequestMapping(value = "/add", method=RequestMethod.POST)
	@ResponseBody
	public ModelMap schoolAdd(SchoolPo schoolPo){
		ModelMap model = new ModelMap();
		int flag = schoolService.schoolAdd(schoolPo);
		if(0 == flag){
			return model.addAttribute("flag", flag)
					.addAttribute("msg", "添加失败");
		}
		return model.addAttribute("flag", flag).addAttribute("msg", "添加成功");  
	}
	
	 
	/**   
	 * 跳转学校平台修改页面
	* @Title: toSchoolPlatUpdate
	* @Description: 跳转学校平台修改页面
	* @param map 绑定学校平台数据
	* @param session  学校信息缓存
	* @return 学校平台修改页面路径
	* @author:
	*/
	@RequestMapping(value = "/platUpdate",method = RequestMethod.GET)
	public String toSchoolPlatUpdate(Map<String,SchoolPo> map,HttpSession session){
		 SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		 int schoolId = school.getSchoolId();
		SchoolPo schoolPo=schoolService.getSchoolBySchoolId(schoolId);
		map.put("school", schoolPo);
		return "admin/school/platUpdate";
	 }
	 
	 
	/**   
	* @Title: toSchoolUpdate
	* @Description: 跳转学校修改页面
	* @param map  绑定修改页面数据
	* @param schoolId  学校ID
	* @return 修改页面路径
	* @author:
	*/
	@RequestMapping(value="/update/{schoolId}", method=RequestMethod.GET)
	 public String toSchoolUpdate(ModelMap map,@PathVariable("schoolId")Integer schoolId){
		 SchoolPo schoolPo = schoolService.getSchoolBySchoolId(schoolId);
		 map.addAttribute("schoolPo", schoolPo);
		 return "admin/school/update";
	 }
	 
	/**   
	 * 更新学校信息
	* @Title: schoolUpdate
	* @Description: 更新学校信息
	* @param schoolPo  学校信息
	* @return  flag: 1 成功, 0 失败<br>
	* 			msg: 操作消息
	* @author:
	*/
	@RequestMapping("/update")
	 @ResponseBody
	 public ModelMap schoolUpdate(SchoolPo schoolPo){
		 ModelMap model = new ModelMap();
		 int flag = schoolService.schoolUpdate(schoolPo);
		 if(0 == flag){
			 return model.addAttribute("flag", flag)
					 .addAttribute("msg", "修改失败");
		 }
		 return model.addAttribute("flag", flag).addAttribute("msg", "修改成功");  
	 }
	 
	 
	/**   
	* @Title: deleteSchool
	* @Description: 删除单条或多条学校信息 
	* @param ids  学校ID拼接的字符串，如：1,2,3
	* @return  flag: 1 成功, 0 失败<br>
	* 			msg: 操作消息
	* @author:
	*/
	@RequestMapping("/delete")
	@ResponseBody
	public ModelMap deleteSchool(String ids){
		ModelMap model = new ModelMap();
	    int flag = schoolService.deleteSchoolById(ids);
		if(0 == flag){
			return model.addAttribute("flag", flag)
					 .addAttribute("msg", "删除失败");
		}
		return model.addAttribute("flag", flag).addAttribute("msg", "删除成功");  
	}
	
	/**   
	* 注销或启用学校信息
	* @Title: updateSchoolByIdAndIsUsed
	* @Description: 注销或启用学校信息
	* @param isUsed 是否启用：1 启用，0 注销
	* @param schoolId 学校ID
	* @return	flag: 1 成功, 0 失败<br>
	* 			msg: 操作消息
	* @author:
	*/
	@RequestMapping("/logout")
	@ResponseBody
	public ModelMap updateSchoolByIdAndIsUsed(Integer isUsed,Integer schoolId){
		ModelMap model = new ModelMap();
		int flag = schoolService.updateSchoolByIdAndIsUsed(schoolId,isUsed);
		if(0 == flag){
			return model.addAttribute("flag", flag)
						 .addAttribute("msg", "操作失败");
		}
		return model.addAttribute("flag", flag).addAttribute("msg", "操作成功");  
	}

}
