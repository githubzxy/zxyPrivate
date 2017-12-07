
/**    
* @Title: StatisticsDao.java
* @Package com.yz.center.dao.statistics
* @Description: TODO
* @author: 
* @date: 2017年1月12日 下午1:39:43 
* @version V1.0 
* @Copyright 亚卓教育
*   
*/  

package com.yz.center.dao.statistics;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yz.center.model.vo.BaseConditionVO;
import com.yz.center.model.vo.course.OpenCourseVo2;
import com.yz.center.util.common.PageBean;

/**  
* @Description: TODO
* @author: 
* @date: 2017年1月12日 下午1:39:43 
* @version V1.0   
*/

public interface CourseStatisticsDao {
	
	/**   
	* Title: selectPageCount2 
	* Description: 查询总条数 
	* @param baseConditionVO
	* @param courseName
	* @param isEnd
	* @author Administrator 
	*/
	
	Integer selectPageCount(PageBean pageBean);


	/**   
	* Title: CourseStatistics 
	* Description: TODO  
	* @param baseConditionVO
	* @param courseName
	* @param isEnd
	* @return
	* @author Administrator 
	*/
	
	List<OpenCourseVo2> selectCourseStatistics(PageBean pageBean);

	
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
}