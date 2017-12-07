package com.yz.center.service.iface.user;


import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.yz.center.model.po.user.UserPo;
import com.yz.center.model.vo.StudentForm;
import com.yz.center.model.vo.log.SysLogVo;
import com.yz.center.util.common.PageBean;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年10月25日 下午4:53:57 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
public interface UserService {

	UserPo getUserById(Integer loginId);

	Integer addApplyUser(UserPo userPo);

	
	/**   
	* Title: verify 
	* Description: TODO  
	* @param userId
	* @param oldPwd
	* @param newPwd
	* @param newPwd2
	* @return
	* @author Administrator 
	*/
	
	Integer verify(Integer userId, String oldPwd, String newPwd, String newPwd2);

	
	/**   
	* Title: update 
	* Description: TODO  
	* @param userId
	* @param oldPwd
	* @param newPwd
	* @author Administrator 
	*/
	
	Integer update(Integer userId, String oldPwd, String newPwd,HttpSession session);

	
	/**   
	* Title: updateInfo 
	* Description: TODO  
	* @param studentForm
	* @return
	* @author Administrator 
	 * @throws ParseException 
	*/
	
	Integer updateInfo(StudentForm studentForm,HttpSession session) throws ParseException;

}
