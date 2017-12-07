package com.yz.center.service.impl.myClass;


import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yz.center.dao.ClassDao;
import com.yz.center.model.po.ClassPo;
import com.yz.center.model.po.GradePo;
import com.yz.center.model.vo.ClassForm;
import com.yz.center.service.iface.myClass.ClassService;
import com.yz.center.util.common.PageBean;


@Service("classService")
public class ClassServiceImpl implements ClassService {
   @Resource
   private ClassDao classDao;
	@Override
	public List<GradePo> getGradeList(Integer schoolId) {
		return classDao.getGradeList(schoolId);
	}
	@Override
	public Integer addClass(ClassForm classForm) {
		classForm.setCreateDate(new Date());
		classForm.setStateDate(new Date());
		return classDao.addClass(classForm);
		
	}
	@Override
	public PageBean getClassList(PageBean pageBean) {
		
		Integer count=classDao.selectClassCount(pageBean);
		pageBean.setTotalPage(count);  
		List<ClassPo> classes = classDao.selectClassList(pageBean);
		pageBean.setList(classes);
		return pageBean;
		
	}
	@Override
	public ClassForm getClassById(Integer classId) {
		return classDao.selectClassById(classId);
	}
	@Override
	public Integer updateClass(ClassForm classForm) {
		return classDao.updateClassInfo(classForm);
	}
	@Override
	public ClassPo getclassByName(ClassForm classForm) {
		return classDao.classByName(classForm);
	}
	@Override
	public Integer delete(Integer classId) {
		
		return classDao.del(classId);
	}
	@Override
	public Integer deleteSelected(Integer classIds[]){
		Integer f=0;
		try {
		 for(Integer id:classIds){
			  f=classDao.del(id);
			  if(f<1){
					throw new Exception();
				 }
		 }
		 return 1;
		} catch (Exception e) {
			e.printStackTrace();
		return 0;
		}
	
	
	}

	@Override
	public Integer addClasses(List<ClassForm> classes) {
		Integer flag=1;
		for(ClassForm classForm:classes){
			Integer f=addClass(classForm);
			if(f<1){
				flag=0;
				break;
			}
		}
		return flag;
		
	}
	@Override
	public GradePo getGradeIdByGradeName(String gradeName) {
		return classDao.getGradeIdByGradeName(gradeName);
	}
	@Override
	public List<ClassPo> findallClass(Integer schoolId) {
		return classDao.findallClass(schoolId);
	}

}
