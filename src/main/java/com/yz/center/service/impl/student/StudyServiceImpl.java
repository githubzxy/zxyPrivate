
/**    
* @Title: StudyServiceImpl.java
* @Package com.yz.center.service.impl.student
* Description: TODO
* @author: 
* @date: 2016年12月16日 下午2:47:05 
* @version V1.0 
*   
*/  

package com.yz.center.service.impl.student;

import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;


import com.yz.center.dao.student.StudyDao;
import com.yz.center.model.po.course.CourseChapterPo;
import com.yz.center.model.po.paper.StudentPaperPo;
import com.yz.center.model.po.student.PlayRecordPo;
import com.yz.center.model.po.task.TaskPo;
import com.yz.center.model.po.video.VideoPo;
import com.yz.center.model.vo.frontPage.OpenCourseChapterNameVo;
import com.yz.center.service.iface.student.StudyService;




@Service
public class StudyServiceImpl implements StudyService {
	 @Resource
	 private StudyDao studyDao;
	/** 
	* Title: addOrgetPlayRecordByStudentId
	* Description: 根据学生查找播放记录，如果没有，则新建一条记录，返回该学生的当前记录
	 * @throws Exception 
	* @see com.yz.center.service.iface.student.StudyService#addOrgetPlayRecordByStudentId(java.lang.Integer)  
	*/
	@Override
	public PlayRecordPo addOrgetPlayRecordByStudentId(Integer studentId,Integer openId) throws Exception {
	   PlayRecordPo recordPo=studyDao.getPlayRecordByStudentId(studentId,openId);
	   if(recordPo!=null){
		   studyDao.addClickNum(openId);
		  return recordPo; 
	   }else{
		   PlayRecordPo record=new PlayRecordPo();
		   record.setIsover(0);
		   record.setStartDate(new Date());
		   record.setLastDate(new Date());
		   record.setSecond(0);
		   record.setSelectId(openId);
		   record.setState(1);
		   record.setStudentId(studentId);
		   List<VideoPo> videos=studyDao.getvideosByOpenId(openId,0);
		   record.setVideoId(videos.get(0).getVideoId());
		   Integer flag=studyDao.addPlayRecord(record);
		   studyDao.addClickNum(openId);
		   if(flag==0){
			   throw new Exception();
		   }
		  return record; 
	   }
		
	}
	
	
	@Override
	public VideoPo getVideoByRecord(PlayRecordPo recordPo) {
		return studyDao.getvideoByPlayRecord(recordPo.getRecordId());
	}

	


	
	/** 
	* Title: updatePlayRecord
	* Description:修改某个同学在某个课程的观看记录,sign=1：修改startDate；sign=0：只修改lastDate，不修改 startDate（判断Controller哪个方法调用）
	 * @throws Exception 
	* @see com.yz.center.service.iface.student.StudyService#updatePlayRecord(java.lang.Integer, java.lang.Integer, java.lang.Integer, java.lang.Integer)  
	*/
	
	@Override
	public void updatePlayRecord(Integer studentId, Integer openId, Integer videoId, Integer second,Integer isover,Integer sign) throws Exception {
	       PlayRecordPo record=new PlayRecordPo();
	       record.setStartDate(new Date());
	       record.setSecond(second);
	       System.out.println("ajsahd"+second);
	       record.setLastDate(new Date());
	       record.setSelectId(openId);
	       record.setStudentId(studentId);
	       record.setVideoId(videoId);
	       record.setIsover(isover);
	       record.setSign(sign);
	       Integer flag=studyDao.updatePlayRecord(record);
	       if(flag<1){
	    	   throw new Exception();
	       }
	}


	
	/** 
	* Title: getStudentPaperInfo
	* Description: 查找某个学生学习的课程下的视频有无作业：若有，获取；若无就随机生成
	* @see com.yz.center.service.iface.student.StudyService#getTaskPaper(java.lang.Integer, java.lang.Integer, java.lang.Integer,java.lang.Integer,java.lang.Integer,java.lang.Integer)  
	*/
	
	@Override
	public StudentPaperPo getStudentPaperInfo(Integer studentId, Integer openId, Integer videoId,Integer paperId,Integer taskId,Integer schoolId) {
		StudentPaperPo paperPo=studyDao.getStudentPaperInfo(studentId, openId, videoId);
		if(paperPo!=null){
			return paperPo;
		}else{
			StudentPaperPo paper=new StudentPaperPo();
			paper.setPaperId(paperId);
			paper.setId(taskId);
			paper.setStudent_id(studentId);
			paper.setSchoolId(schoolId);
			paper.setOpenCourseId(openId);
			paper.setVideoId(videoId);
			paper.setIsExam(0);
			paper.setIsSubmit(0);
			paper.setIsMarking(0);
			paper.setCreateDate(new Date());
			studyDao.addStudentPaperInfo(paper);
			return paper;
		}
		
	}
	
	@Override
	public List<VideoPo> getvideosByOpenId(Integer openId, Integer videoId) {
	
		return studyDao.getvideosByOpenId(openId, videoId);
	}


	
	/** 
	* Title: getOpenCourseName
	* Description: 
	* @see com.yz.center.service.iface.student.StudyService#getOpenCourseName(java.lang.Integer)  
	*/
	
	@Override
	public OpenCourseChapterNameVo getOpenCourseName(Integer openId) {
	
		return studyDao.getOpenCourseName(openId);
	}


	
	/** 
	* Title: getIsUnlockVideoOrNot
	* Description:判断当前播的video是否解锁，如果是解了锁的：是最后一条解锁的video则读出时间，超过时间就修改记录，没超过则不修改；不是最后一条则不修改记录。如果当前没有解锁则修改记录
	* @see com.yz.center.service.iface.student.StudyService#getIsUnlockVideoOrNot(java.lang.Integer, java.lang.Integer,java.lang.Integer)  
	*/
	@Override
	public Integer getIsUnlockVideoOrNot(Integer openId, Integer unlockNum,Integer videoId) {

		List<VideoPo> unlockVideos=studyDao.getUnlockVideoIds(openId, unlockNum-1);
	   Integer flag=0;
		for(VideoPo video:unlockVideos){
			Integer unlockVideoId=video.getVideoId();
		   if(unlockVideoId==videoId){
			   flag=1;
			   break;
		   }
	   }
		return flag;
	}


	
	/** 
	* Title: getVideoByVideoId
	* Description: 
	* @see com.yz.center.service.iface.student.StudyService#getVideoByVideoId(java.lang.Integer)  
	*/
	
	@Override
	public VideoPo getVideoByVideoId(Integer videoId) {
		return studyDao.getVideoByVideoId(videoId);
	}


	
	/** 
	* Title: getExamineTaskPaper
	* Description: 通过openId和已看完的该视频videoId查找是否有作业
	* @see com.yz.center.service.iface.student.StudyService#getExamineTaskPaper(java.lang.Integer, java.lang.Integer)  
	*/
	
	@Override
	public TaskPo getExamineTaskPaper(Integer openId, Integer videoId,Integer schoolId) {
		return studyDao.getExamineTaskPaper(openId, videoId,schoolId);
	}


	@Override
	public int updateViewVideoCount(Integer studentId, Integer openId) {
		int flag = studyDao.updateViewVideoCount(openId, studentId);
		return flag;
	}


	@Override
	public void addStudentPaperOfTest(Integer openId,Integer schoolId,Integer studentId) {
		// TODO Auto-generated method stub
		TaskPo task = studyDao.getExamineTaskPaperOfTest(openId, schoolId);
		if(task!=null){
			Integer id = task.getId();
			Integer stu_examine_count = studyDao.getStuPaperInfoById(id);
			if(stu_examine_count==0){
				 String[] paperIds=task.getPaperIds().split(",");
				  Random rand = new Random();
				  Integer num = rand.nextInt(paperIds.length);
				  int paperId = Integer.parseInt(paperIds[num]);
				  StudentPaperPo paper=new StudentPaperPo();
					paper.setPaperId(paperId);
					paper.setId(task.getId());
					paper.setStudent_id(studentId);
					paper.setSchoolId(schoolId);
					paper.setOpenCourseId(openId);
					paper.setVideoId(null);
					paper.setIsExam(1);
					paper.setIsSubmit(0);
					paper.setIsMarking(0);
					paper.setCreateDate(new Date());
					studyDao.addStudentPaperInfo(paper);
				
			}
		}
		
		
		
	}


	
	


	

	
	

}
