
/**    
* @Title: StudentProController.java
* @Package com.yz.center.controller.student
* Description: TODO
* @author: 
* @date: 2017年1月11日 下午2:11:08 
* @version V1.0 
*   
*/  

package com.yz.center.controller.student;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yz.center.model.po.user.UserPo;
import com.yz.center.model.vo.BaseConditionVO;
import com.yz.center.model.vo.StudentCourseVo;
import com.yz.center.service.iface.student.StudentService;
import com.yz.center.util.Static;

/**  
* Description: TODO
* @author Administrator  
* @date: 2017年1月11日 下午2:11:08 
* @version V1.0   
*/
@RequestMapping("pro")
@Controller
public class StudentProController {
	@Resource
	private StudentService studentService;
	
	
	
	@RequestMapping("list")
	public String listMycoursePro(BaseConditionVO baseConditionVO,HttpSession session,ModelMap modelMap){
		UserPo baseUser = (UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
		baseConditionVO.setUserId(baseUser.getUserId());
		//查询该学生选择的所有的课程
		List<StudentCourseVo> studentCourseVos = studentService.findMycoursePro(baseConditionVO);
		System.out.println(studentCourseVos);
		System.out.println(baseConditionVO);
		modelMap.addAttribute("studentCourseVos", studentCourseVos)
				.addAttribute("page", baseConditionVO);
		return "study/stuProgress";
		
		
	}
}