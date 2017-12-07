/**
  * @FileName: NavControllerServiceImpl.java
  * @Author 
  * @Description:
  * @Date 2017年2月6日 上午6:47:51
  * @CopyRight yazhuokj Corporation
  */
package com.yz.center.service.impl.role;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yz.center.dao.role.NavControllerDao;
import com.yz.center.model.vo.role.RoleControllerVo;
import com.yz.center.service.iface.role.NavControllerService;
@Service("navControllerService")
public class NavControllerServiceImpl implements NavControllerService{

    @Resource
    private NavControllerDao navControllerDao;
    
    @Override
    public List<RoleControllerVo> findRoleCons(Integer code, String roleId, Integer schoolId){
    	if(code == 0){
    		return navControllerDao.selectParentNav(code, roleId, schoolId);
    	}
        return navControllerDao.selectRoleCons(code, roleId, schoolId);
    }

}
