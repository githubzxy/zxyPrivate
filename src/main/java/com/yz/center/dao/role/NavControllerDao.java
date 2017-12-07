/**
  * @FileName: NavControllerDao.java
  * @Author 
  * @Description:
  * @Date 2017年2月6日 上午6:35:03
  * @CopyRight yazhuokj Corporation
  */
package com.yz.center.dao.role;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yz.center.model.vo.role.RoleControllerVo;

public interface NavControllerDao{
	
    public List<RoleControllerVo> selectRoleCons(
            @Param(value="id")Integer id,
            @Param(value="roleId")String roleId,
            @Param(value="schoolId")Integer schoolId);
    
    public List<RoleControllerVo> selectParentNav(
            @Param(value="id")Integer id,
            @Param(value="roleId")String roleId,
            @Param(value="schoolId")Integer schoolId);
}
