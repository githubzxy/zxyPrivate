package com.yz.center.service.iface.paper;

import java.util.List;
import java.util.Map;
import com.yz.center.model.po.course.CourseTypePo;
import com.yz.center.model.po.course.OpenCoursePo;
import com.yz.center.model.po.video.VideoPo;
import com.yz.center.model.vo.paper.PaperCoursePage;
import com.yz.center.model.vo.paper.PaperForm;
import com.yz.center.util.common.PageBean;
import com.yz.center.model.vo.paper.PaperVo;
import com.yz.center.model.vo.paper.subjectAndpaperVo;

public interface PaperService {
	public PageBean getCourseList(PageBean pageBean);//取得课程列表
	public PageBean getcoursesOftest(PageBean pageBean);//取得考试下课程列表 
	public PageBean getcoursesOfhomework(PageBean pageBean);//取得作业下课程列表 
	public PageBean getVideoList(PageBean pageBean);//取得视频列表
	public Integer getcountBYopenIdANDsubjectType(Integer courseId,Integer subjectTypeId,Integer schoolId,Integer videoId,Integer functionId);
    public String subjectIds(PaperForm paperForm,Integer schoolId,Integer functionId);
    public Integer addpapers(PaperForm paperForm,Integer schoolId) throws Exception;
    public PageBean getPaperByIdOfTest(PageBean pageBean);
	public PageBean getPaperByIdOfHomework(PageBean pageBean);
    public List<CourseTypePo> getCourseType(Integer schoolId);
    public List<OpenCoursePo> getOpenCourse(Integer courseTypeId,Integer schoolId);
    public List<VideoPo> getVideos(Integer openId,Integer schoolId);
    public PageBean getPaper(PageBean pageBean);
    public Integer delete(Integer paperId);
    public void deleteAll(Integer paperIds[]) throws Exception;
    public PageBean getVideoAndsubjectNum(PageBean pageBean);
   
}