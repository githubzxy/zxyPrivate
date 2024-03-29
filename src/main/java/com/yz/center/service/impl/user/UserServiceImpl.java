package com.yz.center.service.impl.user;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.yz.center.dao.log.LogDao;
import com.yz.center.dao.user.LoginDao;
import com.yz.center.dao.user.UserDao;
import com.yz.center.model.po.StudentPo;
import com.yz.center.model.po.log.LogPo;
import com.yz.center.model.po.teacher.TeacherPo;
import com.yz.center.model.po.user.LoginPo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.model.vo.StudentForm;
import com.yz.center.service.iface.user.UserService;
import com.yz.center.util.Static;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年10月25日 下午4:55:04 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
@Service("UserService")
public class UserServiceImpl implements UserService {
	
	@Resource
	private UserDao userDao;
	@Resource
	private LogDao logDao;
	@Override
	public UserPo getUserById(Integer loginId) {
		
		UserPo userPo = userDao.getUserById(loginId);
		//查询学生信息
		StudentPo studentPo = userDao.selectStudent(userPo.getUserId());
		//查询教师信息
		TeacherPo teacherPo = userDao.selectTeacher(userPo.getUserId());
		userPo.setStudentPo(studentPo);
		userPo.setTeacherPo(teacherPo);
		 DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		 String s = format1.format(new Date());
		 userPo.setDengluDate(s);

		return userPo;
	}
	@Override
	public Integer addApplyUser(UserPo userPo) {
		Integer flag = userDao.addApplyUser(userPo);
		return flag;
	}
	
	/** 
	* Title: verify
	* Description: 
	* @see com.yz.center.service.iface.user.UserService#verify(java.lang.Integer, java.lang.String, java.lang.String, java.lang.String)  
	*/
	
	@Override
	public Integer verify(Integer userId, String oldPwd, String newPwd, String newPwd2) {
		LoginPo userPo = userDao.find(userId,oldPwd);
		if (userPo != null) {
			if (newPwd.equals(newPwd2)) {
				return 1;
			}else {
				return 0;
			}
		}
		else {
			return 2;
		}
	}
	
	/** 
	* Title: update
	* Description: 
	* @see com.yz.center.service.iface.user.UserService#update(java.lang.Integer, java.lang.String, java.lang.String)  
	*/
	
	@Override
	public Integer update(Integer userId, String oldPwd, String newPwd,HttpSession session) {
		LoginPo userPo = userDao.find(userId,oldPwd);
		 userPo.setLoginPwd(newPwd);
		Integer flag =  userDao.updatePwd(userPo);
		if (flag==1) {
			session.removeAttribute(Static.LOGIN_USER_SESSION);
		}
		return flag;
	}
	
	/** 
	* Title: updateInfo
	* Description: 
	 * @throws ParseException 
	* @see com.yz.center.service.iface.user.UserService#updateInfo(com.yz.center.model.vo.StudentForm)  
	*/
	
	@Override
	public Integer updateInfo(StudentForm studentForm,HttpSession session) throws ParseException {
		Integer flag = userDao.updateInfo(studentForm);
		UserPo userPo = (UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
		if(flag==1){
			session.removeAttribute(Static.LOGIN_USER_SESSION);
			  UserPo loginUser = userDao.getUserById(studentForm.getLoginId());
			  loginUser.setStudentPo(userPo.getStudentPo());
			  System.out.println("登录id:"+studentForm.getLoginId());
			  session.setAttribute(Static.LOGIN_USER_SESSION, loginUser);
		}
		return flag;
	}
	
}
