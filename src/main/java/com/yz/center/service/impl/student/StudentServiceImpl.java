package com.yz.center.service.impl.student;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yz.center.dao.homeWork.HomeWorkDao;
import com.yz.center.dao.student.StudentDao;
import com.yz.center.model.po.GradePo;
import com.yz.center.model.po.LoginPo;
import com.yz.center.model.po.RolePo;
import com.yz.center.model.po.StudentPo;
import com.yz.center.model.po.UserPo;
import com.yz.center.model.vo.BaseConditionVO;
import com.yz.center.model.vo.ClassForm;
import com.yz.center.model.vo.StudentCourseVo;
import com.yz.center.model.vo.StudentCourseVo2;
import com.yz.center.model.vo.StudentForm;
import com.yz.center.model.vo.StudentList;
import com.yz.center.model.vo.StudentVo;
import com.yz.center.service.iface.student.StudentService;
import com.yz.center.util.BaseUtil;
import com.yz.center.util.CommonUtil;
import com.yz.center.util.common.PageBean;
 
@Service
public class StudentServiceImpl implements StudentService{
    @Resource
    StudentDao studentDao;
    @Resource
    private HomeWorkDao homeWorkDao;
	@Override
	public Integer addStudent(StudentForm studentAdd){
		if("".equals(studentAdd.getBirthday())){
			studentAdd.setBirthday(null);
		 }
		try{
			studentDao.addLoginInfo(studentAdd);
			studentDao.addUserInfo(studentAdd);
			studentDao.addStudentInfo(studentAdd);
			studentDao.addStudentClassRls(studentAdd);
		}catch(Exception e){
			e.printStackTrace();
            return CommonUtil.FLAG_FAILD;
		}	
         return CommonUtil.FLAG_SUCESS;
	}
	@Override
	public Integer delete(Integer studentId) {
		return studentDao.del(studentId);
	}
	@Override
	public Map<String, Object> getStudentById(Integer studentId) {
		Map<String, Object> map=new HashMap<String, Object>();
		StudentForm studentForm=studentDao.selectStudentById(studentId);
		ClassForm classForm=studentDao.selectClassById(studentId);
		map.put("studentForm", studentForm);
		map.put("classForm", classForm);
		map.put("classList", studentDao.getClassList(classForm.getGradeId(),1));
		return map;
	}
	@Override
	public Integer update(StudentForm studentForm,Date birthday) {
		Integer flag=1;
		LoginPo loginPo=new LoginPo();
		loginPo.setId(studentForm.getLoginId());
		loginPo.setLoginName(studentForm.getNumber());
		loginPo.setLoginPwd(studentForm.getLoginPwd());
		Integer f1=studentDao.updateLoginInfo(loginPo);
		
		
		UserPo userPo=new UserPo();
		userPo.setAvatar(studentForm.getAvatar());
		userPo.setBirthday(birthday);
		userPo.setEmail(studentForm.getEmail());
		userPo.setGender(studentForm.getGender());
		userPo.setId(studentForm.getUserId());
		userPo.setIdCard(studentForm.getIdCard());
		userPo.setInfo(studentForm.getInfo());
		userPo.setName(studentForm.getName());
		userPo.setNumber(studentForm.getNumber());
		userPo.setPhone(studentForm.getPhone());
	
		Integer f2=studentDao.updateUserInfo(userPo);
		
		
		StudentPo studentPo=new StudentPo();
		studentPo.setId(studentForm.getStudentId());
	    studentPo.setName(studentForm.getName());
	    studentPo.setNumber(studentForm.getNumber());
	    
	    studentPo.setClassId(studentForm.getClassId());
	    Integer f3=studentDao.updateStudentInfo(studentPo);
	  
		if(f1<1&&f2<1&&f3<1){
		 flag=0;
		}
		return flag;
	}
	@Override
	public PageBean getStudentList(PageBean pageBean,StudentVo student) {
		pageBean.params.put("student", student);
		Integer items=studentDao.countItems(pageBean);
		//pageBean.setTotalItem(items);
		pageBean.setTotalPage(items);
		//pageBean.setTotalPage((items + pageSize -1) / pageSize);
		List<StudentList> students = studentDao.selectStudentList(pageBean);
		pageBean.setList(students);
		return pageBean;
	}
	@Override
	public Integer deleteSelected(Integer[] studentIds) {
		Integer flag=1;
		for (Integer id : studentIds) {
			if(studentDao.del(id)<1){
				flag=0;
				break;
			}
		}
		return flag;
	}
	@Override
	public Integer resetUse(Integer studentId) {
		      return studentDao.resetUse(studentId);
		      
		
	}
	@Override
	public Integer resetLogOut(Integer studentId) {
		return studentDao.resetLogOut(studentId);
		
	}
	@Override
	public UserPo getuserBynumber(Integer schoolId,String number) {
		
		return studentDao.userBynumber(schoolId,number);
	}
	@Override
	public Integer addStus(List<StudentForm> students) {
		Integer flag=1;
		for(StudentForm studentForm:students){
			studentForm.setRoleId("student");
			Integer f=addStudent(studentForm);
			if(f==0){
				flag=0;
				break;
			}
		}
		return flag;
	}
	@Override
	public List<GradePo> getGradeList(Integer schoolId) {
	      
		return studentDao.getGradeList(schoolId);
	}
	@Override
	public List<ClassForm> getClassList(Integer gradeId, Integer schoolId) {
	
		return studentDao.getClassList(gradeId, schoolId);
	}
	@Override
	public Integer getClassIdByGradeAndClassName(String gradeName, String className) {
		
		return studentDao.getClassIdByGradeAndClassName(gradeName, className);
	}
	@Override
	public List<Integer> findIdByNums(List<Integer> studentNums,Integer schoolId) {
		List<Integer> studentIds=new ArrayList<Integer>();
		for(Integer number:studentNums){
			Integer studentId=studentDao.findIdByNums(number,schoolId);
			studentIds.add(studentId);
		}
		return studentIds;
	}

	@Override
	public PageBean getStudentByclassId(Integer classId, PageBean pageBean) {
		Integer totalCount = studentDao.selectPageCount(classId,pageBean);
		pageBean.setTotalPage(totalCount);
		List<StudentPo> studentPos = studentDao.getStudentByclassId(classId,pageBean);
		pageBean.setList(studentPos);
		return pageBean;
	}
	@Override
	public Integer[] getAllStudentByclassId(Integer classId) {
		// TODO Auto-generated method stub
		return studentDao.getAllStudentByclassId(classId);
	}
	
	/** 
	* Title: findStudentId
	* Description: 
	* @see com.yz.center.service.iface.student.StudentService#findStudentId()  
	*/
	
	@Override
	public Integer findStudentId(Integer userId) {
		Integer studentId = studentDao.findStudentId(userId);
		
		return studentId;
	}
	
	/** 
	* Title: findMycourse
	* Description: 
	* @see com.yz.center.service.iface.student.StudentService#findMycourse(com.yz.center.model.vo.BaseConditionVO)  
	*/
	
	@Override
	public List<StudentCourseVo> findMycourse(BaseConditionVO baseConditionVO) {
		Integer studentId = this.findStudentId(baseConditionVO.getUserId());
		List<StudentCourseVo> studentCourseVos = studentDao.findMycourse(studentId);
		System.out.println(studentCourseVos+"学生选课信息");
		for(int i = 0;i<studentCourseVos.size();i++){
			Integer openId = studentCourseVos.get(i).getOpenId();
			Integer studentCourseId =studentCourseVos.get(i).getStudentCourseId();
			//Integer studentId = studentCourseVos.get(i).getStudentId();
			StudentCourseVo studentCourseVo = studentCourseVos.get(i);
			//查询出exameTotalScore

			Integer exameTotalScore = studentCourseVo.getExameCount()*100;
			studentCourseVo.setExameTotalScore(studentCourseVo.getExameCount()*100);
			//查询出videoTotalCount
			Integer videoTotalCount = studentDao.findVideoTotalCount(openId);
			studentCourseVo.setVideoTotalCount(videoTotalCount);
			
			//查询出paperTotalScore

			/*Integer paperTotalScore = studentCourseVo.getPaperCount()*100;
			studentCourseVo.setPaperTotalScore(paperTotalScore);*/
			
			

			
			//查询我的myExameTotalScore
			List<Integer> allmyExameTotalScore  = studentDao.findmyExameTotalScore(openId,studentId);
			Integer myExameTotalScore = 0;
			if (allmyExameTotalScore.size()!=0) {
				for(int c=0;c<allmyExameTotalScore.size();c++){
					myExameTotalScore+=allmyExameTotalScore.get(c);
				}

			}
				
			/*//查询出我的myPaperTotalScore
			List<Integer> allmyPaperTotalScore  = studentDao.findmyPaperTotalScore(openId,studentId);
			Integer myPaperTotalScore = 0;
			if (allmyPaperTotalScore.size() != 0) {
				for(int c=0;c<allmyPaperTotalScore.size();c++){
					myPaperTotalScore+=allmyPaperTotalScore.get(c);
				}
			}*/
			//查询出我的myPaperTotalCount
			Integer myPaperTotalCount = homeWorkDao.getCount(studentId, openId);
			studentCourseVo.setMypaperCount(myPaperTotalCount);		
		
					
				
			//百分制算比例后的各项分数
			float myExameTotalScore2 = 0;
			if (studentCourseVo.getContainExamine() !=null&&studentCourseVo.getContainExamine()==1) {
				if (exameTotalScore!=null&&exameTotalScore!=0&&myExameTotalScore!=null) {
					if ((float)myExameTotalScore/(float)exameTotalScore>1) {
						myExameTotalScore2 = 
								 (float)studentCourseVo.getExaminPercent()*1;
					}else {
						 myExameTotalScore2 = 
								 (float)studentCourseVo.getExaminPercent()*(float)myExameTotalScore/(float)exameTotalScore;
					
					}
					System.out.println("我的考试分数："+myExameTotalScore2);
					
				}
				studentCourseVo.setMyExameTotalScore(myExameTotalScore2);
			}
			System.out.println(myExameTotalScore2);
			float myPaperTotalScore2 = 0;
			/*if (studentCourseVo.getContainTask() != null&&studentCourseVo.getContainTask()==1) {
				if (paperTotalScore!=null&&paperTotalScore!=0&&myPaperTotalScore!=null) {
					if ((float)myPaperTotalScore/(float)paperTotalScore>1) {
						myPaperTotalScore2 = 
								(float)studentCourseVo.getPaperPercent()*1;
					}else {
						myPaperTotalScore2 = 
								(float)studentCourseVo.getPaperPercent()*(float)myPaperTotalScore/(float)paperTotalScore;
						
					}
					
				}
				studentCourseVo.setMyPaperTotalScore(myPaperTotalScore2);
			}*/
			if (studentCourseVo.getPaperCount()!=null&&studentCourseVo.getPaperCount()!=0&&studentCourseVo.getMypaperCount()!=null&&studentCourseVo.getMypaperCount()!=0) {
				if (((float)studentCourseVo.getMypaperCount()/(float)studentCourseVo.getPaperCount())>=1) {
					myPaperTotalScore2 = 
							(float)studentCourseVo.getPaperPercent()*1;
				}else{
				myPaperTotalScore2 = 
						(float)studentCourseVo.getPaperPercent()*(float)studentCourseVo.getMypaperCount()/(float)studentCourseVo.getPaperCount();
				}
			}
			System.out.println("我的作业分数："+myPaperTotalScore2);
			float myVideoTotalScore2 = 0;
			if (studentCourseVo.getContainVideo() !=null&&studentCourseVo.getContainVideo()==1) {
				if (studentCourseVo.getVideoTotalCount()!=null&&studentCourseVo.getVideoTotalCount()!=null&&studentCourseVo.getMyVideoTotalCount()!=null) {
					if ((float)studentCourseVo.getMyVideoTotalCount()/(float)studentCourseVo.getVideoTotalCount()>1) {
						myVideoTotalScore2 = 
								(float)studentCourseVo.getVideoPercent()*1;
					}else {
						myVideoTotalScore2 = 
								(float)studentCourseVo.getVideoPercent()*(float)studentCourseVo.getMyVideoTotalCount()/(float)studentCourseVo.getVideoTotalCount();
						
					}
					
				}
				studentCourseVo.setMyVideoTotalScore(myVideoTotalScore2);
			}
			System.out.println("我的视频分数："+myVideoTotalScore2);
			float myDiscussTotalScore2 = 0;
			if (studentCourseVo.getContainDiscuss()!=null&&studentCourseVo.getContainDiscuss()==1) {
				if (studentCourseVo.getDiscussTotalCount()!=null&&studentCourseVo.getDiscussTotalCount()!=0&&studentCourseVo.getMyDiscussTotalCount()!=null) {
					if ((float)studentCourseVo.getMyDiscussTotalCount()/(float)studentCourseVo.getDiscussTotalCount()>1) {
						myDiscussTotalScore2 = 
								(float)studentCourseVo.getDiscussPercent()*1;
					}else {
						 myDiscussTotalScore2 = 
									(float)studentCourseVo.getDiscussPercent()*(float)studentCourseVo.getMyDiscussTotalCount()/(float)studentCourseVo.getDiscussTotalCount();	
						 
					}
					
				}
				studentCourseVo.setMyDiscussTotalScore(myDiscussTotalScore2);
			}
			System.out.println("我的讨论分数："+myDiscussTotalScore2);
			float myFinalScore = myExameTotalScore2+myPaperTotalScore2+myVideoTotalScore2+myDiscussTotalScore2 ;
			
			studentCourseVo.setMyFinalScore(myFinalScore);
			if (myFinalScore>=studentCourseVo.getPassScore()) {
				studentCourseVo.setState(1);
			}
			if (myFinalScore<studentCourseVo.getPassScore()) {
				studentCourseVo.setState(0);
			}
			//更新成绩表
			studentDao.updateScore(studentCourseVo);
			
		}
		
		return studentCourseVos;
	}
	
	/** 
	* Title: findMyPasscourse
	* Description: 
	* @see com.yz.center.service.iface.student.StudentService#findMyPasscourse(java.util.List)  
	*/
	
	@Override
	public List<StudentCourseVo> findMyPasscourse(List<StudentCourseVo> studentCourseVos) {
		

		
		
		//xuan出所有的通过的课程
		List<StudentCourseVo> allPassCourses= new ArrayList<StudentCourseVo>();
		for(int i = 0;i<studentCourseVos.size();i++){
			StudentCourseVo studentCourseVo = studentCourseVos.get(i);
			if (studentCourseVo.getState()!=null&&studentCourseVo.getState()==1) {
				allPassCourses.add(studentCourseVo);
			}
		}
		return allPassCourses;
	}
	
	public List<Integer> findExameScore(Integer openId){
		
		return studentDao.findExameTotalScore(openId);
		
	}
	
	
	@Override
	public List<StudentCourseVo> findMyUnPasscourse(List<StudentCourseVo> studentCourseVos) {
			//计算出除所有的通过的课程
			List<StudentCourseVo> allUnPassCourses= new ArrayList<StudentCourseVo>();
			for(int i = 0;i<studentCourseVos.size();i++){
				if (studentCourseVos.get(i).getState()!=null&&studentCourseVos.get(i).getState()==0) {
					allUnPassCourses.add(studentCourseVos.get(i));
				}
			}
		return allUnPassCourses;
	}
	
	/** 
	* Title: findMyinfo
	* Description: 
	* @see com.yz.center.service.iface.student.StudentService#findMyinfo(java.lang.Integer)  
	*/
	
	@Override
	public StudentForm findMyinfo(Integer userId) {
		StudentForm studentForm = studentDao.findMyinfo(userId);
		return studentForm;
	}
	
	@Override
	public List<StudentCourseVo2> studentOfCourseStatistics(BaseConditionVO baseConditionVO,
			StudentCourseVo2 studentCourseVo2) {
		baseConditionVO.setPageSize(5);
		Integer count = studentDao.findpageCount(baseConditionVO,studentCourseVo2);
		baseConditionVO.setTotalCount(count);
		Integer videoTotalCount = studentDao.findVideoTotalCount(studentCourseVo2.getOpenId());
		
		if (studentCourseVo2.getMinMyvideoPercent()!=null&&studentCourseVo2.getMaxvideoCount()!=null) {
			Integer videoMin = videoTotalCount*studentCourseVo2.getMinMyvideoPercent()/100;
			studentCourseVo2.setMinvideoCount(videoMin);
			Integer videoMax = videoTotalCount*studentCourseVo2.getMaxvideoCount()/100;
			studentCourseVo2.setMaxvideoCount(videoMax);
		}
		List<StudentCourseVo2> studentCourseVo2s = studentDao.studentOfCourseStatistics(baseConditionVO,studentCourseVo2);
		System.out.println(studentCourseVo2s);
		//查询出exameTotalScore
		List<Integer> allExameScore = studentDao.findExameTotalScore(studentCourseVo2.getOpenId()); 
		
		List<Integer> allpaperTotalScore =studentDao.findPaperTotalScore(studentCourseVo2.getOpenId());
		
		
		for(StudentCourseVo2 studentCourseVo3:studentCourseVo2s){
			Integer myvideoPercent = studentCourseVo3.getVideoCount()/videoTotalCount*100;
			Integer myexamePercent = studentCourseVo3.getExamineCount()/allExameScore.size()*100;
			Integer myTaskPercent = studentCourseVo3.getTaskCount()/allpaperTotalScore.size()*100;
			Integer mydiscussPercent = studentCourseVo3.getDiscussCount()/studentCourseVo3.getOldDiscussCount()*100;
			studentCourseVo3.setMyvideoPercent(myvideoPercent);
			studentCourseVo3.setMyexamePercent(myexamePercent);
			studentCourseVo3.setMyTaskPercent(myTaskPercent);
			studentCourseVo3.setMydiscussPercent(mydiscussPercent);
		}
		return studentCourseVo2s;
	}
	/** 
	* Title: findMycoursePro
	* Description: 
	* @see com.yz.center.service.iface.student.StudentService#findMycoursePro(com.yz.center.model.vo.BaseConditionVO)  
	*/
	
	@Override
	public List<StudentCourseVo> findMycoursePro(BaseConditionVO baseConditionVO) {
		
		Integer studentId = this.findStudentId(baseConditionVO.getUserId());
		Integer count = studentDao.findMycourseProCount(studentId);
		baseConditionVO.setTotalCount(count);
		//查看学生选课基本信息
		List<StudentCourseVo> studentCourseVos = studentDao.findMycourse2(studentId,baseConditionVO);
		
		for(int i = 0;i<studentCourseVos.size();i++){
			Integer openId = studentCourseVos.get(i).getOpenId();
			Integer studentCourseId =studentCourseVos.get(i).getStudentCourseId();
			StudentCourseVo studentCourseVo = studentCourseVos.get(i);
			
			//查询我的myExameTotalcount
			Integer allmyExameTotalCount  = studentDao.findmyExameTotalCount(openId,studentId);
			studentCourseVo.setMyexamCount(allmyExameTotalCount);
			
			//查询出我的myPaperTotalCount
			Integer myPaperTotalCount = homeWorkDao.getCount(studentId, openId);
			studentCourseVo.setMypaperCount(myPaperTotalCount);
			
			//计算进度
		
			
		//百分制算比例后的各项分数
		float myExameTotalScore2 = 0;
		if (studentCourseVo.getExameCount()!=null&&studentCourseVo.getExameCount()!=0&&studentCourseVo.getMyexamCount()!=null&&studentCourseVo.getMyexamCount()!=0) {
			if (((float)studentCourseVo.getMyexamCount()/(float)studentCourseVo.getExameCount())>=1) {
				myExameTotalScore2 = 
						 (float)studentCourseVo.getExaminPercent()*1;
			}else{
			 myExameTotalScore2 = 
					 (float)studentCourseVo.getExaminPercent()*(float)studentCourseVo.getMyexamCount()/(float)studentCourseVo.getExameCount();
			}
		}
		System.out.println("考试"+myExameTotalScore2);
		float myPaperTotalScore2 = 0;
		if (studentCourseVo.getPaperCount()!=null&&studentCourseVo.getPaperCount()!=0&&studentCourseVo.getMypaperCount()!=null&&studentCourseVo.getMypaperCount()!=0) {
			if (((float)studentCourseVo.getMypaperCount()/(float)studentCourseVo.getPaperCount())>=1) {
				if(studentCourseVo.getPaperPercent()!=null){
				myPaperTotalScore2 = 
						(float)studentCourseVo.getPaperPercent()*1;
				}
			}else{
				if(studentCourseVo.getPaperPercent()!=null&&studentCourseVo.getMypaperCount()!=null&&studentCourseVo.getPaperCount()!=null){
			myPaperTotalScore2 = 
					(float)studentCourseVo.getPaperPercent()*(float)studentCourseVo.getMypaperCount()/(float)studentCourseVo.getPaperCount();
				}
			}
		}
		System.out.println("作业"+myPaperTotalScore2);
		float myVideoTotalScore2 = 0;
		if (studentCourseVo.getVideoTotalCount()!=null&&studentCourseVo.getVideoTotalCount()!=null&&studentCourseVo.getMyVideoTotalCount()!=null&&studentCourseVo.getMyVideoTotalCount()!=0) {
			if (((float)studentCourseVo.getMyVideoTotalCount()/(float)studentCourseVo.getVideoTotalCount())>=1) {
				if(studentCourseVo.getVideoPercent()!=null){
				myVideoTotalScore2 = 
						(float)studentCourseVo.getVideoPercent()*1;
				}
			}else{
				if(studentCourseVo.getVideoPercent()!=null&&studentCourseVo.getMyVideoTotalCount()!=null&&studentCourseVo.getVideoTotalCount()!=null){
			myVideoTotalScore2 = 
					(float)studentCourseVo.getVideoPercent()*(float)studentCourseVo.getMyVideoTotalCount()/(float)studentCourseVo.getVideoTotalCount();
			}
			}
		}
		System.out.println("视频"+myVideoTotalScore2);
		float myDiscussTotalScore2 = 0;
		if (studentCourseVo.getDiscussTotalCount()!=null&&studentCourseVo.getDiscussTotalCount()!=0&&studentCourseVo.getMyDiscussTotalCount()!=null&&studentCourseVo.getMyDiscussTotalCount()!=0) {
			if(studentCourseVo.getMyDiscussTotalCount()<=studentCourseVo.getDiscussTotalCount()){
			 if(studentCourseVo.getDiscussPercent()!=null&&studentCourseVo.getMyDiscussTotalCount()!=null&&studentCourseVo.getDiscussTotalCount()!=null)
				myDiscussTotalScore2 = 
						(float)studentCourseVo.getDiscussPercent()*(float)studentCourseVo.getMyDiscussTotalCount()/(float)studentCourseVo.getDiscussTotalCount();	
			}else {
				if(studentCourseVo.getDiscussPercent()!=null){
				myDiscussTotalScore2 = 
						(float)studentCourseVo.getDiscussPercent()*1;
				}
			}
		}
		System.out.println("讨论"+myDiscussTotalScore2);
		float myFinalScore = myExameTotalScore2+myPaperTotalScore2+myVideoTotalScore2+myDiscussTotalScore2 ;
		studentCourseVo.setCoursePro(myFinalScore);
		System.out.println("最终分数"+myFinalScore);
			
		}
		return studentCourseVos;
	}
	
	/** 
	* Title: getAllStudentBySchoolId
	* Description: 
	* @see com.yz.center.service.iface.student.StudentService#getAllStudentBySchoolId(java.lang.Integer)  
	*/
	
	@Override
	public Integer[] getAllStudentBySchoolId(Integer schoolId) {
		// TODO Auto-generated method stub
		return studentDao.getAllStudentBySchoolId(schoolId);
	}
	@Override
	public int validate(StudentForm studentForm) {
		// TODO Auto-generated method stub
				if(!studentForm.getNumber().equals(studentForm.getBeforeNumber())&&studentDao.validate(studentForm)>0){
					return CommonUtil.FLAG_FAILD;  //学生学号已存在
				}
				return CommonUtil.FLAG_SUCESS;
			}
	
}