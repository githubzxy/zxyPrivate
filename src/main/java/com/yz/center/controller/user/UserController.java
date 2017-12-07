/**
  * @FileName: UserConroller.java
  * @Author 
  * @Description:
  * @Date 2016��10��24�� ����3:46:41
  * @CopyRight yazhuokj Corporation
  */
package com.yz.center.controller.user;

import java.text.ParseException;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yz.center.model.po.user.UserPo;
import com.yz.center.model.vo.BaseUser;
import com.yz.center.model.vo.StudentForm;
import com.yz.center.service.iface.user.UserService;
import com.yz.center.util.Static;


@Controller
@RequestMapping("user")
public class UserController{
    
	@Resource
	private UserService userService;
	
	
	@RequestMapping("updateInfo.html")
	@ResponseBody
	public ModelMap updateInfo(StudentForm studentForm,HttpSession session){
		UserPo baseUser = (UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
		Integer userId = baseUser.getUserId();
		System.out.println("jinlaile");
		System.out.println(studentForm.getBirthday());
		studentForm.setUserId(userId);
		ModelMap model = new ModelMap();
		try {
			Integer flag = userService.updateInfo(studentForm,session);
		} catch (ParseException e) {
			e.printStackTrace();
			return model.addAttribute("flag", 0)
						.addAttribute("msg", "修改失败");
		}
		return model.addAttribute("flag", "1")
					.addAttribute("msg", "修改成功！");
		
	}

	
}
