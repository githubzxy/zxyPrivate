
/**    
* @Title: DiscussStatisticsDao.java
* @Package com.yz.center.dao.statistics
* Description: TODO
* @author: 
* @date: 2017年1月5日 下午2:00:45 
* @version V1.0 
*   
*/  

package com.yz.center.dao.statistics;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.yz.center.model.po.course.OpenCoursePo;
import com.yz.center.model.vo.statistics.DiscussThemeVo;
import com.yz.center.util.common.PageBean;

/**  
* Description: TODO
* @author Administrator  
* @date: 2017年1月5日 下午2:00:45 
* @version V1.0   
*/
@Repository
public interface DiscussStatisticsDao {
    public List<OpenCoursePo> getOpenCourseBySchool(Integer schoolId);
    public List<DiscussThemeVo> getDiscussTheme(PageBean pageBean);
    public Integer getDiscussReplyNumber(Integer themeId);
    public Integer getDiscussThemeCount(PageBean pageBean);
    
}
