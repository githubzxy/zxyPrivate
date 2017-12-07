package com.yz.center.service.iface.myClass;

import java.util.List;

import com.yz.center.model.po.ClassPo;
import com.yz.center.model.po.GradePo;
import com.yz.center.model.vo.ClassForm;
import com.yz.center.util.common.PageBean;



public interface ClassService {
	public List<GradePo> getGradeList(Integer schoolId);
	public Integer addClass(ClassForm classForm);
	public PageBean getClassList(PageBean pageBean);
	public ClassForm getClassById(Integer classId);
	public Integer updateClass(ClassForm classForm);
	public ClassPo getclassByName(ClassForm classForm);
	public Integer delete(Integer classId);
	public Integer deleteSelected(Integer classIds[]);
	public Integer addClasses(List<ClassForm> classes);
	public GradePo getGradeIdByGradeName(String gradeName);
	public List<ClassPo> findallClass(Integer schoolId);
	
}
