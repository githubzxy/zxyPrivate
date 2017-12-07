package com.yz.center.dao.test;

import java.util.List;

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
import com.yz.center.model.vo.test.TestVo;
import com.yz.center.util.common.PageBean;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月4日 下午4:08:45 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
public interface TestDao {

	public List<SubjectTypePo> findType();

	public List<FunctionPo> findAllFunction();

	public List<TestPo> findTest(PageBean pageBean);
	
	public Integer selectPageCount(PageBean pageBean);
	
	public TestPo findTestBySubjectId(Integer subjectId);
	
	public void addTest(TestVo testVo);

	public void updateTest(TestVo testVo);
	
	public Integer updateTestState(@Param("testId")Integer testId);

	public void updateManyTestState(Integer[] testIds);
	public void insertTest(List<TestVo> testVos);
	public List<StuTestForm> getTestListByUserId(PageBean pageBean);//取得考试列表
	public Integer getTestCount(@Param(value="isSubmit")Integer isSubmit,@Param(value="openCourseId")Integer openCourseId);//取得试题完成总数
	public Integer getCountByIsSubmit(PageBean pageBean);//根据是否提交取得试题总数
	public List<OpenCoursePo> getCourseInfo(@Param(value="pageSize")Integer pageSize,@Param(value="begin")Integer begin,@Param(value="openId")Integer openId,@Param(value="isExam")Integer isExam,@Param(value="schoolId")Integer schoolId);
	
	public Integer getlimitTime(@Param(value="openId")Integer openId,@Param(value="schoolId")Integer schoolId);
	
	//学生个人中心模块
	public List<OpenCoursePo> getCourseName(Integer schoolId);//取得考试名
	public Integer getMarkCount(@Param(value="openCourseId")Integer openCourseId,@Param(value="isExam")Integer isExam,@Param(value="schoolId")Integer schoolId);
	public Integer getSubmitCount(@Param(value="openCourseId")Integer openCourseId,@Param(value="isExam")Integer isExam,@Param(value="schoolId")Integer schoolId);
	public Integer getTestStatisticsCount(Integer schoolId);
	public List<TestStatisticsCheckForm> testStatisticsCheck(@Param(value="pageSize")Integer pageSize,@Param(value="begin")Integer begin,@Param(value="openCourseId")Integer openCourseId,@Param(value="name")String name,@Param(value="number")String number,@Param(value="schoolId")Integer schoolId);//取得查看学生考试信息列表
	public Integer getTestStatisticsCheckCount(Integer schoolId);//统计查看学生考试信息数量
    public List<SubjectPo> getExamine(@Param(value="subjectIds")String subjectIds,@Param(value="functionId")Integer functionId);//取得考试题目
	public void examineAdd(StudentSubjectPo studentSubjectPo);//学生考试新增
//	考试信息模块
	public List<TestInfoForm> getCourseNameForTest(Integer schoolId);//获取考试所属课程名
	public List<TestInfoForm> getTestInfo(PageBean pageBean);//获取考试信息列表
	public Integer getCountOfTest(PageBean pageBean);//统计考试信息条数
	public Integer getCountOfDelete(@Param(value="Id")Integer Id,@Param(value="schoolId")Integer schoolId);//判断是否要删除试卷,返回为0删除
    public void testDelete(Integer Id);//删除试卷
    public List<TestInfoForm> getPaperByPaperIdsOfTest(PageBean pageBean);//查询点击考试的试卷
    public Integer getPaperCountByPaperIdsOfTest(PageBean pageBean);//查询点击考试的试卷数量
//新建考试   
    public void testAdd(TaskPo taskPo);
}