
/**    
* @Title: StatisticsService.java
* @Package com.yz.center.service.iface.statistics
* Description: TODO
* @author: 
* @date: 2017年1月4日 上午11:44:05 
* @version V1.0 
*   
*/  

package com.yz.center.service.iface.statistics;

import java.util.List;

import com.yz.center.model.form.TestStatisticsCheckForm;
import com.yz.center.model.form.statitics.StudentCourseStatitics;
import com.yz.center.model.po.course.OpenCoursePo;
import com.yz.center.model.vo.StudentCourseVo2;
import com.yz.center.model.vo.course.OpenCourseVo2;
import com.yz.center.util.common.PageBean;

/**  
* Description: TODO
* @author Administrator  
* @date: 2017年1月4日 上午11:44:05 
* @version V1.0   
*/

public interface StatisticsService {
	
	/**   
	* @Title: getCourseBySchool
	* @Description: TODO  
	* @param schoolId
	* @return
	* @author:
	*/
	public List<OpenCoursePo> getCourseBySchool(Integer schoolId);
	
	/**   
	* @Title: getVideosByCourse
	* @Description: TODO  
	* @param pageBean
	* @return
	* @author:
	*/
	public PageBean getVideosByCourse(PageBean pageBean);
	
	/**   
	* @Title: getWatchStudentByVideo
	* @Description: TODO  
	* @param pageBean
	* @return
	* @author:
	*/
	public PageBean getWatchStudentByVideo(PageBean pageBean);
	
	/**   
	* @Title: getOpenCourseBySchool
	* @Description: TODO  
	* @param schoolId
	* @return
	* @author:
	*/
	public List<OpenCoursePo> getOpenCourseBySchool(Integer schoolId);
	
	/**   
	* @Title: getDiscussTheme
	* @Description: TODO  
	* @param pageBean
	* @return
	* @author:
	*/
	public PageBean getDiscussTheme(PageBean pageBean,String name,String number);
	
	
	/**   
	* @Title: getCourseStatistics
	* @Description:获取课程统计 
	* @param pageBean
	* @param courseName
	* @param isEnd
	* @return
	* @author:
	*/
	public PageBean getCourseStatistics(PageBean pageBean, String courseName, Integer isEnd);
	/**   
	* Title: studentOfCourseStatistics 
	* Description: TODO  
	* @param baseConditionVO
	* @param studentCourseVo2
	* @return
	* @author Administrator 
	*/

	public PageBean getStudentOfCourseStatistics(PageBean pageBean,
			StudentCourseStatitics studentCourseStatitics);
	
	public List<OpenCoursePo> getCourseName(Integer schoolId,Integer useType);
	
	public PageBean getHwInfo(PageBean pageBean,Integer useType,Integer isExam);//取得作业列表
	
	public PageBean testStatisticsCheck(PageBean pageBean,String name,String number,Integer classId,Integer gradeId,Integer Id,Integer useType);//取得查看学生考试信息列表

	
	/**   
	* Title: getCourseStatisticschar 
	* Description: TODO  
	* @param openId
	* @return
	* @author Administrator 
	*/
	
	public OpenCourseVo2 getCourseStatisticschar(Integer openId);
	
}
