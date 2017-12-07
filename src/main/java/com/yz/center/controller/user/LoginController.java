package com.yz.center.controller.user;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yz.center.model.po.user.FeedBackPo;
import com.yz.center.model.po.user.LoginPo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.model.vo.BaseUser;
import com.yz.center.service.iface.user.LoginService;
import com.yz.center.service.iface.user.UserService;
import com.yz.center.util.Static;
import com.yz.center.util.other.Yzm;





/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年10月25日 下午5:14:04 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
@Controller
@RequestMapping("/admin/login")
public class LoginController {
	
	@Resource
	private LoginService loginService;
	@Resource
	private UserService userService;
	
	
	/**   
	* @Title: initVerify
	* @Description: 获取验证码并缓存  
	* @param response 响应
	* @param session 缓存验证码
	* @return 验证码
	* @author:
	*/
	@RequestMapping(value = "/initVerify.html")
	@ResponseBody
	public ModelMap initVerify(HttpServletResponse response,HttpSession session){
		response.setContentType("text/html;charset=UTF-8");
		ModelMap modelMap = new ModelMap();
		String code = Yzm.initVerify();
		//缓存验证码
		session.setAttribute(Static.VERIFY_SESSION, code);
		return modelMap.addAttribute("code", code);
	}
	
	/**   
	 * 跳转后台登录页面
	* @Title: toLogin
	* @Description: 跳转后台登录页面
	* @return 后台登录页面路径
	* @author: 
	*/
	@RequestMapping(value = "/login.html", method = RequestMethod.GET)
	public String toLogin() {
		return "/admin/login/login";	
	}
	
	/**   
	* @Title: login
	* @Description: 后台登录
	* @param userName 登录用户名 即教师工号
	* @param passWord 密码
	* @param code 验证码
	* @param session 缓存
	* @param response  响应
	* @return ModelMap
	* @author: 
	*/
	@RequestMapping(value ="/login.html",method=RequestMethod.POST)	
	@ResponseBody
	public ModelMap login(String userName,String passWord,String code,
			HttpSession session,HttpServletResponse response) {

		ModelMap modelMap  = new ModelMap();
		//验证验证码信息
		if(code!=null&&!code.equals("")&&session.getAttribute(Static.VERIFY_SESSION).toString().toLowerCase().equals(code.toLowerCase())){
			
			//清除验证码缓存
			session.removeAttribute(Static.VERIFY_SESSION);
			
			LoginPo loginPo=loginService.getByLoginName(userName);
			//匹配登录用户信息
			 if(loginPo!=null && loginPo.getLoginPwd().equals(passWord)){
				 
		            UserPo loginUser = userService.getUserById(loginPo.getLoginId());
		            if(loginUser != null){
		            	if (loginUser.getRoleCode()=="testTeacher"||loginUser.getRoleCode()=="testStudent") {
			            	if(new Date().before(loginUser.getStopDate())){
			            		loginService.addLog(loginUser,1);
			            		session.setAttribute(Static.LOGIN_USER_SESSION, loginUser);
				            	String token =loginService.getToken(loginUser.getUserId());
				            	Cookie cookie = new Cookie("token", token);
				            	cookie.setPath("/");
				            	response.addCookie(cookie);
				            	
				            	modelMap.addAttribute("flag", "4");
				            	modelMap.addAttribute("msg","试用账号登录成功！");
				            	return modelMap;
			            	}else {
			            		modelMap.addAttribute("flag", "5");
				            	modelMap.addAttribute("msg","试用账号过期！");
				            	return modelMap;
							}
						}

		            	loginService.addLog(loginUser,1);
		            	String token =loginService.getToken(loginUser.getUserId());
		            	Cookie cookie = new Cookie("token", token);
		            	cookie.setPath("/");
		            	response.addCookie(cookie);
	            		session.setAttribute(Static.LOGIN_USER_SESSION, loginUser);
	            		session.removeAttribute(Static.VERIFY_SESSION);
		            	modelMap.addAttribute("flag", "1");
		            	modelMap.addAttribute("msg","登录成功！");
		            	return modelMap;
		            }
		            else{
		            	modelMap.addAttribute("flag", "0");
		            	modelMap.addAttribute("msg","登录失败,没有这样的用户！");
		            	return modelMap;
		            }	           	           	         	          
		        }else{
		        	modelMap.addAttribute("flag", "2");
		        	modelMap.addAttribute("msg", "登录名或密码有错！");  
	            	return modelMap;		
		        }
			
		}
		
		modelMap.addAttribute("flag", "3");
    	modelMap.addAttribute("msg", "验证码错误！");  
    	
		
		return modelMap;

	}
	/**
	 * 退出登录，添加退出登录日志
	 * @param session
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("/logout.html")
	public String logout(HttpSession session,ModelMap modelMap){
		UserPo loginUser = (UserPo) session.getAttribute(Static.LOGIN_USER_SESSION);
		if(loginUser!=null){
			loginService.addLog(loginUser,2);
			session.removeAttribute(Static.LOGIN_USER_SESSION);
			modelMap.addAttribute("flag",1);
			modelMap.addAttribute("msg", "登出成功！");
		}
		return "redirect:/main/index.html";
		
	}
	
	
	@RequestMapping("/indexLogin.html")
	@ResponseBody
	public ModelMap indexLogin(String userName,String passWord,HttpSession session,HttpServletResponse response){
		ModelMap modelMap = new ModelMap();
		LoginPo loginPo=loginService.getByLoginName(userName);
		if(loginPo!=null && loginPo.getLoginPwd().equals(passWord)){
			 
			UserPo loginUser = userService.getUserById(loginPo.getLoginId());
            System.out.println(loginUser);
            if(loginUser != null){
            	if (loginUser.getRoleCode()=="testTeacher"||loginUser.getRoleCode()=="testStudent") {
	            	if(new Date().before(loginUser.getStopDate())){
	            		loginService.addLog(loginUser,1);
	            		session.setAttribute(Static.LOGIN_USER_SESSION, loginUser);
		            	String token =loginService.getToken(loginUser.getUserId());
		            	Cookie cookie = new Cookie("token", token);
		            	cookie.setPath("/");
		            	response.addCookie(cookie);
		            	
		            	modelMap.addAttribute("flag", "4");
		            	modelMap.addAttribute("msg","试用账号登录成功！");
		            	return modelMap;
	            	}else {
	            		modelMap.addAttribute("flag", "5");
		            	modelMap.addAttribute("msg","试用账号过期！");
		            	return modelMap;
					}
				}

            	loginService.addLog(loginUser,1);
            	String token =loginService.getToken(loginUser.getUserId());
            	Cookie cookie = new Cookie("token", token);
            	cookie.setPath("/");
            	response.addCookie(cookie);
            	
        		session.setAttribute(Static.LOGIN_USER_SESSION, loginUser);
            	modelMap.addAttribute("flag", "1");
            	modelMap.addAttribute("msg","登录成功！");
            	return modelMap;
            	
            }
            else{
            	modelMap.addAttribute("flag", "0");
            	modelMap.addAttribute("msg","登录失败,没有这样的用户！");
            	return modelMap;
            }	           	           	         	          
        }else{
        	modelMap.addAttribute("flag", "2");
        	modelMap.addAttribute("msg", "登录名或密码有错！");  
        	return modelMap;		
        }
		
	}
	
	@RequestMapping("/toApply.html")
	public String toApply(){
		
		return "home/apply";

	}
	@RequestMapping("/apply.html")
	@ResponseBody
	public ModelMap apply(UserPo userPo) {
		ModelMap model = new ModelMap();
		//添加申请账号的用户
		Integer flag =userService.addApplyUser(userPo);
		return model.addAttribute("flag", flag);
	}
	
	@RequestMapping("/feedBack.html")
	@ResponseBody
	public ModelMap feedBack(FeedBackPo feedBackPo){
		Integer flag = loginService.feedBack(feedBackPo);
		ModelMap modelMap = new ModelMap();
		if (flag==1) {
			return modelMap.addAttribute("flag", flag)
							.addAttribute("msg", "添加成功！");
		}else{
			return modelMap.addAttribute("flag", flag)
						    .addAttribute("msg", "添加失败！");
		}
	}
}
