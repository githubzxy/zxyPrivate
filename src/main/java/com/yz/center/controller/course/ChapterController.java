/**
  * @FileName: ChapterController.java
  * @Author 
  * @Description:
  * @Date 2016年6月30日 上午10:32:43
  * @CopyRight yazhuokj Corporation
  */
package com.yz.center.controller.course;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.yz.center.model.form.CourseChapterForm;
import com.yz.center.model.form.FileForm;
import com.yz.center.model.po.course.CourseChapterPo;
import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.model.po.video.VideoPo;
import com.yz.center.service.iface.course.CourseChapterService;
import com.yz.center.service.iface.course.CourseService;
import com.yz.center.service.iface.resource.ResourceService;
import com.yz.center.util.Static;
import com.yz.center.util.ftp.FtpTools;

@Controller
@RequestMapping("admin/course/chapter")
public class ChapterController{
    
    @Resource
    private CourseChapterService chapterService;
    
    @Resource
    private ResourceService resourceService;
    
    @Resource
    private CourseService courseService;
    
    /**   
     * @Title: addChapter   
     * @Description:创建章节节点
     * @param chapterPo
     * @return ModelMap
     * @throws UnsupportedEncodingException 
    */
    @RequestMapping("{courseId}/addChapter")
    @ResponseBody
    public ModelMap addChapter(@PathVariable("courseId")Integer courseId,CourseChapterForm chapterForm,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/plain;charset='UTF-8'"); 
        ModelMap model = new ModelMap();
        chapterForm.setCourseId(courseId);
        chapterService.addChapter(chapterForm);
        return model.addAttribute("id", chapterForm.getChapterId());
    }
    
    /**   
     * @Title: getChapterTree   
     * @Description:
     * @param courseId
     * @return JSONArray
     * @throws UnsupportedEncodingException 
    */
    @RequestMapping(value ="/chapterTree")
    @ResponseBody
    public JSONArray getChapterTree(Integer courseId,Integer parentId,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/plain;charset='UTF-8'"); 
        if("".equals(parentId) || parentId == null){
            parentId = 0;
        }
        JSONArray json = chapterService.chapterTree(courseId, parentId);
        System.out.println(json);
        return json;
    }
    
    /**   
     * @Title: editChapterTree   
     * @Description:编辑章节节点
     * @param courseId
     * @param chapterPo
     * @return ModelMap
    */
    @RequestMapping("/addLevel")
    @ResponseBody
    public ModelMap addlevel(Integer courseId){
    	  ModelMap model = new ModelMap();
          try{
           chapterService.addLevel(0, courseId, 1);
           model.addAttribute("flag",1);
          }catch(Exception e){
          	e.printStackTrace();
          	model.addAttribute("flag",0);
          }
    	  return model;
    }
    @RequestMapping("{courseId}/editChapter")
    @ResponseBody
    public ModelMap editChapterTree(@PathVariable("courseId")Integer courseId,CourseChapterForm chapterForm,HttpSession session,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/plain;charset='UTF-8'"); 
    	//根据chapterId查询数据库是否存在videoInfo；
    	Integer anotherflag = chapterService.getVideoInfoBychapterId(chapterForm.getChapterId());
        ModelMap model = new ModelMap();
    	UserPo user = (UserPo)session.getAttribute(Static.LOGIN_USER_SESSION);
        int flag=0;
        String[] fileIds = null;
        String[] fileIds2 = null;
        if(chapterForm.getFileIds() !=null)
            fileIds = chapterForm.getFileIds().split(",");
        
        if(chapterForm.getFileIds2() !=null)
            fileIds2= chapterForm.getFileIds2().split(",");
        
        chapterForm.setCourseId(courseId);
        if(chapterForm.getChapterId()!=-1){
            flag = chapterService.updateChapter(chapterForm);
        }else{
            chapterForm.setParentId(0);
            flag = chapterService.addChapter(chapterForm);
        }
        if(chapterForm.getVideoId()!=null && chapterForm.getVideoId() != 0&&anotherflag !=0){
            FileForm fileForm = resourceService.getTmpFileById(chapterForm.getVideoId());
            fileForm.setCreateDate(new Date());
            fileForm.setStateDate(new Date());
            fileForm.setCourseId(courseId);
            fileForm.setInfo(chapterForm.getChapterInfo());
            fileForm.setChapterId(chapterForm.getChapterId());
            fileForm.setCreatUserId(user.getUserId());
        	SchoolPo school = (SchoolPo)session.getAttribute(Static.SCHOOL_SESSION);
    		Integer schoolId = school.getSchoolId();
            fileForm.setSchoolId(schoolId);
            chapterForm.setCourseId(courseId);
            resourceService.addVideo(fileForm);//新增video
            
            
        }else {
        	Integer videoIdBefore=chapterForm.getVideoIdBefore();
        	if(videoIdBefore!=null&&videoIdBefore!=chapterForm.getVideoId()){
        		if(chapterForm.getVideoId()!=null){
        			FileForm fileForm = resourceService.getTmpFileById(chapterForm.getVideoId());
        			fileForm.setCourseId(courseId);
        			fileForm.setInfo(chapterForm.getChapterInfo());
        			fileForm.setChapterId(chapterForm.getChapterId());
        			fileForm.setCreatUserId(user.getUserId());
        			fileForm.setVideoId(videoIdBefore);
        			resourceService.updateVideo(fileForm,videoIdBefore);//修改video
        		}
               
            }
		}
        if(chapterForm.getFileIds()!=null && chapterForm.getFileIds() != ""){
           for(int i = 0;i < fileIds.length;i++){
            FileForm fileForm = resourceService.getTmpFileById(Integer.parseInt(fileIds[i]));
            System.out.println(fileForm);
            fileForm.setCreateDate(new Date());
            fileForm.setCourseId(courseId);
            fileForm.setResourceType(1);
            fileForm.setStateDate(new Date());
            fileForm.setInfo(chapterForm.getChapterInfo());
            fileForm.setChapterId(chapterForm.getChapterId());
            fileForm.setCreatUserId(user.getUserId());
            chapterForm.setCourseId(courseId);
            //判断文件是否存在
            	resourceService.addResource(fileForm);
           }
        }
        //通过资源库添加的资源
        if(chapterForm.getFileIds2()!=null && chapterForm.getFileIds2() != ""){
           for(int i = 0;i < fileIds2.length;i++){
            FileForm fileForm = resourceService.getResourceById(Integer.parseInt(fileIds2[i]),2);
            fileForm.setResourceType(1);
            fileForm.setStateDate(new Date());
            fileForm.setCourseId(courseId);
            fileForm.setInfo(chapterForm.getChapterInfo());
            fileForm.setChapterId(chapterForm.getChapterId());
            chapterForm.setCourseId(courseId);
            resourceService.addResource(fileForm);
           }
        }
        courseService.updateDtByCourseId(courseId);
        return model.addAttribute("flag", flag);
		
    }
    
    /**   
     * @Title: delChapterTree   
     * @Description:删除 章节节点
     * @param courseId
     * @param chapterPo
     * @return ModelMap
     * @throws UnsupportedEncodingException 
    */
    @RequestMapping("{courseId}/delChapter")
    @ResponseBody
    public ModelMap delChapterTree(@PathVariable("courseId")Integer courseId,CourseChapterPo chapterPo,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/plain;charset='UTF-8'"); 
        ModelMap model = new ModelMap();
        chapterPo.setCourseId(courseId);
        int flag = chapterService.delChapter(chapterPo);
        return model.addAttribute("flag", flag);
    }
    
    
    /**   
     * @Title: delChapterTree   
     * @Description:移动 章节节点
     * @param courseId
     * @param chapterPo
     * @return ModelMap
    */
    @RequestMapping("{courseId}/moveNode")
    @ResponseBody
    public String moveNode(Integer chapterId, String parent, Integer position){
        Integer parentId = null;
        try{
            if(parent.equals("#")){
                parentId = 0;
              }else{
                 parentId=Integer.parseInt(parent);   
                }
            CourseChapterPo ccp = chapterService.getChapterById(chapterId);
            if(ccp.getParentId().equals(parentId)){//同级移动
                System.out.println("同级");
                List<CourseChapterPo> chapterList=chapterService.getByCourseAndParent(ccp.getCourseId(), parentId);
                chapterService.modifySortChapterNumber(chapterId,position,chapterList);
            }else{//跨级移动
                System.out.println("跨级");
                ccp.setParentId(parentId);
                chapterService.updatechapterParentId(ccp);
                List<CourseChapterPo> chapterList=chapterService.getByCourseAndParent(ccp.getCourseId(), parentId);
                	System.out.println("位置："+position);
                         chapterService.modifySortChapterNumber(chapterId,position,chapterList);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return "success";
    }
    @RequestMapping("chapterInfo")
    public String chapterInfo(Integer chapterId,ModelMap modelMap,Integer courseId){
    	System.out.println("coudrseIdaldjfaldj========"+courseId);
        //1.查询获取视频信息，
        //2.查询获取文件信息
        VideoPo video = chapterService.getVideoByChapterId(chapterId);
        modelMap.addAttribute("video", video);
        List<FileForm> list2 = resourceService.getFileByChapterId(chapterId);
        modelMap.addAttribute("FileList", list2);
        //查询章节名字
        System.out.println("video::"+video+"list2"+list2);
        String chapterName=chapterService.getChapterNameById(chapterId);
        modelMap.addAttribute("chapterName",chapterName); 
        modelMap.addAttribute("courseId", courseId);
        return "admin/course/chapterInfo";
    }
    /*
     * 删除章节下视频
     * */
    @RequestMapping("delVideo")
    //@ResponseBody
    public void delVideo(Integer videoId,String url,Integer courseId,HttpServletResponse response){
        response.setContentType("text/html;charset=UTF-8");
        chapterService.delVideo(videoId,courseId);
        FtpTools.deleteToFtp(url);
    }
    /*
     * 修改章节下视频
     * */
    @RequestMapping("updateVideo")
    //@ResponseBody
    public void updateVideo(Integer videoId,String url,Integer courseId){
        FileForm fileForm = resourceService.getTmpFileById(videoId);
        fileForm.setCourseId(courseId);
        fileForm.setVideoId(videoId);
    	resourceService.updateVideo(fileForm,null);//修改video
//        chapterService.delVideo(videoId,courseId);
//        FtpTools.deleteToFtp(url);
    }
    /*
     * 删除章节下文件
     * */
    @RequestMapping("delFile")
    //@ResponseBody
    public void delFile(Integer fileId,String url,HttpServletResponse response){
        //TODO  删除操作
        response.setContentType("text/html;charset=UTF-8");
            chapterService.delFile(fileId);
            FtpTools.deleteToFtp(url);
    }
    @RequestMapping("addFile")
    public String addFile(@RequestParam(value = "arr[]") String[] arr,Integer chapterId){
       for(int i=0;i<arr.length;i++){
           FileForm file= resourceService.getResourceById(Integer.parseInt(arr[i]), null);
           file.setChapterId(chapterId);
           resourceService.addResource(file);
           }
        return "course/chapterInfo";
       }
}