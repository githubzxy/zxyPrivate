package com.yz.center.dao.paper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yz.center.model.po.course.CourseTypePo;
import com.yz.center.model.po.course.OpenCoursePo;
import com.yz.center.model.po.paper.PaperPo;
import com.yz.center.model.po.paper.SubjectPo;
import com.yz.center.model.po.task.TaskPo;
import com.yz.center.model.po.video.VideoPo;
import com.yz.center.model.vo.paper.PaperCoursePage;
import com.yz.center.model.vo.paper.PaperVo;
import com.yz.center.model.vo.paper.subjectAndpaperVo;
import com.yz.center.util.common.PageBean;


@Repository
public interface PaperDao {
 public List<PaperCoursePage> getCourseList(PageBean pageBean);
 public Integer countItems(PageBean pageBean);
 public List<subjectAndpaperVo> getVideoAndpaperNum(PageBean pageBean);
 public Integer countVideos(PageBean pageBean);
 public Integer getcountBYopenIdANDsubjectType(@Param("courseId") Integer courseId,@Param("subjectTypeId") Integer subjectTypeId,@Param("schoolId") Integer schoolId,@Param("videoId") Integer videoId,@Param("functionId") Integer functionId);
 public List<SubjectPo> getsubjectBYopenIdANDsubjectType(@Param("courseId") Integer courseId,@Param("subjectTypeId") Integer subjectTypeId,@Param("schoolId") Integer schoolId,@Param("videoId") Integer videoId,@Param("num") Integer num,@Param("functionId") Integer functionId);
 public Integer createPaper(PaperPo paperPo);
 public Integer getTeacherId(Integer courseId);
 /*取得试卷列表  开始*/
 public List<PaperPo> getPaperById(PageBean pageBean);//获取试卷
 public Integer getPaperCounts(PageBean pageBean);//获取试卷数量
 /*取得试卷列表  结束*/
 public void testAdd(TaskPo taskPo);//新建考试
 public List<CourseTypePo> getCourseType(Integer schoolId);
 public List<OpenCoursePo> getOpenCourse(@Param("courseTypeId") Integer courseTypeId,@Param("schoolId") Integer schoolId);
 public List<VideoPo> getVideos(@Param("openId") Integer openId,@Param("schoolId") Integer schoolId);
 public List<PaperVo> getPaper(PageBean pageBean);
 public Integer getPaperCount(PageBean pageBean);
 public Integer delete(Integer paperId);
 public List<subjectAndpaperVo> getVideoAndsubjectNum(PageBean pageBean);
 public Integer getcountVideos(PageBean pageBean);
}
