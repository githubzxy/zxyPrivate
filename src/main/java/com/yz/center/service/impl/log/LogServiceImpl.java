
/**    
* @Title: LogServiceImpl.java
* @Package com.yz.center.service.impl.log
* @Description: TODO
* @author: 
* @date: 2017年1月11日 下午4:48:44 
* @version V1.0 
* @Copyright 亚卓教育
*   
*/  

package com.yz.center.service.impl.log;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yz.center.dao.log.LogDao;
import com.yz.center.model.vo.log.SysLogVo;
import com.yz.center.service.iface.log.LogService;
import com.yz.center.util.common.PageBean;

/**  
* @Description: TODO
* @author: 
* @date: 2017年1月11日 下午4:48:44 
* @version V1.0   
*/
@Service("logService")
public class LogServiceImpl implements LogService {
	
	@Resource
	private LogDao logDao;
	
	@Override
	public PageBean listSysLog(PageBean pageBean) {
		Integer count  = logDao.listSysLogCount(pageBean);
		pageBean.setTotalPage(count);
		List<SysLogVo> sysLogPos = logDao.listSysLog(pageBean);
		pageBean.setList(sysLogPos);
		return pageBean;
	}
}
