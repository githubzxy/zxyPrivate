package com.yz.center.service.impl.lecturer;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yz.center.dao.lecturer.LecturerDao;
import com.yz.center.model.po.course.LecturerPo;
import com.yz.center.model.vo.BaseConditionVO;
import com.yz.center.service.iface.lecturer.LecturerService;
import com.yz.center.util.CommonUtil;
import com.yz.center.util.common.PageBean;
@Service("lecturerService")
public class LecturerServiceImpl implements LecturerService {
	@Resource
	private LecturerDao lecturerDao;
	@Override
	public int lecturerAdd(LecturerPo lecturerPo,Integer schoolId) {
		// TODO Auto-generated method stub
		lecturerPo.setCreateDate(new Date());
		lecturerPo.setSchoolId(schoolId);
		lecturerPo.setState(1);
		if("".equals(lecturerPo.getBirthday())){
			lecturerPo.setBirthday(null);
		 }
		try{
			lecturerDao.lecturerAdd(lecturerPo);
			
		}
		catch(Exception e){
			e.printStackTrace();
           return CommonUtil.FLAG_FAILD;
       }
       return CommonUtil.FLAG_SUCESS;
	}
	
	@Override
	public int lecturerUpdate(LecturerPo lecturerPo) {
		// TODO Auto-generated method stub
		if (lecturerPo.getBirthday().equals("")) {
			lecturerPo.setBirthday(null);
		}
		try{
			lecturerDao.lecturerUpdate(lecturerPo);
			
		}
		catch(Exception e){
			e.printStackTrace();
           return CommonUtil.FLAG_FAILD;
       }
       return CommonUtil.FLAG_SUCESS;
	}
	

	@Override
	public Integer getCount() {
		// TODO Auto-generated method stub
		BaseConditionVO baseConditionVO = new BaseConditionVO();
		return lecturerDao.getCount(baseConditionVO);
	}
	@Override
	public int lecturerDel(Integer lecturerId) {
		// TODO Auto-generated method stub
		try{
			 int state=0;
			lecturerDao.lecturerDel(lecturerId,state);
			
		}
		catch(Exception e){
			e.printStackTrace();
           return CommonUtil.FLAG_FAILD;
       }
       return CommonUtil.FLAG_SUCESS;
	}
	
    @Override
	public int lecturersDel(String lecturerIds) {
		// TODO Auto-generated method stub
    	try{
			lecturerDao.lecturersDel(lecturerIds);
			
		}
		catch(Exception e){
			e.printStackTrace();
          return CommonUtil.FLAG_FAILD;
      }
      return CommonUtil.FLAG_SUCESS;
	}

	/**
    * @return 
    * @see com.yz.center.service.iface.lecturer.LecturerService#getLecturers()
    */
    @Override
    public List<LecturerPo> getLecturers(String code){
        // TODO Auto-generated method stub
        return lecturerDao.getLecturers(code);
    }
    
    @Override
	public LecturerPo getLecturer(Integer lecturerId) {
		// TODO Auto-generated method stub
		return lecturerDao.getLecturer(lecturerId);
	}
	/**
    * @param courseId 
    * @see com.yz.center.service.iface.lecturer.LecturerService#delAllLecturer(java.lang.Integer)
    */
    @Override
    public void delAllLecturer(Integer courseId){
        // TODO Auto-generated method stub
        lecturerDao.delAllLecturer(courseId);
    }
	@Override
	public LecturerPo getlecturerByCourseId(Integer courseId) {
		// TODO Auto-generated method stub
		return lecturerDao.getlecturerByCourseId(courseId);
	}
    
	@Override
	public List<LecturerPo> findIndexLectures() {
		
		return lecturerDao.findIndexLectures();
	}
	
	/** 
	* Title: findMoreLecturerInfo
	* Description: 
	* @see com.yz.center.service.iface.lecturer.LecturerService#findMoreLecturerInfo(com.yz.center.model.vo.BaseConditionVO)  
	*/
	
	@Override
	public List<LecturerPo> findMoreLecturerInfo(BaseConditionVO baseConditionVO) {
		Integer total = lecturerDao.getCount( baseConditionVO);
		baseConditionVO.setTotalCount(total);
		List<LecturerPo> lecturerPos = lecturerDao.findMoreLecturerInfo(baseConditionVO);
		return lecturerPos;
	}
	@Override
	public PageBean getLecturersByCondition(PageBean pageBean,String name,String position) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("name", name);
		map.put("position", position);
		pageBean.params = map;
		List<LecturerPo> list = lecturerDao.getLecturersByCondition(pageBean);
		Integer totalPage= lecturerDao.getLecturersCountByCondition(pageBean);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		return pageBean;
	}

	
	/** 
	* Title: getlecturersByCourseId
	* Description: 
	* @see com.yz.center.service.iface.lecturer.LecturerService#getlecturersByCourseId(java.lang.Integer)  
	*/
	
	@Override
	public List<LecturerPo> getlecturersByCourseId(Integer courseId) {
		
		return lecturerDao.getlecturersByCourseId(courseId);
	}
   
	
}
