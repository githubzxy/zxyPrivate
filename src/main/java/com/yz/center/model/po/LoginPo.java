package com.yz.center.model.po;



public class LoginPo {
	   
    private Integer id;
    private Integer schoolId;
    private String loginName;
    private String loginPwd;
    private RolePo role;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getSchoolId() {
		return schoolId;
	}
	public void setSchoolId(Integer schoolId) {
		this.schoolId = schoolId;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getLoginPwd() {
		return loginPwd;
	}
	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}
	public RolePo getRole() {
		return role;
	}
	public void setRole(RolePo role) {
		this.role = role;
	}
	
    
    
}
