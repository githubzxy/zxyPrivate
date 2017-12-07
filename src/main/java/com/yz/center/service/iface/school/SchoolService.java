package com.yz.center.service.iface.school;

import java.util.List;

import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.util.common.PageBean;


/**  
* @Description: 学校业务逻辑成功
* @author: 
* @date: 2017年1月5日 下午3:59:04 
* @version V1.0   
*/
public interface SchoolService {
	
	/**   
	* @Title: schoolAdd  添加学校
	* @Description: 添加学校
	* @param schoolPo  学校信息
	* @return  1：添加成功，0：添加失败
	* @author:
	*/
	public int schoolAdd(SchoolPo schoolPo);
	
	
	/**   
	* @Title: getSchoolByState
	* @Description: TODO  
	* @return
	* @author:
	*/
	public List<SchoolPo> getSchoolByState();
	
	/**   
	* @Title: getSchoolBySchoolId  根据学校ID获取学校信息
	* @Description: 根据学校ID获取学校信息
	* @param schoolId 学校ID
	* @return SchoolPo 学校信息
	* @author:
	*/
	public SchoolPo getSchoolBySchoolId(Integer schoolId);
	
	/**   
	 * 更新学校信息
	* @Title: schoolUpdate
	* @Description: 更新学校信息
	* @param schoolPo  学校信息
	* @return  1：成功，0：失败
	* @author:
	*/
	public int schoolUpdate(SchoolPo schoolPo);
	
	/**   
	 * 批量删除学校数据
	* @Title: deleteSchoolById
	* @Description: 批量删除学校数据
	* @param ids 学校ID拼接的字符串 ,如：1,2,3
	* @return 1：成功，0：失败
	* @author:
	*/
	public int deleteSchoolById(String ids);
	
	/**   
	* @Title: updateSchoolByIdAndIsUsed
	* @Description: 启动或注销学校信息
	* @param schoolId 学校ID
	* @param isUsed  1:启用，0：注销
	* @return 操作条数
	* @author:
	*/
	public int updateSchoolByIdAndIsUsed(Integer schoolId,Integer isUsed);
	
	
	/**   
	* @Title: getSchoolByCondition   分页查询学校列表
	* @Description: 分页查询学校列表
	* @param pageBean 分页条件
	* @return 分页条件和学校列表
	* @author:
	*/
	public PageBean getSchoolByCondition(PageBean pageBean);
	
	/**   
	* @Title: getCountByCondition
	* @Description: TODO  
	* @param schoolName
	* @return
	* @author:
	*/
	public Integer getCountByCondition(String schoolName);
	
	
	/**   
	* @Title: findSchoolByUrl
	* @Description: 通过域名查询学校信息
	* @param url 域名
	* @return SchoolPo 学校信息
	* @author: 
	*/
	public SchoolPo findSchoolByUrl(String url);
}
