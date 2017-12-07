package com.yz.center.dao.course;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.pagehelper.Page;
import com.yz.center.model.form.CourseForm;
import com.yz.center.model.form.CourseInfoForm;
import com.yz.center.model.po.course.CoursePo;
import com.yz.center.util.common.PageBean;


public interface CourseDao{

    /**   
     * @Title: add   
     * @Description:增加  
     * @param form 
     * @return Integer
    */
    public Integer add(CourseForm form);
    
    /**   
     * @Title: update   
     * @Description:更新  
     * @param form
     * @return Integer
    */
    public Integer update(final CourseForm form);
    
    /**   
     * @Title: checkEditable   
     * @Description:检查是否可编辑  
     * @param id    课程ID
     * @return int  1可编辑   0不可编辑
    */
    public int checkEditable(final Integer id);
    
    /**   
     * @Title: changeEnabled   
     * @Description:更改状态 
     * @param id    课程ID
     * @param enabled   状态
     * @return int  
    */
    public int changeEnabled(@Param("id") final Integer id,@Param("enabled") final Integer enabled);
    
    /**   
     * @Title: changeCourseType   
     * @Description:更改课程类别  
     * @param courseId 课程ID
     * @param courseTypeId  课程类别ID
    */
    public Integer changeCourseType(@Param("courseId") Integer courseId,@Param("courseTypeId") Integer courseTypeId);

    
    /**   
     * @Title: findPageBreakBySchoolId   
     * @Description:查询课程列表
     * @param vo    条件
     * @param rb    分页
     * @return List<CoursePo>
    */
    public List<CoursePo> findPageBreakByCollection(PageBean pageBean);
    
    /**   
     * @Title: isUniqueCoursename   
     * @Description:检查是否有重名  
     * @param schoolId  学校ID
     * @param courseName    课程名称
     * @return Integer  
    */
    public Integer isUniqueCoursename(@Param("schoolId") Integer schoolId,@Param("courseName") String courseName);
    
    /**   
     * @param vo 
     * @Title: selectCourseCount   
     * @Description:查询有效的课程总数
     * @return int 课程总数
    */
    public int selectCourseCount(PageBean pageBean);
    
    
    /**   
     * @Title: selectCourseById   
     * @Description: 通过课程Id查询课程详情
     * @param courseId 课程ID
     * @return CoursePo  课程详情
    */
    public CoursePo selectCourseById(int courseId);
    
    /**   
     * @param vo 
     * @Title: selectCourseList
     * @Description:分页查询查询所有课程
     * @return List<CoursePo>
    */
    public List<CoursePo> selectCourseList(PageBean pageBean);
    
    /**   
     * @Title: selectAllCourseList
     * @Description:查询所有课程
     * @return List<CoursePo>
    */
    public List<CoursePo> selectAllCourseList();
    
    /**   
     * @Title: updateAllCourseState   
     * @Description: 批量删除课程
     * @param courseIds 课程id组成的数组
    */
    public void updateAllCourseState(int courseIds[]);
    
    
    public List<CoursePo> getCourseAllBySchoolId(PageBean vo);


    /**   
     * @Title: findCourseByTypeId   
     * @Description:TODO  
     * @param courseTypeId
     * @return List<CoursePo>
    */
    
    public List<CoursePo> findCourseByTypeId(Integer courseTypeId);


    /**   
     * @Title: findCourseByCourseId   
     * @Description:TODO  
     * @param courseId
     * @return CoursePo
    */
    
    public CoursePo getCourseByCourseId(int courseId);



    /**   
     * @Title: openOpenCourse   
     * @Description:TODO  
     * @param id
     * @return int
    */
    
    public int openOpenCourse(Integer id);

	public List<CoursePo> findCourseNameAllBySchoolId(Integer schoolId);
	
	public int addStepOne(CourseForm courseForm);
	
	public List<CoursePo> findCourseNameByTypeId(Integer typeId);

    
    public Integer addCourseLecture(@Param("courseId") Integer courseId,@Param("lecturerId") String lecturerId);

    public int delCourse(int courseId);
    
    public int updateCourseInfo(CourseForm courseForm);

	public CourseInfoForm getCourseInfo(Integer courseId);

    /**   
     * @Title: delCover   
     * @Description:TODO  
     * @return int
    */
    
    public int delCover(Integer coverId);

    /**   
     * @Title: delCourseCover   
     * @Description:TODO  
     * @param courseId
     * @return int
    */
    
    public int delCourseCover(int courseId);
	void updateDtByCourseId(int courseId);
	void updateVideoCount(int courseId);//视频上传保存后更新opencouere表的videoCount
}