
/**    
* @Title: StudyService.java
* @Package com.yz.center.service.iface.student
* Description: TODO
* @author: 
* @date: 2016年12月16日 下午2:46:30 
* @version V1.0 
*   
*/  

package com.yz.center.service.iface.student;

import java.util.List;

import com.yz.center.model.po.paper.StudentPaperPo;
import com.yz.center.model.po.student.PlayRecordPo;
import com.yz.center.model.po.task.TaskPo;
import com.yz.center.model.po.video.VideoPo;
import com.yz.center.model.vo.frontPage.OpenCourseChapterNameVo;


/**  
* Description: TODO
* @author Administrator  
* @date: 2016年12月16日 下午2:46:30 
* @version V1.0   
*/

public interface StudyService {
   public PlayRecordPo addOrgetPlayRecordByStudentId(Integer studentId,Integer openId) throws Exception;
   public VideoPo getVideoByRecord(PlayRecordPo recordPo); 
   public List<VideoPo> getvideosByOpenId(Integer openId,Integer videoId);
   public void updatePlayRecord(Integer studentId,Integer openId,Integer videoId,Integer second,Integer isover,Integer sign) throws Exception;
   public StudentPaperPo getStudentPaperInfo(Integer studentId,Integer openId,Integer videoId,Integer paperId,Integer taskId,Integer schoolId);
   public OpenCourseChapterNameVo getOpenCourseName(Integer openId);
   public Integer getIsUnlockVideoOrNot(Integer openId,Integer unlockNum,Integer videoId);
   public VideoPo getVideoByVideoId(Integer videoId);
   public TaskPo getExamineTaskPaper(Integer openId,Integer videoId,Integer schoolId);
   public void addStudentPaperOfTest(Integer openId,Integer schoolId,Integer studentId );//生成学生考试试卷
   
   
/**   
* @Title: updateViewVideoCount
* @Description: 给学生学习情况中视频观看总数加1
* @param studentId
* @param openId
* @return
* @author:
*/
public int updateViewVideoCount(Integer studentId,Integer openId);
}
