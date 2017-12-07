package com.yz.center.service.impl.course;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.druid.sql.dialect.oracle.ast.stmt.OracleSelectRestriction.ReadOnly;
import com.yz.center.dao.course.CourseDao;
import com.yz.center.dao.course.OpenCourseDao;
import com.yz.center.model.po.course.OpenCoursePo;
import com.yz.center.model.po.course.StudentCoursePo;
import com.yz.center.model.vo.BaseConditionVO;
import com.yz.center.model.vo.StudentForm;
import com.yz.center.model.vo.course.OpenCourseVo;
import com.yz.center.service.iface.course.OpenCourseService;
import com.yz.center.util.CommonUtil;
import com.yz.center.util.common.PageBean;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年11月17日 下午2:02:49 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
@Service("openService")
public class OpenCourseServiceImpl implements OpenCourseService{
	
	@Resource
	private OpenCourseDao openCourseDao;
	@Resource
    private CourseDao courseDao;


	@Override
	public Integer adds(OpenCoursePo openCoursePo,Integer[] baseCourseIds,String[] baseName,Integer schoolId) {
		openCoursePo.setSchoolId(schoolId);
		List<OpenCoursePo>	  openCoursePos = new ArrayList<OpenCoursePo>();
		Integer sort = openCourseDao.selectSort(1);
		for (int i = 0; i < baseCourseIds.length; i++) {
			OpenCoursePo openCoursePo2 = new OpenCoursePo(openCoursePo);
			openCoursePo2.setCourseId(baseCourseIds[i]);
			/*courseDao.updateVideoCount(baseCourseIds[i]);*/
			openCoursePo2.setCourseName(openCoursePo.getCourseName()+baseName[i]);
			
			openCoursePo2.setSort(++sort);
			openCoursePos.add(openCoursePo2);
		}
		
			openCourseDao.adds(openCoursePos);
			for(int b:baseCourseIds){
				courseDao.updateVideoCount(b);
			}
		return 1;
	}

	@Override
	public Integer update(OpenCoursePo openCoursePo) {
		Integer flag = openCourseDao.update(openCoursePo);
		courseDao.updateVideoCount(openCoursePo.getCourseId());
		return flag;
	}

	@Override
	public Integer deleteById(Integer opencourseId) {
		Integer flag = openCourseDao.deleteById(opencourseId);
		return flag;
	}

	@Override
	public Integer deleteByIds(Integer openCourseIds[]) {
		Integer flag = openCourseDao.deleteByIds(openCourseIds);
		return flag;
	}

	@Override
	public PageBean findOpenCourses(PageBean pageBean) {
		int totalPage = openCourseDao.selectPageCount(pageBean);
		pageBean.setTotalPage(totalPage);
		List<OpenCourseVo> openCourseVos = openCourseDao.selectOpenCourses(pageBean);
		pageBean.setList(openCourseVos);
		return pageBean;
	}

	@Override
	public OpenCoursePo findByopenId(Integer openId) {
		OpenCoursePo openCoursePo = openCourseDao.findByopenId(openId);
		return openCoursePo;
	}

	/**
	 * 结课，将state改为2
	 * @param openId
	 * @return flag 
	 */
	@Override
	public Integer overCourse(Integer openId) {
		Integer flag = openCourseDao.overCourse(openId);
		return flag;
	}

	@Override
	public Integer selectSort(Integer schoolId) {
		Integer count = openCourseDao.selectSort(schoolId);
		return count;
	}

	@Override
	public Integer importStudents(Integer openId, List<Integer> studentIds) {
		
		try{
		if (studentIds!=null) {
			for(Integer id:studentIds){
				if(id!=null){
			Integer flag=addCourseStudent(openId, id);
			if(flag<1){
				throw new Exception();
			}
				}else{
					throw new Exception();
				}
			}
		}else{
			throw new Exception();
		}
		}catch(Exception e){
			return CommonUtil.FLAG_FAILD;
		}
			
		return CommonUtil.FLAG_SUCESS;
		
		
	}
	
	
	/** 
	* Title: addCourseStudent
	* Description: 
	* @see com.yz.center.service.iface.course.OpenCourseService#addCourseStudent()  
	*/
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public Integer addCourseStudent(Integer openId,Integer studentId) {
		//将学生选课数据添加到student_course和studyStudent
		Integer studentCourseId = openCourseDao.selectStudentCourseId(openId,studentId);
		try{
			if (studentCourseId !=null) {
				  openCourseDao.updateStudentCourse(studentCourseId);
				  openCourseDao.updateStudy(studentCourseId);
			}
			if (studentCourseId==null) {
				StudentCoursePo studentCoursePo = new StudentCoursePo();
				studentCoursePo.setOpenId(openId);
				studentCoursePo.setStudentId(studentId);
				studentCoursePo.setCreateDate(new Date());

				openCourseDao.addCourseStudent(studentCoursePo);
				Integer id = studentCoursePo.getId();
		        openCourseDao.addStudyStudent(id);
			}
			
		}
		catch(Exception e){
			e.printStackTrace();
          return CommonUtil.FLAG_FAILD;
      }
      return CommonUtil.FLAG_SUCESS;
	}

	@Override
	public PageBean findOpenCourseStudents(PageBean pageBean) {
		int totalPage = openCourseDao.findStudentCourseCount(pageBean);
		pageBean.setTotalPage(totalPage);
		List<StudentForm> studentForms = openCourseDao.findOpenCourseStudents(pageBean);
		pageBean.setList(studentForms);
		return pageBean;
	}

	
		
	

	@Override
	public BaseConditionVO init(BaseConditionVO baseConditionVO,Integer openId,String name,String number) {
		Integer count = openCourseDao.findStudentCourseCount1(openId, name, number);
		baseConditionVO.setTotalCount(count);
		baseConditionVO.setPageSize(5);
		return baseConditionVO;
	}
	@Override
	public List<OpenCourseVo> findByUserId(Integer courseTypeId,BaseConditionVO	baseConditionVO) {
		List<OpenCourseVo> openCourseVos = openCourseDao.findByUserId(courseTypeId,baseConditionVO);
		//查找总章节
		/*for(OpenCourseVo openCourseVo:openCourseVos){
		Integer chapterCount = openCourseDao.findCountByopenId(openCourseVo.getOpenId());
		openCourseVo.setAllChapterCount(chapterCount);
		}*/
		//查询某课程，某学生的已学章节
		for(OpenCourseVo openCourseVo:openCourseVos){
			Integer count = openCourseDao.findstudyChapterCount(openCourseVo.getStudentCourseId());
			openCourseVo.setStudyOverchapterCount(count);
			openCourseVo.setStudyStartDateStr(openCourseVo.getStudyStartDate().getTime());
			openCourseVo.setStudyEndDateStr(openCourseVo.getStudyEndDate().getTime());
			}
		return openCourseVos;
	}

	
	/** 
	* Title: find2ByUserId
	* Description: 
	* @see com.yz.center.service.iface.course.OpenCourseService#find2ByUserId(java.lang.Integer)  
	*/
	
	@Override
	public List<OpenCourseVo> find2ByUserId(Integer courseTypeId,BaseConditionVO baseConditionVO) {
		List<OpenCourseVo> openCourseVos = openCourseDao.find2ByUserId(courseTypeId,baseConditionVO);
		return openCourseVos;
	}

	
	/** 
	* Title: init3
	* Description: 查询学生已选课程分页初始化
	* @see com.yz.center.service.iface.course.OpenCourseService#init3(com.yz.center.model.vo.BaseConditionVO, java.lang.Integer)  
	*/
	
	@Override
	public BaseConditionVO init3(Integer courseTypeId,BaseConditionVO baseConditionVO, Integer userId,Integer schoolId) {
		baseConditionVO.setUserId(userId);
		baseConditionVO.setSchoolId(schoolId);
		Integer count = openCourseDao.findOpencourseCount(courseTypeId,baseConditionVO);
		baseConditionVO.setPageSize(5);
		baseConditionVO.setTotalCount(count);
		return baseConditionVO;
	}

	
	/** 
	* Title: init4
	* Description: 查询学生未选课程分页初始化
	* @see com.yz.center.service.iface.course.OpenCourseService#init4(com.yz.center.model.vo.BaseConditionVO, java.lang.Integer)  
	*/
	
	@Override
	public BaseConditionVO init4(Integer courseTypeId,BaseConditionVO baseConditionVO, Integer userId,Integer schoolId) {
		baseConditionVO.setUserId(userId);
		baseConditionVO.setSchoolId(schoolId);
		Integer count = openCourseDao.findOpencourseCount2(courseTypeId,baseConditionVO);
		baseConditionVO.setPageSize(5);
		baseConditionVO.setTotalCount(count);
		return baseConditionVO;
	}
	

	@Override
	public Integer delCourseStudent(Integer studentId,Integer openId) {
			try{
				Integer studentCourseId = openCourseDao.selectStudentCourseId(openId,studentId);
				Integer flag1 = openCourseDao.delCourseStudentById(studentId,openId);
				if (flag1==1) {
					openCourseDao.delstudyCourseById(studentCourseId);
				}else {
					return CommonUtil.FLAG_SUCESS;
				}
				
			}
			catch(Exception e){
				e.printStackTrace();
	           return CommonUtil.FLAG_FAILD;
	       }
	       return CommonUtil.FLAG_SUCESS;
		}
			
		
		
	/** 
	* Title: updateTimeAndcourseInfo
	* Description: 
	* @see com.yz.center.service.iface.course.OpenCourseService#updateTimeAndcourseInfo(java.util.List)  
	*/
	
	@Override
	public void updateTimeAndcourseInfo(List<OpenCourseVo> openCourseVos) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		for (int i = 0; i < openCourseVos.size(); i++) {
			//time
			if (openCourseVos.get(i).getCreateDate()!=null) {
				String createDate2 = format.format(openCourseVos.get(i).getCreateDate());
				openCourseVos.get(i).setCreateDate2(createDate2);
			}
			//courseInfo
			if (openCourseVos.get(i).getCourseInfo()!=null) {
				Integer size = openCourseVos.get(i).getCourseInfo().length();
				if (size>40) {
					String info2 = openCourseVos.get(i).getCourseInfo().substring(0, 40)+"...";
					openCourseVos.get(i).setCourseInfo(info2);
				}
			}
			
			
			
		}
	}

	@Override
	public List<OpenCourseVo> findIndexOpencourse(BaseConditionVO baseConditionVO,Integer schoolId) {   
	    baseConditionVO.setSchoolId(schoolId);
        Integer Count= openCourseDao.findcountOpencourse(baseConditionVO);
        baseConditionVO.setTotalCount(Count);
       
        List<OpenCourseVo> openCourseVos = openCourseDao.findIndexOpencourse(baseConditionVO);
        //统计选课人数
        for(OpenCourseVo openCourseVo:openCourseVos){
        	Integer count = openCourseDao.selectStudentCountByopenId(openCourseVo.getOpenId());
        	openCourseVo.setStudyPeopleCount(count);
        }
		return openCourseVos;
	}

	@Override
	public List<OpenCourseVo> getAllopenCourse(Integer schoolId) {
		List<OpenCourseVo> openCourseVos = openCourseDao.getAllopenCourse(schoolId);
		return openCourseVos;
	}
	

}
