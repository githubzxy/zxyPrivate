package com.yz.center.interceptor;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.yz.center.model.po.school.SchoolPo;
import com.yz.center.service.iface.school.SchoolService;
import com.yz.center.util.Static;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年10月25日 下午4:59:42 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
public class LoginIntercept extends HandlerInterceptorAdapter {

	private List<String> excludeUrls;
	
	private List<String> sysUrls;
	
	@Resource
	private SchoolService schoolService;
	
	@SuppressWarnings("unused")
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
			String requestUrl = request.getRequestURI().replace(request.getContextPath(), "");
			response.setContentType("text/html;charset=UTF-8");
			if(sysUrls.contains(requestUrl)){
				return true;
			}
			String host = request.getServerName();
			SchoolPo school = schoolService.findSchoolByUrl(host);
			System.out.println("xuexiaolujing"+school.getUrl()+"             ");
			System.out.println(host);
			if(school == null){
				System.out.println("进入这里了");
				request.getRequestDispatcher("/base/404.html").forward(request, response);
				//return "admin/sys/404";
			}
			Date nowDate = new Date();
			//SimpleDateFormat format = new SimpleDateFormat();
			
			if(nowDate.getTime() > school.getFinishDate().getTime()){
				//map.put("msg", "贵校购买本平台时间已到期");
				//TODO 购买时间到期，删除数据
				request.getRequestDispatcher("/base/prompt.html").forward(request, response);
			}
			
			int days = (int)((school.getFinishDate().getTime()-nowDate.getTime())/(1000*60*60*24));
			System.out.println(days );
			if(days < 30){
				//map.put("msg", "贵校购买本平台时间将要到期");
				//return "admin/sys/prompt";
			}
			HttpSession session = request.getSession(true); 
			Object schollObj = session.getAttribute(Static.SCHOOL_SESSION); 
			if(schollObj == null || "".equals(schollObj.toString())){
				session.setAttribute(Static.SCHOOL_SESSION, school);
			}
			
	        //super.preHandle(request, response, handler);
	        System.out.println(excludeUrls.contains(requestUrl));
	        if(excludeUrls.contains(requestUrl)){
	        	return true;
	        }
	        // 从session 里面获取用户名的信息  
	        Object obj = session.getAttribute(Static.LOGIN_USER_SESSION); 
	        // 判断如果没有取到用户信息，就跳转到登陆页面，提示用户进行登陆  
	        if (obj == null || "".equals(obj.toString())){
	        	response.sendRedirect(request.getContextPath()+"/main/index.html");
	        }  
	        return true;
	}
	
	
	public List<String> getExcludeUrls() {
		return excludeUrls;
	}
	public void setExcludeUrls(List<String> excludeUrls) {
		this.excludeUrls = excludeUrls;
	}
	public List<String> getSysUrls() {
		return sysUrls;
	}
	public void setSysUrls(List<String> sysUrls) {
		this.sysUrls = sysUrls;
	}
}
