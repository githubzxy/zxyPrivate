
/**    
* @Title: StudyDao.java
* @Package com.yz.center.dao.student
* Description: TODO
* @author: 
* @date: 2016年12月16日 下午2:31:51 
* @version V1.0 
*   
*/  

package com.yz.center.dao.student;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yz.center.model.po.paper.StudentPaperPo;
import com.yz.center.model.po.student.PlayRecordPo;
import com.yz.center.model.po.task.TaskPo;
import com.yz.center.model.po.video.VideoPo;
import com.yz.center.model.vo.frontPage.OpenCourseChapterNameVo;

/**  
* Description: TODO
* @author Administrator  
* @date: 2016年12月16日 下午2:31:51 
* @version V1.0   
*/
@Repository
public interface StudyDao {
	public PlayRecordPo getPlayRecordByStudentId(@Param("studentId") Integer studentId,@Param("openId") Integer openId);
	public Integer addPlayRecord(PlayRecordPo playRecordPo);
    public List<VideoPo> getvideosByOpenId(@Param("openId") Integer openId,@Param("videoId") Integer videoId);
    public VideoPo getvideoByPlayRecord(Integer recordId);
    public Integer updatePlayRecord(PlayRecordPo playRecordPo);
    public StudentPaperPo getStudentPaperInfo(@Param("studentId") Integer studentId,@Param("openId") Integer openId,@Param("videoId") Integer videoId);
    public OpenCourseChapterNameVo getOpenCourseName(Integer openId);
    public List<VideoPo> getUnlockVideoIds(@Param("openId") Integer openId,@Param("unlockNum") Integer unlockNum);
    public VideoPo getVideoByVideoId(Integer videoId);
    public TaskPo getExamineTaskPaper(@Param("openId") Integer openId,@Param("videoId") Integer videoId,@Param("schoolId") Integer schoolId);
    public TaskPo getExamineTaskPaperOfTest(@Param("openId") Integer openId,@Param("schoolId") Integer schoolId);
    public Integer getStuPaperInfoById(Integer id);//取得课程下的考试
    public void addStudentPaperOfTest(StudentPaperPo studentPaperPo);//生成学生考试试卷
    public Integer addStudentPaperInfo(StudentPaperPo studentPaperPo);
    public Integer addClickNum(Integer openId);
    
    
    /**   
    * @Title: updateViewVideoCount
    * @Description: 给学生学习情况中观看视频总数加一
    * @param openId
    * @param studentId
    * @return
    * @author:
    */
    public Integer updateViewVideoCount(@Param("openId")Integer openId,@Param("studentId")Integer studentId);
    
    
    /**   
    * @Title: updateDiscussCount
    * @Description: 给学生学习情况中观看讨论总数加一 
    * @param openId
    * @param studentId
    * @return
    * @author:
    */
    public Integer updateDiscussCount(@Param("openId")Integer openId,@Param("studentId")Integer studentId);
    
    
    /**   
    * @Title: updateTaskCount
    * @Description: 给学生学习情况中观看作业总数加一 
    * @param openId
    * @param studentId
    * @return
    * @author:
    */
    public Integer updateTaskCount(@Param("openId")Integer openId,@Param("studentId")Integer studentId);
    
    
    /**   
    * @Title: updateExamineCount
    * @Description: 给学生学习情况中观看考试总数加一   
    * @param openId
    * @param studentId
    * @return
    * @author:
    */
    public Integer updateExamineCount(@Param("openId")Integer openId,@Param("studentId")Integer studentId);
}
