package com.yz.center.service.impl.course;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yz.center.dao.course.CourseTypeDao;
import com.yz.center.model.po.course.CourseTypePo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.model.vo.course.CourseInfoVo;
import com.yz.center.service.iface.course.CourseTypeService;
import com.yz.center.util.CommonUtil;
import com.yz.center.util.common.PageBean;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月1日 上午10:53:10 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
@Service("courseTypeService")
public class CourseTypeServiceImpl implements CourseTypeService {
    
    List<CourseTypePo> list = new ArrayList<CourseTypePo>() ;
    @Resource
    private CourseTypeDao courseTypeDao;
    
    @Override
    public PageBean findCourseTypes(PageBean pageBean) {
        int count = courseTypeDao.selectPageCount(pageBean);
        pageBean.setTotalPage(count);
        List<CourseTypePo>list = courseTypeDao.selectCourseTypeList(pageBean);
        
        pageBean.setList(list);
        return pageBean;
        
        
    }

    @Override
    public CourseTypePo findCourseType(Integer courseTypeId) {

        return courseTypeDao.findCourseType(courseTypeId);
    }

    @Override
    public int addCourseType(CourseTypePo courseTypePo, UserPo user) {
    
        courseTypePo.setCreateDate(new Date());
        courseTypePo.setStateDate(new Date());
        courseTypePo.setUser(user);
        courseTypePo.setState(1);
    
        Integer flag = courseTypeDao.addCourseType(courseTypePo);
        if (flag==1) {
            return CommonUtil.FLAG_SUCESS;
        }
            return CommonUtil.FLAG_FAILD;
        
        
        
        
    }

    @Override
    public int modifyCourseType(CourseTypePo courseTypePo,UserPo user) {
        
        courseTypePo.setCreateDate(new Date());
        courseTypePo.setStateDate(new Date());
        courseTypePo.setUser(user);

        Integer flag =  courseTypeDao.updateCourseType(courseTypePo);
        if (flag == 1) {
            return CommonUtil.FLAG_SUCESS;
        }
        
        return CommonUtil.FLAG_FAILD;
    }

    @Override
    public int removeCourseType(Integer courseTypeId) {
        
        try {
            
            courseTypeDao.updateCourseTypeState(courseTypeId);
        } catch (Exception e) {
            return CommonUtil.FLAG_SUCESS;
            
        }
        return CommonUtil.FLAG_SUCESS;
    }

    @Override
    public int removeAllCourseType(int[] typeIds) {
        if(typeIds.length>0){
            try{

                courseTypeDao.updateAllCourseTypeState(typeIds);
                return CommonUtil.FLAG_SUCESS;
            }catch(Exception e){
                return CommonUtil.FLAG_FAILD;
            }
        }
        return CommonUtil.FLAG_FAILD;
    }


    /**
    * @return 
    * @see com.yz.center.service.iface.course.CourseTypeService#findAllTypes()
    */
    @Override
    public List<CourseTypePo> findAllTypes(){
        // TODO Auto-generated method stub
        /*return courseTypeDao.findAllTypes();*/
        return courseTypeDao.findAllCourseTypesName(1);
    }


    @Override
    public List<CourseTypePo> findAllCourseTypesName(Integer schoolId) {
        List<CourseTypePo> courseTypePos = courseTypeDao.findAllCourseTypesName(schoolId);
        return courseTypePos;
    }


    @Override
    public List<CourseInfoVo> findCourseInfoVos(Integer schoolId) {
        List<CourseInfoVo> courseInfoVos = courseTypeDao.findCourseInfoVos(schoolId);
        return courseInfoVos;
    }

    
    @Override
    public List<CourseTypePo> findPatrentType() {
        return courseTypeDao.selectParentTypes();
    }

}