
/**    
* @Title: RoleDao.java
* @Package com.yz.center.dao.role
* @Description: TODO
* @author: 
* @date: 2017年2月22日 下午4:08:27 
* @version V1.0 
* @Copyright 亚卓教育
*   
*/  

package com.yz.center.dao.role;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yz.center.model.po.role.BaseControllerPo;
import com.yz.center.model.po.role.RolePo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.model.vo.role.UserVo;
import com.yz.center.util.common.PageBean;

/**  
* @Description: TODO
* @author: lcy
* @date: 2017年2月22日 下午4:08:27 
* @version V1.0   
*/

public interface RoleDao {
	
	/**   
	* @Title: insertRole
	* @Description: 添加角色  
	* @param rolePo
	* @return
	* @author:
	*/
	public int insertRole(RolePo rolePo);
	
	
	/**   
	* @Title: updateRole
	* @Description: 修改角色
	* @param rolePo
	* @return
	* @author:
	*/
	public int updateRole(RolePo rolePo);
	
	
	/**   根据角色ID查询角色信息 
	* @Title: selectRoleById
	* @Description: 根据角色ID查询角色信息 
	* @param roleId
	* @return
	* @author:
	*/
	public RolePo selectRoleById(String roleId);
	
	
	/**   分页查询角色列表
	* @Title: selectRoles
	* @Description:  分页查询角色列表
	* @param pageBean
	* @return
	* @author:
	*/
	public List<RolePo> selectRoles(PageBean pageBean);
	
	
	/**   查询角色信息总条数  
	* @Title: selectRoleCount
	* @Description: 查询角色信息总条数  
	* @return
	* @author:
	*/
	public int selectRoleCount();
	
	
	/**   查询所有的角色信息
	* @Title: selectAllRoles
	* @Description: 查询所有的角色信息 
	* @return
	* @author:
	*/
	public List<RolePo> selectAllRoles();
	
	
	/**    更改用户的角色 
	* @Title: updateUserRoleId
	* @Description: 更改用户的角色 
	* @param userId 用户ID
	* @param roleId 角色ID
	* @return
	* @author:
	*/
	public int updateUserRoleId(@Param(value="userId")Integer userId,@Param(value="roleId")String roleId);
	
	
	/**   
	* @Title: selectListTree
	* @Description: 获取所有权限树
	* @return
	* @author:
	*/
	public List<BaseControllerPo> selectListTree();
	
	
	
	/**   
	* @Title: selectHaveController
	* @Description: 查询当前用户是否有该控制权限
	* @param roleId  角色标识
	* @param controllerId  控制权限ID
	* @return
	* @author:
	*/
	public int selectHaveController(@Param(value="roleId")String roleId,@Param("controllerId")Integer controllerId);
	
	
	/**   
	* @Title: deleteRoleController
	* @Description: 删除角色控制权限
	* @param roleId
	* @param controllerId
	* @return
	* @author:
	*/
	public int deleteRoleController(@Param(value="roleId")String roleId,@Param("controllerId")Integer[] controllerId);
	/**   
	* @Title: updateRoleController
	* @Description: 修改角色控制权限 
	* @param roleId 角色标识
	* @param controllerId 控制权限ID
	* @return
	* @author:
	*/
	public int addRoleController(@Param(value="roleId")String roleId,@Param("controllerId")Integer controllerId);


	public UserPo findMyroles(String id);


	
	/**   
	* @Title: deleteRoleController2 
	* @Description: TODO  
	* @param roleId
	* @author : zxy 
	*/
	
	public int deleteRoleController2(@Param(value="roleId")String roleId);
}
