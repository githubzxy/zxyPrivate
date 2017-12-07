/**
  * @FileName: CourseServiceImpl.java
  * @Author 
  * @Description:
  * @Date 2016年5月25日 下午3:33:33
  * @CopyRight yazhuokj Corporation
  */
package com.yz.center.service.impl.course;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yz.center.dao.course.CourseChapterDao;
import com.yz.center.dao.course.CourseDao;
import com.yz.center.dao.lecturer.LecturerDao;
import com.yz.center.dao.resource.ResourceDao;
import com.yz.center.model.form.CourseChapterForm;
import com.yz.center.model.form.CourseForm;
import com.yz.center.model.form.CourseInfoForm;
import com.yz.center.model.form.FileForm;
import com.yz.center.model.po.course.CoursePo;
import com.yz.center.service.iface.course.CourseService;
import com.yz.center.util.CommonUtil;
import com.yz.center.util.common.PageBean;
import com.yz.center.util.ftp.FtpTools;


/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月7日 上午10:21:47 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
@Service("courseService")
public class CourseServiceImpl implements CourseService{

    /**
    * @param id
    * @return 
    * @see com.yz.course.dao.CourseDao#get(java.lang.String)
    */
    
    @Resource
    private CourseDao courseDao;
    
    @Resource
    private ResourceDao resourceDao;
    
    @Resource
    private CourseChapterDao courseChapterDao;
    
    @Resource
    private LecturerDao lecturerDao;
    
	/**
	 * 查询课程名称列表
	 */
	public List<CoursePo> findCourseNameAllBySchoolId(Integer schoolId){
		
		return courseDao.findCourseNameAllBySchoolId(schoolId);
		
		
		
	}


	@Override
	public int addStepOne(CourseForm courseForm) {
		
		courseForm.setUpdateDt(new Date());
	    courseForm.setCreateDt(new Date());
	    
	    //上传课程封面
	    if(courseForm.getCoverId() !=null){
            FileForm fileForm = resourceDao.getTmpFileById(courseForm.getCoverId());
            //fileForm = CommonUtil.add(courseForm.getCover(), "cover", request,1);
            fileForm.setCourseId(courseForm.getCourseId());
            fileForm.setSchoolId(courseForm.getSchoolId());
            resourceDao.addCover(fileForm);
            courseForm.setCoverId(fileForm.getId());
        }
		int flag = courseDao.addStepOne(courseForm);
		 //添加讲师信息
		System.out.println(courseForm.getCourseId());
        if(courseForm.getLectureIds()!="" && courseForm.getLectureIds()!=null){
            String[] LectureId = courseForm.getLectureIds().split(",");
            for(int i=0;i < LectureId.length;i++){
                courseDao.addCourseLecture(courseForm.getCourseId(),LectureId[i]);
            }
        }
		CourseChapterForm chapterForm = new CourseChapterForm();
		chapterForm.setCourseId(courseForm.getCourseId());
		chapterForm.setChapterName("默认根目录");
		chapterForm.setParentId(0);
		courseChapterDao.addChapter(chapterForm);
       return flag;
    }
    
    @Override
    public CoursePo findCourseById(final Integer id){
        return courseDao.selectCourseById(id);
    }

    @Override
    public PageBean findCourseAllBySchoolId(PageBean pageBean){

        Integer items=courseDao.selectCourseCount(pageBean);
        pageBean.setTotalPage(items); 
        List<CoursePo> list = courseDao.getCourseAllBySchoolId(pageBean);
        pageBean.setList(list);
        return pageBean;
    }


    @Override
    public CoursePo getCourseByCourseId(int courseId){
        return courseDao.getCourseByCourseId(courseId);
    }

    @Override
    public List<CoursePo> findCourseByTypeId(Integer courseTypeId){
        return courseDao.findCourseByTypeId(courseTypeId);
    }

    @Override
    public PageBean findCourses(PageBean pageBean){
        Integer items=courseDao.selectCourseCount(pageBean);
        pageBean.setTotalPage(items);
        List<CoursePo> list = courseDao.selectCourseList(pageBean);
        pageBean.setList(list);
        System.out.println("sadjskadj"+pageBean.getStartIndex());
        System.out.println(pageBean.getPageSize());
        return pageBean;
    }

    @Override
    public List<CoursePo> getAllCource(){
        return courseDao.selectAllCourseList();
    }
    
    @Override
    public Integer saveCourseType(Integer courseId,Integer courseTypeId){
        return courseDao.changeCourseType(courseId,courseTypeId);
    }


    @Override
    public Integer addCourseLecture(Integer courseId, String lecturerId){
        return courseDao.addCourseLecture(courseId,lecturerId);
    }

    @Override
    public int removeCourse(int courseId){
        return courseDao.delCourse(courseId);
    }

    @Override
    public int updateCourseInfo(CourseForm courseForm){
    	lecturerDao.delAllLecturer(courseForm.getCourseId());
    	if(courseForm.getLectureIds()!="" && courseForm.getLectureIds()!=null){
            String[] LectureId = courseForm.getLectureIds().split(",");
            for(int i=0;i < LectureId.length;i++){
                courseDao.addCourseLecture(courseForm.getCourseId(),LectureId[i]);
            }
        }
    	 //上传课程封面
    	if(courseForm.getCoverId()==null){
    		if(courseForm.getCoverIdTmp() !=null){
    			 FileForm fileForm = resourceDao.getTmpFileById(courseForm.getCoverIdTmp());
    	            //fileForm = CommonUtil.add(courseForm.getCover(), "cover", request,1);
    	            fileForm.setCourseId(courseForm.getCourseId());
    	            fileForm.setSchoolId(courseForm.getSchoolId());
    	            resourceDao.addCover(fileForm);
    	            courseForm.setCoverId(fileForm.getId());
    		}
           
        }else{
        	 if(courseForm.getCoverIdTmp() !=null){
                 FileForm fileForm = resourceDao.getTmpFileById(courseForm.getCoverIdTmp());
                 //fileForm = CommonUtil.add(courseForm.getCover(), "cover", request,1);
                 fileForm.setCourseId(courseForm.getCourseId());
                 fileForm.setSchoolId(courseForm.getSchoolId());
                 fileForm.setCoverId(courseForm.getCoverId());
                 resourceDao.updateCover(fileForm);
             }
        }
        return courseDao.updateCourseInfo(courseForm);
    }

	@Override
	public List<CoursePo> findCourseNameByTypeId(Integer courseTypeId) {
		return courseDao.findCourseNameByTypeId(courseTypeId);
	}


	@Override
	public CourseInfoForm getCourseInfo(Integer courseId) {
		return courseDao.getCourseInfo(courseId);
	}


    @Override
    public int delCover(int coverId){
    	int flag=0;
    	try{
    		courseDao.delCover(coverId);
   		 flag=1;
			}
			catch(Exception e){
				e.printStackTrace();
	      }
    	if (flag==1) {
    		FileForm fileForm = resourceDao.getTmpFileById(coverId);
        	FtpTools.deleteToFtp(fileForm.getUrl());
		}
        return flag;
    }
    @Override
    public int delCourseCover(int courseId){
        return courseDao.delCourseCover(courseId);
    }


    /**
    * @param courseId 
    * @see com.yz.center.service.iface.course.CourseService#updateDtByCourseId(int)
    */
    @Override
    public void updateDtByCourseId(int courseId){
        // TODO Auto-generated method stub
        courseDao.updateDtByCourseId(courseId);
    }
	
	
}
