/**
  * @FileName: CourseTypeDao.java
  * @Author 
  * @Description:
  * @Date 2016年10月28日 下午2:15:23
  * @CopyRight yazhuokj Corporation
  */
package com.yz.center.dao.course;

import java.util.List;

import com.yz.center.model.po.course.CourseTypePo;
import com.yz.center.model.vo.course.CourseInfoVo;
import com.yz.center.util.common.PageBean;

/**
 *课程类别Dao层
 */
public interface CourseTypeDao{
	public List<CourseTypePo> selectCourseTypeList(PageBean pageBean);

	public CourseTypePo findCourseType(Integer courseTypeId);

	public Integer addCourseType(CourseTypePo courseTypePo);

	public Integer updateCourseType(CourseTypePo courseTypePo);



	public void updateCourseTypeState(Integer courseTypeId);

	public void updateAllCourseTypeState(int[] typeIds);

	public Integer selectPageCount(PageBean pageBean);

    /**   
     * @Title: findAllTypes   
     * @Description:TODO  
     * @return List<CourseTypePo>
    */
    
    public List<CourseTypePo> findAllTypes();

	public List<CourseTypePo> findAllCourseTypesName(Integer schoolId);

	public List<CourseInfoVo> findCourseInfoVos(Integer schoolId);
	
	
	/**   
	 * 查询顶级分类列表   parentId = 0
	* @Title: selectParentTypes
	* @Description: 查询顶级分类列表   parentId = 0
	* @return  顶级分类列表 
	* @author:
	*/
	public List<CourseTypePo> selectParentTypes();
}