package com.yz.center.service.impl.login;

import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yz.center.dao.log.LogDao;
import com.yz.center.dao.user.LoginDao;
import com.yz.center.model.po.log.LogPo;
import com.yz.center.model.po.user.FeedBackPo;
import com.yz.center.model.po.user.LoginPo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.model.vo.BaseUser;
import com.yz.center.model.vo.TokenPo;
import com.yz.center.service.iface.user.LoginService;
import com.yz.center.util.CommonUtil;

/** 
 * @author  作者: Administrator
 * 
 * @date 创建时间：2016年10月25日 下午5:15:43 
 * @version 1.0 
 * @parameter  
 * @since 
 * @return  
 */
@Service("loginService")
public class LoginServiceImpl implements LoginService{
	
	@Resource
	private LoginDao loginDao;
	@Resource
	private LogDao logDao;
	
	
	@Override
	public LoginPo getByLoginName(String loginName) {
		LoginPo loginPo = loginDao.getByLoginName(loginName);
		return loginPo;
	}
	
	@Override
	public int addLog(UserPo loginUser,Integer type) {
		LogPo log = new LogPo();
    	//添加登录日志，退出日志
		log.setUserId(loginUser.getUserId());
		log.setTypeId(type);
		log.setCreateDate(new Date());
		log.setState(1);
		logDao.addLog(log);
		return CommonUtil.FLAG_SUCESS;
	}




	@Override
	public String getToken(Integer userId) {
		// 根据userId获取token，没有则新建，有则获取
		String token = loginDao.getToken(userId);
		if(token == null){
			TokenPo tokenPo = new TokenPo();
			token = UUID.randomUUID().toString();
			tokenPo.setToken(token);
			tokenPo.setUserId(userId);
			loginDao.addToken(tokenPo);
			return token;
		}
		
		return token;
	}

	
	/** 
	* Title: feedBack
	* Description: 
	* @see com.yz.center.service.iface.user.LoginService#feedBack(com.yz.center.model.po.user.FeedBackPo)  
	*/
	
	@Override
	public Integer feedBack(FeedBackPo feedBackPo) {
		Integer flag = loginDao.feedBack(feedBackPo);
		return flag;
	}



}
