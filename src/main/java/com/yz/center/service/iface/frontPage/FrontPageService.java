package com.yz.center.service.iface.frontPage;

import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;

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

public interface FrontPageService {
 public  List<CourseTypePo> getCourseTypes(Integer schoolId,Integer parentId);
 public List<CourseTypePo> getParentIds(Integer schoolId);
 public List<CoursePo> getCourseByCourseTypeId(PageBean pageBean);
 public List<CourseTypePo> getCourseTypeNolimit(Integer schoolId, Integer parentId);
 public List<VideoPlayVo> getVideosByChapterId(HttpServletRequest request,Integer openId,Integer chapterId, Integer schoolId);
 public Integer addComment(CommentPo commentPo);
 public List<CommentPo> getCommentList(PageBean pageBean);
 public JSONArray getNamesByOpenIdAndChapterId(Integer openId,Integer chapterId);
 public List<DownLoadSourceVo> getDownloadInfo(Integer openId,Integer schoolId);
 public List<CourseChapterPo> getChaptersofSon(Integer parentId,Integer chapterId);
 
 public VideoPo getvideoByChapterId(Integer chapterId);
 public OpenCourseChapterNameVo getOpenCourseName(Integer openId);
 
 public void getChildrenChapters(List<CourseChapterPo> children,Integer parentId,Integer openId);
 public void getVideosByChapters(List<VideoPlayVo> videos,Integer parentId,Integer openId);
 
 
 public List<Object> test();
/**   
 * @Title: getvideoBy   
 * @Description:TODO  
 * @param chapterId
 * @param openId 
 * @return VideoPlayVo
*/

public VideoPlayVo getvideoBy(Integer chapterId, Integer openId);
}
