package com.yz.center.dao.lecturer;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yz.center.model.po.course.LecturerPo;
import com.yz.center.model.vo.BaseConditionVO;
import com.yz.center.util.common.PageBean;

public interface LecturerDao {
	public void lecturerAdd(LecturerPo lecturerPo);//添加讲师
	public void lecturerUpdate(LecturerPo lecturerPo);
	public Integer getCount(BaseConditionVO baseConditionVO);
	public void lecturerDel(@Param(value="lecturerId")Integer lecturerId,@Param(value="state")Integer state);
	public void lecturersDel(@Param(value="lecturerIds")String lecturerIds);
    /**   
     * @param code 
     * @Title: getLecturers   
     * @Description:TODO  
     * @return List<LecturerPo>
    */
    
    public List<LecturerPo> getLecturers(@Param(value="code")String code);
    public LecturerPo getLecturer(Integer lecturerId);
    /**   
     * @Title: delAllLecturer   
     * @Description:TODO  
     * @param courseId void
    */
    
    public void delAllLecturer(Integer courseId);
    
    public LecturerPo getlecturerByCourseId(Integer courseId);
    
    public List<LecturerPo> getlecturersByCourseId(Integer courseId);
    /**
     * 查询首页展示的讲师信息
     * @return
     */
	public List<LecturerPo> findIndexLectures();
	
	/**   
	* Title: findMoreLecturerInfo 
	* Description: TODO  
	* @param baseConditionVO
	* @return
	* @author Administrator 
	*/
	
	public List<LecturerPo> findMoreLecturerInfo(BaseConditionVO baseConditionVO);
	//讲师信息模块开始
	public List<LecturerPo> getLecturersByCondition(PageBean pageBean);
	public Integer getLecturersCountByCondition(PageBean pageBean);
	//讲师信息模块结束
}
