
/**    
* @Title: RoleServiceImpl.java
* @Package com.yz.center.service.impl.role
* @Description: TODO
* @author: 
* @date: 2017年2月23日 上午9:23:25 
* @version V1.0 
* @Copyright 亚卓教育
*   
*/  

package com.yz.center.service.impl.role;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yz.center.dao.role.RoleDao;
import com.yz.center.model.po.role.BaseControllerPo;
import com.yz.center.model.po.role.RolePo;
import com.yz.center.model.po.user.UserPo;
import com.yz.center.service.iface.role.RoleService;
import com.yz.center.util.CommonUtil;
import com.yz.center.util.common.PageBean;

/**  
* @Description: TODO
* @author: 
* @date: 2017年2月23日 上午9:23:25 
* @version V1.0   
*/
@Service("roleService")
public class RoleServiceImpl implements RoleService{

	@Resource
	private RoleDao roleDao;

	@Override
	public int addRole(RolePo rolePo) {
		UUID uid = UUID.randomUUID();
		rolePo.setRoleId(uid.toString());
		int flag = roleDao.insertRole(rolePo);
		return flag;
	}

	@Override
	public int updateRole(RolePo rolePo) {
		int flag = roleDao.updateRole(rolePo);
		return flag;
	}

	@Override
	public RolePo findRoleById(String roleId) {
		return roleDao.selectRoleById(roleId);
	}

	@Override
	public PageBean findRoles(PageBean pageBean) {
		int totalPage = roleDao.selectRoleCount();
		pageBean.setTotalPage(totalPage);
		List<RolePo> roles = roleDao.selectRoles(pageBean);
		pageBean.setList(roles);
		return pageBean;
	}

	@Override
	public List<RolePo> findAllRoles() {
		return roleDao.selectAllRoles();
	}
	
	@Override
	public int updateUserRoleId(String idStr, String roleId) {
		String[] idArr = idStr.split(",");
		try {
			for(int i = 0; i < idArr.length; i++){
				roleDao.updateUserRoleId(Integer.parseInt(idArr[i]), roleId);
			}
		} catch (Exception e) {
			return 0;
		}
		return 1;
	}

	@Override
	public List<BaseControllerPo> findBaseControllers(String roleId) {
		List<BaseControllerPo> cons = roleDao.selectListTree();
		for(BaseControllerPo con : cons){
			if(con.getChildren() != null){
				for(BaseControllerPo con1 : con.getChildren()){
					if(con1.getChildren() != null){
						for(BaseControllerPo con2 : con1.getChildren()){
							if(con2.getChildren() != null){
								for(BaseControllerPo con3 : con2.getChildren()){
									int flag = roleDao.selectHaveController(roleId, con3.getId());
									if(flag != 0){
										con3.setFlag(flag);
									}else{
										con3.setFlag(flag);
									}
								}
							}
							int flag = roleDao.selectHaveController(roleId, con2.getId());
							if(flag != 0){
								con2.setFlag(flag);
							}else{
								con2.setFlag(flag);
							}
						}
					}
					int flag = roleDao.selectHaveController(roleId, con1.getId());
					if(flag != 0){
						con1.setFlag(flag);
					}else{
						con1.setFlag(flag);
					}
				}
			}
			int flag = roleDao.selectHaveController(roleId, con.getId());
			if(flag != 0){
				con.setFlag(flag);
			}else{
				con.setFlag(flag);
			}
		}
		//判断权限是当前用户具有的权限
		return cons;
	}

	@Override
	public int updateRoleController(String roleId, Integer[] controllerId) {
		try {
			if (controllerId==null) {
				System.out.println("身份为："+roleId);
				roleDao.deleteRoleController2(roleId);
			}else {
				roleDao.deleteRoleController(roleId, controllerId);
				for(int i = 0; i < controllerId.length; i++){
					int flag = roleDao.selectHaveController(roleId, controllerId[i]);
					if(flag == 0){
						roleDao.addRoleController(roleId, controllerId[i]);
					}
				}
			}
			
		} catch (Exception e) {
			return CommonUtil.FLAG_FAILD;
		}
		return CommonUtil.FLAG_SUCESS;
	}

	@Override
	public UserPo findMyroles(String n) {
		UserPo userPo = roleDao.findMyroles(n);
		return userPo;
	}
	
	
}
