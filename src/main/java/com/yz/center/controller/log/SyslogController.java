
/**    
* @Title: SyslogController.java
* @Package com.yz.center.controller.user
* Description: TODO
* @author: 
* @date: 2016年12月30日 下午2:23:32 
* @version V1.0 
*   
*/  

package com.yz.center.controller.log;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.service.iface.log.LogService;
import com.yz.center.util.Static;
import com.yz.center.util.common.PageBean;

/**  
* Description: TODO
* @author Administrator  
* @date: 2016年12月30日 下午2:23:32 
* @version V1.0   
*/
@Controller
@RequestMapping("admin/syslog")
public class SyslogController {
	@Resource
	private LogService logService;
	
	@RequestMapping(value="/list.html",method = RequestMethod.GET)
	public String listSysLog(){
		return "admin/logs/list";
	}
	
	@RequestMapping(value="/list.html",method = RequestMethod.POST)
	@ResponseBody
	public ModelMap listSysLog(PageBean pageBean,HttpSession session){
		SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		pageBean.setSchoolId(school.getSchoolId());
		pageBean = logService.listSysLog(pageBean);
		ModelMap model = new ModelMap();
		model.addAttribute("page", pageBean);
		return model;
	}
}