package com.yz.center.dao.user;

import org.apache.ibatis.annotations.Param;

import com.yz.center.model.po.log.LogPo;
import com.yz.center.model.po.user.FeedBackPo;
import com.yz.center.model.po.user.LoginPo;
import com.yz.center.model.vo.TokenPo;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年10月25日 下午5:17:31 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
public interface LoginDao {

	LoginPo getByLoginName(String loginName);

	int addLog(
			@Param(value="log")LogPo log,
			@Param(value="type")Integer type);

	String  getToken(Integer userId);



	void addToken(TokenPo tokenPo);

	
	/**   
	* Title: feedBack 
	* Description: TODO  
	* @param feedBackPo
	* @return
	* @author Administrator 
	*/
	
	Integer feedBack(FeedBackPo feedBackPo);

	

}