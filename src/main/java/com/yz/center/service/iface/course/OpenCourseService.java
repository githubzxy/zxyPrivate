package com.yz.center.service.iface.course;

import java.util.List;

import com.yz.center.model.po.course.OpenCoursePo;
import com.yz.center.model.vo.BaseConditionVO;
import com.yz.center.model.vo.course.OpenCourseVo;
import com.yz.center.util.common.PageBean;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月17日 上午11:45:47 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */

public interface OpenCourseService {
	public Integer adds(OpenCoursePo openCoursePo,Integer[] baseCourseIds,String[] baseName,Integer schoolId) ;
	
	public Integer update(OpenCoursePo  openCoursePo);
	
	public Integer deleteById(Integer opencourseId);
	
	public Integer deleteByIds(Integer openCourseIds[]);
	
	
	public PageBean findOpenCourses(PageBean pageBean);
	
	public OpenCoursePo findByopenId(Integer openId);
	
	public Integer overCourse(Integer openId);
	
	public Integer	selectSort(Integer schoolId);

	public Integer importStudents(Integer openId, List<Integer> studentIds);

	public PageBean findOpenCourseStudents(PageBean pageBean);

	public Integer delCourseStudent(Integer studentId, Integer openId); 
	
	public BaseConditionVO init(BaseConditionVO baseConditionVO,Integer openId,String name,String number);

	public List<OpenCourseVo> findByUserId(Integer courseTypeId, BaseConditionVO baseConditionVO);

	
	/**   
	* Title: find2ByUserId 
	* Description: 查询开课，而学生未选课程 
	* @param baseConditionVO
	* @return
	* @author Administrator 
	*/
	
	public List<OpenCourseVo> find2ByUserId(Integer courseTypeId,BaseConditionVO baseConditionVO);
	
	/**   
	* Title: init3 
	* Description: TODO  
	* @param baseConditionVO
	* @param userId
	* @author Administrator 
	*/
	
	public BaseConditionVO init3(Integer courseTypeId,BaseConditionVO baseConditionVO, Integer userId,Integer schoolId);

	
	/**   
	* Title: init4 
	* Description: TODO  
	* @param baseConditionVO
	* @param userId
	* @return
	* @author Administrator 
	*/
	
	public BaseConditionVO init4(Integer courseTypeId,BaseConditionVO baseConditionVO, Integer userId,Integer schoolId);

	
	/**   
	* Title: addCourseStudent 
	* Description: TODO  
	* @author Administrator 
	 * @param studentId 
	 * @param openId 
	*/
	
	public Integer addCourseStudent(Integer openId, Integer studentId);
	/**   
	* Title: updateTimeAndcourseInfo 
	* Description:处理时间 and courseInfo的字数
	* @param openCourseVos
	* @author Administrator 
	*/
	
	public void updateTimeAndcourseInfo(List<OpenCourseVo> openCourseVos);

	/**   
	* Title: findIndexOpencourse 
	* Description: 在首页查找公开课信息  
	* @param pageBean
	* @return
	* @author Administrator 
	*/
	
	public List<OpenCourseVo> findIndexOpencourse(BaseConditionVO baseConditionVO,Integer schoolId);

	public List<OpenCourseVo> getAllopenCourse(Integer schoolId);

}
