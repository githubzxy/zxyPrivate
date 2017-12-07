package com.yz.center.service.iface.lecturer;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yz.center.model.po.course.LecturerPo;
import com.yz.center.model.vo.BaseConditionVO;
import com.yz.center.util.common.PageBean;

public interface LecturerService {
	public int lecturerAdd(LecturerPo lecturerPo,Integer schoolId);//添加讲师
	public int lecturerUpdate(LecturerPo lecturerPo);
	/**   
     * @Title: getLecturer   
     * @Description:TODO  
     * @param lecturerName
     * @return List<LecturerPo>
    */
	public List<LecturerPo> getLecturers(String code);
	public LecturerPo getLecturer(Integer lecturerId);
	public Integer getCount();
	public int lecturerDel(Integer lecturerId);
	public int lecturersDel(String lecturerIds);
    /**   
     * @Title: delAllLecturer   
     * @Description:TODO  
     * @param courseId void
    */
    
	public LecturerPo getlecturerByCourseId(Integer courseId);
    public List<LecturerPo> findIndexLectures();
    public void delAllLecturer(Integer courseId);
	
	/**   
	* Title: findMoreLecturerInfo 
	* Description: TODO  
	* @param baseConditionVO
	* @return
	* @author Administrator 
	*/
	
	public List<LecturerPo> findMoreLecturerInfo(BaseConditionVO baseConditionVO);
	//讲师信息模块开始
	public PageBean getLecturersByCondition(PageBean pageBean,String name,String position);
	//讲师信息模块结束
	//前台页面不同课程下讲师的展示
	public List<LecturerPo> getlecturersByCourseId(Integer courseId);
}
