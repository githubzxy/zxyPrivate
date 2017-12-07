package center;

import javax.annotation.Resource;

import org.junit.Test;


import com.yz.center.dao.student.StudentDao;
import com.yz.center.model.vo.StudentForm;
import center.BaseJunitCase;


public class StudentTest extends BaseJunitCase{
	@Resource
	StudentDao studentDao;
	@Test
	public void studentEditTest(){
		StudentForm studentForm=studentDao.selectStudentById(6);
	System.out.println(studentForm);
		
	}

}
