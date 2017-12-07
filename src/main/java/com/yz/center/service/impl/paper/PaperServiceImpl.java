package com.yz.center.service.impl.paper;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.yz.center.dao.paper.PaperDao;
import com.yz.center.model.po.course.CourseTypePo;
import com.yz.center.model.po.course.OpenCoursePo;
import com.yz.center.model.po.paper.PaperPo;
import com.yz.center.model.po.paper.SubjectPo;
import com.yz.center.model.po.video.VideoPo;
import com.yz.center.model.vo.paper.PaperCoursePage;
import com.yz.center.model.vo.paper.PaperForm;
import com.yz.center.model.vo.paper.PaperVo;
import com.yz.center.model.vo.paper.subjectAndpaperVo;
import com.yz.center.service.iface.paper.PaperService;
import com.yz.center.util.common.PageBean;
import com.yz.center.util.paper.subjectRandom;

@Service
public class PaperServiceImpl implements PaperService {
@Resource
  PaperDao paperDao;

@Override
public PageBean getCourseList(PageBean pageBean) {
	Integer countItems = paperDao.countItems(pageBean);
	pageBean.setTotalPage(countItems);
	System.out.println("总页数："+pageBean.getTotalCount());
	
	List<PaperCoursePage> courses=paperDao.getCourseList(pageBean);
	pageBean.setList(courses);
	return pageBean;
}

@Override
public PageBean getVideoList(PageBean pageBean) {
	Integer items=paperDao.countVideos(pageBean);
	pageBean.setTotalPage(items);
	List<subjectAndpaperVo> videos=paperDao.getVideoAndpaperNum(pageBean);
	pageBean.setList(videos);
	return pageBean;
}


@Override
public PageBean getcoursesOftest(PageBean pageBean) {
	Map<String,Object> map = new HashMap<String,Object>();
	map.put("useType", 2);//2考试
	pageBean.params = map;
	Integer countItems = paperDao.countItems(pageBean);
	pageBean.setTotalPage(countItems);
	List<PaperCoursePage> courses=paperDao.getCourseList(pageBean);
	pageBean.setList(courses);
	return pageBean;
}

@Override
public PageBean getcoursesOfhomework(PageBean pageBean) {
	Map<String,Object> map = new HashMap<String,Object>();
	map.put("useType", 1);//1作业
	pageBean.params = map;
	Integer countItems = paperDao.countItems(pageBean);
	pageBean.setTotalPage(countItems);
	List<PaperCoursePage> courses=paperDao.getCourseList(pageBean);
	pageBean.setList(courses);
	return pageBean;
}

@Override
public Integer getcountBYopenIdANDsubjectType(Integer courseId, Integer subjectTypeId, Integer schoolId,Integer videoId,Integer functionId) {
	Integer subjectTypecount=paperDao.getcountBYopenIdANDsubjectType(courseId, subjectTypeId, schoolId, videoId,functionId);
	return subjectTypecount;
}



@Override
public String subjectIds(PaperForm paperForm,Integer schoolId,Integer functionId) {
	Integer courseId=paperForm.getCourseId();
	Integer videoId=paperForm.getVideoId();
	List<SubjectPo> subjectsofSingle=paperDao.getsubjectBYopenIdANDsubjectType(courseId,1,schoolId,videoId,paperForm.getSingleSelectedNum(),functionId);
	List<SubjectPo> subjectsofJudge= paperDao.getsubjectBYopenIdANDsubjectType(courseId,2, schoolId, videoId, paperForm.getJudgeNum(),functionId);
	List<SubjectPo> subjectsofMulti=paperDao.getsubjectBYopenIdANDsubjectType(courseId,3, schoolId, videoId, paperForm.getMultiSelectedNum(),functionId);
	String subjectIds=subjectRandom.getPaper(subjectsofSingle, subjectsofJudge, subjectsofMulti);
	return subjectIds;
}

@Override
public Integer addpapers(PaperForm paperForm,Integer schoolId) throws Exception{
	Integer flag=1;
	for(int i=1;i<=paperForm.getPaperItems();i++){
		if(flag==0){
			throw new Exception();
		}
		Integer singleSco=paperForm.getSingleSelectedSco();
		Integer judgeSco=paperForm.getJudgeSco();
		Integer multiSco=paperForm.getMultiSelectedSco();
		Integer openId=paperForm.getOpenId();
		Integer videoId=paperForm.getVideoId();
		Integer courseId=paperForm.getCourseId();
		PaperPo paperPo=new PaperPo();
		paperPo.setAnySubjectScore(singleSco+","+judgeSco+","+multiSco);
		paperPo.setCreDt(new Date());
		paperPo.setFunctionId(paperForm.getFunctionId());
		paperPo.setOpenId(openId);
		paperPo.setSchoolId(schoolId);
		paperPo.setSort(1);
		paperPo.setState(1);
		paperPo.setStaDt(new Date());
		paperPo.setSubjectNum(paperForm.getSingleSelectedNum()+paperForm.getJudgeNum()+paperForm.getMultiSelectedNum());
		paperPo.setTitle(paperForm.getCourseName()+paperForm.getVideoName()+i);
		paperPo.setTotalScore(singleSco+judgeSco+multiSco);
		paperPo.setVideoId(videoId);
		paperPo.setTeacherId(paperForm.getTeacherId());
		paperPo.setShowSecond(paperForm.getShowSecond());
		paperPo.setSubjectIds(subjectIds(paperForm,schoolId,paperForm.getFunctionId()));
		
		flag=paperDao.createPaper(paperPo);
	}
	return flag;
}

@Override
public PageBean getPaperByIdOfHomework(PageBean pageBean) {
	// TODO Auto-generated method stub 
	int functionId=1;
	Map<String,Object> map = new HashMap<String,Object>();
	map.put("functionId", functionId);
	pageBean.params = map;
	Integer paperCount = paperDao.getPaperCounts(pageBean);
	pageBean.setTotalPage(paperCount);
	List<PaperPo> papers = paperDao.getPaperById(pageBean);
	pageBean.setList(papers);
	return pageBean;
}

/** 
* Title: getCourseType
* Description:根据schoolId获取全部课程类型 
* @see com.yz.center.service.iface.paper.PaperService#getCourseType(java.lang.Integer)  
*/

@Override
public List<CourseTypePo> getCourseType(Integer schoolId) {
	return paperDao.getCourseType(schoolId);
}
@Override
public PageBean getPaperByIdOfTest(PageBean pageBean) {
	// TODO Auto-generated method stub
	int functionId=2;
	Map<String,Object> map = new HashMap<String,Object>();
	map.put("functionId", functionId);
	pageBean.params = map;
	Integer paperCount = paperDao.getPaperCounts(pageBean);
	pageBean.setTotalPage(paperCount);
	List<PaperPo> papers = paperDao.getPaperById(pageBean);
	pageBean.setList(papers);
	return pageBean;
}




/** 
* Title: getOpenCourse
* Description:根据学校和课程类型获取所有的已开课的课程 
* @see com.yz.center.service.iface.paper.PaperService#getOpenCourse(java.lang.Integer, java.lang.Integer)  
*/

@Override
public List<OpenCoursePo> getOpenCourse(Integer courseTypeId, Integer schoolId) {
	return paperDao.getOpenCourse(courseTypeId, schoolId);
}


/** 
* Title: getVideos
* Description: 根据已开课程和学校获取视频
* @see com.yz.center.service.iface.paper.PaperService#getVideos(java.lang.Integer, java.lang.Integer)  
*/

@Override
public List<VideoPo> getVideos(Integer openId, Integer schoolId) {
	return paperDao.getVideos(openId, schoolId);
}


/** 
* Title: getPaper
* Description: 根据筛选条件分页获取试卷列表
* @see com.yz.center.service.iface.paper.PaperService#getPaper(com.yz.center.model.po.PageBean)  
*/
@Override
public PageBean getPaper(PageBean  pageBean) {
	Integer items=paperDao.getPaperCount(pageBean);
	pageBean.setTotalPage(items);                                                                                                                                                                                                    
	List<PaperVo> papers=paperDao.getPaper(pageBean);
	pageBean.setList(papers);
	return pageBean;
}



/** 
* Title: delete
* Description: 删除单条试卷数据
* @see com.yz.center.service.iface.paper.PaperService#delete(java.lang.Integer)  
*/

@Override
public Integer delete(Integer paperId) {
	return paperDao.delete(paperId);
}


public PaperDao getPaperDao() {
	return paperDao;
}

public void setPaperDao(PaperDao paperDao) {
	this.paperDao = paperDao;
}

/** 
* Title: deleteAll
* Description:删除多条试卷数据
 * @throws java.lang.Exception 
* @see com.yz.center.service.iface.paper.PaperService#deleteAll(java.lang.Integer[])  
*/

@Override
public void deleteAll(Integer[] paperIds) throws Exception{
	for (Integer id : paperIds) {
		if(paperDao.delete(id)<1){
			throw new Exception();
			
		}
	}
}


/** 
* Title: getVideoAndsubjectNum
* Description: 创建试卷获取视频和试卷数量
* @see com.yz.center.service.iface.paper.PaperService#getVideoAndsubjectNum(com.yz.center.util.common.PageBean)  
*/

@Override
public PageBean getVideoAndsubjectNum(PageBean pageBean) {
	Integer items=paperDao.getcountVideos(pageBean);
	System.out.println("heehi"+items);
	pageBean.setTotalPage(items);
	List<subjectAndpaperVo> videos=paperDao.getVideoAndsubjectNum(pageBean);
	System.out.println("是我是我"+videos);
	pageBean.setList(videos);
	return pageBean;
}





}

