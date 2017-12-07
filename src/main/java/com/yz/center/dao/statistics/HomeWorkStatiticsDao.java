
/**    
* @Title: HomeWorkStatiticsDao.java
* @Package com.yz.center.dao.statistics
* @Description: TODO
* @author: 
* @date: 2017年1月13日 下午3:05:08 
* @version V1.0 
* @Copyright 亚卓教育
*   
*/  

package com.yz.center.dao.statistics;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yz.center.model.form.TestStatisticsCheckForm;
import com.yz.center.model.po.course.OpenCoursePo;
import com.yz.center.util.common.PageBean;

/**  
* @Description: TODO
* @author: 
* @date: 2017年1月13日 下午3:05:08 
* @version V1.0   
*/

public interface HomeWorkStatiticsDao {
	public List<OpenCoursePo> getCourseName(@Param(value="schoolId")Integer schoolId,@Param(value="useType")Integer useType);//取得作业所属课程名
	public List<OpenCoursePo> getHwInfo(PageBean pageBean);//取得作业列表
	public Integer getMarkCount(@Param(value="isExam")Integer isExam,@Param(value="useType")Integer useType,@Param(value="schoolId")Integer schoolId,@Param(value="Id")Integer Id);
	public Integer getSubmitCount(@Param(value="isExam")Integer isExam,@Param(value="useType")Integer useType,@Param(value="schoolId")Integer schoolId,@Param(value="Id")Integer Id);
	public Integer getHwStatisticsCount(PageBean pageBean);//统计作业数量
	
	public List<TestStatisticsCheckForm> testStatisticsCheck(PageBean pageBean);//取得查看学生考试信息列表
	public Integer getTestORHomeworkStatisticsCheckCount(PageBean pageBean);//统计查看学生考试信息数量
}