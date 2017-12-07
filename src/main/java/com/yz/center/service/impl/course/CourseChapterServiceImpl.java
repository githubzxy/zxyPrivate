package com.yz.center.service.impl.course;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.net.ftp.FTP;
import org.aspectj.weaver.ast.Var;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.yz.center.dao.course.CourseChapterDao;
import com.yz.center.dao.course.CourseDao;
import com.yz.center.dao.video.VideoDao;
import com.yz.center.model.form.CourseChapterForm;
import com.yz.center.model.po.course.CourseChapterPo;
import com.yz.center.model.po.video.VideoPo;
import com.yz.center.service.iface.course.CourseChapterService;
import com.yz.center.util.CommonUtil;
import com.yz.center.util.ftp.FtpTools;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月7日 上午11:23:42 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
@Service("courseChapterService")
public class CourseChapterServiceImpl implements CourseChapterService{
	@Resource
	private CourseChapterDao chapterDao;
	 @Resource
     private CourseDao courseDao;
	 @Resource
     private VideoDao videoDao;
	@Override
	public List<CourseChapterPo> findCourseChapterByCourseId(Integer courseId) {
		// TODO Auto-generated method stub
		return chapterDao.findCourseChapterByCourseId(courseId);
	}

	@Override
    public int addChapter(CourseChapterForm chapterForm){
	    chapterForm.setCreateDt(new Date());
	    chapterForm.setStateDt(new Date());
        int sortOrder = chapterDao.selectChapterMaxSort(chapterForm);
        chapterForm.setSort(sortOrder);
        chapterDao.addChapter(chapterForm);
        int chapterId = chapterForm.getChapterId();
        return chapterId;
    }

	@Override
    public JSONArray chapterTree(Integer courseId,Integer parentId){
	    CourseChapterPo po = new CourseChapterPo();
        po.setCourseId(courseId);
        po.setParentId(parentId);  //根目录的父节点
        List<CourseChapterPo> list = chapterDao.getChapterList(po);
        JSONArray parent = new JSONArray();
        if(!list.isEmpty()){
            for(CourseChapterPo chapter : list){
                JSONObject obj = new JSONObject();
                obj.put("id", chapter.getChapterId());
                obj.put("text", chapter.getChapterName());
                obj.put("state", "closed");
                po.setParentId(chapter.getChapterId());
                List<CourseChapterPo> childList = chapterDao.getChapterList(po);
                if(!childList.isEmpty()){
                    JSONArray childObj = chapterTree(courseId,chapter.getChapterId());
                    obj.put("children", childObj);
                }
                parent.add(obj);
            }
        }
        return parent;
    }

    @Override
    public int updateChapter(CourseChapterForm chapterForm){
        try{
            chapterForm.setStateDt(new Date());
            chapterForm.setState(1);
            chapterDao.updateChapter(chapterForm);
        }
        catch(Exception e){
            return CommonUtil.FLAG_FAILD;
        }
        return CommonUtil.FLAG_SUCESS;
    }

    @Override
    public int delChapter(CourseChapterPo chapterPo){
        try{
        	int chapterId=chapterPo.getChapterId();
            chapterPo.setStateDt(new Date());
            chapterPo.setState(0);
            chapterDao.updateChapterState(chapterPo);
            String url = videoDao.getVideoUrlBychapterId(chapterId);
            if (url!=null) {
				FtpTools.deleteToFtp(url);//删除对应章节ftp视频
			}
            List<String> urls = videoDao.getVideoUrlsBychapterId(chapterId);
            if (urls!=null) {
            	 for (String url2:urls) {
                 	FtpTools.deleteToFtp(url2);//删除章节下下一级所有ftp视频
     			}
			}
            chapterDao.delVideoByChapterId(chapterPo.getChapterId());//删除视频
            courseDao.updateVideoCount(chapterPo.getCourseId());//更新课程视频数
        }
        catch(Exception e){
            return CommonUtil.FLAG_FAILD;
        }
        return CommonUtil.FLAG_SUCESS;
    }
    /**
     * @param chapterId
     * @return 
     * @see com.yz.center.service.iface.ChapterService#getVideoByChapterId(java.lang.Integer)
     */
     @Override
     public VideoPo getVideoByChapterId(Integer chapterId){
         return chapterDao.getVideoByChapterId(chapterId);
     }

     /**
     * @param chapterId
     * @return 
     * @see com.yz.course.service.iface.ChapterService#getChapterNameById(java.lang.Integer)
     */
     @Override
     public String getChapterNameById(Integer chapterId){
         // TODO Auto-generated method stub
         return chapterDao.getChapterNameById(chapterId);
     }

     /**
     * @param videoId
     * @return 
     * @see com.yz.course.service.iface.ChapterService#delVideo(java.lang.Integer)
     */
     @Override
     public Integer delVideo(Integer videoId,Integer courseId){
    	 int flag=0;
     	try{
 			
     		chapterDao.delVideo(videoId);
     		 flag=1;
     		 
				
			}
			catch(Exception e){
				e.printStackTrace();
				System.out.println("出错了");
				flag=0;
	         
	      }
     	if(flag==1){
     		courseDao.updateVideoCount(courseId);
     	}
	     return flag;
     }
         

     /**
     * @param fileName 
     * @see com.yz.course.service.iface.ChapterService#delFile(java.lang.String)
     */
     @Override
     public Integer delFile(Integer fileId){
         return chapterDao.delFile(fileId);
         
     }


	@Override
	public List<CourseChapterPo> getChapterList(CourseChapterPo po) {
		// TODO Auto-generated method stub
		return chapterDao.getChapterList(po);
	}

	@Override
	public List<CourseChapterPo> getChapterSonList(CourseChapterPo po) {
		// TODO Auto-generated method stub
		return chapterDao.getChapterSonList(po);
	}

    /**
    * @param chapterId
    * @param chapterId2 
    * @see com.yz.center.service.iface.course.CourseChapterService#modifySortChapterNumber(java.lang.Integer, java.lang.Integer)
    */
    public void modifySortChapterNumber2(Integer chapterId, Integer chapterId2){ 
        CourseChapterPo courseChapterPo1=chapterDao.getChapterById(chapterId);
        CourseChapterPo courseChapterPo2=chapterDao.getChapterById(chapterId2);
        if(courseChapterPo1==null||courseChapterPo2==null)
            return;
        int temp=courseChapterPo1.getSort();
        courseChapterPo1.setSort(courseChapterPo2.getSort());
        courseChapterPo2.setSort(temp);
        chapterDao.updateChapterSort(courseChapterPo1);
        chapterDao.updateChapterSort(courseChapterPo2);
    }
    /**
     * @param chapterId
     * @param chapterId2 
     * @see com.yz.center.service.iface.course.CourseChapterService#modifySortChapterNumber(java.lang.Integer, java.lang.Integer)
     */
     public void modifySortChapterNumber(Integer chapterId,Integer position,List<CourseChapterPo> chapterList){ 
    	 CourseChapterPo chapterById = chapterDao.getChapterById(chapterId);
    	 for (int i = 0; i <chapterList.size(); i++) {
 			 if (position<chapterList.get(i).getSort()&&chapterList.get(i).getSort()<chapterById.getSort()) {
 				CourseChapterPo courseChapterPo = chapterList.get(i);
 				courseChapterPo.setSort(i+2);
 				chapterDao.updateChapterSort(courseChapterPo);
			}
 		}
    	 chapterById.setSort(position+1);
 		chapterDao.updateChapterSort(chapterById);
    	
       
        
     }

    /**
    * @param courseId
    * @param parent
    * @return 
    * @see com.yz.center.service.iface.course.CourseChapterService#getByCourseAndParent(java.lang.Integer, java.lang.Integer)
    */
    @Override
    public List<CourseChapterPo> getByCourseAndParent(Integer courseId, Integer parent){
        // TODO Auto-generated method stub
        return chapterDao.getByCourseAndParent(courseId,parent);
    }

    /**
    * @param chapterId
    * @return 
    * @see com.yz.center.service.iface.course.CourseChapterService#getChapterById(java.lang.Integer)
    */
    @Override
    public CourseChapterPo getChapterById(Integer chapterId){
        // TODO Auto-generated method stub
        return chapterDao.getChapterById(chapterId);
    }

    /**
    * @param ccp 
    * @see com.yz.center.service.iface.course.CourseChapterService#updatechapterParentId(com.yz.center.model.po.course.CourseChapterPo)
    */
    @Override
    public void updatechapterParentId(CourseChapterPo ccp){
        // TODO Auto-generated method stub
        chapterDao.updatechapterParentId(ccp);
    }

	
	/** 
	* Title: getChapters
	* Description: 添加章节级数
	 * @throws Exception 
	* @see com.yz.center.service.iface.course.CourseChapterService#getChapters(java.util.List, java.lang.Integer, java.lang.Integer)  
	*/
	
    @Override
	public Integer addLevel(Integer parentId, Integer courseId,Integer level) throws Exception {
		List<CourseChapterPo> chapters=chapterDao.getByCourseAndParent(courseId, parentId);
		Integer flag=0;
		if(chapters!=null&&chapters.size()>0){
			for(CourseChapterPo chapter:chapters){
				 flag=chapterDao.updatechapterLevel(level, chapter.getChapterId());
				if(flag==0){
					throw new Exception();
				}
				addLevel(chapter.getChapterId(), courseId,level+1);
			}
		}
		
		return flag;
	}

	@Override
	public Integer getVideoInfoBychapterId(Integer chapterId) {
		Integer videoId = chapterDao.getVideoInfoBychapterId(chapterId);
		if (videoId != null) {
			return 0;
		}else {
			return 1;
		}
		
	}
}
