package com.yz.center.service.iface.user;


import com.yz.center.model.po.user.FeedBackPo;
import com.yz.center.model.po.user.LoginPo;
import com.yz.center.model.po.user.UserPo;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年10月25日 下午5:15:11 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
public interface LoginService {

	
	/**   
	* @Title: getByLoginName
	* @Description: 根据登录名查询登录账户信息
	* @param loginName 登录名称
	* @return  登录账户信息
	* @author:
	*/
	LoginPo getByLoginName(String loginName);

	int addLog(UserPo loginUser, Integer state);







	String getToken(Integer userId);

	
	/**   
	* Title: feedBack 
	* Description: TODO  
	* @param feedBackPo
	* @return
	* @author Administrator 
	*/
	
	Integer feedBack(FeedBackPo feedBackPo);

}
