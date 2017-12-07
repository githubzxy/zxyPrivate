package com.yz.center.service.iface.teacher;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.yz.center.model.form.TeacherForm;
import com.yz.center.model.po.teacher.TeacherPo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.model.vo.BaseConditionVO;
import com.yz.center.model.vo.teacher.SelTeacherForm;
import com.yz.center.util.common.PageBean;

public interface TeacherService {
	
	/**   
	* @Title: teacherAdd
	* @Description: 新增教师信息
	* @param teacherForm 教师信息
	* @return 
	* @author:
	*/
	public int teacherAdd(TeacherForm teacherForm);
	public List<UserPo> getTeacher();
	
	/**   
	* @Title: getTeacherById
	* @Description: 根据用户ID获取教师信息
	* @param userId 用户ID
	* @return 教师用户信息
	* @author:
	*/
	public UserPo getTeacherById(Integer userId);
	public int teacherUpdate(TeacherForm teacherForm);
	public int teacherDelete(Integer userId);
	public int updateLoginForPwd(Integer loginId,String loginPwd);
	public int validate(TeacherForm teacherForm);
	
	
	/**   
	 * 获取教师分页列表信息
	* @Title: getTeacherByCondition
	* @Description: 获取教师分页列表信息
	* @param pageBean 分页条件
	* @param teacher 查询条件
	* @return 分页信息和列表信息
	* @author:
	*/
	public PageBean getTeacherByCondition(PageBean pageBean,SelTeacherForm teacher);
	
	public UserPo getUserBynumberAndSchoolId(String number,Integer schoolId);
	
	/**   
	 * 批量导入教师信息
	* @Title: importTeacher
	* @Description: 批量导入教师信息
	* @param file excel 表格文件
	* @param request 请求信息
	* @return 结果消息
	* @author:
	*/
	public String importTeacher(MultipartFile file,HttpServletRequest request);
	 
	public PageBean getTeacherByclassId(Integer classId, PageBean page,Integer schoolId);
	public Integer[] getAllTeacherByclassId(Integer classId);
	
	/**   
	* Title: getAllTeacher 
	* Description: TODO  
	* @param schoolId
	* @return
	* @author Administrator 
	*/
	
	public Integer[] getAllTeacher(Integer schoolId);
	
}
