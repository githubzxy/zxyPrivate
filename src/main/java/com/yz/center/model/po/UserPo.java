package com.yz.center.model.po;

import java.util.Date;

import lombok.Data;
@Data
public class UserPo {
	    private Integer id;
	    private Integer schoolId;
	    private LoginPo login;
	    private String name;
	    private String number;
	    private Integer gender;
	    private Date birthday;
	    private String avatar;
	    private String phone;
	    private String mobile;
	    private String info;
	    private String idCard;
	    private String email;
	    private Date createDt;
	    private Date stopDt;
	    private Integer state;
	   private RolePo role;
		
	
	    
}
