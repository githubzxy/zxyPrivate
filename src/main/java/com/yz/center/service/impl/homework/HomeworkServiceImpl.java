
/**    
* @Title: HomeWorkServiceImpl.java
* @Package com.yz.center.service.impl.homeWork
* Description: TODO
* @author: 
* @date: 2016年12月16日 下午3:28:35 
* @version V1.0 
*   
*/  

package com.yz.center.service.impl.homework;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yz.center.dao.course.OpenCourseDao;
import com.yz.center.dao.homeWork.HomeWorkDao;
import com.yz.center.dao.student.StudentDao;
import com.yz.center.model.form.FindHomeworkForm;
import com.yz.center.model.form.HomeWorkForm;
import com.yz.center.model.form.TestInfoForm;
import com.yz.center.model.po.course.OpenCoursePo;
import com.yz.center.model.po.paper.PaperPo;
import com.yz.center.model.po.paper.StudentPaperPo;
import com.yz.center.model.po.paper.StudentSubjectPo;
import com.yz.center.model.po.paper.SubjectPo;
import com.yz.center.model.po.task.TaskPo;
import com.yz.center.service.iface.homework.HomeworkService;
import com.yz.center.util.CommonUtil;
import com.yz.center.util.CommonUtil2;
import com.yz.center.util.Static;
import com.yz.center.util.common.PageBean;

/**  
* Description: TODO
* @author Administrator  
* @date: 2016年12月16日 下午3:28:35 
* @version V1.0   
*/
@Service
public class HomeworkServiceImpl implements HomeworkService{
	@Resource
	private HomeWorkDao homeWorkDao;
	
	@Resource
	private StudentDao studentDao;
	@Resource
	private OpenCourseDao openCourseDao;
	

	

	




	

	@Override
	public PageBean getHomework(PageBean pageBean,Integer studentId) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("studentId", studentId);
		map.put("isExam", 0);
		pageBean.params = map;
		pageBean.setPageSize(5);
		List<HomeWorkForm> list = homeWorkDao.getHomework(pageBean);
		Integer totalPage = homeWorkDao.getHomeworkCount(pageBean);
//		for(HomeWorkForm hw:list){
//			Integer openCourseId = hw.getOpenCourseId();
//			pageBean.setOpenId(openCourseId);
//			Integer totalCount = homeWorkDao.getTotalCount(pageBean);
//			Integer finishCount = homeWorkDao.getfinishCount(pageBean);//取得完成的套数
//			hw.setTotalCount(totalCount);
//			hw.setFinishCount(finishCount);
//			
//		}
		pageBean.setList(list);
		pageBean.setTotalPage(totalPage);
		return pageBean;
	}


	@Override
	public Integer getHomeworkCount(PageBean pageBean) {
		// TODO Auto-generated method stub
		return homeWorkDao.getHomeworkCount(pageBean);
	}


	@Override
	public PageBean findHomework(PageBean pageBean,Integer studentId) {
		// TODO Auto-generated method stub
		List<FindHomeworkForm> findHomeworkForms =  homeWorkDao.findHomework(pageBean);
		for(FindHomeworkForm findHomeworkForm:findHomeworkForms){
			//处理时间
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String dateStr =  simpleDateFormat.format(findHomeworkForm.getStudyEndDate());
			findHomeworkForm.setStudyEndDateStr(dateStr);
			FindHomeworkForm findHomeworkForm2 = homeWorkDao.isSumit(studentId, findHomeworkForm.getId());			
			if (findHomeworkForm2!=null) {
				findHomeworkForm.setPaperId(findHomeworkForm2.getPaperId());
				findHomeworkForm.setIsSubmit(findHomeworkForm2.getIsSubmit());
				findHomeworkForm.setStudentPaperId(findHomeworkForm2.getStudentPaperId());
			}
			
		}
		Integer totalPage = homeWorkDao.getCountByopenCourseId(pageBean);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(findHomeworkForms);
		return pageBean;
	}

    
	@Override
	public Integer getHomeworkCountOfPersonal(PageBean pageBean) {
		// TODO Auto-generated method stub
		return homeWorkDao.getHomeworkCountOfPersonal(pageBean);
	}


	@Override
	public Integer getCount(Integer studentId,Integer openCourseId) {
		// TODO Auto-generated method stub
		return homeWorkDao.getCount(studentId, openCourseId);
	}



	@Override
	public List<SubjectPo> getHwTest(String subjectIds) {
		// TODO Auto-generated method stub
		return homeWorkDao.getHwTest(subjectIds,1);
	}

	@Override
	public PaperPo getPaperByPaperId(Integer paperId,Integer studentId) {
		// TODO Auto-generated method stub
		return homeWorkDao.getPaperByPaperId(paperId,studentId);
	}

	@Override
	public SubjectPo getsubjectTypeCount(String subjectIds) {
		// TODO Auto-generated method stub
		return homeWorkDao.getsubjectTypeCount(subjectIds);
	}

	@Override
	public int hwTestAdd(StudentSubjectPo studentSubjectPo) {
		// TODO Auto-generated method stub
		int studentId=studentSubjectPo.getStudentId();
		String subjectIdString = studentSubjectPo.getSubjectIds();//得到题目
		String stuAnswerString =studentSubjectPo.getStuAnswers();//得到学生答案
		List<SubjectPo> hwTest = homeWorkDao.getHwTest(subjectIdString,1);
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
		for (int i = 0; i < hwTest.size(); i++) {
			for (String key : map.keySet()) {  
				String value = map.get(key);  
				String trueOption=hwTest.get(i).getTrueOption();
				Integer subjectTypeId=hwTest.get(i).getSubjectTypeId();
				Integer subjectId=hwTest.get(i).getSubjectId();
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
				homeWorkDao.hwTestAdd(studentSubjectPo1);
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
				homeWorkDao.hwTestAdd(studentSubjectPo2);
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
				homeWorkDao.hwTestAdd(studentSubjectPo3);
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
				float taskGrade=0;
				if(taskPercent!=null&&taskCount!=null&&totalTaskCount!=null&&examineOrTaskGrade!=null){
					taskGrade=(float)taskPercent*(taskCount/totalTaskCount)*examineOrTaskGrade/100;
			}
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

	@Override
	public void updateStudentPaperByIsSubmit(StudentPaperPo studentPaperPo) {
		// TODO Auto-generated method stub
		homeWorkDao.updateStudentPaperByIsSubmit(studentPaperPo);
		
	}



	@Override
	public StudentSubjectPo getSubjectById(Integer studentPaperId,Integer subjectTypeId) {
		// TODO Auto-generated method stub
		return homeWorkDao.getSubjectById(studentPaperId,subjectTypeId);
	}



	@Override
	public StudentPaperPo getSubjectSubDateById(Integer studentPaperId) {
		// TODO Auto-generated method stub
		return homeWorkDao.getSubjectSubDateById(studentPaperId);
	}



	@Override
	public List<OpenCoursePo> getCourseName(Integer schoolId) {
		// TODO Auto-generated method stub
		return homeWorkDao.getCourseName(schoolId);
	}



	@Override
	public List<OpenCoursePo> getHwInfo(Integer pageSize, Integer begin, Integer openId, Integer schoolId) {
		// TODO Auto-generated method stub
		return homeWorkDao.getHwInfo(pageSize, begin, openId, schoolId);
	}



	@Override
	public Integer getHwStatisticsCount(Integer schoolId) {
		// TODO Auto-generated method stub
		return homeWorkDao.getHwStatisticsCount(schoolId);
	}



	
	
	@Override
	public List<TestInfoForm> getCourseNameOfHw(Integer schoolId) {
		// TODO Auto-generated method stub
		return homeWorkDao.getCourseNameOfHw(schoolId);
	}



	@Override
	public List<TestInfoForm> getVideoNameOfHw(Integer schoolId) {
		// TODO Auto-generated method stub
		return homeWorkDao.getVideoNameOfHw(schoolId);
	}



	@Override
	public PageBean getHomeworkInfo(PageBean pageBean, String courseName,String videoName, String title) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("courseName", courseName);
		map.put("videoName", videoName);
		map.put("title", title);
		pageBean.params = map;
		List<TestInfoForm> homeworkInfo = homeWorkDao.getHomeworkInfo(pageBean);
		Integer countOfHomework = homeWorkDao.getCountOfHomework(pageBean);
		pageBean.setList(homeworkInfo);
		pageBean.setTotalPage(countOfHomework);
		return pageBean;
	}

	@Override
	public int homeworkDelete(Integer Id,Integer openId) {
		// TODO Auto-generated method stub
		try{
			homeWorkDao.homeworkDelete(Id);
			openCourseDao.updateTaskCountOfDelete(openId);
			
			
		}
		catch(Exception e){
			e.printStackTrace();
           return CommonUtil.FLAG_FAILD;
       }
       return CommonUtil.FLAG_SUCESS;
	}
	
	
	
	@Override
	public int homeworkAdd(TaskPo taskPo) {
		// TODO Auto-generated method stub
		taskPo.setCreateDate(new Date());
		taskPo.setUseType(1);//用于作业
		try{
			openCourseDao.updateTaskCount(taskPo.getOpenCourseId());
			homeWorkDao.homeworkAdd(taskPo);
		}
		catch(Exception e){
			e.printStackTrace();
           return CommonUtil.FLAG_FAILD;
       }
       return CommonUtil.FLAG_SUCESS;
	}
	
	
	@Override
	public PageBean getPaperByPaperIdsOfHw(PageBean pageBean, String title, String paperIds) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("title", title);
		map.put("paperIds", paperIds);
		pageBean.params = map;
		Integer paperCount = homeWorkDao.getPaperCountByPaperIdsOfHw(pageBean);
		pageBean.setTotalPage(paperCount);
		List<TestInfoForm> papers = homeWorkDao.getPaperByPaperIdsOfHw(pageBean);
		pageBean.setList(papers);
		return pageBean;
	}
	

}
