/**
  * @FileName: CourseService.java
  * @Author 
  * @Description:
  * @Date 2016年5月25日 下午3:31:17
  * @CopyRight yazhuokj Corporation
  */
package com.yz.center.service.iface.course;

import java.util.List;

import com.yz.center.model.form.CourseForm;
import com.yz.center.model.form.CourseInfoForm;
import com.yz.center.model.po.course.CoursePo;
import com.yz.center.util.common.PageBean;

public interface CourseService{

    /**   
     * @Title: findCourseById   
     * @Description:根据ID查询
     * @param id    ID
     * @return CoursePo   课程
    */
    public CoursePo findCourseById(final Integer id);
    
    /**   
     * @Title: findCourseByCourseId   
     * @Description:通过课程ID查询课程详情
     * @return CoursePo
    */
    public CoursePo getCourseByCourseId(int courseId);
    
    /**   
     * @param vo 
     * @Title: findCourses   
     * @Description:分页获取所有课程  
     * @return PageBean1<CoursePo>
    */
    public PageBean findCourses(PageBean pageBean);
  
    
    public List<CoursePo> findCourseByTypeId(Integer courseTypeId);
    /**   
     * @Title: findCourseAllBySchoolId   
     * @Description:TODO  
     * @param vo
     * @return List<CoursePo>
    */
    
    public PageBean findCourseAllBySchoolId(PageBean pageBean);

    /**   
     * @Title: getAllCource   
     * @Description:TODO  
     * @return List<CoursePo>
    */
    
    public List<CoursePo> getAllCource();

    /**   
     * @Title: addStepOne   
     * @Description:TODO  
     * @param courseForm
     * @param request 
     * @return int
    */
    
    public int addStepOne(CourseForm courseForm);

    /**   
     * @Title: findCourseNameAllBySchoolId   
     * @Description:TODO  
     * @param schoolId
     * @return List<CoursePo>
    */
    
    public List<CoursePo> findCourseNameAllBySchoolId(Integer schoolId);

    /**   
     * @Title: saveCourseType   
     * @Description:TODO  
     * @param courseType
     * @param courseType2 
     * @return Integer
    */
    
    public Integer saveCourseType(Integer courseId,Integer courseTypeId);

	public List<CoursePo> findCourseNameByTypeId(Integer courseTypeId);
	CourseInfoForm getCourseInfo(Integer courseId);

    /**   
     * @Title: updateCourseInfo   
     * @Description:TODO  
     * @param courseForm void
     * @return 
    */
    
    public int updateCourseInfo(CourseForm courseForm);

    /**   
     * @Title: addCourseLecture   
     * @Description:TODO  
     * @param courseId
     * @param string void
     * @return 
    */
    
    public Integer addCourseLecture(Integer courseId, String string);

    /**   
     * @Title: removeCourse   
     * @Description:TODO  
     * @param courseId
     * @return int
    */
    
    public int removeCourse(int courseId);

    /**   
     * @Title: delCover   
     * @Description:TODO  
     * @param coverId
     * @return int
    */
    
    public int delCover(int coverId);

    /**   
     * @Title: delCourseCover   
     * @Description:TODO  
     * @param courseId
     * @return boolean
    */
    
    public int delCourseCover(int courseId);
    void updateDtByCourseId(int courseId);

}