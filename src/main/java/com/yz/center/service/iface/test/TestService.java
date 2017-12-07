package com.yz.center.service.iface.test;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;

import com.yz.center.model.form.StuTestForm;
import com.yz.center.model.form.TestInfoForm;
import com.yz.center.model.form.TestStatisticsCheckForm;
import com.yz.center.model.po.course.OpenCoursePo;
import com.yz.center.model.po.paper.StudentSubjectPo;
import com.yz.center.model.po.paper.SubjectPo;
import com.yz.center.model.po.task.TaskPo;
import com.yz.center.model.po.test.FunctionPo;
import com.yz.center.model.po.test.SubjectTypePo;
import com.yz.center.model.po.test.TestPo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.model.vo.BaseConditionVO;
import com.yz.center.model.vo.BaseUser;
import com.yz.center.model.vo.test.TestVo;
import com.yz.center.util.common.PageBean;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月4日 下午4:06:49 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
public interface TestService {
	public List<SubjectTypePo> findType(); 
	
	public List<FunctionPo> findAllFunction();
	
	public PageBean findTest(PageBean pageBean);

	public TestPo findTestBySubjectId(Integer subjectId);
	
	public int addTest(TestVo testVo, UserPo loginUser);
	
	public Integer updateTestState(Integer testId);
	
	public int  updateManyTestState(Integer testIds[]) ;
	
	public int updateTest(TestVo testVo);

	public int insertTest(Integer courseId, Integer videoId,HttpSession session, List<TestVo> testVos);
	public PageBean getTestListByUserId(PageBean pageBean,Integer isSubmit,Integer studentId);//取得考试列表
	public Integer getCountByIsSubmit(PageBean pageBean,Integer studentId,Integer isSubmit);//根据是否提交取得试题总数
	public Integer getTestCount(Integer isSubmit,Integer openCourseId);//取得试题完成总数
	public List<OpenCoursePo> getCourseInfo(Integer pageSize,Integer begin,Integer openId,Integer isExam,Integer schoolId);
	public List<OpenCoursePo> getCourseName(Integer schoolId);//取得考试名
	public Integer getMarkCount(Integer openCourseId,Integer isExam,Integer schoolId);
	public Integer getSubmitCount(Integer openCourseId,Integer isExam,Integer schoolId);
	public Integer getTestStatisticsCount(Integer schoolId);
	public List<TestStatisticsCheckForm> testStatisticsCheck(Integer pageSize,Integer begin,Integer openCourseId,String name,String number,Integer schoolId);//取得查看学生考试信息列表
	public Integer getTestStatisticsCheckCount(Integer schoolId);//统计查看学生考试信息数量
	public Integer getlimitTime(@Param(value="openId")Integer openId,@Param(value="schoolId")Integer schoolId);
	public List<SubjectPo> getExamine(@Param(value="subjectIds")String subjectIds);//取得考试题目
	public int examineAdd(StudentSubjectPo studentSubjectPo);//学生考试新增
//	后台考试信息模块
	public List<TestInfoForm> getCourseNameForTest(Integer schoolId);//获取考试所属课程名
	public PageBean getTestInfo(PageBean pageBean,String courseName,String title);//获取考试信息列表
	public Integer getCountOfDelete(Integer Id,Integer schoolId);//判断是否要删除试卷,为0删除
    public int testDelete(Integer Id,Integer openId);//删除试卷
    public PageBean getPaperByPaperIdsOfTest(PageBean pageBean,String title,String paperIds);//查询点击考试的试卷
    
  //新建考试   
    public int testAdd(TaskPo taskPo);

}