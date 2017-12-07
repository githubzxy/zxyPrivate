/**
  * @FileName: ResourceDao.java
  * @Author 
  * @Description:
  * @Date 2016年9月8日 上午11:17:47
  * @CopyRight yazhuokj Corporation
  */
package com.yz.center.dao.resource;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yz.center.model.form.FileForm;
import com.yz.center.model.po.resource.CourseFilePo;
import com.yz.center.model.po.resource.ResourcePo;
import com.yz.center.model.po.resource.ResourceTypePo;
import com.yz.center.util.common.PageBean;

public interface ResourceDao{

    /**   
     * @Title: getResouceList   
     * @Description:TODO  
     * @param vo
     * @param userId 
     * @return Page<CoursePo>
    */
    
    List<ResourcePo> getResourceList(PageBean pageBean);

    
    /**   
     * @Title: getCResourceList1   
     * @Description:TODO  
     * @param vo
     * @return List<CourseFilePo>
    */
    
    List<CourseFilePo> getCResourceList(PageBean pageBean);

    /**   
     * @Title: getTypeList   
     * @Description:TODO  
     * @param vo
     * @return List<ResourcePo>
    */
    
    List<ResourceTypePo> getTypeList(PageBean pageBean);

    /**   
     * @Title: add   
     * @Description:TODO  
     * @param attachment void
    */
    
    public void add(FileForm attachment);

    /**   
     * @Title: countItems   
     * @Description:TODO  
     * @param vo
     * @return Integer
    */
    
    public Integer countItems(PageBean vo);

    /**   
     * @Title: delResource   
     * @Description:TODO  
     * @param fileId
     * @return int
    */
    
    public int delResource(@Param("fileId") Integer fileId,
            @Param("fileType")Integer fileType);

    /**   
     * @Title: addResource   
     * @Description:TODO  
     * @param fileForm
     * @return int
    */
    
    public int addResource(FileForm fileForm);
    

    /**   
     * @Title: getTypeNum   
     * @Description:TODO  
     * @param vo
     * @return Integer
    */
    
    public Integer getTypeNum(PageBean pageBean);

    /**   
     * @Title: updatecheckState   
     * @Description:TODO  
     * @param fileId
     * @param state 
     * @param fileType 
     * @return int
    */
    
    public int updatecheckState(
            @Param("fileId") Integer fileId,
            @Param("state")Integer state, 
            @Param("fileType")Integer fileType);

    /**   
     * @Title: getResourceTypeById   
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
    public int delAllResourceType(@Param("fileTypeIds")String fileTypeIds);//批量删除资源类别

    /**   
     * @Title: countCItems   
     * @Description:TODO  
     * @param vo
     * @return Integer
    */
    
   public Integer countCItems(PageBean pageBean);


    /**   
     * @Title: getTmpFileByID   
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
     * @Title: getResourceById   
     * @Description:TODO  
     * @param fileId
     * @param typeId 
     * @return FileForm
    */
    
    public FileForm getResourceById(@Param("fileId") Integer fileId, @Param("typeId")Integer typeId);


    /**   
     * @Title: setClickNum   
     * @Description:TODO  
     * @param fileForm
     * @param fileType 
     * @return int
    */
    
    public int setClickNum(@Param("fileForm") FileForm fileForm);


    /**   
     * @Title: getFileByChapterId   
     * @Description:TODO  
     * @param chapterId
     * @return List<FileForm>
    */
    
    List<FileForm> getFileByChapterId(Integer chapterId);


    /**   
     * @Title: addVideo   
     * @Description:TODO  
     * @param fileForm
     * @return int
    */
    
    public int addVideo(FileForm fileForm);
    public int updateVideo(FileForm fileForm);
    /**   
     * @Title: getAllResource   
     * @Description:TODO  
     * @return List<ResourcePo>
    */
    
    public List<ResourcePo> getAllResource();


    /**   
     * @Title: addCover   
     * @Description:TODO  
     * @param fileForm void
    */
    
    public int addCover(FileForm fileForm);
    /**   
     * @Title: updateCover   
     * @Description:TODO  
     * @param fileForm void
    */
    
    public int updateCover(FileForm fileForm);


    /**   
     * @Title: delChapterFile   
     * @Description:TODO  
     * @param chapterId
     * @return int
    */
    
    public int delChapterFile(Integer chapterId);


    /**   
     * @Title: delChaptervideo   
     * @Description:TODO  
     * @param chapterId
     * @return int
    */
    
    public int delChaptervideo(Integer chapterId);

    
    /**   根据ID查询公共资源
     * @Title: getFileByChapterId   
     * @Description:根据ID查询公共资源
     * @param fileIds
     * @return List<FileForm>
    */
    
    List<FileForm> getFileByFileIds(Integer[] fileIds);
    
    
    /**   根据ID查询课程资源 
    * @Title: getCourseFileByFileIds
    * @Description: 根据ID查询课程资源 
    * @param fileIds 
    * @return
    * @author:
    */
    List<FileForm> getCourseFileByFileIds(Integer[] fileIds);


	Integer getFilesById(Integer id);
    
}
