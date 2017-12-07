
/**    
* @Title: HomeWork.java
* @Package com.yz.center.dao.homeWork
* Description: TODO
* @author: 
* @date: 2016年12月16日 下午3:16:02 
* @version V1.0 
*   
*/  

package com.yz.center.dao.homeWork;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yz.center.model.form.FindHomeworkForm;
import com.yz.center.model.form.HomeWorkForm;
import com.yz.center.model.form.TestInfoForm;
import com.yz.center.model.po.course.OpenCoursePo;
import com.yz.center.model.po.paper.PaperPo;
import com.yz.center.model.po.paper.StudentPaperPo;
import com.yz.center.model.po.paper.StudentSubjectPo;
import com.yz.center.model.po.paper.SubjectPo;
import com.yz.center.model.po.task.TaskPo;
import com.yz.center.model.po.task.TaskPo;
import com.yz.center.util.common.PageBean;
/**  
* Description: TODO
* @author Administrator  
* @date: 2016年12月16日 下午3:16:02 
* @version V1.0   
*/

public interface HomeWorkDao {
	public List<HomeWorkForm> getHomework(PageBean pageBean);//取得作业列表信息
	public Integer getHomeworkCount(PageBean pageBean);//取得统计作业数量
	public Integer getHomeworkCountOfPersonal(PageBean pageBean);//统计作业数量用于个人中心首页消息显示
	public List<FindHomeworkForm> findHomework(PageBean pageBean);//作业详情
	public Integer getCountByopenCourseId(PageBean pageBean);//统计作业列表
	public Integer getTotalCount(PageBean pageBean);//取得全部套数
	public Integer getfinishCount(PageBean pageBean);//取得完成套数
	public PaperPo getPaperByPaperId(@Param("paperId")Integer paperId,@Param("studentId")Integer studentId);//取得试卷信息
	public List<SubjectPo> getHwTest(@Param(value="subjectIds")String subjectIds,@Param(value="functionId")Integer functionId);//取得去做作业题目
	public SubjectPo getsubjectTypeCount(@Param(value="subjectIds")String subjectIds);//取得数量
	public void hwTestAdd(StudentSubjectPo studentSubjectPo);//取得作业列表信息
	public int updateStudentPaperByIsSubmit(StudentPaperPo studentPaperPo);//作业提交将试卷表改为提交状态
	public Integer getCount(@Param(value="studentId")Integer studentId,@Param(value="openCourseId")Integer openCourseId);
	public StudentSubjectPo getSubjectById(@Param(value="studentPaperId")Integer studentPaperId,@Param(value="subjectTypeId")Integer subjectTypeId);
	public StudentPaperPo getSubjectSubDateById(Integer studentPaperId);
	public List<OpenCoursePo> getCourseName(Integer schoolId);//取得作业所属课程名
	public List<OpenCoursePo> getHwInfo(@Param(value="pageSize")Integer pageSize,@Param(value="begin")Integer begin,@Param(value="openId")Integer openId,@Param(value="schoolId")Integer schoolId);//取得作业列表
	public Integer getHwStatisticsCount(Integer schoolId);//统计作业数量
	public OpenCoursePo getOpenCourseInfo(Integer openId);

	
	/**   
	* Title: isSumit 
	* Description: TODO  
	* @param studentId
	* @param id
	* @return
	* @author Administrator 
	*/
	
	public FindHomeworkForm isSumit(@Param("studentId")Integer studentId, @Param("Id")Integer Id);

	
//	作业信息模块 
    public List<TestInfoForm> getCourseNameOfHw(Integer schoolId);//获取作业所属课程名
    public List<TestInfoForm> getVideoNameOfHw(Integer schoolId);//获取作业所属视频名
	public List<TestInfoForm> getHomeworkInfo(PageBean pageBean);//获取作业信息列表
	public Integer getCountOfHomework(PageBean pageBean);//统计作业信息条数
    public void homeworkDelete(Integer Id);//删除试卷
    public List<TestInfoForm> getPaperByPaperIdsOfHw(PageBean pageBean);//查询点击作业的试卷
    public Integer getPaperCountByPaperIdsOfHw(PageBean pageBean);//查询点击作业的试卷数量
 
// 新建作业 
    public void homeworkAdd(TaskPo taskPo);
    public Float getExamineOrTaskGrade(@Param("studentId")Integer studentId,@Param("openId")Integer openId,@Param("isExam")float isExam);//获得作业和考试分数总数
    public void updateTaskCount(@Param("studentId")Integer studentId,@Param("openId")Integer openId,@Param("taskCount")Integer taskCount,@Param("taskGrade")float taskGrade);//更新作业完成数
    public void updateExamineCount(@Param("studentId")Integer studentId,@Param("openId")Integer openId,@Param("examineCount")Integer examineCount,@Param("examineGrade")float examineGrade);//更新考试完成数
    

}
