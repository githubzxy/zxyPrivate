/**
  * @FileName: NavControllerService.java
  * @Author 
  * @Description:
  * @Date 2017年2月6日 上午6:45:17
  * @CopyRight yazhuokj Corporation
  */
package com.yz.center.service.iface.role;

import java.util.List;

import com.yz.center.model.vo.role.RoleControllerVo;

public interface NavControllerService{
    public List<RoleControllerVo> findRoleCons(Integer code,String roleId,Integer schoolId);
}
