package com.yz.center.dao.log;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yz.center.model.po.log.LogPo;
import com.yz.center.model.vo.log.SysLogVo;
import com.yz.center.util.common.PageBean;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年10月27日 下午5:22:41 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
public interface LogDao {

	LogPo getLogByUserId(
			@Param(value="userId")Integer userId, 
			@Param(value="type")Integer type);

	int addLog(LogPo log);

	void updateLog(LogPo log);
	
	public List<SysLogVo> listSysLog(PageBean pageBean);

	
	public Integer listSysLogCount(PageBean pageBean);

}
