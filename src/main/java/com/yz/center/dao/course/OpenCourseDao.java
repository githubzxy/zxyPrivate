package com.yz.center.dao.course;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yz.center.model.po.course.OpenCoursePo;
import com.yz.center.model.po.course.StudentCoursePo;
import com.yz.center.model.vo.BaseConditionVO;
import com.yz.center.model.vo.StudentForm;
import com.yz.center.model.vo.course.OpenCourseVo;
import com.yz.center.model.vo.course.OpenCourseVo2;
import com.yz.center.util.common.PageBean;

/** 
 * @author  作者: Administrator
 * 开课Dao层
 * @date 创建时间：2016年11月17日 下午2:15:36 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
public interface OpenCourseDao {

	Integer update(OpenCoursePo openCoursePo);

	Integer adds(List<OpenCoursePo> openCoursePos);

	Integer deleteById(Integer opencourseId);

	List<OpenCourseVo> selectOpenCourses(PageBean pageBean);

	Integer deleteByIds(Integer[] openCourseIds);

	OpenCoursePo findByopenId(Integer openId);

	Integer selectPageCount(PageBean pageBean);

	Integer overCourse(Integer openId);

	Integer selectSort(@Param("schoolId")Integer schoolId);

	Integer importStudents(List<StudentCoursePo> studentCoursePos);

	List<StudentForm> findOpenCourseStudents(PageBean pageBean);

	Integer delCourseStudentById(@Param("studentId")Integer studentId, @Param("openId")Integer openId);

	Integer findStudentCourseCount(PageBean pageBean);
	Integer findStudentCourseCount1(Integer openId,String name,String number);
	

	/**   
	* Title: findOpencourseCount 
	* Description: 查询学生已选课程总数  
	* @param baseConditionVO
	* @return
	* @author Administrator 
	 * @param courseTypeId 
	*/
	
	Integer findOpencourseCount(@Param("courseTypeId")Integer courseTypeId,
			@Param("baseConditionVO")BaseConditionVO baseConditionVO);

	/**   
	* Title: findByUserId 
	* Description:查询学生已选课程 
	* @param baseConditionVO
	* @return
	* @author Administrator 
	 * @param courseTypeId 
	*/
	List<OpenCourseVo> findByUserId(@Param("courseTypeId")Integer courseTypeId,
			@Param("baseConditionVO")BaseConditionVO baseConditionVO);

	/**   
	* Title: findOpencourseCount2 
	* Description: 查询学生未选课程 总数  
	* @param baseConditionVO
	* @return
	* @author Administrator 
	 * @param courseTypeId 
	*/
	
	Integer findOpencourseCount2(@Param("courseTypeId")Integer courseTypeId,
			@Param("baseConditionVO")BaseConditionVO baseConditionVO);
	
	/**   
	* Title: find2ByUserId 
	* Description: 查询学生未选课程  
	* @param baseConditionVO
	* @return
	* @author Administrator 
	 * @param courseTypeId 
	*/
	
	List<OpenCourseVo> find2ByUserId(@Param("courseTypeId")Integer courseTypeId, @Param("baseConditionVO")BaseConditionVO baseConditionVO);

	
	/**   
	* Title: addCourseStudent 
	* Description: TODO  
	* @param openId
	* @param studentId
	* @return
	* @author Administrator 
	*/
	
	Integer addCourseStudent(StudentCoursePo studentCoursePo);

	
	/**   
	* Title: selectStudentCourseId 
	* Description: 根据学生Id和openId查询表student——course的id属性
	* @param openId
	* @param studentId
	* @return
	* @author Administrator 
	*/
	
	Integer selectStudentCourseId(@Param("openId")Integer openId, @Param("studentId")Integer studentId);

	
	/**   
	* Title: addStudyStudent 
	* Description: TODO  
	* @return
	* @author Administrator 
	*/
	
	Integer addStudyStudent(Integer studentCourseId);

	
	/**   
	* Title: delstudyCourseById 
	* Description: TODO  
	* @param studentCourseId
	* @return
	* @author Administrator 
	*/
	
	Integer delstudyCourseById(Integer studentCourseId);

	
	/**   
	* Title: selectPageCount2 
	* Description: TODO  
	* @param baseConditionVO
	* @param courseName
	* @param isEnd
	* @author Administrator 
	*/
	
	Integer selectPageCount2(@Param("baseConditionVO")BaseConditionVO baseConditionVO, @Param("courseName")String courseName, @Param("isEnd")Integer isEnd);
	/**   
	* Title: selectStudentCountByopenId 
	* Description: TODO  
	* @param openId
	* @return
	* @author Administrator 
	*/
	
	Integer selectStudentCountByopenId(Integer openId);

	/**   
	* Title: selectexamPeopleCount 
	* Description: TODO  
	* @param openId
	* @return
	* @author Administrator 
	*/
	
	Integer selectexamPeopleCount(Integer openId);

	/**   
	* Title: selectexamCount 
	* Description: TODO  
	* @param openId
	* @return
	* @author Administrator 
	*/
	
	Integer selectexamCount(Integer openId);

	
	/**   
	* Title: selectvideoCount 
	* Description: TODO  
	* @param openId
	* @return
	* @author Administrator 
	*/
	
	List<Integer> selectvideoCount(Integer openId);

	
	/**   
	* Title: selecttaskCount 
	* Description: TODO  
	* @param openId
	* @return
	* @author Administrator 
	*/
	
	List<Integer> selecttaskCount(Integer openId);

	

	
	/**   
	* Title: selectdiscussCount 
	* Description: TODO  
	* @param openId
	* @return
	* @author Administrator 
	*/
	
	List<Integer> selectdiscussCount(Integer openId);

	
	/**   
	* Title: selectpassPeople 
	* Description: TODO  
	* @param openId
	* @return
	* @author Administrator 
	*/
	
	Integer selectpassPeople(Integer openId);

	
	/**   
	* Title: findCountByopenId 
	* Description: 找到章节 
	* @param openId
	* @return
	* @author Administrator 
	*/
	
	Integer findCountByopenId(Integer openId);

	
	/**   
	* Title: updateStudentCourse 
	* Description: TODO  
	* @param openId
	* @param studentId
	* @return
	* @author Administrator 
	*/
	
	Integer updateStudentCourse(Integer studentCourseId);

	/**   
	* Title: update 
	* Description: TODO  
	* @param studentCourseId
	* @return
	* @author Administrator 
	*/
	
	Integer updateStudy(Integer studentCourseId);
	
	/**   
	* Title: findcountOpencourse 
	* Description: TODO  
	* @param pageBean
	* @return
	* @author Administrator 
	*/
	
	Integer findcountOpencourse(BaseConditionVO baseConditionVO);

	/**   
	* Title: findIndexOpencourse 
	* Description: TODO  
	* @param baseConditionVO
	* @return
	* @author Administrator 
	*/
	
	List<OpenCourseVo> findIndexOpencourse(BaseConditionVO baseConditionVO);

	
	/**   
	* Title: findstudyCourseCount 
	* Description: TODO  
	* @param openId
	* @param baseConditionVO
	* @return
	* @author Administrator 
	*/
	
	Integer findstudyChapterCount(@Param("openId")Integer openId, @Param("baseConditionVO")BaseConditionVO baseConditionVO);
	/**   
	* Title: findstudyCourseCount 
	* Description: TODO  
	* @param openId
	* @param baseConditionVO
	* @return
	* @author Administrator 
	*/
	
	Integer findstudyChapterCount(@Param("studentCourseId")Integer studentCourseId);

	
	
	/**   
	* @Title: updateTaskCount
	* @Description: 作业总数加一 
	* @param openId
	* @return
	* @author:
	*/
	int updateTaskCount(Integer openId);
	/**   
	* @Title: updateTaskCountOfDelete
	* @Description: 作业总数减一 
	* @param openId
	* @return
	* @author:
	*/
	public void updateTaskCountOfDelete(Integer openId);
	
	/**   
	* @Title: updateExamineCount
	* @Description: 考试总数加一
	* @param openId
	* @return
	* @author:
	*/
	int updateExamineCount(Integer openId);


	List<OpenCourseVo> getAllopenCourse(Integer schoolId);

	/**   
	* @Title: updateTaskCountOfDelete
	* @Description: 考试总数减一 
	* @param openId
	* @return
	* @author:
	*/
	public void updateExamineCountOfDelete(Integer openId);

}
       
     