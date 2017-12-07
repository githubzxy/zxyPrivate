package com.yz.center.dao.user;

import org.apache.ibatis.annotations.Param;

import com.yz.center.model.po.StudentPo;
import com.yz.center.model.po.teacher.TeacherPo;
import com.yz.center.model.po.user.LoginPo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.model.vo.StudentForm;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年10月25日 下午4:56:52 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
public interface UserDao {

	public UserPo getUserById(Integer loginId);
	
	public StudentPo selectStudent(Integer userId);
	
	
	/**   
	* @Title: selectTeacher
	* @Description: 查询教师ID并缓存
	* @param userId
	* @return
	* @author:
	*/
	public TeacherPo selectTeacher(Integer userId);

	public Integer addApplyUser(UserPo userPo);

	
	/**   
	* Title: find 
	* Description: TODO  
	* @param userId
	* @param oldPwd
	* @return
	* @author Administrator 
	*/
	
	public LoginPo find(@Param("userId")Integer userId, @Param("oldPwd")String oldPwd);


	
	/**   
	* Title: updatePwd 
	* Description: TODO  
	* @param userPo
	* @return
	* @author Administrator 
	*/
	
	public Integer updatePwd(LoginPo userPo);

	
	/**   
	* Title: updateInfo 
	* Description: TODO  
	* @param studentForm
	* @author Administrator 
	*/
	
	public Integer updateInfo(StudentForm studentForm);

}
