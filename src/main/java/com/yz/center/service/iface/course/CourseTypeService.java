package com.yz.center.service.iface.course;

import java.util.List;

import com.yz.center.model.po.course.CourseTypePo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.model.vo.course.CourseInfoVo;
import com.yz.center.util.common.PageBean;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月1日 上午10:50:00 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
public interface CourseTypeService {
    
    public PageBean findCourseTypes(PageBean pageBean);

    public CourseTypePo findCourseType(Integer courseTypeId);
    
    public List<CourseTypePo> findAllCourseTypesName(Integer schoolId);
    

    public int addCourseType(CourseTypePo courseTypePo, UserPo user);

    public int modifyCourseType(CourseTypePo courseTypePo,UserPo user);

    public int removeCourseType(Integer courseTypeId);

    public int removeAllCourseType(int[] typeIds);
    
    //查询课程类别及其包含的课程基本信息
    public List<CourseInfoVo> findCourseInfoVos(Integer schoolId);

    /**   
     * @Title: findAllTypes   
     * @Description:TODO  
     * @return List<CourseTypePo>
    */
    
    public List<CourseTypePo> findAllTypes();

    
    /**   
     * 查询顶级分类 parentId = 0;
    * @Title: findPatrentType
    * @Description: 查询顶级分类 parentId = 0;
    * @return  顶级分类列表
    * @author:
    */
    public List<CourseTypePo> findPatrentType();

}
