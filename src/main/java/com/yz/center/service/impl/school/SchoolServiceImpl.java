package com.yz.center.service.impl.school;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yz.center.dao.school.SchoolDao;
import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.service.iface.school.SchoolService;
import com.yz.center.util.BaseUtil;
import com.yz.center.util.CommonUtil;
import com.yz.center.util.common.PageBean;


/**  
* @Description: 学校业务实现
* @author: 
* @date: 2017年1月5日 下午4:01:24 
* @version V1.0   
*/
@Service("schoolService")
public class SchoolServiceImpl implements SchoolService{
 @Resource
 private SchoolDao schoolDao;
	@Override
	public int schoolAdd(SchoolPo schoolPo) {
		schoolPo.setCreateDate(new Date());  //设置创建时间
		schoolPo.setIsUsed(1);       //设置默认为可用状态 1：可用，0：注销
		schoolPo.setState(1);		 
		try{
			schoolDao.schoolAdd(schoolPo);
		}
		catch(Exception e){
			e.printStackTrace();
           return CommonUtil.FLAG_FAILD;
       }
       return CommonUtil.FLAG_SUCESS;
		
	}
	@Override
	public List<SchoolPo> getSchoolByState() {
		List<SchoolPo> schoolList = schoolDao.getSchoolByState();
		return schoolList;
	}
	
	@Override
	public SchoolPo getSchoolBySchoolId(Integer schoolId) {
		
		SchoolPo schoolPo = schoolDao.getSchoolBySchoolId(schoolId);
		return schoolPo;
	}
	@Override
	public int schoolUpdate(SchoolPo schoolPo) {
		try{
			schoolDao.schoolUpdate(schoolPo);
		}
		catch(Exception e){
			e.printStackTrace();
			return CommonUtil.FLAG_FAILD;
       }
       return CommonUtil.FLAG_SUCESS;
	}
	@Override
	public int deleteSchoolById(String idStr) {
		String[] ids = idStr.split(",");
	   int flag = schoolDao.deleteSchoolById(ids);
	   if(flag > 0){
		   return CommonUtil.FLAG_SUCESS;
	   }
       return CommonUtil.FLAG_FAILD;
	}
	@Override
	public int updateSchoolByIdAndIsUsed(Integer schoolId, Integer isUsed) {
		try{
			schoolDao.updateSchoolByIdAndIsUsed(schoolId, isUsed);
		}
		catch(Exception e){
			e.printStackTrace();
           return CommonUtil.FLAG_FAILD;
       }
       return CommonUtil.FLAG_SUCESS;
	}
	
	
	@Override
	public PageBean getSchoolByCondition(PageBean pageBean) {
		int count = schoolDao.getCountByCondition(pageBean.getKeyWords());
		pageBean.setTotalPage(count);
		List<SchoolPo> schools = schoolDao.getSchoolByCondition(pageBean);
		pageBean.setList(schools);
		return pageBean;
	}
	
	@Override
	public Integer getCountByCondition(String schoolName) {
		try {
			schoolDao.getCountByCondition(schoolName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return schoolDao.getCountByCondition(schoolName);
	}
	
	@Override
	public SchoolPo findSchoolByUrl(String url) {
		return schoolDao.selectSchoolByUrl(url);
	}
	
}
