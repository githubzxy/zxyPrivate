
/**    
* @Title: StudentSatiticsDao.java
* @Package com.yz.center.dao.statistics
* @Description: TODO
* @author: 
* @date: 2017年1月12日 下午1:54:05 
* @version V1.0 
* @Copyright 亚卓教育
*   
*/  

package com.yz.center.dao.statistics;

import java.util.List;

import com.yz.center.model.form.statitics.StudentCourseStatitics;
import com.yz.center.model.vo.StudentCourseVo2;
import com.yz.center.util.common.PageBean;

/**  
* @Description: TODO
* @author: 
* @date: 2017年1月12日 下午1:54:05 
* @version V1.0   
*/

public interface StudentSatiticsDao {
	/**   
	* Title: findpageCount 
	* Description: TODO  
	* @param baseConditionVO
	* @param studentCourseVo2
	* @return
	* @author Administrator 
	*/
	
	public Integer findPageCount(PageBean pageBean);
	
	/**   
	* Title: studentOfCourseStatistics 
	* Description: TODO  
	* @param baseConditionVO
	* @param studentCourseVo2
	* @return
	* @author Administrator 
	*/
	
	public List<StudentCourseStatitics> selectStudentOfCourseStatistics(PageBean pageBean);
	
	/**   
	* Title: findVideoTotalCount 
	* Description: TODO  
	* @param openId
	* @return
	* @author Administrator 
	*/
	
	public Integer findVideoTotalCount(Integer openId);
	
	/**   
	* Title: findExameTotalScore 
	* Description: TODO  
	* @param openId
	* @return
	* @author Administrator 
	*/
	
	public List<Integer> findExameTotalScore(Integer openId);
	
	/**   
	* Title: findPaperTotalScore 
	* Description: TODO  
	* @return
	* @author Administrator 
	 * @param openId 
	*/
	
	public List<Integer> findPaperTotalScore(Integer openId);
	
}
