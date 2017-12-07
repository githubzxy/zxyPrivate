/**
  * @FileName: ResourceService.java
  * @Author 
  * @Description:
  * @Date 2016年9月8日 上午11:14:53
  * @CopyRight yazhuokj Corporation
  */
package com.yz.center.service.iface.resource;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.yz.center.model.form.FileForm;
import com.yz.center.model.po.resource.ResourcePo;
import com.yz.center.model.po.resource.ResourceTypePo;
import com.yz.center.util.common.PageBean;

public interface ResourceService{
        
    /**   
     * @Title: getResourceList   
     * @Description:TODO  
     * @param vo
     * @return List<CoursePo>
    */

    public PageBean getResourceList(PageBean pageBean);

    /**   
     * @Title: getCResourceList   
     * @Description:TODO  
     * @param vo
     * @return List<CourseFilePo>
    */
    
    public PageBean getCResourceList(PageBean pageBean);
    

    /**   
     * @Title: getTypeList   
     * @Description:TODO  
     * @param vo
     * @return List<FileType>
    */
    
    public PageBean getTypeList(PageBean pageBean);

    /**   
     * @Title: add   
     * @Description:TODO  
     * @param fileData
     * @param url
     * @param request
     * @return FileForm
     * @throws Exception 
    */
    
    public FileForm add(CommonsMultipartFile fileData, String url, HttpServletRequest request) throws Exception;
    public FileForm add2(MultipartFile file, String url, HttpServletRequest request) throws Exception;

    /**   
     * @Title: delResource   
     * @Description:TODO  
     * @param fileId
     * @return int
    */
    
    public int delResource(Integer fileId,Integer fileType);
    public int delFtpResource(Integer fileId,Integer fileType);

    /**   
     * @Title: addResource   
     * @Description:TODO  
     * @param resourceForm
     * @return int
    */
    
    public int addResource(FileForm fileForm);
    

    /**   
     * @Title: checkRes   
     * @Description:TODO  
     * @param fileId
     * @param state 
     * @return int
    */
    
    public int checkRes(Integer fileId, Integer state,Integer fileType);

    /**   
     * @Title: getResourceById   
     * @Description:TODO  
     * @param id
     * @return FileType
    */
    
    public ResourceTypePo getResourceTypeById(Integer id);

    /**   
     * @Title: delResourceType   
     * @Description:TODO  
     * @param fileTypeId
     * @return int
    */
    
    public int delResourceType(Integer id);
    public int delAllResourceType(String fileTypeIds);//批量删除资源类别

    /**   
     * @Title: getTmpFileById   
     * @Description:TODO  
     * @return FileForm
    */
    
    public FileForm getTmpFileById(Integer fileId);

    /**   
     * @Title: updateRestype   
     * @Description:TODO  
     * @param resourceType
     * @return int
    */
    
    public int updateRestype(ResourceTypePo resourceType);

    /**   
     * @Title: addResType   
     * @Description:TODO  
     * @param resourceType
     * @return int
    */
    
    public int addResType(ResourceTypePo resourceType);


    /**   
     * @Title: setClickNum   
     * @Description:TODO  
     * @param fileForm
     * @return int
    */
    
    public int setClickNum(FileForm fileForm);

    /**   
     * @Title: getResourceById   
     * @Description:TODO  
     * @param fileId
     * @param fileType 
     * @return FileForm
    */
    
    public FileForm getResourceById(Integer fileId, Integer fileType);

    /**   
     * @Title: getFileByChapterId   
     * @Description:TODO  
     * @param chapterId
     * @return List<FileForm>
    */
    
    public List<FileForm> getFileByChapterId(Integer chapterId);

    /**   
     * @Title: addVideo   
     * @Description:TODO  
     * @param fileForm void
    */
    
    public int addVideo(FileForm fileForm);
    public int updateVideo(FileForm fileForm,Integer videoIdBefore);
    /**   
     * @Title: getAllResource   
     * @Description:TODO  
     * @return List<ResourcePo>
    */
    
    public List<ResourcePo> getAllResource();

    /**   
     * @Title: addCover   
     * @Description:TODO  
     * @param fileForm int
    */
    
    public int addCover(FileForm fileForm);
    public int updateCover(FileForm fileForm);

    /**   
     * @Title: delChapterFile   
     * @Description:TODO  
     * @param chapterId void
    */
    
    public int delChapterFile(Integer chapterId);

    /**   
     * @Title: delChaptervideo   
     * @Description:TODO  
     * @param chapterId
     * @return int
    */
    
    public int delChaptervideo(Integer chapterId);

    
    /**   根据ID获取文件信息
    * @Title: getFilesByIds
    * @Description: 根据ID获取文件信息 
    * @param fileIds
    * @return
    * @author:
    */
    public List<FileForm> getFilesByIds(Integer[] fileIds);
    
    
    /**   根据ID获取文件信息
    * @Title: getCourseFilesByIds
    * @Description: 根据ID获取文件信息  
    * @param fileIds
    * @return
    * @author:
    */
    public List<FileForm> getCourseFilesByIds(Integer[] fileIds);

	public Integer getFilesById(Integer id);
}