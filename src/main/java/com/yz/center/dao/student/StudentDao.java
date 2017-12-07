package com.yz.center.dao.student;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yz.center.model.form.TeacherForm;
import com.yz.center.model.po.GradePo;
import com.yz.center.model.po.LoginPo;
import com.yz.center.model.po.StudentPo;
import com.yz.center.model.po.UserPo;
import com.yz.center.model.vo.BaseConditionVO;
import com.yz.center.model.vo.ClassForm;
import com.yz.center.model.vo.StudentCourseVo;
import com.yz.center.model.vo.StudentCourseVo2;
import com.yz.center.model.vo.StudentForm;
import com.yz.center.model.vo.StudentList;
import com.yz.center.util.common.PageBean;
    @Repository
    public interface StudentDao{
	public Integer addUserInfo(StudentForm studentAdd);
    public Integer addStudentInfo(StudentForm studentAdd);
    public Integer addLoginInfo(StudentForm studentAdd);
    public Integer addStudentClassRls(StudentForm studentAdd);//student_class_rls关联表数据添加
    public Integer del(Integer studentId);
    public StudentForm selectStudentById(Integer studentId);
    public Integer updateLoginInfo(LoginPo loginPo);
    public Integer updateUserInfo(UserPo userpo);
    public Integer updateStudentInfo(StudentPo studentPo);
    public List<StudentList> selectStudentList(PageBean pageBean);
    public Integer countItems(PageBean pageBean);
    public Integer resetUse(Integer studentId);
    public Integer resetLogOut(Integer studentId);
    public UserPo userBynumber(@Param("schoolId")Integer schoolId, @Param("number")String number);
    public List<GradePo> getGradeList(@Param("schoolId")Integer schoolId);
    public List<ClassForm> getClassList(@Param("gradeId") Integer gradeId,@Param("schoolId") Integer schoolId);
    public ClassForm selectClassById(Integer studentId);
    public Integer getClassIdByGradeAndClassName(@Param("gradeName") String gradeName,@Param("className") String className);
    public Integer findIdByNums(@Param("number") Integer number,@Param("schoolId")Integer schoolId);
	public Integer selectPageCount(@Param("classId")Integer classId, @Param("pageBean")PageBean pageBean);
	public List<StudentPo> getStudentByclassId(@Param("classId")Integer classId, @Param("pageBean")PageBean pageBean);
	public Integer[] getAllStudentByclassId(Integer classId);
	
	/**   
	* Title: findStudentId 
	* Description: TODO  
	* @param userId
	* @return
	* @author Administrator 
	*/
	
	public Integer findStudentId(Integer userId);
	
	/**   
	* Title: findMycourse 
	* Description: TODO  
	* @param studentId
	* @return
	* @author Administrator 
	*/
	
	public List<StudentCourseVo> findMycourse(Integer studentId);
	
	/**   
	* Title: findExameTotalScore 
	* Description: TODO  
	* @param openId
	* @return
	* @author Administrator 
	*/
	
	public List<Integer> findExameTotalScore(Integer openId);
	
	/**   
	* Title: findVideoTotalCount 
	* Description: TODO  
	* @param openId
	* @return
	* @author Administrator 
	*/
	
	public Integer findVideoTotalCount(Integer openId);
	
	/**   
	* Title: findPaperTotalScore 
	* Description: TODO  
	* @return
	* @author Administrator 
	 * @param openId 
	*/
	
	public List<Integer> findPaperTotalScore(Integer openId);
	
	/**   
	* Title: findmyExameTotalScore 
	* Description: TODO  
	* @param openId
	* @param studentId
	* @return
	* @author Administrator 
	*/
	
	public List<Integer> findmyExameTotalScore(@Param("openId")Integer openId,@Param("studentId") Integer studentId);
	
	/**   
	* Title: findmyPaperTotalScore 
	* Description: TODO  
	* @param openId
	* @param studentId
	* @return
	* @author Administrator 
	*/
	
	public List<Integer> findmyPaperTotalScore(@Param("openId")Integer openId, @Param("studentId")Integer studentId);
	
	/**   
	* Title: findMyinfo 
	* Description: TODO  
	* @param userId
	* @return
	* @author Administrator 
	*/
	
	public StudentForm findMyinfo(Integer userId);
	
	/**   
	* Title: findpageCount 
	* Description: TODO  
	* @param baseConditionVO
	* @param studentCourseVo2
	* @return
	* @author Administrator 
	*/
	
	public Integer findpageCount(@Param("baseConditionVO")BaseConditionVO baseConditionVO,
			@Param("studentCourseVo2")StudentCourseVo2 studentCourseVo2);
	
	/**   
	* Title: studentOfCourseStatistics 
	* Description: TODO  
	* @param baseConditionVO
	* @param studentCourseVo2
	* @return
	* @author Administrator 
	*/
	
	public List<StudentCourseVo2> studentOfCourseStatistics(@Param("baseConditionVO")BaseConditionVO baseConditionVO,
			@Param("studentCourseVo2")StudentCourseVo2 studentCourseVo2);
	/**   
	* Title: findMycourse2
	* Description: TODO  
	* @param studentId
	* @return
	* @author Administrator 
	 * @param baseConditionVO 
	*/
	
	public List<StudentCourseVo> findMycourse2(@Param("studentId")Integer studentId, @Param("baseConditionVO")BaseConditionVO baseConditionVO);
	
	
	/**   
	* Title: findMycourseProCount 
	* Description: TODO  
	* @param studentId
	* @return
	* @author Administrator 
	*/
	
	public Integer findMycourseProCount(Integer studentId);
	
	/**   
	* Title: findmyExameTotalCount 
	* Description: TODO  
	* @param openId
	* @param studentId
	* @return
	* @author Administrator 
	*/
	
	public Integer findmyExameTotalCount(@Param("openId")Integer openId, @Param("studentId")Integer studentId);
	
	/**   
	* Title: getAllStudentBySchoolId 
	* Description: TODO  
	* @param schoolId
	* @return
	* @author Administrator 
	*/
	
	public Integer[] getAllStudentBySchoolId(Integer schoolId);
	
	public int validate(StudentForm studentForm);//验证学号是否存在
	public Integer updateScore(StudentCourseVo studentCourseVo);
	

    }
