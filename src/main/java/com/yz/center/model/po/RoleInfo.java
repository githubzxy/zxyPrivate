package com.yz.center.model.po;

import java.io.Serializable;

import lombok.Data;
@Data
public class RoleInfo implements Serializable {
//@Fields serialVersionUID : 
    
    private static final long serialVersionUID = 1L;
	private Integer roleId;
	private String roleName;
	private String roleCode;

}
