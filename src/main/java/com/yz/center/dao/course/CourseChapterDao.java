package com.yz.center.dao.course;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.yz.center.model.form.CourseChapterForm;
import com.yz.center.model.form.FileForm;
import com.yz.center.model.po.course.CourseChapterPo;
import com.yz.center.model.po.video.VideoPo;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月7日 上午11:35:44 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
public interface CourseChapterDao {

	public List<CourseChapterPo> findCourseChapterByCourseId(Integer courseId);

    /**   
     * @Title: addChapter   
     * @Description:TODO  
     * @param chapterForm void
    */
    
    public void addChapter(CourseChapterForm chapterForm);

    /**   
     * @Title: getChapterList   
     * @Description:TODO  
     * @param po
     * @return List<CourseChapterPo>
    */
    
    public List<CourseChapterPo> getChapterList(CourseChapterPo po);
    public List<CourseChapterPo> getChapterSonList(CourseChapterPo po);

    /**   
     * @Title: selectChapterMaxSort   
     * @Description:TODO  
     * @param chapterForm
     * @return int
    */
    
    public int selectChapterMaxSort(CourseChapterForm chapterForm);

    /**   
     * @Title: updateChapter   
     * @Description:TODO  
     * @param chapterForm void
    */
    
    public void updateChapter(CourseChapterForm chapterForm);

    /**   
     * @Title: updateChapterState   
     * @Description:TODO  
     * @param chapterPo void
    */
    
    public void updateChapterState(CourseChapterPo chapterPo);

    /**   
     * @Title: getChapterNameById   
     * @Description:TODO  
     * @param chapterId
     * @return String
    */
    
    public String getChapterNameById(Integer chapterId);

    /**   
     * @Title: delVideo   
     * @Description:TODO  
     * @param videoId
     * @return int
    */
    
    public int delVideo(Integer videoId);
    public int delVideoByChapterId(Integer chapterId);//根据章节id删除下面的视频

    /**   
     * @Title: getVideoByChapterId   
     * @Description:TODO  
     * @param chapterId
     * @return VideoPo
    */
    
    public VideoPo getVideoByChapterId(Integer chapterId);


    /**   
     * @Title: delFile   
     * @Description:TODO  
     * @param fileId
     * @return Integer
    */
    
    public Integer delFile(Integer fileId);

    /**   
     * @Title: getChapterById   
     * @Description:TODO  
     * @param chapterId
     * @return CourseChapterPo
    */
    
    public CourseChapterPo getChapterById(Integer chapterId);

    /**   
     * @Title: updateChapterSort   
     * @Description:TODO  
     * @param courseChapterPo1 void
    */
    
    public void updateChapterSort(CourseChapterPo courseChapterPo1);

    /**   
     * @Title: getByCourseAndParent   
     * @Description:TODO  
     * @param courseId
     * @param parent
     * @return List<CourseChapterPo>
    */
    
    public List<CourseChapterPo> getByCourseAndParent(@Param("courseId") Integer courseId, @Param("parentId") Integer parentId);

    /**   
     * @Title: updatechapterParentId   
     * @Description:TODO  
     * @param ccp void
    */
    
    public void updatechapterParentId(CourseChapterPo ccp);
    
   public Integer updatechapterLevel(@Param("level") Integer level,@Param("chapterId") Integer chapterId);

   public Integer getVideoInfoBychapterId(Integer chapterId);
}
