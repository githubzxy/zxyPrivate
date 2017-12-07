
/**    
* @Title: BaseControllerPo.java
* @Package com.yz.center.model.po.role
* @Description: TODO
* @author: 
* @date: 2017年3月27日 下午3:20:32 
* @version V1.0 
* @Copyright 亚卓教育
*   
*/  

package com.yz.center.model.po.role;

import java.util.List;

import lombok.Data;

/**  
* @Description: TODO
* @author: 
* @date: 2017年3月27日 下午3:20:32 
* @version V1.0   
*/
@Data
public class BaseControllerPo {
	private Integer id;
	private String roleId;
	private Integer isDefault;
	private Integer conTypeId;
	private String moduleName;
	private String conName;
	private String url;
	private String ico;
	private Integer level;
	private Integer parentId;
	private List<BaseControllerPo> children;
	private Integer flag;
}
