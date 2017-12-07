/**
  * @FileName: ResourceServiceImpl.java
  * @Author 
  * @Description:
  * @Date 2016年9月8日 上午11:15:28
  * @CopyRight yazhuokj Corporation
  */
package com.yz.center.service.impl.resource;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.yz.center.dao.course.CourseDao;
import com.yz.center.dao.resource.ResourceDao;
import com.yz.center.dao.video.VideoDao;
import com.yz.center.model.form.FileForm;
import com.yz.center.model.po.resource.CourseFilePo;
import com.yz.center.model.po.resource.ResourcePo;
import com.yz.center.model.po.resource.ResourceTypePo;
import com.yz.center.service.iface.resource.ResourceService;
import com.yz.center.util.BaseUtil;
import com.yz.center.util.CommonUtil;
import com.yz.center.util.CommonUtil2;
import com.yz.center.util.common.PageBean;
import com.yz.center.util.ftp.FtpTools;



@Service
public class ResourceServiceImpl implements ResourceService{

        @Resource
        private ResourceDao resourceDao;
        @Resource
        private CourseDao courseDao;
        @Resource
        private VideoDao videoDao;
        

        @Override
        public PageBean getResourceList(PageBean pageBean){
            Integer items=resourceDao.countItems(pageBean);
            pageBean.setTotalPage(items);
            List<ResourcePo> list = resourceDao.getResourceList(pageBean);
            pageBean.setList(list);
            return pageBean;
        }
        
          @Override
          public PageBean getCResourceList(PageBean pageBean){
             Integer items=resourceDao.countCItems(pageBean);
             pageBean.setTotalPage(items);
             List<CourseFilePo> list = resourceDao.getCResourceList(pageBean);
             pageBean.setList(list);
             return pageBean;
         }
         
        @Override
        public PageBean getTypeList(PageBean pageBean){
        	int num = 0;
            Integer items=resourceDao.getTypeNum(pageBean);
            pageBean.setTotalPage(items);
            List<ResourceTypePo> list = resourceDao.getTypeList(pageBean);
            PageBean v = null;
            for(int i=0;i<list.size();i++){
                if(list.get(i).getId()==1){
                num = resourceDao.countItems(v);
                }else if(list.get(i).getId()==2){
                    num = resourceDao.countCItems(v);
                }else{
                    num=0;
                }
                list.get(i).setNum(num);
            }
            pageBean.setList(list);
            return pageBean;
        }
        
         @Override
        public FileForm add2(MultipartFile file, String url, HttpServletRequest request) throws Exception{
            FileForm attachment = new FileForm();
            attachment = CommonUtil2.add(file, url, request,0);
            resourceDao.add(attachment);
            attachment.setUrl(BaseUtil.getValueFormProperties("uploadPath")+"/"+attachment.getUrl());
            System.out.println(attachment);
            return attachment;
        }
         @Override
         public FileForm add(CommonsMultipartFile uploadItem, String url, HttpServletRequest request) throws Exception{
             FileForm attachment = new FileForm();
             attachment = CommonUtil.add(uploadItem, url, request,0);
             resourceDao.add(attachment);
             attachment.setUrl(BaseUtil.getValueFormProperties("uploadPath")+"/"+attachment.getUrl());
             System.out.println(attachment);
             return attachment;
         }
         

        @Override
        public int delResource(Integer fileId,Integer fileType){
            return  resourceDao.delResource(fileId,fileType);
        }
        

        @Override
		public int delFtpResource(Integer fileId, Integer fileType) {
        	int flag=0;
        	try{
        	 resourceDao.delResource(fileId,fileType);
       		 flag=1;
  			}
  			catch(Exception e){
  				e.printStackTrace();
  	      }
        	if (flag==1) {
        		FileForm fileForm = resourceDao.getTmpFileById(fileId);
            	FtpTools.deleteToFtp(fileForm.getUrl());
			}
            return flag;
        }

		@Override
        public int addResource(FileForm fileForm){
            return resourceDao.addResource(fileForm);
        }

		@Override
        public int checkRes(Integer fileId,Integer state,Integer fileType){
           return resourceDao.updatecheckState(fileId,state,fileType);
        }

        @Override
        public ResourceTypePo getResourceTypeById(Integer id){
            return resourceDao.getResourceTypeById(id);
        }

        @Override
        public int delResourceType(Integer id){
            return resourceDao.delResourceType(id);
        }
        @Override
		public int delAllResourceType(String fileTypeIds) {
        	try{
        		resourceDao.delAllResourceType(fileTypeIds);
				
			}
			catch(Exception e){
				e.printStackTrace();
	            return CommonUtil.FLAG_FAILD;
	        }
	        return CommonUtil.FLAG_SUCESS;
			
		}

        @Override
        public FileForm getTmpFileById(Integer fileId){
            return resourceDao.getTmpFileById(fileId);
        }

        @Override
        public int updateRestype(ResourceTypePo resourceType){
            return resourceDao.updateRestype(resourceType);
        }

        @Override
        public int addResType(ResourceTypePo resourceType){
            return resourceDao.addResType(resourceType);
        }

        @Override
        public int setClickNum(FileForm fileForm){
            return resourceDao.setClickNum(fileForm);
        }

        @Override
        public FileForm getResourceById(Integer fileId,Integer typeId){
            return resourceDao.getResourceById(fileId,typeId);
        }

        @Override
        public List<FileForm> getFileByChapterId(Integer chapterId){
            return resourceDao.getFileByChapterId(chapterId);
        }

        @Override
        public int addVideo(FileForm fileForm){
        	int flag=0;
        	try{
    			
        		 resourceDao.addVideo(fileForm);
        		 flag=1;
        		 
   				
   			}
   			catch(Exception e){
   				e.printStackTrace();
   				System.out.println("出错了");
   				flag=0;
   	         
   	      }
        	if(flag==1){
        		courseDao.updateVideoCount(fileForm.getCourseId());
        	}
   	     return flag;
        }
        
        @Override
		public int updateVideo(FileForm fileForm,Integer videoIdBefore) {
        	String url = videoDao.getVideoUrlById(videoIdBefore);
        	int flag=0;
        	try{
        		resourceDao.updateVideo(fileForm);
        		flag=1;
        	}
        	catch(Exception e){
        		e.printStackTrace();
        		System.out.println("出错了");
        		flag=0;
        	}
        	if(flag==1){courseDao.updateVideoCount(fileForm.getCourseId());
        	FtpTools.deleteToFtp(url);
        	}
			return flag;
		}
        
		@Override
        public List<ResourcePo> getAllResource(){
            return resourceDao.getAllResource();
        }

        @Override
        public int addCover(FileForm fileForm){
            return resourceDao.addCover(fileForm);
        }
        
        @Override
		public int updateCover(FileForm fileForm) {
			// TODO Auto-generated method stub
			return resourceDao.updateCover(fileForm);
		}

		@Override
        public int delChapterFile(Integer chapterId){
            return resourceDao.delChapterFile(chapterId);
        }

        @Override
        public int delChaptervideo(Integer chapterId){
            return resourceDao.delChaptervideo(chapterId);
        }

		
		@Override
		public List<FileForm> getFilesByIds(Integer[] fileIds) {
			return resourceDao.getFileByFileIds(fileIds);
		}

		
		@Override
		public List<FileForm> getCourseFilesByIds(Integer[] fileIds) {
			return resourceDao.getCourseFileByFileIds(fileIds);
		}

		@Override
		public Integer getFilesById(Integer id) {
			if (resourceDao.getFilesById(id) != null) {
				return 0;
			}else {
				return 1;
			}
			
		}

}
