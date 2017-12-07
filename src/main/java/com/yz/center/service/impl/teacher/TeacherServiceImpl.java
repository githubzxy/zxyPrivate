package com.yz.center.service.impl.teacher;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.model.po.teacher.TeacherPo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.model.vo.BaseConditionVO;
import com.yz.center.model.vo.teacher.SelTeacherForm;
import com.yz.center.service.iface.teacher.TeacherService;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yz.center.dao.teacher.TeacherDao;
import com.yz.center.model.form.TeacherForm;
import com.yz.center.util.BaseUtil;
import com.yz.center.util.CommonUtil;
import com.yz.center.util.ReadExcel;
import com.yz.center.util.ReadExcelOfTeacher;
import com.yz.center.util.Static;
import com.yz.center.util.common.PageBean;

@Service("teacherService")
public class TeacherServiceImpl implements TeacherService{
	 @Resource
	 TeacherDao teacherDao;

	 //添加教师
	 @Override
		public int teacherAdd(TeacherForm teacherForm) {
		 if("".equals(teacherForm.getBirthday())){
			 teacherForm.setBirthday(null);
		 }
		
			try{
				 teacherDao.loginAdd(teacherForm); 
				 teacherDao.userAdd(teacherForm);
				 teacherDao.teacherAdd(teacherForm);
				
			}
			catch(Exception e){
				e.printStackTrace();
	            return CommonUtil.FLAG_FAILD;
	        }
	        return CommonUtil.FLAG_SUCESS;
			
		}



	@Override
	public List<UserPo> getTeacher() {
		// TODO Auto-generated method stub
		 List<UserPo> userPo = teacherDao.getTeacher();
		return userPo;
	}



	@Override
	public UserPo getTeacherById(Integer userId) {
		 UserPo userPo = teacherDao.getTeacherById(userId);
		return userPo;
	}



	@Override
	public int teacherUpdate(TeacherForm teacherForm) {
	
		if("".equals(teacherForm.getBirthday())){
			 teacherForm.setBirthday(null);
		 }
		if(!teacherForm.getBeforeNumber().equals(teacherForm.getNumber())&&teacherDao.getUserBynumberAndSchoolId(teacherForm.getNumber(), teacherForm.getSchoolId())!=null){
			 return 2;  //教师工号已存在
		 }
			 try{
				 teacherDao.userUpdate(teacherForm);
				 teacherDao.loginUpdate(teacherForm); 
				 teacherDao.teacherUpdate(teacherForm);
				
			}
			catch(Exception e){
				e.printStackTrace();
	           return CommonUtil.FLAG_FAILD;
	       }
	       return CommonUtil.FLAG_SUCESS;
		}
		
	


	@Override
	public int validate(TeacherForm teacherForm) {
		// TODO Auto-generated method stub
		if(!teacherForm.getNumber().equals(teacherForm.getBeforeNumber())&&teacherDao.validate(teacherForm)>0){
		
			return CommonUtil.FLAG_FAILD;  //教师工号已存在
		}
		return CommonUtil.FLAG_SUCESS;
	}



	//删除，修改状态state 1-->0 
	@Override
	public int teacherDelete(Integer userId) {
		// TODO Auto-generated method stub
		try{
		
		 UserPo userPo = teacherDao.getUserById(userId);
		 userPo.setState(0);
		teacherDao.userDelete(userPo);
			
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("出错了");
          return CommonUtil.FLAG_FAILD;
      }
      return CommonUtil.FLAG_SUCESS;
	}



	@Override
	public int updateLoginForPwd(Integer loginId, String loginPwd) {
		// TODO Auto-generated method stub
		try{
			
			 teacherDao.updateLoginForPwd(loginId, loginPwd);
				
			}
			catch(Exception e){
				e.printStackTrace();
				System.out.println("出错了");
	          return CommonUtil.FLAG_FAILD;
	      }
	      return CommonUtil.FLAG_SUCESS;
		}



	@Override
	public PageBean getTeacherByCondition(PageBean pageBean, SelTeacherForm teacher) {
		pageBean.params.put("teacher", teacher);
		Integer count = teacherDao.getCountByCondition(pageBean);
		pageBean.setTotalPage(count);
		List<UserPo> userPo = teacherDao.getTeacherByCondition(pageBean);
		pageBean.setList(userPo);
		return pageBean;
	}

	@Override
	public UserPo getUserBynumberAndSchoolId(String number,Integer schoolId) {
		// TODO Auto-generated method stub
		UserPo userPo = teacherDao.getUserBynumberAndSchoolId(number,schoolId);
		return userPo;
	}


	@Override
	public String importTeacher(MultipartFile file, HttpServletRequest request) {
		// 文件保存路径  
		String fileDir = request.getSession().getServletContext().getRealPath("/") + "upload/"; 
		File file1=new File(fileDir);
		String matchEmail="^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
		//String matchIdCard="^(\\d{15}$|^\\d{18}$|^\\d{17}(\\d|X|x))$";
		//String matchMobile="^[1][358][0-9]{9}$";
		try { 
            	if  (!file1.exists())   
            	{   
            		System.out.println("//不存在");
            		file1.mkdirs(); 
            	} 
            	String filePath=fileDir+new Date().getTime();
            	// 转存文件  
            	file.transferTo(new File(filePath));
      	        List<TeacherForm> teachers=ReadExcelOfTeacher.readXls(filePath);
               for(TeacherForm teacherForm:teachers){
            	   String name=teacherForm.getName();
            	   String number=teacherForm.getNumber();
            	   String pwd=teacherForm.getLoginPwd();
            	   String email=teacherForm.getEmail();
            	   String mobile=teacherForm.getMobile();
            	   Integer gender=teacherForm.getGender();
            	   SchoolPo school = (SchoolPo)request.getSession().getAttribute(Static.SCHOOL_SESSION);
				   teacherForm.setSchoolId(school.getSchoolId());
				   teacherForm.setRoleCode("teacher");
				   Integer schoolId = teacherForm.getSchoolId();
            	   if(name==null){
            		   return "0|姓名不能为空";
            	   }else if(number==null){
            		   return "0|教工号不能为空";
            	   }else if(teacherDao.getUserBynumberAndSchoolId(number, schoolId)!=null){
            		   return "0|工号为"+number+"用户已存在";
            	   }else if(pwd == null){
            		   return "0|密码不能空";
            	   }else if(email==null){
            		   return "0|邮箱不能为空";
            	   }else if(!email.matches(matchEmail)){
            		   return "0|邮箱格式不正确";
            	   }else if(mobile==null){
            		   return "0|电话号码不能为空";
            	   }else if (gender==null) {
            		   return "0|性别不能为空且必须是男或女";
				   }
            	 teacherDao.loginAdd(teacherForm); 
  				 teacherDao.userAdd(teacherForm);
  				 teacherDao.teacherAdd(teacherForm);
         
               }
               return "1|导入成功";
            } catch (Exception e) {
                e.printStackTrace();  
                return "0|导入失败";
            }  
		
	}




	@Override
	public PageBean getTeacherByclassId(Integer classId, PageBean pageBean,Integer schoolId) {
		pageBean.setSchoolId(schoolId);
		Integer totalCount = teacherDao.selectPageCount(classId,pageBean);
		pageBean.setTotalPage(totalCount);
		List<TeacherPo> teacherPos = teacherDao.getTeacherByclassId(classId,pageBean);
		pageBean.setList(teacherPos);
		return pageBean;
	}



	@Override
	public Integer[] getAllTeacherByclassId(Integer classId) {
		// TODO Auto-generated method stub
		return teacherDao.getAllTeacherByclassId(classId);
	}



	
	/** 
	* Title: getAllTeacher
	* Description: 
	* @see com.yz.center.service.iface.teacher.TeacherService#getAllTeacher(java.lang.Integer)  
	*/
	
	@Override
	public Integer[] getAllTeacher(Integer schoolId) {
		// TODO Auto-generated method stub
		return teacherDao.getAllTeacher(schoolId);
	}

	}



	

	
	
	
	 
