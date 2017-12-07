package com.yz.center.dao.teacher;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yz.center.model.form.TeacherForm;
import com.yz.center.model.po.teacher.TeacherPo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.model.vo.BaseConditionVO;
import com.yz.center.util.common.PageBean;


public interface TeacherDao  {
	
	/**   添加教师用户信息 
	* @Title: userAdd
	* @Description: 添加教师用户信息 
	* @param teacherForm 教师信息
	* @author:
	*/
	public void userAdd(TeacherForm teacherForm);
	
	/**   添加教师信息
	* @Title: teacherAdd
	* @Description: 添加教师信息
	* @param teacherForm 教师信息
	* @author:
	*/
	public void teacherAdd(TeacherForm teacherForm);
	
	/**   
	 * 添加教师登录信息 
	* @Title: loginAdd
	* @Description: 添加教师登录信息 
	* @param teacherForm 教师信息
	* @author:
	*/
	public void loginAdd(TeacherForm teacherForm);
	public int validate(TeacherForm teacherForm);//验证工号是否存在
	
	
	/**   更新教师用户信息
	* @Title: userUpdate
	* @Description: 更新教师用户信息
	* @param teacherForm 教师信息
	* @author:
	*/
	public void userUpdate(TeacherForm teacherForm);
	
	/**   更新教师信息 
	* @Title: teacherUpdate
	* @Description: 更新教师信息 
	* @param teacherForm 教师信息
	* @author:
	*/
	public void teacherUpdate(TeacherForm teacherForm);
	
	/**   更新教师登录信息 
	* @Title: loginUpdate
	* @Description: 更新教师登录信息 
	* @param teacherForm 教师信息
	* @author:
	*/
	public void loginUpdate(TeacherForm teacherForm);
	
	/**   删除教师用户信息
	* @Title: userDelete
	* @Description: 删除教师用户信息 （将state=1修改为state=0）
	* @param userPo 用户信息
	* @author:
	*/
	public int userDelete(UserPo userPo);

	public List<UserPo> getTeacher();
	
	/**   
	* @Title: getTeacherById
	* @Description: 根据用户ID查询教师信息
	* @param userId 用户ID
	* @return 教师信息
	* @author:
	*/
	public UserPo getTeacherById(Integer userId);
	public UserPo getUserById(Integer userId);
	public void teacherDelete(Integer userId);
	
	
	/**   更新教师登录密码
	* @Title: updateLoginForPwd
	* @Description: 更新教师登录密码
	* @param loginId 教师登录信息ID
	* @param loginPwd 随机密码
	* @author:
	*/
	public void updateLoginForPwd(
			@Param(value="loginId")Integer loginId,
			@Param(value="loginPwd")String loginPwd);
	
	/**   
	 * 根据条件查询教师分页列表
	* @Title: getTeacherByCondition
	* @Description: 根据条件查询教师分页列表
	* @param pageBean 分页条件及查询条件（教师名称，工号）
	* @return 教师列表
	* @author:
	*/
	public List<UserPo> getTeacherByCondition(PageBean pageBean);
	 
	/**   
	 * 根据条件查询教师总数
	* @Title: getCountByCondition
	* @Description: 根据条件查询教师总数  
	* @param pageBean 分页条件及查询条件（教师名称，工号）
	* @return 教师总数
	* @author:
	*/
	public Integer getCountByCondition(PageBean pageBean);
	 
	public UserPo getUserBynumberAndSchoolId(@Param(value="number")String number,@Param(value="schoolId")Integer schoolId);
	public Integer selectPageCount(@Param("classId")Integer classId, @Param("pageBean")PageBean pageBean);
	public List<TeacherPo> getTeacherByclassId(@Param("classId")Integer classId, @Param("pageBean")PageBean pageBean);
	public Integer[] getAllTeacherByclassId(@Param("classId")Integer classId);

	
	/**   
	* Title: getAllTeacher 
	* Description: TODO  
	* @param schoolId
	* @return
	* @author Administrator 
	*/
	
	public Integer[] getAllTeacher(Integer schoolId);
	 

}
