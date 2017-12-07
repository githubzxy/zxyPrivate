
/**    
* @Title: BaseController.java
* @Package com.yz.center.controller.base
* @Description: TODO
* @author: 
* @date: 2017年3月27日 下午12:29:51 
* @version V1.0 
* @Copyright 亚卓教育
*   
*/  

package com.yz.center.controller.base;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**  
* @Description: TODO
* @author: 
* @date: 2017年3月27日 下午12:29:51 
* @version V1.0   
*/
@Controller
@RequestMapping("base")
public class BaseController {
	
	
	/**   
	* @Title: return404
	* @Description: 跳转404页面
	* @return
	* @author:
	*/
	@RequestMapping("404")
	public String return404(){
		return "admin/sys/404";
	}
	
	
	/**   
	* @Title: prompt
	* @Description: 跳转提示到期页面 
	* @return
	* @author:
	*/
	@RequestMapping("prompt")
	public String prompt(){
		return "admin/sys/prompt";
	}
}
