
/**    
* @Title: HomeWorkService.java
* @Package com.yz.center.service.iface
* Description: TODO
* @author: 
* @date: 2016年12月16日 下午3:25:15 
* @version V1.0 
*   
*/  

package com.yz.center.service.iface.homework;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yz.center.model.form.TestInfoForm;
import com.yz.center.model.po.course.OpenCoursePo;
import com.yz.center.model.po.paper.PaperPo;
import com.yz.center.model.po.paper.StudentPaperPo;
import com.yz.center.model.po.paper.StudentSubjectPo;
import com.yz.center.model.po.paper.SubjectPo;
import com.yz.center.model.po.task.TaskPo;
import com.yz.center.util.common.PageBean;


/**  
* Description: TODO
* @author Administrator  
* @date: 2016年12月16日 下午3:25:15 
* @version V1.0   
*/

public interface HomeworkService {
	public PageBean getHomework(PageBean pageBean,Integer studentId);//取得作业列表信息
	public Integer getHomeworkCount(PageBean pageBean);//取得统计作业数量
	public PageBean findHomework(PageBean pageBean,Integer studentId);
	public Integer getHomeworkCountOfPersonal(PageBean pageBean);//统计作业数量用于个人中心首页消息显示
	public PaperPo getPaperByPaperId(Integer paperId,Integer studentId);//取得试卷信息
	public List<SubjectPo> getHwTest(String subjectIds);//取得去做作业题目
	public SubjectPo getsubjectTypeCount(@Param(value="subjectIds")String subjectIds);//取得数量
	public int hwTestAdd(StudentSubjectPo studentSubjectPo);//取得作业列表信息
	public void updateStudentPaperByIsSubmit(StudentPaperPo studentPaperPo);//作业提交将试卷表改为提交状态
	public Integer getCount(Integer studentId,Integer openCourseId);
	public StudentSubjectPo getSubjectById(Integer studentPaperId,Integer subjectTypeId);
	public StudentPaperPo getSubjectSubDateById(Integer studentPaperId);
	public List<OpenCoursePo> getCourseName(Integer schoolId);//取得作业所属课程名
	public List<OpenCoursePo> getHwInfo(Integer pageSize,Integer begin,Integer openId,Integer schoolId);//取得作业列表
	public Integer getHwStatisticsCount(Integer schoolId);//统计作业数量
	
//	作业信息模块 
	public List<TestInfoForm> getCourseNameOfHw(Integer schoolId);//获取作业所属课程名
    public List<TestInfoForm> getVideoNameOfHw(Integer schoolId);//获取作业所属视频名
    public PageBean getHomeworkInfo(PageBean pageBean,String courseName,String videoName,String title);//获取作业信息列表
	public int homeworkDelete(Integer Id,Integer openId);//删除试卷
	public PageBean getPaperByPaperIdsOfHw(PageBean pageBean,String title,String paperIds);//查询点击作业的试卷
// 新建作业 
    public int homeworkAdd(TaskPo taskPo);
}
