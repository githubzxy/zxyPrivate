
/**    
* @Title: LogService.java
* @Package com.yz.center.service.iface.log
* @Description: TODO
* @author: 
* @date: 2017年1月11日 下午4:48:06 
* @version V1.0 
* @Copyright 亚卓教育
*   
*/  

package com.yz.center.service.iface.log;

import com.yz.center.util.common.PageBean;

/**  
* @Description: TODO
* @author: 
* @date: 2017年1月11日 下午4:48:06 
* @version V1.0   
*/

public interface LogService {
	public PageBean listSysLog(PageBean pageBean);
}
