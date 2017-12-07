package com.yz.center.service.iface.student;




import java.util.Date;
import java.util.List;
import java.util.Map;

import com.yz.center.model.po.GradePo;
import com.yz.center.model.po.StudentPo;
import com.yz.center.model.po.UserPo;
import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.model.vo.BaseConditionVO;
import com.yz.center.model.vo.ClassForm;
import com.yz.center.model.vo.StudentCourseVo;
import com.yz.center.model.vo.StudentCourseVo2;
import com.yz.center.model.vo.StudentCourseVo3;
import com.yz.center.model.vo.StudentForm;
import com.yz.center.model.vo.StudentVo;
import com.yz.center.util.common.PageBean;


public interface StudentService {
public Integer addStudent(StudentForm studentAdd);
public Integer delete(Integer studentId);
public Map<String,Object> getStudentById(Integer studentId);
public Integer update(StudentForm studentForm,Date birthday);
public PageBean getStudentList(PageBean pageBean,StudentVo student);
public Integer deleteSelected(Integer studentIds[]);
public Integer resetUse(Integer studentId);
public Integer resetLogOut(Integer studentId);
public UserPo getuserBynumber(Integer schoolId, String number);
public Integer addStus(List<StudentForm> students);
public List<GradePo> getGradeList(Integer schoolId);
public List<ClassForm> getClassList(Integer gradeId,Integer schoolId);
public Integer getClassIdByGradeAndClassName(String gradeName,String className);
public List<Integer> findIdByNums(List<Integer> studentNums,Integer schoolId);

public PageBean getStudentByclassId(Integer classId,PageBean pageBean);
public Integer[] getAllStudentByclassId(Integer classId);

/**   
* Title: findStudentId 
* Description: TODO  
* @return
* @author Administrator 
*/

public Integer findStudentId(Integer userId);

/**   
* Title: findMycourse 
* Description: 查询该学生选择的所有的课程de信息  
* @param baseConditionVO
* @return
* @author Administrator 
 * @throws Exception 
*/

public List<StudentCourseVo> findMycourse(BaseConditionVO baseConditionVO);

/**   
* Title: findMyPasscourse 
* Description: 选出该学生通过的课程
* @param studentCourseVos
* @return
* @author Administrator 
*/

public List<StudentCourseVo> findMyPasscourse(List<StudentCourseVo> studentCourseVos);

public List<Integer> findExameScore(Integer openId);

/**   
* Title: findMyUnPasscourse 
* Description: 选出该学生wei通过的课程 
* @param studentCourseVos
* @return
* @author Administrator 
*/

public List<StudentCourseVo> findMyUnPasscourse(List<StudentCourseVo> studentCourseVos);

/**   
* Title: findMyinfo 
* Description: TODO  
* @param userId
* @author Administrator 
*/

public StudentForm findMyinfo(Integer userId);

/**   
* Title: studentOfCourseStatistics 
* Description: TODO  
* @param baseConditionVO
* @param studentCourseVo2
* @return
* @author Administrator 
*/

public List<StudentCourseVo2> studentOfCourseStatistics(BaseConditionVO baseConditionVO,
		StudentCourseVo2 studentCourseVo2);
/**   
* Title: findMycoursePro 
* Description: TODO  
* @param baseConditionVO
* @return
* @author Administrator 
*/

public List<StudentCourseVo> findMycoursePro(BaseConditionVO baseConditionVO);

/**   
* Title: getAllStudentBySchoolId 
* Description: TODO  
* @param schoolId
* @return
* @author Administrator 
*/

public Integer[] getAllStudentBySchoolId(Integer schoolId);

public int validate(StudentForm studentForm);//验证学号是否存在

}
