package com.yz.center.service.impl.test;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.yz.center.dao.course.OpenCourseDao;
import com.yz.center.dao.homeWork.HomeWorkDao;
import com.yz.center.dao.test.TestDao;
import com.yz.center.model.form.StuTestForm;
import com.yz.center.model.form.TestInfoForm;
import com.yz.center.model.form.TestStatisticsCheckForm;
import com.yz.center.model.po.course.OpenCoursePo;
import com.yz.center.model.po.paper.StudentPaperPo;
import com.yz.center.model.po.paper.StudentSubjectPo;
import com.yz.center.model.po.paper.SubjectPo;
import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.model.po.task.TaskPo;
import com.yz.center.model.po.test.FunctionPo;
import com.yz.center.model.po.test.SubjectTypePo;
import com.yz.center.model.po.test.TestPo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.model.vo.BaseUser;
import com.yz.center.model.vo.test.TestVo;
import com.yz.center.service.iface.test.TestService;
import com.yz.center.util.CommonUtil;
import com.yz.center.util.Static;
import com.yz.center.util.common.PageBean;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月4日 下午4:07:20 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
@Service("testService")
public class TestServiceImpl implements TestService{
	@Resource
	private TestDao testDao;
	@Resource
	private OpenCourseDao openCourseDao;
	@Resource
	private HomeWorkDao homeWorkDao;
	
	@Override
	/**
	 * 查询试题类行
	 */
	public List<SubjectTypePo> findType() {
		// TODO Auto-generated method stub
		return testDao.findType();
	}
	@Override
	/**
	 * 查询试题用途
	 */
	public List<FunctionPo> findAllFunction() {
		// TODO Auto-generated method stub
		return testDao.findAllFunction();
	}
	@Override
	/**
	 * 添加试题
	 */
	public int addTest(TestVo testVo,UserPo loginUser) {

		testVo.setUserId(loginUser.getUserId());
		 Integer typeId = testVo.getSubjectTypeId();
		if(typeId==3){
			String trueOption = testVo.getTrueOption();
			if(trueOption.length()>0 && trueOption.indexOf(",") >= 0) {
				trueOption = trueOption.replaceAll(",", "");
	        }
			testVo.setTrueOption(trueOption);
		}
	/*	try {*/
			testDao.addTest(testVo);
		/*} catch (Exception e) {
			return CommonUtil.FLAG_FAILD;
		}*/
		return CommonUtil.FLAG_SUCESS;
	}
	@Override
	/**
	 * 单条删除试题
	 */
	public Integer updateTestState(Integer testId) {
		
		Integer flag = testDao.updateTestState(testId);
	
		return flag;
	}

	@Override
	/**
	 * 批量删除
	 */
	public int updateManyTestState(Integer[] testIds) {
		try {
			testDao.updateManyTestState(testIds);
		} catch (Exception e) {
			return CommonUtil.FLAG_FAILD;
		}
		return CommonUtil.FLAG_SUCESS;
	}
	
	@Override
	/**
	 * 更新试题
	 */
	public int updateTest(TestVo testVo) {
		try {
			testDao.updateTest(testVo);
		} catch (Exception e) {
			return CommonUtil.FLAG_FAILD;
		}
		return CommonUtil.FLAG_SUCESS;
	}
	
	/**
	 * 分页查询试题基本信息
	 */
	@Override
	public PageBean findTest(PageBean pageBean) {
		int count = testDao.selectPageCount(pageBean);
		pageBean.setTotalPage(count);
		List<TestPo> list = testDao.findTest(pageBean);
		pageBean.setList(list);
		return pageBean;
	}

	/**
	 * 单条查询
	 */
	public TestPo findTestBySubjectId(Integer subjectId) {
		TestPo testPo = new TestPo();
		testPo =testDao.findTestBySubjectId( subjectId);
		return testPo;
	}
	@Override
	/**
	 * 批量插入
	 * @param courseId
	 * @param videoId
	 * @param userId
	 * @param testVos
	 * @return
	 */
	public int insertTest(Integer courseId, Integer videoId,HttpSession session, List<TestVo> testVos) {
		UserPo userPo =(UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
		Integer userId = userPo.getUserId();
		SchoolPo schoolPo = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
		Integer schoolId = schoolPo.getSchoolId();
		for(TestVo testVo :testVos){
			 Integer typeId = testVo.getSubjectTypeId();
				if(typeId==3){
					String trueOption = testVo.getTrueOption();
					if(trueOption.length()>0 && trueOption.indexOf(",") >= 0) {
						trueOption = trueOption.replaceAll(",", "");
			        }
					testVo.setTrueOption(trueOption);
				}
			testVo.setUserId(userId);
			testVo.setCourseId(courseId);
			testVo.setVideoId(videoId);
			testVo.setSchoolId(schoolId);
		}
		try {
			testDao.insertTest(testVos);
		} catch (Exception e) {
			return CommonUtil.FLAG_FAILD;
		}
		
		return CommonUtil.FLAG_SUCESS;
	}
	@Override
	public int testAdd(TaskPo taskPo) {
		// TODO Auto-generated method stub
				taskPo.setCreateDate(new Date());
				taskPo.setUseType(2);//用于考试
				try{
					openCourseDao.updateExamineCount(taskPo.getOpenCourseId());
					testDao.testAdd(taskPo);
				}
				catch(Exception e){
					e.printStackTrace();
		           return CommonUtil.FLAG_FAILD;
		       }
		       return CommonUtil.FLAG_SUCESS;
			}
	
	
	@Override
	public PageBean getTestListByUserId(PageBean pageBean,Integer isSubmit,Integer studentId) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("isSubmit", isSubmit);
		map.put("studentId", studentId);
		pageBean.params = map;
		List<StuTestForm> testList = testDao.getTestListByUserId(pageBean);
//		for (StuTestForm stuf:testList) {
//			
//			if(isSubmit==1){
//				Date submitDate = stuf.getSubmitDate();
//				stuf.setSubmitDate(submitDate);
//				Integer openCourseId = stuf.getOpenCourseId();
//				Integer testCounts = testDao.getTestCount(1,openCourseId);
//				stuf.setTestCounts(testCounts);
//			}else {
//				Date startDate = stuf.getExamineStartDate();
//				Date examineEndDate = stuf.getExamineEndDate();
//				stuf.setExamineStartDate(startDate);
//				stuf.setExamineEndDate(examineEndDate);
//			}
//			
//		}
		Integer totalPage = testDao.getCountByIsSubmit(pageBean);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(testList);
		return pageBean;
	}
	

	@Override
	public Integer getCountByIsSubmit(PageBean pageBean,Integer studentId,Integer isSubmit) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("isSubmit", isSubmit);
		map.put("studentId", studentId);
		pageBean.params = map;
		return testDao.getCountByIsSubmit(pageBean);
	}
	@Override
	public Integer getTestCount(Integer isSubmit, Integer openCourseId) {
		// TODO Auto-generated method stub
		return testDao.getTestCount(isSubmit, openCourseId);
	}
	@Override
	public List<OpenCoursePo> getCourseInfo(Integer pageSize,Integer begin,Integer openId,Integer isExam,Integer schoolId) {
		return testDao.getCourseInfo(pageSize, begin, openId,isExam,schoolId);
	}
	@Override
	public Integer getMarkCount(Integer openCourseId,Integer isExam,Integer schoolId) {
		// TODO Auto-generated method stub
		return testDao.getMarkCount(openCourseId,isExam,schoolId);
	}
	@Override
	public Integer getSubmitCount(Integer openCourseId,Integer isExam,Integer schoolId) {
		// TODO Auto-generated method stub
		return testDao.getSubmitCount(openCourseId,isExam,schoolId);
	}
	@Override
	public Integer getTestStatisticsCount(Integer schoolId) {
		// TODO Auto-generated method stub
		return testDao.getTestStatisticsCount(schoolId);
	}
	@Override
	public List<TestStatisticsCheckForm> testStatisticsCheck(Integer pageSize, Integer begin,Integer openCourseId,String name,String number,Integer schoolId) {
		// TODO Auto-generated method stub
		return testDao.testStatisticsCheck(pageSize, begin, openCourseId, name, number,schoolId);
	}
	@Override
	public Integer getTestStatisticsCheckCount(Integer schoolId) {
		// TODO Auto-generated method stub
		return testDao.getTestStatisticsCheckCount(schoolId);
	}
	@Override
	public List<OpenCoursePo> getCourseName(Integer schoolId) {
		// TODO Auto-generated method stub
		return testDao.getCourseName(schoolId);
	}
	@Override
	public List<TestInfoForm> getCourseNameForTest(Integer schoolId) {
		// TODO Auto-generated method stub
		return testDao.getCourseNameForTest(schoolId);
	}
	@Override
	public PageBean getTestInfo(PageBean pageBean, String courseName, String title) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("courseName", courseName);
		map.put("title", title);
		pageBean.params = map;
		Integer countOfTest = testDao.getCountOfTest(pageBean);
		List<TestInfoForm> testInfo = testDao.getTestInfo(pageBean);
		pageBean.setTotalPage(countOfTest);
		pageBean.setList(testInfo);
		return pageBean;
	}

	@Override
	public Integer getCountOfDelete(Integer Id,Integer schoolId) {
		// TODO Auto-generated method stub
		return testDao.getCountOfDelete(Id,schoolId);
	}
	@Override
	public int testDelete(Integer Id,Integer openId) {
		// TODO Auto-generated method stub
		try{
			testDao.testDelete(Id);
			openCourseDao.updateExamineCountOfDelete(openId);
			
		}
		catch(Exception e){
			e.printStackTrace();
           return CommonUtil.FLAG_FAILD;
       }
       return CommonUtil.FLAG_SUCESS;
	}
	@Override
	public PageBean getPaperByPaperIdsOfTest(PageBean pageBean, String title,String paperIds) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("title", title);
		map.put("paperIds", paperIds);
		pageBean.params = map;
		Integer paperCount = testDao.getPaperCountByPaperIdsOfTest(pageBean);
		pageBean.setTotalPage(paperCount);
		List<TestInfoForm> papers = testDao.getPaperByPaperIdsOfTest(pageBean);
		pageBean.setList(papers);
		return pageBean;
	}
	@Override
	public Integer getlimitTime(Integer openId, Integer schoolId) {
		// TODO Auto-generated method stub
		return testDao.getlimitTime(openId, schoolId);
	}
	@Override
	public List<SubjectPo> getExamine(String subjectIds) {
		// TODO Auto-generated method stub
		return testDao.getExamine(subjectIds, 2);
	}
	@Override
	public int examineAdd(StudentSubjectPo studentSubjectPo) {
		// TODO Auto-generated method stub
		int studentId=studentSubjectPo.getStudentId();
		String subjectIdString = studentSubjectPo.getSubjectIds();//得到题目
		String stuAnswerString =studentSubjectPo.getStuAnswers();//得到学生答案
		List<SubjectPo> examine =testDao.getExamine(subjectIdString, 2);
		String[] subjectIdArray ;
		String[] stuAnswerArray ;
		if(subjectIdString.indexOf(",")!=-1){
			subjectIdArray = subjectIdString.split(",");
			stuAnswerArray = stuAnswerString.split(",");
		}else{
			subjectIdArray = new String[]{subjectIdString};
			stuAnswerArray = new String[]{stuAnswerString};
		}
		//将取到的题目id和学生答案存到map里
		Map<String, String> map=new HashMap<String, String>();
		for (int i = 0; i < subjectIdArray.length; i++) {
			map.put(subjectIdArray[i], stuAnswerArray[i]);
		}
		int tmp1=0;
		int tmp2=0;
		int tmp3=0;
		String subjectIds1="";
		String subjectIds2="";
		String subjectIds3="";
		String trueOption1="";
		String trueOption2="";
		String trueOption3="";
		String stuAnswers1="";
		String stuAnswers2="";
		String stuAnswers3="";
		String score1="";
		String score2="";
		String score3="";
		Float stuScore1=0f;
		Float stuScore2=0f;
		Float stuScore3=0f;
		for (int i = 0; i < examine.size(); i++) {
			for (String key : map.keySet()) {  
				String value = map.get(key);  
				String trueOption=examine.get(i).getTrueOption();
				Integer subjectTypeId=examine.get(i).getSubjectTypeId();
				Integer subjectId=examine.get(i).getSubjectId();
				if(subjectTypeId==1&&!"0".equals(value)&&subjectId==Integer.parseInt(key)){
					stuAnswers1+=value+",";
					trueOption1+=trueOption+",";
					subjectIds1+=subjectId+",";
					if(trueOption.equals(value)){
						tmp1++;
						score1+=studentSubjectPo.getType1Score()+",";
					}else {
						score1+=0+",";
					}
				}else if(subjectTypeId==2&&!"0".equals(value)&&subjectId==Integer.parseInt(key)){
					stuAnswers2+=value+",";
					trueOption2+=trueOption+",";
					subjectIds2+=subjectId+",";
					if(trueOption.equals(value)){
						tmp2++;
						score2+=studentSubjectPo.getType2Score()+",";
					}else {
						score2+=0+",";
					}
				}else if(subjectTypeId==3&&!"0".equals(value)&&subjectId==Integer.parseInt(key)){
					stuAnswers3+=value+",";
					trueOption3+=trueOption+",";
					subjectIds3+=subjectId+",";
					if(trueOption.equals(value)){
						tmp3++;
						score3+=studentSubjectPo.getType3Score()+",";
					}else {
						score3+=0+",";
					}

				}

			} 	
		}
		StudentSubjectPo studentSubjectPo1=null;
		StudentSubjectPo studentSubjectPo2=null;
		StudentSubjectPo studentSubjectPo3=null;
		if(score1!=null&&!score1.equals("")){
			studentSubjectPo1=new StudentSubjectPo();
			stuScore1=tmp1*studentSubjectPo.getType1Score();
			studentSubjectPo1.setStuScore(stuScore1);
			//SubjectTypeId=1插入数据
			if(stuAnswers1.length()>0){
				//		studentSubjectPo1.setStudentSubjectId(Integer.parseInt(1+"_"+userId));
				studentSubjectPo1.setStudentPaperId(studentSubjectPo.getStudentPaperId());
				studentSubjectPo1.setStuAnswers(stuAnswers1.substring(0,stuAnswers1.length()-1));
				studentSubjectPo1.setSubjectTypeId(1);
				studentSubjectPo1.setTotalScore(studentSubjectPo.getType1Score()*studentSubjectPo.getCt1());
				studentSubjectPo1.setSubjectNum(studentSubjectPo.getCt1());
				studentSubjectPo1.setAnySubjectScore(score1.substring(0,score1.length()-1));
				studentSubjectPo1.setTrueAnswers(trueOption1.substring(0,trueOption1.length()-1));
				studentSubjectPo1.setSubjectIds(subjectIds1.substring(0,subjectIds1.length()-1));
				testDao.examineAdd(studentSubjectPo1);
			}
			

		}else {
			stuScore1=0f;
		}

		if(score2!=null&&!score2.equals("")){
			//SubjectTypeId=2插入数据
			studentSubjectPo2=new StudentSubjectPo();
			stuScore2=tmp2*studentSubjectPo.getType2Score();
			studentSubjectPo2.setStuScore(stuScore2);
			//				studentSubjectPo2.setStudentSubjectId(Integer.parseInt(1+"_"+userId));
			if(stuAnswers2.length() > 0&&studentSubjectPo.getCt2()!=null){
				studentSubjectPo2.setStudentPaperId(studentSubjectPo.getStudentPaperId());
				studentSubjectPo2.setStuAnswers(stuAnswers2.substring(0,stuAnswers2.length()-1));
				studentSubjectPo2.setSubjectTypeId(2);
				studentSubjectPo2.setTotalScore(studentSubjectPo.getType2Score()*studentSubjectPo.getCt2());
				studentSubjectPo2.setSubjectNum(studentSubjectPo.getCt2());
				studentSubjectPo2.setAnySubjectScore(score2.substring(0,score2.length()-1));
				studentSubjectPo2.setTrueAnswers(trueOption2.substring(0,trueOption2.length()-1));
				studentSubjectPo2.setSubjectIds(subjectIds2.substring(0,subjectIds2.length()-1));
				testDao.examineAdd(studentSubjectPo2);
			}
		}else {
			stuScore2=0f;
		}

		if(score3!=null&&!score3.equals("")){
			//SubjectTypeId=3插入数据
			studentSubjectPo3=new StudentSubjectPo();
			stuScore3=tmp3*studentSubjectPo.getType3Score();
			studentSubjectPo3.setStuScore(stuScore3);
			if(stuAnswers3.length() > 0&&studentSubjectPo.getCt3()!=null){
				//				studentSubjectPo3.setStudentSubjectId(Integer.parseInt(1+"_"+userId));
				studentSubjectPo3.setStudentPaperId(studentSubjectPo.getStudentPaperId());
				studentSubjectPo3.setStuAnswers(stuAnswers3.substring(0,stuAnswers3.length()-1));
				studentSubjectPo3.setSubjectTypeId(3);
				studentSubjectPo3.setTotalScore(studentSubjectPo.getType3Score()*studentSubjectPo.getCt3());
				studentSubjectPo3.setSubjectNum(studentSubjectPo.getCt3());
				studentSubjectPo3.setAnySubjectScore(score3.substring(0,score3.length()-1));
				studentSubjectPo3.setTrueAnswers(trueOption3.substring(0,trueOption3.length()-1));
				studentSubjectPo3.setSubjectIds(subjectIds3.substring(0,subjectIds3.length()-1));
				testDao.examineAdd(studentSubjectPo3);
			}
				
			

		}else {
			stuScore3=0f;
		}
		//更新student_paper_info列表
		StudentPaperPo studentPaperPo=new StudentPaperPo();
		studentPaperPo.setIsSubmit(1);
		studentPaperPo.setSubmitDate(new Date());
		float examineGrade=stuScore1+stuScore2+stuScore3;
		studentPaperPo.setScore(examineGrade);
		studentPaperPo.setStudentPaperId(studentSubjectPo.getStudentPaperId());
		studentPaperPo.setStudent_id(studentId);
		int flag=studentSubjectPo.getFlag();
		try{
			PageBean pageBean=new PageBean();
			pageBean.setOpenId(studentSubjectPo.getOpenId());
			Map<String,Object> map2 = new HashMap<String,Object>();
			map2.put("studentId", studentId);
			if (flag==0) {
				map2.put("isExam", 0);
			}else{
				map2.put("isExam", 1);
			}
			pageBean.params = map2;
			//更新study_course_info taskcount
			homeWorkDao.updateStudentPaperByIsSubmit(studentPaperPo);
			if (flag==0) {
				Integer taskCount = homeWorkDao.getfinishCount(pageBean);
				OpenCoursePo openCoursePo = homeWorkDao.getOpenCourseInfo(studentSubjectPo.getOpenId());
				Float examineOrTaskGrade = homeWorkDao.getExamineOrTaskGrade(studentId, studentSubjectPo.getOpenId(),1);
				Integer totalTaskCount = openCoursePo.getTaskCount();
				Integer taskPercent = openCoursePo.getTaskPercent();
				float taskGrade=(float)taskPercent*(taskCount/totalTaskCount)*examineOrTaskGrade/100;
				homeWorkDao.updateTaskCount(studentId, studentSubjectPo.getOpenId(),taskCount,taskGrade);
			}else{
				Integer examineCount = homeWorkDao.getfinishCount(pageBean);
				OpenCoursePo openCoursePo = homeWorkDao.getOpenCourseInfo(studentSubjectPo.getOpenId());
				Float examineOrTaskGrade = homeWorkDao.getExamineOrTaskGrade(studentId, studentSubjectPo.getOpenId(),1);
				Integer totalExamineCount = openCoursePo.getExamineCount();
				Integer examinPercent = openCoursePo.getExaminPercent();
				float examinGrade=(float)examinPercent*(examineCount/totalExamineCount)*examineOrTaskGrade/100;
				homeWorkDao.updateExamineCount(studentId, studentSubjectPo.getOpenId(),examineCount,examinGrade);
			}
			
		}
		catch(Exception e){
			e.printStackTrace();
           return CommonUtil.FLAG_FAILD;
       }
		
       return CommonUtil.FLAG_SUCESS;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
	
	
	
	

}
