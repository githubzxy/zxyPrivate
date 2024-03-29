
/**    
* @Title: MainIntercept.java
* @Package com.yz.center.interceptor
* @Description: TODO
* @author: 
* @date: 2016年12月29日 下午4:40:02 
* @version V1.0 
* @Copyright 亚卓教育
*   
*/  

package com.yz.center.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**  
* @Description: TODO
* @author: 
* @date: 2016年12月29日 下午4:40:02 
* @version V1.0   
*/

public class MainIntercept extends HandlerInterceptorAdapter {

	private List<String> mainExcludeUrls;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		super.preHandle(request, response, handler);
		String requestUrl = request.getRequestURI().replace(request.getContextPath(), "");
		if(mainExcludeUrls.contains(requestUrl)){
			return true;
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}

	public List<String> getMainExcludeUrls() {
		return mainExcludeUrls;
	}

	public void setMainExcludeUrls(List<String> mainExcludeUrls) {
		this.mainExcludeUrls = mainExcludeUrls;
	}
	
	
}
