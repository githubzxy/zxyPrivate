package com.yz.center.model.po;

import java.io.Serializable;

import lombok.Data;
@Data
public class StudentPo implements Serializable {
      /**
	 * @Description
	 * @author
	 * @Title
	 * @param
	 * @return
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
      private UserPo user;
      private Integer majorId;
      private LoginPo login;
      private String name;
      private String number;
      private RolePo role;
      private Integer classId;
	
	public Integer getMajorId() {
		return majorId;
	}
	public void setMajorId(Integer majorId) {
		this.majorId = majorId;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public UserPo getUser() {
		return user;
	}
	public void setUser(UserPo user) {
		this.user = user;
	}
	public LoginPo getLogin() {
		return login;
	}
	public void setLogin(LoginPo login) {
		this.login = login;
	}
	public RolePo getRole() {
		return role;
	}
	public void setRole(RolePo role) {
		this.role = role;
	}
	public Integer getClassId() {
		return classId;
	}
	public void setClassId(Integer classId) {
		this.classId = classId;
	}
	
      
      
}
