
/**    
* @Title: RoleService.java
* @Package com.yz.center.service.iface.role
* @Description: 角色业务层
* @author: lcy
* @date: 2017年2月23日 上午9:17:26 
* @version V1.0 
* @Copyright 亚卓教育
*   
*/  

package com.yz.center.service.iface.role;

import java.util.List;

import com.yz.center.model.po.role.BaseControllerPo;
import com.yz.center.model.po.role.RolePo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.util.common.PageBean;

/**  
* @Description: TODO
* @author: lcy
* @date: 2017年2月23日 上午9:17:26 
* @version V1.0   
*/

public interface RoleService {
	
	/**   添加角色
	* @Title: addRole
	* @Description: 添加角色
	* @param rolePo
	* @return
	* @author:
	*/
	public int addRole(RolePo rolePo);
	
	
	/**   修改角色 
	* @Title: updateRole
	* @Description: 修改角色 
	* @param rolePo
	* @return
	* @author:
	*/
	public int updateRole(RolePo rolePo);
	
	
	/**   根据角色ID获取角色信息
	* @Title: findRoleById
	* @Description:   根据角色ID获取角色信息
	* @param roleId 角色ID
	* @return
	* @author:
	*/
	public RolePo findRoleById(String roleId);
	
	
	/**   分页获取角色列表
	* @Title: findRoles
	* @Description: 分页获取角色列表 
	* @param pageBean 分页条件
	* @return
	* @author:
	*/
	public PageBean findRoles(PageBean pageBean);
	
	
	/**    查询所有角色信息 
	* @Title: findAllRoles
	* @Description: 查询所有角色信息 
	* @return
	* @author:
	*/
	public List<RolePo> findAllRoles();
	
	
	/**    更改用户的角色 
	* @Title: updateUserRoleId
	* @Description:    更改用户的角色 
	* @param idStr 用户ID组成的字符串
	* @param roleId 角色ID
	* @return
	* @author:
	*/
	public int updateUserRoleId(String idStr,String roleId);
	
	
	/**   
	* @Title: findBaseControllers
	* @Description: 查询所有权限树
	* @return
	* @author:
	*/
	public List<BaseControllerPo> findBaseControllers(String roleId);
	
	
	/**   
	* @Title: updateRoleController
	* @Description: 更新角色权限控制
	* @param roleId
	* @param controllerId
	* @return
	* @author:
	*/
	public int updateRoleController(String roleId, Integer[] controllerId);


	public UserPo findMyroles(String n);
}
