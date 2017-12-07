
/**    
* @Title: StatisticsServiceImpl.java
* @Package com.yz.center.service.impl.statistics
* Description: TODO
* @author: 
* @date: 2017年1月4日 上午11:45:06 
* @version V1.0 
*   
*/  

package com.yz.center.service.impl.statistics;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.aspectj.weaver.ast.And;
import org.springframework.stereotype.Service;

import com.yz.center.dao.statistics.CourseStatisticsDao;
import com.yz.center.dao.statistics.DiscussStatisticsDao;
import com.yz.center.dao.statistics.HomeWorkStatiticsDao;
import com.yz.center.dao.statistics.StudentSatiticsDao;
import com.yz.center.dao.statistics.VideoStatisticsDao;
import com.yz.center.model.form.TestStatisticsCheckForm;
import com.yz.center.model.form.statitics.StudentCourseStatitics;
import com.yz.center.model.po.course.OpenCoursePo;
import com.yz.center.model.po.video.VideoPo;
import com.yz.center.model.vo.course.OpenCourseVo2;
import com.yz.center.model.vo.statistics.DiscussThemeVo;
import com.yz.center.model.vo.statistics.StudentStatisticsVo;
import com.yz.center.service.iface.statistics.StatisticsService;
import com.yz.center.util.common.PageBean;

/**  
* Description: TODO
* @author Administrator  
* @date: 2017年1月4日 上午11:45:06 
* @version V1.0   
*/
@Service
public class StatisticsServiceImpl implements StatisticsService{
	
	@Resource
	private CourseStatisticsDao statisticsDao;

	@Resource 
	private VideoStatisticsDao videoStatisticsDao;
	
	@Resource
	private DiscussStatisticsDao discussStatisticsDao;
	
	@Resource
	private StudentSatiticsDao studentStatiticsDao;
	
	@Resource
	private HomeWorkStatiticsDao homeWorkStatiticsDao;
	
	@Override
	public PageBean getVideosByCourse(PageBean pageBean) {
		Integer items=videoStatisticsDao.selectVideosCountByCourse(pageBean);
		pageBean.setTotalPage(items);                                                                                                                                                                                                   
		List<VideoPo> videos=videoStatisticsDao.getVideosByCourse(pageBean);
		Integer openId=pageBean.getCourseId();
		for(VideoPo video:videos){
			video.setWatchNumber(videoStatisticsDao.getWatchNumber(video.getVideoId(),openId));
		}
		pageBean.setList(videos);
		return pageBean;
	}

	@Override
	public List<OpenCoursePo> getCourseBySchool(Integer schoolId) {
		return videoStatisticsDao.getCourseBySchool(schoolId);
	}

	@Override
	public PageBean getWatchStudentByVideo(PageBean pageBean) {
		Integer items=videoStatisticsDao.getWatchStudentCountByVideo(pageBean);
		pageBean.setTotalPage(items); 
		List<StudentStatisticsVo> list = videoStatisticsDao.getWatchStudentByVideo(pageBean);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public List<OpenCoursePo> getOpenCourseBySchool(Integer schoolId) {
		return discussStatisticsDao.getOpenCourseBySchool(schoolId);
	}

	@Override
	public PageBean getDiscussTheme(PageBean pageBean,String name,String number) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("number", number);
		map.put("name", name);
		pageBean.params = map;
		Integer items=discussStatisticsDao.getDiscussThemeCount(pageBean);
		pageBean.setTotalPage(items);                                                                                                                                                                                             
		List<DiscussThemeVo> themes=discussStatisticsDao.getDiscussTheme(pageBean);
		for(DiscussThemeVo discussThemeVo:themes){
			discussThemeVo.setReplyNumber(discussStatisticsDao.getDiscussReplyNumber(discussThemeVo.getThemeId()));
		}
		pageBean.setList(themes);
		return pageBean;
	}
	
	@Override
	public PageBean getCourseStatistics(PageBean pageBean, String courseName, Integer isEnd) {
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("courseName", courseName);
		map.put("isEnd", isEnd);
		pageBean.params = map;
		
		Integer count = statisticsDao.selectPageCount(pageBean);
		pageBean.setTotalPage(count);
		List<OpenCourseVo2> openCourseVo2s = statisticsDao.selectCourseStatistics(pageBean);
		for(OpenCourseVo2 openCourseVo2 :openCourseVo2s){
			//查询课程的选课人数
			Integer studentCount =  statisticsDao.selectStudentCountByopenId(openCourseVo2.getOpenId());
			openCourseVo2.setSelectedStudentTotal(studentCount);
			//查询课程的考试人数
			Integer examPeopleCount = statisticsDao.selectexamPeopleCount(openCourseVo2.getOpenId());
			if (examPeopleCount != null) {
				openCourseVo2.setExamPeopleTotal(examPeopleCount);
			}else{
				openCourseVo2.setExamPeopleTotal(0);
			}
			
			//查询课程的视频点击量
			List<Integer> videoCount = statisticsDao.selectvideoCount(openCourseVo2.getOpenId());	
			Integer videoCounts = 0;
			for(int i = 0;i<videoCount.size();i++){
				videoCounts+=videoCount.get(i);
			}
			openCourseVo2.setVideohits(videoCounts);
			//查询课程的作业提交数
			List<Integer>  taskCount = statisticsDao.selecttaskCount(openCourseVo2.getOpenId());
			Integer taskCounts = 0;
			for(int i = 0;i<taskCount.size();i++){
				taskCounts+=taskCount.get(i);
			}
			openCourseVo2.setTaskhits(taskCounts);
			//查询课程的kaoshi提交次数
			Integer examCount = statisticsDao.selectexamCount(openCourseVo2.getOpenId());
			openCourseVo2.setExaminehits(examCount);
			//查询课程的讨论次数
			List<Integer>  discussCount  = statisticsDao.selectdiscussCount(openCourseVo2.getOpenId());
			Integer discussCounts=0;
			for(int i = 0;i<discussCount.size();i++){
				discussCounts+=discussCount.get(i);
			}
			openCourseVo2.setDiscusshits(discussCounts);
			//查询通过人数
			Integer passPeople = statisticsDao.selectpassPeople(openCourseVo2.getOpenId());
			openCourseVo2.setPassPeople(passPeople);
		}
		pageBean.setList(openCourseVo2s);
		return pageBean;
	}

	@Override
	public PageBean getStudentOfCourseStatistics(PageBean pageBean,StudentCourseStatitics studentCourseStatitics) {
		
		Integer videoTotalCount = studentStatiticsDao.findVideoTotalCount(studentCourseStatitics.getOpenId());
		
		if(studentCourseStatitics.getMinMyvideoPercent() != null){
			Integer videoMin = Math.round(videoTotalCount*studentCourseStatitics.getMinMyvideoPercent()/100);
			System.out.println("videoMin = "+videoMin);
			studentCourseStatitics.setMinvideoCount(videoMin);
		}
		if(studentCourseStatitics.getMaxMyvideoPercent() != null){
			Integer videoMax = Math.round(videoTotalCount*studentCourseStatitics.getMaxMyvideoPercent()/100);
			studentCourseStatitics.setMaxvideoCount(videoMax);
			System.out.println("videoMax = "+videoMax);
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("studentCourse", studentCourseStatitics);
		pageBean.params = map;
		Integer count = studentStatiticsDao.findPageCount(pageBean);
		pageBean.setTotalPage(count);
		List<StudentCourseStatitics> StudentCourseStatiticses = studentStatiticsDao.selectStudentOfCourseStatistics(pageBean);
		/*//查询出exameTotalScore
		List<Integer> allExameScore = studentStatiticsDao.findExameTotalScore(studentCourseStatitics.getOpenId()); 
		
		List<Integer> allpaperTotalScore =studentStatiticsDao.findPaperTotalScore(studentCourseStatitics.getOpenId());*/
		for(StudentCourseStatitics studentCourse:StudentCourseStatiticses){
			float myvideoPercent = 0;
			if (studentCourse.getVideoCount()!=null&&studentCourse.getVideoCount()!=0
				&&studentCourse.getOldVideoCount()!=null&&studentCourse.getOldVideoCount()!=0) {
				if (studentCourse.getVideoCount()>studentCourse.getOldVideoCount()) {
					myvideoPercent = 100.00f;
				}else {
					myvideoPercent = studentCourse.getVideoCount()/studentCourse.getOldVideoCount()*100.00f;
				}
				
			}
			
			float myexamePercent = 0;
			if (studentCourse.getExamineCount()!=null&&studentCourse.getExamineCount()!=0
					&&studentCourse.getOldExamineCount()!=null&&studentCourse.getOldExamineCount()!=0) {
					if (studentCourse.getExamineCount()>studentCourse.getOldExamineCount()) {
						myexamePercent = 100.00f;
					}else {
						myexamePercent = studentCourse.getExamineCount()/studentCourse.getOldExamineCount()*100.00f;
					}
					
			}	
			float myTaskPercent = 0;
			if (studentCourse.getTaskCount()!=null&&studentCourse.getTaskCount()!=0
					&&studentCourse.getOldTaskCount()!=null&&studentCourse.getOldTaskCount()!=0) {
					if (studentCourse.getTaskCount()>studentCourse.getOldTaskCount()) {
						myTaskPercent = 100.00f;
					}else {
						myTaskPercent = studentCourse.getTaskCount()/studentCourse.getOldTaskCount()*100.00f;
					}
					
			}			
			float mydiscussPercent = 0;
			if (studentCourse.getDiscussCount()!=null&&studentCourse.getDiscussCount()!=0
					&&studentCourse.getOldDiscussCount()!=null&&studentCourse.getOldDiscussCount()!=0) {
					if (studentCourse.getDiscussCount()>studentCourse.getOldDiscussCount()) {
						mydiscussPercent = 100.00f;
					}else {
						mydiscussPercent = studentCourse.getDiscussCount()/studentCourse.getOldDiscussCount()*100.00f;
					}
					
			}
			
			studentCourse.setMyvideoPercent(myvideoPercent);
			studentCourse.setMyexamePercent(myexamePercent);
			studentCourse.setMyTaskPercent(myTaskPercent);
			studentCourse.setMydiscussPercent(mydiscussPercent);
		}
		pageBean.setList(StudentCourseStatiticses);
		return pageBean;
	}
	
	@Override
	public List<OpenCoursePo> getCourseName(Integer schoolId,Integer useType) {
		return homeWorkStatiticsDao.getCourseName(schoolId,useType);
	}
	
	@Override
	public PageBean getHwInfo(PageBean pageBean,Integer useType,Integer isExam) {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("isExam", isExam);
		map.put("useType", useType);
		pageBean.params = map;
		
		int count = homeWorkStatiticsDao.getHwStatisticsCount(pageBean);
		pageBean.setTotalPage(count);
		List<OpenCoursePo> hwInfo = homeWorkStatiticsDao.getHwInfo(pageBean);
		for(OpenCoursePo openCourse : hwInfo){
			Integer markCount = homeWorkStatiticsDao.getMarkCount(isExam,useType,pageBean.getSchoolId(),openCourse.getId());
			openCourse.setMarkCount(markCount);
			Integer submitCount = homeWorkStatiticsDao.getSubmitCount(isExam,useType,pageBean.getSchoolId(),openCourse.getId());
			openCourse.setSubmitCount(submitCount);
		}
		pageBean.setList(hwInfo);
		return pageBean;
	}
	
	@Override
	public PageBean testStatisticsCheck(PageBean pageBean,String name,String number,Integer classId,Integer gradeId,Integer Id,Integer useType) {
		Map<String , Object> map = new HashMap<String,Object>();
		map.put("name", name);
		map.put("number", number);
		map.put("classId", classId);
		map.put("gradeId", gradeId);
		map.put("useType", useType);
		map.put("Id", Id);
		pageBean.params = map;
		int count = homeWorkStatiticsDao.getTestORHomeworkStatisticsCheckCount(pageBean);
		List<TestStatisticsCheckForm> list = homeWorkStatiticsDao.testStatisticsCheck(pageBean);
		pageBean.setTotalPage(count);
		pageBean.setList(list);
		return pageBean;
	}

	
	/** 
	* Title: getCourseStatisticschar
	* Description: 
	* @see com.yz.center.service.iface.statistics.StatisticsService#getCourseStatisticschar(java.lang.Integer)  
	*/
	
	@Override
	public OpenCourseVo2 getCourseStatisticschar(Integer openId) {
		OpenCourseVo2 openCourseVo2 = new OpenCourseVo2();
		//查询课程的选课人数
		Integer studentCount =  statisticsDao.selectStudentCountByopenId(openId);
		openCourseVo2.setSelectedStudentTotal(studentCount);
		//查询课程的考试人数
		Integer examPeopleCount = statisticsDao.selectexamPeopleCount(openId);
		if (examPeopleCount != null) {
			openCourseVo2.setExamPeopleTotal(examPeopleCount);
		}else{
			openCourseVo2.setExamPeopleTotal(0);
		}
		
		//查询课程的视频点击量
		List<Integer> videoCount = statisticsDao.selectvideoCount(openId);	
		Integer videoCounts = 0;
		for(int i = 0;i<videoCount.size();i++){
			videoCounts+=videoCount.get(i);
		}
		openCourseVo2.setVideohits(videoCounts);
		//查询课程的作业提交数
		List<Integer>  taskCount = statisticsDao.selecttaskCount(openId);
		Integer taskCounts = 0;
		for(int i = 0;i<taskCount.size();i++){
			taskCounts+=taskCount.get(i);
		}
		openCourseVo2.setTaskhits(taskCounts);
		//查询课程的kaoshi提交次数
		Integer examCount = statisticsDao.selectexamCount(openId);
		openCourseVo2.setExaminehits(examCount);
		//查询课程的讨论次数
		List<Integer>  discussCount  = statisticsDao.selectdiscussCount(openId);
		Integer discussCounts=0;
		for(int i = 0;i<discussCount.size();i++){
			discussCounts+=discussCount.get(i);
		}
		openCourseVo2.setDiscusshits(discussCounts);
		//查询通过人数
		Integer passPeople = statisticsDao.selectpassPeople(openId);
		openCourseVo2.setPassPeople(passPeople);
		return openCourseVo2;
	}
	
}
