
/**    
* @Title: VideoStatisticsDao.java
* @Package com.yz.center.dao.statistics
* Description: TODO
* @author: 
* @date: 2017年1月4日 上午11:41:29 
* @version V1.0 
*   
*/  

package com.yz.center.dao.statistics;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yz.center.model.po.course.OpenCoursePo;
import com.yz.center.model.po.video.VideoPo;
import com.yz.center.model.vo.statistics.StudentStatisticsVo;
import com.yz.center.util.common.PageBean;

/**  
* Description: TODO
* @author Administrator  
* @date: 2017年1月4日 上午11:41:29 
* @version V1.0   
*/
@Repository
  public interface VideoStatisticsDao {
  public List<OpenCoursePo> getCourseBySchool(Integer schoolId);
  public List<VideoPo> getVideosByCourse(PageBean pageBean);
  public Integer selectVideosCountByCourse(PageBean pageBean);
  public Integer getWatchNumber(@Param("videoId") Integer videoId,@Param("openId") Integer openId);
  public List<StudentStatisticsVo> getWatchStudentByVideo(PageBean pageBean);
  public Integer getWatchStudentCountByVideo(PageBean pageBean);
}
