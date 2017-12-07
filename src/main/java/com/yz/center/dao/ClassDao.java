package com.yz.center.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yz.center.model.po.ClassPo;
import com.yz.center.model.po.GradePo;
import com.yz.center.model.vo.ClassForm;
import com.yz.center.util.common.PageBean;

@Repository
public interface ClassDao {
     public List<GradePo> getGradeList(Integer schoolId);
     public Integer addClass(ClassForm classForm);
     public List<ClassPo> selectClassList(PageBean pageBean);
     public Integer selectClassCount(PageBean pageBean);
     public ClassForm selectClassById(Integer classId);
     public Integer updateClassInfo(ClassForm classForm);
     public ClassPo classByName(ClassForm classForm);
     public Integer del(Integer classId);
     public GradePo getGradeIdByGradeName(String gradeName);
	public List<ClassPo> findallClass(Integer schoolId);
}
