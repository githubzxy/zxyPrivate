package com.yz.center.service.impl.frontPage;



import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;
import com.alibaba.fastjson.JSONArray;
import com.yz.center.dao.frontPage.FrontPageDao;
import com.yz.center.model.po.PageBean;
import com.yz.center.model.po.comment.CommentPo;
import com.yz.center.model.po.course.CourseChapterPo;
import com.yz.center.model.po.course.CoursePo;
import com.yz.center.model.po.course.CourseTypePo;
import com.yz.center.model.po.video.VideoPo;
import com.yz.center.model.vo.frontPage.DownLoadSourceVo;
import com.yz.center.model.vo.frontPage.OpenCourseChapterNameVo;
import com.yz.center.model.vo.frontPage.VideoPlayVo;
import com.yz.center.service.iface.frontPage.FrontPageService;
import com.yz.center.util.WritetoJson;

@Service
public class FrontPageServiceImpl implements FrontPageService{
@Resource
FrontPageDao frontPageDao;
	@Override
	public List<CourseTypePo> getCourseTypes(Integer schoolId,Integer parentId) {
	return frontPageDao.getCourseType(schoolId, parentId);
	}
	@Override
	public List<CourseTypePo> getParentIds(Integer schoolId) {
		return frontPageDao.getCourseParentId(schoolId);

	}
	
	@Override
	public List<CoursePo> getCourseByCourseTypeId(PageBean pageBean) {
		pageBean.setPageSize(9);
		Integer pageSize=pageBean.getPageSize();
		int startIndex=(pageBean.getPageNum()-1)*pageSize;
		pageBean.setStartIndex(startIndex);
		Integer courseTypeId=pageBean.getCourseTypeId();
    	List<CoursePo> courses=null;
    	Integer items=null;
    	if(courseTypeId==null||courseTypeId.equals("")){
    		List<CourseTypePo> parentTypes=getParentIds(pageBean.getSchoolId());
    		pageBean.setCourseTypeId(parentTypes.get(0).getCourseTypeId());
    		courseTypeId=1;
    	}
    	if(courseTypeId==1||courseTypeId==2){
    		courses=frontPageDao.getCourseByParentId(pageBean);
    		items=frontPageDao.getCourseCountByParentId(pageBean).size();
    		pageBean.setTotalItem(items);                                                                                                                                                                                                    
  			pageBean.setTotalPage((items + pageSize -1) / pageSize);
    	}else{
    		courses=frontPageDao.getCourseByCourseTypeId(pageBean);
    		  items=frontPageDao.getCourseCountByCourseTypeId(pageBean).size();
    		    pageBean.setTotalItem(items);                                                                                                                                                                                                    
    			pageBean.setTotalPage((items + pageSize -1) / pageSize);
    	}
		return courses;
	}
	@Override
	public List<CourseTypePo> getCourseTypeNolimit(Integer schoolId, Integer parentId) {
		
		return frontPageDao.getCourseTypeNolimit(schoolId, parentId);
	}
	
	@Override
	public Integer addComment(CommentPo commentPo) {
		commentPo.setCreDt(new Date());
		commentPo.setStaDt(new Date());
		commentPo.setState(1);
		commentPo.setUserId(commentPo.getUserId());
		return frontPageDao.addComment(commentPo);
	}
	@Override
	public List<CommentPo> getCommentList(PageBean pageBean) {
		List<CommentPo> commentPos=null;
		Integer pageSize=pageBean.getPageSize();
		int startIndex=(pageBean.getPageNum()-1)*pageSize;
		pageBean.setStartIndex(startIndex);
		try{
	    	SimpleDateFormat simple=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
	    	 commentPos=frontPageDao.getCommentList(pageBean);
	    	for(CommentPo commentPo:commentPos){
	    		commentPo.setCreateDt(simple.format(commentPo.getCreDt()));
	    	}
	    	Integer items=frontPageDao.getCommentListCount(pageBean);
	    	 pageBean.setTotalItem(items);                                                                                                                                                                                                    
 			pageBean.setTotalPage((items + pageSize -1) / pageSize);
	    	}catch(Exception e){
	    		
	    	} 
		return commentPos;
	}
	@Override
	public JSONArray getNamesByOpenIdAndChapterId(Integer openId, Integer chapterId) {
		
		return frontPageDao.getNamesByOpenIdAndChapterId(openId, chapterId);
	}
	@Override
	public List<VideoPlayVo> getVideosByChapterId(HttpServletRequest request,Integer openId, Integer chapterId, Integer schoolId) {
	try{
		JSONArray videosJson=frontPageDao.getVideosJsonByChapterId(openId, chapterId, schoolId);
		WritetoJson.toJson(request.getServletContext().getRealPath("/")+"front/json/playlist.json", videosJson);
	}catch(Exception e){
		e.printStackTrace();
	}
		return frontPageDao.getVideosByChapterId(openId, chapterId, schoolId);
	}
	@Override
	public List<DownLoadSourceVo> getDownloadInfo(Integer chapterId, Integer schoolId) {
		
		return frontPageDao.getDownloadInfo(chapterId, schoolId);
	}
	
	/** 
	* Title: getChaptersofSon
	* Description: 
	* @see com.yz.center.service.iface.frontPage.FrontPageService#getChaptersofSon(java.lang.Integer)  
	*/
	
	@Override
	public List<CourseChapterPo> getChaptersofSon(Integer parentId,Integer chapterId) {
		return frontPageDao.getChaptersofSon(parentId,chapterId);
	}
	
	/** 2
	* Title: getvideoByChapterId
	* Description: 
	 * @throws IOException 
	* @see com.yz.center.service.iface.frontPage.FrontPageService#getvideoByChapterId(java.lang.Integer)  
	*/
	
	@Override
	public VideoPo getvideoByChapterId(Integer chapterId) {
		return frontPageDao.getvideoByChapterId(chapterId);
	}
	
	/** 
	* Title: getOpenCourseName
	* Description: 
	* @see com.yz.center.service.iface.frontPage.FrontPageService#getOpenCourseName(java.lang.Integer)  
	*/
	
	@Override
	public OpenCourseChapterNameVo getOpenCourseName(Integer openId) {
		return frontPageDao.getOpenCourseName(openId);
	}
	
	/** 
	* Title: getChildrenChapters
	* Description:递归取得一个课程下的所有章节和相应的子章节 
	* @see com.yz.center.service.iface.frontPage.FrontPageService#getChildrenChapters(java.lang.Integer, java.lang.Integer)  
	*/
	
	@Override
	public void getChildrenChapters(List<CourseChapterPo> children,Integer parentId, Integer openId) {
	List<CourseChapterPo> chapters=frontPageDao.getChildrenChapters(parentId, openId);
	if(chapters!=null&&chapters.size()>0){
		for(CourseChapterPo chapter:chapters){
			children.add(chapter);
			getChildrenChapters(children,chapter.getChapterId(), openId);
		}
	}
	
	}
	
	/** 
	* Title: getVideosByChapters
	* Description:递归取得一个课程下的所有章节、相应的子章节和每一个章节对应的视频，没有视频的videoId为空 
	* @see com.yz.center.service.iface.frontPage.FrontPageService#getVideosByChapters(java.util.List, java.lang.Integer, java.lang.Integer)  
	*/
	
	@Override
	public void getVideosByChapters(List<VideoPlayVo> videos, Integer parentId, Integer openId) {
		List<VideoPlayVo> videoByChapter=frontPageDao.getVideosByChapters(parentId, openId);
		if(videoByChapter!=null&&videoByChapter.size()>0){
			for(VideoPlayVo videoPlayVo:videoByChapter){
				videos.add(videoPlayVo);
				getVideosByChapters(videos,videoPlayVo.getChapterId(), openId);
			}
		}
	}
	
	/** 
	* Title: test
	* Description: 
	* @see com.yz.center.service.iface.frontPage.FrontPageService#test()  
	*/
	
	@Override
	public List<Object> test() {
	List<CourseChapterPo> children=new ArrayList<CourseChapterPo>();
			getChildrenChapters(children,0,3);
			for(CourseChapterPo courseChapterPo:children){
				
				if(courseChapterPo.getLevel()==1){
					
				}else{
				
				}
			}
		return null;
	}
    /**
    * @param chapterId
    * @return 
    * @see com.yz.center.service.iface.frontPage.FrontPageService#getvideoBy(java.lang.Integer)
    */
    @Override
    public VideoPlayVo getvideoBy(Integer chapterId,Integer openId){
        // TODO Auto-generated method stub
        return frontPageDao.getVideosBy(chapterId,openId);
    }
	
	
	
	
	
	
}