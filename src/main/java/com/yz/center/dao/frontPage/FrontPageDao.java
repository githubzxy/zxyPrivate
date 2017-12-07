package com.yz.center.dao.frontPage;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.alibaba.fastjson.JSONArray;
import com.yz.center.model.po.PageBean;
import com.yz.center.model.po.comment.CommentPo;
import com.yz.center.model.po.course.CourseChapterPo;
import com.yz.center.model.po.course.CoursePo;
import com.yz.center.model.po.course.CourseTypePo;
import com.yz.center.model.po.video.VideoPo;
import com.yz.center.model.vo.frontPage.DownLoadSourceVo;
import com.yz.center.model.vo.frontPage.OpenCourseChapterNameVo;
import com.yz.center.model.vo.frontPage.VideoPlayVo;

@Repository
public interface FrontPageDao {
public List<CourseTypePo> getCourseType(@Param("schoolId") Integer schoolId,@Param("parentId") Integer parentId);
public List<CourseTypePo> getCourseParentId(Integer schoolId);
public List<CoursePo> getCourseByCourseTypeId(PageBean pageBean);
public List<CoursePo> getCourseCountByCourseTypeId(PageBean pageBean);//根据根类获取课程总数，因为有一对多关系
public List<CourseTypePo> getCourseTypeNolimit(@Param("schoolId") Integer schoolId,@Param("parentId") Integer parentId);
//根据parentId得到属于parentId下所有courseType下的所有课程
public List<CoursePo> getCourseByParentId(PageBean pageBean);
//根据parentId得到属于parentId下所有courseType下的所有课程的总数，因为有一对多关系
public List<CoursePo> getCourseCountByParentId(PageBean pageBean);
//根据courseId、chapterId取得所有的从chapterId开始往后的所有chapterIds下的videos
public List<VideoPlayVo> getVideosByChapterId(@Param("openId") Integer openId,@Param("chapterId") Integer chapterId,@Param("schoolId") Integer schoolId);
public JSONArray getVideosJsonByChapterId(@Param("openId") Integer openId,@Param("chapterId") Integer chapterId,@Param("schoolId") Integer schoolId);
//添加评论
public Integer addComment(CommentPo commentPo);
//评论展示页
public List<CommentPo> getCommentList(PageBean pageBean);
public Integer getCommentListCount(PageBean pageBean);
//获取某一个章节下的开课名称、课程类型和章节名称
public JSONArray getNamesByOpenIdAndChapterId(@Param("openId") Integer openId,@Param("chapterId") Integer chapterId);
public List<DownLoadSourceVo> getDownloadInfo(@Param("chapterId") Integer chapterId,@Param("schoolId") Integer schoolId);

public List<CourseChapterPo> getChaptersofSon(@Param("parentId") Integer parentId,@Param("chapterId") Integer chapterId);
public VideoPo getvideoByChapterId(Integer chapterId);

public OpenCourseChapterNameVo getOpenCourseName(Integer openId);


public List<CourseChapterPo> getChildrenChapters(@Param("parentId") Integer parentId,@Param("openId") Integer openId);
public List<VideoPlayVo> getVideosByChapters(@Param("parentId") Integer parentId,@Param("openId") Integer openId);
/**   
 * @Title: getVideosBy   
 * @Description:TODO  
 * @param chapterId
 * @param openId 
 * @return VideoPlayVo
*/

public VideoPlayVo getVideosBy(@Param("chapterId")Integer chapterId,@Param("openId") Integer openId);

}