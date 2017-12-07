package com.yz.center.service.iface.course;

import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.yz.center.model.form.CourseChapterForm;
import com.yz.center.model.po.course.CourseChapterPo;
import com.yz.center.model.po.video.VideoPo;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月7日 上午11:17:04 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
public interface CourseChapterService {
	public List<CourseChapterPo> findCourseChapterByCourseId(Integer courseId);

    /**   
     * @Title: addChapter   
     * @Description:TODO  
     * @param chapterForm
     * @return int
    */
    
    public int addChapter(CourseChapterForm chapterForm);

    /**   
     * @Title: getChapterNameById   
     * @Description:TODO  
     * @param chapterId
     * @return String
    */
    
    public String getChapterNameById(Integer chapterId);

    /**   
     * @Title: chapterTree   
     * @Description:TODO  
     * @param courseId
     * @param parentId
     * @return JSONArray
    */
    
    public JSONArray chapterTree(Integer courseId, Integer parentId);

    /**   
     * @Title: delChapter   
     * @Description:TODO  
     * @param chapterPo
     * @return int
    */
    
    public int delChapter(CourseChapterPo chapterPo);

    /**   
     * @Title: updateChapter   
     * @Description:TODO  
     * @param chapterForm
     * @return int
    */
    
    public int updateChapter(CourseChapterForm chapterForm);

    /**   
     * @Title: delVideo   
     * @Description:TODO  
     * @param videoId void
     * @return 
    */
    
    public Integer delVideo(Integer videoId,Integer courseId);

    /**   
     * @Title: delFile   
     * @Description:TODO  
     * @param fileId void
     * @return 
    */
    
    public Integer delFile(Integer fileId);


    /**   
     * @Title: getVideoByChapterId   
     * @Description:TODO  
     * @param chapterId
     * @return VideoPo
    */
    
    public VideoPo getVideoByChapterId(Integer chapterId);
    public List<CourseChapterPo> getChapterList(CourseChapterPo po);
    public List<CourseChapterPo> getChapterSonList(CourseChapterPo po);

    /**   
     * @Title: modifySortChapterNumber   
     * @Description:TODO  
     * @param chapterId
     * @param chapterId2 void
    */
    
    public void modifySortChapterNumber2(Integer chapterId, Integer chapterId2);
    public void modifySortChapterNumber(Integer chapterId,Integer position,List<CourseChapterPo> chapterList);

    /**   
     * @Title: getByCourseAndParent   
     * @Description:TODO  
     * @param courseId
     * @param parent
     * @return List<CourseChapterPo>
    */
    
    public List<CourseChapterPo> getByCourseAndParent(Integer courseId, Integer parent);

    /**   
     * @Title: getChapterById   
     * @Description:TODO  
     * @param chapterId
     * @return CourseChapterPo
    */
    
    public CourseChapterPo getChapterById(Integer chapterId);

    /**   
     * @Title: updatechapterParentId   
     * @Description:TODO  
     * @param ccp void
    */
    
    public void updatechapterParentId(CourseChapterPo ccp);

    public Integer addLevel(Integer parentId,Integer courseId,Integer level) throws Exception;

	public Integer getVideoInfoBychapterId(Integer chapterId);

}