/**
  * @FileName: SchoolDao.java
  * @Author 
  * @Description:
  * @Date 2016年10月31日 上午9:31:30
  * @CopyRight yazhuokj Corporation
  */
package com.yz.center.dao.school;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.util.common.PageBean;


/**  
* @Description: 学校数据访问层
* @author: 
* @date: 2017年1月5日 下午3:59:46 
* @version V1.0   
*/
public interface SchoolDao{
	
	
	/**   
	* @Title: schoolAdd
	* @Description: 添加学校 
	* @param schoolPo 学校信息
	* @author:
	*/
	public void schoolAdd(SchoolPo schoolPo);
	public List<SchoolPo> getSchoolByState();
	
	/**   
	 * 根据学校ID获取学校信息
	* @Title: getSchoolBySchoolId
	* @Description: 根据学校ID获取学校信息
	* @param schoolId 学校ID
	* @return  学校信息
	* @author:
	*/
	public SchoolPo getSchoolBySchoolId(Integer schoolId);
	public void schoolUpdate(SchoolPo schoolPo);
	
	/**   
	 * 批量删除学校数据 
	* @Title: deleteSchoolById
	* @Description: 批量删除学校数据 
	* @param ids 学校ID数组
	* @return 操作条数
	* @author:
	*/
	public int deleteSchoolById(String[] ids);
	public void updateSchoolByIdAndIsUsed(@Param(value="schoolId")Integer schoolId,@Param(value="isUsed")Integer isUsed);
	
	
	/**   
	* @Title: getSchoolByCondition
	* @Description: 根据分页条件获取学校分页列表
	* @param pageBean 分页条件及学校名称关键字
	* @return  学校列表数据
	* @author:
	*/
	public List<SchoolPo> getSchoolByCondition(PageBean pageBean);
	
	
	/**   
	* @Title: getCountByCondition
	* @Description: 根据学校名称关键字模糊查询学校总数
	* @param schoolName  学校名称关键字
	* @return  学校总数
	* @author:
	*/
	public Integer getCountByCondition(@Param(value="schoolName")String schoolName);
	
	
	/**   
	 * 根据域名查询学校信息  
	* @Title: selectSchoolByUrl
	* @Description: 根据域名查询学校信息  
	* @param url 域名
	* @return 学校信息
	* @author:
	*/
	public SchoolPo selectSchoolByUrl(String url);
}
